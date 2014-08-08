// PCI Express example source code
// (c) KNJN LLC 2009, 2010

// Tested with Xilinx Endpoint Block Plus v1.14
// Make sure you use this version of a subsequent version

module PCIe
(
	// PCI Express Fabric Interface
	pci_exp_txp,
	pci_exp_txn,
	pci_exp_rxp,
	pci_exp_rxn,

	// System (SYS) Interface
	sys_clk_p,
	sys_clk_n,
	sys_reset_n,

   // Text LCD
	LED,
	LCD_RS, LCD_E, LCD_DB,
	LCD_RW,
	gpio_output,
	gpio_input,
	LED3
);

output pci_exp_txp, pci_exp_txn;
input  pci_exp_rxp, pci_exp_rxn;

input  sys_clk_p;
input  sys_clk_n;
input  sys_reset_n;

output  gpio_output;
input gpio_input;

output LCD_RS, LCD_E;
output LCD_RW;
output [7:0] LCD_DB;
output [1:0] LED;
output LED3;

wire        sys_clk_c;
wire        sys_reset_n_c; 
wire        trn_clk_c;

wire        trn_tsof_n_c;
wire        trn_teof_n_c;
wire        trn_tsrc_rdy_n_c;
wire        trn_tdst_rdy_n_c;
wire        trn_tsrc_dsc_n_c;
wire [63:0] trn_td_c;
wire [7:0]  trn_trem_n_c;

wire        trn_rsof_n_c;
wire        trn_rsrc_rdy_n_c;
wire        trn_rdst_rdy_n_c;
wire [63:0] trn_rd_c;

wire [7:0]  cfg_bus_number_c;
wire [4:0]  cfg_device_number_c;
wire [2:0]  cfg_function_number_c;

IBUFDS refclk_ibuf (.O(sys_clk_c), .I(sys_clk_p), .IB(sys_clk_n));  // 100 MHz
//IBUF sys_reset_n_ibuf (.O(sys_reset_n_c), .I(sys_reset_n));
assign sys_reset_n_c = 1'b1;

wire clk = trn_clk_c;	// 62.5MHz
wire RXdataavl = ~trn_rsrc_rdy_n_c && ~trn_rdst_rdy_n_c;
reg RXstate;
reg [63:0] RXrd1, RXrd2;
always @(posedge clk)
case(RXstate)
	1'b0: if(RXdataavl && ~trn_rsof_n_c && trn_rd_c[61:56]==6'b0_00000 && trn_rd_c[41:32]==10'h001) begin RXstate<=1'b1; RXrd1<=trn_rd_c; end
	1'b1: if(RXdataavl) begin RXstate<=1'b0; RXrd2<=trn_rd_c; end
endcase

wire RXwrmem = RXrd1[62];	// 0 for a read, 1 for a write
wire [31:0] RXdatawr = SwapDWB(trn_rd_c[31:0]);
wire [31:0] RXaddrwr = trn_rd_c[63:32];
reg [31:0] RXaddrrd; always @(posedge clk) if(RXstate & RXdataavl) RXaddrrd <= trn_rd_c[63:32];
wire RXwrite = RXstate & RXdataavl & RXwrmem;

reg [31:0] cnt;
always @(posedge clk) cnt <= cnt+1;
wire cfg_interrupt_msienable_c;

reg [1:0] LEDs;
always @(posedge clk) if(RXwrite) LEDs <= RXdatawr[1:0];

assign LED = LEDs;
// GPIO is copy of LED0
//assign gpio_output = LEDs[0];  
assign gpio_output = gpio_input;

// blinking led close to USB
reg [31:0] cnt2;
always @(posedge clk) cnt2 <= cnt2 + 32'h1;

// blink faster if MSI enabled
//assign LED3 = (cfg_interrupt_msienable_c ? cnt2[22] : cnt2[24]);
assign LED3 = gpio_input;

assign trn_rdst_rdy_n_c = 1'b0;
assign trn_tsrc_dsc_n_c = 1'b1;
assign trn_trem_n_c = 8'h00;

wire TXdata = ~trn_tsrc_rdy_n_c && ~trn_tdst_rdy_n_c;
reg [1:0] TXstate;
always @(posedge clk)
case(TXstate)
	2'b00: if(RXstate && RXdataavl && ~RXwrmem) TXstate <= 2'b01;
	2'b01: TXstate <= 2'b10;
	2'b10: if(TXdata) TXstate <= 2'b11;
	2'b11: if(TXdata) TXstate <= 2'b00;
endcase

reg [31:0] rd_data_o;
wire [63:0] trn_td1 = {1'b0, 7'b10_01010, 1'b0, RXrd1[54:52], 4'b0, RXrd1[47:44], 2'b0, 10'h001, cfg_bus_number_c, cfg_device_number_c, cfg_function_number_c, 3'b0, 1'b0, 12'h004};
wire [63:0] trn_td2 = {RXrd1[31:16], RXrd1[15:8], 1'b0, RXrd2[38:32], SwapDWB(rd_data_o)};
assign trn_td_c = ~TXstate[0] ? trn_td1 : trn_td2;

assign trn_tsof_n_c = ~(TXstate==2'b10);
assign trn_teof_n_c = ~(TXstate==2'b11);
assign trn_tsrc_rdy_n_c = ~TXstate[1];

function [31:0] SwapDWB;
	input [31:0] DW;
	SwapDWB = {DW[7:0], DW[15:8], DW[23:16], DW[31:24]};
endfunction

// Interrupt on GPIO input
reg cfg_interrupt;
reg cfg_interrupt_rdy_n;
reg [2:0] gpio_input_filter;  always @(posedge clk) gpio_input_filter <= {gpio_input_filter[1:0], gpio_input};
wire interrupt_now = ~gpio_input_filter[2] & gpio_input_filter[1];
always @(posedge clk) cfg_interrupt <= cfg_interrupt ? cfg_interrupt_rdy_n : cfg_interrupt_msienable_c & interrupt_now;
wire cfg_interrupt_n_c = ~cfg_interrupt;


wire cfg_interrupt_assert_n_c = 1'b1;
wire [7:0] cfg_interrupt_di_c = 8'b0;
wire [63:0] cfg_dsn_n_c = {32'h00000001, {{8'h1},24'h000A35}};

// Text LCD
reg LCD_RS;  always @(posedge clk) if(RXwrite) LCD_RS <= RXaddrwr[2];
reg [7:0] LCD_DB;  always @(posedge clk) if(RXwrite) LCD_DB <= RXdatawr;

// to generate a long pulse for the LCD_E signal, we use a counter
reg [5:0] LCDcnt;  always @(posedge clk) if(RXwrite || |LCDcnt) LCDcnt<=LCDcnt+6'h1;
assign LCD_E = LCDcnt[5] ^ LCDcnt[4];
assign LCD_RW = 1'b0;	// always write to (and never read from) the LCD

// Memory
reg [31:0] mem [0:1023];
always @(posedge clk) if(RXwrite) mem[RXaddrwr[11:2]] <= RXdatawr;

reg [9:0] rdaddr;
always @(posedge clk) rdaddr <= RXaddrrd[11:2];

wire [31:0] rddata = mem[rdaddr];
always @(posedge clk) rd_data_o <= rddata;

// Xilinx PCIe core instantiation
endpoint_blk_plus_v1_14 ep(
      //
      // PCI Express Fabric Interface
      //
      .pci_exp_txp( pci_exp_txp ),             // O [7/3/0:0]
      .pci_exp_txn( pci_exp_txn ),             // O [7/3/0:0]
      .pci_exp_rxp( pci_exp_rxp ),             // O [7/3/0:0]
      .pci_exp_rxn( pci_exp_rxn ),             // O [7/3/0:0]

      //
      // System ( SYS ) Interface
      //
      .sys_clk( sys_clk_c ),                                 // I
       .sys_reset_n( sys_reset_n_c ),                         // I
//      .refclkout( refclkout ),       // O

      //
      // Transaction ( TRN ) Interface
      //
      .trn_clk( trn_clk_c ),                   // O
//      .trn_reset_n( trn_reset_n_c ),           // O
//      .trn_lnk_up_n( trn_lnk_up_n_c ),         // O

      // Tx Local-Link
      .trn_td( trn_td_c ),                     // I [63/31:0]
        .trn_trem_n( trn_trem_n_c ),             // I [7:0]
      .trn_tsof_n( trn_tsof_n_c ),             // I
      .trn_teof_n( trn_teof_n_c ),             // I
      .trn_tsrc_rdy_n( trn_tsrc_rdy_n_c ),     // I
      .trn_tsrc_dsc_n( trn_tsrc_dsc_n_c ),     // I
      .trn_tdst_rdy_n( trn_tdst_rdy_n_c ),     // O
//      .trn_tdst_dsc_n( trn_tdst_dsc_n_c ),     // O
      .trn_terrfwd_n( 1'b1 ),       // I
      .trn_tbuf_av( trn_tbuf_av_c ),           // O [4/3:0]

      // Rx Local-Link
      .trn_rd( trn_rd_c ),                     // O [63/31:0]
//        .trn_rrem_n( trn_rrem_n_c ),             // O [7:0]
      .trn_rsof_n( trn_rsof_n_c ),             // O
//      .trn_reof_n( trn_reof_n_c ),             // O
      .trn_rsrc_rdy_n( trn_rsrc_rdy_n_c ),     // O
//      .trn_rsrc_dsc_n( trn_rsrc_dsc_n_c ),     // O
      .trn_rdst_rdy_n( trn_rdst_rdy_n_c ),     // I
//      .trn_rerrfwd_n( trn_rerrfwd_n_c ),       // O
      .trn_rnp_ok_n( 1'b0 ),         // I
//      .trn_rbar_hit_n( trn_rbar_hit_n_c ),     // O [6:0]
//      .trn_rfc_nph_av( trn_rfc_nph_av_c ),     // O [11:0]
//      .trn_rfc_npd_av( trn_rfc_npd_av_c ),     // O [7:0]
//      .trn_rfc_ph_av( trn_rfc_ph_av_c ),       // O [11:0]
//      .trn_rfc_pd_av( trn_rfc_pd_av_c ),       // O [7:0]
      .trn_rcpl_streaming_n( 1'b1 ),       // I

      //
      // Host ( CFG ) Interface
      //
//      .cfg_do( cfg_do_c ),                                    // O [31:0]
//      .cfg_rd_wr_done_n( cfg_rd_wr_done_n_c ),                // O
      .cfg_di( 0 ),                                    // I [31:0]
      .cfg_byte_en_n( 4'hF ),                      // I [3:0]
      .cfg_dwaddr( 10'h0 ),                            // I [9:0]
      .cfg_wr_en_n( 1'b1 ),                          // I
      .cfg_rd_en_n( 1'b1 ),                          // I

      .cfg_err_cor_n( 1'b1 ),                      // I
      .cfg_err_ur_n( 1'b1 ),                        // I
//      .cfg_err_cpl_rdy_n( cfg_err_cpl_rdy_n_c ),              // O
      .cfg_err_ecrc_n( 1'b1 ),                    // I
      .cfg_err_cpl_timeout_n( 1'b1 ),      // I
      .cfg_err_cpl_abort_n( 1'b1 ),          // I
      .cfg_err_cpl_unexpect_n( 1'b1 ),    // I
      .cfg_err_posted_n( 1'b0 ),                // I
      .cfg_err_tlp_cpl_header( 48'h0 ),    // I [47:0]
      .cfg_err_locked_n( 1'b1 ),                // I
      .cfg_interrupt_n( cfg_interrupt_n_c ),                  // I
//      .cfg_interrupt_rdy_n( cfg_interrupt_rdy_n_c ),          // O

      .cfg_interrupt_assert_n(cfg_interrupt_assert_n_c),      // I
      .cfg_interrupt_di(cfg_interrupt_di_c),                  // I [7:0]
//      .cfg_interrupt_do(cfg_interrupt_do_c),                  // O [7:0]
//      .cfg_interrupt_mmenable(cfg_interrupt_mmenable_c),      // O [2:0]
      .cfg_interrupt_msienable(cfg_interrupt_msienable_c),    // O
//      .cfg_to_turnoff_n( cfg_to_turnoff_n_c ),                // O
      .cfg_pm_wake_n( 1'b1 ),                      // I
//      .cfg_pcie_link_state_n( cfg_pcie_link_state_n_c ),      // O [2:0]
      .cfg_trn_pending_n( 1'b1 ),              // I
      .cfg_bus_number( cfg_bus_number_c ),                    // O [7:0]
      .cfg_device_number( cfg_device_number_c ),              // O [4:0]
      .cfg_function_number( cfg_function_number_c ),          // O [2:0]
//      .cfg_status( cfg_status_c ),                            // O [15:0]
//      .cfg_command( cfg_command_c ),                          // O [15:0]
//      .cfg_dstatus( cfg_dstatus_c ),                          // O [15:0]
//      .cfg_dcommand( cfg_dcommand_c ),                        // O [15:0]
//      .cfg_lstatus( cfg_lstatus_c ),                          // O [15:0]
//      .cfg_lcommand( cfg_lcommand_c ),                        // O [15:0]
      .cfg_dsn( cfg_dsn_n_c)                                 // I [63:0]
);

endmodule

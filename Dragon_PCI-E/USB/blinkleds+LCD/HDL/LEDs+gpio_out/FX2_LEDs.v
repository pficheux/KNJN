// Sample code for FX2 USB-2 interface
// (c) fpga4fun.com KNJN LLC - 2006, 2007, 2008, 2009

////////////////////////////////////////////////////////////////////////////////
module FX2_LEDs(
	FX2_CLK, FX2_FD, FX2_SLRD, FX2_SLWR, FX2_flags,
	FX2_PA_2, FX2_PA_3, FX2_PA_4, FX2_PA_5, FX2_PA_6, FX2_PA_7,
	LED, gpio_out
);

input FX2_CLK;
inout [7:0] FX2_FD;
input [2:0] FX2_flags;
output FX2_SLRD, FX2_SLWR;
output gpio_out;

//output FX2_PA_0;
//output FX2_PA_1;
output FX2_PA_2;
output FX2_PA_3;
output FX2_PA_4;
output FX2_PA_5;
output FX2_PA_6;
input FX2_PA_7;

output [1:0] LED;

////////////////////////////////////////////////////////////////////////////////
// Rename "FX2" ports into "FIFO" ports, to give them more meaningful names
// FX2 USB signals are active low, take care of them now
// Note: You probably don't need to change anything in this section

// FX2 outputs
wire FIFO_CLK = FX2_CLK;

wire FIFO2_empty = ~FX2_flags[0];	wire FIFO2_data_available = ~FIFO2_empty;
wire FIFO3_empty = ~FX2_flags[1];	wire FIFO3_data_available = ~FIFO3_empty;
wire FIFO4_full = ~FX2_flags[2];	wire FIFO4_ready_to_accept_data = ~FIFO4_full;
wire FIFO5_full = ~FX2_PA_7;		wire FIFO5_ready_to_accept_data = ~FIFO5_full;
//assign FX2_PA_0 = 1'b1;
//assign FX2_PA_1 = 1'b1;
assign FX2_PA_3 = 1'b1;

// FX2 inputs
wire FIFO_RD, FIFO_WR, FIFO_PKTEND, FIFO_DATAIN_OE, FIFO_DATAOUT_OE;
wire FX2_SLRD = ~FIFO_RD;
wire FX2_SLWR = ~FIFO_WR;
assign FX2_PA_2 = ~FIFO_DATAIN_OE;
assign FX2_PA_6 = ~FIFO_PKTEND;

wire [1:0] FIFO_FIFOADR;
assign {FX2_PA_5, FX2_PA_4} = FIFO_FIFOADR;

// FX2 bidirectional data bus
wire [7:0] FIFO_DATAIN = FX2_FD;
wire [7:0] FIFO_DATAOUT;
assign FX2_FD = FIFO_DATAOUT_OE ? FIFO_DATAOUT : 8'hZZ;

////////////////////////////////////////////////////////////////////////////////
// So now everything is in positive logic
//	FIFO_RD, FIFO_WR, FIFO_DATAIN, FIFO_DATAOUT, FIFO_DATAIN_OE, FIFO_DATAOUT_OE, FIFO_PKTEND, FIFO_FIFOADR
//	FIFO2_empty, FIFO2_data_available
//	FIFO3_empty, FIFO3_data_available
//	FIFO4_full, FIFO4_ready_to_accept_data
//	FIFO5_full, FIFO5_ready_to_accept_data

// Let's read from FIFO2, and update the LEDs with that

assign FIFO_FIFOADR = 2'b00;		// select FIFO2
assign FIFO_RD = 1'b1;			// always read
assign FIFO_WR = 1'b0;			// never write
assign FIFO_DATAOUT = 8'h00;	// never write, so this value is not used
assign FIFO_DATAIN_OE = 1'b1;			// always read data
assign FIFO_DATAOUT_OE = 1'b0;			// never output data
assign FIFO_PKTEND = 1'b0;

reg [1:0] LED;
always @(posedge FIFO_CLK) if(FIFO2_data_available) LED <= FIFO_DATAIN[1:0];

reg [31:0] cnt;
always @(posedge FIFO_CLK) cnt <= cnt+1;
assign gpio_out = cnt[20+LED[1:0]];

endmodule

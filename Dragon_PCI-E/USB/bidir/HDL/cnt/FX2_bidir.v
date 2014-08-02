// Sample code for FX2 USB-2 interface
// (c) fpga4fun.com KNJN LLC - 2006, 2007

// This example shows how to send and receive data from USB-2

module FX2_bidir(
	FX2_CLK, FX2_FD, FX2_SLRD, FX2_SLWR, FX2_flags, 
	FX2_PA_2, FX2_PA_3, FX2_PA_4, FX2_PA_5, FX2_PA_6, FX2_PA_7
);

input FX2_CLK;
inout [7:0] FX2_FD;
input [2:0] FX2_flags;
output FX2_SLRD, FX2_SLWR;

//output FX2_PA_0;
//output FX2_PA_1;
output FX2_PA_2;
output FX2_PA_3;
output FX2_PA_4;
output FX2_PA_5;
output FX2_PA_6;
input FX2_PA_7;

   
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

////////////////////////////////////////////////////////////////////////////////
// Here we wait until we receive some data
// We count the number of bytes received and we send that count back

reg [2:0] state;
always @(posedge FIFO_CLK)
case(state)
	3'b000: if( FIFO2_data_available) state <= 3'b001;  // wait for data packet in FIFO2
	3'b001: if(~FIFO2_data_available) state <= 3'b100;  // wait until end of data packet
	3'b100: state <= 3'b101;  // turnaround cycle, switch to FIFO4
	3'b101: state <= 3'b110;  // write data
	3'b110: state <= 3'b000;  // end packet
	default: state <= 3'b000;
endcase

assign FIFO_FIFOADR = {state[2], 1'b0};  // FIFO2 or FIFO4
assign FIFO_RD = (state==3'b001);

// count the number of bytes received
reg [7:0] cnt;
wire read_byte = (state==3'b001) & FIFO2_data_available;
always @(posedge FIFO_CLK) if(read_byte) cnt <= cnt+8'h1;

// now write the count back
assign FIFO_DATAOUT = cnt;
assign FIFO_WR = (state==3'b101);
assign FIFO_PKTEND = (state==3'b110);
assign FIFO_DATAIN_OE = ~state[2];
assign FIFO_DATAOUT_OE = (state==3'b101);

endmodule

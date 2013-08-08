// Ethernet 10BASE-T demo code
// (c) fpga4fun.com KNJN LLC - 2004, 2005, 2006

// This design provides an example of UDP/IP transmission and reception.
// * Reception: every time a UDP packet is received, the FPGA checks the packet validity and
//   updates some LEDs (the first bits of the UDP payload are used).
// * Transmission: a packet is sent at regular interval (about every 2 seconds)
//   We send what was received earlier, plus a received packet count.

// This designs uses 2 clocks
// CLK40: 40MHz
// CLK_USB: 24MHz

module TENBASET(CLK40, Ethernet_TDp, Ethernet_TDm, Ethernet_RDp, CLK_USB);
input CLK40;
output Ethernet_TDp, Ethernet_TDm;
input Ethernet_RDp;
input CLK_USB;

//////////////////////////////////////////////////////////////////////
// Tx section

// Put here the number of bytes transmitted in the UDP payload
// 18 minimum (smaller UDP payloads are possible but would need to be padded)
// 1472 maximum (1500 bytes = max Ethernet payload - 28 bytes = IP/UDP headers length)
parameter Tx_UDPpayloadlength = 18;

// "Physical Address" - put the address of the PC you want to send to
parameter PA_1 = 8'hbc;
parameter PA_2 = 8'hae;
parameter PA_3 = 8'hc5;
parameter PA_4 = 8'ha0;
parameter PA_5 = 8'hf8;
parameter PA_6 = 8'h96;

// "myPA" - physical address of the FPGA
// It should be unique on your network
// A random number should be fine, since the odds of choosing something already existing are really small
parameter myPA_1 = 8'h16;	// not broadcast
parameter myPA_2 = 8'hFD;
parameter myPA_3 = 8'h22;
parameter myPA_4 = 8'h04;
parameter myPA_5 = 8'hB1;
parameter myPA_6 = 8'h61;

wire clkRx = CLK_USB;  // should be 24MHz
wire clkTx;  // should be 20MHz

  // get a 20MHz clock by dividing a 40MHz clock by 2
reg clk20; always @(posedge CLK40) clk20 <= ~clk20;
BUFG BUFG_clkTx(.O(clkTx), .I(clk20));

//////////////////////////////////////////////////////////////////////
// A few declarations used later
reg [13:0] RxBitCount;  // 14 bits are enough for a complete Ethernet frame (1500 bytes = 12000 bits)
wire [13:0] RxBitCount_MinUPDlen = (42+18+4)*8;  // smallest UDP packet has 42 bytes (header) + 18 bytes (payload) + 4 bytes (CRC)
reg [7:0] RxDataByteIn;
reg RxGoodPacket;
reg RxPacketReceivedOK;
reg [31:0] RxPacketCount;  always @(posedge clkRx) if(RxPacketReceivedOK) RxPacketCount <= RxPacketCount + 1;
reg [10:0] TxAddress;
wire [7:0] TxData;
reg [7:0] TxDataReg = 8'hcc;
   
//////////////////////////////////////////////////////////////////////
// Tx section

// Send a UDP packet roughly every second
reg [23:0] counter; always @(posedge clkTx) counter<=counter+24'h1;
reg StartSending; always @(posedge clkTx) StartSending<=&counter;

reg [7:0] pkt_data;
always @(posedge clkTx) 

case(TxAddress)
// Ethernet preamble
  11'h7F8: pkt_data <= 8'h55;
  11'h7F9: pkt_data <= 8'h55;
  11'h7FA: pkt_data <= 8'h55;
  11'h7FB: pkt_data <= 8'h55;
  11'h7FC: pkt_data <= 8'h55;
  11'h7FD: pkt_data <= 8'h55;
  11'h7FE: pkt_data <= 8'h55;
  11'h7FF: pkt_data <= 8'hD5;
// Ethernet header
  11'h000: pkt_data <= PA_1;
  11'h001: pkt_data <= PA_2;
  11'h002: pkt_data <= PA_3;
  11'h003: pkt_data <= PA_4;
  11'h004: pkt_data <= PA_5;
  11'h005: pkt_data <= PA_6;
  11'h006: pkt_data <= myPA_1;
  11'h007: pkt_data <= myPA_2;
  11'h008: pkt_data <= myPA_3;
  11'h009: pkt_data <= myPA_4;
  11'h00A: pkt_data <= myPA_5;
  11'h00B: pkt_data <= myPA_6;
// Ethernet type
  11'h00C: pkt_data <= 8'h08;  // IP
  11'h00D: pkt_data <= 8'h00;

//  end on packet
  11'h029+Tx_UDPpayloadlength: pkt_data <= 8'h42;


// remainder of payload comes from the blockram
  default: pkt_data <= TxDataReg; // from blockram
endcase // case (TxAddress)

// The 10BASE-T's magic
wire [10:0] TxAddress_StartPayload = 11'h02A;
wire [10:0] TxAddress_EndPayload = TxAddress_StartPayload + Tx_UDPpayloadlength;
wire [10:0] TxAddress_EndPacket = TxAddress_EndPayload + 11'h004;  // 4 bytes for CRC

reg [3:0] ShiftCount;
reg SendingPacket;
always @(posedge clkTx) if(StartSending) SendingPacket<=1'h1; else if(ShiftCount==4'd14 && TxAddress==TxAddress_EndPacket) SendingPacket<=1'b0;
always @(posedge clkTx) ShiftCount <= (SendingPacket ? ShiftCount+4'd1 : 4'd15);
// increment data each time we send a packet
always @(posedge clkTx) if (StartSending) TxDataReg <= TxDataReg + 1;

wire readram = (ShiftCount==15);
always @(posedge clkTx) if(ShiftCount==15) TxAddress <= (SendingPacket ? TxAddress+11'h01 : 11'h7F8);
reg [7:0] ShiftData; always @(posedge clkTx) if(ShiftCount[0]) ShiftData <= (readram ? pkt_data : {1'b0, ShiftData[7:1]});

// CRC32
reg [31:0] CRC;
reg CRCflush; always @(posedge clkTx) if(CRCflush) CRCflush <= SendingPacket; else if(readram) CRCflush <= (TxAddress==TxAddress_EndPayload);
reg CRCinit; always @(posedge clkTx) if(readram) CRCinit <= (TxAddress==11'h7FF);
wire CRCinput = (CRCflush ? 0 : (ShiftData[0] ^ CRC[31]));
always @(posedge clkTx) if(ShiftCount[0]) CRC <= (CRCinit ? ~0 : ({CRC[30:0],1'b0} ^ ({32{CRCinput}} & 32'h04C11DB7)));

// NLP
reg [16:0] LinkPulseCount; always @(posedge clkTx) LinkPulseCount <= (SendingPacket ? 17'h0 : LinkPulseCount+17'h1);
reg LinkPulse; always @(posedge clkTx) LinkPulse <= &LinkPulseCount[16:1];

// TP_IDL, shift-register and manchester encoder
reg SendingPacketData; always @(posedge clkTx) SendingPacketData <= SendingPacket;
reg [2:0] idlecount; always @(posedge clkTx) if(SendingPacketData) idlecount<=3'h0; else if(~&idlecount) idlecount<=idlecount+3'h1;
wire dataout = (CRCflush ? ~CRC[31] : ShiftData[0]);
reg qo; always @(posedge clkTx) qo <= (SendingPacketData ? ~dataout^ShiftCount[0] : 1'h1);
reg qoe; always @(posedge clkTx) qoe <= SendingPacketData | LinkPulse | (idlecount<6);
reg Ethernet_TDp; always @(posedge clkTx) Ethernet_TDp <= (qoe ?  qo : 1'b0);
reg Ethernet_TDm; always @(posedge clkTx) Ethernet_TDm <= (qoe ? ~qo : 1'b0);


endmodule

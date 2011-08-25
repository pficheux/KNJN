// Sample USB control code
// (c) fpga4fun.com KNJN LLC - 2004, 2005

// Access 8 input pins and control 8 output pins on Dragon.

module USB_IO8
(
	CLK_USB, USB_FWRn, USB_FRDn, USB_D, 
	dataout, datain, LED
);

input CLK_USB, USB_FRDn, USB_FWRn;
inout [7:0] USB_D;

output [7:0] dataout;
input [7:0] datain;
output [2:0] LED;

/////////////////////////////
// When we receive data, we store it so that we can use it later
reg [7:0] USBdata;
always @(posedge CLK_USB) if(~USB_FWRn) USBdata <= USB_D;

// Here, lets just output it right away to some pins
assign dataout = USBdata;

// When USB requests a read, lets send the value of the datain pins
// When no read happens, we tri-state the USB_D bus
assign USB_D = ~USB_FRDn ? datain : 8'hZZ;
assign LED[0] = USBdata[0];
assign LED[1] = USBdata[1];
assign LED[2] = USBdata[2];

endmodule

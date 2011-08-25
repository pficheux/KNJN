`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:11:11 03/25/2011 
// Design Name: 
// Module Name:    myled 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module myled( clk, LED);

input clk;
output LED;

reg [22:0] cnt;
always @(posedge clk) cnt<=cnt+1;

assign LED = cnt[20] & ~cnt[22];
//assign LED2 = cnt[21] & ~cnt[23];

endmodule

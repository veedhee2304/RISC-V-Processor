`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2025 07:13:10 PM
// Design Name: 
// Module Name: Program_Counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Program_Counter(clk, reset, PC_in,PC_out);

input clk,reset;
input [31:0] PC_in;
output reg [31:0] PC_out = 32'h00000000;

always@(posedge clk)
begin
    if(reset)
        PC_out<=32'h00000000;
    else
        PC_out<=PC_in;
end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2025 08:33:27 PM
// Design Name: 
// Module Name: ALUControl
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


module ALUControl(ALUOp_in, func7, func3, ALUControl_out);
input [1:0] ALUOp_in;
input [31:25] func7;
input [14:12] func3;

output reg [3:0]ALUControl_out;

always @(*) begin
case ({ALUOp_in, func7, func3})
12'b00_xxxxxxx_xxx: ALUControl_out=4'b0010;
12'b01_xxxxxxx_xxx: ALUControl_out=4'b0110;
12'b10_0000000_000: ALUControl_out=4'b0010;
12'b10_0100000_000: ALUControl_out=4'b0110;
12'b10_0000000_111: ALUControl_out=4'b0000;
12'b10_0000000_110: ALUControl_out=4'b0001;
default: ALUControl_out = 4'b0000; 
endcase
end
endmodule

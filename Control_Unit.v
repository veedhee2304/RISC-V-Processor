`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: Control_Unit
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

module Control_Unit(OPcode, branch, MemRead, MemtoReg, MemWrite, ALUScr, RegWrite, ALUOp_out);
input [6:0] OPcode;
output reg branch, MemRead, MemtoReg, MemWrite, ALUScr, RegWrite;
output reg [1:0] ALUOp_out;

always @(*) begin
    case(OPcode)
        7'b0110011:  // R-type instructions
        begin
            branch = 0; 
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUScr = 0;
            RegWrite = 1;
            ALUOp_out = 2'b10;
        end
        default:     // Added default case for safety
        begin
            branch = 0; 
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUScr = 0;
            RegWrite = 0;
            ALUOp_out = 2'b00;
        end
    endcase
end

endmodule

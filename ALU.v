`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2025 07:38:57 PM
// Design Name: 
// Module Name: ALU
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

module ALU(A, B, zero, ALUControl_in, ALU_result);
input [31:0] A, B;
input [3:0] ALUControl_in;

output reg [31:0] ALU_result;
output reg zero;

always @(*)
begin
    case(ALUControl_in)
        4'b0000: ALU_result = A & B;       // AND
        4'b0001: ALU_result = A | B;       // OR
        4'b0010: ALU_result = A + B;       // ADD
        4'b0011: ALU_result = A - B;       // SUB
        default: ALU_result = A;           // Default case
    endcase

    // Set zero flag correctly
    zero = (ALU_result == 32'h0) ? 1 : 0;
end

endmodule

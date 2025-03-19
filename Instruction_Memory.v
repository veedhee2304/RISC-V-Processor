`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2025
// Design Name: Instruction Memory
// Module Name: Instruction_Memory
// Description: RISC-V Instruction Memory Module with word-aligned access
// 
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module Instruction_Memory(
    input reset,                   // Reset signal
    input [31:0] read_address,     // 32-bit address input
    output [31:0] instruction_out  // 32-bit instruction output
);

reg [31:0] Memory[63:0];           // 64 instructions, each 32 bits wide
integer k;

// Word-aligned memory access
assign instruction_out = Memory[read_address >> 2]; 

// Initialize memory to zeros at startup
initial
begin
    for (k = 0; k < 64; k = k + 1)
    begin
        Memory[k] = 32'h00000000;
    end
end

// Optional: Reset logic (if you want a runtime reset feature)
always @(posedge reset)
begin
    for (k = 0; k < 64; k = k + 1)
    begin
        Memory[k] <= 32'h00000000;
    end
end

endmodule

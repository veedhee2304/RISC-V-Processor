`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2025 07:02:09 PM
// Design Name: 
// Module Name: RISCV_TOP
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


module RISCV_TOP(
input clk, 
input reset
);

wire[31:0] instructionTop, instruction_outTop, read_data1Top, read_data2Top, ALUresultTop;
wire [3:0] ALUControlTop;
wire RegWriteTop, MemWriteTop, MemReadTop;
wire [1:0] ALUOpTop;

Program_Counter Program_Counter
(.clk(clk),
.reset(reset),
.PC_in(),
.PC_out(instructionTop)
);

Instruction_Memory Instruction_Memory
(
.reset(reset),
.read_address(instructionTop),
.instruction_out(instruction_outTop)
);

Register_File Register_File
(
.clk(clk),
.reset(reset),
.Rs1(instruction_outTop),
.Rs2(instruction_outTop),
.Rd(instruction_outTop),
.Write_data(ALUresultTop),
.RegWrite(RegWriteTop),
.Read_data1(read_data1Top),
.Read_data2(read_data2Top)
);

ALU ALU
(.A(read_data1Top), 
.B(read_data2Top), 
.zero(), 
.ALUControl_in(ALUControlTop), 
.ALU_result(ALUresultTop)
);

Data_Memory Data_Memory
(
.clk(clk),
.reset(reset), 
.MemWrite(MemWriteTop), 
.MemRead(MemReadTop), 
.Address(ALUresultTop), 
.write_data(), 
.Read_Data()
);

ALUControl ALUControl
(
.ALUOp_in(ALUOpTop), 
.func7(instruction_outTop), 
.func3(instruction_outTop), 
.ALUControl_out(ALUControlTop)
);

Control_Unit Control_Unit
(.OPcode(), 
.branch(), 
.MemRead(MemReadTop), 
.MemtoReg(), 
.MemWrite(MemWriteTop), 
.ALUScr(), 
.RegWrite(RegWriteTop), 
.ALUOp_out(ALUOpTop)
);

endmodule

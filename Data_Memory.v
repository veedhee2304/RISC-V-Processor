`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2025 08:15:56 PM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(clk, reset, MemWrite, MemRead, Address, write_data, Read_Data);
input clk, reset, MemWrite, MemRead;
input [31: 0] Address, write_data;
output [31:0] Read_Data;

reg [31:0] Dmemory[63:0];
integer k;
assign Read_Data=(MemRead)? Dmemory[Address]: 32'h0;

always @(posedge clk)
begin
    if(reset==1'b1)
    begin
        for(k=0; k<64; k=k+1)
            begin
            Dmemory[k]=32'h0;
            end
    end
    else 
        if(MemWrite) Dmemory[Address]= write_data;      
end                 
endmodule

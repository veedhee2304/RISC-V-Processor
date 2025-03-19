`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2025 07:18:17 PM
// Design Name: 
// Module Name: Register_File
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: RISC-V Register File with synchronous reset and RegWrite control.
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Register_File(
    input clk,                  // Clock signal
    input reset,                // Reset signal
    input RegWrite,             // Write enable
    input [4:0] Rs1,            // Source register 1 (5 bits)
    input [4:0] Rs2,            // Source register 2 (5 bits)
    input [4:0] Rd,             // Destination register (5 bits)
    input [31:0] Write_data,    // Data to write into the destination register
    output [31:0] Read_data1,   // Output from Rs1
    output [31:0] Read_data2    // Output from Rs2
);

reg [31:0] Registers[31:0];     // 32 registers, each 32 bits wide
integer k;

// Assigning the read values
assign Read_data1 = Registers[Rs1];
assign Read_data2 = Registers[Rs2];

// Synchronous reset and register write logic
always @(posedge clk)
begin
    if (reset) 
    begin
        // Initialize all registers to zero
        for (k = 0; k < 32; k = k + 1) 
        begin
            Registers[k] <= 32'h0;
        end
    end
    else if (RegWrite && Rd != 5'b00000)   // Prevent x0 from being modified
    begin
        Registers[Rd] <= Write_data;
    end
end

endmodule

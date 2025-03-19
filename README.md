# 🚀 RISC-V Processor in Verilog

## 📚 **Project Overview**
This project implements a **5-stage RISC-V processor** in Verilog, designed with modular components for instruction execution, memory management, and data processing. The processor supports **R-type, I-type, S-type, and B-type instructions**, along with basic ALU operations and memory access.

---

## ⚙️ **Architecture**

The RISC-V processor consists of the following modules:
- **Program Counter (PC)**: Handles instruction addressing with increment and reset functionality.
- **Instruction Memory**: 64-word memory storing 32-bit instructions.
- **Register File**: Contains 32 registers, each 32 bits wide, for storing intermediate values.
- **ALU (Arithmetic Logic Unit)**: Performs bitwise AND, OR, addition, subtraction, and comparison operations.
- **ALU Control**: Decodes the function codes (`func3`, `func7`) and generates ALU control signals.
- **Data Memory**: 64-word memory for load and store operations.
- **Control Unit**: Generates control signals for memory access, register operations, and ALU selection.

---

## 🛠️ **Features**
- **5-stage pipelined architecture:** Instruction Fetch (IF), Decode (ID), Execute (EX), Memory (MEM), and Write Back (WB).
- **32-bit data path** with support for RISC-V base integer instruction set (RV32I).
- **Data memory and instruction memory** with 64 words of 32-bit width.
- **Modular Verilog design** with reusable and scalable components.
- **Synchronous memory read/write operations** with word-aligned addressing.

---

## 💾 **File Structure**
```
/src  
 ├── ALU.v                  # Arithmetic Logic Unit  
 ├── ALUControl.v           # ALU Control Logic  
 ├── Control_Unit.v         # Main Control Unit  
 ├── Data_Memory.v          # 64-word Data Memory  
 ├── Instruction_Memory.v   # 64-word Instruction Memory  
 ├── Program_Counter.v      # Program Counter  
 ├── Register_File.v        # 32-register file (32-bit each)  
 ├── RISCV_TOP.v            # Top-level RISC-V processor integration  
 └── README.md              # Project documentation  
```

---

## 🚦 **Usage Instructions**
1. **Clone the repository**
```bash
git clone <repository_url>
cd riscv-processor
```

2. **Simulation and Testing**
- Open the project in **Xilinx Vivado/ModelSim/Quartus**.  
- Run the simulation and verify the instruction execution.  
- Modify testbenches to validate different instruction sets.  

---

## 📈 **Future Improvements**
- Add support for **floating-point operations**.  
- Implement **hazard detection and forwarding units** for pipelining.  
- Expand instruction set support (RV64I, RV32M extensions).  

---

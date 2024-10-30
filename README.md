# Shambhaditya Tarafdar st496  & Ankit Raj ar791

# Simple Processor - Project Checkpoint 4

## Overview

Checkpoint 4 requirement for building a simple, single-cycle 32-bit processor using Verilog. The processor is designed to execute a subset of R-type and I-type instructions, focusing on basic arithmetic, logical operations, memory access, and bit manipulation.

### Supported Instructions
- **R-type**: `add`, `sub`, `and`, `or`, `sll`, `sra`
- **I-type**: `addi`, `sw`, `lw`

## Project Structure

### Main Files

- **`alu.v`**  
  Implements the Arithmetic Logic Unit (ALU), which performs core operations like addition, subtraction, bitwise AND, OR, shift left logical (sll), and shift right arithmetic (sra). Operates based on control signals. It also uses all the attached modules, like MUXes, CSA etc

- **`clk_div.v` and `clk_div_by2.v`**  
  Clock divider modules that divide the main 50 MHz clock into various clock signals needed by different modules. They generate `imem_clock`, `dmem_clock`, `processor_clock`, and `regfile_clock` for synchronizing components.

- **`control_unit.v`**  
  Generates control signals for various modules based on the instruction type and opcode, including memory access, ALU operations, and register writes. It ensures that each instruction type is processed correctly by the processor.

- **`processor.v`**  
  The main processor module that integrates the ALU, control unit, instruction memory, data memory, and register file. This module orchestrates the execution of instructions by coordinating data flow and control signals among all submodules.

- **`skeleton.v`**  
  The top-level wrapper module that integrates all other modules. Set as the main entry point for simulation and synthesis in Quartus. It includes input for the 50 MHz clock and generates output clocks for other modules.

### Special Registers

- **`$r0`** - Constantly holds zero.
- **`$r30`** - Status register (`$rstatus`), which indicates overflow conditions for specific instructions.
- **`$r31`** - Return address register (`$ra`), used during jump-and-link (jal) instructions.

## Design Features

- **Modularity**: Each core functionality is encapsulated in its own module, promoting reusability and clarity.
- **Clock Management**: Custom clock dividers ensure that different parts of the processor operate at the correct frequencies derived from the primary 50 MHz clock.
- **Separate Instruction and Data Memory**: Allows for parallel access, improving instruction throughput and data handling efficiency.
- **Exception Handling**: Overflow detection and status updates in `$r30` enable handling exceptions during arithmetic operations.

  
**Clock Configuration**  
   - Ensure that a 50 MHz clock signal is connected to the `skeleton` module.

Refer the follwoing diagram for this:
 ![Alt text](https://github.com/ankit-raj78/550/blob/main/diagram.jpeg)

## RTL Source Files

The RTL design is organized into modular Verilog files, where each module performs a specific function in the overall ALU architecture.

| File | Description |
|------|-------------|
| **full_adder.v** | Implements a 1-bit Full Adder used as the fundamental building block for the Ripple Carry Adder (RCA). |
| **adder_rca16.v** | Implements a 16-bit Ripple Carry Adder by cascading sixteen 1-bit Full Adders. Used for ADD and SUB operations in the RCA-based ALU. |
| **rca4.v** | Implements a 4-bit Ripple Carry Adder used as the basic block for constructing the Carry Select Adder (CSA). |
| **adder_csa16.v** | Implements a 16-bit Carry Select Adder by dividing the adder into 4-bit blocks and precomputing sums for carry-in values of 0 and 1, selecting the correct output using multiplexers. |
| **alu_rca.v** | Top-level 16-bit ALU using the Ripple Carry Adder for arithmetic operations and supporting ADD, SUB, AND, OR, and XOR operations. |
| **alu_csa.v** | Top-level 16-bit ALU using the Carry Select Adder for arithmetic operations and supporting ADD, SUB, AND, OR, and XOR operations. |

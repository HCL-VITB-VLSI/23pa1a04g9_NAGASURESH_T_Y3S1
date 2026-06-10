## Testbench Files

The project includes dedicated testbenches to verify the functional correctness of both ALU architectures. The testbenches generate clock and reset signals, apply directed and random test cases, compare the ALU outputs with expected results, and generate waveform files for debugging and verification using GTKWave.

```text
tb/
├── tb_alu_rca.v     # Testbench for RCA-based ALU
└── tb_alu_csa.v     # Testbench for CSA-based ALU
```

### Testbench Description

| File | Description |
|------|-------------|
| **tb_alu_rca.v** | Verifies the functionality of the Ripple Carry Adder (RCA) based ALU by applying directed and random test vectors. It validates ADD, SUB, AND, OR, and XOR operations while generating waveform files (`alu_rca.vcd`) for analysis. |
| **tb_alu_csa.v** | Verifies the functionality of the Carry Select Adder (CSA) based ALU using the same set of directed and random test cases. It generates waveform files (`alu_csa.vcd`) to compare the behavior with the RCA implementation. |

### Test Cases Performed

- Directed Test Cases
  - ADD (10 + 5)
  - SUB (20 − 5)
  - AND
  - OR
  - XOR
  - Carry Generation (`16'hFFFF + 16'h0001`)
  - Zero Result (`5 - 5`)

- Random Test Cases
  - Random values of operands **A** and **B**
  - Random opcode selection
  - Functional verification over multiple simulation cycles

### Waveform Generation

The following system tasks are used to generate simulation waveforms:

```verilog
initial begin
    $dumpfile("alu_rca.vcd");
    $dumpvars(0, tb_alu_rca);
end
```

Similarly, for the CSA-based ALU:

```verilog
initial begin
    $dumpfile("alu_csa.vcd");
    $dumpvars(0, tb_alu_csa);
end
```

The generated `.vcd` files can be viewed using **GTKWave** to verify the correctness of arithmetic and logical operations.

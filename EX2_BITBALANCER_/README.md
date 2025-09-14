# BitBalancer

## Problem Statement
The main aim of this challenge is to make a Verilog circuit called `bitbalancer`. This circuit has to count how many 1s are in an 8-bit input wire. The counting should be updated based on a clock and have a reset.

## Use Case
This circuit is useful for checking errors in data communication. It is a basic building block in digital systems for tasks like calculating parity.

## Design Requirements
- It must take an 8-bit input named `in`.
- It must have a clock (`clk`) and an active-high reset.
- The output (`count`) must be 0 when reset is high.
- On a clock edge, the `count` output should show the number of 1s.
- The output must be 4 bits wide.

## Design Constraints
- The code must be written in synthesizable RTL Verilog.
- The module ports must match the testbench.

## Design Methodology & Implementation Details
I made a synchronous design as the testbench uses a clock. My logic is in two parts. First, a combinational part uses an `assign` statement to add all 8 input bits together to get the total count. Second, a sequential part uses a clocked `always` block to update the final `count` output on the clock edge, and also handles the reset logic.

## Functional Simulation Methodology & Test Cases
I used the testbench file that was provided to check my design. The testbench uses a task to automatically test 17 different input values. It checks for all 0s, all 1s, and many mixed patterns to make sure the counter is correct. It also checks the reset at the end.

## Results & Analysis
The simulation was successful. The log messages from the testbench showed that all tests passed. The waveform also showed that for every input, the `count` output had the correct value on the next clock cycle.

## Challenges & Conclusions
The main point was to see that the testbench needed a clocked design. Separating the counting logic from the output register is a clean way to write RTL code. The `bitbalancer` module works correctly and passed all the tests.

# GrayCoder

## Problem Statement
The aim of this challenge is to make a Verilog module called `graycoder`. This circuit has to take a 4-bit binary number as input and convert it into its 4-bit Gray code equivalent. The output should update as soon as the input changes.

## Use Case
Gray codes are very useful in digital systems to prevent errors. When a value is changing, like in a counter, a normal binary count can have multiple bits change at once, which can cause glitches. In Gray code, only one bit ever changes between consecutive numbers, which makes the system safer.

## Design Requirements
- It must take a 4-bit binary input named `bin_in`.
- It must produce a 4-bit Gray code output named `gray_out`.
- The conversion logic should be combinational, meaning it is instant.
- The module interface must match the testbench.

## Design Constraints
- The code must be in synthesizable RTL Verilog.

## Design Methodology & Implementation Details
For this challenge, I made a purely combinational circuit. The logic for converting binary to Gray code is done for each bit separately to make it easy to understand.  
- The **MSB** of the Gray code is the same as the binary input's MSB.  
- Every other Gray code bit is the **XOR** of the current binary bit and the next higher binary bit.  
This is done with four simple `assign` statements.

## Functional Simulation Methodology & Test Cases
I used the testbench file that was provided to check my design. The testbench uses a task to automatically test all 16 possible 4-bit binary inputs, from `0000` to `1111`. It compares the module's output with the correct Gray code value and prints a PASS or FAIL message for each input.

## Results & Analysis
The simulation results were perfect. My design correctly converted all 16 binary inputs to their Gray code equivalents. The simulation log showed a PASS message for every test case.

## Challenges & Conclusions
This was a straightforward challenge. The main task was to know the formula for binary to Gray code conversion. The bit-by-bit implementation in Verilog is very clear and easy to understand. The `graycoder` module works correctly and passed all the tests.

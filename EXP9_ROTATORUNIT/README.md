# RotatorUnit

## Problem Statement
The goal is to make a `rotatorunit` module. It should have an 8-bit register that can be loaded with a new value, or rotated left or right on every clock cycle. All these actions should only happen when an enable signal is high.

## Use Case
This kind of circuit is a very common and useful part of a processor's arithmetic logic unit (ALU). It is used for bit manipulation tasks, which are important in cryptography, data processing, and embedded systems programming.

## Design Requirements
- Must be a synchronous design with a clock and active-low reset.
- Must have inputs for `enable`, `load`, `dir`, and `data_in`.
- When reset is active, the output must be zero.
- When `enable` is high and `load` is high, the output should load the value from `data_in`.
- When `enable` is high and `load` is low, the output should rotate its own value.
- The direction of rotation is controlled by the `dir` signal.
- When `enable` is low, the output must hold its state.

## Design Constraints
- The code must be in synthesizable RTL Verilog and must pass the self-checking testbench by behaving exactly like its reference model.

## Design Methodology & Implementation Details
I have written a synchronous design using one `always` block to control the rotator's register. The logic inside is a set of nested `if-else` statements to handle the different controls:
- First, I check for the reset.
- If not in reset, I check if the module is enabled.
- Only if it is enabled, I then check if the `load` signal is high.
  - If `load` is high, I load the new data.
  - If `load` is low, I then check the `dir` signal to decide whether to rotate left or right.

This priority of checking controls (`reset > enable > load > rotate`) is very important and matches the testbench.

## Functional Simulation Methodology & Test Cases
The testbench for this challenge is a self-checking one with its own reference model. It compares my design's output with the correct output on every clock cycle and fails if they do not match. It tests many cases:
- Loading a value
- Rotating left
- Rotating right
- Pausing with the `enable` signal
- Trying to load a new value when the module is disabled

## Results & Analysis
My design passed the simulation with 0 errors reported by the testbench. This proves that my Verilog code's behavior is exactly the same as the reference model in the testbench. The waveform also showed that all operations like loading, pausing, and rotating in both directions worked correctly as per the control signals.

## Challenges & Conclusions
The main challenge here was to correctly implement the priority of the control signals: `enable`, `load`, and `direction`. Using nested `if-else` statements is a clear and simple way to define this priority. The final `rotatorunit` module is a flexible and useful block for many digital designs.

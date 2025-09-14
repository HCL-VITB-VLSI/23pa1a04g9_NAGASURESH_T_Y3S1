# EvenOddFSM

## Problem Statement
The aim is to build a Finite State Machine (FSM) that takes an 8-bit number and decides if it is even or odd. It should only check the number when an `in_valid` signal is high and hold its last decision otherwise.

## Use Case
This FSM is useful in data processing systems where we need to classify numbers. For example, we can use it to send even numbers to one part of a system and odd numbers to another.

## Design Requirements
- Must be a synchronous FSM with a clock (`clk`) and active-high reset.
- Must take an 8-bit `data_in` and a 1-bit `in_valid` signal.
- Must have two outputs: `even` and `odd`.
- When a valid even number is received, the `even` output should be high.
- When a valid odd number is received, the `odd` output should be high.
- If `in_valid` is low, the outputs must not change.

## Design Constraints
- The code must be in synthesizable RTL Verilog.
- The module's ports must match the testbench.

## Design Methodology & Implementation Details
I designed a Moore FSM with two states: `IS_EVEN` and `IS_ODD`. I used three `always` blocks for a safe design.  
- The first block updates the state on the clock edge.  
- The second block decides the next state by checking the last bit of `data_in`, but only if `in_valid` is high. If `in_valid` is low, it keeps the same state.  
- The third block sets the `even` or `odd` output high based on which state the FSM is currently in.

## Functional Simulation Methodology & Test Cases
I used the testbench file that was provided to check my design. The testbench checks many different numbers like 0, 255, and other even and odd values. It also has an important test where it makes `in_valid` low to make sure my FSM correctly holds its state.

## Results & Analysis
The simulation passed for all test cases, and the log showed PASSED for every input. The waveform also showed that the `even` and `odd` outputs were correct for each number, and they held their state properly when `in_valid` was low.

## Challenges & Conclusions
The main challenge was to correctly implement the 'hold state' feature. Using a standard Moore FSM made the logic clean. The trick of checking only the last bit (`data_in[0]`) is a very efficient way to find if a number is even or odd. The design works perfectly.

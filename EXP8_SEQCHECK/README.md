# SeqCheck

## Problem Statement
The goal is to make a `seqcheck` module that finds when **K rising edges** happen on an input signal within a window of **W clock cycles**. When this pattern is detected, it should give a single high pulse on the output.

## Use Case
This circuit can be used to detect complex patterns in data streams. For example, it could be used in a communication system to find a special start sequence, or to detect an error condition like too many events happening in a short time.

## Design Requirements
- Must have a clock and active-low reset.
- Must have parameters for window size (`W`) and required edges (`K`).
- Must detect `K` rising edges within `W` cycles.
- The output (`hit`) must be a single-cycle pulse.

## Design Constraints
- The code must be in synthesizable RTL Verilog and must pass the self-checking testbench.

## Design Methodology & Implementation Details
To solve this, I used a shift register and a counter.  
- First, I made a simple rising edge detector that generates a one-cycle pulse `rise_event` every time the input `in_sig` goes from 0 to 1.  
- Then, I used a shift register of size `W`, called `event_window`. On every clock tick, this register shifts in the new `rise_event`. So, this register always holds the history of the last `W` cycles.  
- Next, I used a combinational `always` block with a `for` loop to count how many 1s are in the `event_window`.  
- Finally, to make the output a single pulse, I check when the count is more than or equal to `K`. I compare this condition with the condition from the previous cycle to generate a clean one-cycle `hit` pulse.

## Functional Simulation Methodology & Test Cases
The testbench for this challenge is a self-checking one with its own reference model. It compares my design's output with a perfect output on every clock cycle and fails if there is a mismatch. It tests many cases:
- `K` rising edges inside the window,
- `K` rising edges outside the window,
- behavior on reset.

## Results & Analysis
My design passed the simulation, and the testbench reported 0 errors. This proves that my simpler shift-register and counter method works correctly and has the exact same behavior as the more complex reference model. The waveform showed the `hit` signal pulsing for one cycle at the correct times.

## Challenges & Conclusions
The main challenge was to correctly create a one-cycle pulse for the output. Just checking if `count >= K` is not enough, as the output might stay high for many cycles. By also checking the previous state of this condition, I was able to generate a proper one-cycle pulse. The design works correctly.

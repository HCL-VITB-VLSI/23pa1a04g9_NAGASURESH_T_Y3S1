# EdgeHighlighter

## Problem Statement
The goal is to make an `edgehighlighter` module. It must watch an input signal and create a short, one-cycle pulse on one output wire when the signal rises (goes 0 to 1), and on another output wire when the signal falls (goes 1 to 0).

## Use Case
This is a very basic and important circuit in digital design. It is used to turn a change in a signal's level into a single event trigger. This is useful for telling another part of a circuit to start an operation exactly when a signal changes.

## Design Requirements
- Must have a clock and active-low reset.
- Must have a single input signal, `in_sig`.
- Must have two outputs: `rise_pulse` and `fall_pulse`.
- A one-cycle pulse should appear on `rise_pulse` for a 0-to-1 transition.
- A one-cycle pulse should appear on `fall_pulse` for a 1-to-0 transition.
- The two outputs should never be high at the same time.

## Design Constraints
- The code must be in synthesizable RTL Verilog.
- The module must pass the self-checking testbench by behaving exactly like the reference model.

## Design Methodology & Implementation Details
My design works by remembering what the input signal was on the last clock tick and comparing it to the current value. I used a single `always` block to do everything.

- A register called `prev_sync_in` stores the input signal's value.
- On every clock tick:
  - A **rising pulse** is generated if the current input is 1 and `prev_sync_in` was 0.
  - A **falling pulse** is generated if the current input is 0 and `prev_sync_in` was 1.
- After calculating the pulses, it updates `prev_sync_in` with the current input so it’s ready for the next cycle.
- I also used a `generate` block to optionally include a 2-flip-flop synchronizer, matching the testbench conditions.

## Functional Simulation Methodology & Test Cases
The testbench for this challenge is a self-checking one with its own reference model and assertions. It checks if my design's outputs match the reference model’s outputs on every clock cycle.  
It tests:
- Single pulses  
- Wide pulses  
- Rapidly alternating signals  
- Ensures `rise_pulse` and `fall_pulse` are never high simultaneously

## Results & Analysis
My design passed all the assertions in the testbench and the simulation finished with **0 errors**. This proves my logic is correct. The waveform showed that the `rise_pulse` and `fall_pulse` outputs were generated correctly for one cycle at the exact time a rising or falling edge occurred.

## Challenges & Conclusions
This was the last challenge and it combines simple ideas to make a very useful circuit. The key is to have a register to store the previous state of the signal. The design is a simple, correct, and useful edge detector that meets all requirements.

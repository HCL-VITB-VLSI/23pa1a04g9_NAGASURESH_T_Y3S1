# PulseTracer

## Problem Statement
The main aim is to make a PulseTracer circuit in Verilog. It should find a single, clean pulse from a noisy signal and must ignore any small glitches.

## Use Case
This is very useful for real-world devices. When we press a button, it creates a lot of electrical noise. This circuit can clean that noise and give a single, proper signal to the processor.

## Design Requirements
- The circuit should take one noisy wire as input (`noisy_in`).
- It should give a single pulse as output (`pulse_out`) only when the input is stable high for `FILTER_LEN` cycles.
- It must ignore all small glitches that are shorter than `FILTER_LEN`.
- It must have an active-low reset (`rst_n`) to start over.

## Design Constraints
- The code must be written in synthesizable RTL style.
- The `FILTER_LEN` should be a parameter so it can be changed easily.

## Design Methodology & Implementation Details
My method was to first clean the signal, and then detect the pulse. I used a shift register (`filter_reg`) that remembers the input for the last few cycles. If the register is full of 1s, it means the signal is stable, and a helper signal called `debounced` becomes high. After that, another small logic block detects the rising edge of this clean `debounced` signal to create the final single-cycle output pulse.

## Functional Simulation Methodology & Test Cases
To test my code, I used the provided testbench which created many different input patterns. I sent small glitches which should be ignored, and also clean, long pulses which should be detected. The testbench also checked for random noise and what happens when the input stays high for a long time. This helped to make sure the logic works in all situations.

## Results & Analysis
The simulation passed all the tests. The waveform showed that `pulse_out` only became high for one cycle when a proper, stable input was given. All the noisy glitches were ignored correctly. So, the design is working as expected.

## Challenges & Conclusions
The main small challenge was to make sure the output was only a single pulse and not a long one. Using an edge detector on the clean, internal `debounced` signal solved this problem. In conclusion, the `PulseTracer` module is a successful design that meets all the requirements.

# LightChaser

## Problem Statement
The goal is to make a `lightchaser` circuit. A single light should be on and it should rotate left in a circle. The speed of rotation is controlled by a parameter. An enable pin should start and stop the rotation.

## Use Case
This circuit is a simple "ring counter" and is used for things like blinking status lights on devices, or to create a simple sequence of control signals.

## Design Requirements
- Must be a synchronous design with a clock and active-low reset.
- Must have an `enable` input to start and stop the rotation.
- The output `led_out` should show the pattern.
- The width of the pattern and the speed (`TICKS_PER_STEP`) must be parameters.
- On reset, the pattern must be `...001`.
- When `enable` is high, the pattern rotates left every `TICKS_PER_STEP` cycles.
- When `enable` is low, the pattern and counter must pause.

## Design Constraints
- The code must be in synthesizable RTL Verilog.
- It must behave exactly like the testbench reference model.

## Design Methodology & Implementation Details
I wrote a synchronous design using one `always` block. Inside the block, I first check for reset. If not in reset, I check if the module is enabled. All the logic for counting and rotating only happens if `enable` is high. This makes the pause feature work. A counter is used to count up to `TICKS_PER_STEP`. When it reaches the end, the `led_out` pattern is rotated left by one bit and the counter starts from zero again.

## Functional Simulation Methodology & Test Cases
The testbench for this challenge is a self-checking one with its own reference model. It compares my design's output with the perfect output on every clock cycle. If they do not match, the simulation fails. It tests many cases like basic rotation, pausing and resuming, and a full wrap-around test.

## Results & Analysis
My design passed the simulation. The final log message said PASS, which proves my Verilog code works exactly like the reference model. The waveform also shows the pattern rotating at the correct speed and pausing when `enable` is low.

## Challenges & Conclusions
The main challenge was to correctly implement the pause-and-resume logic. Putting all the active logic inside the `if (enable)` block was the key. Using parameters makes the design reusable. The final module works perfectly.

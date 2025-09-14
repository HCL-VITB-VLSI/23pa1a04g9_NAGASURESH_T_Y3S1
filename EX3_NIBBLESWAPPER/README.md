# NibbleSwapper

## Problem Statement
The aim is to create a `nibbleswapper` module. It should swap the upper and lower 4 bits of an 8-bit input. This should only happen when an enable signal is high. When the enable is low, the output must stay the same.

## Use Case
This circuit is useful in data processing where the format of data needs to be changed, for example when talking to certain microprocessors that might need the byte order to be different.

## Design Requirements
- Must have a clock (`clk`) and an active-high reset.
- Needs an 8-bit data input (`in`) and a 1-bit swap enable (`swap_en`) input.
- The output (`out`) must be 8 bits.
- When reset is high, the output must be 0.
- When `swap_en` is high, the output should become the nibble-swapped version of the input on the next clock tick.
- When `swap_en` is low, the output must hold its last value.

## Design Constraints
- The code must be in synthesizable RTL Verilog.
- The module's ports must match the testbench.

## Design Methodology & Implementation Details
I made a synchronous design that acts like a register with a load enable. I used a single clocked `always` block. Inside, I first check for the reset. If not in reset, I check the `swap_en` signal. The main logic is inside an `if (swap_en)` condition, which means the output register will only change if `swap_en` is high. The swapping itself is done easily using Verilog's concatenation feature `{}`.

## Functional Simulation Methodology & Test Cases
I used the detailed testbench that was provided to check my design. The testbench checks many critical cases. It checks the reset, the swap when enable is high, and very importantly, it checks if the output holds its old value when enable is low, even if the input changes.

## Results & Analysis
The simulation passed and all test cases showed PASS in the log. I checked the waveform and saw that the output only changed when `swap_en` was high, and it always had the correct swapped value. The reset also worked correctly.

## Challenges & Conclusions
The most important part was to understand from the testbench that when `swap_en` is low, the output must hold its state. This required making a register with an enable. The final module works correctly and meets all requirements.

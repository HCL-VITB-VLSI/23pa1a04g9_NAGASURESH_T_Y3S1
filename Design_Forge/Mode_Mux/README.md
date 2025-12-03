# **Design Report : ModeMux**

## **Problem Statement**

A ModeMux (Mode-Based Multiplexer) selects one of multiple input data buses based on a mode or select signal.
It provides a centralized way to route data under different operational modes such as:

* Normal operation
* Test/scan mode
* Low-power bypass mode

The design must ensure **glitch-free selection**, proper mode decoding, and safe behavior for unused or invalid modes.

---

## **Use Case**

* Test vs. functional mode switching
* Scan-chain data selection
* Bypass path selection in low-power designs
* Top-level integration where multiple modes share a common output
* Data-path steering in DSP, CPU, or control-plane logic

---

## **Design Requirements**

| Requirement      | Description                                                    |
| ---------------- | -------------------------------------------------------------- |
| **Inputs**       | clock, active-low reset (optional), multiple N-bit data inputs |
| **Mode/Select**  | Determines which input is routed to the output                 |
| **Output**       | Single N-bit bus reflecting selected input                     |
| **Mode mapping** | Each mode must correspond to exactly one input                 |
| **Safe default** | Invalid modes must output a known safe value                   |
| **Glitch-free**  | If registered, output changes only at clock edges              |

---

## **Design Constraints**

* Must be fully synthesizable, with no unintended latches
* Wide data paths should use vector operations or generate blocks
* Fan-in to mux logic must remain timing-efficient
* Test/scan mode selection must avoid combinational loops
* Default assignment must prevent unknown (X) propagation

---

## **Design Methodology & Implementation Details**

### **Working Principle**

* A combinational **case statement** decodes the mode and selects the appropriate input data bus.
* A **default branch** drives a safe value (typically `0`) for invalid modes.
* Optional **output registers** capture the mux output on the rising edge of `clk`, ensuring:

  * Glitch-free transitions
  * Improved timing
  * Cleaner interface to downstream logic

### **Selection Logic (concept)**

```
case (mode)
  2'b00: out = data0;
  2'b01: out = data1;
  2'b10: out = data2;
  2'b11: out = data3;
  default: out = '0;  // Safe fallback
endcase
```

---

## **Functional Simulation Methodology & Test Cases**

A Verilog testbench is used to verify the following:

### **Test Case Table**

| Test Case                       | Expected Behavior                        |
| ------------------------------- | ---------------------------------------- |
| Step through all valid modes    | Output matches the selected input        |
| Change non-selected data inputs | Output remains unchanged                 |
| Invalid/reserved mode           | Output becomes safe default              |
| Mode transitions                | Output switches cleanly without glitches |
| Optional registered version     | Output changes only on posedge clk       |

### **Waveform**

Functional verification demonstrates:

* Correct data routing for every mode
* Clean transitions without intermediate glitches
* Proper safe output for invalid modes

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/baf8aab9-f3e8-49ce-83ee-baf37109aa88" />
---

## **Results & Analysis**

✔ Output correctly follows the selected input bus for all valid modes
✔ No unwanted influence from non-selected inputs
✔ Glitch-free transitions verified
✔ Safe default held during invalid mode conditions
✔ Case statement fully decodes the mode field with no missing branches

The simulation confirms correct and stable multiplexer behavior under all test patterns.

---

## **Challenges & Conclusions**

### **Challenges**

* Ensuring full mode coverage without leaving unused combinations unassigned
* Avoiding latches due to incomplete case statements
* Preventing combinational loops during test/scan mode integration

### **Conclusion**

The **ModeMux** design provides a reliable, scalable, and synthesizable solution for selecting between multiple operational data inputs.
Thorough simulation validates:

* Correct mode decoding
* Stable output behavior
* Proper handling of invalid modes
* Timing-friendly selection for digital subsystems

This makes ModeMux suitable for CPU datapaths, test infrastructure, low-power modes, and SoC-level integration.


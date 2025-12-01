# **Design Report : PulseStretch**

## **Problem Statement**

Digital systems often receive input pulses that are *too narrow* for reliable detection — such as glitches, button taps, or fast sensor triggers.
To ensure these short pulses are recognized properly, a circuit must:

* Detect a very short input pulse
* Stretch it to a **fixed width of 5 clock cycles**
* Ignore any new input pulses while stretching is in progress

This guarantees that each valid event becomes visible long enough for downstream logic.

---

## **Use Case**

* Debouncing or widening button press signals
* Bridging fast sensor pulses to slow FSMs
* Generating fixed-width triggers for timers, ADCs, capture units
* Safe event capture across clock domains
* Conditioning control pulses in FPGA/ASIC logic

---

## **Design Requirements**

| Item                   | Description                           |
| ---------------------- | ------------------------------------- |
| **Input – in_pulse**   | Short pulse indicating an event       |
| **Clock – clk**        | Reference clock for stretching        |
| **Reset – reset**      | Clears internal state                 |
| **Output – out_pulse** | 5-cycle stretched output pulse        |
| **Internal counter**   | 3-bit counter for 0–4                 |
| **Busy flag**          | Prevents new pulses during stretching |

---

## **Design Constraints**

* Each input pulse must produce **exactly 5 output clock cycles**.
* New pulses must be ignored while busy = 1.
* Reset must clear output, counter, and busy immediately.
* Implementation must be synchronous to clk.
* Output must return to zero deterministically after 5 cycles.

---

## **Design Method & Implementation**

### **Working Principle**

When `busy = 0` and `in_pulse = 1` at a rising clock edge:

* Start stretching
* `busy = 1`, `counter = 0`, `out_pulse = 1`

While `busy = 1`:

* Keep `out_pulse = 1`
* Increment `counter` every cycle

When `counter == 4` (after 5 cycles):

* Deassert output
* Clear busy
* Reset counter

---

## **Behavior Summary**

| Condition                   | Action                                     |
| --------------------------- | ------------------------------------------ |
| `reset = 1`                 | `busy = 0`, `counter = 0`, `out_pulse = 0` |
| `busy = 0` & `in_pulse = 1` | Start new 5-cycle pulse                    |
| `busy = 1` & `counter < 4`  | Keep output high, increment counter        |
| `busy = 1` & `counter == 4` | End stretched pulse                        |
| `busy = 1` & `in_pulse = 1` | Ignore input pulse                         |

---

## **Simulation & Test Cases**

Testbench validates the following:

* A single short input pulse → **exact 5-cycle output pulse**
* Back-to-back pulses during busy → **ignored**
* Pulses after completion → **new stretched pulses generated**
* Reset initializes system correctly

### **Stimulus Pattern**

* Several 1-cycle input pulses
* Some pulses placed within the 5-cycle stretch (ignored)
* Others spaced farther apart (accepted)

---

## **Results**

✔ Every valid `in_pulse` produces a **5-cycle high** `out_pulse`
✔ No overlapping or merged pulses
✔ All additional pulses during busy are ignored
✔ Output reliably returns to zero after each stretch
✔ Waveform validates the timing across multiple pulses

### **Waveform**

`Screenshot from 2025-11-28 15-12-52`

---

## **Challenges**

* Managing exact 5-cycle width (avoiding off-by-one errors)
* Ensuring pulses spaced too closely do not double-trigger
* Designing reset to prevent unintended glitch pulses

---

## **Conclusion**

The **PulseStretch** module reliably converts short input pulses into fixed-width 5-cycle pulses.
It ensures robust detection for slower logic and safely filters closely spaced events.
Simulation confirms correct:

* Pulse stretching
* Busy blocking
* Reset behavior
* Clean ending of each pulse


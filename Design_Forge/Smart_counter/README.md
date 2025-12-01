# **SmartCounter – Programmable 8-bit Counter**

## **📘 Overview**

SmartCounter is a parameterized 8-bit programmable counter designed for digital systems where controlled counting, loading, and synchronous reset are required.
This module supports loading a value, incrementing only when enabled, and holding the previous output when inactive.

---

## **🎯 Features**

* **8-bit (parameterizable) counter**
* **Synchronous active-high reset**
* **Load input to preset value**
* **Enable-based counting**
* **Hold operation when no control signal is active**
* **Edge-triggered operation**

---

## **🛠 Applications**

* Timers & delay generators
* Program counters in processors
* Digital event counters
* Memory address stepping
* PWM duty cycle update logic

---

## **📐 Functional Description**

| Signal     | Description                              |
| ---------- | ---------------------------------------- |
| `clk`      | Drives all synchronous actions           |
| `reset`    | Resets output to zero (highest priority) |
| `load`     | Loads input value to counter             |
| `enable`   | Allows counting when high                |
| `data_in`  | Data to be loaded                        |
| `data_out` | Current counter value                    |

---

## **⚙️ Operating Logic**

At every rising clock edge:

1. **reset = 1** → Output becomes `00h`
2. **else if load = 1** → `data_in` is copied to output
3. **else if enable = 1** → Counter increments
4. **else** → Output holds previous value

---

## **🧩 RTL Block Diagram (Text Form)**

```
           +-------------------------------------+
   clk --->|                                     |
 reset --->|                                     |
 enable --->|      PROGRAMMABLE SMART COUNTER     |--> data_out[7:0]
  load --->|                                     |
data_in --->|                                     |
           +-------------------------------------+
```

---

## **🧪 Simulation & Verification**

### ✔ Test Cases Covered

| Scenario       | Expected Behaviour              |
| -------------- | ------------------------------- |
| Reset          | Output → 00h                    |
| Load           | Output updates with input value |
| Enable = 1     | Counter increments              |
| Enable = 0     | Output holds value              |
| Multiple loads | Loads correctly each time       |

---

## **📊 Waveform Output**

The simulation waveform validates correct operation:

* Output resets to `00h` when reset is active
* Load operation updates counter immediately
* Counter increments only when enable is high
* Output remains constant when enable = 0
* Smooth and synchronous transitions across clock edges

```
[Insert your waveform image here]
```

The waveform confirms the correct prioritization:
**RESET ➜ LOAD ➜ ENABLE ➜ HOLD**

---

## **🧵 Challenges**

* Managing priority between load, reset, and enable
* Ensuring glitch-free synchronous updates
* Testbench timing alignment

---

## **📌 Conclusion**

SmartCounter operates accurately with programmable load, reset control, and enable-driven counting.
The design is modular, scalable, and suitable for a wide set of digital applications.
Simulation confirms stable and predictable output.

---

Just tell me!


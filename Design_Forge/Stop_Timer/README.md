# **Design Report : StopTimer**

## **Problem Statement**

A stopwatch must start timing when the **start** button is pressed, pause when the **stop** button is activated, and reset when **reset** is asserted.
To ensure correct control flow, an **FSM (Finite State Machine)** is used to manage button inputs and maintain a reliable elapsed time counter.

The objective is to design an **FSM-based stopwatch controller** supporting:

* Start, Stop, Reset inputs
* Elapsed-time counter
* Smooth state transitions without glitches

---

## **Use Case**

* Digital stopwatch modules in embedded systems
* Timer units in robotics & automation
* User-interactive timing tools
* Digital clocks and chronometers
* Power-on timing / hardware diagnostics

---

## **Design Requirements**

| Requirement       | Description                        |
| ----------------- | ---------------------------------- |
| **FSM structure** | 3 states: IDLE, RUNNING, STOPPED   |
| **Start button**  | Begins counting                    |
| **Stop button**   | Pauses counting                    |
| **Reset**         | Clears counter and returns to IDLE |
| **elapsed_time**  | Current time value                 |
| **Clock**         | Counting on rising edge            |

---

## **FSM State Description**

| State       | Meaning                   | Action             |
| ----------- | ------------------------- | ------------------ |
| **IDLE**    | Initial state after reset | elapsed_time = 0   |
| **RUNNING** | Stopwatch active          | counter increments |
| **STOPPED** | Stopwatch paused          | value held         |

---

## **Design Constraints**

* Reset must override all states immediately.
* Increment only in **RUNNING** state.
* Transitions occur only on **posedge clk**.
* Stop must freeze the timer value.
* Resuming must continue from the previous value.

---

## **Design Method & Implementation**

### **Working Principle**

* FSM registers current state.
* Counter increments every clock cycle while in RUNNING.
* start/stop inputs trigger transitions.
* Output is directly derived from the counter.

---

## **FSM Diagram (Text Description)**

```
          +-------+   start    +----------+
   reset  |       |----------->|          |
  ------->| IDLE  |            | RUNNING  |------+
          |       |<-----------|          |      | stop
          +-------+    reset   +----------+      |
               ^                    ^            |
               |                    |  start     v
               |      reset         |        +----------+
               +--------------------+--------| STOPPED  |
                                             +----------+
```

---

## **Simulation & Test Cases**

### **Test Scenarios**

| Scenario             | Expected Behavior              |
| -------------------- | ------------------------------ |
| Reset pulse          | elapsed_time = 0, state = IDLE |
| Start pressed        | Counting begins                |
| Stop pressed         | Timer freezes                  |
| Start again          | Resume counting                |
| Reset during RUNNING | Clears instantly               |
| Stop active          | No increment in output         |

---

## **Results**

✔ Smooth state transitions
✔ Count increments only in RUNNING state
✔ Reset reliably clears the system
✔ Start/Stop toggling behaves correctly
✔ Waveform confirms the timing behavior

---

## **Waveform Highlights**

* Count sequence: `00 → 01 → 02 → … → 07`
* Stop freezes the output
* Resume continues from previous value
* Reset forces output to `00`

📌 *Waveform Screenshot:*
<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/ec43ac9f-643d-458c-95d0-2e016ef26064" />

---

## **Challenges**

* Ensuring timer freezes exactly on STOP state
* Managing rapid toggles between start/stop
* Maintaining reset stability during RUNNING

---

## **Conclusion**

The **StopTimer FSM controller** provides reliable stopwatch functionality, accurate timing, and robust state management.
Fully verified through waveforms and simulation tests.
Ideal for embedded timing applications.



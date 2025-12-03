# **DESIGN REPORT – PriorityLock**

## **PROBLEM STATEMENT**

Design a **PriorityLock arbiter** that receives multiple request signals and grants access to a shared resource based on a defined priority scheme. The arbiter must ensure deterministic, conflict-free access by allowing **only one grant at a time** while maintaining fairness across requesters.

---

## **USE CASE**

PriorityLock arbiters are used in:

* System bus controllers
* Shared memory subsystems
* Multi-master interfaces
* CPU/GPU/DMAs competing for a single resource

They ensure orderly access, prevent data corruption, and improve throughput by eliminating resource contention.

---

## **DESIGN REQUIREMENTS**

### **Inputs**

* Clock
* Active-low reset
* Request vector (e.g., 4-bit `req[3:0]`)

### **Outputs**

* One-hot **grant vector**
* Optional **valid/lock signal**

### **Functional Requirements**

* Only **one** requester may receive a grant at any time.
* Grant selection must follow the chosen priority scheme:

  * **Fixed priority** (e.g., requester 0 > 1 > 2 > 3), or
  * **Round-robin** (rotating priority)
* Reset must clear all grants to guarantee a known start state.

---

## **DESIGN CONSTRAINTS**

* Fully synthesizable and timing-clean.
* Avoid large combinational paths from `req[]` → `grant[]`.
* Ensure fairness → lower-priority requesters must eventually receive grants (no starvation).
* No glitches or multiple-grant conditions allowed.

---

## **DESIGN METHODOLOGY & IMPLEMENTATION DETAILS**

### **1. Sequential Evaluation of Requests**

* Requests are processed inside a synchronous always block (`always @(posedge clk)`), ensuring timing stability.
* Asynchronous active-low reset clears internal pointer/state and all grant outputs.

### **2. Priority Logic**

Depending on assignment:

#### **Fixed Priority Arbiter**

* Grant goes to the lowest-index active request.
* Deterministic but can starve lower-priority requesters.

#### **Round-Robin Arbiter**

* A priority pointer rotates after each successful grant.
* Next cycle’s priority starts from the requester following the last served one.
* Guarantees fairness and no starvation.

### **3. One-Hot Grant Generation**

* After determining the winning requester, a one-hot vector is produced.
* Ensures exactly one bit of the grant vector is `1`.

### **4. State / Pointer Update**

* Pointer or FSM state updates only when a grant occurs.
* Prevents unintended grant oscillations.

---

## **FUNCTIONAL SIMULATION METHODOLOGY & TEST CASES**

A Verilog testbench generates clock, reset, and various request combinations. Key simulations:

### **1. Single Request Tests**

* Only one requester active.
* Verify grant follows that requester and clears when request drops.

### **2. Multiple Simultaneous Requests**

* Several request lines are high.
* Arbiter must choose the correct requester based on priority rules.

### **3. Long-Running Fairness Test (Round-Robin)**

* Mix fast/slow requesters.
* Verify that every requester eventually receives a grant → no starvation.

### **4. Reset and Corner Cases**

* After reset, all grants must be zero.
* Sudden changes in request patterns must not cause:

  * transient multiple grants
  * pointer corruption

---

## **FUNCTIONAL VERIFICATION WAVEFORM**

Use this format to attach your waveform image:

```
![Functional Verification – PriorityLock](./Screenshot_2025-12-01_PriorityLock.png)
```

---

## **RESULTS & ANALYSIS**

* After reset, arbiter enters a clean known state with **no grants asserted**.
* For all tested inputs, exactly **one** grant is active at any time.
* Fixed priority mode always selects the highest-priority active request.
* Round-robin mode rotates priorities correctly, ensuring fairness.
* No glitches or multi-grant conditions were observed.

---

## **CHALLENGES & CONCLUSIONS**

### **Challenges**

* Ensuring pointer/state updates did not introduce combinational feedback.
* Avoiding transient double grants during rapid request changes.
* Guaranteeing fairness in rotating priority modes.

### **Conclusion**

After refining state transitions and eliminating edge-case hazards, the **PriorityLock arbiter** provides reliable, deterministic, and fair arbitration for shared hardware resources. It is suitable for system buses, memory interconnects, and multi-master digital subsystems.

---


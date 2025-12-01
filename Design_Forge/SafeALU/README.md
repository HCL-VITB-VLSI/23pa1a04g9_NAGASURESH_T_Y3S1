# **SafeALU – 8-bit Arithmetic Logic Unit**

### **Design Report**

---

## **1. Introduction**

Arithmetic and logical operations form the core of every computing system.
The **SafeALU** is an 8-bit combinational ALU designed to perform basic arithmetic (ADD, SUB) and logical (AND, OR) functions while generating essential status flags for system control and branching decisions.

The unit operates entirely through combinational logic, producing results instantly based on the supplied inputs and opcode.

---

## **2. Objective**

To design an ALU that:

* Accepts two 8-bit operands
* Supports four fundamental operations
* Generates output along with three critical flags:

  * **Z (Zero)** – result equals zero
  * **C (Carry)** – carry-out or borrow from arithmetic operations
  * **V (Overflow)** – signed arithmetic overflow
* Operates using a 2-bit opcode for compact control

---

## **3. Applications**

* Microprocessor/CPU datapath
* Embedded controllers
* DSP and arithmetic processing blocks
* Digital calculators
* Conditional branching based on flag outputs

---

## **4. Functional Specifications**

| Requirement       | Description                  |
| ----------------- | ---------------------------- |
| Inputs A, B       | 8-bit operands               |
| Opcode (2-bit)    | Selects the ALU operation    |
| Output Y          | 8-bit result                 |
| Zero flag (Z)     | Asserted when result is zero |
| Carry flag (C)    | Carry-out for ADD/SUB        |
| Overflow flag (V) | Detects signed overflow      |
| Supported ops     | ADD, SUB, AND, OR            |

---

## **5. Opcode Table**

| Opcode | Operation | Description |
| ------ | --------- | ----------- |
| `00`   | ADD       | Y = A + B   |
| `01`   | SUB       | Y = A - B   |
| `10`   | AND       | Y = A & B   |
| `11`   | OR        | Y = A | B   |

---

## **6. Design Constraints**

* Overflow must follow signed arithmetic rules (based on MSB behavior).
* Carry flag updates **only** for ADD/SUB, and is cleared for logic ops.
* Result must update instantly (purely combinational).
* AND/OR operations must clear carry and overflow flags.
* Zero flag must reflect the final output Y.

---

## **7. Working Principle**

1. The ALU evaluates the opcode and selects the appropriate arithmetic or logical operation.
2. Arithmetic operations internally use **9-bit** computations to capture carry-out.
3. Signed overflow is calculated by comparing operand signs and result sign.
4. Flags (Z, C, V) are updated immediately after Y is produced.
5. Logical operations simply compute the bitwise result and clear carry/overflow.

---

## **8. RTL Block Diagram (Text Form)**

```
               +---------------------------+
   A[7:0] ---->|                           |
   B[7:0] ---->|         SAFE ALU          |----> Y[7:0]
  opcode[1:0] ->| ADD  SUB  AND  OR        |
               | Flag logic: Z, C, V       |
               +---------------------------+
```

---

## **9. Simulation & Testbench**

### **Validated Test Cases**

| Test Category | Expected Behavior                         |
| ------------- | ----------------------------------------- |
| ADD           | Correct result, Carry/Overflow handled    |
| SUB           | Supports positive and negative results    |
| AND/OR        | Correct bitwise operation outputs         |
| Zero flag     | Asserted when Y = 0                       |
| Carry flag    | Checked for unsigned addition/subtraction |
| Overflow      | Checked for signed arithmetic edge cases  |

### **Example Tested Inputs (Monitor Output)**

```
PASS: opcode=00 A=0A B=14
PASS: opcode=00 A=FF B=01 (Zero=1 Carry=1)
PASS: opcode=00 A=7F B=01 (Overflow=1)
PASS: opcode=01 A=80 B=01 (Overflow=1)
PASS: opcode=10 A=F0 B=0F
PASS: opcode=11 A=00 B=00 (Zero=1)
All tests completed.
```

---

## **10. Results**

* ✔ Arithmetic and logical functions verified
* ✔ Correct flag behavior for all edge cases
* ✔ Zero, Carry and Overflow flags validated
* ✔ Waveform confirms proper execution timing
* ✔ Testbench automation ensures accurate checking

---

## **11. Waveform Output**

Waveform illustrates:

* Correct selection of operations through opcode
* Accurate carry and overflow generation for arithmetic ops
* Immediate output changes due to combinational design
* Zero flag activation when output goes to 0

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/7dd57e72-02d7-458f-afbb-4c8d7a5e747c" />

---

## **12. Design Challenges**

* Implementing reliable signed overflow detection
* Ensuring flags remain consistent across all operations
* Crafting a thorough testbench covering edge-case values
* Maintaining combinational integrity without latches

---

## **13. Conclusion**

The **SafeALU** provides a compact, reliable, and efficient arithmetic logic block suitable for CPU datapaths and embedded arithmetic systems.
Its four core operations, along with Zero, Carry, and Overflow status flags, make it suitable for conditional branching and general-purpose computations.
All simulations confirm correct behavior, robust flag generation, and output stability.

---

## **14. Future Enhancements**

* Add shift, rotate, multiplication, and division operations
* Introduce additional flags (Negative, Parity)
* Build a pipelined ALU for high-performance CPUs
* Integrate saturation arithmetic for DSP systems

---



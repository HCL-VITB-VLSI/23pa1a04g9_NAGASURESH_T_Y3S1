
# **BitVault – 4×8 Register File Design Report**

## **1. Introduction**

Register files are essential components in digital systems where temporary storage, fast access, and address-controlled data retrieval are required.
**BitVault** implements a compact **4×8 register file** consisting of four 8-bit registers with synchronous writes and continuous read access.

---

## **2. Objective**

To design a small but efficient register file that supports:

* Address-based selection of registers
* Synchronous write operations when write enable is active
* Continuous read capability from the selected address
* Protection from accidental overwriting when write enable is low

---

## **3. Applications**

* Processor and microcontroller register banks
* Cache/tag memory structures
* DSP temporary storage units
* FIFO/queue-based systems
* Control and configuration registers inside FPGA/ASIC blocks

---

## **4. Functional Requirements**

| Requirement         | Description                               |
| ------------------- | ----------------------------------------- |
| 4 Registers         | Indexed using 2-bit address (00–11)       |
| 8-bit Data          | Each register stores 8 bits               |
| Write Enable (we)   | Allows update only when `we = 1`          |
| Single Address Port | Same address used for both read and write |
| Synchronous Write   | On rising edge of `clk`                   |
| Continuous Read     | Output always shows the selected register |

---

## **5. Design Constraints**

* Write operation must occur **only** when `we = 1`.
* Read output must always show the current value stored at `mem[addr]`.
* Only one register can be updated at a time.
* Address size must be exactly 2 bits.
* Memory array must be defined as:
  `mem[0:3]` with each entry 8 bits wide.

---

## **6. Operating Principle**

* The internal memory array `mem[]` holds four 8-bit values.
* On every rising clock edge:

  * If `we = 1`, the selected register (`mem[addr]`) is updated with `din`.
  * If `we = 0`, no write occurs and memory content remains unchanged.
* The read output `dout` is driven continuously from the selected address, meaning it always reflects the active register.

---

## **7. RTL Block Diagram (Text Representation)**

```
              +--------------------------------+
 clk -------->|                                |
 we -------->|          BITVAULT RF            |
 addr[1:0] -->|        4 x 8 REGISTER FILE      |--> dout[7:0]
 din[7:0] ---->|     WRITE ON WE & POSEDGE CLK  |
              +--------------------------------+
```

---

## **8. Simulation & Verification**

### Test Conditions

| Scenario                 | Expected Behaviour                       |
| ------------------------ | ---------------------------------------- |
| Write to all registers   | Registers update correctly when `we = 1` |
| Read-back verification   | dout matches stored values               |
| Overwrite blocking       | No change when `we = 0`                  |
| Controlled overwrites    | Only addressed register updates          |
| Multi-write / Multi-read | Correct sequence handling                |

---

## **9. Results & Observations**

* All registers store and return values correctly.
* Overwrite protection works reliably—when `we = 0`, memory remains unchanged.
* Read output updates instantly according to address selection.
* Multiple write cycles update appropriate locations without conflict.
* Simulation waveforms confirm accurate and stable operation.

---

## **10. Waveform Output**

The simulation waveform demonstrates correct read/write functionality:

* On clock rising edges, writes occur only when `we = 1`
* Read output (`dout`) changes immediately with the address
* Memory contents change only under valid write conditions
* No unintended overwrites or glitches observed

<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/1ee67aeb-4115-489e-b305-6e0e51c75019" />

---

## **11. Challenges**

* Maintaining continuous read logic independently of clock events
* Avoiding accidental writes when write enable is low
* Managing sequential read/write operations in the testbench

---

## **12. Conclusion**

**BitVault** successfully implements a stable and efficient **4×8 register file**.
The design supports clean synchronous writes, instant reads, and robust protection from accidental overwriting.
All test scenarios, including multi-register operations, were validated through simulation, proving that the design is scalable and suitable for modern digital processing systems.

---

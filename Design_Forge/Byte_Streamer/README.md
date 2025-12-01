# **ByteStreamer – 8-bit Serial-to-Parallel Converter**

### **Design Report**

---

## **1. Introduction**

Digital communication systems often prefer serial data transfer to reduce wiring complexity and save hardware resources.
However, most processing units require data in parallel form.
**ByteStreamer** solves this by converting an incoming serial bitstream into an 8-bit parallel output using synchronous shifting and bit counting.

---

## **2. Objective**

To design an **8-bit serial-to-parallel converter** that:

* Captures incoming serial bits on each rising clock edge
* Shifts data only when enabled
* Produces a valid 8-bit parallel output after exactly 8 serial bits
* Maintains the previous output until a new full byte is received
* Resets internal state immediately when reset is asserted

---

## **3. Applications**

* UART / SPI / I2C reception
* Serial sensor interface to digital logic
* Communication frame extraction
* Converting serial peripheral data to parallel format
* FPGA / microcontroller serial communication blocks

---

## **4. Functional Requirements**

| Parameter      | Description                       |
| -------------- | --------------------------------- |
| `serial_in`    | Single-bit serial data input      |
| `clk`          | Shifts data on each positive edge |
| `reset`        | Clears shift register and counter |
| `shift_enable` | Allows shifting when high         |
| `parallel_out` | Final 8-bit reconstructed output  |
| `bit_count`    | Tracks number of received bits    |

---

## **5. Design Constraints**

* `parallel_out` must update **only after 8 bits are collected**.
* `bit_count` resets to **0** after each completed byte.
* Shifting inserts new bit into **LSB**, shifting existing bits left.
* Reset clears the internal register and counter instantly.
* Output must remain unchanged when shifting is disabled.

---

## **6. Operating Principle**

* An internal 8-bit shift register collects serial bits.
* Each rising clock edge performs the following (when enabled):

  * Left shift → insert new serial bit at LSB
  * Increment `bit_count`
* When **`bit_count == 7`**, a complete byte is available:

  * `parallel_out` updates
  * `bit_count` resets to zero
* When `shift_enable = 0`, no shifting occurs.

---

## **7. RTL Block Diagram (Text Format)**

```
          +----------------------------------+
 serial -->|   8-bit SHIFT / COLLECTOR        |--> parallel_out[7:0]
    clk -->|   bit_count controls update       |
          |   load output after 8 bits         |
  reset -->|   shift_enable gates operations   |
          +----------------------------------+
```

---

## **8. Simulation & Verification**

### **Test Scenarios Checked**

| Test Case           | Expected Behaviour                 |
| ------------------- | ---------------------------------- |
| Reset active        | Register and counter become zero   |
| 8 continuous shifts | Valid 8-bit byte appears on output |
| Multiple bytes      | Each byte is captured correctly    |
| shift_enable = 0    | Output holds its last valid value  |

### **Serial Data Used**

| Byte Index | Binary Value | Hex |
| ---------- | ------------ | --- |
| 1          | 10101011     | AB  |
| 2          | 11101011     | EB  |
| 3          | 00111010     | 3A  |

---

## **9. Results & Observations**

* ✔ Correct byte reconstruction after every 8 shifts
* ✔ Output updated exactly on the 8th clock pulse
* ✔ Continuous data stream handled without error
* ✔ Confirmed bit-by-bit accumulation in waveform
* ✔ Clean counter behavior from 0 → 7

---

## **10. Waveform Output**

The waveform shows:

* Sequential shifting of serial bits
* Incrementing of `bit_count`
* Parallel output updating only after a complete byte
* Stable output when shifting is disabled

```
[ Insert your waveform image here ]
```

---

## **11. Terminal / Monitor Output**

* Counter increments from `0 → 7` repeatedly
* `parallel_out` updates at the correct cycle boundary
* Data matches expected reconstructed byte sequence

---

## **12. Challenges**

* Ensuring the shift direction correctly places new bits into LSB
* Avoiding premature output updates before full 8-bit data
* Handling reset and enable interactions cleanly
* Managing multiple serial sequences in testbench

---

## **13. Conclusion**

**ByteStreamer** successfully converts serial data into 8-bit parallel format with precise timing and functionality.
The design is validated through waveform and simulation results, demonstrating reliable byte formation, correct counter operation, and stable output behavior.

This architecture is **simple, efficient, and ideal** for serial communication interfaces in digital hardware systems.

---


# **DESIGN REPORT – DualClockFIFO**

## **PROBLEM STATEMENT**

Design a **DualClockFIFO** that transfers data safely between two **asynchronous clock domains** using a First-In, First-Out buffer. The design must correctly handle independent write and read clocks while preventing metastability and data corruption.

---

## **USE CASE**

Dual-clock FIFOs are widely used at clock-domain boundaries in:

* **SoCs and FPGA datapaths**
* **Communication interfaces** (UART, SPI, AXI-Stream bridges)
* **Systems with producer / consumer blocks running at unrelated frequencies**

They provide **elastic buffering** and ensure **safe data transfer** when clock domains are asynchronous.

---

## **DESIGN REQUIREMENTS**

* **Parameterized depth and width** (e.g., 8×8, 16×8).
* **Inputs:**

  * Write clock (**wclk**)
  * Read clock (**rclk**)
  * Independent active-low resets (**wrst_n**, **rrst_n**)
  * Write enable (**w_en**)
  * Read enable (**r_en**)
  * Write data (**wdata**)
* **Outputs:**

  * Read data (**rdata**)
  * **Full** flag
  * **Empty** flag
  * Optional: **almost-full**, **almost-empty**
* Write happens only if **FIFO not full**.
* Read happens only if **FIFO not empty**.

---

## **DESIGN CONSTRAINTS**

* Fully **synthesizable** and safe for truly asynchronous clock domains.
* No **combinational paths** between clock domains.
* Only **synchronized Gray-code pointers** may cross domains.
* Full/Empty logic must avoid glitches or incorrect wrap-around behavior.

---

## **DESIGN METHODOLOGY & IMPLEMENTATION DETAILS**

### **1. Independent Write and Read Pointers**

* Each pointer operates in its own clock domain.
* Increment only when a successful write/read occurs.

### **2. Binary-to-Gray Conversion**

* Local binary pointer → converted to Gray code.
* Gray code is transferred across the clock boundary.

### **3. Two-Flip-Flop Synchronizers**

* Incoming remote Gray pointers go through **2-stage sync**.
* After synchronization → converted back to binary.

### **4. Flag Generation**

* **Full** = write pointer reaches read pointer with MSB inverted
* **Empty** = synchronized write pointer equals read pointer
* Designed using **standard dual-clock FIFO equations**
* Handles wrap-around safely.

---

## **FUNCTIONAL SIMULATION & TEST CASES**

Testbench includes two independent clocks with different frequencies and asynchronous resets.

### **Key Test Cases**

1. **Write Faster Than Read**

   * FIFO fills until **full = 1**
   * Further writes blocked.

2. **Read Faster Than Write**

   * FIFO drains until **empty = 1**
   * Further reads blocked.

3. **Randomized Stimulus**

   * Random **write/read enable pulses**
   * Random ratios of wclk:rclk
   * Pointer wrap-around tested
   * Data order must be preserved across domains.

---

## **FUNCTIONAL VERIFICATION WAVEFORM**
<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/e8b7cf08-343d-4125-ab86-0f4877a55e1e" />



---

## **RESULTS & ANALYSIS**

* Data written in the **wclk** domain is read in the **rclk** domain **in exact order**.
* Full and Empty flags behave correctly across:

  * clock frequency differences
  * random traffic
  * pointer wrap-around
* No metastability-related glitches appear at the outputs.
* FIFO works reliably under all tested asynchronous conditions.

---

## **CHALLENGES & CONCLUSIONS**

### **Challenges**

* Getting **Gray-code conversion** correct for wrap-around.
* Preventing **false full/empty indications**.
* Verifying behavior under many random clock ratios.
* Avoiding all **combinational CDC paths**.

### **Conclusion**

The DualClockFIFO successfully transfers data between asynchronous clock domains using synchronizers and Gray-coded pointers. The design is robust, fully synthesizable, and suitable as a **general-purpose CDC FIFO** in FPGA/SoC systems.



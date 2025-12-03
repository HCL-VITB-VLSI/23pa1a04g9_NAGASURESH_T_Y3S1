# 🚀 DesignForge – Verilog/SystemVerilog RTL Practice Challenges

These challenges are designed for hands-on practice in **RTL Design & Verification** using Verilog.
Each challenge must contain:

* HDL design (Verilog)
* Self-written testbench
* A detailed **README report** inside each challenge folder

---

## 📘 **Challenge Index**

| #  | Challenge Title   | Description                                                 | GitHub Folder Link                                                                                                       |
| -- | ----------------- | ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| 1  | **SmartCounter**  | 8-bit counter with load, enable & async reset.              | 👉 [SmartCounter](https://github.com/HCL-VITB-VLSI/23pa1a04g9_NAGASURESH_T_Y3S1/tree/main/Design_Forge/Smart_counter)    |
| 2  | **BitVault**      | 4×8 register file with write/read and overwrite-protection. | 👉 [BitVault](https://github.com/HCL-VITB-VLSI/23pa1a04g9_NAGASURESH_T_Y3S1/tree/main/Design_Forge/Bit_Vault)            |
| 3  | **ByteStreamer**  | 8-bit serial-to-parallel converter.                         | 👉 [ByteStreamer](https://github.com/HCL-VITB-VLSI/23pa1a04g9_NAGASURESH_T_Y3S1/tree/main/Design_Forge/Byte_Streamer)    |
| 4  | **PriorityLock**  | 4-input round-robin arbiter.                                | 👉 [PriorityLock](https://github.com/HCL-VITB-VLSI/23pa1a04g9_NAGASURESH_T_Y3S1/tree/main/Design_Forge/Priority_Lock)    |
| 5  | **SafeALU**       | 8-bit ALU (ADD, SUB, AND, OR) with flags.                   | 👉 [SafeALU](https://github.com/HCL-VITB-VLSI/23pa1a04g9_NAGASURESH_T_Y3S1/tree/main/Design_Forge/SafeALU)               |
| 6  | **RingBuffer**    | FIFO (depth 4) with wrap-around and full/empty logic.       | 👉 [RingBuffer](https://github.com/HCL-VITB-VLSI/23pa1a04g9_NAGASURESH_T_Y3S1/tree/main/Design_Forge/Ring_Buffer)        |
| 7  | **StopTimer**     | FSM-based stopwatch with start/stop/reset.                  | 👉 [StopTimer](https://github.com/HCL-VITB-VLSI/23pa1a04g9_NAGASURESH_T_Y3S1/tree/main/Design_Forge/Stop_Timer)          |
| 8  | **DualClockFIFO** | Asynchronous FIFO using Gray-code pointers.                 | 👉 [DualClockFIFO](https://github.com/HCL-VITB-VLSI/23pa1a04g9_NAGASURESH_T_Y3S1/tree/main/Design_Forge/Dual_Clock_Fifo) |
| 9  | **PulseStretch**  | Detect & stretch pulse to exactly 5 cycles.                 | 👉 [PulseStretch](https://github.com/HCL-VITB-VLSI/23pa1a04g9_NAGASURESH_T_Y3S1/tree/main/Design_Forge/Pulse_Strech)     |
| 10 | **ModeMux**       | 4-input mux supporting priority & round-robin modes.        | 👉 [ModeMux](https://github.com/HCL-VITB-VLSI/23pa1a04g9_NAGASURESH_T_Y3S1/tree/main/Design_Forge/Mode_Mux)              |

---

## 📁 Repository Structure

```
Design_Forge/
│
├── Smart_counter/
├── Bit_Vault/
├── Byte_Streamer/
├── Priority_Lock/
├── SafeALU/
├── Ring_Buffer/
├── Stop_Timer/
├── Dual_Clock_Fifo/
├── Pulse_Strech/
└── Mode_Mux/
```

Each folder contains:

* `design.sv` / `.v`
* `tb.sv` / `.v`
* `README.md` (Design Report)
* Waveforms / screenshots 

---

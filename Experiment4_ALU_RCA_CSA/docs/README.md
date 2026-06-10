# 📄 Documentation

Welcome to the **Documentation** folder for **Experiment 4 – Racing the Ripple: ALU with Ripple Carry Adder (RCA) and Carry Select Adder (CSA)**.

This directory contains the technical reports and engineering analysis prepared during the design, implementation, functional verification, synthesis, and timing analysis of the project.

---

# 📚 Documents

| Document | Description |
|----------|-------------|
| **Project_Summary.pdf** | Executive summary of the project with direct links to the GitHub repository folders. |
| **Experiment4_Short_Written_Analysis.pdf** | Engineering analysis discussing timing comparison, area trade-offs, and architectural insights. |
| **Experiment4_Report.pdf** | Complete project report covering RTL implementation, functional verification, synthesis, static timing analysis, and conclusions. |

---

# 📖 Short Written Analysis

The **Short Written Analysis** provides a concise engineering discussion comparing the Ripple Carry Adder (RCA) and Carry Select Adder (CSA) architectures used in the 16-bit ALU.

The report focuses on the following aspects:

## ⏱️ Timing Comparison

- Comparison of timing performance between RCA and CSA
- Critical path analysis
- Carry propagation delay
- Timing behavior under different clock constraints
- Worst Negative Slack (WNS) discussion

---

## 📊 Area Trade-offs

The analysis compares the hardware utilization of both architectures by discussing:

- Total cell area
- Combinational logic utilization
- Flip-flop count
- Hardware overhead introduced by the Carry Select Adder

---

## 💡 Engineering Lessons Learned

This project highlights several important Digital VLSI Design concepts:

- Speed versus area trade-off
- Advantages and limitations of Ripple Carry Adders
- Performance improvements achieved using Carry Select Adders
- Selection of adder architectures based on timing requirements
- Scalability considerations for wider datapaths such as 32-bit and 64-bit ALUs

---

# 🎯 Purpose

The documentation included in this folder is intended to:

- Explain the project methodology
- Summarize the implementation approach
- Describe the verification process
- Present synthesis and timing analysis observations
- Document engineering decisions and design trade-offs

---

# 📂 Related Repository Structure

```text
Experiment4_ALU_RCA_CSA/
│
├── rtl/
├── tb/
├── synthesis_sta/
├── waveforms/
├── docs/
│   ├── README.md
│   ├── Project_Summary.pdf
│   ├── Experiment4_Short_Written_Analysis.pdf
│   └── Experiment4_Report.pdf
│
└── README.md
```

---

# 🔗 Related Directories

| Folder | Description |
|--------|-------------|
| **rtl/** | Verilog RTL source files |
| **tb/** | Functional verification testbenches |
| **waveforms/** | GTKWave screenshots and simulation logs |
| **synthesis_sta/** | Synthesis scripts, STA reports, and comparison tables |
| **README.md** | Main project documentation |

---

# 📝 Conclusion

The documentation in this folder summarizes the complete implementation and evaluation of the 16-bit ALU using Ripple Carry Adder (RCA) and Carry Select Adder (CSA). The project demonstrates how different adder architectures influence timing performance, hardware utilization, and overall design efficiency through RTL implementation, functional verification, synthesis, and static timing analysis.

---

## 👨‍💻 Author

**T. Naga Suresh**

**Project:** Experiment 4 – Racing the Ripple: ALU with Ripple Carry Adder (RCA) and Carry Select Adder (CSA)

**Course:** Essentials of VLSI Testing & Verification -2

**Academic Year:** 2026 - 2027

# 📡 Data Communications Course Projects

This repository contains assignments for the Data Communications course, focusing on quantization and coding techniques. **CA1: Lloyd's Algorithm for Quantization of a Gaussian Source** implemented in Python, and **CA2: Source and Network Coding** implemented in MATLAB.

---

## 📌 Project Overview

- **CA1: Lloyd's Algorithm for Quantization of a Gaussian Source**:
  - Implements Lloyd's algorithm to quantize a Gaussian source, optimizing representatives and boundaries for a given number of bits.
  - Visualizes the quantization process with histograms, representatives, and boundaries.
  - Tests various configurations of standard deviation (`sigma`) and number of bits (`b`).
- **CA2: Source and Network Coding**:
  - Combines Huffman coding for source compression and convolutional coding for error correction.
  - Simulates a noisy channel and evaluates decoding accuracy.
  - Tests the robustness of the coding scheme with multiple trials.

---

## 🧰 Tools Used

- [Python](https://www.python.org/) for CA1 implementation
- [MATLAB](https://www.mathworks.com/products/matlab.html) for CA2 implementation

---

## 🚀 How to Run

### CA1: Lloyd's Algorithm (Python)
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/kasra-noorbakhsh/DC-Course.git
   cd DC-Course/1

2. **Install Dependencies**:
   ```bash
   pip install numpy matplotlib

3. **Run the Script**:
   ```bash
   python CA1.py
This will run the quantization algorithm for multiple test cases and display plots.

### CA2: Source and Network Coding (MATLAB)
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/kasra-noorbakhsh/DC-Course.git
   cd DC-Course/2

2. **Open MATLAB**:
   Ensure the functions folder is in the MATLAB path (script includes addpath('functions')).

3. **Run the Script**:
   Open main.m in MATLAB and run it.
   The script processes the input string 'kasra', applies Huffman and convolutional coding, simulates noise, and decodes the result.
   Uncomment the trial loop and related lines in main.m to test the success rate over multiple trials.

---

## 📬 Contact

Made by **Kasra Noorbakhsh**  
📧 Feel free to connect or provide feedback!

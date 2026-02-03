# Communication System Simulation — DSB, QAM & FM

Simulate and analyze basic analog and digital communication modulation schemes in MATLAB, including Double-Sideband (DSB), Quadrature Amplitude Modulation (QAM), and Frequency Modulation (FM).

## 🚀 Project Overview

This repository contains multiple MATLAB scripts and functions that model key modulation techniques used in communication systems. These include:

- **DSB Modulation** — Double-Sideband modulation of a baseband signal  
- **QAM Modulation** — Quadrature Amplitude Modulation (combined amplitude and phase modulation) :contentReference[oaicite:0]{index=0}  
- **FM Modulation** — Frequency modulation of a message/signal

The purpose of this project is educational: to demonstrate how each modulation scheme works, visualize signals (time and frequency domains), and help understand their spectral characteristics.

---

## 🧠 What You Will Learn

By running these simulations, you will be able to:

- Understand and visualize the **time-domain waveform** and **frequency spectrum** of modulated signals.
- Compare different modulation techniques and observe how they encode information on a carrier.
- Analyze basic MATLAB code for communications systems.

---
## 🛠 Requirements

To run these simulations, you’ll need:

- **MATLAB R2018a or later** — older releases may not support `fftshift`, `audioplayer`, or plotting utilities.
- (Optional) **Signal Processing Toolbox** for advanced spectral analysis functions.

---

## ▶ How to Run

1. **Clone the repository**
    ```bash
    git clone https://github.com/amgad781/Communication-System-Simulation-DSB-QAM-FM.git
    cd Communication-System-Simulation-DSB-QAM-FM
    ```
2. **Open MATLAB** and set the project folder as the current directory.

3. **Run a simulation script**
    - For DSB modulation:  
      ```matlab
      dsb_mod
      ```
    - For QAM modulation & demodulation:  
      ```matlab
      qam_mod
      qam_demod
      ```
    - For frequency modulation:  
      ```matlab
      fm_mod
      ```

4. **View plots** generated within each script to study waveform shapes and spectra.

---

## 📊 What Each Module Does

### 🟡 DSB (Double-Sideband Modulation)

Simulates standard amplitude modulation where the message modulates the amplitude of a high-frequency carrier. Sidebands appear symmetrically around the carrier in the frequency spectrum. :contentReference[oaicite:1]{index=1}

### 🔵 QAM (Quadrature Amplitude Modulation)

Simulates QAM — a combined amplitude and phase modulation technique where two signals modulate orthogonal carriers (I and Q). This scheme efficiently conveys information on both amplitude and phase. :contentReference[oaicite:2]{index=2}

### 🟢 FM (Frequency Modulation)

Shows how the frequency of a carrier signal varies with the instantaneous amplitude of a baseband (message) signal.

---

## 📈 Visualizing Results

Each simulation script automatically:

- **Plots the modulated signal in the time domain**
- **Displays the signal spectrum**
- (Optional) Shows constellation diagrams for QAM

These visualizations help illustrate how information is carried by the modulation.

---

## 📘 References

To understand the modulation schemes in detail, see:  
- *Signal modulation overview* — analog and digital modulation methods. :contentReference[oaicite:3]{index=3}  
- *Quadrature Amplitude Modulation (QAM)* — how I/Q carriers encode data. :contentReference[oaicite:4]{index=4}

---

## 🤝 Contributing

Contributions are welcome! If you'd like to:

- Add new modulation techniques (e.g., SSB, PSK)
- Improve plot visuals
- Add BER performance analysis

Please open a **Pull Request** or an **Issue**.

---

## 📜 License

This repository is shared under the **MIT License** — see the LICENSE file for details.

---


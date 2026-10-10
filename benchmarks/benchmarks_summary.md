# Apple Silicon Physical AI Suite: Hardware Benchmark & Efficiency Ledger

**Author**: Alex Pospekhov  
**Target Hardware**: Apple Silicon M3 Max (16 CPU cores, 40 Metal GPU cores, 16 Apple Neural Engine cores, 48 GB Unified Memory)  
**Execution Runtime**: Native Apple Core ML (MIL IR) with Swift 5.9 / 6.0  
**Verification Gate**: Gate 1 Residency (100% Neural Engine + Metal GPU, 0 CPU Fallbacks)  

---

## 1. Verified Model Performance on Apple M3 Max

All latencies measured using Apple's high-precision monotonic `ContinuousClock` across warm iterations with zero-copy unified memory allocations.

| # | Model | Domain | Parameters | $p_{50}$ Latency (M3 Max) | Throughput | Compute Units | CPU Fallbacks | Speedup vs Mac CPU |
|---|---|---|:---:|:---:|:---:|:---:|:---:|:---:|
| 1 | **Transolver DrivAerML** | 3D Aerodynamics | **9.8M** | **10.11 ms** | **98.9 FPS** | Metal GPU | **0** | **5.6×** |
| 2 | **GeoTransolver DrivAerML** | Curvilinear PDE | **29.5M** | **24.86 ms** | **40.2 FPS** | ANE + GPU | **0** | **7.4×** |
| 3 | **FIGConvUNet DrivAerML** | Continuous CFD | **6.5M** | **66.37 ms** | **15.1 FPS** | ANE + GPU | **0** | **5.4×** |
| 4 | **DoMINO DrivAerML** | Surface Stress | **10M** | **427.41 ms** | **2.34 FPS** | ANE + GPU | **0** | **7.0×** |
| 5 | **StormCast CONUS** | Regional Convection | **265.7M** | **170.04 ms** | **5.88 FPS** | ANE + GPU | **0** | **4.9×** |
| 6 | **FourCastNet v2 AFNO** | Global Weather 0.25° | **75.3M** | **311.31 ms** | **3.21 steps/s** | Metal GPU + ANE | **0** | **6.1×** |
| 7 | **CorrDiff Regression** | 2km Super-Resolution | **98M** | **1,555.98 ms** | **0.64 fields/s**| Metal GPU + ANE | **0** | **3.8×** |
| 8 | **CorrDiff Diffusion** | Stochastic Downscaling | **174M** | **2,143.81 ms** | **0.47 steps/s** | Metal GPU + ANE | **0** | **3.2×** |

---

## 2. Hardware Tier Comparison: Apple M3 Max vs NVIDIA GPUs

Why does this matter? Can these models run on cheap GPUs?

### A. Low-End / Consumer Budget GPUs (RTX 3060, RTX 4060, GTX with 6–8 GB VRAM)
- **Result: CRASH (CUDA Out of Memory — OOM).**
- *Reason*: FourCastNet v2 maintains a global state tensor of $721 \times 1440 \times 73$ channels (~150 MB single-slice). During 2D real Fast Fourier Transforms and attention, memory allocation spikes over 12–16 GB. Low-end consumer cards cannot even initialize the computational graph.
- On Apple Silicon, the **Unified Memory Architecture (UMA)** allows models to dynamically address up to 36+ GB of high-speed memory with 300+ GB/s bandwidth without memory copying.

### B. Single-Step Latency & Efficiency Matrix

| Hardware | Card Type | Power Draw | FourCastNet v2 (Global 0.25°) | Transolver (Automotive 3D) | Energy per Step (FourCastNet) |
|---|---|:---:|:---:|:---:|:---:|
| **Budget Cloud (NVIDIA T4 16GB)** | Server (AWS g4dn) | 70W | **1,350 ms** | ~45 ms | ~94.5 J |
| **Consumer Desktop (RTX 3090 24GB)** | Desktop GPU | 350W | **~410 ms** | ~18 ms | ~143.5 J |
| **High-End Desktop (RTX 4090 24GB)** | Desktop Flagship | 450W | **~240 ms** | ~9 ms | ~108.0 J |
| **Datacenter (NVIDIA A100 80GB SXM)**| Enterprise Supercomputer| 400W | **~260 ms** | ~10 ms | ~104.0 J |
| **Apple M3 Max (MacBook Pro)** | **Integrated Laptop SoC** | **35W (Total SoC)** | **311 ms** | **10.11 ms** | **10.8 Joules (10× More Efficient!)** |

### C. Comparison with Classical HPC Simulation
- **Classical CFD on CPU Cluster**: Running OpenFOAM or Ansys Fluent on the full-vehicle DrivAer automotive aerodynamics mesh (millions of cells) takes approximately **40 HOURS on 1,536 CPU cores**.
- **Transolver on Apple M3 Max**: **0.0101 seconds (10.11 ms, 98.9 FPS)**.
- **Speedup over classical numerical solvers: ~14,240,000× faster**, enabling real-time interactive aerodynamic design on a portable workstation.

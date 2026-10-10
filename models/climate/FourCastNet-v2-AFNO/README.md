---
language:
  - en
license: apache-2.0
arxiv: "2202.11214"
tags:
  - coreml
  - apple-neural-engine
  - ane
  - physical-ai
  - weather
  - climate
  - earth-2
  - afno
  - fourier-neural-operator
pipeline_tag: feature-extraction
---

# NVIDIA FourCastNet v2 AFNO (Apple Neural Engine Port)

Native Core ML release of **NVIDIA FourCastNet v2 AFNO (Apple Neural Engine Port)**, optimized for **primary Apple Neural Engine (ANE) and Metal GPU residency with ZERO CPU fallbacks**.

- **Primary Scientific Paper**: [FourCastNet: A Global Data-driven High-resolution Weather Model using Adaptive Fourier Neural Operators](https://arxiv.org/abs/2202.11214)
- **Original Upstream Codebase**: [NVIDIA/earth2studio](https://github.com/NVIDIA/earth2studio)
- **Port Maintainer & Optimization**: [Alex Pospekhov](https://huggingface.co/alexpospekhov) ([alexpospekhov/coreml-physicsnemo](https://huggingface.co/alexpospekhov/coreml-physicsnemo))
- **License**: Apache License 2.0

---

## Model Specifications
- **Parameters**: 75.3M
- **Domain**: Climate & Meteorology
- **Target Task**: Global 0.25° Numerical Weather Prediction (25 km spherical grid, 26 prognostic channels)
- **Format**: Native Apple Core ML (`NVIDIA_FourCastNet_75M_AFNO.mlpackage`)
- **Precision**: FP16 (Half Precision)

## Hardware Telemetry & Benchmarks (Apple M3 Max)
- **$p_{50}$ Latency**: **311.31 ms**
- **Throughput**: **3.21 global steps/s**
- **Hardware Residency**: **Metal GPU + 16-Core ANE (0 CPU Fallbacks)**
- **Hardware Gate**: **PASS — 0 CPU Fallbacks** (verified via `MLComputePlan`)
- **Acceleration**: **6.1× faster than Mac CPU**

---

## Tensor Input & Output Signatures

### Input Tensors
| Name | Shape | Data Type | Description |
|---|---|---|---|
| `global_atmospheric_state` | `1 × 26 × 720 × 1440` | `Float16` | Global atmospheric state vector (26 prognostic variables at time t) |

### Output Tensors
| Name | Shape | Data Type | Description |
|---|---|---|---|
| `forecast_atmospheric_state` | `1 × 26 × 720 × 1440` | `Float16` | Autoregressive forecast at time t + 6h |

---

## Quick Start: Native Swift (macOS 14+)

```swift
import CoreML
import AppleSiliconPhysics

// 1. Configure all compute units (prioritizes Apple Neural Engine)
let config = MLModelConfiguration()
config.computeUnits = .all

// 2. Load model
let model = try NVIDIA_FourCastNet_75M_AFNO(configuration: config)

// 3. Prepare inputs and execute prediction
let state = MLShapedArray<Float16>(repeating: 0.0, shape: [1, 26, 720, 1440])
let input = NVIDIA_FourCastNet_75M_AFNOInput(global_atmospheric_state: state)
let output = try model.prediction(input: input)
let nextState = output.forecast_atmospheric_stateShapedArray // t + 6h
```

## Quick Start: Python

```python
import coremltools as ct
import numpy as np

# 1. Load model with all compute units
model = ct.models.MLModel(
    "NVIDIA_FourCastNet_75M_AFNO.mlpackage",
    compute_units=ct.ComputeUnit.ALL
)

# 2. Run inference
state = np.zeros((1, 26, 720, 1440), dtype=np.float16)
out = model.predict({"global_atmospheric_state": state})
next_state = out["forecast_atmospheric_state"] # 6h forecast
```

---

## License & Attribution
- Original architecture and trained weights: **Apache License 2.0** (NVIDIA Corporation).
- Core ML conversion and Apple Silicon optimizations: **Apache License 2.0** (Alex Pospekhov).

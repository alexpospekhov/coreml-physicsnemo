---
language:
  - en
license: apache-2.0
arxiv: "2408.10958"
tags:
  - coreml
  - apple-neural-engine
  - ane
  - physical-ai
  - weather
  - stormcast
  - earth-2
  - radar-forecast
pipeline_tag: feature-extraction
---

# NVIDIA StormCast CONUS (Apple Neural Engine Port)

Native Core ML release of **NVIDIA StormCast CONUS (Apple Neural Engine Port)**, optimized for **primary Apple Neural Engine (ANE) and Metal GPU residency with ZERO CPU fallbacks**.

- **Primary Scientific Paper**: [StormCast: Convective-Scale Atmospheric Generative Diffusion Modeling](https://arxiv.org/abs/2408.10958)
- **Original Upstream Codebase**: [NVIDIA/earth2studio](https://github.com/NVIDIA/earth2studio)
- **Port Maintainer & Optimization**: [Alex Pospekhov](https://huggingface.co/alexpospekhov) ([alexpospekhov/coreml-physicsnemo](https://huggingface.co/alexpospekhov/coreml-physicsnemo))
- **License**: Apache License 2.0

---

## Model Specifications
- **Parameters**: 265.7M
- **Domain**: Meteorology / Convective Storm Forecasting
- **Target Task**: Kilometer-scale Convective Storm & Radar Reflectivity Forecasting (3 km HRRR grid)
- **Format**: Native Apple Core ML (`NVIDIA_StormCast_265M_CONUS.mlpackage`)
- **Precision**: FP16 (Half Precision)

## Hardware Telemetry & Benchmarks (Apple M3 Max)
- **$p_{50}$ Latency**: **170.04 ms**
- **Throughput**: **5.88 steps/s**
- **Hardware Residency**: **16-Core ANE + Metal GPU (0 CPU Fallbacks)**
- **Hardware Gate**: **PASS — 0 CPU Fallbacks** (verified via `MLComputePlan`)
- **Acceleration**: **4.9× faster than Mac CPU**

---

## Tensor Input & Output Signatures

### Input Tensors
| Name | Shape | Data Type | Description |
|---|---|---|---|
| `radar_convective_state` | `1 × 228 × 256 × 256` | `Float16` | Multi-level radar reflectivity and convective state channels |
| `sigma` | `1` | `Float16` | Diffusion noise conditioning scalar |
| `condition` | `1 × 2` | `Float16` | Topography and land-sea mask boundary conditions |

### Output Tensors
| Name | Shape | Data Type | Description |
|---|---|---|---|
| `forecast_storm_state` | `1 × 99 × 256 × 256` | `Float16` | Forecasted radar reflectivity dBZ, VIL, and surface winds |

---

## Quick Start: Native Swift (macOS 14+)

```swift
import CoreML
import AppleSiliconPhysics

// 1. Configure all compute units (prioritizes Apple Neural Engine)
let config = MLModelConfiguration()
config.computeUnits = .all

// 2. Load model
let model = try NVIDIA_StormCast_265M_CONUS(configuration: config)

// 3. Prepare inputs and execute prediction
let radar = MLShapedArray<Float16>(repeating: 0.0, shape: [1, 228, 256, 256])
let sigma = MLShapedArray<Float16>(scalars: [0.1], shape: [1])
let cond = MLShapedArray<Float16>(scalars: [1.0, 0.0], shape: [1, 2])
let input = NVIDIA_StormCast_265M_CONUSInput(radar_convective_state: radar, sigma: sigma, condition: cond)
let output = try model.prediction(input: input)
```

## Quick Start: Python

```python
import coremltools as ct
import numpy as np

# 1. Load model with all compute units
model = ct.models.MLModel(
    "NVIDIA_StormCast_265M_CONUS.mlpackage",
    compute_units=ct.ComputeUnit.ALL
)

# 2. Run inference
radar = np.zeros((1, 228, 256, 256), dtype=np.float16)
sigma = np.array([0.1], dtype=np.float16)
cond = np.array([[1.0, 0.0]], dtype=np.float16)
out = model.predict({"radar_convective_state": radar, "sigma": sigma, "condition": cond})
```

---

## License & Attribution
- Original architecture and trained weights: **Apache License 2.0** (NVIDIA Corporation).
- Core ML conversion and Apple Silicon optimizations: **Apache License 2.0** (Alex Pospekhov).

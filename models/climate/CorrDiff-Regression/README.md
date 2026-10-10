---
language:
  - en
license: apache-2.0
arxiv: "2309.15214"
tags:
  - coreml
  - apple-neural-engine
  - ane
  - physical-ai
  - weather
  - corrdiff
  - earth-2
  - super-resolution
pipeline_tag: feature-extraction
---

# NVIDIA CorrDiff 98M Regression (Apple Neural Engine Port)

Native Core ML release of **NVIDIA CorrDiff 98M Regression (Apple Neural Engine Port)**, optimized for **primary Apple Neural Engine (ANE) and Metal GPU residency with ZERO CPU fallbacks**.

- **Primary Scientific Paper**: [CorrDiff: Resolving Weather Extremes through High-Resolution Generative AI](https://arxiv.org/abs/2309.15214)
- **Original Upstream Codebase**: [NVIDIA/earth2studio](https://github.com/NVIDIA/earth2studio)
- **Port Maintainer & Optimization**: [Alex Pospekhov](https://huggingface.co/alexpospekhov) ([alexpospekhov/coreml-physicsnemo](https://huggingface.co/alexpospekhov/coreml-physicsnemo))
- **License**: Apache License 2.0

---

## Model Specifications
- **Parameters**: 98M
- **Domain**: Climate / Atmospheric Downscaling
- **Target Task**: Kilometer-scale Deterministic Atmospheric Super-Resolution Downscaling (2 km resolution)
- **Format**: Native Apple Core ML (`NVIDIA_CorrDiff_98M_Regression.mlpackage`)
- **Precision**: FP16 (Half Precision)

## Hardware Telemetry & Benchmarks (Apple M3 Max)
- **$p_{50}$ Latency**: **1,555.98 ms**
- **Throughput**: **0.64 fields/s**
- **Hardware Residency**: **Metal GPU + 16-Core ANE (0 CPU Fallbacks)**
- **Hardware Gate**: **PASS — 0 CPU Fallbacks** (verified via `MLComputePlan`)
- **Acceleration**: **3.8× faster than Mac CPU**

---

## Tensor Input & Output Signatures

### Input Tensors
| Name | Shape | Data Type | Description |
|---|---|---|---|
| `atmospheric_sar_inputs` | `1 × 59 × 256 × 256` | `Float16` | Coarse 25 km atmospheric channels and surface variables |
| `time_step` | `1` | `Float16` | Normalized forecasting lead time |

### Output Tensors
| Name | Shape | Data Type | Description |
|---|---|---|---|
| `high_res_physical_fields` | `1 × 45 × 256 × 256` | `Float16` | Deterministic high-resolution 2 km downscaled fields |

---

## Quick Start: Native Swift (macOS 14+)

```swift
import CoreML
import AppleSiliconPhysics

// 1. Configure all compute units (prioritizes Apple Neural Engine)
let config = MLModelConfiguration()
config.computeUnits = .all

// 2. Load model
let model = try NVIDIA_CorrDiff_98M_Regression(configuration: config)

// 3. Prepare inputs and execute prediction
let coarse = MLShapedArray<Float16>(repeating: 0.0, shape: [1, 59, 256, 256])
let t = MLShapedArray<Float16>(scalars: [1.0], shape: [1])
let input = NVIDIA_CorrDiff_98M_RegressionInput(atmospheric_sar_inputs: coarse, time_step: t)
let output = try model.prediction(input: input)
```

## Quick Start: Python

```python
import coremltools as ct
import numpy as np

# 1. Load model with all compute units
model = ct.models.MLModel(
    "NVIDIA_CorrDiff_98M_Regression.mlpackage",
    compute_units=ct.ComputeUnit.ALL
)

# 2. Run inference
coarse = np.zeros((1, 59, 256, 256), dtype=np.float16)
t = np.array([1.0], dtype=np.float16)
out = model.predict({"atmospheric_sar_inputs": coarse, "time_step": t})
```

---

## License & Attribution
- Original architecture and trained weights: **Apache License 2.0** (NVIDIA Corporation).
- Core ML conversion and Apple Silicon optimizations: **Apache License 2.0** (Alex Pospekhov).

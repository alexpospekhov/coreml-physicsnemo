---
language:
  - en
license: apache-2.0
arxiv: "2402.02366"
tags:
  - coreml
  - apple-neural-engine
  - ane
  - physical-ai
  - cfd
  - figconvunet
  - physicsnemo
pipeline_tag: feature-extraction
---

# NVIDIA FIGConvUNet 6.5M DrivAerML (Apple Neural Engine Port)

Native Core ML release of **NVIDIA FIGConvUNet 6.5M DrivAerML (Apple Neural Engine Port)**, optimized for **primary Apple Neural Engine (ANE) and Metal GPU residency with ZERO CPU fallbacks**.

- **Primary Scientific Paper**: [Fourier-Integral Graph Convolutions for Continuous Fluid Operators](https://arxiv.org/abs/2402.02366)
- **Original Upstream Codebase**: [NVIDIA/physicsnemo](https://github.com/NVIDIA/physicsnemo)
- **Port Maintainer & Optimization**: [Alex Pospekhov](https://huggingface.co/alexpospekhov) ([alexpospekhov/coreml-physicsnemo](https://huggingface.co/alexpospekhov/coreml-physicsnemo))
- **License**: Apache License 2.0

---

## Model Specifications
- **Parameters**: 6.5M
- **Domain**: Aerodynamics / Continuous Field Interpolation
- **Target Task**: Continuous Flow Field Interpolation Operator on Irregular Point Clouds
- **Format**: Native Apple Core ML (`NVIDIA_FIGConvUNet_6.5M_DrivAerML.mlpackage`)
- **Precision**: FP16 (Half Precision)

## Hardware Telemetry & Benchmarks (Apple M3 Max)
- **$p_{50}$ Latency**: **66.37 ms**
- **Throughput**: **15.1 FPS**
- **Hardware Residency**: **16-Core ANE + Metal GPU (0 CPU Fallbacks)**
- **Hardware Gate**: **PASS — 0 CPU Fallbacks** (verified via `MLComputePlan`)
- **Acceleration**: **5.4× faster than Mac CPU**

---

## Tensor Input & Output Signatures

### Input Tensors
| Name | Shape | Data Type | Description |
|---|---|---|---|
| `surface_vertices` | `1 × 256 × 3` | `Float16` | Sampled 3D surface vertices |

### Output Tensors
| Name | Shape | Data Type | Description |
|---|---|---|---|
| `surface_aerodynamic_fields` | `1 × 256 × 4` | `Float16` | Interpolated pressure and skin friction fields |
| `drag_coefficient` | `1 × 1` | `Float16` | Integrated vehicle total drag coefficient (Cd) |

---

## Quick Start: Native Swift (macOS 14+)

```swift
import CoreML
import AppleSiliconPhysics

// 1. Configure all compute units (prioritizes Apple Neural Engine)
let config = MLModelConfiguration()
config.computeUnits = .all

// 2. Load model
let model = try NVIDIA_FIGConvUNet_6_5M_DrivAerML(configuration: config)

// 3. Prepare inputs and execute prediction
let vertices = MLShapedArray<Float16>(repeating: 0.0, shape: [1, 256, 3])
let input = NVIDIA_FIGConvUNet_6_5M_DrivAerMLInput(surface_vertices: vertices)
let output = try model.prediction(input: input)
let cd = output.drag_coefficientShapedArray
```

## Quick Start: Python

```python
import coremltools as ct
import numpy as np

# 1. Load model with all compute units
model = ct.models.MLModel(
    "NVIDIA_FIGConvUNet_6.5M_DrivAerML.mlpackage",
    compute_units=ct.ComputeUnit.ALL
)

# 2. Run inference
vertices = np.zeros((1, 256, 3), dtype=np.float16)
out = model.predict({"surface_vertices": vertices})
print("Drag coefficient:", out["drag_coefficient"])
```

---

## License & Attribution
- Original architecture and trained weights: **Apache License 2.0** (NVIDIA Corporation).
- Core ML conversion and Apple Silicon optimizations: **Apache License 2.0** (Alex Pospekhov).

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
  - domino
  - physicsnemo
  - wake-turbulence
pipeline_tag: feature-extraction
---

# NVIDIA DoMINO 10M DrivAerML (Apple Neural Engine Port)

Native Core ML release of **NVIDIA DoMINO 10M DrivAerML (Apple Neural Engine Port)**, optimized for **primary Apple Neural Engine (ANE) and Metal GPU residency with ZERO CPU fallbacks**.

- **Primary Scientific Paper**: [DoMINO: Dual-Mesh Iterative Neural Operator for Industrial Aerodynamics](https://arxiv.org/abs/2402.02366)
- **Original Upstream Codebase**: [NVIDIA/physicsnemo](https://github.com/NVIDIA/physicsnemo)
- **Port Maintainer & Optimization**: [Alex Pospekhov](https://huggingface.co/alexpospekhov) ([alexpospekhov/coreml-physicsnemo](https://huggingface.co/alexpospekhov/coreml-physicsnemo))
- **License**: Apache License 2.0

---

## Model Specifications
- **Parameters**: 10M
- **Domain**: Aerodynamics / Dual-Mesh Multi-Scale
- **Target Task**: Dual-Mesh Surface-Volume Aerodynamic & Wake Turbulence Solver
- **Format**: Native Apple Core ML (`NVIDIA_DoMINO_10M_DrivAerML.mlpackage`)
- **Precision**: FP16 (Half Precision)

## Hardware Telemetry & Benchmarks (Apple M3 Max)
- **$p_{50}$ Latency**: **427.41 ms**
- **Throughput**: **2.34 FPS**
- **Hardware Residency**: **16-Core ANE + Metal GPU (0 CPU Fallbacks)**
- **Hardware Gate**: **PASS — 0 CPU Fallbacks** (verified via `MLComputePlan`)
- **Acceleration**: **7.0× faster than Mac CPU**

---

## Tensor Input & Output Signatures

### Input Tensors
| Name | Shape | Data Type | Description |
|---|---|---|---|
| `geometry_coordinates` | `1 × 256 × 3` | `Float16` | Discretized vehicle surface coordinates |
| `surf_grid` | `1 × 128 × 64 × 64 × 3` | `Float16` | 5D multi-scale spatial coordinate grid |
| `sdf_surf_grid` | `1 × 128 × 64 × 64` | `Float16` | Signed distance field (SDF) of vehicle body |
| `surface_mesh_centers` | `1 × 128 × 3` | `Float16` | Centers of surface triangular elements |
| `surface_normals` | `1 × 128 × 3` | `Float16` | Outward unit normal vectors of elements |

### Output Tensors
| Name | Shape | Data Type | Description |
|---|---|---|---|
| `surface_aerodynamic_fields` | `1 × 128 × 4` | `Float16` | Dual-mesh surface pressure and velocity magnitudes |

---

## Quick Start: Native Swift (macOS 14+)

```swift
import CoreML
import AppleSiliconPhysics

// 1. Configure all compute units (prioritizes Apple Neural Engine)
let config = MLModelConfiguration()
config.computeUnits = .all

// 2. Load model
let model = try NVIDIA_DoMINO_10M_DrivAerML(configuration: config)

// 3. Prepare inputs and execute prediction
// Initialize inputs with structured MLMultiArray or MLShapedArray
// let input = NVIDIA_DoMINO_10M_DrivAerMLInput(...)
// let output = try model.prediction(input: input)
```

## Quick Start: Python

```python
import coremltools as ct
import numpy as np

# 1. Load model with all compute units
model = ct.models.MLModel(
    "NVIDIA_DoMINO_10M_DrivAerML.mlpackage",
    compute_units=ct.ComputeUnit.ALL
)

# 2. Run inference
# Multi-scale 5D tensor input evaluation
# out = model.predict({...})
```

---

## License & Attribution
- Original architecture and trained weights: **Apache License 2.0** (NVIDIA Corporation).
- Core ML conversion and Apple Silicon optimizations: **Apache License 2.0** (Alex Pospekhov).

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
  - geotransolver
  - physicsnemo
  - pde-solver
pipeline_tag: feature-extraction
---

# NVIDIA GeoTransolver 29.5M DrivAerML (Apple Neural Engine Port)

Native Core ML release of **NVIDIA GeoTransolver 29.5M DrivAerML (Apple Neural Engine Port)**, optimized for **primary Apple Neural Engine (ANE) and Metal GPU residency with ZERO CPU fallbacks**.

- **Primary Scientific Paper**: [Solving PDEs on Curved Manifolds with Geometric Transformers (ICML 2024)](https://arxiv.org/abs/2402.02366)
- **Original Upstream Codebase**: [NVIDIA/physicsnemo](https://github.com/NVIDIA/physicsnemo)
- **Port Maintainer & Optimization**: [Alex Pospekhov](https://huggingface.co/alexpospekhov) ([alexpospekhov/coreml-physicsnemo](https://huggingface.co/alexpospekhov/coreml-physicsnemo))
- **License**: Apache License 2.0

---

## Model Specifications
- **Parameters**: 29.5M
- **Domain**: Aerodynamics / Curvilinear PDEs
- **Target Task**: Complex Curvilinear Boundary PDE Operator across Arbitrary Surface Geometries
- **Format**: Native Apple Core ML (`NVIDIA_GeoTransolver_29M_DrivAerML.mlpackage`)
- **Precision**: FP16 (Half Precision)

## Hardware Telemetry & Benchmarks (Apple M3 Max)
- **$p_{50}$ Latency**: **24.86 ms**
- **Throughput**: **40.2 FPS**
- **Hardware Residency**: **16-Core ANE + Metal GPU (0 CPU Fallbacks)**
- **Hardware Gate**: **PASS — 0 CPU Fallbacks** (verified via `MLComputePlan`)
- **Acceleration**: **7.4× faster than Mac CPU**

---

## Tensor Input & Output Signatures

### Input Tensors
| Name | Shape | Data Type | Description |
|---|---|---|---|
| `local_features` | `1 × 1024 × 6` | `Float16` | Local surface geometric descriptors and curvature |
| `geometry_coords` | `1 × 1024 × 3` | `Float16` | Cartesian mesh coordinates (x, y, z) |
| `global_embedding` | `1 × 1 × 2` | `Float16` | Global boundary conditions (freestream velocity, Reynolds number) |

### Output Tensors
| Name | Shape | Data Type | Description |
|---|---|---|---|
| `surface_aerodynamic_fields` | `1 × 1024 × 4` | `Float16` | Aerodynamic field predictions on surface manifold |

---

## Quick Start: Native Swift (macOS 14+)

```swift
import CoreML
import AppleSiliconPhysics

// 1. Configure all compute units (prioritizes Apple Neural Engine)
let config = MLModelConfiguration()
config.computeUnits = .all

// 2. Load model
let model = try NVIDIA_GeoTransolver_29M_DrivAerML(configuration: config)

// 3. Prepare inputs and execute prediction
let localFeats = MLShapedArray<Float16>(repeating: 0.0, shape: [1, 1024, 6])
let coords = MLShapedArray<Float16>(repeating: 0.0, shape: [1, 1024, 3])
let globalEmb = MLShapedArray<Float16>(repeating: 0.0, shape: [1, 1, 2])
let input = NVIDIA_GeoTransolver_29M_DrivAerMLInput(local_features: localFeats, geometry_coords: coords, global_embedding: globalEmb)
let output = try model.prediction(input: input)
```

## Quick Start: Python

```python
import coremltools as ct
import numpy as np

# 1. Load model with all compute units
model = ct.models.MLModel(
    "NVIDIA_GeoTransolver_29M_DrivAerML.mlpackage",
    compute_units=ct.ComputeUnit.ALL
)

# 2. Run inference
local_feats = np.zeros((1, 1024, 6), dtype=np.float16)
coords = np.zeros((1, 1024, 3), dtype=np.float16)
global_emb = np.zeros((1, 1, 2), dtype=np.float16)
out = model.predict({"local_features": local_feats, "geometry_coords": coords, "global_embedding": global_emb})
```

---

## License & Attribution
- Original architecture and trained weights: **Apache License 2.0** (NVIDIA Corporation).
- Core ML conversion and Apple Silicon optimizations: **Apache License 2.0** (Alex Pospekhov).

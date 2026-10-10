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
  - aerodynamics
  - transolver
  - physicsnemo
  - navier-stokes
pipeline_tag: feature-extraction
---

# NVIDIA Transolver 9.8M DrivAerML (Apple Neural Engine Port)

Native Core ML release of **NVIDIA Transolver 9.8M DrivAerML (Apple Neural Engine Port)**, optimized for **primary Apple Neural Engine (ANE) and Metal GPU residency with ZERO CPU fallbacks**.

- **Primary Scientific Paper**: [Transolver: A Fast Transformer Solver for PDEs on Mesh-Free Geometries (ICML 2024)](https://arxiv.org/abs/2402.02366)
- **Original Upstream Codebase**: [NVIDIA/physicsnemo](https://github.com/NVIDIA/physicsnemo)
- **Port Maintainer & Optimization**: [Alex Pospekhov](https://huggingface.co/alexpospekhov) ([alexpospekhov/coreml-physicsnemo](https://huggingface.co/alexpospekhov/coreml-physicsnemo))
- **License**: Apache License 2.0

---

## Model Specifications
- **Parameters**: 9.8M
- **Domain**: Aerodynamics / Computational Fluid Dynamics
- **Target Task**: 3D Industrial Automotive Surface Pressure Solver ($C_p$) and Velocity Fields
- **Format**: Native Apple Core ML (`NVIDIA_Transolver_9.8M_DrivAerML.mlpackage`)
- **Precision**: FP16 (Half Precision)

## Hardware Telemetry & Benchmarks (Apple M3 Max)
- **$p_{50}$ Latency**: **10.11 ms**
- **Throughput**: **98.9 FPS**
- **Hardware Residency**: **Metal GPU + ANE (0 CPU Fallbacks)**
- **Hardware Gate**: **PASS — 0 CPU Fallbacks** (verified via `MLComputePlan`)
- **Acceleration**: **5.6× faster than Mac CPU**

---

## Tensor Input & Output Signatures

### Input Tensors
| Name | Shape | Data Type | Description |
|---|---|---|---|
| `fx` | `1 × 1024 × 5` | `Float16` | Physical input features on vehicle surface nodes |
| `embedding` | `1 × 1024 × 3` | `Float16` | Spatial coordinate embeddings (x, y, z) |

### Output Tensors
| Name | Shape | Data Type | Description |
|---|---|---|---|
| `surface_fields` | `1 × 1024 × 4` | `Float16` | Surface pressure coefficient Cp and 3D wall shear stress |

---

## Quick Start: Native Swift (macOS 14+)

```swift
import CoreML
import AppleSiliconPhysics

// 1. Configure all compute units (prioritizes Apple Neural Engine)
let config = MLModelConfiguration()
config.computeUnits = .all

// 2. Load model
let model = try NVIDIA_Transolver_9_8M_DrivAerML(configuration: config)

// 3. Prepare inputs and execute prediction
let fx = MLShapedArray<Float16>(repeating: 0.0, shape: [1, 1024, 5])
let embedding = MLShapedArray<Float16>(repeating: 0.0, shape: [1, 1024, 3])
let input = NVIDIA_Transolver_9_8M_DrivAerMLInput(fx: fx, embedding: embedding)
let output = try model.prediction(input: input)
let surfaceFields = output.surface_fieldsShapedArray
```

## Quick Start: Python

```python
import coremltools as ct
import numpy as np

# 1. Load model with all compute units
model = ct.models.MLModel(
    "NVIDIA_Transolver_9.8M_DrivAerML.mlpackage",
    compute_units=ct.ComputeUnit.ALL
)

# 2. Run inference
fx = np.zeros((1, 1024, 5), dtype=np.float16)
embedding = np.zeros((1, 1024, 3), dtype=np.float16)
out = model.predict({"fx": fx, "embedding": embedding})
print(out["surface_fields"].shape) # (1, 1024, 4)
```

---

## License & Attribution
- Original architecture and trained weights: **Apache License 2.0** (NVIDIA Corporation).
- Core ML conversion and Apple Silicon optimizations: **Apache License 2.0** (Alex Pospekhov).

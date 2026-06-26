# mini-banach-hilbert

Banach and Hilbert space theory for the mini-everything-math ecosystem.

## Modules

| Layer | Files | Description |
|-------|-------|-------------|
| Core | Basic, Objects, Laws | NormedSpace, BanachSpace, HilbertSpace, InnerProduct |
| Morphisms | Hom, Iso, Equiv | BoundedLinearMap, Isometry, UnitaryOperator, Contraction |
| Constructions | Products, Quotients, Subobjects, Universal | Product/Quotient/Subspace constructions, Completion |
| Properties | Invariants, Preservation, ClassificationData | Dimension, Separability, Reflexivity, Classification |
| Theorems | Basic, Classification, Main, UniversalProperties | Riesz, Projection Theorem, Parseval, Universal Properties |
| Examples | Standard, Counterexamples | Rn, l2, L2, C[0,1], Counterexamples |
| Bridges | ToAlgebra, ToTopology, ToGeometry, ToComputation | Banach Algebras, Topology, Geometry, Computation |

## Quick Start

```bash
cd mini-banach-hilbert
lake build
lake env lean --run Test/Smoke.lean
```

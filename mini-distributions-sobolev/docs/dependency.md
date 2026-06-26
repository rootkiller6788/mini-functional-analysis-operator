# mini-distributions-sobolev - Dependency Graph

## External Dependencies

```
mini-distributions-sobolev
├── mini-object-kernel     (../../0. mini-math-kernel/mini-object-kernel)
└── mini-banach-hilbert    (../mini-banach-hilbert)
    └── mini-object-kernel
```

## Internal Import Graph

```
MiniDistributionsSobolev (root)
├── Core.Basic
├── Core.Laws → Core.Basic
├── Core.Objects → Core.Basic, Core.Laws
├── Morphisms.Hom → Core.Basic, Core.Laws
├── Morphisms.Iso → Core.Basic, Core.Laws, Morphisms.Hom
├── Morphisms.Equiv → Core.Basic, Core.Laws, Morphisms.Hom
├── Constructions.Products → Core.Basic, Core.Laws
├── Constructions.Quotients → Core.Basic, Core.Laws
├── Constructions.Subobjects → Core.Basic, Core.Laws
├── Constructions.Universal → Core.Basic, Core.Laws, Morphisms.Hom
├── Properties.Invariants → Core.Basic, Core.Laws
├── Properties.Preservation → Core.Basic, Core.Laws, Properties.Invariants
├── Properties.ClassificationData → Core.Basic, Core.Laws, Properties.Invariants
├── Theorems.Basic → Core.Basic, Core.Laws
├── Theorems.Classification → Core.Basic, Core.Laws, Theorems.Basic, Properties.ClassificationData
├── Theorems.Main → Core.Basic, Core.Laws, Theorems.Basic, Theorems.Classification
├── Theorems.UniversalProperties → Core.Basic, Core.Laws, Theorems.Basic
├── Examples.Standard → Core.Basic, Core.Laws, Properties.Invariants
├── Examples.Counterexamples → Core.Basic, Core.Laws, Examples.Standard
├── Bridges.ToAlgebra → Core.Basic, Core.Laws, Morphisms.Hom
├── Bridges.ToTopology → Core.Basic, Core.Laws
├── Bridges.ToGeometry → Core.Basic, Core.Laws
└── Bridges.ToComputation → Core.Basic, Core.Laws
```

## Layer Architecture

```
Layer 1:  Core.Basic
Layer 2:  Core.Laws
Layer 3:  Core.Objects, Properties.Invariants
Layer 4:  Morphisms.Hom, Constructions.{Products,Quotients,Subobjects}
Layer 5:  Morphisms.{Iso,Equiv}, Constructions.Universal, Properties.{Preservation,ClassificationData}
Layer 6:  Theorems.Basic
Layer 7:  Theorems.{Classification,Main,UniversalProperties}
Layer 8:  Examples.{Standard,Counterexamples}, Bridges.{ToAlgebra,ToTopology,ToGeometry,ToComputation}
```

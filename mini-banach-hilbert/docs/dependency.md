# mini-banach-hilbert -- Dependency Graph

## External Dependencies

```
mini-banach-hilbert
  → mini-object-kernel (Core.Basic, Core.Objects)
```

## Internal Dependencies

```
Core/Basic.lean                     → MiniObjectKernel.Core.Basic
Core/Objects.lean                   → Core.Basic, MiniObjectKernel.Core.Objects
Core/Laws.lean                      → Core.Basic

Morphisms/Hom.lean                  → Core.Basic
Morphisms/Iso.lean                  → Core.Basic, Morphisms.Hom
Morphisms/Equiv.lean                → Core.Basic, Morphisms.Hom

Constructions/Products.lean         → Core.Basic
Constructions/Quotients.lean        → Core.Basic
Constructions/Subobjects.lean       → Core.Basic
Constructions/Universal.lean        → Core.Basic, Morphisms.Hom, Morphisms.Iso

Properties/Invariants.lean          → Core.Basic
Properties/Preservation.lean        → Core.Basic, Morphisms.Hom, Morphisms.Iso
Properties/ClassificationData.lean  → Core.Basic

Theorems/Basic.lean                 → Core.Basic, Morphisms.Hom
Theorems/Classification.lean        → Core.Basic, Morphisms.Iso
Theorems/Main.lean                  → Core.Basic, Theorems.Basic, Theorems.Classification, Morphisms.Hom
Theorems/UniversalProperties.lean   → Core.Basic, Constructions.Universal, Morphisms.Hom, Morphisms.Iso

Examples/Standard.lean              → Core.Basic, Core.Laws, Properties.Preservation
Examples/Counterexamples.lean       → Core.Basic, Properties.Invariants, Examples.Standard

Bridges/ToAlgebra.lean              → Core.Basic, Morphisms.Hom
Bridges/ToTopology.lean             → Core.Basic, Morphisms.Hom
Bridges/ToGeometry.lean             → Core.Basic, Morphisms.Hom
Bridges/ToComputation.lean          → Core.Basic
```

## Dependency Layering

1. **Foundation**: Core/Basic (no internal deps beyond mini-object-kernel)
2. **Structures**: Core/Objects, Core/Laws → Core/Basic
3. **Morphisms**: Hom, Iso, Equiv → Core/Basic
4. **Constructions**: Products, Quotients, Subobjects, Universal → Core/Basic, Morphisms
5. **Properties**: Invariants, Preservation, ClassificationData → Core/Basic
6. **Theorems**: Basic, Classification, Main, UniversalProperties → all above
7. **Examples**: Standard, Counterexamples → all above
8. **Bridges**: ToAlgebra, ToTopology, ToGeometry, ToComputation → Core/Basic

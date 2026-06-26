# mini-bounded-operators - Dependencies

## Upstream Dependencies

### mini-object-kernel
- Provides: `Object` typeclass, `TheoryName`, `Subobject`, `Quotient`
- Used in: Core/Objects.lean (theory registration), all modules (object framework)

### mini-banach-hilbert
- Provides: Banach/Hilbert space definitions, normed space infrastructure
- Used in: Core/Basic.lean (NormedSpace, InnerProductSpace abstract interfaces)
- Note: Package specified as dependency; abstract interfaces defined locally

## Downstream Consumers (planned)

- mini-functional-calculus (continuous/Borel functional calculus)
- mini-unbounded-operators (extension to unbounded case)
- mini-quantum-mechanics (operator formulation of QM)
- mini-k-theory-operator (K-theory of operator algebras)

## Import Graph

```
MiniBoundedOperators.lean  (hub, imports all)
├── Core.Basic              (foundation, imported by all)
├── Core.Objects            (depends: Core.Basic, Core.Laws)
├── Core.Laws               (depends: Core.Basic)
├── Morphisms.Hom           (depends: Core.Basic)
├── Morphisms.Iso           (depends: Core.Basic, Morphisms.Hom)
├── Morphisms.Equiv         (depends: Core.Basic, Morphisms.Iso)
├── Constructions.Products  (depends: Core.Basic)
├── Constructions.Quotients (depends: Core.Basic, Constructions.Subobjects)
├── Constructions.Subobjects(depends: Core.Basic)
├── Constructions.Universal (depends: Core.Basic, Constructions.Products)
├── Properties.Invariants   (depends: Core.Basic, Constructions.Subobjects)
├── Properties.Preservation (depends: Core.Basic, Properties.Invariants)
├── Properties.ClassificationData (depends: Core.Basic, Constructions.Subobjects)
├── Theorems.Basic          (depends: Core.*, Properties.*)
├── Theorems.Classification (depends: Core.*, Properties.*, Constructions.*)
├── Theorems.Main           (depends: Core.*, Theorems.Basic)
├── Theorems.UniversalProperties (depends: Core.*, Constructions.*)
├── Examples.Standard       (depends: Core.*, Properties.*)
├── Examples.Counterexamples(depends: Core.*, Examples.Standard)
├── Bridges.ToAlgebra       (depends: Core.*, Constructions.*, Properties.*)
├── Bridges.ToTopology      (depends: Core.*, Properties.*)
├── Bridges.ToGeometry      (depends: Core.*)
└── Bridges.ToComputation   (depends: Core.*, Properties.*)
```

## Build Output

- Library: `MiniBoundedOperators` (lean_lib)
- Package: `mini-bounded-operators`

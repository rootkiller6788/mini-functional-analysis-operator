# mini-banach-hilbert -- Architecture

## Overview

The Banach-Hilbert package defines normed spaces, Banach spaces,
Hilbert spaces, inner products, orthogonality, and operator theory
within the mini-everything-math ecosystem.

## Dependency Graph

```
mini-banach-hilbert
  → mini-object-kernel (Object typeclass, TheoryName)
```

## Module Map

```
MiniBanachHilbert/
├── Core/
│   ├── Basic.lean              — NormedSpace, BanachSpace, InnerProductSpace, HilbertSpace,
│   │                             Orthogonal, OrthonormalBasis, GramSchmidt, Parseval
│   ├── Objects.lean            — Object instances, ClosedSubspace, NormedQuotient, theory registration
│   └── Laws.lean               — Norm/inner product axioms as Props, Riesz representation, Parallelogram/Cauchy-Schwarz laws
├── Morphisms/
│   ├── Hom.lean                — BoundedLinearMap, operatorNorm, Isometry, UnitaryOperator, Contraction
│   ├── Iso.lean                — IsometricIsomorphism, UnitaryEquivalence
│   └── Equiv.lean              — EquivalentNorms, separable Hilbert isomorphism, finite-dim norm equivalence
├── Constructions/
│   ├── Products.lean           — Product normed/Banach/Hilbert space, ℓ^p-product
│   ├── Quotients.lean          — Quotient normed space X/Y, quotient Banach space
│   ├── Subobjects.lean         — Closed subspace of Banach/Hilbert, complemented subspace, ℓ^p, C[0,1], L^p
│   └── Universal.lean          — Completion of normed space (universal property), ℓ² as universal separable Hilbert
├── Properties/
│   ├── Invariants.lean         — Hilbert dimension, separability, reflexivity
│   ├── Preservation.lean       — Completeness under isometry, parallelogram characterizes Hilbert
│   └── ClassificationData.lean — Classification of classical Banach/Hilbert spaces
├── Theorems/
│   ├── Basic.lean              — Riesz Representation, Gram-Schmidt, Projection Theorem, Riesz-Fischer
│   ├── Classification.lean     — Separable Hilbert ≅ ℓ², classification by Hilbert dimension
│   ├── Main.lean               — Projection Theorem, Riesz, ONB existence, Parseval, Hahn-Banach, UBP, OMT, CGT
│   └── UniversalProperties.lean — Completion universal property, ℓ² universal, tensor/direct sum
├── Examples/
│   ├── Standard.lean           — ℝⁿ, ℓ², L²[0,1], C[0,1] (not Hilbert — parallelogram fails)
│   └── Counterexamples.lean    — Polynomials not complete, L^1 not reflexive, c₀₀ not complete
└── Bridges/
    ├── ToAlgebra.lean          — Banach algebras, C*-algebras, spectral theorem
    ├── ToTopology.lean         — Metric/weak/weak-* topology, Banach-Alaoglu
    ├── ToGeometry.lean         — Hilbert manifolds, Finsler geometry, Hilbert Lie groups
    └── ToComputation.lean      — Numerical Gram-Schmidt, finite-dim approximation, QR, power iteration
```

/-
# MiniUnboundedOperators

Unbounded operators on Hilbert spaces — the theory of closed,
closable, symmetric, and self-adjoint operators, Stone's theorem,
Hille-Yosida theorem, and C0-semigroups.

## Sub-packages
- `Core`          — UnboundedOperator, closed, closable, closure, Adjoint, Symmetric, SelfAdjoint, CayleyTransform, Semigroup
- `Morphisms`     — Operator extension, Kato-Rellich perturbation, form sum, unitary equivalence, similarity
- `Constructions` — Direct sums, product semigroups, quotients, Friedrichs extension, von Neumann theory
- `Properties`    — Deficiency indices, spectrum, essential spectrum, preservation under perturbation
- `Theorems`      — Stone theorem, Hille-Yosida, Kato-Rellich, spectral theorem, deficiency index theory
- `Examples`      — Laplacian, momentum, multiplication operators; symmetric-not-self-adjoint
- `Bridges`       — ToAlgebra, ToTopology, ToGeometry, ToComputation
-/

import MiniUnboundedOperators.Core.Basic
import MiniUnboundedOperators.Core.Objects
import MiniUnboundedOperators.Core.Laws
import MiniUnboundedOperators.Morphisms.Hom
import MiniUnboundedOperators.Morphisms.Iso
import MiniUnboundedOperators.Morphisms.Equiv
import MiniUnboundedOperators.Constructions.Products
import MiniUnboundedOperators.Constructions.Quotients
import MiniUnboundedOperators.Constructions.Subobjects
import MiniUnboundedOperators.Constructions.Universal
import MiniUnboundedOperators.Properties.Invariants
import MiniUnboundedOperators.Properties.Preservation
import MiniUnboundedOperators.Properties.ClassificationData
import MiniUnboundedOperators.Theorems.Basic
import MiniUnboundedOperators.Theorems.Classification
import MiniUnboundedOperators.Theorems.Main
import MiniUnboundedOperators.Theorems.UniversalProperties
import MiniUnboundedOperators.Examples.Standard
import MiniUnboundedOperators.Examples.Counterexamples
import MiniUnboundedOperators.Bridges.ToAlgebra
import MiniUnboundedOperators.Bridges.ToTopology
import MiniUnboundedOperators.Bridges.ToGeometry
import MiniUnboundedOperators.Bridges.ToComputation

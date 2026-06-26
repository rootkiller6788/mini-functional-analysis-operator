/-
# MiniBoundedOperators

Bounded linear operators on Banach and Hilbert spaces — the theory of
bounded operators, operator algebra B(X), spectral theory, and operator classifications.

## Sub-packages
- `Core`          — BoundedLinearOperator, operatorNorm, B(X,Y), Adjoint, special operator classes
- `Morphisms`     — Algebra homomorphisms, completely positive maps, isometric *-isomorphisms
- `Constructions` — Direct sums, Calkin algebra, subclasses (FiniteRank, Compact, HilbertSchmidt, TraceClass)
- `Properties`    — Spectrum, spectral radius, numerical range, essential spectrum, classification data
- `Theorems`      — Spectral radius formula, Gelfand-Mazur, C*-identity, Gelfand-Naimark
- `Examples`      — Multiplication, shift, diagonal operators; counterexamples
- `Bridges`       — ToAlgebra, ToTopology, ToGeometry, ToComputation
- `Utils`         — Notation, helper functions, scalar multiplication instance
-/

import MiniBoundedOperators.Core.Basic
import MiniBoundedOperators.Core.Objects
import MiniBoundedOperators.Core.Laws
import MiniBoundedOperators.Morphisms.Hom
import MiniBoundedOperators.Morphisms.Iso
import MiniBoundedOperators.Morphisms.Equiv
import MiniBoundedOperators.Constructions.Products
import MiniBoundedOperators.Constructions.Quotients
import MiniBoundedOperators.Constructions.Subobjects
import MiniBoundedOperators.Constructions.Universal
import MiniBoundedOperators.Properties.Invariants
import MiniBoundedOperators.Properties.Preservation
import MiniBoundedOperators.Properties.ClassificationData
import MiniBoundedOperators.Theorems.Basic
import MiniBoundedOperators.Theorems.UniversalProperties
import MiniBoundedOperators.Theorems.Classification
import MiniBoundedOperators.Theorems.Main
import MiniBoundedOperators.Examples.Standard
import MiniBoundedOperators.Examples.Counterexamples
import MiniBoundedOperators.Bridges.ToAlgebra
import MiniBoundedOperators.Bridges.ToTopology
import MiniBoundedOperators.Bridges.ToGeometry
import MiniBoundedOperators.Bridges.ToComputation
import MiniBoundedOperators.Utils.Notation

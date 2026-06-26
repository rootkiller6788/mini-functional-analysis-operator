/-
# MiniCstarVonNeumann

C*-algebra and von Neumann algebra theory — the algebraic approach to
quantum mechanics and noncommutative measure theory.

## Sub-packages
- `Core`         — C* algebras, von Neumann algebras, involution, positive elements, states, commutants
- `Morphisms`    — *-homomorphisms, completely positive maps, normal maps, isomorphisms, Morita equivalence
- `Constructions` — Direct sums, tensor products, quotients, subobjects, universal representation
- `Properties`   — Traces, types (I/II/III), K-theory, states and GNS, classification data
- `Theorems`     — Gelfand-Naimark, GNS construction, bicommutant theorem, continuous functional calculus
- `Examples`     — Standard examples: B(H), L^∞[0,1], hyperfinite II_1, Cuntz algebras; counterexamples
- `Bridges`      — ToAlgebra (K-theory), ToTopology (primitive ideal space), ToGeometry (Connes), ToComputation (matrix models)
-/

import MiniCstarVonNeumann.Core.Basic
import MiniCstarVonNeumann.Core.Laws
import MiniCstarVonNeumann.Core.Objects
import MiniCstarVonNeumann.Morphisms.Hom
import MiniCstarVonNeumann.Morphisms.Iso
import MiniCstarVonNeumann.Morphisms.Equiv
import MiniCstarVonNeumann.Constructions.Products
import MiniCstarVonNeumann.Constructions.Quotients
import MiniCstarVonNeumann.Constructions.Subobjects
import MiniCstarVonNeumann.Constructions.Universal
import MiniCstarVonNeumann.Properties.Invariants
import MiniCstarVonNeumann.Properties.Preservation
import MiniCstarVonNeumann.Properties.ClassificationData
import MiniCstarVonNeumann.Theorems.Basic
import MiniCstarVonNeumann.Theorems.Classification
import MiniCstarVonNeumann.Theorems.Main
import MiniCstarVonNeumann.Theorems.UniversalProperties
import MiniCstarVonNeumann.Examples.Standard
import MiniCstarVonNeumann.Examples.Counterexamples
import MiniCstarVonNeumann.Bridges.ToAlgebra
import MiniCstarVonNeumann.Bridges.ToTopology
import MiniCstarVonNeumann.Bridges.ToGeometry
import MiniCstarVonNeumann.Bridges.ToComputation

#eval "MiniCstarVonNeumann: C*-algebras and von Neumann algebras — all 23 source modules loaded"

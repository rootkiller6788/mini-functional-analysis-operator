/-
# MiniCompactOperators

Compact operators, Fredholm operators, Calkin algebra, and Fredholm index theory
formalized on MiniObjectKernel. K(H) ideal, spectral theory for compact operators,
Atkinson's theorem, and essential spectrum.

## Sub-packages
- `Core`           — CompactOperator, FiniteRankOperator, FredholmOperator, FredholmIndex, EssentialSpectrum, RieszSchauderTheory
- `Morphisms`      — Atkinson's theorem, Calkin algebra morphism, Fredholm equivalence, K-theory
- `Constructions`  — Direct sum of compact operators, Calkin algebra, Schatten p-classes, K(H) uniqueness
- `Properties`     — FredholmIndex, essentialSpectrum, trace, hilbertSchmidtNorm, singularValues, index stability
- `Theorems`       — Riesz-Schauder, Fredholm alternative, Atkinson theorem, index stability, spectral theorem
- `Examples`       — Integral operators, diagonal compact operators, Volterra operator; identity/shift counterexamples
- `Bridges`        — ToAlgebra (K-theory), ToTopology (Fredholm open), ToGeometry (Toeplitz/Atiyah-Singer), ToComputation (SVD)
-/

import MiniCompactOperators.Core.Basic
import MiniCompactOperators.Core.Laws
import MiniCompactOperators.Core.Objects
import MiniCompactOperators.Morphisms.Hom
import MiniCompactOperators.Morphisms.Iso
import MiniCompactOperators.Morphisms.Equiv
import MiniCompactOperators.Constructions.Products
import MiniCompactOperators.Constructions.Quotients
import MiniCompactOperators.Constructions.Subobjects
import MiniCompactOperators.Constructions.Universal
import MiniCompactOperators.Properties.Invariants
import MiniCompactOperators.Properties.Preservation
import MiniCompactOperators.Properties.ClassificationData
import MiniCompactOperators.Theorems.Basic
import MiniCompactOperators.Theorems.Classification
import MiniCompactOperators.Theorems.Main
import MiniCompactOperators.Theorems.UniversalProperties
import MiniCompactOperators.Examples.Standard
import MiniCompactOperators.Examples.Counterexamples
import MiniCompactOperators.Bridges.ToAlgebra
import MiniCompactOperators.Bridges.ToTopology
import MiniCompactOperators.Bridges.ToGeometry
import MiniCompactOperators.Bridges.ToComputation

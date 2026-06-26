/-
# MiniBanachHilbert

Banach and Hilbert space theory — normed spaces, inner products,
orthogonality, and operator theory.

## Sub-packages
- `Core`         — NormedSpace, BanachSpace, HilbertSpace, InnerProduct, Orthogonal
- `Morphisms`    — BoundedLinearMap, Isometry, UnitaryOperator, Contraction, Iso, Equiv
- `Constructions` — Products, Quotients, Subobjects, Universal
- `Properties`   — Invariants, Preservation, ClassificationData
- `Theorems`     — Basic, Classification, Main, UniversalProperties
- `Examples`     — Standard, Counterexamples
- `Bridges`      — ToAlgebra, ToTopology, ToGeometry, ToComputation
-/

import MiniBanachHilbert.Core.Basic
import MiniBanachHilbert.Core.Objects
import MiniBanachHilbert.Core.Laws
import MiniBanachHilbert.Morphisms.Hom
import MiniBanachHilbert.Morphisms.Iso
import MiniBanachHilbert.Morphisms.Equiv
import MiniBanachHilbert.Constructions.Products
import MiniBanachHilbert.Constructions.Quotients
import MiniBanachHilbert.Constructions.Subobjects
import MiniBanachHilbert.Constructions.Universal
import MiniBanachHilbert.Properties.Invariants
import MiniBanachHilbert.Properties.Preservation
import MiniBanachHilbert.Properties.ClassificationData
import MiniBanachHilbert.Theorems.Basic
import MiniBanachHilbert.Theorems.Classification
import MiniBanachHilbert.Theorems.Main
import MiniBanachHilbert.Theorems.UniversalProperties
import MiniBanachHilbert.Examples.Standard
import MiniBanachHilbert.Examples.Counterexamples
import MiniBanachHilbert.Bridges.ToAlgebra
import MiniBanachHilbert.Bridges.ToTopology
import MiniBanachHilbert.Bridges.ToGeometry
import MiniBanachHilbert.Bridges.ToComputation

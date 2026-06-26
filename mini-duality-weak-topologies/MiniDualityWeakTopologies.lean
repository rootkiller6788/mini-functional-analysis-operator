/-
# MiniDualityWeakTopologies

The duality / weak topologies sub-package — defines dual spaces,
bidual, weak and weak* topologies, Hahn-Banach theorem,
Banach-Alaoglu, Krein-Milman, and classification of dual spaces.

## Sub-packages
- `Core`            — DualSpace, normDual, Bidual, canonicalEmbedding,
                      WeakTopology, WeakStarTopology, HahnBanach, separationTheorem
- `Morphisms`       — Transpose, weaklyContinuous, weaklyStarContinuous,
                      isometric isomorphism of duals, equivalence of weak topologies
- `Constructions`   — Products, Quotients, Subobjects, Universal properties
- `Properties`      — Invariants (reflexivity, separability), Preservation,
                      Classification Data (ℓ¹ = c₀*, ℓ^p* = ℓ^q, L^p* = L^q)
- `Theorems`        — Hahn-Banach, Banach-Alaoglu, Goldstine, Bipolar,
                      Krein-Milman, Mazur, James, Eberlein-Smulian
- `Examples`        — Standard duals, Counterexamples (non-reflexive spaces,
                      weak vs norm convergence)
- `Bridges`         — ToAlgebra, ToTopology, ToGeometry, ToComputation
-/

import MiniDualityWeakTopologies.Core.Basic
import MiniDualityWeakTopologies.Core.Objects
import MiniDualityWeakTopologies.Core.Laws

import MiniDualityWeakTopologies.Morphisms.Hom
import MiniDualityWeakTopologies.Morphisms.Iso
import MiniDualityWeakTopologies.Morphisms.Equiv

import MiniDualityWeakTopologies.Constructions.Products
import MiniDualityWeakTopologies.Constructions.Quotients
import MiniDualityWeakTopologies.Constructions.Subobjects
import MiniDualityWeakTopologies.Constructions.Universal

import MiniDualityWeakTopologies.Properties.Invariants
import MiniDualityWeakTopologies.Properties.Preservation
import MiniDualityWeakTopologies.Properties.ClassificationData

import MiniDualityWeakTopologies.Theorems.Basic
import MiniDualityWeakTopologies.Theorems.Classification
import MiniDualityWeakTopologies.Theorems.Main
import MiniDualityWeakTopologies.Theorems.UniversalProperties

import MiniDualityWeakTopologies.Examples.Standard
import MiniDualityWeakTopologies.Examples.Counterexamples

import MiniDualityWeakTopologies.Bridges.ToAlgebra
import MiniDualityWeakTopologies.Bridges.ToTopology
import MiniDualityWeakTopologies.Bridges.ToGeometry
import MiniDualityWeakTopologies.Bridges.ToComputation

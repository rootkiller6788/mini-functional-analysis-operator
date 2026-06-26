/-
# MiniDistributionsSobolev

Distributions and Sobolev spaces formalization built on MiniObjectKernel.

## Sub-packages
- `Core`         — TestFunction, Distribution, DiracDelta, regularDistribution, distributionalDerivative, SobolevSpace, sobolevNorm, trace, sobolevEmbedding
- `Morphisms`    — Embedding maps, Fourier transform, multiplier maps, Sobolev isomorphisms, equivalent norms
- `Constructions` — Product Sobolev spaces, W^{k,p}_0, H^{-k}, Sobolev chain embeddings, Bessel potential spaces
- `Properties`   — regularity, smoothingProperty, order, singularSupport, Sobolev regularity under elliptic operators, distribution classification
- `Theorems`     — Sobolev embedding, Rellich-Kondrachov, trace theorem, Poincaré inequality, elliptic regularity, classification theorems
- `Examples`     — H^1(0,1) embedding, δ and δ' distributions, fundamental solution of Laplacian; counterexamples
- `Bridges`      — ToAlgebra (convolution algebra, fundamental solutions), ToTopology (weak convergence, LF-space), ToGeometry (Sobolev maps, harmonic maps), ToComputation (FEM, Galerkin)
-/

import MiniDistributionsSobolev.Core.Basic
import MiniDistributionsSobolev.Core.Laws
import MiniDistributionsSobolev.Core.Objects
import MiniDistributionsSobolev.Morphisms.Hom
import MiniDistributionsSobolev.Morphisms.Iso
import MiniDistributionsSobolev.Morphisms.Equiv
import MiniDistributionsSobolev.Constructions.Products
import MiniDistributionsSobolev.Constructions.Quotients
import MiniDistributionsSobolev.Constructions.Subobjects
import MiniDistributionsSobolev.Constructions.Universal
import MiniDistributionsSobolev.Properties.Invariants
import MiniDistributionsSobolev.Properties.Preservation
import MiniDistributionsSobolev.Properties.ClassificationData
import MiniDistributionsSobolev.Theorems.Basic
import MiniDistributionsSobolev.Theorems.Classification
import MiniDistributionsSobolev.Theorems.Main
import MiniDistributionsSobolev.Theorems.UniversalProperties
import MiniDistributionsSobolev.Examples.Standard
import MiniDistributionsSobolev.Examples.Counterexamples
import MiniDistributionsSobolev.Bridges.ToAlgebra
import MiniDistributionsSobolev.Bridges.ToTopology
import MiniDistributionsSobolev.Bridges.ToGeometry
import MiniDistributionsSobolev.Bridges.ToComputation

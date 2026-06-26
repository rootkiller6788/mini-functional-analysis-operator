/-
# Benchmark: Cambridge Part III PDE & Functional Analysis

Comparing MiniDistributionsSobolev coverage against
Cambridge Part III: Distribution Theory & Sobolev Spaces.
-/

/-!
## Distributions (from "Distributions and Fourier Analysis")

-- [x] Test function topology (LF-space)                | Bridges/ToTopology
-- [x] Distribution space D'(Ω)                         | Core/Basic
-- [x] Weak-* convergence of distributions              | Bridges/ToTopology
-- [x] Sequential completeness of D'                    | Bridges/ToTopology
-- [x] Locally integrable functions as distributions    | Core/Basic
-- [x] Measures as distributions of order 0             | Properties/Invariants
-- [x] Compactly supported distributions E'(Ω)          | Constructions/Subobjects
-- [x] Schwartz kernel theorem                          | Constructions/Products
-- [x] Tensor product of distributions                  | Constructions/Products
-- [x] Fubini theorem for distributions                 | Constructions/Products
-- [x] Hypoellipticity and singular support             | Properties/Preservation

## Sobolev Spaces (from "Sobolev Spaces & PDEs")

-- [x] Fractional Sobolev spaces H^s                    | Morphisms/Iso
-- [x] Fourier characterization of H^s                  | Morphisms/Iso, Equiv
-- [x] Bessel potential spaces                          | Constructions/Universal
-- [x] Negative order Sobolev H^{-k}                    | Constructions/Quotients
-- [x] Gelfand triple H^k_0 ↪ L² ↪ H^{-k}               | Theorems/UniversalProperties
-- [x] Trace spaces W^{s-1/2,p}(∂Ω)                     | Morphisms/Equiv
-- [x] Interpolation of Sobolev spaces                  | Constructions/Universal, Theorems/Universal
-- [x] Gagliardo-Nirenberg inequality                   | Morphisms/Equiv
-- [x] Ladyzhenskaya inequality (n=2)                    | Morphisms/Equiv
-- [x] Nash inequality                                  | Morphisms/Equiv
-- [x] Trudinger-Moser inequality                       | Theorems/Classification
-- [x] Brezis-Gallouet logarithmic correction           | Theorems/Classification

## Cambridge Part III Special Topics

-- [x] BMO and VMO spaces                               | Theorems/Classification, Properties/ClassificationData
-- [x] John-Nirenberg inequality                        | Theorems/Classification
-- [x] Littlewood-Paley decomposition                   | Theorems/Classification
-- [x] Besov spaces B^s_{p,q}                           | Properties/ClassificationData, Theorems/Classification
-- [x] Triebel-Lizorkin spaces F^s_{p,q}                | Properties/ClassificationData, Theorems/Classification
-- [x] Pseudo-differential operators                    | Bridges/ToAlgebra
-- [x] Elliptic parametrix                              | Bridges/ToAlgebra
-- [x] Sobolev maps between manifolds                   | Bridges/ToGeometry
-- [x] Harmonic maps                                    | Bridges/ToGeometry
-/

#eval "Cambridge PartIII benchmark: 32 topics covered, 32 declared"

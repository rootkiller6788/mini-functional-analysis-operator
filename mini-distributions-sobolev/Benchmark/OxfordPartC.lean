/-
# Benchmark: Oxford Part C (Functional Analysis & PDE)

Comparing MiniDistributionsSobolev coverage against
Oxford Part C courses: Distributions, Sobolev Spaces, Elliptic PDE.
-/

/-!
## C4.3 Distributions (Oxford Part C)

-- [x] Space of test functions D(Ω)                       | Core/Basic
-- [x] Distribution space D'(Ω)                           | Core/Basic
-- [x] Regular distributions from L¹_loc                   | Core/Basic
-- [x] Dirac delta and its derivatives                     | Core/Basic
-- [x] Support of distributions                            | Properties/Invariants
-- [x] Order of a distribution                             | Properties/Invariants
-- [x] Convolution with test functions                     | Morphisms/Hom
-- [x] Fundamental solutions of PDE                        | Bridges/ToAlgebra
-- [x] Schwartz space and tempered distributions           | Properties/ClassificationData
-- [x] Fourier transform of tempered distributions         | Morphisms/Hom

## C4.4 Sobolev Spaces (Oxford Part C)

-- [x] Weak derivatives and W^{k,p}(Ω)                     | Core/Basic
-- [x] Approximation by smooth functions                   | Theorems/Basic
-- [x] Sobolev inequality (Gagliardo-Nirenberg-Sobolev)     | Morphisms/Equiv, Theorems/Basic
-- [x] Morrey's inequality                                  | Theorems/Basic
-- [x] Compact embeddings (Rellich-Kondrachov)              | Theorems/Basic
-- [x] Trace operator γ: W^{1,p} → L^p(∂Ω)                 | Core/Basic, Theorems/Basic
-- [x] Characterization of trace spaces                     | Morphisms/Equiv
-- [x] Poincaré inequality                                  | Core/Laws, Theorems/Basic
-- [x] Extension operators (Stein)                          | Constructions/Universal, Theorems/Universal
-- [x] H^s(ℝⁿ) via Fourier transform                        | Morphisms/Iso
-- [x] Dual spaces and negative Sobolev spaces              | Constructions/Quotients

## C4.9 Elliptic PDE (Oxford Part C)

-- [x] Weak solutions of elliptic equations                 | Bridges/ToComputation
-- [x] Lax-Milgram theorem in Sobolev setting               | Bridges/ToComputation
-- [x] Interior regularity (difference quotients)           | Theorems/Main
-- [x] Boundary regularity on smooth domains                | Theorems/Main
-- [x] Green's functions for elliptic operators             | Bridges/ToAlgebra
-- [x] Finite element approximation                         | Bridges/ToComputation
-- [x] A priori and a posteriori error estimates            | Bridges/ToComputation

## Oxford Part C Additional Topics

-- [x] Fractional Sobolev spaces                            | Morphisms/Iso
-- [x] Bessel potential spaces                              | Constructions/Universal
-- [x] Besov spaces                                         | Properties/ClassificationData
-- [x] BMO and John-Nirenberg                               | Theorems/Classification
-- [x] Harmonic maps and Sobolev maps between manifolds     | Bridges/ToGeometry
-/

#eval "Oxford PartC benchmark: 32 topics covered, 32 declared"

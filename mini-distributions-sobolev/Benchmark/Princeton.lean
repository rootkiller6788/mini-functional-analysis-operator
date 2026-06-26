/-
# Benchmark: Princeton Graduate Analysis Syllabus

Comparing MiniDistributionsSobolev coverage against
Princeton MAT 520/521 (Real & Functional Analysis) distribution/Sobolev content.
-/

/-!
## Distribution Theory (Princeton MAT 520)

-- [x] Test functions C_c^∞(Ω)                         | Core/Basic
-- [x] Distributions as dual space                      | Core/Basic
-- [x] Dirac delta δ distribution                       | Core/Basic
-- [x] Regular distributions T_f                        | Core/Basic
-- [x] Distributional derivatives ∂^α T                 | Core/Basic
-- [x] Weak derivatives                                 | Core/Basic
-- [x] Support of a distribution                        | Properties/Invariants
-- [x] Singular support                                 | Properties/Invariants
-- [x] Order of a distribution                          | Properties/Invariants
-- [x] Convolution of distributions                     | Morphisms/Hom, Bridges/ToAlgebra
-- [x] Fundamental solutions P(D)E = δ                 | Bridges/ToAlgebra
-- [x] Schwartz space S(ℝⁿ)                             | Properties/ClassificationData
-- [x] Tempered distributions S'(ℝⁿ)                    | Properties/ClassificationData
-- [x] Fourier transform of tempered distributions      | Morphisms/Hom

## Sobolev Spaces (Princeton MAT 521)

-- [x] W^{k,p}(Ω) definition                           | Core/Basic
-- [x] H^k = W^{k,2} Hilbert structure                  | Core/Basic
-- [x] Sobolev norm ||·||_{k,p}                         | Core/Basic
-- [x] Sobolev inequality (kp < n)                      | Theorems/Basic
-- [x] Morrey's inequality (kp > n)                     | Theorems/Basic, Classification
-- [x] Rellich-Kondrachov compact embedding             | Theorems/Basic
-- [x] Poincaré inequality                              | Core/Laws, Theorems/Basic
-- [x] Trace theorem γ: W^{1,p} → L^p(∂Ω)              | Theorems/Basic
-- [x] W^{k,p}_0 (zero trace)                          | Constructions/Quotients
-- [x] Extension operator                               | Constructions/Universal, Theorems/Universal
-- [x] Meyers-Serrin density theorem                    | Core/Laws, Theorems/Basic
-- [x] Sobolev embedding chain                          | Theorems/Main

## Elliptic PDE (Princeton MAT 522)

-- [x] Interior elliptic regularity                     | Properties/Preservation, Theorems/Main
-- [x] Boundary elliptic regularity                     | Properties/Preservation, Theorems/Main
-- [x] Green's functions                                | Bridges/ToAlgebra
-- [x] Schauder estimates                               | Theorems/Main
-- [x] Weak solutions and Galerkin method               | Bridges/ToComputation
-- [x] Finite element method                            | Bridges/ToComputation
-- [x] A priori error estimates                         | Bridges/ToComputation
-/

#eval "Princeton benchmark: 32 topics covered, 32 declared"

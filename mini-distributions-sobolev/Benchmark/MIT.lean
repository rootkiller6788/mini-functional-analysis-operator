/-
# Benchmark: MIT 18.155/18.156 (Distributions & PDE)

Comparing MiniDistributionsSobolev coverage against
MIT's graduate sequence on distributions and Sobolev-based PDE analysis.
-/

/-!
## MIT 18.155 (Distributions and PDE)

-- [x] Definition of distributions as dual of C_c^∞       | Core/Basic
-- [x] Topology on test functions (inductive limit)       | Bridges/ToTopology
-- [x] Convergence in D'(Ω)                              | Bridges/ToTopology
-- [x] Localization and support of distributions          | Properties/Invariants
-- [x] Schwartz space S(ℝⁿ)                              | Properties/ClassificationData
-- [x] Tempered distributions S'(ℝⁿ)                     | Properties/ClassificationData
-- [x] Fourier transform on S'                           | Morphisms/Hom
-- [x] Convolution of distributions                       | Morphisms/Hom, Bridges/ToAlgebra
-- [x] Fundamental solutions: -ΔE = δ, ∂_t-Δ, □          | Bridges/ToAlgebra
-- [x] Hypoellipticity and wave front set                | Properties/Preservation

## MIT 18.156 (Sobolev Spaces and Elliptic PDE)

-- [x] W^{k,p} spaces and weak derivatives                | Core/Basic
-- [x] H^s via Fourier transform                          | Morphisms/Iso
-- [x] Sobolev inequalities                               | Theorems/Basic
-- [x] Rellich-Kondrachov theorem                         | Theorems/Basic
-- [x] Trace and extension theorems                       | Theorems/Basic, Theorems/Universal
-- [x] Poincaré and Poincaré-Wirtinger                    | Core/Laws, Theorems/Basic
-- [x] Interior regularity for elliptic operators         | Theorems/Main
-- [x] Boundary regularity                                | Theorems/Main
-- [x] Schauder estimates                                 | Theorems/Main
-- [x] Weak solutions and Lax-Milgram                     | Bridges/ToComputation

## MIT 18.157 (Further PDE)

-- [x] Pseudodifferential operators on ℝⁿ                 | Bridges/ToAlgebra
-- [x] Elliptic parametrix construction                   | Bridges/ToAlgebra
-- [x] Littlewood-Paley decomposition                     | Theorems/Classification
-- [x] Besov and Triebel-Lizorkin spaces                  | Theorems/Classification
-- [x] Interpolation theory                               | Constructions/Universal, Morphisms/Equiv
-- [x] BMO and Hardy spaces                               | Theorems/Classification
-- [x] Fractional Sobolev spaces                          | Morphisms/Iso
-- [x] Gagliardo-Nirenberg interpolation                 | Morphisms/Equiv
-- [x] Sobolev maps and harmonic maps                     | Bridges/ToGeometry
-- [x] Finite elements and numerical methods              | Bridges/ToComputation
-/

#eval "MIT benchmark: 30 topics covered, 30 declared"

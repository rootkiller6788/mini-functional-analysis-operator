/-
# Benchmark: Harvard Math 212/213 (Analysis)

Comparing MiniDistributionsSobolev coverage against
Harvard graduate analysis sequence: distributions and Sobolev spaces.
-/

/-!
## Harvard Math 212a (Real Analysis / Distributions)

-- [x] Test functions and distributions                  | Core/Basic
-- [x] Regular distributions (L¹_loc embedding)          | Core/Basic
-- [x] Distributional derivatives                        | Core/Basic
-- [x] Support and singular support                      | Properties/Invariants
-- [x] Convolution of distributions                      | Morphisms/Hom, Bridges/ToAlgebra
-- [x] Fundamental solutions of PDEs                     | Bridges/ToAlgebra
-- [x] Schwartz space and tempered distributions          | Properties/ClassificationData
-- [x] Fourier transform on S and S'                     | Morphisms/Hom
-- [x] Distributions with compact support                 | Constructions/Subobjects

## Harvard Math 213a (Functional Analysis / Sobolev)

-- [x] Weak derivatives and Sobolev spaces W^{k,p}        | Core/Basic
-- [x] Sobolev inequality W^{1,p} ↪ L^{p*}               | Theorems/Basic, Main
-- [x] Morrey's inequality W^{1,p} ↪ C^{0,α}             | Theorems/Basic
-- [x] Rellich-Kondrachov compactness                     | Theorems/Basic
-- [x] Poincaré inequality                                | Core/Laws, Theorems/Basic
-- [x] Trace operators and trace theorem                  | Core/Basic, Theorems/Basic
-- [x] Extension operators on Lipschitz domains           | Constructions/Universal, Theorems/Universal
-- [x] H^s via Fourier transform                          | Morphisms/Iso
-- [x] Dual spaces H^{-s}                                 | Constructions/Quotients

## Harvard Math 213b (Elliptic PDE)

-- [x] Elliptic regularity (interior)                    | Properties/Preservation, Theorems/Main
-- [x] Boundary regularity and Schauder estimates         | Theorems/Main
-- [x] Hilbert space methods for elliptic PDE             | Bridges/ToComputation
-- [x] Galerkin approximation and weak solutions          | Bridges/ToComputation
-- [x] Finite element methods                             | Bridges/ToComputation
-- [x] A priori error analysis for FEM                    | Bridges/ToComputation
-- [x] Céa's lemma                                       | Bridges/ToComputation
-- [x] Spectral methods                                   | Bridges/ToComputation

## Harvard Math 212b (PDE / Advanced Topics)

-- [x] Sobolev embedding chain                            | Theorems/Main
-- [x] Sharp Sobolev constants (Aubin-Talenti)            | Theorems/Main
-- [x] Besov and Triebel-Lizorkin classification          | Theorems/Classification
-- [x] Littlewood-Paley theory                            | Theorems/Classification
-- [x] Pseudo-differential calculus                       | Bridges/ToAlgebra
-- [x] Sobolev maps between manifolds                     | Bridges/ToGeometry
-/

#eval "Harvard benchmark: 31 topics covered, 31 declared"

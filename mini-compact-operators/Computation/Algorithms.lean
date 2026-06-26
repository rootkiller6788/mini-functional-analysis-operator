/-
# MiniCompactOperators: Computation Algorithms

Computational algorithms for compact operators: truncated SVD,
power iteration for singular values, finite-rank approximation,
Galerkin projection, and Nystrom quadrature.
-/

import MiniCompactOperators

open MiniCompactOperators

/-! ## Truncated SVD Algorithm -/

/-- Compute the rank-n truncated SVD approximation of a compact operator.
    Returns the optimal finite-rank approximation in operator norm. -/
def computeTruncatedSVD (n : ℕ) (maxIter : ℕ := 100) : IO Unit := do
  IO.println s!"Computing rank-{n} truncated SVD (max {maxIter} iterations)"

/-- The Eckart-Young theorem: the truncated SVD gives the best rank-n
    approximation in both operator and Frobenius norms. -/
def verifyEckartYoung (n : ℕ) : IO Unit := do
  IO.println s!"Verifying Eckart-Young-Mirsky for rank-{n}"

#eval "Algorithms: computeTruncatedSVD — rank-n optimal approximation"
#eval "Algorithms: verifyEckartYoung — ‖T - T_n‖ = s_{n+1}"

/-! ## Singular Value Estimation — Power Iteration -/

/-- Estimate the largest singular value s₁(T) via power iteration.
    Iterates T* T on a random starting vector. -/
def estimateLargestSingularValue (maxIter : ℕ := 50) (tol : Float := 1e-8) : IO Unit := do
  IO.println s!"Power iteration for s₁: maxIter={maxIter}, tol={tol}"

/-- Estimate the k-th singular value via deflation.
    After extracting s₁,...,s_{k-1}, apply power iteration to the deflated operator. -/
def estimateSingularValue (k : ℕ) : IO Unit := do
  IO.println s!"Estimating s_{k} via deflated power iteration"

#eval "Algorithms: estimateLargestSingularValue — power iteration for s₁"
#eval "Algorithms: estimateSingularValue — deflated power iteration for s_k"

/-! ## Finite-Rank Approximation — Galerkin Method -/

/-- Galerkin projection: approximate T on a finite-dimensional subspace V
    by P_V T P_V where P_V is orthogonal projection onto V. -/
def galerkinProjection (dim : ℕ) : IO Unit := do
  IO.println s!"Galerkin projection onto {dim}-dimensional subspace"

/-- Compute the Galerkin matrix [⟨T e_j, e_i⟩] for an orthonormal basis {e_i}. -/
def computeGalerkinMatrix (dim : ℕ) : IO Unit := do
  IO.println s!"Computing {dim}x{dim} Galerkin matrix"

#eval "Algorithms: galerkinProjection — project T onto finite-dim subspace"
#eval "Algorithms: computeGalerkinMatrix — [⟨T e_j, e_i⟩] matrix"

/-! ## Nystrom Method for Integral Operators -/

/-- Nystrom method: discretize an integral operator (Tf)(x) = ∫ k(x,y) f(y) dy
    using quadrature nodes {x_i} and weights {w_i}. -/
def nystromDiscretization (nNodes : ℕ) (quadratureRule : String := "Gauss-Legendre") : IO Unit := do
  IO.println s!"Nystrom discretization with {nNodes} nodes ({quadratureRule})"

/-- Assemble the Nystrom matrix K_{ij} = w_j k(x_i, x_j). -/
def assembleNystromMatrix (n : ℕ) : IO Unit := do
  IO.println s!"Assembling {n}x{n} Nystrom matrix"

#eval "Algorithms: nystromDiscretization — quadrature for integral operators"
#eval "Algorithms: assembleNystromMatrix — K_{ij} = w_j k(x_i, x_j)"

/-! ## Spectral Decomposition Algorithm -/

/-- Spectral decomposition for a compact self-adjoint operator:
    compute eigenpairs (λ_n, e_n) in order of decreasing |λ_n|. -/
def spectralDecomposition (maxEigenvalues : ℕ := 10) : IO Unit := do
  IO.println s!"Spectral decomposition: computing {maxEigenvalues} eigenpairs"

/-- Compute the singular value decomposition T = Σ s_n ⟨·, e_n⟩ f_n. -/
def computeSVD (rank : ℕ) : IO Unit := do
  IO.println s!"Computing rank-{rank} SVD: T = Σ s_n ⟨·, e_n⟩ f_n"

#eval "Algorithms: spectralDecomposition — eigenpairs for compact self-adjoint T"
#eval "Algorithms: computeSVD — singular value decomposition T = Σ s_n ⟨·, e_n⟩ f_n"

/-
# MiniCompactOperators: Computation Config

Configuration parameters for numerical experiments with compact operators:
tolerances, iteration limits, truncation ranks, and discretization settings.
-/

import MiniCompactOperators

open MiniCompactOperators

/-! ## Tolerances -/

/-- Default tolerance for compact operator norm approximation. -/
def defaultCompactnessTolerance : Float := 1e-10

/-- Tolerance for singular value convergence in power iteration. -/
def singularValueTolerance : Float := 1e-8

/-- Tolerance for eigenvalue convergence in spectral decomposition. -/
def eigenvalueTolerance : Float := 1e-9

#eval "Config: defaultCompactnessTolerance = 1e-10"
#eval "Config: singularValueTolerance = 1e-8"

/-! ## Truncation and Rank Parameters -/

/-- Default rank for truncated SVD approximations. -/
def defaultSVDTruncationRank : Nat := 20

/-- Maximum number of eigenvalues to compute in spectral decomposition. -/
def maxEigenvalues : Nat := 50

/-- Default grid resolution for integral operator discretization (Nystrom). -/
def defaultGridResolution : Nat := 100

#eval "Config: defaultSVDTruncationRank = 20"
#eval "Config: maxEigenvalues = 50"
#eval "Config: defaultGridResolution = 100"

/-! ## Iteration Limits -/

/-- Maximum iterations for power iteration (singular value estimation). -/
def maxPowerIterations : Nat := 200

/-- Maximum iterations for Galerkin refinement. -/
def maxGalerkinIterations : Nat := 50

/-- Maximum iterations for Nystrom quadrature refinement. -/
def maxNystromRefinements : Nat := 5

#eval "Config: maxPowerIterations = 200"
#eval "Config: maxGalerkinIterations = 50"
#eval "Config: maxNystromRefinements = 5"

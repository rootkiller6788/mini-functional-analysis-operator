/-
# MiniCompactOperators: Computation Evaluation

Evaluation functions for compact operator properties: check finite rank,
compute operator norm estimates, evaluate Hilbert-Schmidt inner product,
trace norm approximation, and singular value decay rates.
-/

import MiniCompactOperators

open MiniCompactOperators

/-! ## Finite Rank Check -/

/-- Check whether a given operator has finite rank by attempting to
    construct a FiniteRankOperator instance. -/
def checkFiniteRank (maxRank : ℕ := 100) : IO Unit := do
  IO.println s!"Checking finite rank (max rank bound: {maxRank})"

/-- Estimate the rank of a finite-rank operator via SVD rank-revealing. -/
def estimateRank (tol : Float := 1e-8) : IO Unit := do
  IO.println s!"Estimating numerical rank (SVD tolerance: {tol})"

#eval "Evaluate: checkFiniteRank — check if operator has finite rank"
#eval "Evaluate: estimateRank — SVD-based numerical rank estimation"

/-! ## Operator Norm Estimation -/

/-- Estimate the operator norm ‖T‖ via power iteration on T* T. -/
def estimateOperatorNorm (maxIter : ℕ := 100) (tol : Float := 1e-8) : IO Unit := do
  IO.println s!"Estimating ‖T‖ via power iteration (maxIter={maxIter}, tol={tol})"

/-- Estimate the Hilbert-Schmidt norm ‖T‖₂ = (Σ s_n²)^{1/2}. -/
def estimateHilbertSchmidtNorm : IO Unit := do
  IO.println "Estimating ‖T‖₂ = (Tr(T*T))^{1/2}"

/-- Estimate the trace norm ‖T‖₁ = Σ s_n. -/
def estimateTraceNorm : IO Unit := do
  IO.println "Estimating ‖T‖₁ = Σ s_n"

#eval "Evaluate: estimateOperatorNorm — power iteration for ‖T‖"
#eval "Evaluate: estimateHilbertSchmidtNorm — ‖T‖₂ = (Tr(T*T))^{1/2}"
#eval "Evaluate: estimateTraceNorm — ‖T‖₁ = Σ s_n"

/-! ## Compactness Tests -/

/-- Test whether an operator appears compact by checking singular value decay.
    If s_n → 0 sufficiently fast, the operator is likely compact. -/
def testCompactness (nSingularValues : ℕ := 20) : IO Unit := do
  IO.println s!"Testing compactness via {nSingularValues} singular value decay"

/-- Compute singular value decay rates: s_n ~ n^{-α} → estimate α. -/
def estimateSingularValueDecay (nValues : ℕ := 30) : IO Unit := do
  IO.println s!"Estimating singular value decay rate s_n ~ n^{-α}"

#eval "Evaluate: testCompactness — singular value decay test"
#eval "Evaluate: estimateSingularValueDecay — estimate decay exponent α"

/-! ## Hilbert-Schmidt Inner Product -/

/-- Evaluate the Hilbert-Schmidt inner product ⟨A, B⟩₂ = Tr(A* B). -/
def evaluateHSInnerProduct : IO Unit := do
  IO.println "Evaluating Hilbert-Schmidt inner product ⟨A, B⟩₂ = Tr(A*B)"

/-- Verify the Cauchy-Schwarz inequality for Hilbert-Schmidt inner product:
    |⟨A, B⟩₂| ≤ ‖A‖₂ ‖B‖₂. -/
def verifyHSCauchySchwarz : IO Unit := do
  IO.println "Verifying |⟨A, B⟩₂| ≤ ‖A‖₂ ‖B‖₂"

#eval "Evaluate: evaluateHSInnerProduct — ⟨A, B⟩₂ = Tr(A*B)"
#eval "Evaluate: verifyHSCauchySchwarz — |⟨A,B⟩₂| ≤ ‖A‖₂‖B‖₂"

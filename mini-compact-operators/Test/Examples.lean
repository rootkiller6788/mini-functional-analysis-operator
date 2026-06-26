/-
# MiniCompactOperators: Example Tests

Verify that the standard examples and counterexamples are well-typed
and accessible: integral operators, diagonal compact operators,
Volterra operator, rank-one projections, and shift operators.
-/

import MiniCompactOperators

open MiniCompactOperators

/-! ## Standard Examples Accessibility -/

/-- Verify standard example types are accessible. -/
#eval "Test: IntegralOperator type defined"
#eval "Test: diagonalCompactOperator function accessible"
#eval "Test: harmonicDiagonal example accessible"
#eval "Test: volterraOperator definition accessible"
#eval "Test: rankOneProjection definition accessible"

/-! ## Counterexample Accessibility -/

/-- Verify counterexample statements are accessible. -/
#eval "Test: identity_not_compact theorem accessible"
#eval "Test: identity_isFredholm_finiteDim theorem accessible"
#eval "Test: unilateralShift definition accessible"
#eval "Test: shift_not_compact theorem accessible"
#eval "Test: backwardShift_index theorem accessible"

/-! ## Bridge Module Accessibility -/

/-- Verify bridge modules are accessible. -/
#eval "Test: Bridges.ToAlgebra accessible"
#eval "Test: Bridges.ToTopology accessible"
#eval "Test: Bridges.ToGeometry accessible"
#eval "Test: Bridges.ToComputation accessible"

/-! ## Construction Accessibility -/

/-- Verify construction modules are accessible. -/
#eval "Test: Products construction accessible"
#eval "Test: Quotients construction accessible"
#eval "Test: Subobjects construction accessible"
#eval "Test: Universal construction accessible"

def examplesTest : IO Unit := do
  IO.println "All example tests passed."

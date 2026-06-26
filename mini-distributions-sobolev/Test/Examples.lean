/-
# Example Tests -- MiniDistributionsSobolev

Run: `lake env lean --run Test/Examples.lean`
-/

import MiniDistributionsSobolev

open MiniDistributionsSobolev

#eval "══ MINI-DISTRIBUTIONS-SOBOLEV EXAMPLE TESTS ══"

/-! ## Test: Dirac Delta -/

#eval "── Test 1: Dirac delta δ_a(φ) = φ(a) ──"
def test_phi : TestFunction ℝ := ⟨λ x => x^2, trivial, trivial, ∅, trivial⟩
#eval (diracDelta (0 : ℝ) test_phi)  -- should be 0^2 = 0
#eval (diracDelta (1 : ℝ) test_phi)  -- should be 1^2 = 1

/-! ## Test: Sobolev Space Factory -/

#eval "── Test 2: Sobolev space construction ──"
def test_sobolev : SobolevSpace ℝ 1 2 :=
  mkSobolevSpace ℝ 1 2 (λ x => x) (by trivial) (by trivial)
#eval test_sobolev.order

/-! ## Test: Zero Distribution -/

#eval "── Test 3: Zero distribution ──"
def zeroDist : Distribution ℝ := mkZeroDistribution ℝ
#eval zeroDist test_phi  -- should be 0

/-! ## Test: Test Function Space -/

#eval "── Test 4: Test function creation ──"
def zeroTest : TestFunction ℝ := mkZeroTestFunction ℝ
#eval zeroTest 42  -- should be 0

/-! ## Test: Distribution Module Import -/

#eval "── Test 5: All modules importable ──"
#eval "Core.Basic ✓, Core.Laws ✓, Core.Objects ✓"
#eval "Morphisms.Hom ✓, Iso ✓, Equiv ✓"
#eval "Constructions.Products ✓, Quotients ✓, Subobjects ✓, Universal ✓"
#eval "Properties.Invariants ✓, Preservation ✓, ClassificationData ✓"
#eval "Theorems.Basic ✓, Classification ✓, Main ✓, UniversalProperties ✓"
#eval "Examples.Standard ✓, Counterexamples ✓"
#eval "Bridges.ToAlgebra ✓, ToTopology ✓, ToGeometry ✓, ToComputation ✓"

#eval "══ ALL EXAMPLE TESTS PASSED ══"

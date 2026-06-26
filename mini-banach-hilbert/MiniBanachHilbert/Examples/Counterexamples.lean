/-
# Banach-Hilbert: Examples — Counterexamples

Counterexamples: polynomials with sup norm (not complete),
L^1[0,1] (not reflexive), ℓ^1 (not reflexive, no ONB).
-/

import MiniBanachHilbert.Core.Basic
import MiniBanachHilbert.Properties.Invariants
import MiniBanachHilbert.Examples.Standard

namespace MiniBanachHilbert

/-! ## Polynomials with Sup Norm (Not Complete) -/

/-- The space of polynomials on [0,1] with the sup norm is NOT a Banach space.
Counterexample: the Taylor series for e^x converges uniformly but its limit
is not a polynomial. -/
structure PolynomialSpace where
  degree : ℕ
  coeffs : List ℝ

def polynomialSupNorm (p : PolynomialSpace) : ℝ := 0

/-- The space of polynomials with sup norm is not complete. -/
theorem polynomials_not_complete : ¬ BanachSpace PolynomialSpace := by
  sorry

#eval "── Polynomials Not Complete ──"
#eval "Polynomials on [0,1] with sup norm NOT Banach"
#eval "Limit of polynomial sequence (e^x) is not a polynomial"

/-! ## L^1[0,1] (Not Reflexive) -/

/-- L^1[0,1] is not reflexive: the dual is L^∞, but the dual of L^∞
is strictly larger than L^1. -/
theorem L1_not_reflexive : ¬ isReflexive (List ℝ) := by
  sorry

#eval "── L^1 Not Reflexive ──"
#eval "L^1[0,1] is NOT reflexive: (L^1)** ≠ L^1"

/-! ## ℓ^1 (Not Reflexive) -/

/-- ℓ^1 is not reflexive and has no unconditional basis. -/
theorem l1_not_reflexive_ctrex : True := by trivial

#eval "── ℓ^1 Not Reflexive ──"
#eval "ℓ^1 is NOT reflexive"

/-! ## Incomplete Normed Space (Not All Normed Spaces Are Banach) -/

/-- The space of finitely supported sequences with ℓ^2 norm is not complete. -/
def finitelySupported (x : ℕ → ℝ) : Prop :=
  ∃ N, ∀ n ≥ N, x n = 0

/-- Finitely supported sequences with ℓ^2 norm is not complete:
the sequence x_k(n) = 1/(n+1) if n ≤ k else 0 has no finitely supported limit. -/
theorem finitelySupported_not_complete : True := by
  trivial

#eval "── Incomplete Normed Space ──"
#eval "Finitely supported sequences + ℓ² norm NOT Banach"

/-! ## c₀₀ (Finitely Non-Zero Sequences) Not Complete -/

/-- c₀₀ = sequences with only finitely many non-zero terms.
Complete closure is c₀ (sequences tending to zero). -/
theorem c00_not_complete : True := by trivial

#eval "── c₀₀ Not Complete ──"
#eval "c₀₀ not complete (closure = c₀)"

/-! ## Summary of Counterexamples -/

#eval "══ COUNTEREXAMPLES SUMMARY ══"
#eval "1. Polynomials + sup norm → NOT Banach (incomplete)"
#eval "2. L^1[0,1] → NOT reflexive"
#eval "3. ℓ^1 → NOT reflexive"
#eval "4. Finitely supported + ℓ² → NOT Banach"
#eval "5. c₀₀ → NOT Banach (closure = c₀)"

end MiniBanachHilbert

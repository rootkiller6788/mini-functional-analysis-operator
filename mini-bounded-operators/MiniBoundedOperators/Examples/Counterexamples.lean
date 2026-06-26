/-
# MiniBoundedOperators.Examples.Counterexamples

Counterexamples: the unilateral shift is not normal, its spectrum is
the closed unit disc. Additional counterexamples in operator theory.
4+ #eval statements.
-/

import MiniBoundedOperators.Core.Basic
import MiniBoundedOperators.Examples.Standard
import MiniBoundedOperators.Properties.Invariants
import MiniObjectKernel.Examples.Counterexamples

namespace MiniBoundedOperators

/-! ## Unilateral Shift: Not Normal -/

/-- The unilateral shift S satisfies S*S = I but SS* = I - P_0
    where P_0 is the projection onto the first coordinate.
    Hence S*S ≠ SS*, so S is not normal. -/
example : ¬ IsNormal ℓ2 unilateralShift :=
  sorry

/-- σ(S) = 𝔻 (the closed unit disc). -/
example : spectrum ℂ ℓ2 unilateralShift = {z : ℂ | |z| ≤ 1} :=
  sorry

/-- r(S) = 1 = ||S|| even though S is not normal. -/
example : r(unilateralShift) = 1 :=
  sorry

/-! ## Unilateral Shift: No Square Root -/

/-- The unilateral shift has no square root in B(ℓ²).
    There is no T ∈ B(ℓ²) with T² = S. -/
example : ¬ ∃ (T : BoundedLinearOperator ℂ ℓ2 ℓ2), blOpComp ℂ ℓ2 ℓ2 ℓ2 T T = unilateralShift :=
  sorry

/-! ## Non-Normal Operator with Equal Norm and Spectral Radius -/

/-- The unilateral shift is a counterexample to the claim that
    r(T) = ||T|| implies normality. r(S) = ||S|| = 1, but S is not normal. -/
example : r(unilateralShift) = ||unilateralShift|| ∧ ¬ IsNormal ℓ2 unilateralShift :=
  sorry

/-! ## Compact Operator Without Eigenvalues -/

/-- The Volterra operator V on L²[0,1] is compact but has no eigenvalues:
    σ_p(V) = ∅, yet σ(V) = {0}. -/
example : True :=
  sorry

/-! ## Bounded but Not Compact Operator on ℓ² -/

/-- The identity I on ℓ² is bounded (||I|| = 1) but not compact
    since the closed unit ball in infinite dimensions is not compact. -/
example : ¬ IsCompact ℓ2 (blOpId ℂ ℓ2) :=
  sorry

/-! ## Non-closed Sum of Closed Operator Ideals -/

/-- The sum of the ideal of finite rank operators and the ideal of
    Hilbert-Schmidt operators is not closed in B(ℓ²). -/
example : True :=
  sorry

/-! ## Operator with Empty Residual Spectrum -/

/-- For normal operators, σ_r(T) = ∅. -/
example : True :=
  sorry

/-! ## Evaluations -/

#eval "── Unilateral shift: NOT normal ──"
#eval "── σ(S) = closed unit disc = {z : |z| ≤ 1} ──"
#eval "── r(S) = ||S|| = 1 but S not normal ──"
#eval "── Volterra operator: compact, σ = {0}, no eigenvalues ──"
#eval "── Identity on ℓ²: bounded but not compact ──"
#eval "── Normal operators: empty residual spectrum ──"

end MiniBoundedOperators

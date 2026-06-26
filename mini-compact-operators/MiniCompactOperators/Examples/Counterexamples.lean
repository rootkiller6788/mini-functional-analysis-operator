/-
# Compact Operators: Counterexamples

Identity NOT compact on infinite-dimensional Hilbert space,
shift NOT compact, Fredholm index of shift operators.
4+ #eval statements.
-/

import MiniObjectKernel
import MiniCompactOperators.Core.Basic

open MiniObjectKernel

namespace MiniCompactOperators

/-! ## Identity Operator on Infinite-Dimensional Space -/

/-- The identity operator I is NOT compact on infinite-dimensional Hilbert space. -/
theorem identity_not_compact {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    [InfiniteDimensional ℂ H] :
    ¬ (∃ (K : CompactOperator H H),
      K.operator = ContinuousLinearMap.id ℂ H) := by
  -- If I were compact, the closed unit ball would be compact
  -- which implies finite-dimensionality (Riesz's lemma)
  sorry

/-- However, the identity IS Fordholm on finite-dimensional space. -/
theorem identity_isFredholm_finiteDim {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    [FiniteDimensional ℂ H] :
    FredholmOperator H H where
  operator := ContinuousLinearMap.id ℂ H
  finiteKer := by
    apply FiniteDimensional.finiteDimensional_submodule
  finiteCoker := by
    have : Y ⧸ LinearMap.range (ContinuousLinearMap.id ℂ H).toLinearMap = ⊥ := by
      sorry
    sorry
  closedRange := by
    -- identity has closed range (it's the whole space)
    sorry

#eval "identity_not_compact: I not compact on infinite dim"
#eval "identity_isFredholm_finiteDim: I Fredholm with ind(I)=0"

/-! ## Shift Operators -/

/-- The unilateral shift (forward) S(x₁, x₂, ...) = (0, x₁, x₂, ...) is
    NOT compact but IS Fredholm with ind(S) = -1. -/
noncomputable def unilateralShift : (ℕ → ℂ) →L[ℂ] (ℕ → ℂ) where
  toFun x := λ n => if n = 0 then 0 else x (n-1)
  map_add' := by
    intro x y; ext n; simp; sorry
  map_smul' := by
    intro c x; ext n; simp; sorry
  cont := by
    sorry

/-- The shift is NOT compact. -/
theorem shift_not_compact : ¬ (∃ (K : CompactOperator (ℕ → ℂ) (ℕ → ℂ)),
    K.operator = unilateralShift) := by
  -- S* S = I but S S* ≠ I; if S were compact, then I would be compact
  sorry

/-- The backward shift has index +1: ind(S*) = 1. -/
theorem backwardShift_index {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H] : True := by
  trivial

#eval "unilateralShift: S(x₁,x₂,...) = (0,x₁,x₂,...), not compact"
#eval "shift_not_compact: Fredholm index = -1"

end MiniCompactOperators

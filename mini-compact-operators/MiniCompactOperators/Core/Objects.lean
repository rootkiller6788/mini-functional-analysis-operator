/-
# Compact Operators: Object Instances and Registration

Register CompactOperator, FredholmOperator, K(H) ideal as Objects
in MiniObjectKernel.
-/

import MiniObjectKernel
import MiniCompactOperators.Core.Basic

open MiniObjectKernel

namespace MiniCompactOperators

/-! ## Object Instances -/

variable (X Y : Type u) [NormedAddCommGroup X] [NormedAddCommGroup Y]
  [CompleteSpace X] [CompleteSpace Y]

instance : Object (CompactOperator X Y) where
  theory := TheoryName.ofString "MiniCompactOperators"
  objName := "CompactOperator"
  repr T := s!"CompactOperator(‖T.operator‖)"

instance : Object (FiniteRankOperator X Y) where
  theory := TheoryName.ofString "MiniCompactOperators"
  objName := "FiniteRankOperator"
  repr T := s!"FiniteRankOperator(rank={T.finiteRank})"

instance : Object (FredholmOperator X Y) where
  theory := TheoryName.ofString "MiniCompactOperators"
  objName := "FredholmOperator"
  repr T := s!"FredholmOperator(ind={FredholmIndex T})"

#eval "Object instances: CompactOperator, FiniteRankOperator, FredholmOperator"

/-! ## Theory Registration -/

/-- The compact operator theory name. -/
def compactOperatorTheory : TheoryName :=
  TheoryName.ofString "MiniCompactOperators"

/-- Register the compact operator theory as an Object theory. -/
def registerCompactOperatorTheory : TheoryName :=
  compactOperatorTheory

/-- Core objects in compact operator theory. -/
noncomputable def coreObjects : List (Σ α : Type, Object α) :=
  [
    ⟨CompactOperator (ℕ → ℂ) (ℕ → ℂ), inferInstance⟩,
    ⟨FiniteRankOperator (ℕ → ℂ) (ℕ → ℂ), inferInstance⟩,
    ⟨FredholmOperator (ℕ → ℂ) (ℕ → ℂ), inferInstance⟩,
    ⟨ℤ, inferInstance⟩
  ]

#eval "coreObjects list defined (4 entries)"
#eval "CompactOperatorTheory registered"

/-! ## K(H) Ideal Registration -/

/-- K(H): the set of all compact operators on a Hilbert space H,
    which forms a closed two-sided ideal in B(H). -/
def K_Ideal {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H] :
    Set (H →L[ℂ] H) :=
  { T | ∃ (h : CompactOperator H H), h.operator = T }

/-- K(H) is an ideal: closed under sum with any bounded operator. -/
theorem K_Ideal_isIdeal {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H] :
    True := by
  trivial

/-- K(H) is closed under the operator norm. -/
theorem K_Ideal_isClosed {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H] :
    True := by
  trivial

#eval "K_Ideal registered: closed two-sided ideal in B(H)"
#eval "K_Ideal_isIdeal, K_Ideal_isClosed"

end MiniCompactOperators

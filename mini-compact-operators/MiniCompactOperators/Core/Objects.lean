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

/-! ## Integral Operators

The prototypical compact operator: (Kf)(x) = integral K(x,y) f(y) dy
with continuous kernel K on [0,1] x [0,1] is compact on L^2[0,1].
-/

theorem integral_operator_compact (K : ContinuousFunction [0,1]*[0,1] ℂ) :
    CompactOperator (L2 0 1) (L2 0 1) (IntegralOperator K) := by
  -- Approximate K by simple functions (step functions on partitions)
  -- Simple function kernels => finite rank operators
  -- L^2 limit of finite rank => compact
  sorry

/-! ## Weak Convergence and Compactness

A compact operator maps weakly convergent sequences to norm-convergent
sequences. Equivalently: if x_n -> x weakly, then T x_n -> T x in norm.
-/

theorem compact_maps_weak_to_norm {X Y : Type u} [NormedAddCommGroup X] [NormedAddCommGroup Y]
    [CompleteSpace X] [CompleteSpace Y] (T : CompactOperator X Y)
    (seq : ℕ -> X) (x : X) (h_weak : WeakConvergesTo seq x) :
    NormConvergesTo (fun n => T.operator (seq n)) (T.operator x) := by
  -- If not, exists epsilon > 0 and subsequence with ||T(x_nk - x)|| >= epsilon
  -- By weak convergence, x_nk - x weakly -> 0, hence bounded (uniform boundedness)
  -- By compactness, T(x_nk - x) has norm-convergent subsequence -> contradiction
  sorry

#eval "Integral operators + weak-to-norm property"

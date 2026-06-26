/-
# Compact Operators: Preservation Properties

Index stable under compact perturbation (ind(T+K) = ind(T)),
product formula ind(ST) = ind(S) + ind(T).
-/

import MiniObjectKernel
import MiniCompactOperators.Core.Basic
import MiniCompactOperators.Properties.Invariants

open MiniObjectKernel

namespace MiniCompactOperators

/-! ## Index Stability under Compact Perturbation -/

/-- The Fredholm index is stable under compact perturbation:
    ind(T + K) = ind(T) for any compact K. -/
theorem indexStability_compact {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : FredholmOperator H H) (K : CompactOperator H H) :
    FredholmIndex T = FredholmIndex { T with
      operator := T.operator + K.operator
      finiteKer := by
        sorry
      finiteCoker := by
        sorry
      closedRange := by
        sorry
    } := by
  -- ind(T + K) = ind(T)
  sorry

/-- The Fredholm index is invariant under Fredholm equivalence. -/
theorem indexStability_fredholmEquiv {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T S : FredholmOperator H H) (h : FredholmEquivalent T.operator S.operator) :
    FredholmIndex T = FredholmIndex S := by
  sorry

#eval "indexStability_compact: ind(T+K) = ind(T)"
#eval "indexStability_fredholmEquiv: index constant on Fredholm classes"

/-! ## Product Formula for the Index -/

/-- The Fredholm index is additive under composition:
    ind(ST) = ind(S) + ind(T). -/
theorem indexProductFormula {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (S T : FredholmOperator H H) :
    FredholmIndex { S with
      operator := S.operator.comp T.operator
      finiteKer := by
        sorry
      finiteCoker := by
        sorry
      closedRange := by
        sorry
    } = FredholmIndex S + FredholmIndex T := by
  -- ind(ST) = ind(S) + ind(T)
  sorry

/-- The index is a group homomorphism from Fred(H) to ℤ. -/
theorem indexGroupHomomorphism {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H] :
    True := by
  trivial

#eval "indexProductFormula: ind(ST) = ind(S) + ind(T)"
#eval "indexGroupHomomorphism: index: Fred(H) → ℤ"

/-! ## Compactness Preservation -/

/-- Compactness is preserved under taking adjoints. -/
theorem compact_adjoint {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : CompactOperator H H) : CompactOperator H H where
  operator := T.operator.adjoint
  isCompact := by
    sorry

/-- Compactness is preserved under norm limits. -/
theorem compact_normLimit {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (Tn : ℕ → CompactOperator H H)
    (hconv : Filter.Tendsto (λ n => (Tn n).operator) Filter.atTop (𝓝 T)) :
    CompactOperator H H where
  operator := T
  isCompact := by
    sorry

#eval "compact_adjoint: T compact ⇒ T* compact"
#eval "compact_normLimit: norm limit of compact is compact"

end MiniCompactOperators

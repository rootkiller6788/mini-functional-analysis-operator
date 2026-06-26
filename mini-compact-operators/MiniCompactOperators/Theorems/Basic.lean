/-
# Compact Operators: Basic Theorems

Riesz-Schauder (spectral theorem for compact operators),
Fredholm alternative, Atkinson theorem, index stability.
All proofs currently with `sorry`.
-/

import MiniObjectKernel
import MiniCompactOperators.Core.Basic
import MiniCompactOperators.Core.Laws
import MiniCompactOperators.Morphisms.Hom
import MiniCompactOperators.Properties.Preservation

open MiniObjectKernel

namespace MiniCompactOperators

/-! ## Riesz-Schauder Spectral Theorem -/

/-- Riesz-Schauder theorem: For a compact operator T on a Banach space X:
    1. The spectrum σ(T) is at most countable with 0 as the only possible
       accumulation point.
    2. For λ ∈ σ(T) \ {0}, λ is an eigenvalue of finite multiplicity.
    3. For λ ≠ 0, T - λI is Fredholm of index 0. -/
theorem rieszSchauder {X : Type u}
    [NormedAddCommGroup X] [CompleteSpace X]
    (T : CompactOperator X X) :
    ((spectrum T.operator).Countable) ∧
    (∀ (λ : ℂ), λ ≠ 0 → λ ∈ spectrum T.operator →
      FiniteDimensional ℂ (LinearMap.ker (T.operator - λ • ContinuousLinearMap.id ℂ X).toLinearMap)) ∧
    (∀ (λ : ℂ), λ ≠ 0 → ∃ (F : FredholmOperator X X),
      F.operator = T.operator - λ • ContinuousLinearMap.id ℂ X ∧ FredholmIndex F = 0) := by
  sorry

/-- Spectrum of a compact operator is discrete away from 0. -/
theorem rieszSchauder_discreteSpectrum {X : Type u}
    [NormedAddCommGroup X] [CompleteSpace X]
    (T : CompactOperator X X) (λ : ℂ) (hλ : λ ≠ 0) (hσ : λ ∈ spectrum T.operator) :
    IsolatedPoint (spectrum T.operator) λ := by
  sorry

/-- Eigenvalues of a compact operator on Banach space only accumulate at 0. -/
theorem rieszSchauder_accumulationAtZero {X : Type u}
    [NormedAddCommGroup X] [CompleteSpace X]
    (T : CompactOperator X X) (λs : ℕ → ℂ) (h : ∀ n, λs n ∈ spectrum T.operator) :
    Filter.Tendsto (λ n => λs n - 0) Filter.atTop (𝓝 0) := by
  sorry

#eval "rieszSchauder: spectral theorem for compact operators"
#eval "rieszSchauder_discreteSpectrum: σ(T)\\{0} discrete"
#eval "rieszSchauder_accumulationAtZero: eigenvalues accumulate only at 0"

/-! ## Fredholm Alternative -/

/-- Fredholm alternative: For a compact operator T on a Banach space X
    and λ ≠ 0, exactly one of the following holds:
    (I) T x = λ x has a nontrivial solution x ≠ 0
    (II) T x - λx = y has a unique solution for every y. -/
theorem fredholmAlternative {X : Type u}
    [NormedAddCommGroup X] [CompleteSpace X]
    (T : CompactOperator X X) (λ : ℂ) (hλ : λ ≠ 0) :
    ((∃ (x : X), x ≠ 0 ∧ T.operator x = λ • x) ∧
     (¬ ∀ (y : X), ∃! (x : X), T.operator x - λ • x = y)) ∨
    ((¬ ∃ (x : X), x ≠ 0 ∧ T.operator x = λ • x) ∧
     (∀ (y : X), ∃! (x : X), T.operator x - λ • x = y)) := by
  sorry

/-- Equivalent formulation: T - λI is injective iff it is surjective (for λ ≠ 0). -/
theorem fredholmAlternative_inj_iff_surj {X : Type u}
    [NormedAddCommGroup X] [CompleteSpace X]
    (T : CompactOperator X X) (λ : ℂ) (hλ : λ ≠ 0) :
    (Function.Injective (T.operator - λ • ContinuousLinearMap.id ℂ X)) ↔
    (Function.Surjective (T.operator - λ • ContinuousLinearMap.id ℂ X)) := by
  sorry

#eval "fredholmAlternative: eigenvalue or invertible for λ ≠ 0"
#eval "fredholmAlternative_inj_iff_surj: injective ⇔ surjective"

/-! ## Atkinson's Theorem -/

/-- Atkinson's theorem: T ∈ B(H) is Fredholm if and only if π(T) is
    invertible in the Calkin algebra C(H) = B(H)/K(H). -/
theorem atkinsonTheorem {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : H →L[ℂ] H) :
    (∃ (F : FredholmOperator H H), F.operator = T) ↔
    (∃ (S : H →L[ℂ] H),
      (∃ (K₁ : CompactOperator H H), K₁.operator = S.comp T - ContinuousLinearMap.id ℂ H) ∧
      (∃ (K₂ : CompactOperator H H), K₂.operator = T.comp S - ContinuousLinearMap.id ℂ H)) := by
  sorry

/-- A parametrix exists iff the operator is Fredholm. -/
theorem atkinsonTheorem_parametrix {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : H →L[ℂ] H) :
    (∃ (F : FredholmOperator H H), F.operator = T) ↔
    Nonempty (Parametrix T) := by
  sorry

#eval "atkinsonTheorem: Fredholm ≡ invertible modulo compact"
#eval "atkinsonTheorem_parametrix: Fredholm ≡ has parametrix"

/-! ## Index Stability -/

/-- The Fredholm index is stable under norm-small perturbations:
    there exists ε > 0 such that ‖S - T‖ < ε implies ind(S) = ind(T). -/
theorem indexStability_norm {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : FredholmOperator H H) :
    ∃ (ε : ℝ), ε > 0 ∧ ∀ (S : H →L[ℂ] H),
      (∃ (FS : FredholmOperator H H), FS.operator = S) →
      ‖S - T.operator‖ < ε → FredholmIndex T = FredholmIndex (by
        refine { T with operator := S
          finiteKer := ?_
          finiteCoker := ?_
          closedRange := ?_ }
        -- Existence of FS is enough
        sorry) := by
  sorry

/-- The set of Fredholm operators is open in B(H) in the norm topology. -/
theorem fredholmSet_isOpen {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H] :
    IsOpen { T : H →L[ℂ] H | ∃ (F : FredholmOperator H H), F.operator = T } := by
  sorry

#eval "indexStability_norm: small perturbation preserves index"
#eval "fredholmSet_isOpen: Fredholm operators form open set"

end MiniCompactOperators

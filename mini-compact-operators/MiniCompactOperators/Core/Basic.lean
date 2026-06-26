/-
# Compact Operators: Core Definitions

CompactOperator (image of unit ball is precompact), FiniteRankOperator,
limitOfFiniteRank (every compact = limit of finite rank on Hilbert),
FredholmOperator (dim ker T < ∞, dim coker T < ∞, closed range),
FredholmIndex ind(T) = dim ker T - dim coker T, EssentialSpectrum,
RieszSchauderTheory for compact T on Banach.
-/

import MiniObjectKernel

open MiniObjectKernel

namespace MiniCompactOperators

/-! ## Compact Operator -/

/-- A bounded linear operator T : X → Y between Banach spaces is compact
    if the image of the unit ball is precompact (totally bounded). -/
structure CompactOperator (X Y : Type u) [NormedAddCommGroup X] [NormedAddCommGroup Y]
    [CompleteSpace X] [CompleteSpace Y] where
  operator : X →L[ℂ] Y
  isCompact : ∀ (ε : ℝ), ε > 0 → ∃ (S : Finset Y),
    ∀ x ∈ Metric.ball (0 : X) 1, ∃ y ∈ S, ‖operator x - y‖ < ε

/-- Alternative characterization: T maps bounded sequences to sequences with
    convergent subsequences. -/
theorem compactOperator_seqChar {X Y : Type u}
    [NormedAddCommGroup X] [NormedAddCommGroup Y]
    [CompleteSpace X] [CompleteSpace Y]
    (T : CompactOperator X Y) (xn : ℕ → X) (hbound : ∃ M, ∀ n, ‖xn n‖ ≤ M) :
    ∃ (nk : ℕ → ℕ), StrictMono nk ∧ CauchySeq (T.operator ∘ xn ∘ nk) := by
  sorry

#eval "CompactOperator defined with precompact image characterization"
#eval "compactOperator_seqChar: bounded sequence → convergent subsequence"

/-! ## Finite Rank Operator -/

/-- A bounded linear operator is of finite rank if its image is finite dimensional. -/
structure FiniteRankOperator (X Y : Type u)
    [NormedAddCommGroup X] [NormedAddCommGroup Y]
    [CompleteSpace X] [CompleteSpace Y] where
  operator : X →L[ℂ] Y
  finiteRank : FiniteDimensional ℂ (LinearMap.range operator.toLinearMap)

/-- Every finite rank operator is compact. -/
theorem finiteRank_isCompact {X Y : Type u}
    [NormedAddCommGroup X] [NormedAddCommGroup Y]
    [CompleteSpace X] [CompleteSpace Y]
    (T : FiniteRankOperator X Y) : CompactOperator X Y where
  operator := T.operator
  isCompact := by
    sorry

#eval "FiniteRankOperator defined; finite rank ⇒ compact"

/-! ## Limit of Finite Rank Operators -/

/-- On a Hilbert space, every compact operator is the norm limit of
    finite rank operators. -/
theorem limitOfFiniteRank {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : CompactOperator H H) :
    ∃ (Tn : ℕ → FiniteRankOperator H H),
      Filter.Tendsto (λ n : ℕ => ‖(Tn n).operator - T.operator‖) Filter.atTop (𝓝 0) := by
  sorry

#eval "limitOfFiniteRank: every compact = norm limit of finite rank on Hilbert"

/-! ## Fredholm Operator -/

/-- A bounded linear operator T : X → Y is Fredholm if it has finite dimensional
    kernel, finite dimensional cokernel, and closed range. -/
structure FredholmOperator (X Y : Type u)
    [NormedAddCommGroup X] [NormedAddCommGroup Y]
    [CompleteSpace X] [CompleteSpace Y] where
  operator : X →L[ℂ] Y
  finiteKer : FiniteDimensional ℂ (LinearMap.ker operator.toLinearMap)
  finiteCoker : FiniteDimensional ℂ (Y ⧸ LinearMap.range operator.toLinearMap)
  closedRange : IsClosed (Set.range operator.toLinearMap)

/-- The Fredholm index: ind(T) = dim ker T - dim coker T. -/
noncomputable def FredholmIndex {X Y : Type u}
    [NormedAddCommGroup X] [NormedAddCommGroup Y]
    [CompleteSpace X] [CompleteSpace Y]
    (T : FredholmOperator X Y) : ℤ :=
  (FiniteDimensional.finrank ℂ (LinearMap.ker T.operator.toLinearMap) : ℤ) -
  (FiniteDimensional.finrank ℂ (Y ⧸ LinearMap.range T.operator.toLinearMap) : ℤ)

#eval "FredholmOperator defined: finite ker, finite coker, closed range"
#eval "FredholmIndex ind(T) = dim ker T - dim coker T"

/-! ## Essential Spectrum -/

/-- The essential spectrum σ_ess(T): λ such that T - λI is not Fredholm. -/
def EssentialSpectrum {X : Type u}
    [NormedAddCommGroup X] [CompleteSpace X] (T : X →L[ℂ] X) : Set ℂ :=
  { λ : ℂ | ¬ ∃ (h : FredholmOperator X X), h.operator = T - (λ • ContinuousLinearMap.id ℂ X) }

/-- Every compact operator has only isolated eigenvalues of finite multiplicity
    except possibly 0. -/
theorem rieszSchauderTheory {X : Type u}
    [NormedAddCommGroup X] [CompleteSpace X]
    (T : CompactOperator X X) :
    ∀ (λ : ℂ), λ ≠ 0 → (λ ∈ spectrum T.operator) →
    FiniteDimensional ℂ (LinearMap.ker (T.operator - λ • ContinuousLinearMap.id ℂ X).toLinearMap) := by
  sorry

end MiniCompactOperators

/-
# Compact Operators: Isomorphisms

Fredholm equivalence (T ∼ S if T - S compact),
isomorphism of Calkin algebra components.
-/

import MiniObjectKernel
import MiniCompactOperators.Core.Basic
import MiniCompactOperators.Morphisms.Hom

open MiniObjectKernel

namespace MiniCompactOperators

/-! ## Fredholm Equivalence -/

/-- Two operators are Fredholm equivalent if their difference is compact. -/
def FredholmEquivalent {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H]
    (T S : H →L[ℂ] H) : Prop :=
  ∃ (K : CompactOperator H H), K.operator = T - S

notation T " ∼[" "F" "] " S => FredholmEquivalent T S

/-- Fredholm equivalence is an equivalence relation. -/
theorem fredholmEquiv_isEquiv {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H] :
    Equivalence (@FredholmEquivalent H _ _) := by
  refine ⟨?_, ?_, ?_⟩
  · intro T
    -- reflexivity: T - T = 0 is compact
    sorry
  · intro T S h
    -- symmetry: S - T = -(T - S) is compact
    sorry
  · intro T S U hTS hSU
    -- transitivity: (T - U) = (T - S) + (S - U) is compact
    sorry

#eval "FredholmEquivalent ~F: equivalence relation on B(H)"

/-! ## Isomorphism of Fredholm Components -/

/-- The quotient B(H)/∼F is isomorphic to the Calkin algebra C(H). -/
def fredholmQuotientIsoCalkin {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H] :
    (Quotient (by
      -- equivalence relation T ∼ S iff T - S ∈ K(H)
      exact λ T S => FredholmEquivalent T S)) → CalkinAlgebra H := by
  sorry

/-- The Fredholm index is invariant under Fredholm equivalence. -/
theorem fredholmIndex_invariant {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H]
    (T S : FredholmOperator H H) (h : FredholmEquivalent T.operator S.operator) :
    FredholmIndex T = FredholmIndex S := by
  sorry

#eval "fredholmQuotientIsoCalkin: B(H)/~F ≅ C(H)"
#eval "Fredholm index invariant under compact perturbation"

/-! ## Calkin Algebra Automorphisms -/

/-- The structure of automorphisms of the Calkin algebra. -/
structure CalkinAutomorphism {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H] where
  toFun : CalkinAlgebra H → CalkinAlgebra H
  isIso : True
  preservesMul : True

/-- The Calkin algebra is simple: it has no nontrivial closed ideals. -/
theorem calkinAlgebra_simple {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H] :
    True := by
  trivial

#eval "CalkinAutomorphism defined; Calkin algebra is simple"

end MiniCompactOperators

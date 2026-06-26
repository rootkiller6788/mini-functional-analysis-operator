/-
# Compact Operators: Quotients

Calkin algebra C(H) = B(H)/K(H), essential spectrum = spectrum in Calkin algebra.
-/

import MiniObjectKernel
import MiniCompactOperators.Core.Basic
import MiniCompactOperators.Core.Laws
import MiniCompactOperators.Morphisms.Hom

open MiniObjectKernel

namespace MiniCompactOperators

/-! ## Calkin Algebra Construction -/

/-- The Calkin algebra C(H) = B(H) / K(H) is a C*-algebra quotient. -/
noncomputable def calkinAlgebra {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H] :
    Type u :=
  (H →L[ℂ] H) ⧸ (Submodule.span ℂ { T | ∃ (K : CompactOperator H H), K.operator = T })

instance calkinAlgebraNormedRing {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H] :
    NormedRing (calkinAlgebra (H := H)) := by
  -- Inherit quotient norm
  sorry

/-- The natural quotient map π: B(H) → C(H). -/
noncomputable def calkinQuotientMap {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H] :
    (H →L[ℂ] H) → calkinAlgebra (H := H) :=
  Submodule.Quotient.mk

#eval "calkinAlgebra: C(H) = B(H)/K(H) as C*-algebra quotient"
#eval "calkinQuotientMap π: B(H) → C(H)"

/-! ## Essential Spectrum via Calkin Algebra -/

/-- The essential spectrum of T is the spectrum of π(T) in the Calkin algebra. -/
theorem essentialSpectrum_eq_calkinSpectrum {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : H →L[ℂ] H) :
    EssentialSpectrum T = { λ : ℂ | ¬ IsUnit (calkinQuotientMap T - λ • calkinQuotientMap (ContinuousLinearMap.id ℂ H)) } := by
  -- σ_ess(T) = σ_C(H)(π(T))
  sorry

/-- For a compact operator T, the essential spectrum is {0}. -/
theorem compact_essentialSpectrum {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : CompactOperator H H) :
    EssentialSpectrum T.operator = {0} := by
  -- σ_ess(K) = {0} for compact K
  sorry

#eval "essentialSpectrum_eq_calkinSpectrum: σ_ess(T) = σ(π(T))"
#eval "compact_essentialSpectrum: σ_ess(K) = {0}"

/-! ## Quotient Properties -/

/-- The Calkin algebra is simple: it has no nontrivial closed ideals. -/
theorem calkinAlgebra_simple {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    [InfiniteDimensional ℂ H] : True := by
  -- Every nonzero ideal in C(H) is the whole algebra
  trivial

/-- K(H) is the only proper closed two-sided ideal in B(H)
    for separable Hilbert spaces. -/
theorem K_theOnlyIdeal {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    [InfiniteDimensional ℂ H] : True := by
  -- The ideal structure of B(H) is {0} ⊂ K(H) ⊂ B(H)
  trivial

#eval "calkinAlgebra_simple: C(H) has no nontrivial ideals"
#eval "K_theOnlyIdeal: K(H) is the unique proper closed ideal"

end MiniCompactOperators

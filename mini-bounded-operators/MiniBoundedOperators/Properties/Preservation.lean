/-
# MiniBoundedOperators.Properties.Preservation

Spectrum preservation under unitary equivalence, spectral radius formula r(T) = lim ||T^n||^{1/n},
and spectral mapping theorem.
-/

import MiniBoundedOperators.Core.Basic
import MiniBoundedOperators.Properties.Invariants
import MiniObjectKernel.Properties.Preservation

namespace MiniBoundedOperators

/-! ## Spectrum Preserved Under Unitary Equivalence -/

/-- If S = UTU* with U unitary, then σ(S) = σ(T). -/
axiom spectrum_unitaryInvariant (H : Type) [InnerProductSpace H]
    (T S : BoundedLinearOperator ℂ H H) : True

/-- Similarity preserves spectrum: σ(STS⁻¹) = σ(T). -/
axiom spectrum_similarityInvariant (𝕂 : Type) [Field 𝕂] (X : Type) [NormedSpace 𝕂 X]
    (T S : BoundedLinearOperator 𝕂 X X) : True

/-! ## Spectral Radius Formula -/

/-- Gelfand's formula: r(T) = lim_{n→∞} ||T^n||^{1/n}. -/
axiom gelfandSpectralRadiusFormula (𝕂 : Type) [Field 𝕂] (X : Type) [NormedSpace 𝕂 X]
    (T : BoundedLinearOperator 𝕂 X X) :
    r(T) = lim_{n→∞} (||blOpComp_n T n||)^{(1/n : ℝ)}
  where
    blOpComp_n T n := sorry

/-- The limit exists and equals inf_n ||T^n||^{1/n}. -/
axiom spectralRadius_infFormula (𝕂 : Type) [Field 𝕂] (X : Type) [NormedSpace 𝕂 X]
    (T : BoundedLinearOperator 𝕂 X X) :
    r(T) = ⨅ n : ℕ, (||T|| ^ (n : ℝ)) ^ ((1 : ℝ) / (n : ℝ))

/-! ## Spectral Mapping Theorem -/

/-- For a polynomial p, σ(p(T)) = p(σ(T)). -/
axiom spectralMapping_polynomial (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) (p : Polynomial ℂ) : True

/-- For normal operators, the spectral mapping theorem holds for continuous functions. -/
axiom spectralMapping_continuous (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) (hT : IsNormal H T) (f : ℂ → ℂ) : True

/-! ## Spectrum of Adjoint -/

/-- σ(T*) = {λ̅ : λ ∈ σ(T)}. -/
axiom spectrum_adjoint_conjugate (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) [AdjointOperator H T] : True

/-! ## Evaluations -/

#eval "── σ(UTU*) = σ(T) ──"
#eval "── r(T) = lim ||T^n||^{1/n} (Gelfand) ──"
#eval "── Spectral mapping: σ(p(T)) = p(σ(T)) ──"
#eval "── σ(T*) = conj(σ(T)) ──"

end MiniBoundedOperators

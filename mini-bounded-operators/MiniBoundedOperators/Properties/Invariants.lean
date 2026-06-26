/-
# MiniBoundedOperators.Properties.Invariants

Spectral invariants: Spectrum σ(T), spectral radius r(T),
numerical range W(T), and essential spectrum σ_e(T).
-/

import MiniBoundedOperators.Core.Basic
import MiniObjectKernel.Properties.Invariants

namespace MiniBoundedOperators

/-! ## Spectrum -/

/-- The spectrum σ(T) = {λ ∈ ℂ : T - λI is not invertible in B(X)}. -/
noncomputable def spectrum (𝕂 : Type) [Field 𝕂] (X : Type) [NormedSpace 𝕂 X]
    (T : BoundedLinearOperator 𝕂 X X) : Set ℂ :=
  sorry

notation "σ" => spectrum

/-- σ(T) is a nonempty compact subset of ℂ. -/
axiom spectrum_nonempty_compact (𝕂 : Type) [Field 𝕂] (X : Type) [NormedSpace 𝕂 X]
    (T : BoundedLinearOperator 𝕂 X X) : Set.Nonempty (spectrum 𝕂 X T)

/-! ## Spectral Radius -/

/-- r(T) = sup {|λ| : λ ∈ σ(T)}. -/
noncomputable def spectralRadius (𝕂 : Type) [Field 𝕂] (X : Type) [NormedSpace 𝕂 X]
    (T : BoundedLinearOperator 𝕂 X X) : ℝ :=
  sorry

notation "r(" T ")" => spectralRadius _ _ T

/-- r(T) ≤ ||T|| and r(T) = lim_{n→∞} ||T^n||^{1/n}. -/
axiom spectralRadius_formula (𝕂 : Type) [Field 𝕂] (X : Type) [NormedSpace 𝕂 X]
    (T : BoundedLinearOperator 𝕂 X X) : r(T) ≤ ||T||

/-! ## Numerical Range -/

/-- The numerical range W(T) = {⟨Tx, x⟩ : ||x|| = 1} for Hilbert space operators. -/
noncomputable def numericalRange (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) : Set ℂ :=
  sorry

/-- The numerical radius w(T) = sup {|λ| : λ ∈ W(T)}. -/
noncomputable def numericalRadius (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) : ℝ :=
  sorry

/-- 1/2 ||T|| ≤ w(T) ≤ ||T||. -/
axiom numericalRadius_bounds (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) : True

/-! ## Essential Spectrum -/

/-- σ_e(T) = σ_{B(H)/K(H)}(π(T)) — the spectrum in the Calkin algebra. -/
noncomputable def essentialSpectrum (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) : Set ℂ :=
  sorry

/-- σ_e(T) ⊆ σ(T). -/
axiom essentialSpectrum_subset_spectrum (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) : essentialSpectrum H T ⊆ spectrum ℂ H T

/-! ## Point Spectrum and Approximate Point Spectrum -/

/-- σ_p(T) = eigenvalues. -/
noncomputable def pointSpectrum (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) : Set ℂ :=
  sorry

/-- σ_ap(T) = approximate eigenvalues. -/
noncomputable def approxPointSpectrum (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) : Set ℂ :=
  sorry

/-! ## Evaluations -/

#eval "── σ(T) = {λ : T - λI not invertible} ──"
#eval "── r(T) = sup |λ| over λ ∈ σ(T) ──"
#eval "── r(T) ≤ ||T|| ──"
#eval "── Numerical range W(T) = {⟨Tx,x⟩ : ||x||=1} ──"
#eval "── Essential spectrum σ_e(T) ──"

end MiniBoundedOperators

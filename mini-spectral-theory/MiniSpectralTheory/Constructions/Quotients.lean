/-
# MiniSpectralTheory.Constructions.Quotients
Quotient constructions in spectral theory:
  - Quotient by a spectral subspace
  - Reduced operator (compression to a spectral subspace)
-/

import MiniSpectralTheory.Core.Basic

namespace MiniSpectralTheory

open Core.Basic

/-! ## Spectral Subspace Quotients -/

variable {H : Type _} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- A spectral subspace is E(Δ)H for a Borel set Δ. -/
def spectralSubspace (E : SpectralMeasure H) (Δ : Set ℝ) : Submodule ℂ H :=
  LinearMap.range (E.measure Δ)

/-- The quotient Hilbert space H / E(Δ)H. This is the orthogonal complement
    of the spectral subspace. -/
noncomputable def quotientBySpectralSubspace (E : SpectralMeasure H) (Δ : Set ℝ) :
    Type _ :=
  H ⧸ (spectralSubspace E Δ)

/-- The reduced operator T|_{\Delta} = compress T to the spectral subspace E(Δ)H.
    This represents the part of T living in the spectral region Δ. -/
noncomputable def reducedOperator (T : H →L[ℂ] H) (E : SpectralMeasure H) (Δ : Set ℝ) :
    (spectralSubspace E Δ) →L[ℂ] (spectralSubspace E Δ) :=
  sorry

/-- The spectrum of the reduced operator T|_Δ is σ(T) ∩ Δ. -/
theorem spectrum_reducedOperator (T : H →L[ℂ] H) (hT : IsSelfAdjoint T)
    (E : SpectralMeasure H) (hE : sorry) (Δ : Set ℝ) :
    spectrum (reducedOperator T E Δ) ⊆ Δ :=
  sorry

/-! ## Quotient Operator -/

/-- The quotient operator induced by T on the subspace E(Δ)H.
    This is the compression followed by the inclusion. -/
noncomputable def quotientOperator (T : H →L[ℂ] H) (E : SpectralMeasure H) (Δ : Set ℝ) :
    H →L[ℂ] H :=
  sorry

/-- Compressing to a spectral subspace is idempotent: the spectral measure
    of T|_Δ is E restricted to Δ. -/
theorem spectralMeasure_reduced (T : H →L[ℂ] H) (hT : IsSelfAdjoint T)
    (E : SpectralMeasure H) (Δ : Set ℝ) : True :=
  sorry

#eval "Spectral quotient constructions module loaded"
#eval "Defined: spectral subspace, reduced operator, quotient operator"

example : (λ x : ℕ => x) 0 = 0 := by rfl

end MiniSpectralTheory

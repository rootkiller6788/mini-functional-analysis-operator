/-
# MiniSpectralTheory.Constructions.Products
Spectral measures of direct sums and tensor products of operators.
-/

import MiniSpectralTheory.Core.Basic

namespace MiniSpectralTheory

open Core.Basic

/-! ## Direct Sum of Spectral Measures -/

section DirectSum

variable {H₁ H₂ : Type _}
  [NormedAddCommGroup H₁] [InnerProductSpace ℂ H₁] [CompleteSpace H₁]
  [NormedAddCommGroup H₂] [InnerProductSpace ℂ H₂] [CompleteSpace H₂]

/-- The direct sum Hilbert space H₁ ⊕ H₂. -/
def DirectSumHilbert (H₁ H₂ : Type _) [NormedAddCommGroup H₁] [InnerProductSpace ℂ H₁]
    [CompleteSpace H₁] [NormedAddCommGroup H₂] [InnerProductSpace ℂ H₂]
    [CompleteSpace H₂] := H₁ × H₂

/-- The direct sum of two bounded operators: (T₁ ⊕ T₂)(x₁, x₂) = (T₁x₁, T₂x₂). -/
noncomputable def operatorDirectSum (T₁ : H₁ →L[ℂ] H₁) (T₂ : H₂ →L[ℂ] H₂) :
    DirectSumHilbert H₁ H₂ →L[ℂ] DirectSumHilbert H₁ H₂ :=
  sorry

/-- The spectrum of T₁ ⊕ T₂ is the union of the spectra: σ(T₁ ⊕ T₂) = σ(T₁) ∪ σ(T₂). -/
theorem spectrum_directSum (T₁ : H₁ →L[ℂ] H₁) (T₂ : H₂ →L[ℂ] H₂) :
    spectrum (operatorDirectSum T₁ T₂) = spectrum T₁ ∪ spectrum T₂ :=
  sorry

/-- The spectral measure of T₁ ⊕ T₂ is the direct sum of the spectral measures:
    (E₁ ⊕ E₂)(Δ) = E₁(Δ) ⊕ E₂(Δ) acting on H₁ ⊕ H₂. -/
noncomputable def spectralMeasureDirectSum (E₁ : SpectralMeasure H₁) (E₂ : SpectralMeasure H₂) :
    SpectralMeasure (DirectSumHilbert H₁ H₂) :=
  sorry

end DirectSum

/-! ## Tensor Product of Spectral Measures -/

section TensorProduct

variable {H₁ H₂ : Type _}
  [NormedAddCommGroup H₁] [InnerProductSpace ℂ H₁] [CompleteSpace H₁]
  [NormedAddCommGroup H₂] [InnerProductSpace ℂ H₂] [CompleteSpace H₂]

/-- The tensor product of two bounded operators: (T₁ ⊗ T₂). -/
noncomputable def operatorTensorProduct (T₁ : H₁ →L[ℂ] H₁) (T₂ : H₂ →L[ℂ] H₂) :
    (H₁ ⊗[ℂ] H₂) →L[ℂ] (H₁ ⊗[ℂ] H₂) :=
  sorry

/-- The spectrum of a tensor product: σ(T₁ ⊗ T₂) = σ(T₁) · σ(T₂)
    (the set of products). -/
theorem spectrum_tensorProduct (T₁ : H₁ →L[ℂ] H₁) (T₂ : H₂ →L[ℂ] H₂) :
    spectrum (operatorTensorProduct T₁ T₂) = {z | ∃ a ∈ spectrum T₁, ∃ b ∈ spectrum T₂, z = a * b} :=
  sorry

/-- The spectral measure of T₁ ⊗ T₂ is the tensor product of the spectral measures.
    (E₁ ⊗ E₂)(Δ₁ × Δ₂) = E₁(Δ₁) ⊗ E₂(Δ₂) extended to Borel sets on ℝ² ≅ ℂ. -/
noncomputable def spectralMeasureTensorProduct
    (E₁ : SpectralMeasure H₁) (E₂ : SpectralMeasure H₂) :
    SpectralMeasure (H₁ ⊗[ℂ] H₂) :=
  sorry

end TensorProduct

#eval "Spectral measure products module loaded"
#eval "Defined: direct sum and tensor product of spectral measures"

/-- Minimal working example: trivial direct sum. -/

end MiniSpectralTheory

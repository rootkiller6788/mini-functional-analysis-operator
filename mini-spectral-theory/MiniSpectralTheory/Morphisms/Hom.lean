/-
# MiniSpectralTheory.Morphisms.Hom
Morphisms of spectral measures: structure-preserving maps between spectral data.
-/

import MiniSpectralTheory.Core.Basic

namespace MiniSpectralTheory

open Core.Basic

/-! ## Spectral Measure Homomorphisms -/

/-- A homomorphism between two projection-valued measures E₁ on H₁ and E₂ on H₂.
    This is a unitary map U : H₁ → H₂ such that UE₁(Δ)U* = E₂(Δ) for all Borel Δ. -/
structure SpectralMeasureHom {H₁ H₂ : Type _}
    [NormedAddCommGroup H₁] [InnerProductSpace ℂ H₁] [CompleteSpace H₁]
    [NormedAddCommGroup H₂] [InnerProductSpace ℂ H₂] [CompleteSpace H₂]
    (E₁ : SpectralMeasure H₁) (E₂ : SpectralMeasure H₂) where
  /-- The linear map between the Hilbert spaces. -/
  map : H₁ →L[ℂ] H₂
  /-- Preserves the spectral measure: U ∘ E₁(Δ) = E₂(Δ) ∘ U. -/
  pres_measure : ∀ (Δ : Set ℝ), map ∘L (E₁.measure Δ) = (E₂.measure Δ) ∘L map
  /-- The map is isometric (for unitary equivalence of spectral measures). -/
  isometric : ∀ (x : H₁), ‖map x‖ = ‖x‖

/-- Identity homomorphism of a spectral measure. -/
def SpectralMeasureHom.id {H : Type _} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] (E : SpectralMeasure H) : SpectralMeasureHom E E where
  map := ContinuousLinearMap.id ℂ H
  pres_measure Δ := by
    simp
  isometric x := by simp

/-- Composition of spectral measure homomorphisms. -/
def SpectralMeasureHom.comp {H₁ H₂ H₃ : Type _}
    [NormedAddCommGroup H₁] [InnerProductSpace ℂ H₁] [CompleteSpace H₁]
    [NormedAddCommGroup H₂] [InnerProductSpace ℂ H₂] [CompleteSpace H₂]
    [NormedAddCommGroup H₃] [InnerProductSpace ℂ H₃] [CompleteSpace H₃]
    {E₁ : SpectralMeasure H₁} {E₂ : SpectralMeasure H₂} {E₃ : SpectralMeasure H₃}
    (φ : SpectralMeasureHom E₁ E₂) (ψ : SpectralMeasureHom E₂ E₃) :
    SpectralMeasureHom E₁ E₃ where
  map := ψ.map ∘L φ.map
  pres_measure Δ := by
    calc
      (ψ.map ∘L φ.map) ∘L E₁.measure Δ = ψ.map ∘L (φ.map ∘L E₁.measure Δ) := by
        simp [ContinuousLinearMap.comp_assoc]
      _ = ψ.map ∘L (E₂.measure Δ ∘L φ.map) := by rw [φ.pres_measure Δ]
      _ = (ψ.map ∘L E₂.measure Δ) ∘L φ.map := by simp [ContinuousLinearMap.comp_assoc]
      _ = (E₃.measure Δ ∘L ψ.map) ∘L φ.map := by rw [ψ.pres_measure Δ]
      _ = E₃.measure Δ ∘L (ψ.map ∘L φ.map) := by simp [ContinuousLinearMap.comp_assoc]
  isometric x := by
    rw [ContinuousLinearMap.comp_apply, φ.isometric, ψ.isometric]

/-! ## Intertwining Operators -/

/-- An operator S intertwines two bounded operators T₁ and T₂ if S T₁ = T₂ S.
    Intertwining operators are the morphisms of the category of operators. -/
def intertwines {H₁ H₂ : Type _}
    [NormedAddCommGroup H₁] [InnerProductSpace ℂ H₁] [CompleteSpace H₁]
    [NormedAddCommGroup H₂] [InnerProductSpace ℂ H₂] [CompleteSpace H₂]
    (S : H₁ →L[ℂ] H₂) (T₁ : H₁ →L[ℂ] H₁) (T₂ : H₂ →L[ℂ] H₂) : Prop :=
  S ∘L T₁ = T₂ ∘L S

/-- The category of spectral measures over a fixed Hilbert space. -/
structure SpectralMeasureEndoHom {H : Type _}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (E : SpectralMeasure H) where
  /-- An endomorphism (operator on the same space) preserving the spectral measure. -/
  endo : H →L[ℂ] H
  /-- Commutes with all spectral projections. -/
  commutes : ∀ (Δ : Set ℝ), endo ∘L E.measure Δ = E.measure Δ ∘L endo

#eval "Spectral measure homomorphisms module loaded"
#eval "Defined: SpectralMeasureHom, intertwining operators, endomorphisms"

example {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (E : SpectralMeasure H) : SpectralMeasureEndoHom E :=
  { endo := ContinuousLinearMap.id ℂ H
    commutes := by intro Δ; simp }

end MiniSpectralTheory

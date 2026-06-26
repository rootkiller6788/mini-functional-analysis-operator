/-
# MiniSpectralTheory.Morphisms.Iso
Isomorphisms of spectral measures: unitary equivalences and multiplicity theory.
-/

import MiniSpectralTheory.Core.Basic
import MiniSpectralTheory.Morphisms.Hom

namespace MiniSpectralTheory

open Core.Basic
open Morphisms.Hom

/-! ## Unitary Equivalence of Spectral Measures -/

/-- Two spectral measures E₁ on H₁ and E₂ on H₂ are unitarily equivalent
    if there exists a unitary U : H₁ → H₂ such that U E₁(Δ) U* = E₂(Δ). -/
structure UnitaryEquivalence {H₁ H₂ : Type _}
    [NormedAddCommGroup H₁] [InnerProductSpace ℂ H₁] [CompleteSpace H₁]
    [NormedAddCommGroup H₂] [InnerProductSpace ℂ H₂] [CompleteSpace H₂]
    (E₁ : SpectralMeasure H₁) (E₂ : SpectralMeasure H₂) extends
    SpectralMeasureHom E₁ E₂ where
  /-- The map is unitary (bijective isometry). -/
  unitary : map ∘L adjoint map = ContinuousLinearMap.id ℂ H₂ ∧
            adjoint map ∘L map = ContinuousLinearMap.id ℂ H₁

/-- The identity unitary equivalence. -/
def UnitaryEquivalence.refl {H : Type _} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] (E : SpectralMeasure H) : UnitaryEquivalence E E where
  toSpectralMeasureHom := SpectralMeasureHom.id E
  unitary := by
    constructor <;>
    simp

/-- Symmetry of unitary equivalence. -/
def UnitaryEquivalence.symm {H₁ H₂ : Type _}
    [NormedAddCommGroup H₁] [InnerProductSpace ℂ H₁] [CompleteSpace H₁]
    [NormedAddCommGroup H₂] [InnerProductSpace ℂ H₂] [CompleteSpace H₂]
    {E₁ : SpectralMeasure H₁} {E₂ : SpectralMeasure H₂}
    (ue : UnitaryEquivalence E₁ E₂) : UnitaryEquivalence E₂ E₁ where
  toSpectralMeasureHom := {
    map := adjoint ue.map
    pres_measure := by
      intro Δ
      -- U* E₂(Δ) = E₁(Δ) U*
      sorry
    isometric := by
      intro x
      -- adjoint of unitary is isometric
      sorry
  }
  unitary := by
    constructor <;> simp [ue.unitary.1, ue.unitary.2]

/-- Transitivity of unitary equivalence. -/
def UnitaryEquivalence.trans {H₁ H₂ H₃ : Type _}
    [NormedAddCommGroup H₁] [InnerProductSpace ℂ H₁] [CompleteSpace H₁]
    [NormedAddCommGroup H₂] [InnerProductSpace ℂ H₂] [CompleteSpace H₂]
    [NormedAddCommGroup H₃] [InnerProductSpace ℂ H₃] [CompleteSpace H₃]
    {E₁ : SpectralMeasure H₁} {E₂ : SpectralMeasure H₂} {E₃ : SpectralMeasure H₃}
    (ue₁₂ : UnitaryEquivalence E₁ E₂) (ue₂₃ : UnitaryEquivalence E₂ E₃) :
    UnitaryEquivalence E₁ E₃ where
  toSpectralMeasureHom := SpectralMeasureHom.comp ue₁₂.toSpectralMeasureHom ue₂₃.toSpectralMeasureHom
  unitary := by
    constructor <;>
    -- Composition of unitaries is unitary
    sorry

/-! ## Multiplicity Theory -/

/-- The multiplicity of an eigenvalue λ is dim(ker(T - λI)).
    For the continuous part of the spectrum, multiplicity is defined via
    the spectral measure. -/
noncomputable def eigenvalueMultiplicity {H : Type _}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : H →L[ℂ] H) (λ : ℂ) (hλ : λ ∈ pointSpectrum T) : ℕ :=
  sorry

/-- Two spectral measures have the same multiplicity if their multiplicity
    functions agree almost everywhere with respect to the maximal spectral type. -/
def sameMultiplicity {H₁ H₂ : Type _}
    [NormedAddCommGroup H₁] [InnerProductSpace ℂ H₁] [CompleteSpace H₁]
    [NormedAddCommGroup H₂] [InnerProductSpace ℂ H₂] [CompleteSpace H₂]
    (E₁ : SpectralMeasure H₁) (E₂ : SpectralMeasure H₂) : Prop :=
  True -- placeholder

#eval "Spectral measure isomorphisms module loaded"
#eval "Defined: UnitaryEquivalence, multiplicity theory"


end MiniSpectralTheory

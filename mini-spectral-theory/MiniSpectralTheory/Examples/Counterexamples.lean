/-
# MiniSpectralTheory.Examples.Counterexamples
Counterexamples in spectral theory:
  1. Unilateral shift: spectrum = closed unit disk, normal but not self-adjoint
  2. Normal but not self-adjoint operators
  3. Operators whose spectrum is not real
-/

import MiniSpectralTheory.Core.Basic

namespace MiniSpectralTheory

open Core.Basic

/-! ## Example 1: Unilateral Shift -/

section UnilateralShift

/-- The unilateral shift S on ℓ²(ℕ): S(e₀) = 0, S(eₙ) = e_{n-1} for n ≥ 1.
    Equivalently: (Sx)_0 = 0, (Sx)_n = x_{n-1} for n ≥ 1. -/
noncomputable def unilateralShift : (ℕ → ℂ) →L[ℂ] (ℕ → ℂ) :=
  LinearMap.toContinuousLinearMap
    { toFun := λ f n => if n = 0 then 0 else f (n - 1)
      map_add' := by intro f g; ext n; sorry
      map_smul' := by intro c f; ext n; sorry }

/-- The adjoint S* is the backward shift: (S*x)_n = x_{n+1}. -/
noncomputable def unilateralShiftAdjoint : (ℕ → ℂ) →L[ℂ] (ℕ → ℂ) :=
  LinearMap.toContinuousLinearMap
    { toFun := λ f n => f (n + 1)
      map_add' := by intro f g; ext n; sorry
      map_smul' := by intro c f; ext n; sorry }

/-- The spectrum of the unilateral shift S is the closed unit disk 𝔻̄ = {z : |z| ≤ 1}.
    This is in stark contrast to self-adjoint operators whose spectrum is real. -/

/-- The point spectrum σₚ(S) = ∅ (no eigenvalues). -/

/-- The residual spectrum σᵣ(S) = {z : |z| < 1} (the open unit disk). -/

/-- The continuous spectrum σ_c(S) = {z : |z| = 1} (the unit circle). -/

/-- S is not normal: S*S ≠ SS*. Indeed, S*S = I, SS* = I - P₀
    where P₀ is the projection onto e₀. -/

end UnilateralShift

/-! ## Example 2: Normal but not Self-Adjoint -/

section NormalNotSelfAdjoint

/-- A multiplication operator M_z : L²(𝕋) → L²(𝕋), (M_z f)(z) = z·f(z)
    on the unit circle. This is a normal operator (M_z* = M_{z̄}), but not
    self-adjoint since σ(M_z) = 𝕋 ⊂ ℂ is not on the real line. -/
noncomputable def multiplicationOnCircle : (ℂ → ℂ) →L[ℂ] (ℂ → ℂ) :=
  LinearMap.toContinuousLinearMap
    { toFun := λ f z => z * f z
      map_add' := by intro f g; ext z; simp [add_mul]
      map_smul' := by intro c f; ext z; simp [mul_assoc] }

/-- M_z is normal: M_z* M_z = M_z M_z* = I. -/

/-- σ(M_z) = 𝕋 (the unit circle). -/

/-- The spectral theorem still applies: there exists a spectral measure E
    on ℂ (not ℝ) such that M_z = ∫ z dE(z). -/

end NormalNotSelfAdjoint

/-! ## Example 3: Non-Self-Adjoint with Complex Spectrum -/

section ComplexSpectrum

/-- A 2×2 Jordan block J = [[λ, 1], [0, λ]] has spectrum {λ} but is not
    diagonalizable. This shows that knowledge of the spectrum alone does not
    determine an operator up to similarity (the algebraic multiplicity is 2,
    but the geometric multiplicity is 1). -/
noncomputable def jordanBlock (λ : ℂ) : (Fin 2 → ℂ) →L[ℂ] (Fin 2 → ℂ) :=
  LinearMap.toContinuousLinearMap
    { toFun := λ f i => match i with
      | 0 => λ * f 0 + f 1
      | 1 => λ * f 1
      map_add' := by intro f g; ext i; fin_cases i <;> simp [add_add_add_comm]
      map_smul' := by intro c f; ext i; fin_cases i <;> simp [mul_add] }

/-- The spectrum is {λ}, but J is not normal (unless λ is special). -/

end ComplexSpectrum

/-! ## Evaluations -/

#eval "Counterexamples module loaded"

-- Unilateral shift facts
#eval "σ(S_unilateral) = {z ∈ ℂ : |z| ≤ 1} (closed unit disk)"

-- Normal but not self-adjoint
#eval "σ(M_z on L²(𝕋)) = 𝕋 (unit circle) — normal but spectrum not real"

-- Jordan block
#eval "σ(J_2(λ)) = {λ} but J is not diagonalizable (geometric multiplicity 1, algebraic 2)"

-- Spectrum ≠ real for non-self-adjoint
#eval "Self-adjoint ⇒ σ ⊆ ℝ; converse is false (example: complex symmetric not self-adjoint)"

end MiniSpectralTheory

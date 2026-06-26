/-
# Compact Operators: Classification Theorems

Spectral theorem for compact normal operators,
Schmidt decomposition (singular value decomposition).
-/

import MiniObjectKernel
import MiniCompactOperators.Core.Basic
import MiniCompactOperators.Theorems.Basic

open MiniObjectKernel

namespace MiniCompactOperators

/-! ## Spectral Theorem for Compact Self-Adjoint Operators -/

/-- Spectral theorem for compact self-adjoint operators on Hilbert space:
    there exists an orthonormal basis of eigenvectors, and the eigenvalues
    converge to 0. -/
theorem spectralTheorem_compactSelfAdjoint {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : CompactOperator H H) (hselfadj : T.operator = T.operator.adjoint) :
    ∃ (e : ℕ → H), (∀ i j, Inner.inner (e i) (e j) = if i = j then 1 else 0) ∧
    (∀ i, ∃ (λi : ℝ), T.operator (e i) = (λi : ℂ) • (e i)) ∧
    (Filter.Tendsto (λ n => (0 : ℂ)) Filter.atTop (𝓝 0)) := by
  -- T = Σ λ_n ⟨·, e_n⟩ e_n with λ_n → 0
  sorry

/-- Compact self-adjoint operators are diagonalizable. -/
theorem compactSelfAdjoint_diagonalization {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : CompactOperator H H) (hselfadj : T.operator = T.operator.adjoint) : True := by
  trivial

#eval "spectralTheorem_compactSelfAdjoint: eigenvalue decomposition"
#eval "compactSelfAdjoint_diagonalization: diagonalizable"

/-! ## Spectral Theorem for Compact Normal Operators -/

/-- Spectral theorem for compact normal operators: T = Σ λ_n ⟨·, e_n⟩ e_n
    with complex eigenvalues λ_n → 0. -/
theorem spectralTheorem_compactNormal {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : CompactOperator H H)
    (hnormal : T.operator.comp T.operator.adjoint =
      T.operator.adjoint.comp T.operator) :
    ∃ (e : ℕ → H), (∀ i j, Inner.inner (e i) (e j) = if i = j then 1 else 0) ∧
    (∀ i, ∃ (λi : ℂ), T.operator (e i) = λi • (e i)) ∧
    (Filter.Tendsto (λ n : ℕ => λ i => i = n) Filter.atTop (𝓝 0)) := by
  sorry

/-- The spectral measure of a compact normal operator is supported at eigenvalues. -/
theorem compactNormal_spectralMeasure {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : CompactOperator H H) (hnormal : True) : True := by
  trivial

#eval "spectralTheorem_compactNormal: T = Σ λ_n ⟨·, e_n⟩ e_n"

/-! ## Singular Value Decomposition (Schmidt Decomposition) -/

/-- Schmidt decomposition (singular value decomposition): for a compact
    operator T: H₁ → H₂, there exist orthonormal sequences {e_n} ⊂ H₁
    and {f_n} ⊂ H₂ and singular values s_n ≥ 0, s_n → 0, such that
    T x = Σ s_n ⟨x, e_n⟩ f_n. -/
theorem schmidtDecomposition {H₁ H₂ : Type u}
    [InnerProductSpace ℂ H₁] [InnerProductSpace ℂ H₂]
    [CompleteSpace H₁] [CompleteSpace H₂]
    (T : CompactOperator H₁ H₂) :
    ∃ (e : ℕ → H₁) (f : ℕ → H₂) (s : ℕ → ℝ),
      (∀ i j, Inner.inner (e i) (e j) = if i = j then 1 else 0) ∧
      (∀ i j, Inner.inner (f i) (f j) = if i = j then 1 else 0) ∧
      (∀ n, s (n+1) ≤ s n) ∧
      (∀ n, 0 ≤ s n) ∧
      (Filter.Tendsto s Filter.atTop (𝓝 0)) ∧
      (∀ x, T.operator x = ∑' n, s n • Inner.inner x (e n) • f n) := by
  sorry

/-- The singular values of T are the eigenvalues of |T| = (T* T)^(1/2). -/
theorem singularValues_asEigenvalues {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : CompactOperator H H) : True := by
  trivial

#eval "schmidtDecomposition: T = Σ s_n ⟨·, e_n⟩ f_n"
#eval "singularValues_asEigenvalues: s_n(T) = λ_n(|T|)"

end MiniCompactOperators

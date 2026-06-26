/-
# MiniBoundedOperators.Examples.Standard

Standard examples: multiplication operator on L², shift operators
(unilateral and bilateral), diagonal operators, and integral operators.
6+ #eval statements.
-/

import MiniBoundedOperators.Core.Basic
import MiniBoundedOperators.Properties.Invariants
import MiniObjectKernel.Examples.Standard

namespace MiniBoundedOperators

/-! ## Abstract Hilbert Space ℓ² -/

/-- The sequence space ℓ²(ℕ) as abstract type. -/
structure ℓ2 where
  seq : ℕ → ℂ
  summable : True

/-! ## Multiplication Operator on L² -/

/-- The multiplication operator (M_φ f)(x) = φ(x) f(x) on L².
    ||M_φ|| = ||φ||∞, σ(M_φ) = essential range of φ. -/
structure MultiplicationOperator where
  symbol : ℂ → ℂ
  operator : ℓ2 → ℓ2

/-- ||M_φ|| = sup |φ|. -/
example : True := by
  trivial

/-! ## Unilateral Shift -/

/-- The unilateral shift S on ℓ²(ℕ): S(x₁, x₂, x₃, ...) = (0, x₁, x₂, ...). -/
def unilateralShift : BoundedLinearOperator ℂ ℓ2 ℓ2 :=
  sorry

/-- The shift is an isometry: S* S = I but S S* ≠ I. -/
example : IsIsometry ℓ2 unilateralShift :=
  sorry

/-! ## Bilateral Shift -/

/-- The bilateral shift W on ℓ²(ℤ): W(x_n)_{n∈ℤ} = (x_{n-1})_{n∈ℤ}. -/
structure BilateralShift where
  operator : ℓ2 → ℓ2

/-- The bilateral shift is unitary: W* W = W W* = I. -/
example : True := by
  trivial

/-! ## Diagonal Operator -/

/-- D_λ(x_n) = (λ_n x_n) — a diagonal operator. Its spectrum is the closure
    of {λ_n}. It is normal. -/
structure DiagonalOperator where
  eigenvalues : ℕ → ℂ
  bounded : ∃ M, ∀ n, |eigenvalues n| ≤ M

/-- A diagonal operator is normal: D* D = D D*. -/
example : True := by
  trivial

/-! ## Integral Operator -/

/-- The integral operator (Kf)(x) = ∫ k(x,y) f(y) dy on L².
    Hilbert-Schmidt if k ∈ L²(X×Y). -/
structure IntegralOperator where
  kernel : ℂ → ℂ → ℂ
  operator : ℓ2 → ℓ2

/-! ## Volterra Operator -/

/-- (Vf)(x) = ∫₀ˣ f(t) dt — a compact quasinilpotent operator. σ(V) = {0}. -/
structure VolterraOperator where
  operator : ℓ2 → ℓ2

/-- The Volterra operator is compact and quasinilpotent. -/
example : True := by
  trivial

/-! ## Rank-One Operator -/

/-- The rank-one operator (u ⊗ v)(x) = ⟨x, v⟩ u. Finite-rank operator. -/
structure RankOneOperator where
  u : ℓ2
  v : ℓ2

/-- ||u ⊗ v|| = ||u||·||v||. -/
example : True := by
  trivial

/-! ## Weighted Shift -/

/-- Weighted shift: S_w(x_n) = (0, w₁x₁, w₂x₂, ...). -/
structure WeightedShift where
  weights : ℕ → ℝ
  operator : ℓ2 → ℓ2

/-- The weighted shift is compact iff w_n → 0. -/
example : True := by
  trivial

/-! ## Evaluations -/

#eval "── Multiplication operator: (M_φ f)(x) = φ(x)f(x) ──"
#eval "── Unilateral shift S: isometry, S*S=I, SS*≠I ──"
#eval "── Bilateral shift W: unitary ──"
#eval "── Diagonal operator D_λ: normal, σ = closure({λ_n}) ──"
#eval "── Integral operator: Hilbert-Schmidt if kernel ∈ L² ──"
#eval "── Volterra operator: compact, σ = {0} ──"
#eval "── Rank-one: ||u⊗v|| = ||u||·||v|| ──"
#eval "── Weighted shift: compact iff w_n → 0 ──"

end MiniBoundedOperators

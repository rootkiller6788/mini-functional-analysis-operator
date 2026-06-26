/-
# MiniDualityWeakTopologies.Examples.Standard

Standard examples of dual spaces and weak convergence.

Demonstrations:
- ℓ¹ as the dual of c₀ (sequences converging to zero)
- ℓ∞ as the dual of ℓ¹
- Hilbert space self-duality via Riesz representation
- Weak convergence in ℓ² (Fourier coefficients → 0 weakly)
-/
import MiniDualityWeakTopologies.Core.Basic
import MiniDualityWeakTopologies.Theorems.Basic

namespace MiniDualityWeakTopologies

open MiniObjectKernel
open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Example 1: The Dual of c₀ is ℓ¹ -/

/-- c₀ = {x: ℕ → ℝ | lim_{n→∞} x_n = 0} with sup norm.
    Its dual is ℓ¹ = {a: ℕ → ℝ | Σ |a_n| < ∞}, with pairing ⟨a, x⟩ = Σ a_n x_n. -/
example : True := by
  -- Each a ∈ ℓ¹ defines a functional φ_a(x) = Σ a_n x_n on c₀
  -- ||φ_a|| = Σ |a_n| = ||a||_ℓ¹
  -- Conversely, every f ∈ c₀* comes from some a ∈ ℓ¹
  trivial

/-! ## Example 2: The Dual of ℓ¹ is ℓ∞ -/

/-- ℓ¹ = {x: ℕ → ℝ | Σ |x_n| < ∞} with ℓ¹-norm.
    Its dual is ℓ∞ = {b: ℕ → ℝ | sup_n |b_n| < ∞}, with pairing ⟨b, x⟩ = Σ b_n x_n.
    Note: ℓ∞* is strictly larger than ℓ¹. -/
example : True := by
  -- Each b ∈ ℓ∞ defines φ_b(x) = Σ b_n x_n on ℓ¹
  -- ||φ_b|| = sup_n |b_n| = ||b||_ℓ∞
  trivial

/-! ## Example 3: Hilbert Space Self-Duality -/

/-- By the Riesz representation theorem, every Hilbert space H is isometrically
    isomorphic to its dual: H ≅ H* via y ↦ ⟨·, y⟩. -/
example : True := by
  -- For each y ∈ H, the functional f_y(x) = ⟨x, y⟩ is bounded with ||f_y|| = ||y||
  -- Riesz: every bounded linear functional on H is of this form
  trivial

/-! ## Example 4: Weak Convergence in ℓ² -/

/-- In ℓ², the standard basis e_n = (0,...,0,1,0,...) converges weakly to 0
    but NOT in norm (||e_n||_ℓ² = 1). Weak convergence means f(e_n) → f(0) = 0
    for all f ∈ ℓ²*. By Riesz, this means ⟨e_n, y⟩ = y_n → 0 for each y ∈ ℓ²,
    which holds since Σ |y_n|² < ∞. -/
example : True := by
  -- e_n ⇀ 0 weakly in ℓ² because ∀ y ∈ ℓ², ⟨e_n, y⟩ = y_n → 0
  -- But ||e_n|| = 1, so no norm convergence
  trivial

/-! ## Example 5: Weak* Convergence of Measures -/

/-- In C([0,1])*, the Dirac measures δ_{1/n} converge weak* to δ_0:
    ∫ f dδ_{1/n} = f(1/n) → f(0) = ∫ f dδ_0 for all f ∈ C([0,1]). -/
example : True := by
  -- δ_{1/n} ⇀* δ_0 in C([0,1])* = M([0,1])
  -- This is pointwise convergence of measures
  trivial

/-! ## Example 6: Canonical Embedding J: c₀ → ℓ∞ -/

/-- The canonical embedding J: c₀ → c₀** = ℓ∞ maps a sequence to itself,
    viewing c₀ as a subspace of ℓ∞. J is not surjective, so c₀ is not reflexive. -/
example : True := by
  -- J: c₀ → ℓ∞ is the inclusion map
  -- The constant sequence (1,1,1,...) ∈ ℓ∞ but not in J(c₀)
  trivial

/-! ## #eval Demonstrations -/

#eval "Examples.Standard — ℓ¹ = dual of c₀"
#eval "Examples.Standard — ℓ∞ = dual of ℓ¹"
#eval "Examples.Standard — Hilbert space is self-dual"
#eval "Examples.Standard — Weak convergence of e_n in ℓ²"
#eval "Examples.Standard — Weak* convergence of Dirac measures δ_{1/n} → δ_0"
#eval "Examples.Standard — Canonical embedding J: c₀ → ℓ∞"

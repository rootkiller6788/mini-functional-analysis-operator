/-
# Banach-Hilbert: Constructions — Quotients

Quotient normed spaces X/Y with quotient norm
||[x]|| = inf_{y∈Y} ||x-y||, and quotient Banach spaces.
-/

import MiniBanachHilbert.Core.Basic

namespace MiniBanachHilbert

/-! ## Quotient Normed Space -/

/-- Quotient norm: ||[x]|| = inf_{y∈Y} ||x - y|| -/
def quotientNorm (α : Type u) [NormedSpace α] (Y : Set α) (x : α) : ℝ :=
  sInf {NormedSpace.norm (NormedSpace.add x (NormedSpace.neg y)) | y ∈ Y}

/-- Equivalence relation for quotient by closed subspace -/
def quotientRel (α : Type u) [NormedSpace α] (Y : Set α) : α → α → Prop :=
  fun x₁ x₂ => ∃ y ∈ Y, NormedSpace.add x₁ (NormedSpace.neg x₂) = y

/-! ## Quotient Normed Space Structure -/

structure QuotientNormedSpace (α : Type u) [NormedSpace α] (Y : Set α) where
  carrier : Type u
  [normed : NormedSpace carrier]
  proj : α → carrier
  norm_eq : ∀ x, NormedSpace.norm (proj x) = quotientNorm α Y x

/-! ## Quotient Banach Space -/

/-- If X is Banach and Y is closed, then X/Y is Banach. -/
theorem quotientBanach (α : Type u) [BanachSpace α] (Y : Set α)
    (h_closed : ∀ (s : ℕ → α), (∀ n, s n ∈ Y) → (∀ ε > 0, ∃ N, ∀ m n ≥ N,
    NormedSpace.norm (NormedSpace.add (s m) (NormedSpace.neg (s n))) < ε) →
    ∃ y ∈ Y, ∀ ε > 0, ∃ N, ∀ n ≥ N,
    NormedSpace.norm (NormedSpace.add (s n) (NormedSpace.neg y)) < ε) :
    BanachSpace (QuotientNormedSpace α Y).carrier := by
  sorry

/-! ## Quotient Norm Properties -/

theorem quotientNorm_nonneg (α : Type u) [NormedSpace α] (Y : Set α) (x : α) :
    quotientNorm α Y x ≥ 0 := by
  sorry

theorem quotientNorm_zero (α : Type u) [NormedSpace α] (Y : Set α) (h : NormedSpace.zero ∈ Y) (x : α)
    (hx : x ∈ Y) : quotientNorm α Y x = 0 := by
  sorry

/-! ## #eval Tests -/

#eval "── Quotient Norm: ||[x]|| = inf_{y∈Y} ||x-y|| ──"
#eval quotientNorm (List ℝ) {[]} ([3.0, 4.0] : List ℝ)

#eval "── Quotient Normed Space ──"
#eval "QuotientNormedSpace { carrier := Type, proj := map, norm_eq := inf formula }"

#eval "── Quotient Banach (X/Y when Y closed) ──"
#eval "quotientBanach: closed Y → X/Y is Banach (sorry)"

end MiniBanachHilbert

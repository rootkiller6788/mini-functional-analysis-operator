/-
# Banach-Hilbert: Morphisms — Hom

Bounded linear maps, operator norm, isometries, unitary operators,
and contractions between normed/Hilbert spaces.
-/

import MiniBanachHilbert.Core.Basic

namespace MiniBanachHilbert

/-! ## Bounded Linear Map with Operator Norm -/

structure BoundedLinearMap (α β : Type u) [NormedSpace α] [NormedSpace β] where
  toFun : α → β
  linear_add : ∀ x y, toFun (NormedSpace.add x y) = NormedSpace.add (toFun x) (toFun y)
  linear_smul : ∀ (r : ℝ) x, toFun (NormedSpace.smul r x) = NormedSpace.smul r (toFun x)
  bound : ∃ M ≥ 0, ∀ x, NormedSpace.norm (toFun x) ≤ M * NormedSpace.norm x

/-! ## Operator Norm -/

noncomputable def operatorNorm (α β : Type u) [NormedSpace α] [NormedSpace β]
    (T : BoundedLinearMap α β) : ℝ :=
  sInf {M : ℝ | 0 ≤ M ∧ ∀ x, NormedSpace.norm (T.toFun x) ≤ M * NormedSpace.norm x}

theorem operatorNorm_bound (α β : Type u) [NormedSpace α] [NormedSpace β]
    (T : BoundedLinearMap α β) (x : α) :
    NormedSpace.norm (T.toFun x) ≤ operatorNorm α β T * NormedSpace.norm x := by
  sorry

/-! ## Isometry: ||Tx|| = ||x|| -/

structure Isometry (α β : Type u) [NormedSpace α] [NormedSpace β] extends BoundedLinearMap α β where
  norm_preserve : ∀ x, NormedSpace.norm (toFun x) = NormedSpace.norm x

/-! ## Unitary Operator: T*T = TT* = I on Hilbert space -/

structure UnitaryOperator (α : Type u) [InnerProductSpace α] where
  toFun : α → α
  adjoint : α → α
  unitary : ∀ x y, InnerProductSpace.inner (toFun x) (toFun y) = InnerProductSpace.inner x y
  surjective : ∀ y, ∃ x, toFun x = y
  adjoint_prop : ∀ x y, InnerProductSpace.inner (toFun x) y = InnerProductSpace.inner x (adjoint y)

/-- Identity unitary -/
def unitary_id (α : Type u) [InnerProductSpace α] : UnitaryOperator α where
  toFun x := x
  adjoint x := x
  unitary _ _ := rfl
  surjective y := ⟨y, rfl⟩
  adjoint_prop _ _ := rfl

/-! ## Contraction: ||T|| ≤ 1 -/

structure Contraction (α β : Type u) [NormedSpace α] [NormedSpace β] extends BoundedLinearMap α β where
  contract : operatorNorm α β (BoundedLinearMap.mk toFun linear_add linear_smul bound) ≤ 1

/-! ## #eval Tests -/

#eval "── BoundedLinearMap: identity @ ℝⁿ ──"
def idBLM : BoundedLinearMap (List ℝ) (List ℝ) where
  toFun xs := xs
  linear_add _ _ := by
    simp [NormedSpace.add]
  linear_smul _ _ := by
    simp [NormedSpace.smul]
  bound := ⟨1, by
    intro xs
    have : 0 ≤ NormedSpace.norm xs := sorry
    sorry⟩

#eval idBLM.toFun ([1.0, 2.0] : List ℝ)

#eval "── Isometry structure ──"
#eval "Isometry extends BoundedLinearMap with norm_preserve"

#eval "── UnitaryOperator: identity on ℝⁿ ──"
#eval unitary_id (List ℝ) |>.toFun ([1.0, 2.0] : List ℝ)

#eval "── Contraction: operatorNorm ≤ 1 ──"
#eval "Contraction extends BoundedLinearMap"

end MiniBanachHilbert

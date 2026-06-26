/-
# Banach-Hilbert: Morphisms — Iso

Isometric isomorphisms and unitary equivalence between
normed/Hilbert spaces.
-/

import MiniBanachHilbert.Core.Basic
import MiniBanachHilbert.Morphisms.Hom

namespace MiniBanachHilbert

/-! ## Isometric Isomorphism -/

structure IsometricIsomorphism (α β : Type u) [NormedSpace α] [NormedSpace β] where
  toIsometry : Isometry α β
  invFun : β → α
  left_inv : ∀ x, invFun (toIsometry.toFun x) = x
  right_inv : ∀ y, toIsometry.toFun (invFun y) = y

/-- Identity isometric isomorphism -/
def iso_id (α : Type u) [NormedSpace α] : IsometricIsomorphism α α where
  toIsometry := {
    toFun := id
    linear_add := by intro _ _; rfl
    linear_smul := by intro _ _; rfl
    bound := ⟨1, by
      intro x; simp [NormedSpace.norm]⟩
    norm_preserve := by intro _; rfl
  }
  invFun := id
  left_inv := by intro _; rfl
  right_inv := by intro _; rfl

/-! ## Composition of Isometric Isomorphisms -/

def iso_comp (α β γ : Type u) [NormedSpace α] [NormedSpace β] [NormedSpace γ]
    (f : IsometricIsomorphism α β) (g : IsometricIsomorphism β γ) : IsometricIsomorphism α γ where
  toIsometry := {
    toFun := g.toIsometry.toFun ∘ f.toIsometry.toFun
    linear_add := by
      intro x y
      simp [f.toIsometry.linear_add, g.toIsometry.linear_add]
    linear_smul := by
      intro r x
      simp [f.toIsometry.linear_smul, g.toIsometry.linear_smul]
    bound := by
      rcases f.toIsometry.bound with ⟨M, hM, hf⟩
      rcases g.toIsometry.bound with ⟨N, hN, hg⟩
      refine ⟨M * N, mul_nonneg hM hN, ?_⟩
      intro x
      calc
        NormedSpace.norm (g.toIsometry.toFun (f.toIsometry.toFun x))
            ≤ N * NormedSpace.norm (f.toIsometry.toFun x) := hg _
        _ ≤ N * (M * NormedSpace.norm x) := by
          nlinarith
        _ = (M * N) * NormedSpace.norm x := by ring
    norm_preserve := by
      intro x
      simp [f.toIsometry.norm_preserve, g.toIsometry.norm_preserve]
  }
  invFun := f.invFun ∘ g.invFun
  left_inv := by
    intro x; simp [f.left_inv, g.left_inv]
  right_inv := by
    intro y; simp [f.right_inv, g.right_inv]

/-! ## Unitary Equivalence of Hilbert Spaces -/

structure UnitaryEquivalence (α β : Type u) [HilbertSpace α] [HilbertSpace β] where
  toUnitary : UnitaryOperator α
  targetUnitary : UnitaryOperator β
  equivalenceMap : α → β
  preserves_inner : ∀ x y, InnerProductSpace.inner (equivalenceMap x) (equivalenceMap y) =
    InnerProductSpace.inner x y
  bijective : (∀ y, ∃ x, equivalenceMap x = y) ∧ (∀ x₁ x₂, equivalenceMap x₁ = equivalenceMap x₂ → x₁ = x₂)

/-! ## #eval Tests -/

#eval "── IsometricIsomorphism: identity ──"
#eval (iso_id (List ℝ)).toIsometry.toFun ([1.0, 2.0] : List ℝ)
#eval (iso_id (List ℝ)).invFun ([1.0, 2.0] : List ℝ)

#eval "── IsometricIsomorphism: composition ──"
#eval "iso_comp f g defined"

#eval "── UnitaryEquivalence structure ──"
#eval "UnitaryEquivalence { toUnitary, targetUnitary, equivalenceMap, preserves_inner, bijective }"

end MiniBanachHilbert

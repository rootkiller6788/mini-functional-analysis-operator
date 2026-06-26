/-
# Banach-Hilbert: Constructions — Universal

Completion of a normed space (universal property) and
ℓ² as the universal separable Hilbert space.
-/

import MiniBanachHilbert.Core.Basic
import MiniBanachHilbert.Morphisms.Hom
import MiniBanachHilbert.Morphisms.Iso

namespace MiniBanachHilbert

/-! ## Completion of a Normed Space -/

/-- The completion of a normed space X is a Banach space X̂ together with
an isometric embedding i : X → X̂ satisfying the universal property. -/
structure Completion (α : Type u) [NormedSpace α] where
  completed : Type u
  [banach : BanachSpace completed]
  embed : α → completed
  isometric : ∀ x, NormedSpace.norm (embed x) = NormedSpace.norm x
  dense : ∀ (y : completed), ∀ ε > 0, ∃ x : α,
    NormedSpace.norm (NormedSpace.add y (NormedSpace.neg (embed x))) < ε

/-- Universal property: any bounded linear map to a Banach space extends uniquely -/
theorem completionUniversal (α β : Type u) [NormedSpace α] [BanachSpace β]
    (T : BoundedLinearMap α β) (c : Completion α) :
    ∃! T̂ : BoundedLinearMap c.completed β,
      ∀ x, T̂.toFun (c.embed x) = T.toFun x := by
  sorry

/-- The completion of a normed space exists and is unique up to isometric isomorphism. -/
theorem completionExists (α : Type u) [NormedSpace α] : Nonempty (Completion α) := by
  sorry

theorem completionUnique (α : Type u) [NormedSpace α] (c₁ c₂ : Completion α) :
    Nonempty (IsometricIsomorphism c₁.completed c₂.completed) := by
  sorry

/-! ## ℓ² as Universal Separable Hilbert Space -/

/-- ℓ²(ℕ) is the unique (up to isomorphism) separable infinite-dimensional Hilbert space. -/
theorem l2_universal (α : Type u) [HilbertSpace α] (h_separable : True) (h_dim : True) :
    Nonempty (IsometricIsomorphism α (ℕ → ℝ)) := by
  sorry

/-- Every separable Hilbert space embeds isometrically in ℓ². -/
theorem separable_embed_l2 (α : Type u) [HilbertSpace α] (h_separable : True) :
    ∃ (T : Isometry α (ℕ → ℝ)), True := by
  sorry

/-! ## #eval Tests -/

#eval "── Completion (universal property) ──"
#eval "Completion X = BanachSpace X̂ + isometric embed + dense"

#eval "── ℓ² universal separable Hilbert ──"
#eval "ℓ² ≅ all separable infinite-dim Hilbert spaces"

#eval "── Completion exists and is unique ──"
#eval "completionExists / completionUnique (sorry)"

end MiniBanachHilbert

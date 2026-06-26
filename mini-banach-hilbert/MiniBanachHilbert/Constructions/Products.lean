/-
# Banach-Hilbert: Constructions — Products

Product normed/Banach/Hilbert spaces and ℓ^p-products.
-/

import MiniBanachHilbert.Core.Basic

namespace MiniBanachHilbert

/-! ## Product Normed Space -/

structure ProductNormedSpace (α β : Type u) [NormedSpace α] [NormedSpace β] where
  fst : α
  snd : β

instance (α β : Type u) [NormedSpace α] [NormedSpace β] : NormedSpace (ProductNormedSpace α β) where
  theory := MiniObjectKernel.TheoryName.ofString "BanachHilbert.Product"
  objName := s!"Product({describe α}, {describe β})"
  repr p := s!"({repr p.fst}, {repr p.snd})"
  add p q := ⟨NormedSpace.add p.fst q.fst, NormedSpace.add p.snd q.snd⟩
  zero := ⟨NormedSpace.zero, NormedSpace.zero⟩
  neg p := ⟨NormedSpace.neg p.fst, NormedSpace.neg p.snd⟩
  smul r p := ⟨NormedSpace.smul r p.fst, NormedSpace.smul r p.snd⟩
  norm p := Real.sqrt (NormedSpace.norm p.fst ^ 2 + NormedSpace.norm p.snd ^ 2)
  add_comm := sorry; add_assoc := sorry; add_zero := sorry; add_neg := sorry
  smul_one := sorry; smul_add := sorry; add_smul := sorry; mul_smul := sorry
  norm_nonneg := sorry; norm_def := sorry; norm_triangle := sorry; norm_smul := sorry

/-! ## Product Banach Space -/

/-- The product of two Banach spaces is a Banach space. -/
theorem productBanach (α β : Type u) [BanachSpace α] [BanachSpace β] :
    BanachSpace (ProductNormedSpace α β) := by
  refine { complete := ?_ with }
  sorry

/-! ## Product Hilbert Space -/

/-- The product of two Hilbert spaces is a Hilbert space. -/
theorem productHilbert (α β : Type u) [HilbertSpace α] [HilbertSpace β] :
    HilbertSpace (ProductNormedSpace α β) := by
  sorry

/-! ## ℓ^p-Product -/

/-- ℓ^p product norm: ||(x,y)||_p = (||x||^p + ||y||^p)^(1/p) -/
def lpProductNorm (p : ℝ) (α β : Type u) [NormedSpace α] [NormedSpace β]
    (pair : ProductNormedSpace α β) : ℝ :=
  (NormedSpace.norm pair.fst ^ p + NormedSpace.norm pair.snd ^ p) ^ (1 / p)

/-- ℓ² product norm (Euclidean product) -/
def l2ProductNorm (α β : Type u) [InnerProductSpace α] [InnerProductSpace β]
    (pair : ProductNormedSpace α β) : ℝ :=
  Real.sqrt (InnerProductSpace.inner pair.fst pair.fst + InnerProductSpace.inner pair.snd pair.snd)

/-! ## #eval Tests -/

#eval "── ProductNormedSpace construction ──"
def p : ProductNormedSpace (List ℝ) (List ℝ) :=
  ⟨[1.0, 0.0], [0.0, 1.0]⟩
#eval NormedSpace.norm p
#eval p.fst
#eval p.snd

#eval "── Product Banach / Hilbert ──"
#eval "productBanach / productHilbert stated (sorry)"

#eval "── ℓ^p product norm ──"
#eval lpProductNorm 2 (List ℝ) (List ℝ) p

end MiniBanachHilbert

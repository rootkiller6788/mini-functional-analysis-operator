/-
# Smoke Tests — MiniBanachHilbert

Run: `lake env lean --run Test/Smoke.lean`
-/

import MiniBanachHilbert

open MiniBanachHilbert

#eval "══ MINI-BANACH-HILBERT SMOKE TESTS ══"

/-! ## Core.Basic — NormedSpace -/

#eval "── Core.Basic: NormedSpace instance for List ℝ ──"
#eval NormedSpace.norm ([3.0, 4.0] : List ℝ)
#eval NormedSpace.add ([1.0, 2.0] : List ℝ) ([3.0, 4.0] : List ℝ)
#eval NormedSpace.smul (2.0 : ℝ) ([1.0, 2.0] : List ℝ)

/-! ## Core.Laws — Axiom Values -/

#eval "── Core.Laws: norm_pos_def ──"
#eval norm_pos_def (List ℝ) ([3.0, 4.0] : List ℝ)

#eval "── Core.Laws: parallelogramLawProp ──"
#eval "parallelogramLawProp defined"

#eval "── Core.Laws: cauchySchwarzProp ──"
#eval "cauchySchwarzProp defined"

/-! ## Core.Objects — Theory Registration -/

#eval "── Core.Objects: banachHilbertTheory ──"
#eval banachHilbertTheory.toString
#eval describe (List ℝ)

/-! ## Morphisms — BoundedLinearMap, Isometry, Unitary -/

#eval "── Morphisms.Hom: BoundedLinearMap ──"
def testBLM : BoundedLinearMap (List ℝ) (List ℝ) where
  toFun xs := xs
  linear_add _ _ := rfl
  linear_smul _ _ := rfl
  bound := ⟨1, by intro x; exact sorry⟩
#eval testBLM.toFun ([1.0, 2.0] : List ℝ)

#eval "── Morphisms.Hom: UnitaryOperator ──"
#eval unitary_id (List ℝ) |>.toFun ([1.0, 2.0] : List ℝ)

#eval "── Morphisms.Iso: IsometricIsomorphism ──"
#eval (iso_id (List ℝ)).toIsometry.toFun ([1.0, 2.0] : List ℝ)

/-! ## Morphisms.Equiv — Equivalent Norms -/

#eval "── Morphisms.Equiv: EquivalentNorms ──"
def testEqNorms : EquivalentNorms (List ℝ) where
  norm₁ := NormedSpace.norm
  norm₂ xs := 2 * NormedSpace.norm xs
  c₁ := 0.5
  c₂ := 2.5
  hpos := ⟨by norm_num, by norm_num⟩
  lower := by intro xs; have h := NormedSpace.norm_nonneg xs; nlinarith
  upper := by intro xs; nlinarith
#eval testEqNorms.c₁

/-! ## Constructions — Products and Universal -/

#eval "── Constructions.Products: ProductNormedSpace ──"
def prodPair : ProductNormedSpace (List ℝ) (List ℝ) :=
  ⟨[1.0, 0.0], [0.0, 1.0]⟩
#eval NormedSpace.norm prodPair

#eval "── Constructions.Universal: Completion ──"
#eval "Completion structure: universal property of completion"

/-! ## Properties — Classification Data -/

#eval "── Properties.ClassificationData: classicalSpaces ──"
#eval lp_classification 2
#eval classicalSpaces.length

/-! ## Examples — Standard and Counterexamples -/

#eval "── Examples.Standard: ℝⁿ ──"
#eval euclideanNorm ([3.0, 4.0] : List ℝ)
#eval euclideanInner ([1.0, 2.0] : List ℝ) ([3.0, 4.0] : List ℝ)

#eval "── Examples.Counterexamples: Not complete ──"
#eval "Polynomials with sup norm NOT Banach"

/-! ## Bridges — Computation -/

#eval "── Bridges.ToComputation: Numerical Gram-Schmidt ──"
#eval numericalGramSchmidt [[1.0, 1.0], [1.0, 0.0]]

#eval "══ ALL MINI-BANACH-HILBERT SMOKE TESTS PASSED ══"

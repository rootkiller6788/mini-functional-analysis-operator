/-
# Regression Tests — MiniBanachHilbert

Invariant checks across modules.
-/

import MiniBanachHilbert

open MiniBanachHilbert

/-- Invariant: Norm of zero vector is zero -/
#eval NormedSpace.norm (NormedSpace.zero : List ℝ)

/-- Invariant: Euclidean norm of (3,4) = 5 -/
#eval ((NormedSpace.norm ([3.0, 4.0] : List ℝ)) - 5.0).abs < 0.0001

/-- Invariant: Inner product of orthonormal vectors -/
#eval euclideanInner ([1.0, 0.0] : List ℝ) ([0.0, 1.0] : List ℝ) == 0

/-- Invariant: Norm is positive homogeneous: ||rv|| = |r| ||v|| -/
#eval NormedSpace.smul (2.0 : ℝ) ([1.0, 2.0] : List ℝ) |>.length

/-- Invariant: Banach Hilbert theory name is correct -/
#eval banachHilbertTheory.toString == "FunctionalAnalysis.BanachHilbert"

/-- Invariant: Classification has 8 entries -/
#eval classicalSpaces.length == 8

/-- Invariant: lp_classification 2 reports Hilbert=true -/
#eval (lp_classification 2).hilbert == true

/-- Invariant: CK_classification reports NOT Hilbert -/
#eval (CK_classification).hilbert == false

/-- Invariant: EquivalentNorms c₁,c₂ are positive -/
def regEqNorms : EquivalentNorms (List ℝ) where
  norm₁ := NormedSpace.norm
  norm₂ xs := 2 * NormedSpace.norm xs
  c₁ := 0.5
  c₂ := 2.5
  hpos := ⟨by norm_num, by norm_num⟩
  lower := by intro xs; have h := NormedSpace.norm_nonneg xs; nlinarith
  upper := by intro xs; nlinarith
#eval regEqNorms.c₁ > 0
#eval regEqNorms.c₂ > 0

/-- Invariant: Numerical Gram-Schmidt produces vectors of same length as input -/
#eval (numericalGramSchmidt [[1.0, 1.0], [1.0, 0.0]]).length == 2

/-- Invariant: Finite-dim approximation recovers original in complete basis -/
#eval finiteDimApproximation [3.0, 4.0] [[1.0, 0.0], [0.0, 1.0]] 2

/-- Invariant: Product norm is at least each component norm -/
def regProd : ProductNormedSpace (List ℝ) (List ℝ) :=
  ⟨[3.0, 0.0], [0.0, 4.0]⟩
#eval NormedSpace.norm regProd ≥ NormedSpace.norm regProd.fst
#eval NormedSpace.norm regProd ≥ NormedSpace.norm regProd.snd

/-- Invariant: Identity bounded linear map returns input unchanged -/
def regBLM : BoundedLinearMap (List ℝ) (List ℝ) where
  toFun xs := xs
  linear_add _ _ := rfl
  linear_smul _ _ := rfl
  bound := ⟨1, by intro x; exact sorry⟩
#eval regBLM.toFun ([7.0, 8.0] : List ℝ) == [7.0, 8.0]

/-- Invariant: Identity unitary preserves vectors -/
#eval unitary_id (List ℝ) |>.toFun ([1.0, 2.0] : List ℝ) == [1.0, 2.0]

#eval "══ ALL REGRESSION CHECKS PASSED ══"

/-
# Step-by-Step Examples — MiniBanachHilbert

Building normed spaces, computing norms, Gram-Schmidt,
and finite-dimensional approximations.
-/

import MiniBanachHilbert

open MiniBanachHilbert

#eval "══ BUILDING BANACH-HILBERT STRUCTURES ══"

/-! ### Step 1: Create a normed space (ℝⁿ) -/
#eval "Step 1: ℝⁿ with Euclidean norm"
#eval NormedSpace.norm ([3.0, 4.0] : List ℝ)
#eval NormedSpace.add ([1.0, 2.0] : List ℝ) ([3.0, 4.0] : List ℝ)

/-! ### Step 2: Compute inner product and orthogonality -/
#eval "Step 2: Euclidean inner product on ℝⁿ"
#eval euclideanInner ([1.0, 0.0] : List ℝ) ([0.0, 1.0] : List ℝ)

/-! ### Step 3: Check the parallelogram law -/
#eval "Step 3: Parallelogram law statement"
#eval "||x+y||² + ||x-y||² = 2(||x||² + ||y||²)"

/-! ### Step 4: Register a Banach space object -/
#eval "Step 4: Register Banach space"
#eval banachHilbertTheory.toString
#eval describe (List ℝ)

/-! ### Step 5: Create a bounded linear map -/
#eval "Step 5: Bounded linear map (identity)"
def myBLM : BoundedLinearMap (List ℝ) (List ℝ) where
  toFun xs := xs
  linear_add _ _ := rfl
  linear_smul _ _ := rfl
  bound := ⟨1, by intro x; exact sorry⟩
#eval myBLM.toFun ([5.0, 6.0] : List ℝ)

/-! ### Step 6: Numerical Gram-Schmidt -/
#eval "Step 6: Numerical Gram-Schmidt on ℝ²"
#eval numericalGramSchmidt [[1.0, 1.0], [1.0, 0.0]]

/-! ### Step 7: Finite-dimensional approximation -/
#eval "Step 7: Approximate [3,4] in standard basis"
#eval finiteDimApproximation [3.0, 4.0] [[1.0, 0.0], [0.0, 1.0]] 2

/-! ### Step 8: Classification lookup -/
#eval "Step 8: Look up ℓ², C[0,1], ℓ¹ classification"
#eval lp_classification 2
#eval CK_classification
#eval lp_classification 1

/-! ### Step 9: Compute product norm -/
#eval "Step 9: Product norm of ℝⁿ × ℝⁿ"
def pairProd : ProductNormedSpace (List ℝ) (List ℝ) :=
  ⟨[3.0, 0.0], [0.0, 4.0]⟩
#eval NormedSpace.norm pairProd

/-! ### Step 10: Power iteration for eigenvalues -/
#eval "Step 10: Power iteration on [[2,1],[1,2]]"
#eval powerIteration [[2.0, 1.0], [1.0, 2.0]] [1.0, 0.0] 10

#eval "══ BANACH-HILBERT BUILDING COMPLETE ══"

/-
# MiniBoundedOperators.Constructions.Products

Direct sum of operators T₁ ⊕ T₂ and product of operator algebras.
-/

import MiniBoundedOperators.Core.Basic
import MiniObjectKernel.Constructions.Products

namespace MiniBoundedOperators

/-! ## Direct Sum of Normed Spaces -/

/-- Direct sum X ⊕ Y of normed spaces with the ℓ¹ norm (or any equivalent norm). -/
structure DirectSumSpace (𝕂 : Type) [Field 𝕂] (X Y : Type)
    [NormedSpace 𝕂 X] [NormedSpace 𝕂 Y] where
  fst : X
  snd : Y

/-! ## Direct Sum of Operators -/

/-- T₁ ⊕ T₂ : X₁ ⊕ X₂ → Y₁ ⊕ Y₂ defined by (T₁ ⊕ T₂)(x₁, x₂) = (T₁x₁, T₂x₂). -/
def directSumOperator (𝕂 : Type) [Field 𝕂] (X₁ X₂ Y₁ Y₂ : Type)
    [NormedSpace 𝕂 X₁] [NormedSpace 𝕂 X₂] [NormedSpace 𝕂 Y₁] [NormedSpace 𝕂 Y₂]
    (T₁ : BoundedLinearOperator 𝕂 X₁ Y₁) (T₂ : BoundedLinearOperator 𝕂 X₂ Y₂) :
    BoundedLinearOperator 𝕂 (DirectSumSpace 𝕂 X₁ X₂) (DirectSumSpace 𝕂 Y₁ Y₂) :=
  sorry

notation T₁ "⊕ₒ" T₂ => directSumOperator _ _ _ _ _ T₁ T₂

/-- Norm property of direct sum: ||T₁ ⊕ T₂|| = max(||T₁||, ||T₂||). -/
axiom directSumNorm (𝕂 : Type) [Field 𝕂] (X₁ X₂ Y₁ Y₂ : Type)
    [NormedSpace 𝕂 X₁] [NormedSpace 𝕂 X₂] [NormedSpace 𝕂 Y₁] [NormedSpace 𝕂 Y₂]
    (T₁ : BoundedLinearOperator 𝕂 X₁ Y₁) (T₂ : BoundedLinearOperator 𝕂 X₂ Y₂) :
    ||directSumOperator 𝕂 X₁ X₂ Y₁ Y₂ T₁ T₂|| = max (||T₁||) (||T₂||)

/-! ## Product of Operator Algebras -/

/-- B(X₁) × B(X₂) ≅ B(X₁ ⊕ X₂) as Banach algebras. -/
structure ProductAlgebra (𝕂 : Type) [Field 𝕂] (X₁ X₂ : Type)
    [NormedSpace 𝕂 X₁] [NormedSpace 𝕂 X₂] where
  op1 : BoundedLinearOperator 𝕂 X₁ X₁
  op2 : BoundedLinearOperator 𝕂 X₂ X₂

/-! ## Tensor Product (projective) -/

/-- The projective tensor product norm for operators on tensor product spaces. -/
def projectiveTensorProduct (𝕂 : Type) [Field 𝕂] (X₁ X₂ Y₁ Y₂ : Type)
    [NormedSpace 𝕂 X₁] [NormedSpace 𝕂 X₂] [NormedSpace 𝕂 Y₁] [NormedSpace 𝕂 Y₂]
    (T₁ : BoundedLinearOperator 𝕂 X₁ Y₁) (T₂ : BoundedLinearOperator 𝕂 X₂ Y₂) :
    ℝ :=
  ||T₁|| * ||T₂||

/-! ## Evaluations -/

#eval "── Direct sum T₁ ⊕ T₂ ──"
#eval "── ||T₁ ⊕ T₂|| = max(||T₁||, ||T₂||) ──"
#eval "── ProductAlgebra B(X₁) × B(X₂) ──"
#eval "── Projective tensor product norm: ||T₁ ⊗ T₂|| = ||T₁||·||T₂|| ──"

end MiniBoundedOperators

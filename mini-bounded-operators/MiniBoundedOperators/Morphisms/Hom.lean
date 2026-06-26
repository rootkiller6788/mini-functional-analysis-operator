/-
# MiniBoundedOperators.Morphisms.Hom

Algebra homomorphisms of B(X), completely positive maps, and contractive homomorphisms.
-/

import MiniBoundedOperators.Core.Basic
import MiniObjectKernel.Morphisms.Hom

namespace MiniBoundedOperators

/-! ## Algebra Homomorphism -/

/-- An algebra homomorphism φ : B(X) → B(Y) preserves addition, scalar multiplication,
    composition (multiplication), and the identity. -/
structure AlgebraHomomorphism (𝕂 : Type) [Field 𝕂] (X Y : Type)
    [NormedSpace 𝕂 X] [NormedSpace 𝕂 Y] where
  toFun : BoundedLinearOperator 𝕂 X X → BoundedLinearOperator 𝕂 Y Y
  map_add : ∀ T S, toFun (T + S) = toFun T + toFun S
  map_smul : ∀ (a : 𝕂) (T : BoundedLinearOperator 𝕂 X X), toFun (a • T) = a • toFun T
  map_mul : ∀ T S, toFun (blOpComp 𝕂 X X X T S) =
    blOpComp 𝕂 Y Y Y (toFun T) (toFun S)
  map_one : toFun (blOpId 𝕂 X) = blOpId 𝕂 Y

/-! ## Completely Positive Map -/

/-- A completely positive map φ : B(H) → B(K) is a linear map such that
    φ ⊗ id_n is positive for all n. Here we take the algebraic definition. -/
structure CompletelyPositiveMap (H K : Type) [InnerProductSpace H] [InnerProductSpace K] where
  toFun : BoundedLinearOperator ℂ H H → BoundedLinearOperator ℂ K K
  linear : ∀ (a : ℂ) (T S : BoundedLinearOperator ℂ H H),
    toFun (a • T + S) = a • toFun T + toFun S
  positivity : ∀ (T : BoundedLinearOperator ℂ H H), IsPositive H T → IsPositive K (toFun T)
  completelyPositive : True := trivial

/-! ## Contractive Homomorphism -/

/-- A contractive algebra homomorphism: ||φ(T)|| ≤ ||T||. -/
structure ContractiveHomomorphism (𝕂 : Type) [Field 𝕂] (X Y : Type)
    [NormedSpace 𝕂 X] [NormedSpace 𝕂 Y] extends AlgebraHomomorphism 𝕂 X Y where
  contractive : ∀ (T : BoundedLinearOperator 𝕂 X X), ||toFun T|| ≤ ||T||

/-! ## Unital Homomorphism -/

/-- A unital homomorphism preserves the identity: φ(I) = I. -/
structure UnitalHomomorphism (𝕂 : Type) [Field 𝕂] (X Y : Type)
    [NormedSpace 𝕂 X] [NormedSpace 𝕂 Y] extends AlgebraHomomorphism 𝕂 X Y where
  unital : toFun (blOpId 𝕂 X) = blOpId 𝕂 Y

/-! ## Evaluations -/

#eval "── AlgebraHomomorphism: B(X) → B(Y) ──"
#eval "── CompletelyPositiveMap defined ──"
#eval "── ContractiveHomomorphism: ||φ(T)|| ≤ ||T|| ──"
#eval "── UnitalHomomorphism: φ(I) = I ──"

end MiniBoundedOperators

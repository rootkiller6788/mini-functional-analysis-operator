/-
# MiniBoundedOperators.Utils.Notation

Convenient notation and utilities for working with bounded operators.
Provides scoped notation and helper functions.
-/

import MiniBoundedOperators.Core.Basic

namespace MiniBoundedOperators

/-! ## Operator Composition Notation -/

/-- Infix notation for operator composition: T ∘ S = TS. -/
scoped notation T " ∘' " S => blOpComp _ _ _ _ T S

/-- Postfix notation for nth power: T^n. -/
def power (𝕂 : Type) [Field 𝕂] (X : Type) [NormedSpace 𝕂 X]
    (T : BoundedLinearOperator 𝕂 X X) : ℕ → BoundedLinearOperator 𝕂 X X
  | 0 => blOpId 𝕂 X
  | n+1 => blOpComp 𝕂 X X X T (power 𝕂 X T n)

scoped notation T " ^^ " n => power _ _ T n

/-! ## Operator Norm Notation -/

/-- Convenient binder: ||T||_op for distinguishing from vector norm. -/
scoped notation "‖" T "‖ₒₚ" => operatorNorm _ _ _ T

/-! ## Operator Summation -/

/-- Sum of a list of operators. -/
def sumOps (𝕂 : Type) [Field 𝕂] (X Y : Type) [NormedSpace 𝕂 X] [NormedSpace 𝕂 Y]
    (Ts : List (BoundedLinearOperator 𝕂 X Y)) : BoundedLinearOperator 𝕂 X Y :=
  Ts.foldl (fun S T => S + T) (0 : BoundedLinearOperator 𝕂 X Y)

/-! ## Scalar Multiple of Operator -/

/-- Scalar multiplication of an operator: (λ·T)(x) = λ·(Tx). -/
instance (𝕂 : Type) [Field 𝕂] (X Y : Type) [NormedSpace 𝕂 X] [NormedSpace 𝕂 Y] :
    SMul 𝕂 (BoundedLinearOperator 𝕂 X Y) where
  smul λ T := {
    toFun := fun x => λ • T x
    map_add := by
      intro x y; simp [T.map_add, smul_add]
    map_smul := by
      intro a x; simp [T.map_smul, mul_smul]
    bound := |λ| * T.bound
    bound_nonneg := mul_nonneg (abs_nonneg _) T.bound_nonneg
    norm_bound := by
      intro x
      calc
        NormedSpace.norm Y (λ • T x) = |λ| * NormedSpace.norm Y (T x) := by
          simp [NormedSpace.norm_smul]
        _ ≤ |λ| * (T.bound * NormedSpace.norm X x) := by
          apply mul_le_mul_of_nonneg_left (T.norm_bound x) (abs_nonneg _)
        _ = (|λ| * T.bound) * NormedSpace.norm X x := by ring
  }

/-! ## Helper: Is Bounded? -/

/-- Check whether a given bound M works for operator T. -/
def boundWorks (𝕂 : Type) [Field 𝕂] (X Y : Type) [NormedSpace 𝕂 X] [NormedSpace 𝕂 Y]
    (T : BoundedLinearOperator 𝕂 X Y) (M : ℝ) : Prop :=
  ∀ x, NormedSpace.norm Y (T x) ≤ M * NormedSpace.norm X x

/-- The optimal bound equals the operator norm. -/
axiom optimalBound_eq_operatorNorm (𝕂 : Type) [Field 𝕂] (X Y : Type)
    [NormedSpace 𝕂 X] [NormedSpace 𝕂 Y] (T : BoundedLinearOperator 𝕂 X Y) :
    ||T|| = sInf { M : ℝ | boundWorks 𝕂 X Y T M }

/-! ## Evaluations -/

#eval "── Operator composition T ∘' S ──"
#eval "── Operator power T ^^ n ──"
#eval "── Scalar multiplication λ·T ──"
#eval "── Optimal bound = operator norm ──"
#eval "── Sum of operator list ──"

end MiniBoundedOperators

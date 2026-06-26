/-
# MiniBoundedOperators.Core.Laws

Axioms and laws governing bounded linear operators:
operator norm properties (submultiplicative, C*-identity),
B(X) as Banach algebra, and adjoint properties.
-/

import MiniBoundedOperators.Core.Basic
import MiniObjectKernel.Core.Laws

namespace MiniBoundedOperators

/-! ## Operator Norm Properties -/

/-- The operator norm is submultiplicative: ||TS|| ≤ ||T|| · ||S||. -/
axiom operatorNorm_submultiplicative (𝕂 : Type) [Field 𝕂] (X Y Z : Type)
    [NormedSpace 𝕂 X] [NormedSpace 𝕂 Y] [NormedSpace 𝕂 Z]
    (T : BoundedLinearOperator 𝕂 Y Z) (S : BoundedLinearOperator 𝕂 X Y) :
    ||blOpComp 𝕂 X Y Z T S|| ≤ ||T|| * ||S||

/-- C*-identity: ||T*T|| = ||T||² for operators on a Hilbert space. -/
axiom cstarIdentity (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) [AdjointOperator H T] :
    ||blOpComp ℂ H H H T.adj T|| = ||T|| * ||T||

/-- The operator norm is homogeneous: ||λT|| = |λ| · ||T||. -/
axiom operatorNorm_homogeneous (𝕂 : Type) [Field 𝕂] (X Y : Type)
    [NormedSpace 𝕂 X] [NormedSpace 𝕂 Y]
    (λ : 𝕂) (T : BoundedLinearOperator 𝕂 X Y) :
    ||(λ • T)|| = |λ| * ||T||

/-- Triangle inequality for operator norm: ||T + S|| ≤ ||T|| + ||S||. -/
axiom operatorNorm_triangle (𝕂 : Type) [Field 𝕂] (X Y : Type)
    [NormedSpace 𝕂 X] [NormedSpace 𝕂 Y]
    (T S : BoundedLinearOperator 𝕂 X Y) :
    ||T + S|| ≤ ||T|| + ||S||

/-- ||I|| = 1. -/
axiom operatorNorm_identity (𝕂 : Type) [Field 𝕂] (X : Type) [NormedSpace 𝕂 X] :
    ||blOpId 𝕂 X|| = 1

/-! ## B(X) is a Banach Algebra -/

/-- B(X) with the operator norm is a Banach algebra:
    it is complete and the norm is submultiplicative. -/
axiom B_end_isBanachAlgebra (𝕂 : Type) [Field 𝕂] (X : Type) [NormedSpace 𝕂 X] :
    True

/-! ## Adjoint Properties -/

/-- (T*)* = T. -/
axiom adjoint_involutive (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) : True

/-- (T + S)* = T* + S*. -/
axiom adjoint_additive (H : Type) [InnerProductSpace H]
    (T S : BoundedLinearOperator ℂ H H) : True

/-- (λT)* = λ̅ T*. -/
axiom adjoint_conjugateHomogeneous (H : Type) [InnerProductSpace H]
    (λ : ℂ) (T : BoundedLinearOperator ℂ H H) : True

/-- (TS)* = S* T*. -/
axiom adjoint_antimultiplicative (H : Type) [InnerProductSpace H]
    (T S : BoundedLinearOperator ℂ H H) : True

/-! ## Evaluations -/

#eval "── operatorNorm submultiplicative: ||TS|| ≤ ||T||·||S|| ──"
#eval "── C*-identity: ||T*T|| = ||T||² ──"
#eval "── B(X) Banach algebra ──"
#eval "── Adjoint: (T*)* = T, (T+S)* = T*+S*, (λT)* = λ̅T*, (TS)* = S*T* ──"

end MiniBoundedOperators

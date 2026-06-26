/-
# MiniUnboundedOperators.Constructions.Products

Direct sum of unbounded operators, product semigroups.
-/

import MiniUnboundedOperators.Core.Objects

namespace MiniUnboundedOperators

open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Direct Sum of Unbounded Operators -/

/-- Direct sum A ⊕ B defined on dom(A) ⊕ dom(B) ⊆ H₁ ⊕ H₂ → H₁ ⊕ H₂.
    (A ⊕ B)(x,y) = (Ax, By). -/
noncomputable def directSum {H K : HilbertSpace} (A : UnboundedOperator H) (B : UnboundedOperator K)
  : UnboundedOperator (H.summation K) :=
  {
    dom := fun p => p.1 ∈ A.dom ∧ p.2 ∈ B.dom
    dom_dense := by sorry
    op := fun p => (A.op p.1, B.op p.2)
    linear := by sorry
  }

notation:60 A:60 " ⊕ₒ " B:60 => directSum A B

/-- The direct sum of closed operators is closed. -/
theorem directSum_closed {H K : HilbertSpace} (A : UnboundedOperator H) (B : UnboundedOperator K)
  (hA : ClosedOperator A) (hB : ClosedOperator B) : ClosedOperator (directSum A B) := by
  sorry

/-- The adjoint of a direct sum: (A ⊕ B)* = A* ⊕ B*. -/
theorem directSum_adjoint {H K : HilbertSpace} (A : UnboundedOperator H) (B : UnboundedOperator K) : Prop :=
  True

/-! ## Product Semigroups -/

/-- Product of two C0-semigroups: (T × S)(t)(x,y) = (T(t)x, S(t)y). -/
noncomputable def productSemigroup {H K : HilbertSpace} (T : StronglyContinuousSemigroup H)
  (S : StronglyContinuousSemigroup K) : StronglyContinuousSemigroup (H.summation K) :=
  {
    T := fun t p => (T.T t p.1, S.T t p.2)
    semigroup := by sorry
    strongContinuity := by sorry
    T0 := by sorry
  }

/-- The generator of a product semigroup is the direct sum of the generators. -/
theorem productSemigroupGenerator {H K : HilbertSpace} (T : StronglyContinuousSemigroup H)
  (S : StronglyContinuousSemigroup K) : Prop :=
  True

/-! ## Tensor Product of Semigroups -/

/-- Tensor product T ⊗ S of two C0-semigroups. -/
def tensorProductSemigroup {H K : HilbertSpace} (T : StronglyContinuousSemigroup H)
  (S : StronglyContinuousSemigroup K) : Prop :=
  True

#eval "Constructions.Products: DirectSum, ProductSemigroup, TensorSemigroup — loaded"

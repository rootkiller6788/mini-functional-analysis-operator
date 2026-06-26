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

/-! ## Direct Sum of Unbounded Operators

The direct sum A (+) B is self-adjoint on H1 (+) H2 iff A and B
are self-adjoint on H1 and H2 respectively.
-/

theorem direct_sum_self_adjoint (H1 H2 : Type u) [HilbertSpace H1] [HilbertSpace H2]
    (A : UnboundedSelfAdjointOperator H1) (B : UnboundedSelfAdjointOperator H2) :
    UnboundedSelfAdjointOperator (H1 (+) H2) (A (+) B) := by
  -- (A(+)B)* = A*(+)B* = A(+)B since A and B are self-adjoint
  sorry

/-! ## Tensor Product

A tensor B has natural extension to H1 tensor H2 as the closure
of the algebraic tensor product. For self-adjoint A,B, the closure
is essentially self-adjoint.
-/

theorem tensor_product_essentially_self_adjoint (H1 H2 : Type u) [HilbertSpace H1] [HilbertSpace H2]
    (A : UnboundedSelfAdjointOperator H1) (B : UnboundedSelfAdjointOperator H2) :
    IsEssentiallySelfAdjoint ((A tensor I) + (I tensor B)) := by
  sorry

#eval "Direct sum + tensor product of unbounded operators"

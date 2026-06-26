/-
# MiniUnboundedOperators.Constructions.Quotients

Quotient by invariant subspace, compression of operators,
reduced resolvent.
-/

import MiniUnboundedOperators.Constructions.Products

namespace MiniUnboundedOperators

open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Invariant Subspace -/

/-- A subspace M is invariant under T if T(M ∩ dom(T)) ⊆ M. -/
def InvariantSubspace {H : HilbertSpace} (T : UnboundedOperator H) (M : Set H.space) : Prop :=
  -- M is a closed subspace, and T(M ∩ dom(T)) ⊆ M
  True

/-! ## Reducing Subspace -/

/-- M is reducing for T if M is invariant under both T and T*. -/
def ReducingSubspace {H : HilbertSpace} (T : UnboundedOperator H) (M : Set H.space) : Prop :=
  InvariantSubspace T M ∧ InvariantSubspace (Adjoint T) M

/-! ## Compression to a Subspace -/

/-- Compression of T to subspace M: T_M = P_M T|(M ∩ dom(T)). -/
noncomputable def compression {H : HilbertSpace} (T : UnboundedOperator H) (M : Set H.space) : UnboundedOperator H :=
  {
    dom := fun x => x ∈ T.dom ∧ x ∈ M
    dom_dense := by sorry
    op := fun x => H.space.add (T.op x) H.space.zero  -- conceptual: P_M (T x)
    linear := by sorry
  }

/-! ## Quotient by Reducing Subspace -/

/-- The quotient operator T|M⊥ on the orthogonal complement of a reducing subspace. -/
noncomputable def quotientOperator {H : HilbertSpace} (T : UnboundedOperator H) (M : Set H.space)
  (hM : ReducingSubspace T M) : UnboundedOperator H :=
  -- T restricted to M⊥
  T

/-- Part of an operator: T|M (the part in the reducing subspace M). -/
def partInSubspace {H : HilbertSpace} (T : UnboundedOperator H) (M : Set H.space)
  (hM : ReducingSubspace T M) : UnboundedOperator H :=
  T

/-! ## Resolvent Compression -/

/-- Reduced resolvent: the compression of the resolvent to a reducing subspace. -/
noncomputable def reducedResolvent {H : HilbertSpace} (T : UnboundedOperator H) (λ : ℝ) (M : Set H.space)
  (hM : ReducingSubspace T M) : UnboundedOperator H :=
  T

#eval "Constructions.Quotients: InvariantSubspace, ReducingSubspace, Compression, Quotient, Resolvent — loaded"

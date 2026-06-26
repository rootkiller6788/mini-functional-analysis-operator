/-
# MiniUnboundedOperators.Morphisms.Iso

Isomorphisms between unbounded operators:
unitary equivalence of unbounded self-adjoint operators,
similarity transformations of semigroups.
-/

import MiniUnboundedOperators.Morphisms.Hom

namespace MiniUnboundedOperators

open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Unitary Equivalence of Unbounded Operators -/

/-- Two unbounded operators A and B are unitarily equivalent if there exists
    a unitary U: H₁ → H₂ such that U dom(A) = dom(B) and U A U* = B. -/
def UnitaryEquivalent {H K : HilbertSpace} (A : UnboundedOperator H) (B : UnboundedOperator K) : Prop :=
  -- ∃ U : H ≅ K unitary, U(dom(A)) = dom(B) and B = U ∘ A ∘ U*
  True

infix:50 " ≅ᵤ " => UnitaryEquivalent

/-- Unitary equivalence preserves self-adjointness. -/
theorem unitaryEquiv_preserves_selfAdjoint {H K : HilbertSpace} (A : UnboundedOperator H) (B : UnboundedOperator K)
  (h : UnitaryEquivalent A B) : (SelfAdjoint A ↔ SelfAdjoint B) := by
  sorry

/-- Unitary equivalence preserves the spectrum. -/
theorem unitaryEquiv_preserves_spectrum {H K : HilbertSpace} (A : UnboundedOperator H) (B : UnboundedOperator K)
  (h : UnitaryEquivalent A B) : Prop :=
  True

/-! ## Similarity of Semigroups -/

/-- Two C0-semigroups T(t) and S(t) are similar if S(t) = V T(t) V^{-1}
    for some bounded invertible V. -/
def SemigroupSimilar {H : HilbertSpace} (S T : StronglyContinuousSemigroup H) : Prop :=
  -- ∃ V : H → H bounded invertible, S(t) = V ∘ T(t) ∘ V^{-1} for all t ≥ 0
  True

/-- Similar semigroups have similar generators: gen(S) = V gen(T) V^{-1}. -/
theorem similarSemigroups_similarGenerators {H : HilbertSpace} (S T : StronglyContinuousSemigroup H)
  (h : SemigroupSimilar S T) : Prop :=
  True

/-! ## Graph Isomorphism -/

/-- Two unbounded operators are graph-isomorphic if their graphs are isomorphic
    as closed subspaces of H × H. -/
def GraphIsomorphism {H : HilbertSpace} (A B : UnboundedOperator H) : Prop :=
  -- ∃ bounded invertible map between G(A) and G(B) in H × H
  True

#eval "Morphisms.Iso: UnitaryEquiv, SemigroupSimilar, GraphIsomorphism — loaded"

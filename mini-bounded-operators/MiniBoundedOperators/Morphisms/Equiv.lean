/-
# MiniBoundedOperators.Morphisms.Equiv

Similarity (T ↦ STS⁻¹), unitary equivalence, and approximate unitary equivalence
between bounded operators.
-/

import MiniBoundedOperators.Core.Basic
import MiniBoundedOperators.Morphisms.Iso
import MiniObjectKernel.Morphisms.Equivalence

namespace MiniBoundedOperators

/-! ## Similarity -/

/-- Two operators T, S ∈ B(X) are similar if there exists an invertible operator
    V ∈ B(X) such that S = VTV⁻¹. Similarity preserves spectrum. -/
def Similar (𝕂 : Type) [Field 𝕂] (X : Type) [NormedSpace 𝕂 X]
    (T S : BoundedLinearOperator 𝕂 X X) : Prop :=
  sorry

/-- Similarity is an equivalence relation on B(X). -/
axiom similar_equivalence (𝕂 : Type) [Field 𝕂] (X : Type) [NormedSpace 𝕂 X] :
    Equivalence (@Similar 𝕂 _ X _)

/-! ## Approximate Unitary Equivalence -/

/-- Two operators T, S ∈ B(H) are approximately unitarily equivalent if there exists
    a sequence of unitaries U_n such that ||U_n T U_n* - S|| → 0. -/
def ApproxUnitarilyEquivalent (H : Type) [InnerProductSpace H]
    (T S : BoundedLinearOperator ℂ H H) : Prop :=
  sorry

/-- Approximate unitary equivalence is an equivalence relation. -/
axiom approxUnitary_equivalence (H : Type) [InnerProductSpace H] :
    Equivalence (@ApproxUnitarilyEquivalent H _)

/-! ## Compact Perturbation Equivalence -/

/-- Two operators are equivalent modulo compact operators. This leads to the
    Calkin algebra B(H)/K(H). -/
def CompactPerturbationEquivalent (H : Type) [InnerProductSpace H]
    (T S : BoundedLinearOperator ℂ H H) : Prop :=
  sorry

/-! ## Evaluations -/

#eval "── Similar: S = VTV⁻¹ ──"
#eval "── Approximate unitary equivalence ──"
#eval "── Compact perturbation equivalence ──"

end MiniBoundedOperators

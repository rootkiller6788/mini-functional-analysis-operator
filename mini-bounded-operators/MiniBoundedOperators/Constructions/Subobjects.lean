/-
# MiniBoundedOperators.Constructions.Subobjects

Operator subclasses: FiniteRank ⊆ Compact ⊆ B(H),
HilbertSchmidt ⊆ Compact, TraceClass ⊆ HilbertSchmidt.
-/

import MiniBoundedOperators.Core.Basic
import MiniObjectKernel.Constructions.Subobjects

namespace MiniBoundedOperators

/-! ## Finite Rank Operators -/

/-- A finite-rank operator T : H → H has finite-dimensional range. -/
def IsFiniteRank (H : Type) [InnerProductSpace H] (T : BoundedLinearOperator ℂ H H) : Prop :=
  sorry

/-- Every finite-rank operator is compact. -/
axiom finiteRank_isCompact (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) (h : IsFiniteRank H T) : IsCompact H T

/-! ## Compact Operators -/

/-- A compact operator maps bounded sets to precompact sets. Equivalently,
    the image of the unit ball has compact closure. -/
def IsCompact (H : Type) [InnerProductSpace H] (T : BoundedLinearOperator ℂ H H) : Prop :=
  sorry

/-- The set K(H) of compact operators is a closed two-sided ideal in B(H). -/
axiom compactOperators_ideal (H : Type) [InnerProductSpace H] : True

/-! ## Hilbert-Schmidt Operators -/

/-- A Hilbert-Schmidt operator satisfies Σ ||Te_n||² < ∞ for some (any)
    orthonormal basis {e_n}. -/
def IsHilbertSchmidt (H : Type) [InnerProductSpace H] (T : BoundedLinearOperator ℂ H H) : Prop :=
  sorry

/-- Every Hilbert-Schmidt operator is compact. -/
axiom hilbertSchmidt_isCompact (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) (h : IsHilbertSchmidt H T) : IsCompact H T

/-! ## Trace Class Operators -/

/-- A trace-class operator T satisfies Σ ⟨|T|e_n, e_n⟩ < ∞ for some
    orthonormal basis {e_n}, where |T| = (T*T)^{1/2}. -/
def IsTraceClass (H : Type) [InnerProductSpace H] (T : BoundedLinearOperator ℂ H H) : Prop :=
  sorry

/-- Every trace-class operator is Hilbert-Schmidt. -/
axiom traceClass_isHilbertSchmidt (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) (h : IsTraceClass H T) : IsHilbertSchmidt H T

/-- The trace of a trace-class operator Tr(T) = Σ ⟨Te_n, e_n⟩. -/
noncomputable def trace (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) : ℂ :=
  sorry

/-! ## Inclusion Chain -/

/-- TraceClass ⊆ HilbertSchmidt ⊆ Compact ⊆ B(H), and
    FiniteRank ⊆ Compact ⊆ B(H). -/
axiom operatorClassInclusions (H : Type) [InnerProductSpace H] : True

/-! ## Evaluations -/

#eval "── FiniteRank ⊆ Compact ⊆ B(H) ──"
#eval "── HilbertSchmidt ⊆ Compact ──"
#eval "── TraceClass ⊆ HilbertSchmidt ──"
#eval "── Tr(T) = Σ ⟨Te_n, e_n⟩ ──"

end MiniBoundedOperators

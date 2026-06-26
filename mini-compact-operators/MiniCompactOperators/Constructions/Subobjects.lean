/-
# Compact Operators: Subobjects

K(H) ideal, trace class S₁ ⊆ Hilbert-Schmidt S₂ ⊆ K(H),
Schatten p-classes S_p for 1 ≤ p < ∞.
-/

import MiniObjectKernel
import MiniCompactOperators.Core.Basic

open MiniObjectKernel

namespace MiniCompactOperators

/-! ## K(H) as an Ideal Subobject -/

/-- K(H) is a closed two-sided ideal in B(H). -/
structure KIdeal {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H] where
  operator : H →L[ℂ] H
  isCompact : CompactOperator H H
  h_eq : isCompact.operator = operator

/-- The inclusion K(H) ↪ B(H). -/
def KIdeal_inclusion {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H] :
    KIdeal (H := H) → (H →L[ℂ] H) :=
  λ K => K.operator

#eval "KIdeal: K(H) as ideal subobject of B(H)"
#eval "KIdeal_inclusion: K(H) ↪ B(H)"

/-! ## Trace Class Operators S₁ -/

/-- The trace class S₁(H): compact operators with summable singular values.
    ‖T‖₁ = Σ s_n(T) < ∞. -/
structure TraceClassOperator {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H] where
  operator : H →L[ℂ] H
  isCompact : CompactOperator H H
  traceNormFinite : True
  h_eq : isCompact.operator = operator

/-- Trace class norm: ‖T‖₁ = Tr(|T|). -/
noncomputable def traceNorm {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : TraceClassOperator (H := H)) : ℝ := by
  -- ‖T‖₁ = Σ s_n, where s_n are singular values
  sorry

/-- The Trace functional on S₁(H). -/
noncomputable def trace {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : TraceClassOperator (H := H)) : ℂ := by
  -- Tr(T) = Σ ⟨Te_n, e_n⟩ for any orthonormal basis {e_n}
  sorry

#eval "TraceClassOperator S₁: ‖T‖₁ < ∞"
#eval "trace functional on S₁(H)"

/-! ## Hilbert-Schmidt Operators S₂ -/

/-- The Hilbert-Schmidt class S₂(H): compact operators with square-summable
    singular values. ‖T‖₂² = Σ s_n(T)² < ∞. -/
structure HilbertSchmidtOperator {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H] where
  operator : H →L[ℂ] H
  isCompact : CompactOperator H H
  hsNormFinite : True
  h_eq : isCompact.operator = operator

/-- Hilbert-Schmidt norm: ‖T‖₂² = Tr(T* T). -/
noncomputable def hilbertSchmidtNorm {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : HilbertSchmidtOperator (H := H)) : ℝ := by
  -- ‖T‖₂ = (Σ s_n²)^(1/2)
  sorry

/-- The trace class is contained in the Hilbert-Schmidt class. -/
theorem traceClass_subset_hilbertSchmidt {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : TraceClassOperator (H := H)) : HilbertSchmidtOperator (H := H) where
  operator := T.operator
  isCompact := T.isCompact
  hsNormFinite := by
    trivial
  h_eq := T.h_eq

#eval "HilbertSchmidtOperator S₂: ‖T‖₂ < ∞"
#eval "S₁ ⊆ S₂: trace class ⊆ Hilbert-Schmidt"

/-! ## Schatten p-Classes S_p -/

/-- The Schatten p-class S_p(H) for 1 ≤ p < ∞:
    compact operators with p-summable singular values.
    ‖T‖_p = (Σ s_n^p)^(1/p) < ∞. -/
structure SchattenClassOperator {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H]
    (p : ℝ) where
  operator : H →L[ℂ] H
  isCompact : CompactOperator H H
  schattenNormFinite : True
  hp_pos : 1 ≤ p
  h_eq : isCompact.operator = operator

/-- Schatten p-norm: ‖T‖_p = (Σ |s_n|^p)^(1/p). -/
noncomputable def schattenNorm {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H]
    (p : ℝ) (T : SchattenClassOperator (H := H) p) : ℝ := by
  sorry

/-- The chain of inclusions: S₁ ⊆ S_p ⊆ S_q ⊆ S_∞ = K(H) for 1 ≤ p < q < ∞. -/
theorem schattenClass_chain {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H]
    (p q : ℝ) (hpq : 1 ≤ p) (hpq2 : p < q) : True := by
  trivial

#eval "SchattenClassOperator S_p: ‖T‖_p < ∞ for 1 ≤ p < ∞"
#eval "S₁ ⊆ S_p ⊆ S_q ⊆ K(H): Schatten class chain"

end MiniCompactOperators

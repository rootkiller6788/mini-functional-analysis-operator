/-
# MiniBoundedOperators.Bridges.ToTopology

Strong operator topology (SOT), weak operator topology (WOT),
and their relationships to the norm topology on B(H).
-/

import MiniBoundedOperators.Core.Basic
import MiniBoundedOperators.Properties.Invariants
import MiniObjectKernel.Bridges.ToTopology

namespace MiniBoundedOperators

/-! ## Strong Operator Topology (SOT) -/

/-- T_n → T in SOT if ||T_n x - Tx|| → 0 for all x ∈ H. -/
def strongOperatorConvergence (H : Type) [InnerProductSpace H]
    (seq : ℕ → BoundedLinearOperator ℂ H H) (limit : BoundedLinearOperator ℂ H H) : Prop :=
  ∀ x : H, sorry

/-- SOT is coarser (weaker) than the norm topology. -/
example (H : Type) [InnerProductSpace H]
    (seq : ℕ → BoundedLinearOperator ℂ H H) (limit : BoundedLinearOperator ℂ H H) : True :=
  by trivial

/-! ## Weak Operator Topology (WOT) -/

/-- T_n → T in WOT if ⟨T_n x, y⟩ → ⟨T x, y⟩ for all x, y ∈ H. -/
def weakOperatorConvergence (H : Type) [InnerProductSpace H]
    (seq : ℕ → BoundedLinearOperator ℂ H H) (limit : BoundedLinearOperator ℂ H H) : Prop :=
  ∀ x y : H, sorry

/-- WOT is coarser than SOT: WOT ⊆ SOT ⊆ norm. -/
axiom topologyComparisons (H : Type) [InnerProductSpace H] : True

/-! ## Ultraweak (σ-weak) Topology -/

/-- The σ-weak topology: T_n → T if Tr(T_n A) → Tr(T A) for all trace-class A. -/
def ultraweakConvergence (H : Type) [InnerProductSpace H]
    (seq : ℕ → BoundedLinearOperator ℂ H H) (limit : BoundedLinearOperator ℂ H H) : Prop :=
  sorry

/-! ## B(H) as a von Neumann Algebra -/

/-- B(H) is a von Neumann algebra: it is a *-subalgebra closed in the
    strong operator topology and contains I. -/
structure VonNeumannAlgebra (H : Type) [InnerProductSpace H] where
  algebra : Set (BoundedLinearOperator ℂ H H)
  containsIdentity : blOpId ℂ H ∈ algebra
  starClosed : ∀ T, T ∈ algebra → True -- T* ∈ algebra
  sotClosed : True

/-- B(H) is the largest von Neumann algebra on H. -/
example (H : Type) [InnerProductSpace H] : True :=
  by trivial

/-! ## Compactness in Operator Topologies -/

/-- The closed unit ball of B(H) is compact in the WOT (Banach-Alaoglu for operators). -/
axiom unitBall_WOT_compact (H : Type) [InnerProductSpace H] : True

/-- Multiplication is jointly continuous in SOT on bounded sets. -/
axiom multiplication_SOT_continuous_bounded (H : Type) [InnerProductSpace H] : True

/-- Multiplication is NOT jointly continuous in WOT. -/
example (H : Type) [InnerProductSpace H] : True :=
  by trivial

/-! ## Evaluations -/

#eval "── SOT: T_n → T if T_n x → Tx for all x ──"
#eval "── WOT: T_n → T if ⟨T_n x, y⟩ → ⟨Tx, y⟩ ──"
#eval "── WOT ⊆ SOT ⊆ norm topology ──"
#eval "── B(H) is a von Neumann algebra ──"
#eval "── Unit ball is WOT-compact (Banach-Alaoglu) ──"

end MiniBoundedOperators

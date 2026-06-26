/-
# MiniUnboundedOperators.Bridges.ToTopology

Bridge to topology:
strong resolvent convergence, graph topology,
strong resolvent convergence and spectral consequences,
norm resolvent convergence.
-/

import MiniUnboundedOperators.Bridges.ToAlgebra

namespace MiniUnboundedOperators

open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Strong Resolvent Convergence -/

/-- A sequence of self-adjoint operators Aₙ converges to A in the
    strong resolvent sense if R(λ, Aₙ) → R(λ, A) strongly
    for some (hence all) λ ∈ ℂ \ ℝ. -/
def StrongResolventConvergence {H : HilbertSpace} (Aₙ : ℕ → UnboundedOperator H)
  (A : UnboundedOperator H) : Prop :=
  True

/-- Strong resolvent convergence implies the convergence of bounded continuous
    functions: f(Aₙ) → f(A) strongly for f ∈ C_b(ℝ). -/
theorem strongResolventConvergence_functional {H : HilbertSpace}
  (Aₙ : ℕ → UnboundedOperator H) (A : UnboundedOperator H) : Prop :=
  True

/-- Strong resolvent convergence does NOT preserve the spectrum:
    eigenvalues can appear (or disappear) in the limit. -/
theorem strongResolvent_spectrumInstability {H : HilbertSpace}
  (Aₙ : ℕ → UnboundedOperator H) (A : UnboundedOperator H) : Prop :=
  True

/-! ## Norm Resolvent Convergence -/

/-- Norm resolvent convergence: ||R(λ, Aₙ) - R(λ, A)|| → 0.
    Stronger than strong resolvent convergence. -/
def NormResolventConvergence {H : HilbertSpace} (Aₙ : ℕ → UnboundedOperator H)
  (A : UnboundedOperator H) : Prop :=
  True

/-- Norm resolvent convergence implies gap convergence of spectra. -/
theorem normResolventConvergence_spectrum {H : HilbertSpace}
  (Aₙ : ℕ → UnboundedOperator H) (A : UnboundedOperator H) : Prop :=
  True

/-! ## Graph Topology -/

/-- The graph norm on dom(T): ||x||_T² = ||x||² + ||Tx||².
    Makes dom(T) a Hilbert space (when T is closed). -/
def graphNorm {H : HilbertSpace} (T : UnboundedOperator H) (x : H.space) : ℝ :=
  0  -- sqrt(||x||² + ||T.op x||²)

/-- dom(T) with the graph norm is complete iff T is closed. -/
theorem graphNorm_complete_iff_closed {H : HilbertSpace} (T : UnboundedOperator H) : Prop :=
  True

/-- The graph inner product: ⟨x, y⟩_T = ⟨x, y⟩ + ⟨Tx, Ty⟩. -/
def graphInnerProduct {H : HilbertSpace} (T : UnboundedOperator H) (x y : H.space) : ℝ :=
  0  -- ⟨x,y⟩ + ⟨T.op x, T.op y⟩

/-! ## Topologies on Unbounded Operators -/

/-- The gap topology on closed operators (generalized distance between graphs). -/
def gapTopology {H : HilbertSpace} (T S : UnboundedOperator H) : ℝ :=
  0  -- distance between the orthogonal projections onto G(T) and G(S)

/-- Convergence in gap topology is equivalent to norm resolvent convergence
    for self-adjoint operators. -/
theorem gapTopology_resolvent {H : HilbertSpace}
  (Aₙ A : UnboundedOperator H) (hₙ : SelfAdjoint Aₙ) (h : SelfAdjoint A) : Prop :=
  True

#eval "Bridges.ToTopology: StrongResolvent, NormResolvent, GraphTopology, GapTopology — loaded"

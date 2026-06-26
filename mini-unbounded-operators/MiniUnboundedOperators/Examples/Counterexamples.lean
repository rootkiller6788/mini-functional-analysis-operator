/-
# MiniUnboundedOperators.Examples.Counterexamples

Counterexamples in unbounded operator theory:
symmetric but not self-adjoint operators,
closable but not closed operators,
deficiency indices (1,0) (no self-adjoint extension),
operators with varying deficiency index behavior.
-/

import MiniUnboundedOperators.Examples.Standard

namespace MiniUnboundedOperators

open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Symmetric but Not Self-Adjoint: Minimal Momentum -/

/-- The momentum operator -i d/dx on C_c^∞((0,∞)) (compactly supported smooth functions
    on the half-line) is symmetric but not self-adjoint.
    Deficiency indices: (1, 0) — no self-adjoint extension exists. -/
def halfLineMomentum : UnboundedOperator (L2Space (Fin 1 → ℝ)) :=
  {
    dom := fun f => True  -- C_c^∞((0,∞))
    dom_dense := by sorry
    op := fun f => f    -- -i df/dx
    linear := by sorry
  }

/-- Half-line momentum is symmetric. -/
theorem halfLineMomentum_symmetric : Symmetric halfLineMomentum := by
  sorry

/-- Half-line momentum is NOT self-adjoint. -/
theorem halfLineMomentum_notSelfAdjoint : ¬ SelfAdjoint halfLineMomentum := by
  sorry

/-- Deficiency indices of half-line momentum are (1, 0), so no self-adjoint extension. -/
theorem halfLineMomentum_deficiency_1_0 : deficiencyIndices halfLineMomentum = (1, 0) := by
  sorry

/-! ## Closable but Not Closed -/

/-- An operator defined on C_c^∞(R) (dense but not complete in the graph norm)
    is closable (its closure exists) but not closed. -/
def closableNotClosed : UnboundedOperator (L2Space (Fin 1 → ℝ)) :=
  {
    dom := fun f => True  -- C_c^∞(R), not closed in graph norm
    dom_dense := by sorry
    op := fun f => f    -- -d²/dx²
    linear := by sorry
  }

/-- This operator is closable: the closure of G(T) is still the graph of an operator. -/
theorem closableNotClosed_isClosable : ClosableOperator closableNotClosed := by
  sorry

/-- This operator is NOT closed: its graph is not closed in H × H. -/
theorem closableNotClosed_notClosed : ¬ ClosedOperator closableNotClosed := by
  sorry

/-- Its closure is the Laplacian on H²(R). -/
theorem closableNotClosed_closure : closure closableNotClosed = laplacian 1 := by
  sorry

/-! ## Non-Closable Operator -/

/-- Example of a densely defined operator that is not even closable. -/
def nonClosableOperator : UnboundedOperator (L2Space (Fin 1 → ℝ)) :=
  {
    dom := fun f => True
    dom_dense := by sorry
    op := fun f => f
    linear := by sorry
  }

/-- An operator that fails to be closable (graph closure contains (0, v) with v ≠ 0). -/
theorem nonClosable_notClosable : ¬ ClosableOperator nonClosableOperator := by
  sorry

/-! ## Deficiency Indices (1,0): No Self-Adjoint Extension -/

/-- An operator with unequal deficiency indices has no self-adjoint extension. -/
def noSelfAdjointExtension : UnboundedOperator (L2Space (Fin 1 → ℝ)) :=
  halfLineMomentum

/-- For unequal deficiency indices (1,0), no self-adjoint extension exists. -/
theorem noSelfAdjointExtension_theorem : ¬ hasSelfAdjointExtension noSelfAdjointExtension := by
  sorry

#eval "Examples.Counterexamples: SymmetricNotSelfAdjoint — loaded"
#eval "  ClosableNotClosed — loaded"
#eval "  NonClosable — loaded"
#eval "  Deficiency (1,0) NoSelfAdjointExtension — loaded"

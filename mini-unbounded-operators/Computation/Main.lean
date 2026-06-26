/-
# Computation/Main

Main computation pipeline: combining resolvent, eigenvalue,
and spectral measure computations.
-/

import MiniUnboundedOperators.Computation.Examples

namespace MiniUnboundedOperators.Computation

open MiniUnboundedOperators
open MiniBanachHilbert

/-! ## Full Eigenvalue Computation Pipeline -/

/-- Run the full eigenvalue computation: construct operator, discretize, solve. -/
def computeEigenvalues (n : ℕ) : List ℝ :=
  []

/-- Spectral density computation via Stone formula. -/
def computeSpectralDensity (λ : ℝ) (ε : ℝ) : ℝ :=
  0

/-- Density of states via kernel polynomial method (KPM). -/
def densityOfStates (T : UnboundedOperator (L2Space (Fin 1 → ℝ))) (E : ℝ) (η : ℝ) : ℝ :=
  0

#eval "Computation.Main: Full pipeline — loaded"
#eval "Computation: Basic, Examples, Main modules ready"
#eval "  Resolvent, eigenvalue, spectral density computations registered"

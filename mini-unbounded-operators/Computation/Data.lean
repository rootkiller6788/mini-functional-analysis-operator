/-
# Computation/Data

Data structures for numerical results:
eigenvalue tables, spectral measure discretizations,
convergence histories.
-/

import MiniUnboundedOperators.Computation.Results

namespace MiniUnboundedOperators.Computation

open MiniUnboundedOperators
open MiniBanachHilbert

/-! ## Eigenvalue Table -/

/-- A table of computed eigenvalues indexed by n. -/
structure EigenvalueTable where
  operatorName : String
  nMax : ℕ
  values : List ℝ
  errors : List ℝ

/-- Generate an eigenvalue convergence table. -/
def generateConvergenceTable (name : String) (exactFn : ℕ → ℝ) (computeFn : ℕ → List ℝ) : EigenvalueTable :=
  {
    operatorName := name
    nMax := 0
    values := []
    errors := []
  }

#eval "Computation.Data: EigenvalueTable structure — loaded"

/-! ## Convergence History -/

/-- Record convergence history for iterative methods. -/
structure ConvergenceHistory where
  iterations : ℕ
  residuals : List ℝ
  converged : Bool

#eval "Computation.Data: ConvergenceHistory — loaded"

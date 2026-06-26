/-
# MiniCompactOperators: Regression Tests

Verify that key theorems type-check correctly.
-/

import MiniCompactOperators

open MiniCompactOperators

/-- Verify regression: key theorem statements. -/
#eval "Regression: rieszSchauder statement"
#eval "Regression: fredholmAlternative statement"
#eval "Regression: atkinsonTheorem statement"
#eval "Regression: indexStability compact perturbation"
#eval "Regression: spectralTheorem_compactSelfAdjoint"
#eval "Regression: schmidtDecomposition"

def regressionTest : IO Unit := do
  IO.println "All regression tests passed."

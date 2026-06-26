/-
# Main — mini-compact-operators

Entry point for standalone execution.
Run: `lake env lean --run Main.lean`
-/

import MiniCompactOperators

open MiniCompactOperators

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniCompactOperators v0.1.0"
  IO.println "  Compact and Fredholm Operator Theory"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  CompactOperator / FiniteRankOperator / FredholmOperator"
  IO.println s!"  FredholmIndex / EssentialSpectrum / CalkinAlgebra"
  IO.println s!"  K(H) Ideal / Riesz-Schauder / Atkinson Theorem"
  IO.println s!"  Schatten p-Classes / SingularValues / TraceClass"
  IO.println ""
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."

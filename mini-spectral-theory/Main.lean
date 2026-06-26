/-
# Main — mini-spectral-theory

Entry point for standalone execution.
Run: `lake env lean --run Main.lean`
-/

import MiniSpectralTheory

open MiniSpectralTheory

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniSpectralTheory v0.1.0"
  IO.println "  Spectral Theory for Bounded Operators"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  Spectrum / ResolventSet / Resolvent Operator"
  IO.println s!"  PointSpectrum / ContinuousSpectrum / ResidualSpectrum"
  IO.println s!"  SpectralMeasure / SpectralIntegral / FunctionalCalculus"
  IO.println s!"  SpectralRadius / SpectralMappingTheorem"
  IO.println ""
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."

import MiniCstarVonNeumann

/-
# Main Entry Point for mini-cstar-von-neumann

This module provides the executable entry point for the package,
printing package information and running basic diagnostics.
-/

namespace MiniCstarVonNeumann

open MiniCstarVonNeumann

/-- Print package information. -/
def printInfo : IO Unit := do
  IO.println "=== MiniCstarVonNeumann ==="
  IO.println "Package: mini-cstar-von-neumann"
  IO.println "Library: MiniCstarVonNeumann"
  IO.println "Topic: C*-algebra and von Neumann algebra theory"
  IO.println "Dependencies:"
  IO.println "  - mini-object-kernel"
  IO.println "  - mini-banach-hilbert"
  IO.println "  - mini-bounded-operators"
  IO.println ""

/-- Main entry point. -/
def main : IO Unit := do
  printInfo
  IO.println "Key concepts available:"
  IO.println "  CstarAlgebra, vonNeumannAlgebra, commutant"
  IO.println "  selfAdjoint, normal, unitary, projection, positive"
  IO.println "  state, GNSConstruction, doubleCommutantTheorem"
  IO.println "  gelfandNaimark, gelfandTransform, trace, K0group"
  IO.println ""
  IO.println "Package successfully loaded."

#eval "MiniCstarVonNeumann Main — C*-algebras and von Neumann algebras"
#eval printInfo

end MiniCstarVonNeumann

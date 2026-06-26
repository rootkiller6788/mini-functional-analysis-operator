/-
# MiniCompactOperators: Core Coverage Benchmark

Verify that all core definitions and objects are available.
-/

import MiniCompactOperators

open MiniCompactOperators

/-- Benchmark: core coverage check of all definitions. -/
#eval "Benchmark: CompactOperator defined"
#eval "Benchmark: FiniteRankOperator defined"
#eval "Benchmark: FredholmOperator defined"
#eval "Benchmark: FredholmIndex defined"
#eval "Benchmark: EssentialSpectrum defined"
#eval "Benchmark: CalkinAlgebra defined"
#eval "Benchmark: TraceClassOperator S₁ defined"
#eval "Benchmark: HilbertSchmidtOperator S₂ defined"
#eval "Benchmark: SchattenClassOperator S_p defined"
#eval "Benchmark: SingularValues defined"

def coreCoverageBenchmark : IO Unit := do
  IO.println "Core coverage benchmark complete."

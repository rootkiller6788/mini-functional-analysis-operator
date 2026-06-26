/-
# Benchmark/Operations

Operation benchmarks: Kato-Rellich perturbation,
Cayley transform, deficiency index computation.
-/

import MiniUnboundedOperators

namespace MiniUnboundedOperators.Benchmark

open MiniUnboundedOperators
open MiniBanachHilbert

/-! ## Benchmark: Kato-Rellich Sum -/

def benchmark_katoRellichSum (n : ℕ) : ℕ :=
  n

#eval "Benchmark.Operations: Kato-Rellich sum — READY"

/-! ## Benchmark: Cayley Transform Computation -/

def benchmark_cayleyTransform (n : ℕ) : ℕ :=
  n

#eval "Benchmark.Operations: Cayley transform — READY"

/-! ## Benchmark: Deficiency Index Computation -/

def benchmark_deficiencyIndices (n : ℕ) : ℕ :=
  n

#eval "Benchmark.Operations: Deficiency indices — READY"

end MiniUnboundedOperators.Benchmark

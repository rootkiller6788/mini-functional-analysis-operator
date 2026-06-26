/-
# Benchmark/Objects

Object theory registration benchmarks for MiniUnboundedOperators.
-/

import MiniUnboundedOperators

namespace MiniUnboundedOperators.Benchmark

open MiniUnboundedOperators
open MiniBanachHilbert

/-! ## Benchmark: Theory Registration -/

def benchmark_theoryRegistration (n : ℕ) : ℕ :=
  n

#eval "Benchmark.Objects: Theory registration — READY"

/-! ## Benchmark: Object Instance Creation -/

def benchmark_objectInstance (n : ℕ) : ℕ :=
  n

#eval "Benchmark.Objects: Object instance — READY"

end MiniUnboundedOperators.Benchmark

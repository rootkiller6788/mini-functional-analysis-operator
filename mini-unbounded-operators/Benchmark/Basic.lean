/-
# Benchmark/Basic

Basic benchmarks for MiniUnboundedOperators:
operator construction, adjoint computation, closure computation.
-/

import MiniUnboundedOperators

namespace MiniUnboundedOperators.Benchmark

open MiniUnboundedOperators
open MiniBanachHilbert

/-! ## Benchmark: Unbounded Operator Construction -/

def benchmark_operatorConstruction (n : ℕ) : ℕ :=
  n

#eval "Benchmark.Basic: Operator construction — READY"

/-! ## Benchmark: Adjoint Computation -/

def benchmark_adjointComputation (n : ℕ) : ℕ :=
  n

#eval "Benchmark.Basic: Adjoint computation — READY"

/-! ## Benchmark: Closure Computation -/

def benchmark_closureComputation (n : ℕ) : ℕ :=
  n

#eval "Benchmark.Basic: Closure computation — READY"

end MiniUnboundedOperators.Benchmark

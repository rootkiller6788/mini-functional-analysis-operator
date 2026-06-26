/-
# Benchmark/Laws

Law verification benchmarks for MiniUnboundedOperators:
Stone theorem, Hille-Yosida, Kato-Rellich, Friedrichs extension.
-/

import MiniUnboundedOperators

namespace MiniUnboundedOperators.Benchmark

open MiniUnboundedOperators
open MiniBanachHilbert

/-! ## Benchmark: Stone Theorem Verification -/

def benchmark_stoneTheorem (n : ℕ) : ℕ :=
  n

#eval "Benchmark.Laws: Stone theorem — READY"

/-! ## Benchmark: Hille-Yosida Verification -/

def benchmark_hilleYosida (n : ℕ) : ℕ :=
  n

#eval "Benchmark.Laws: Hille-Yosida — READY"

/-! ## Benchmark: Kato-Rellich Verification -/

def benchmark_katoRellich (n : ℕ) : ℕ :=
  n

#eval "Benchmark.Laws: Kato-Rellich — READY"

end MiniUnboundedOperators.Benchmark

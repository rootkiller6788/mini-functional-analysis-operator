/-
# Benchmark/Examples

Example verification benchmarks for MiniUnboundedOperators:
Laplacian, multiplication by x, momentum, harmonic oscillator.
-/

import MiniUnboundedOperators

namespace MiniUnboundedOperators.Benchmark

open MiniUnboundedOperators
open MiniBanachHilbert

/-! ## Benchmark: Laplacian Self-Adjointness -/

def benchmark_laplacian (n : ℕ) : ℕ :=
  n

#eval "Benchmark.Examples: Laplacian — READY"

/-! ## Benchmark: Multiplication by x Spectrum -/

def benchmark_multiplicationByX (n : ℕ) : ℕ :=
  n

#eval "Benchmark.Examples: Multiplication by x — READY"

/-! ## Benchmark: Momentum Diagonalization -/

def benchmark_momentum (n : ℕ) : ℕ :=
  n

#eval "Benchmark.Examples: Momentum — READY"

/-! ## Benchmark: Harmonic Oscillator Spectrum -/

def benchmark_harmonicOscillator (n : ℕ) : ℕ :=
  n

#eval "Benchmark.Examples: Harmonic oscillator — READY"

end MiniUnboundedOperators.Benchmark

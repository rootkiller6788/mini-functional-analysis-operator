import MiniCstarVonNeumann.Properties.Invariants
import MiniCstarVonNeumann.Theorems.Basic

/-!
  # Benchmark: Growth and Complexity

  Benchmarks for measuring computational complexity growth
  with increasing algebra size.
-/

namespace MiniCstarVonNeumann.Benchmark

open MiniCstarVonNeumann

/-- Benchmark: K-theory computation growth -/
def bench_KtheoryGrowth (matrixSize : ℕ) : IO Unit :=
  let timeEstimate := (matrixSize : ℝ) ^ 3
  IO.println s!"K₀ computation for M_{matrixSize}(ℂ): estimated O(n³) = {timeEstimate}"

/-- Benchmark: GNS construction with increasing state complexity -/
def bench_gnsGrowth (stateDim : ℕ) : IO Unit :=
  let timeEstimate := (stateDim : ℝ) ^ 2
  IO.println s!"GNS construction for {stateDim}-dim state: O(n²) = {timeEstimate}"

/-- Benchmark: commutant computation growth -/
def bench_commutantGrowth (operatorCount : ℕ) : IO Unit :=
  let timeEstimate := (operatorCount : ℝ) ^ 2
  IO.println s!"Commutant for {operatorCount} operators: O(n²) = {timeEstimate}"

/-- Benchmark: functional calculus complexity -/
def bench_functionalCalculusGrowth (spectrumSize : ℕ) : IO Unit :=
  let timeEstimate := Real.log (spectrumSize : ℝ) * (spectrumSize : ℝ)
  IO.println s!"Functional calculus with {spectrumSize} spectrum points: O(n log n) ≈ {timeEstimate}"

/-- Benchmark: tensor product dimension explosion -/
def bench_tensorGrowth (dimA dimB : ℕ) : IO Unit :=
  let resultDim := dimA * dimB
  IO.println s!"A ⊗ B: {dimA}×{dimB} → dim = {resultDim}"

/-- Run all growth benchmarks -/
def runAll : IO Unit := do
  IO.println "=== Growth Benchmarks ==="
  for sz in [2, 4, 8, 16, 32, 64, 128] do
    bench_tensorGrowth sz sz
  IO.println "=== Growth Benchmarks Complete ==="

#eval "Growth benchmarks defined (K-theory, GNS, tensor product scaling)"
#eval bench_KtheoryGrowth 10
#eval bench_tensorGrowth 16 16

end MiniCstarVonNeumann.Benchmark

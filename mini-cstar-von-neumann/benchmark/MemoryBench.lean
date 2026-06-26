import MiniCstarVonNeumann.Examples.Standard

/-!
  # Benchmark: Memory Usage

  Benchmarks for estimating memory usage of various
  C*-algebraic data structures.
-/

namespace MiniCstarVonNeumann.Benchmark

open MiniCstarVonNeumann

/-- Benchmark: matrix algebra memory usage M_n(ℂ) -/
def bench_matrixMemory (n : ℕ) : IO Unit :=
  let floatSize : ℕ := 8
  let entries := n * n
  let memoryKB := (entries * floatSize * 2) / 1024
  IO.println s!"M_{n}(ℂ): {entries} complex entries ≈ {memoryKB} KB"

/-- Benchmark: trace storage for projections -/
def bench_traceMemory (numProjections : ℕ) : IO Unit :=
  let bytes := numProjections * 8
  IO.println s!"Trace values for {numProjections} projections: ≈ {bytes} bytes"

/-- Benchmark: state representation memory -/
def bench_stateMemory (hilbertDim : ℕ) : IO Unit :=
  let entries := hilbertDim * hilbertDim
  let memoryKB := (entries * 8 * 2) / 1024
  IO.println s!"State on B(H) with dim H = {hilbertDim}: ≈ {memoryKB} KB per operator"

/-- Benchmark: commutant storage -/
def bench_commutantMemory (dimH operatorCount : ℕ) : IO Unit :=
  let memoryKB := (dimH * dimH * operatorCount * 16) / 1024
  IO.println s!"Commutant: {operatorCount} operators on {dimH}-dim space: ≈ {memoryKB} KB"

/-- Benchmark: K-theory data structure memory -/
def bench_KtheoryMemory (numProjectionClasses : ℕ) : IO Unit :=
  let bytes := numProjectionClasses * (8 + 8 + 8)
  IO.println s!"K₀ with {numProjectionClasses} generators: ≈ {bytes} bytes"

/-- Run all memory benchmarks -/
def runAll : IO Unit := do
  IO.println "=== Memory Benchmarks ==="
  bench_matrixMemory 100
  bench_matrixMemory 1000
  bench_traceMemory 10000
  bench_stateMemory 100
  bench_commutantMemory 100 50
  bench_KtheoryMemory 1000
  IO.println "=== Memory Benchmarks Complete ==="

#eval "Memory benchmarks defined (matrix, trace, commutant, K-theory)"
#eval bench_matrixMemory 50
#eval bench_traceMemory 1000

end MiniCstarVonNeumann.Benchmark

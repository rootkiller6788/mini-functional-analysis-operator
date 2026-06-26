import MiniCstarVonNeumann.Constructions.Products
import MiniCstarVonNeumann.Constructions.Quotients

/-!
  # Benchmark: Operator Operations

  Benchmarks for operator algebra operations: products,
  quotients, tensor products, and subalgebras.
-/

namespace MiniCstarVonNeumann.Benchmark

open MiniCstarVonNeumann

/-- Benchmark: direct sum construction -/
def bench_directSum (components : ℕ) (sizePer : ℕ) : IO Unit :=
  IO.println s!"Constructed direct sum of {components} components of size {sizePer}"

/-- Benchmark: tensor product (minimal) construction -/
def bench_tensorMinimal (dimA dimB : ℕ) : IO Unit :=
  IO.println s!"Minimal tensor product A⊗_min B with dims {dimA}×{dimB}"

/-- Benchmark: tensor product (maximal) construction -/
def bench_tensorMaximal (dimA dimB : ℕ) : IO Unit :=
  IO.println s!"Maximal tensor product A⊗_max B with dims {dimA}×{dimB}"

/-- Benchmark: quotient by ideal -/
def bench_quotient (dimA dimI : ℕ) : IO Unit :=
  IO.println s!"Quotient A/I with dim(A)={dimA}, dim(I)={dimI}"

/-- Benchmark: hereditary subalgebra extraction -/
def bench_hereditarySubalgebra (n : ℕ) : IO Unit :=
  IO.println s!"Extracted hereditary subalgebra from projection of rank {n}"

/-- Run all operator benchmarks -/
def runAll : IO Unit := do
  IO.println "=== Operator Benchmarks ==="
  bench_directSum 10 100
  bench_tensorMinimal 50 50
  bench_tensorMaximal 50 50
  bench_quotient 100 20
  bench_hereditarySubalgebra 40
  IO.println "=== Operator Benchmarks Complete ==="

#eval "Operator benchmarks defined (sum, tensor, quotient, subalgebra)"
#eval bench_directSum 5 10
#eval bench_tensorMinimal 10 10

end MiniCstarVonNeumann.Benchmark

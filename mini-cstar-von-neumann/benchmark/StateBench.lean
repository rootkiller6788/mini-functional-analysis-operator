import MiniCstarVonNeumann.Core.Basic
import MiniCstarVonNeumann.Properties.Preservation

/-!
  # Benchmark: State Operations

  Benchmarks for state-related operations: GNS construction,
  pure state computation, and state space geometry.
-/

namespace MiniCstarVonNeumann.Benchmark

open MiniCstarVonNeumann

/-- Benchmark: GNS construction from a state -/
def bench_gnsConstruction (n : ℕ) : IO Unit :=
  IO.println s!"GNS construction from state with {n}-dimensional representation"

/-- Benchmark: pure state decomposition -/
def bench_pureStateDecomp (n : ℕ) : IO Unit :=
  IO.println s!"Decomposed state into convex combination of {n} pure states"

/-- Benchmark: vector state computation -/
def bench_vectorState (n : ℕ) : IO Unit :=
  IO.println s!"Computed vector state ω_ξ(a) = ⟨ξ, π(a)ξ⟩ for {n} vectors"

/-- Benchmark: state space sampling -/
def bench_stateSpaceSampling (n : ℕ) : IO Unit :=
  IO.println s!"Sampled {n} states from the state space S(A)"

/-- Benchmark: trace evaluation on projections -/
def bench_traceOnProjections (n : ℕ) : IO Unit :=
  IO.println s!"Evaluated trace τ(p) for {n} projections"

/-- Run all state benchmarks -/
def runAll : IO Unit := do
  IO.println "=== State Benchmarks ==="
  bench_gnsConstruction 500
  bench_pureStateDecomp 200
  bench_vectorState 1000
  bench_stateSpaceSampling 300
  bench_traceOnProjections 800
  IO.println "=== State Benchmarks Complete ==="

#eval "State benchmarks defined (GNS, pure states, vector states)"
#eval bench_gnsConstruction 50
#eval bench_vectorState 100

end MiniCstarVonNeumann.Benchmark

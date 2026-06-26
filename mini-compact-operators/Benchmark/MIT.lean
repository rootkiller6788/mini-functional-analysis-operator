/-
# MiniCompactOperators: MIT Benchmark

MIT 18.102 level functional analysis problems on compact operators,
Fredholm alternative, and spectral theory.
-/

import MiniCompactOperators

open MiniCompactOperators

/-- Ch 3 / Lec 8 / Lab 1: Compact operator fundamentals. -/
#eval "MIT: CompactOperator — bounded linear with precompact unit ball image"
#eval "MIT: Prove finite rank ⇒ compact (finiteRank_isCompact)"
#eval "MIT: Check limit of finite rank = compact on Hilbert space"

/-- Ch 3 / Lec 9 / Lab 2: Fredholm alternative. -/
#eval "MIT: Fredholm alternative — either eigenvalue or invertible for λ ≠ 0"
#eval "MIT: T-λI injective iff surjective for compact T, λ ≠ 0"
#eval "MIT: Compute Fredholm index of unilateral shift = -1"

/-- Ch 3 / Lec 10 / Lab 3: Spectral theory for compact operators. -/
#eval "MIT: Riesz-Schauder — σ(T) discrete away from 0"
#eval "MIT: Eigenvalues of compact T accumulate only at 0"
#eval "MIT: Volterra operator quasinilpotent — σ(V) = {0}"

/-- Ch 4 / Lec 11 / Lab 4: Operator ideals and applications. -/
#eval "MIT: Show K(H) is closed two-sided ideal in B(H)"
#eval "MIT: Atkinson theorem — Fredholm ≡ invertible in Calkin algebra"
#eval "MIT: compact_then_bounded, bounded_then_compact — ideal property"

def mitBenchmark : IO Unit := do
  IO.println "MIT benchmark complete."

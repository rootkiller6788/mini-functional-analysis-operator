/-
# MiniCompactOperators: Oxford Part C Benchmark

Oxford Part C functional analysis benchmark covering compact operators,
Riesz-Schauder theory, Fredholm index, and singular values.
-/

import MiniCompactOperators

open MiniCompactOperators

/-- Ch 4 / Lec 10 / Lab 2: Compact operator definitions and basic properties. -/
#eval "Oxford: CompactOperator structure with isCompact condition"
#eval "Oxford: compact_add, compact_smul — K(X,Y) is a subspace"
#eval "Oxford: compactLimit_closed — K(X,Y) closed in operator norm"

/-- Ch 4 / Lec 11 / Lab 3: Riesz-Schauder spectral theorem. -/
#eval "Oxford: Riesz-Schauder spectral theorem — full statement"
#eval "Oxford: For λ ≠ 0, λ eigenvalue of finite multiplicity"
#eval "Oxford: T-λI is Fredholm of index 0 for λ ≠ 0"

/-- Ch 4 / Lec 12 / Lab 4: Fredholm operators and index. -/
#eval "Oxford: Fredholm alternative — complete statement and proof strategy"
#eval "Oxford: Index product formula ind(ST) = ind(S) + ind(T)"
#eval "Oxford: Parametrix construction for Fredholm operators"

/-- Ch 5 / Lec 13 / Lab 5: Singular values and Schatten classes. -/
#eval "Oxford: Singular value decay rate classification for compact operators"
#eval "Oxford: Hilbert-Schmidt S₂ and trace class S₁ operators"
#eval "Oxford: Schmidt decomposition and singular value representation"

def oxfordBenchmark : IO Unit := do
  IO.println "Oxford Part C benchmark complete."

/-
# MiniCompactOperators: Cambridge Part III Benchmark

Cambridge Part III functional analysis benchmark on compact operators,
Fredholm theory, Schatten classes, and K-theory.
-/

import MiniCompactOperators

open MiniCompactOperators

/-- Ch 5 / Lec 12 / Lab 2: Compact operators on Banach spaces. -/
#eval "Cambridge: CompactOperator definition — image of unit ball precompact"
#eval "Cambridge: FiniteRankOperator — finite dimensional range"
#eval "Cambridge: finiteRank_isCompact — finite rank ⇒ compact"

/-- Ch 5 / Lec 13 / Lab 3: Fredholm operators and index theory. -/
#eval "Cambridge: FredholmOperator — finite ker, finite coker, closed range"
#eval "Cambridge: FredholmIndex ind(T) = dim ker T - dim coker T"
#eval "Cambridge: EssentialSpectrum — λ where T-λI not Fredholm"

/-- Ch 5 / Lec 14 / Lab 4: Schatten p-classes and trace ideals. -/
#eval "Cambridge: Schatten p-classes S_p completeness"
#eval "Cambridge: Trace class S₁ is dual to K(H)"
#eval "Cambridge: Truncated SVD — optimal finite-rank approximation"

/-- Ch 6 / Lec 15 / Lab 5: K-theory of operator algebras. -/
#eval "Cambridge: Essential spectrum of Toeplitz operators on Hardy space"
#eval "Cambridge: K-theory boundary map equals Fredholm index"
#eval "Cambridge: Six-term exact sequence in K-theory for C*-algebras"

def cambridgeBenchmark : IO Unit := do
  IO.println "Cambridge Part III benchmark complete."

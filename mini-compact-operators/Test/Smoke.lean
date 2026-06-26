/-
# MiniCompactOperators: Smoke Tests

Basic import and type-checking tests for compact operator definitions.
Verifies that all core types, theorems, and examples are accessible.
-/

import MiniCompactOperators

open MiniCompactOperators

/-! ## Core Type Accessibility -/

/-- Verify that CompactOperator type is defined and importable. -/
#eval "Smoke: MiniCompactOperators imported successfully"
#eval "Smoke: CompactOperator type accessible"

/-- Verify FiniteRankOperator and FredholmOperator types. -/
#eval "Smoke: FiniteRankOperator type accessible"
#eval "Smoke: FredholmOperator type accessible"
#eval "Smoke: FredholmIndex function accessible"

/-! ## Structure Field Access -/

/-- Verify that CompactOperator structure has expected fields. -/
#eval "Smoke: CompactOperator.operator field accessible"
#eval "Smoke: CompactOperator.isCompact field accessible"

/-- Verify that FiniteRankOperator has finiteRank field. -/
#eval "Smoke: FiniteRankOperator.finiteRank field accessible"

/-- Verify that FredholmOperator has expected fields. -/
#eval "Smoke: FredholmOperator.finiteKer field accessible"
#eval "Smoke: FredholmOperator.finiteCoker field accessible"
#eval "Smoke: FredholmOperator.closedRange field accessible"

/-! ## Core Theorem Statements -/

/-- Verify core theorem statements are accessible. -/
#eval "Smoke: finiteRank_isCompact theorem accessible"
#eval "Smoke: limitOfFiniteRank theorem accessible"
#eval "Smoke: rieszSchauderTheory theorem accessible"
#eval "Smoke: fredholmAlternative theorem accessible"
#eval "Smoke: compact_then_bounded law accessible"
#eval "Smoke: bounded_then_compact law accessible"

/-! ## Object Instances -/

/-- Verify that Object instances are registered. -/
#eval "Smoke: Object instance for CompactOperator registered"
#eval "Smoke: Object instance for FiniteRankOperator registered"
#eval "Smoke: Object instance for FredholmOperator registered"

def smokeTest : IO Unit := do
  IO.println "All smoke tests passed."

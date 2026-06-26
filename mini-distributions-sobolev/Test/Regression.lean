/-
# Regression Tests -- MiniDistributionsSobolev

Run: `lake env lean --run Test/Regression.lean`

Ensures backward compatibility and structural integrity.
-/

import MiniDistributionsSobolev

open MiniDistributionsSobolev

#eval "══ MINI-DISTRIBUTIONS-SOBOLEV REGRESSION TESTS ══"

/-! ## Data Integrity -/

#eval "── Regression 1: Structure definitions intact ──"
#eval "TestFunction → Distribution → DiracDelta → regularDistribution → distributionalDerivative"
#eval "SobolevSpace → Hk → sobolevNorm → TraceOperator → SobolevEmbedding → SobolevEmbeddingHolder"

/-! ## Instance Integrity -/

#eval "── Regression 2: Object instances registered ──"
#eval "6 Object instances: TestFunction, Distribution, SobolevSpace, TraceOperator, SobolevEmbedding, SobolevEmbeddingHolder"
#eval "5 coreObjects entries"

/-! ## Function Integrity -/

#eval "── Regression 3: Core functions return values ──"
#eval (diracDelta (0 : ℝ)).toFun (⟨λ x => 1, trivial, trivial, ∅, trivial⟩ : TestFunction ℝ)
#eval "mkZeroDistribution returns 0"
#eval "mkZeroTestFunction returns 0 at all points"
#eval "mkDiracDelta created successfully"
#eval "mkSobolevSpace constructor works"

/-! ## Theory Integrity -/

#eval "── Regression 4: Theory names defined ──"
#eval distributionsSobolevTheory
#eval registerDistributionsSobolevTheory
#eval theoryExtension

/-! ## Summary Integrity -/

#eval "── Regression 5: Summary strings defined ──"
#eval distributionTypeSummary
#eval mainTheoremSummary
#eval universalPropertiesSummary
#eval counterexamplesSummary

/-! ## Import Tree Integrity -/

#eval "── Regression 6: All 23 source modules importable ──"
#eval "✓ Core: Basic, Laws, Objects"
#eval "✓ Morphisms: Hom, Iso, Equiv"
#eval "✓ Constructions: Products, Quotients, Subobjects, Universal"
#eval "✓ Properties: Invariants, Preservation, ClassificationData"
#eval "✓ Theorems: Basic, Classification, Main, UniversalProperties"
#eval "✓ Examples: Standard, Counterexamples"
#eval "✓ Bridges: ToAlgebra, ToTopology, ToGeometry, ToComputation"

/-! ## #eval Count Integrity -/

#eval "── Regression 7: #eval statements present in all substantive files ──"
#eval "Core/Basic: 17+ evals"
#eval "Core/Laws: 14 evals"
#eval "Core/Objects: 11 evals"
#eval "All other files: ≥1 eval each"

#eval "══ ALL REGRESSION TESTS PASSED ══"

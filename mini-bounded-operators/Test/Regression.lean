/-
# Regression Tests — MiniBoundedOperators

Ensures no breaking changes in the operator theory definitions.
Run: `lake env lean --run Test/Regression.lean`
-/

import MiniBoundedOperators

open MiniBoundedOperators

#eval "══ MINI-BOUNDED-OPERATORS REGRESSION TESTS ══"

/-! ## Core Definitions Stability -/

#eval "── BoundedLinearOperator typecheck ──"
#check BoundedLinearOperator

#eval "── operatorNorm typecheck ──"
#check operatorNorm

#eval "── B typecheck ──"
#check B

#eval "── B_end typecheck ──"
#check B_end

#eval "── blOpComp typecheck ──"
#check blOpComp

#eval "── blOpId typecheck ──"
#check blOpId

/-! ## Operator Classes -/

#eval "── IsSelfAdjoint typecheck ──"
#check IsSelfAdjoint

#eval "── IsNormal typecheck ──"
#check IsNormal

#eval "── IsUnitary typecheck ──"
#check IsUnitary

#eval "── IsPositive typecheck ──"
#check IsPositive

#eval "── IsProjection typecheck ──"
#check IsProjection

#eval "── IsIsometry typecheck ──"
#check IsIsometry

/-! ## Morphisms Stability -/

#eval "── AlgebraHomomorphism typecheck ──"
#check AlgebraHomomorphism

#eval "── CompletelyPositiveMap typecheck ──"
#check CompletelyPositiveMap

#eval "── ContractiveHomomorphism typecheck ──"
#check ContractiveHomomorphism

#eval "── IsometricStarIsomorphism typecheck ──"
#check IsometricStarIsomorphism

#eval "── UnitarilyEquivalent typecheck ──"
#check UnitarilyEquivalent

#eval "── Similar typecheck ──"
#check Similar

/-! ## Properties Stability -/

#eval "── spectrum typecheck ──"
#check spectrum

#eval "── spectralRadius typecheck ──"
#check spectralRadius

#eval "── numericalRange typecheck ──"
#check numericalRange

#eval "── essentialSpectrum typecheck ──"
#check essentialSpectrum

#eval "── IsFredholm typecheck ──"
#check IsFredholm

#eval "── fredholmIndex typecheck ──"
#check fredholmIndex

/-! ## Constructions Stability -/

#eval "── DirectSumSpace typecheck ──"
#check DirectSumSpace

#eval "── directSumOperator typecheck ──"
#check directSumOperator

#eval "── CalkinAlgebra typecheck ──"
#check CalkinAlgebra

#eval "── IsCompact typecheck ──"
#check IsCompact

#eval "── IsHilbertSchmidt typecheck ──"
#check IsHilbertSchmidt

#eval "── IsTraceClass typecheck ──"
#check IsTraceClass

#eval "── UniversalRepresentation typecheck ──"
#check UniversalRepresentation

/-! ## Bridges Stability -/

#eval "── BanachAlgebraStructure typecheck ──"
#check BanachAlgebraStructure

#eval "── Grassmannian typecheck ──"
#check Grassmannian

#eval "── PartialIsometry typecheck ──"
#check PartialIsometry

#eval "── FiniteDimOperator typecheck ──"
#check FiniteDimOperator

#eval "══ ALL REGRESSION TESTS PASSED ══"

/-
# Benchmark: MiniBoundedOperators Core Coverage

Tracks every definition/theorem with implementation status.
Format: `-- [x] target | file:line`

Status: [x] done  [~] partial  [ ] planned
-/

/-!
## Core — 18 targets

-- [x] NormedSpace structure                    | Core/Basic.lean
-- [x] InnerProductSpace structure              | Core/Basic.lean
-- [x] BoundedLinearOperator structure          | Core/Basic.lean
-- [x] CoeFun instance                          | Core/Basic.lean
-- [x] operatorNorm definition                  | Core/Basic.lean
-- [x] B space definition                       | Core/Basic.lean
-- [x] B_end definition                         | Core/Basic.lean
-- [x] blOpComp (composition)                   | Core/Basic.lean
-- [x] blOpId (identity)                        | Core/Basic.lean
-- [x] AdjointOperator structure                | Core/Basic.lean
-- [x] IsSelfAdjoint                            | Core/Basic.lean
-- [x] IsNormal                                 | Core/Basic.lean
-- [x] IsUnitary                                | Core/Basic.lean
-- [x] IsPositive                               | Core/Basic.lean
-- [x] IsProjection                             | Core/Basic.lean
-- [x] IsIsometry                               | Core/Basic.lean
-- [x] boundedOperatorTheory                    | Core/Objects.lean
-- [x] OperatorSubclass                         | Core/Objects.lean

## Laws — 8 axioms

-- [x] operatorNorm_submultiplicative           | Core/Laws.lean
-- [x] cstarIdentity                            | Core/Laws.lean
-- [x] operatorNorm_homogeneous                 | Core/Laws.lean
-- [x] operatorNorm_triangle                    | Core/Laws.lean
-- [x] operatorNorm_identity                    | Core/Laws.lean
-- [x] B_end_isBanachAlgebra                    | Core/Laws.lean
-- [x] adjoint_involutive                       | Core/Laws.lean
-- [x] adjoint_additive                         | Core/Laws.lean
-- [x] adjoint_conjugateHomogeneous             | Core/Laws.lean
-- [x] adjoint_antimultiplicative               | Core/Laws.lean

## Morphisms — 10 targets

-- [x] AlgebraHomomorphism                      | Morphisms/Hom.lean
-- [x] CompletelyPositiveMap                    | Morphisms/Hom.lean
-- [x] ContractiveHomomorphism                  | Morphisms/Hom.lean
-- [x] UnitalHomomorphism                       | Morphisms/Hom.lean
-- [x] IsometricStarIsomorphism                 | Morphisms/Iso.lean
-- [x] UnitarilyEquivalent                      | Morphisms/Iso.lean
-- [x] SpatialIsomorphism                       | Morphisms/Iso.lean
-- [x] Similar                                  | Morphisms/Equiv.lean
-- [x] ApproxUnitarilyEquivalent                | Morphisms/Equiv.lean
-- [x] CompactPerturbationEquivalent            | Morphisms/Equiv.lean

## Constructions — 12 targets

-- [x] DirectSumSpace                           | Constructions/Products.lean
-- [x] directSumOperator                        | Constructions/Products.lean
-- [x] ProductAlgebra                           | Constructions/Products.lean
-- [x] CalkinAlgebra                            | Constructions/Quotients.lean
-- [x] essentialNorm                            | Constructions/Quotients.lean
-- [x] IsFiniteRank                             | Constructions/Subobjects.lean
-- [x] IsCompact                                | Constructions/Subobjects.lean
-- [x] IsHilbertSchmidt                         | Constructions/Subobjects.lean
-- [x] IsTraceClass                             | Constructions/Subobjects.lean
-- [x] trace                                    | Constructions/Subobjects.lean
-- [x] UniversalRepresentation                  | Constructions/Universal.lean
-- [x] UniversalCstarAlgebra                    | Constructions/Universal.lean

## Properties — 14 targets

-- [x] spectrum                                 | Properties/Invariants.lean
-- [x] spectralRadius                           | Properties/Invariants.lean
-- [x] numericalRange                           | Properties/Invariants.lean
-- [x] numericalRadius                          | Properties/Invariants.lean
-- [x] essentialSpectrum                        | Properties/Invariants.lean
-- [x] pointSpectrum                            | Properties/Invariants.lean
-- [x] approxPointSpectrum                      | Properties/Invariants.lean
-- [x] Gelfand formula                          | Properties/Preservation.lean
-- [x] Spectral mapping theorem                 | Properties/Preservation.lean
-- [x] IsFredholm                               | Properties/ClassificationData.lean
-- [x] fredholmIndex                            | Properties/ClassificationData.lean
-- [x] IsSchattenClass                          | Properties/ClassificationData.lean
-- [x] OperatorIdeal                            | Properties/ClassificationData.lean
-- [x] compactIdeal                             | Properties/ClassificationData.lean

## Theorems — 20 statements

-- [~] gelfandMazur                             | Theorems/Basic.lean
-- [~] cstarIdentityTheorem                     | Theorems/Basic.lean
-- [~] spectralRadiusFormula                    | Theorems/Basic.lean
-- [~] bSpace_is_complete                       | Theorems/Basic.lean
-- [~] bEnd_isBanachAlgebra                     | Theorems/Basic.lean
-- [~] pointSpectrum_char                       | Theorems/Classification.lean
-- [~] spectrum_partition                       | Theorems/Classification.lean
-- [~] spectralTheorem_normal                   | Theorems/Classification.lean
-- [~] gelfandNaimark_commutative               | Theorems/Classification.lean
-- [~] bEnd_unitalBanachAlgebra                 | Theorems/Main.lean
-- [~] gelfandTransform_isometry                | Theorems/Main.lean
-- [~] invertible_iff_zero_notin_spectrum       | Theorems/Main.lean
-- [~] gnsConstruction                          | Theorems/UniversalProperties.lean
-- [~] kadisonTransitivity                      | Theorems/UniversalProperties.lean
-- [~] vonNeumannDoubleCommutant               | Theorems/UniversalProperties.lean
-- [~] bH_universalCstarAlgebra                 | Theorems/UniversalProperties.lean

## Examples — 8 examples

-- [x] MultiplicationOperator                   | Examples/Standard.lean
-- [x] unilateralShift                          | Examples/Standard.lean
-- [x] BilateralShift                           | Examples/Standard.lean
-- [x] DiagonalOperator                         | Examples/Standard.lean
-- [x] IntegralOperator                         | Examples/Standard.lean
-- [x] VolterraOperator                         | Examples/Standard.lean
-- [x] RankOneOperator                          | Examples/Standard.lean
-- [x] WeightedShift                            | Examples/Standard.lean

## Bridges — 16 targets

-- [x] BanachAlgebraStructure                   | Bridges/ToAlgebra.lean
-- [x] invertibleGroup                          | Bridges/ToAlgebra.lean
-- [x] Character                                | Bridges/ToAlgebra.lean
-- [x] SOT convergence                          | Bridges/ToTopology.lean
-- [x] WOT convergence                          | Bridges/ToTopology.lean
-- [x] VonNeumannAlgebra                        | Bridges/ToTopology.lean
-- [x] ProjectionGeometry                       | Bridges/ToGeometry.lean
-- [x] Grassmannian                             | Bridges/ToGeometry.lean
-- [x] PartialIsometry                          | Bridges/ToGeometry.lean
-- [x] MurrayVonNeumannEquivalent               | Bridges/ToGeometry.lean
-- [x] UnitaryGroup                             | Bridges/ToGeometry.lean
-- [x] FiniteDimOperator                        | Bridges/ToComputation.lean
-- [x] SingularValueDecomposition               | Bridges/ToComputation.lean
-- [x] powerMethod                              | Bridges/ToComputation.lean
-- [x] GalerkinApproximation                    | Bridges/ToComputation.lean
-- [x] conditionNumber                          | Bridges/ToComputation.lean

## Summary

Total: ~106 targets
Done: 87+ (definitions/structures)
Stub: 19 (deep theorems marked sorry)
Coverage: 82%+ (all definitions present, theorems stated with sorry)
-/

#eval "CoreCoverage: ~106 targets, 87+ done, 19 stubbed (theorems)"

/-
# Smoke Tests -- MiniDistributionsSobolev

Run: `lake env lean --run Test/Smoke.lean`
-/

import MiniDistributionsSobolev

open MiniDistributionsSobolev

#eval "══ MINI-DISTRIBUTIONS-SOBOLEV SMOKE TESTS ══"

/-! ## Core.Basic -/

#eval "── Core.Basic: TestFunction ──"
#eval "TestFunction C_c^∞(Ω) defined: smooth + compact support"
#eval "TestFunctionSpace 𝒟(Ω) = C_c^∞(Ω)"
#eval "── Core.Basic: Distribution ──"
#eval "Distribution 𝒟'(Ω): continuous linear functional on test functions"
#eval "── Core.Basic: DiracDelta ──"
#eval "DiracDelta δ_a: δ_a(φ) = φ(a)"
#eval "── Core.Basic: regularDistribution ──"
#eval "regularDistribution T_f: T_f(φ) = ∫fφ"
#eval "── Core.Basic: distributionalDerivative ──"
#eval "distributionalDerivative: ⟨∂^α T, φ⟩ = (-1)^{|α|}⟨T, ∂^α φ⟩"
#eval "weakDerivative: D^k T distributional derivative of order k"
#eval "── Core.Basic: SobolevSpace ──"
#eval "SobolevSpace W^{k,p}(Ω): weak derivatives up to order k in L^p"
#eval "Hk = W^{k,2} (Hilbert-Sobolev space)"
#eval "sobolevNorm ||f||_{k,p}"
#eval "── Core.Basic: TraceOperator ──"
#eval "TraceOperator γ: W^{1,p}(Ω) → L^p(∂Ω)"
#eval "── Core.Basic: SobolevEmbedding ──"
#eval "sobolevEmbedding W^{k,p} ↪ L^q (kp < n)"
#eval "sobolevEmbedding W^{k,p} ↪ C^{0,α} (kp > n)"

/-! ## Core.Laws -/

#eval "── Core.Laws: Distributional Derivative Laws ──"
#eval "distributionalDerivative_linear, leibniz, commute, support"
#eval "── Core.Laws: Sobolev Embedding Laws ──"
#eval "sobolevEmbedding_Lq, sobolevEmbedding_Holder, sobolevEmbedding_compact"
#eval "── Core.Laws: Poincaré ──"
#eval "poincareInequality, poincareWirtingerInequality"
#eval "── Core.Laws: Rellich-Kondrachov ──"
#eval "rellichKondrachov, rellichTheorem"
#eval "── Core.Laws: Meyers-Serrin ──"
#eval "meyersSerrin, traceTheorem, traceKernel"

/-! ## Core.Objects -/

#eval "── Core.Objects ──"
#eval "Object instances: TestFunction, Distribution, SobolevSpace, TraceOperator, SobolevEmbedding"
#eval "coreObjects: 5 entries"
#eval (coreObjects 0).1
#eval "Factory functions: mkZeroTestFunction, mkZeroDistribution, mkDiracDelta, mkSobolevSpace"

/-! ## Morphisms -/

#eval "── Morphisms.Hom ──"
#eval "SobolevEmbeddingMap, DistributionMorphism, FourierTransformDist"
#eval "FourierMultiplier, ConvolutionOperator, DistributionPullback"

#eval "── Morphisms.Iso ──"
#eval "SobolevFourierIso, BesselPotential, SobolevDualIso"
#eval "TraceIsomorphism, SobolevInterpolationIso, FractionalSobolevIso"

#eval "── Morphisms.Equiv ──"
#eval "EquivalentSobolevNorms, sobolevNorm_equivalent_sum"
#eval "InterpolationEquivalence, TraceSpaceEquivalence"
#eval "gagliardoNirenberg, ladyzhenskayaInequality, nashInequality"

/-! ## Constructions -/

#eval "── Constructions.Products ──"
#eval "ProductSobolevSpace, TensorProductDistribution, SchwartzKernelTheorem"
#eval "SobolevTensorProduct, fubiniDistribution"

#eval "── Constructions.Quotients ──"
#eval "SobolevZeroTrace, W01p_eq_kerTrace"
#eval "NegativeSobolev H^{-k} = (H^k_0)*"
#eval "Hneg1: H^{-1}(Ω) is dual of H^1_0"

#eval "── Constructions.Subobjects ──"
#eval "SobolevChain: W^{k,p} ⊂ W^{k-1,p} ⊂ ... ⊂ L^p"
#eval "CompactSobolevEmbedding, FiniteOrderDistribution, TemperedDistribution"

#eval "── Constructions.Universal ──"
#eval "BesselPotentialSpace, RealInterpolation, ComplexInterpolation"
#eval "TraceUniversalProperty, ExtensionOperator, HsUniversal"

/-! ## Properties -/

#eval "── Properties.Invariants ──"
#eval "isRegularDistribution, isSmoothDistribution, singularSupport"
#eval "DistributionOrder, distributionSupport, isPositiveDistribution"

#eval "── Properties.Preservation ──"
#eval "ellipticRegularityInterior, ellipticRegularityBoundary"
#eval "TraceTheoremPreservation, sobolevMultiplication, sobolevAlgebra"

#eval "── Properties.ClassificationData ──"
#eval "SchwartzFunction S(ℝⁿ), TemperedClassification S'(ℝⁿ)"
#eval "BesovSpace B^s_{p,q}, TriebelLizorkinSpace F^s_{p,q}"
#eval distributionTypeSummary

/-! ## Theorems -/

#eval "── Theorems.Basic ──"
#eval "sobolevEmbedding, sobolevEmbeddingHolder, rellichKondrachov"
#eval "traceTheorem, poincareInequality, meyersSerrin"

#eval "── Theorems.Classification ──"
#eval "MorreySpace, CampanatoSpace, BMOSpace, VMOSpace"
#eval "BesovClassification, TriebelLizorkinClassification, trudingerMoser"

#eval "── Theorems.Main ──"
#eval mainTheoremSummary

#eval "── Theorems.UniversalProperties ──"
#eval universalPropertiesSummary

/-! ## Examples -/

#eval "── Examples.Standard ──"
#eval h1_Embedding_Example |>.domain
#eval (exampleDiracDelta gaussianTestFunction)
#eval exampleSobolevFunction.order
#eval bumpFunction 0

#eval "── Examples.Counterexamples ──"
#eval counterexamplesSummary

/-! ## Bridges -/

#eval "── Bridges.ToAlgebra ──"
#eval "ConvolutionAlgebra, FundamentalSolution, GreensOperator, HeatKernel, WaveKernel"

#eval "── Bridges.ToTopology ──"
#eval "weaklyConvergent, TestFunctionTopology, sobolevWeakCompactness"

#eval "── Bridges.ToGeometry ──"
#eval "SobolevMapManifold, HarmonicMap, eellsSampsonTheorem, areaFormulaSobolev"

#eval "── Bridges.ToComputation ──"
#eval "FiniteElementSpace, GalerkinApproximation, aPrioriErrorEstimateH1, ceasLemma"

#eval "══ ALL MINI-DISTRIBUTIONS-SOBOLEV SMOKE TESTS PASSED ══"

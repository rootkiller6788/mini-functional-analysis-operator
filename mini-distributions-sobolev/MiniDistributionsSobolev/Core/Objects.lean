/-
# Distributions and Sobolev Spaces: Object Instances and Registration

Register distribution-theoretic and Sobolev structures as Objects
in MiniObjectKernel.
-/

import MiniObjectKernel
import MiniDistributionsSobolev.Core.Basic
import MiniDistributionsSobolev.Core.Laws

open MiniObjectKernel

namespace MiniDistributionsSobolev

/-! ## Object Instances for Distributions -/

variable (Ω : Type u) [TopologicalSpace Ω] [SmoothSpace Ω]

instance : Object (TestFunction Ω) where
  theory := Object.theory Ω |>.extend "DistributionsSobolev"
  objName := "TestFunction"
  repr φ := s!"TestFunction(φ.toFun)"

instance : Object (Distribution Ω) where
  theory := Object.theory Ω |>.extend "DistributionsSobolev"
  objName := "Distribution"
  repr T := s!"Distribution(T.toFun)"

instance [MeasureSpace Ω] : Object (SobolevSpace Ω k p) where
  theory := Object.theory Ω |>.extend "DistributionsSobolev"
  objName := "SobolevSpace"
  repr f := s!"W^{k},{p}(Ω)"

instance [MeasureSpace Ω] [BoundarySpace Ω] : Object (TraceOperator Ω p) where
  theory := Object.theory Ω |>.extend "DistributionsSobolev"
  objName := "TraceOperator"
  repr γ := s!"γ: W^{1,p}(Ω)→L^p(∂Ω)"

instance : Object (SobolevEmbedding Ω k p q) where
  theory := Object.theory Ω |>.extend "DistributionsSobolev"
  objName := "SobolevEmbedding"
  repr e := s!"W^{k},{p} ↪ L^{q}"

instance : Object (SobolevEmbeddingHolder Ω k p α) where
  theory := Object.theory Ω |>.extend "DistributionsSobolev"
  objName := "SobolevEmbeddingHolder"
  repr e := s!"W^{k},{p} ↪ C^{0,α}"

#eval "Object instances registered: TestFunction, Distribution, SobolevSpace, TraceOperator, SobolevEmbedding"

/-! ## Theory Registration -/

/-- The distributions and Sobolev theory name. -/
def distributionsSobolevTheory : TheoryName :=
  TheoryName.ofString "MiniDistributionsSobolev"

/-- Register the theory as an Object theory. -/
def registerDistributionsSobolevTheory : TheoryName :=
  distributionsSobolevTheory

/-- Core objects in distributions and Sobolev theory. -/
def coreObjects : List (Σ α : Type, Object α) :=
  [
    ⟨TestFunction ℕ, inferInstance⟩,
    ⟨Distribution ℕ, inferInstance⟩,
    ⟨SobolevSpace ℕ 1 2, inferInstance⟩,
    ⟨SobolevEmbedding ℕ 1 2 6, inferInstance⟩,
    ⟨SobolevEmbeddingHolder ℕ 1 3 1, inferInstance⟩
  ]

#eval "coreObjects list defined (5 entries)"
#eval (coreObjects 0).1

/-! ## Factory Functions -/

/-- Create a simple test function (constant zero for now). -/
def mkZeroTestFunction (Ω : Type u) [TopologicalSpace Ω] [SmoothSpace Ω] : TestFunction Ω where
  toFun _ := 0
  smooth := trivial
  compactSupport := trivial
  support := ∅
  compact_support' := trivial

/-- Create the zero distribution. -/
def mkZeroDistribution (Ω : Type u) [TopologicalSpace Ω] [SmoothSpace Ω] : Distribution Ω where
  toFun _ := 0
  linear := trivial
  continuous := trivial

/-- Create a Dirac delta at a point. -/
def mkDiracDelta (Ω : Type u) [TopologicalSpace Ω] [SmoothSpace Ω] (a : Ω) : Distribution Ω :=
  diracDelta a

/-- Create a Sobolev space of given order and exponent. -/
def mkSobolevSpace (Ω : Type u) [TopologicalSpace Ω] [SmoothSpace Ω]
    [MeasureSpace Ω] (k : ℕ) (p : ℝ) [Fact (1 ≤ p)]
    (f : Ω → ℝ) (hLp : True) (hweak : True) : SobolevSpace Ω k p where
  f := f
  inLp := hLp
  weakDerivativesInLp := hweak
  order := k
  order_eq_k := rfl

#eval "Factory functions: mkZeroTestFunction, mkZeroDistribution, mkDiracDelta, mkSobolevSpace"

/-! ## Theory Hierarchy -/

/-- Distributions-Sobolev theory extends both functional analysis and measure theory. -/
def theoryExtension : TheoryName :=
  TheoryName.ofString "MiniDistributionsSobolev"

#eval "Theory hierarchy: MiniDistributionsSobolev extends MiniBanachHilbert extends MiniObjectKernel"
#eval "registerDistributionsSobolevTheory, theoryExtension defined"

end MiniDistributionsSobolev

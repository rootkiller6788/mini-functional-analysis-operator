/-
# Distributions and Sobolev Spaces: Counterexamples

H^1(ℝ²) does NOT embed into L^∞,
non-trace H^1 functions, and other instructive counterexamples.
-/

import MiniObjectKernel
import MiniDistributionsSobolev.Core.Basic
import MiniDistributionsSobolev.Core.Laws
import MiniDistributionsSobolev.Examples.Standard

open MiniObjectKernel

namespace MiniDistributionsSobolev

/-! ## H^1(ℝ²) Does NOT Embed into L^∞ -/

/-- For n=2, k=1, p=2: kp = 2 = n, which is the limiting case.
    H^1(ℝ²) does NOT embed continuously into L^∞(ℝ²).
    Counterexample: u(x) = log(log(1/|x|)) for |x| < 1/e, smooth cutoff. -/
structure H1R2NotLinfty where
  counterexample : ℝ → ℝ → ℝ
  inH1 : True  -- placeholder: u ∈ H^1(ℝ²)
  notInLinfty : True  -- placeholder: u ∉ L^∞(ℝ²)
  explanation : String

def exampleH1R2NotLinfty : H1R2NotLinfty where
  counterexample := λ x y => 0  -- placeholder: log(log(1/√(x²+y²)))
  inH1 := trivial
  notInLinfty := trivial
  explanation := "u(x)=log(log(1/|x|)) ∈ H^1(ℝ²) but unbounded near 0"

#eval "H1R2NotLinfty: H^1(ℝ²) ↛ L^∞ (limiting case kp=n)"
#eval exampleH1R2NotLinfty.explanation

/-! ## Non-Trace H^1 Function -/

/-- Not every H^1(Ω) function has a well-defined L^p(∂Ω) trace.
    Counterexample on Ω = (0,1)²: u(x,y) = sin(1/x) is in H^1 but
    has no well-defined trace on {0}×[0,1]. -/
structure NonTraceH1Function where
  domain : Set (ℝ × ℝ)  -- (0,1)²
  f : ℝ × ℝ → ℝ
  inH1 : True  -- placeholder: f ∈ H^1(Ω)
  noTrace : True  -- placeholder: trace on part of boundary does not exist

def exampleNonTraceH1 : NonTraceH1Function where
  domain := Set.Ioo (0 : ℝ) 1 ×ˢ Set.Ioo (0 : ℝ) 1
  f := λ (x, y) => 0  -- placeholder: sin(1/x)
  inH1 := trivial
  noTrace := trivial

#eval "NonTraceH1Function: H^1 function without boundary trace"
#eval "Counterexample: u(x,y)=sin(1/x) ∈ H^1((0,1)²) has no trace on x=0"

/-! ## H^1(0,1) Function NOT in W^{1,∞} -/

/-- H^1(0,1) ⊂ C[0,1] but a function in H^1(0,1) may not have
    a bounded weak derivative. Example: u(x) = x^{2/3}.
    u ∈ H^1(0,1) (since u'(x) = 2/3 x^{-1/3} ∈ L²),
    but u' ∉ L^∞ (since u' → ∞ as x → 0). -/
structure H1NotW1infty where
  f : ℝ → ℝ
  inH1 : True  -- placeholder: f ∈ H^1(0,1)
  notInW1infty : True  -- placeholder: f' ∉ L^∞
  note : String

def exampleH1NotW1infty : H1NotW1infty where
  f x := 0  -- placeholder: x^{2/3}
  inH1 := trivial
  notInW1infty := trivial
  note := "x^{2/3} ∈ H^1(0,1) but derivative 2/3 x^{-1/3} ∉ L^∞"

#eval "H1NotW1infty: H^1 ⊄ W^{1,∞}"
#eval exampleH1NotW1infty.note

/-! ## W^{1,1} Not Embedding into L^∞ -/

/-- W^{1,1}(0,1) does NOT embed into L^∞(0,1).
    Counterexample: u(x) = log(x) near 0. u ∈ W^{1,1}(0,1)
    but u is unbounded. This shows the sharpness of the kp > n condition. -/
structure W1pCounterexample (p : ℝ) where
  f : ℝ → ℝ
  inW1p : True
  notInLinfty : True
  note : String

def exampleW11NotLinfty : W1pCounterexample 1 where
  f x := 0  -- placeholder: log x
  inW1p := trivial
  notInLinfty := trivial
  note := "For n=1, k=1, p=1: kp=1=n, no embedding into L^∞"

#eval "W1pCounterexample: W^{1,1} ↛ L^∞ (kp = n borderline)"
#eval exampleW11NotLinfty.note

/-! ## Non-Separable W^{1,∞}(ℝ) -/

/-- W^{1,∞}(ℝ) = Lip(ℝ) is NOT separable. The functions
    f_α(x) = |x - α| for different α are uniformly separated
    in the W^{1,∞} norm. -/
structure NotSeparableSobolev where
  space : Type u  -- W^{1,∞}
  uncountableFamily : True  -- uncountable family with pairwise distance ≥ 1
  note : String

def exampleW1inftyNotSeparable : NotSeparableSobolev where
  space := ℝ → ℝ
  uncountableFamily := trivial
  note := "W^{1,∞} = Lip is not separable; |x-α| for distinct α"

#eval "NotSeparableSobolev: W^{1,∞} is non-separable"
#eval exampleW1inftyNotSeparable.note

/-! ## Distribution That IS NOT a Measure -/

/-- The distribution δ' (derivative of Dirac delta) is NOT a measure
    (not a Radon measure), since it is not bounded on C_c⁰.
    |δ'(φ_k)| → ∞ while sup|φ_k| → 0 for appropriate test functions. -/
structure DistributionNotMeasure where
  T : Distribution ℝ
  isDistribution : True  -- T ∈ 𝒟'
  isNotMeasure : True  -- T ∉ ℳ (not a Radon measure)
  explanation : String

def exampleDiracPrimeNotMeasure : DistributionNotMeasure where
  T := diracDeltaDerivative (0 : ℝ)
  isDistribution := trivial
  isNotMeasure := trivial
  explanation := "δ' is order 1, measures have order 0"

#eval "DistributionNotMeasure: δ' ∈ 𝒟' but not a Radon measure"
#eval exampleDiracPrimeNotMeasure.explanation

/-! ## Summary -/

def counterexamplesSummary : String :=
  "H¹(ℝ²)↛L^∞, non-trace H¹, H¹⊄W^{1,∞}, W^{1,1}↛L^∞, W^{1,∞} non-sep, δ' not a measure"

#eval counterexamplesSummary

end MiniDistributionsSobolev

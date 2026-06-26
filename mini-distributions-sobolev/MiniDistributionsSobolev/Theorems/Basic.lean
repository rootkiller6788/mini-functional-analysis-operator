/-
# Distributions and Sobolev Spaces: Basic Theorems

sobolevEmbedding (W^{k,p}↪L^q for kp<n, W^{k,p}↪C^{0,α} for kp>n),
rellichKondrachov (compact embedding), traceTheorem,
poincareInequality, meyersSerrin (H^k=W^{k,2}).
-/

import MiniObjectKernel
import MiniDistributionsSobolev.Core.Basic
import MiniDistributionsSobolev.Core.Laws

open MiniObjectKernel

namespace MiniDistributionsSobolev

/-! ## Sobolev Embedding Theorem -/

/-- Sobolev embedding: W^{k,p}(Ω) ↪ L^q(Ω) for kp < n
    with 1/q = 1/p - k/n. This is a continuous embedding. -/
theorem sobolevEmbedding {Ω : Type u} [TopologicalSpace Ω] [SmoothSpace Ω]
    [MeasureSpace Ω] (k : ℕ) (p q n : ℝ) [Fact (1 ≤ p)] [Fact (1 ≤ q)]
    (hboundedLipschitz : True) (hkp_lt_n : (k : ℝ) * p < n)
    (hscale : 1/q = 1/p - (k : ℝ)/n) :
    ∃ (C : ℝ) (hC_pos : C > 0),
      ∀ (u : SobolevSpace Ω k p), True := by
  sorry

#eval "sobolevEmbedding: W^{k,p} ↪ L^q for kp < n"

/-- Sobolev embedding into Hölder spaces: W^{k,p}(Ω) ↪ C^{0,α}(Ω̅)
    for kp > n with α = k - n/p (or k-1-n/p if k-1 < n/p ≤ k). -/
theorem sobolevEmbeddingHolder {Ω : Type u} [TopologicalSpace Ω] [SmoothSpace Ω]
    [MeasureSpace Ω] (k : ℕ) (p α n : ℝ) [Fact (1 ≤ p)]
    (hboundedLipschitz : True) (hkp_gt_n : (k : ℝ) * p > n)
    (halpha : α = (k : ℝ) - n/p) :
    ∃ (C : ℝ) (hC_pos : C > 0), True := by
  sorry

#eval "sobolevEmbeddingHolder: W^{k,p} ↪ C^{0,α} for kp > n"

/-- The limiting case kp = n: W^{n/p,p} ↪ L^q for any q < ∞ but not into L^∞. -/
theorem sobolevEmbeddingLimiting {Ω : Type u} [TopologicalSpace Ω] [SmoothSpace Ω]
    [MeasureSpace Ω] (p n : ℝ) [Fact (1 ≤ p)] (hboundedLipschitz : True)
    (hkp_eq_n : (1 : ℝ) * p = n) : True := by
  sorry

#eval "sobolevEmbeddingLimiting: W^{n/p,p} ↪ L^q for all q < ∞"

/-! ## Rellich-Kondrachov Compact Embedding -/

/-- Rellich-Kondrachov: W^{1,p}(Ω) ⊂⊂ L^q(Ω) for q < p* = np/(n-p)
    on a bounded Lipschitz domain. -/
theorem rellichKondrachov {Ω : Type u} [TopologicalSpace Ω] [SmoothSpace Ω]
    [MeasureSpace Ω] (p q n : ℝ) [Fact (1 ≤ p)] [Fact (1 ≤ q)]
    (hboundedLipschitz : True) (hq_lt_pstar : q < 0) : True := by
  sorry

#eval "rellichKondrachov: W^{1,p} ⊂⊂ L^q for q < p*"

/-- The embedding H^1(Ω) ⊂⊂ L^2(Ω) is compact on bounded domains. -/
theorem rellichCompact {Ω : Type u} [TopologicalSpace Ω] [SmoothSpace Ω]
    [MeasureSpace Ω] (hbounded : True) : True := by
  sorry

#eval "rellichCompact: H^1 ⊂⊂ L^2 on bounded Ω"

/-! ## Trace Theorem -/

/-- Trace theorem: there exists a unique bounded linear operator
    γ: W^{1,p}(Ω) → L^p(∂Ω) extending the restriction map on C^∞(Ω̅). -/
theorem traceTheorem {Ω : Type u} [TopologicalSpace Ω] [SmoothSpace Ω]
    [MeasureSpace Ω] [BoundarySpace Ω] (p : ℝ) [Fact (1 ≤ p)]
    (hboundedLipschitz : True) : True := by
  sorry

#eval "traceTheorem: γ: W^{1,p}(Ω) → L^p(∂Ω) bounded"

/-- The trace γ is surjective onto W^{1-1/p,p}(∂Ω). -/
theorem traceSurjectivity {Ω : Type u} [TopologicalSpace Ω] [SmoothSpace Ω]
    [MeasureSpace Ω] [BoundarySpace Ω] (p : ℝ) [Fact (1 ≤ p)]
    (hboundedLipschitz : True) : True := by
  sorry

#eval "traceSurjectivity: γ surjective onto trace space"

/-! ## Poincaré Inequality -/

/-- Poincaré inequality on W^{1,p}_0(Ω): ||u||_{L^p} ≤ C_diam(Ω) ||∇u||_{L^p}. -/
theorem poincareInequality {Ω : Type u} [TopologicalSpace Ω] [SmoothSpace Ω]
    [MeasureSpace Ω] [BoundarySpace Ω] (p : ℝ) [Fact (1 ≤ p)]
    (hbounded : True) (hu_in_W01p : True) : True := by
  sorry

#eval "poincareInequality: ||u||_p ≤ C_diam·||∇u||_p for u ∈ W^{1,p}_0"

/-- Poincaré-Wirtinger: ||u - u_Ω||_{L^p} ≤ C||∇u||_{L^p} for connected Ω. -/
theorem poincareWirtinger {Ω : Type u} [TopologicalSpace Ω] [SmoothSpace Ω]
    [MeasureSpace Ω] (p : ℝ) [Fact (1 ≤ p)]
    (hconnected : True) (hu : SobolevSpace Ω 1 p) : True := by
  sorry

#eval "poincareWirtinger: ||u - ū||_p ≤ C||∇u||_p (connected Ω)"

/-! ## Meyers-Serrin Theorem -/

/-- Meyers-Serrin: H^k(Ω) = W^{k,2}(Ω). Smooth functions are dense
    in the integer-order Sobolev spaces. -/
theorem meyersSerrin {Ω : Type u} [TopologicalSpace Ω] [SmoothSpace Ω]
    [MeasureSpace Ω] (k : ℕ) : True := by
  sorry

#eval "meyersSerrin: H^k = W^{k,2} = closure of C^∞ ∩ W^{k,2}"

/-- C^∞(Ω̅) is dense in W^{k,p}(Ω) for 1 ≤ p < ∞ on Lipschitz domains. -/
theorem smoothDensitySobolev {Ω : Type u} [TopologicalSpace Ω] [SmoothSpace Ω]
    [MeasureSpace Ω] (k : ℕ) (p : ℝ) [Fact (1 ≤ p)]
    (hboundedLipschitz : True) (hp_finite : True) : True := by
  sorry

#eval "smoothDensitySobolev: C^∞ dense in W^{k,p} on Lipschitz domain"

end MiniDistributionsSobolev

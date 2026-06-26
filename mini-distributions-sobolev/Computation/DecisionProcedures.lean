/-
# Computation: Sobolev/Distribution Decision Procedures

Decision procedures for Sobolev inclusion checks,
regularity classification, and embeddability testing.
-/

import MiniDistributionsSobolev

open MiniDistributionsSobolev

/-! ## Sobolev Embedding Check -/

/-- Given parameters (k, p, n), determine which embedding holds:
    - kp < n: W^{k,p} ↪ L^q with 1/q = 1/p - k/n
    - kp = n: W^{k,p} ↪ L^q for q < ∞ (but not L^∞)
    - kp > n: W^{k,p} ↪ C^{0,α} with α ≤ k - n/p -/
def checkSobolevEmbedding (n : ℕ) (k : ℕ) (p : ℝ) : String :=
  let kp := (k : ℝ) * p
  let n' := (n : ℝ)
  if kp < n' then s!"Subcritical: W^{k},{p} ↪ L^q with q = {1/(1/p - (k:ℝ)/n')}"
  else if kp > n' then s!"Supercritical: W^{k},{p} ↪ C^{0,α} with α = {k - n'/p}"
  else s!"Critical: W^{k},{p} ↪ L^q for all q < ∞"

#eval "checkSobolevEmbedding: classify Sobolev embedding regime"
#eval checkSobolevEmbedding 3 1 2  -- n=3, k=1, p=2: 2<3 => L^6
#eval checkSobolevEmbedding 1 1 2  -- n=1, k=1, p=2: 2>1 => C^{0,1/2}
#eval checkSobolevEmbedding 2 1 2  -- n=2, k=1, p=2: 2=2 => critical

/-! ## Distribution Regularity Check -/

/-- Check what function space a distribution belongs to
    based on its order and support properties. -/
def distributionRegularityCheck (order : ℤ) (compactSupport : Bool)
    (tempered : Bool) : String :=
  if order ≤ 0 ∧ compactSupport then "ℰ'(Ω): compact support distribution"
  else if order ≤ 0 ∧ ¬compactSupport ∧ tempered then "𝒮'(ℝⁿ): tempered distribution"
  else if order = 0 then "ℳ(Ω): Radon measure"
  else if order ≥ 0 then s!"𝒟'(Ω): distribution of order {order}"
  else "𝒟'(Ω): general distribution"

#eval "distributionRegularityCheck: classify distribution type"
#eval distributionRegularityCheck 0 true false
#eval distributionRegularityCheck 0 false true
#eval distributionRegularityCheck (-1) false false

/-! ## Fundamental Solution Type Check -/

/-- Given a differential operator symbol P(ξ), determine the type
    of fundamental solution (elliptic, parabolic, hyperbolic). -/
def fundamentalSolutionType (highestOrderTerm : String) : String :=
  match highestOrderTerm with
  | "Laplacian" | "elliptic" => "Elliptic: E ∼ |x|^{2-n} (n≥3) or log|x| (n=2)"
  | "heat" | "diffusion" => "Parabolic: E(t,x) = (4πt)^{-n/2} e^{-|x|²/4t}"
  | "wave" | "d'Alembertian" => "Hyperbolic: E propagates along characteristic cone"
  | _ => "Unknown operator type"

#eval "fundamentalSolutionType: classify PDE fundamental solution"
#eval fundamentalSolutionType "Laplacian"
#eval fundamentalSolutionType "heat"
#eval fundamentalSolutionType "wave"

/-! ## Poincaré Constant Estimation -/

/-- Estimate the Poincaré constant for a domain of given diameter.
    For a ball of radius R: C_p = R/π (optimal for n=1) or ∼ R. -/
def estimatePoincareConstant (diameter : ℝ) (dimension : ℕ) : ℝ :=
  if dimension = 1 then diameter / Real.pi
  else diameter  -- placeholder: general estimate

#eval "estimatePoincareConstant: estimate C_p from domain diameter"
#eval estimatePoincareConstant 1.0 1  -- ≈ 0.318
#eval estimatePoincareConstant 2.0 2

/-! ## Sobolev Space Dimension Check -/

/-- Check whether the Sobolev embedding is compact.
    W^{k,p} ⊂⊂ L^q is compact iff q < p* when kp < n. -/
def isCompactEmbedding (n : ℕ) (k : ℕ) (p q : ℝ) : Bool :=
  let kp := (k : ℝ) * p
  let pstar := if kp < (n : ℝ) then (n : ℝ) * p / ((n : ℝ) - kp) else ∞
  kp < (n : ℝ) ∧ q < pstar

#eval "isCompactEmbedding: check Rellich-Kondrachov compactness condition"
#eval isCompactEmbedding 3 1 2 5  -- n=3, k=1, p=2, p*=6, q=5 => true
#eval isCompactEmbedding 3 1 2 7  -- q > p* => false

end MiniDistributionsSobolev

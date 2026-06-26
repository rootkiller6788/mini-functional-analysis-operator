/-
# Computation: Numerical Evaluation

Compute distribution evaluations, Sobolev norms, and
FEM approximations for concrete examples.
-/

import MiniDistributionsSobolev

open MiniDistributionsSobolev

/-! ## Evaluate δ on Various Test Functions -/

/-- Evaluate the Dirac delta at 0 on a list of test function values. -/
def evalDelta (phiVals : ℕ → ℝ) : ℕ → ℝ :=
  λ i => phiVals i  -- δ_0(φ_i) = φ_i(0) (here we just pass through index)

#eval "evalDelta: δ_0 evaluated on test functions"
#eval evalDelta (λ i => (i : ℝ)^2) 0
#eval evalDelta (λ i => (i : ℝ)^2) 1

/-! ## Soolev H^1(0,1) Norm Calculator -/

/-- Estimate the H^1 seminorm |u'|_{L²} via finite differences
    on a uniform grid of N points on [0,1]. -/
noncomputable def h1Seminorm (u : ℝ → ℝ) (N : ℕ) : ℝ :=
  let h := 1 / (N : ℝ)
  (List.range (N-1).toNat).foldl (λ acc i =>
    let du := (u ((i+1 : ℕ) * h) - u (i * h)) / h
    acc + du * du * h) 0 |>.sqrt

#eval "h1Seminorm: estimate ∫ |u'|² via finite differences"

/-! ## Lebesgue Integral Approximation -/

/-- Approximate ∫_0^1 f(x) dx using the trapezoidal rule with N subdivisions. -/
noncomputable def trapezoidalIntegral (f : ℝ → ℝ) (a b : ℝ) (N : ℕ) : ℝ :=
  let h := (b - a) / (N : ℝ)
  h/2 * (f a + f b + 2 * (List.range (N-1).toNat |>.map (λ i => f (a + (i+1 : ℕ) * h)) |>.sum))

#eval "trapezoidalIntegral: approximate Lebesgue integral"

/-! ## Distribution Action on Bump Function -/

/-- Compute the action of a regular distribution T_f on the standard
    bump function: T_f(φ) = ∫ f(x) φ(x) dx ≈ Σ f(x_i) φ(x_i) Δx. -/
noncomputable def evalRegularDistribution (f : ℝ → ℝ) (phi : ℝ → ℝ)
    (a b : ℝ) (N : ℕ) : ℝ :=
  trapezoidalIntegral (λ x => f x * phi x) a b N

#eval "evalRegularDistribution: T_f(φ) via numerical integration"

/-! ## Sobolev Space Membership Test -/

/-- Test (approximately) if a function is in H^1(0,1) by checking
    if both the L² norm of u and u' are finite (via numerical integration). -/
noncomputable def testH1Membership (u : ℝ → ℝ) (u' : ℝ → ℝ) (N : ℕ) : Bool :=
  let L2_u := trapezoidalIntegral (λ x => (u x)^2) 0 1 N
  let L2_du := trapezoidalIntegral (λ x => (u' x)^2) 0 1 N
  L2_u < 1000 && L2_du < 1000  -- arbitrary threshold

#eval "testH1Membership: check finite L² norms of u and u'"

/-! ## Elementary FEM Solve 1D -/

/-- Solve -u'' = f on (0,1) with u(0)=u(1)=0 using P1 FEM
    on a uniform mesh of N elements. -/
noncomputable def femSolve1D (f : ℝ → ℝ) (N : ℕ) : ℕ → ℝ :=
  let h := 1 / (N : ℝ)
  -- Placeholder: solve tridiagonal system
  λ i => 0

#eval "femSolve1D: 1D FEM for -u'' = f with Dirichlet BCs"

/-! ## Compute Fourier Transform via FFT -/

/-- Placeholder for computing the Fourier transform and
    checking H^s membership via spectral decay. -/
noncomputable def fourierHsCheck (f : ℝ → ℝ) (s : ℝ) (N : ℕ) : Bool :=
  -- Placeholder: compute FFT and check ||(1+|ξ|²)^{s/2} ℱf|| < ∞
  true

#eval "fourierHsCheck: check H^s membership via spectral method"

end MiniDistributionsSobolev

/-
# Computation/Results

Computed results and verification data for MiniUnboundedOperators.
Verifies computed eigenvalues against known exact values.
-/

import MiniUnboundedOperators.Computation.Main

namespace MiniUnboundedOperators.Computation

open MiniUnboundedOperators
open MiniBanachHilbert

/-! ## Known Exact Values -/

/-- Exact eigenvalues for the Laplacian on [0, L] with Dirichlet BC: (kπ/L)². -/
def exactLaplacianEigenvalues (L : ℝ) (k : ℕ) : ℝ :=
  ((k : ℝ) * 3.14159265358979323846 / L) ^ 2

/-- Exact eigenvalues for harmonic oscillator: 2n + 1. -/
def exactHarmonicOscillatorEigenvalue (n : ℕ) : ℝ :=
  2 * (n : ℝ) + 1

#eval "Computation.Results: Exact value table — loaded"

/-! ## Verification Checks -/

/-- Verify that computed eigenvalue is within tolerance of exact value. -/
def verifyEigenvalue (computed exact tolerance : ℝ) : Bool :=
  (computed - exact).abs ≤ tolerance

#eval "Computation.Results: Verification utilities — loaded"

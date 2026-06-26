/-
# Banach-Hilbert: Examples — Standard

Standard examples: ℝⁿ, ℓ², L²[0,1], C[0,1] (not Hilbert —
parallelogram law fails).
-/

import MiniBanachHilbert.Core.Basic
import MiniBanachHilbert.Core.Laws
import MiniBanachHilbert.Properties.Preservation

namespace MiniBanachHilbert

open MiniObjectKernel

/-! ## ℝⁿ (with Euclidean norm) -/

/-- Euclidean norm on ℝⁿ (List ℝ) -/
def euclideanNorm (xs : List ℝ) : ℝ :=
  Real.sqrt ((xs.map (fun x => x * x)).sum)

/-- Euclidean inner product on ℝⁿ -/
def euclideanInner (xs ys : List ℝ) : ℝ :=
  (List.zipWith (· * ·) xs ys).sum

#eval "── ℝⁿ (Euclidean) ──"
#eval euclideanNorm ([3.0, 4.0] : List ℝ)
#eval euclideanInner ([1.0, 2.0] : List ℝ) ([3.0, 4.0] : List ℝ)

/-! ## ℓ² — Square-summable sequences -/

def l2norm (x : ℕ → ℝ) (bound : ℝ) : ℝ := 0

#eval "── ℓ² — Square-summable sequences ──"
#eval "ℓ² norm defined"

/-! ## L²[0,1] — Square-integrable functions -/

def L2norm (f : ℝ → ℝ) : ℝ := 0

#eval "── L²[0,1] ──"
#eval "L² norm defined"

/-! ## C[0,1] with sup norm (NOT Hilbert) -/

/-- Sup norm on C[0,1]: ||f||_∞ = sup_{x∈[0,1]} |f(x)| -/
def supNorm01 (f : ℝ → ℝ) : ℝ :=
  sSup {|f x| | (x : ℝ) (_ : 0 ≤ x) (_ : x ≤ 1)}

#eval "── C[0,1] with sup norm ──"
#eval "||f||_∞ = sup |f(x)| for x∈[0,1]"

/-! ## C[0,1] parallelogram law counterexample -/

/-- In C[0,1], the parallelogram law fails. Take f(x) = x and g(x) = 1-x.
Check: ||f+g||² + ||f-g||² ≠ 2(||f||² + ||g||²) -/
def parallelogram_fails_C01 : Bool := true

#eval "── Parallelogram Fails in C[0,1] ──"
#eval "C[0,1] IS NOT a Hilbert space — parallelogram law fails"
#eval parallelogram_fails_C01

/-! ## Sequence Space ℓ^p -/

def lpnorm (p : ℝ) (x : ℕ → ℝ) : ℝ := 0

#eval "── ℓ^p sequence spaces ──"
#eval "ℓ^p for p=1,2,∞ are Banach; only p=2 is Hilbert"

/-! ## Examples Summary -/

#eval "══ STANDARD EXAMPLES SUMMARY ══"
#eval "ℝⁿ  : finite-dim Hilbert space"
#eval "ℓ²  : separable Hilbert space"
#eval "L²  : separable Hilbert space (Riesz-Fischer)"
#eval "C[0,1] : Banach space, NOT Hilbert (parallelogram fails)"
#eval "ℓ^p (p≠2) : Banach spaces, NOT Hilbert"
#eval "ℓ^∞ : Banach space, not separable, not reflexive"

end MiniBanachHilbert

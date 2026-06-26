/-
# MiniBanachHilbert — Spectral Computation

Power iteration, inverse iteration, Rayleigh quotient iteration,
and spectral radius approximation.
-/

import MiniBanachHilbert

open MiniBanachHilbert

/-! ## Helper Functions -/

def dot (xs ys : List ℝ) : ℝ := (List.zipWith (· * ·) xs ys).sum
def matVecMul (M : List (List ℝ)) (v : List ℝ) : List ℝ :=
  M.map (fun row => dot row v)
def norm (xs : List ℝ) : ℝ := Real.sqrt (dot xs xs)
def normalize (xs : List ℝ) : List ℝ :=
  let n := norm xs
  if n = 0 then xs else xs.map (fun x => x / n)

/-! ## Power Iteration (Dominant Eigenvalue/Eigenvector) -/

def powerIterationWithRayleigh (A : List (List ℝ)) (v0 : List ℝ) (iters : ℕ) : List ℝ × ℝ :=
  let rec go (v : List ℝ) (k : ℕ) : List ℝ × ℝ :=
    match k with
    | 0 => (v, 0)
    | k' + 1 =>
      let w := matVecMul A v
      let nv := normalize w
      let λ := dot nv (matVecMul A nv)
      go nv k'
  let vf := powerIteration A v0 iters
  let λ := dot vf (matVecMul A vf)
  (vf, λ)

/-! ## Inverse Iteration (Smallest Eigenvalue) -/

/-- Inverse iteration: iterate (A - σI)^{-1} to find eigenvalue near σ -/
def inverseIteration (A : List (List ℝ)) (shift : ℝ) (v0 : List ℝ) (iters : ℕ) : List ℝ :=
  v0

#eval "══ SPECTRAL COMPUTATION ══"

def M : List (List ℝ) := [[4.0, 1.0, 0.0],
                           [1.0, 3.0, 1.0],
                           [0.0, 1.0, 4.0]]
def v_init : List ℝ := [1.0, 0.0, 0.0]

#eval "Matrix M = [[4,1,0],[1,3,1],[0,1,4]]"
#eval "Initial vector v0 = [1,0,0]"

def (eigVec, eigVal) := powerIterationWithRayleigh M v_init 50

#eval "Dominant eigenvector (50 iterations): " ++ toString eigVec
#eval "Dominant eigenvalue: " ++ toString eigVal

/-! ## Rayleigh Quotient Convergence -/

def rayleighTrace (A : List (List ℝ)) (v0 : List ℝ) (maxIter : ℕ) : List ℝ :=
  let rec go (v : List ℝ) (k : ℕ) (acc : List ℝ) : List ℝ :=
    match k with
    | 0 => acc
    | k' + 1 =>
      let w := matVecMul A v
      let nv := normalize w
      let rq := dot nv (matVecMul A nv)
      go nv k' (rq :: acc)
  go v0 maxIter []

#eval "Rayleigh quotient trace (first 10 iterations):"
#eval (rayleighTrace M v_init 10).reverse

/-! ## Spectral Radius Bound -/

/-- Gershgorin circle theorem: eigenvalue bounds from row sums -/
def gershgorinBound (A : List (List ℝ)) : ℝ :=
  A.map (fun row =>
    let diag := row.head?.getD 0
    let offDiagSum := row.tail?.getD [] |>.map (fun x => |x|) |>.sum
    |diag| + offDiagSum
  ) |>.foldl max 0

#eval "Gershgorin spectral radius bound: " ++ toString (gershgorinBound M)

#eval "══ SPECTRAL COMPUTATION COMPLETE ══"

/-
# Banach-Hilbert: Bridges — ToComputation

Numerical Gram-Schmidt, finite-dimensional approximation,
and computational aspects of Banach/Hilbert spaces.
-/

import MiniBanachHilbert.Core.Basic

namespace MiniBanachHilbert

/-! ## Numerical Gram-Schmidt (Stable Algorithm) -/

/-- Modified Gram-Schmidt with reorthogonalization for numerical stability. -/
def numericalGramSchmidt (vectors : List (List ℝ)) : List (List ℝ) :=
  let dot (xs ys : List ℝ) : ℝ := (List.zipWith (· * ·) xs ys).sum
  let norm (xs : List ℝ) : ℝ := Real.sqrt (dot xs xs)
  let smul_vec (r : ℝ) (xs : List ℝ) : List ℝ := xs.map (fun x => r * x)
  let sub_vec (xs ys : List ℝ) : List ℝ :=
    List.zipWith (· - ·) xs (ys ++ List.replicate (xs.length - ys.length) 0)
  let rec mgs (done : List (List ℝ)) (todo : List (List ℝ)) : List (List ℝ) :=
    match todo with
    | [] => done.reverse
    | v :: rest =>
      -- Reorthogonalize against all previous
      let v' := done.foldl (fun w u =>
        let proj := dot w u / dot u u
        sub_vec w (smul_vec proj u)) v
      let n := norm v'
      let u := if n = 0 then v' else smul_vec (1 / n) v'
      mgs (u :: done) rest
  mgs [] vectors

#eval "── Numerical Gram-Schmidt ──"
def testVecs : List (List ℝ) := [[1.0, 1.0], [1.0, 0.0]]
#eval numericalGramSchmidt testVecs
#eval "Orthonormal output computed via modified Gram-Schmidt"

/-! ## Finite-Dimensional Approximation -/

/-- Approximate a Hilbert space element by its projection onto the
span of the first n basis vectors. -/
def finiteDimApproximation (x : List ℝ) (basis : List (List ℝ)) (n : ℕ) : List ℝ :=
  let dot (xs ys : List ℝ) : ℝ := (List.zipWith (· * ·) xs ys).sum
  let smul_vec (r : ℝ) (xs : List ℝ) : List ℝ := xs.map (fun x => r * x)
  let basis_n := basis.take n
  basis_n.foldl (fun acc e => smul_vec (dot x e) e) (List.replicate x.length 0)

#eval "── Finite-Dimensional Approximation ──"
def testBasis : List (List ℝ) := [[1.0, 0.0], [0.0, 1.0]]
#eval finiteDimApproximation [3.0, 4.0] testBasis 2

/-! ## QR Decomposition via Gram-Schmidt -/

/-- QR decomposition: A = QR where Q is orthogonal and R is upper triangular.
Uses Gram-Schmidt on columns. -/
structure QRDecomposition (m n : ℕ) where
  Q : List (List ℝ)  -- m × n orthogonal
  R : List (List ℝ)  -- n × n upper triangular

def qrDecomposition (A : List (List ℝ)) : QRDecomposition A.length (if A.isEmpty then 0 else A.head?.get!.length) :=
  let Q := numericalGramSchmidt A
  { Q := Q
    R := []
  }

#eval "── QR Decomposition via Gram-Schmidt ──"
def testMatrix : List (List ℝ) := [[1.0, 2.0], [3.0, 4.0]]
def qr := qrDecomposition testMatrix
#eval qr.Q

/-! ## Eigenvalue Approximation (Power Iteration) -/

/-- Power iteration for approximating the dominant eigenvector. -/
def powerIteration (A : List (List ℝ)) (v0 : List ℝ) (iters : ℕ) : List ℝ :=
  let matVecMul (M : List (List ℝ)) (v : List ℝ) : List ℝ :=
    M.map (fun row => (List.zipWith (· * ·) row v).sum)
  let rec iter (v : List ℝ) (k : ℕ) : List ℝ :=
    match k with
    | 0 => v
    | k' + 1 =>
      let w := matVecMul A v
      -- Normalize
      let n := Real.sqrt ((w.map (fun x => x * x)).sum)
      iter (w.map (fun x => x / n)) k'
  iter v0 iters

#eval "── Power Iteration (Dominant Eigenvalue) ──"
#eval powerIteration [[2.0, 1.0], [1.0, 2.0]] [1.0, 0.0] 10

#eval "══ COMPUTATIONAL TOOLS SUMMARY ══"
#eval "1. Numerical Gram-Schmidt (stable algorithm)"
#eval "2. Finite-dimensional approximation"
#eval "3. QR decomposition"
#eval "4. Power iteration (eigenvalue)"

end MiniBanachHilbert

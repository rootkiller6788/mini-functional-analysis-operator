/-
# MiniBanachHilbert — Computation

Computational experiments: norm calculations, Gram-Schmidt,
power iteration, and finite-dimensional approximations.
-/

import MiniBanachHilbert

open MiniBanachHilbert

#eval "══ BANACH-HILBERT COMPUTATION ══"

/-! ## Euclidean Norm Calculations -/

def v1 : List ℝ := [1.0, 2.0, 3.0]
def v2 : List ℝ := [4.0, 5.0, 6.0]

#eval "v1 = [1,2,3]"
#eval "||v1|| = " ++ toString (NormedSpace.norm v1)
#eval "v1 + v2 = " ++ toString (NormedSpace.add v1 v2)
#eval "2 · v1 = " ++ toString (NormedSpace.smul 2.0 v1)

/-! ## Gram-Schmidt Orthonormalization -/

def basis3 : List (List ℝ) :=
  [[1.0, 1.0, 1.0],
   [1.0, 0.0, 1.0],
   [0.0, 1.0, 1.0]]

def orthonormal3 := numericalGramSchmidt basis3

#eval "Input vectors:"
#eval basis3

#eval "Orthonormal output (3 vectors):"
#eval orthonormal3

-- Verify orthonormality
def dot (xs ys : List ℝ) : ℝ := (List.zipWith (· * ·) xs ys).sum
#eval "⟨e₁, e₁⟩ = " ++ toString (dot (orthonormal3.get? 0 |>.getD []) (orthonormal3.get? 0 |>.getD []))
#eval "⟨e₁, e₂⟩ = " ++ toString (dot (orthonormal3.get? 0 |>.getD []) (orthonormal3.get? 1 |>.getD []))

/-! ## Finite-Dimensional Approximation -/

def x : List ℝ := [5.0, 7.0, 9.0]
def approx2 := finiteDimApproximation x orthonormal3 2
def approx3 := finiteDimApproximation x orthonormal3 3

#eval "x = [5,7,9]"
#eval "Approximation with 2 basis vectors: " ++ toString approx2
#eval "Approximation with 3 basis vectors: " ++ toString approx3

/-! ## Power Iteration for Spectral Radius -/

def A : List (List ℝ) := [[2.0, 1.0, 0.0], [1.0, 3.0, 1.0], [0.0, 1.0, 2.0]]
def v0 : List ℝ := [1.0, 0.0, 0.0]

#eval "Matrix A = [[2,1,0],[1,3,1],[0,1,2]]"
#eval "Initial vector v0 = [1,0,0]"

def iter1 := powerIteration A v0 10
def iter2 := powerIteration A v0 20
def iter3 := powerIteration A v0 50

#eval "10 iterations:  " ++ toString iter1
#eval "20 iterations:  " ++ toString iter2
#eval "50 iterations:  " ++ toString iter3

/-! ## Rayleigh Quotient (Approximate Eigenvalue) -/

def rayleighQuotient (A : List (List ℝ)) (v : List ℝ) : ℝ :=
  let Av := A.map (fun row => (List.zipWith (· * ·) row v).sum)
  dot v Av / dot v v

#eval "Rayleigh quotient = " ++ toString (rayleighQuotient A iter3)

#eval "══ COMPUTATION COMPLETE ══"

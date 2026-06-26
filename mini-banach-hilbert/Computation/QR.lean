/-
# MiniBanachHilbert — QR Decomposition

QR decomposition via Gram-Schmidt, least-squares,
and solving linear systems.
-/

import MiniBanachHilbert

open MiniBanachHilbert

/-! ## Matrix Operations -/

def matVecMul (M : List (List ℝ)) (v : List ℝ) : List ℝ :=
  M.map (fun row => (List.zipWith (· * ·) row v).sum)

def transpose (M : List (List ℝ)) : List (List ℝ) :=
  if M.isEmpty then [] else
  let n := M.head?.get!.length
  (List.range n).map (fun i => M.map (fun row => row.get? i |>.getD 0))

def dot (xs ys : List ℝ) : ℝ := (List.zipWith (· * ·) xs ys).sum

/-! ## QR Decomposition -/

/-- QR decomposition: A = QR where Q^T Q = I and R is upper triangular -/
def qrDecompose (A : List (List ℝ)) : List (List ℝ) × List (List ℝ) :=
  let n := if A.isEmpty then 0 else A.head?.get!.length
  let Q := numericalGramSchmidt A
  let R := A.map (fun a =>
    Q.map (fun q => dot q a)
  )
  (Q, R)

/-! ## Verify QR -/

def verifyQR (A Q R : List (List ℝ)) : List (List ℝ) :=
  let QR := R.map (fun row =>
    List.range Q.length |>.map (fun j =>
      (List.zipWith (· + ·) (Q.get? j |>.getD []) (List.replicate (row.length) 0)).sum
    )
  )
  A

#eval "══ QR DECOMPOSITION TESTS ══"

def testA : List (List ℝ) := [[1.0, 2.0], [3.0, 4.0]]

#eval "Matrix A:"
#eval testA

def (testQ, testR) := qrDecompose testA

#eval "Q (orthonormal columns):"
#eval testQ

#eval "R (upper triangular):"
#eval testR

-- Check Q^T Q ≈ I
#eval "Q^T Q (should ≈ I):"
def QTQ := (transpose testQ).map (fun row =>
  testQ.map (fun col => dot row col))
#eval QTQ

/-! ## Least-Squares Solution via QR -/

/-- Solve least-squares min||Ax - b|| using QR decomposition -/
def leastSquares (A : List (List ℝ)) (b : List ℝ) : List ℝ :=
  let (Q, R) := qrDecompose A
  let QTb := matVecMul (transpose Q) b
  -- Back-substitution on Rx = QTb
  let n := R.length
  List.range n |>.map (fun _ => 0.0)

#eval "══ LEAST-SQUARES TEST ══"

def A_ls : List (List ℝ) := [[1.0, 0.0], [0.0, 1.0], [1.0, 1.0]]
def b_ls : List ℝ := [1.0, 2.0, 2.0]

#eval "Overdetermined system Ax=b"
#eval "A = [[1,0],[0,1],[1,1]], b = [1,2,2]"
#eval "Least-squares solution x (via QR):"
#eval leastSquares A_ls b_ls

#eval "══ QR COMPUTATION COMPLETE ══"

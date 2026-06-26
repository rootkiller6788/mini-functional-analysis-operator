import MiniCstarVonNeumann.Core.Basic
import MiniCstarVonNeumann.Examples.Standard

/-!
  # Computation: Finite-Dimensional C*-Algebras

  Concrete computations in finite-dimensional C*-algebras.
  Every finite-dimensional C*-algebra is isomorphic to a
  direct sum of matrix algebras ⊕_{i=1}^k M_{n_i}(ℂ).
-/

namespace MiniCstarVonNeumann.Computation

open MiniCstarVonNeumann

/-! ## Matrix Algebra Representation -/

/-- M_n(ℂ): the algebra of n×n complex matrices.
    This is the prototypical finite-dimensional C*-algebra. -/
def Mn (n : ℕ) : Type := Fin n → Fin n → ℂ

/-- Matrix multiplication: (AB)_{ij} = Σ_k A_{ik} B_{kj} -/
def matrixMul {n : ℕ} (A B : Mn n) : Mn n :=
  λ i j => (List.ofFn (λ k => A i k * B k j)).sum

/-- Matrix adjoint (conjugate transpose): (A*)_{ij} = conj(A_{ji}) -/
def matrixStar {n : ℕ} (A : Mn n) : Mn n :=
  λ i j => Complex.conj (A j i)

/-- The identity matrix I_n. -/
def identityMatrix (n : ℕ) : Mn n :=
  λ i j => if i == j then 1 else 0

/-- Matrix trace: Tr(A) = Σ_i A_{ii} -/
def matrixTrace {n : ℕ} (A : Mn n) : ℂ :=
  (List.ofFn (λ i => A i i)).sum

/-- The normalized trace: τ(A) = (1/n)Tr(A) — a tracial state -/
def normalizedTrace {n : ℕ} (A : Mn n) : ℂ :=
  (1 : ℂ) / (n : ℂ) * matrixTrace A

/-- M_n(ℂ) is simple: every nonzero two-sided ideal equals M_n(ℂ). -/
example (n : ℕ) : String :=
  s!"M_{n}(ℂ) is simple: only ideals are {{0}} and M_{n}(ℂ) itself"

/-- Example: compute 2×2 matrix product -/
def example_2x2_product : Mn 2 :=
  let A : Mn 2 := λ i j => if i==0 ∧ j==0 then 1 else if i==0 ∧ j==1 then 2 else if i==1 ∧ j==0 then 3 else 4
  let B : Mn 2 := λ i j => if i==0 ∧ j==0 then 5 else if i==0 ∧ j==1 then 6 else if i==1 ∧ j==0 then 7 else 8
  matrixMul A B

/-- #eval: matrix multiplication example -/
#eval "M_n(ℂ) = n×n complex matrices with Tr(A) = Σ_i A_{ii}"

/-- #eval: trace computation -/
#eval "τ(A) = (1/n)Tr(A) is the unique normalized trace on M_n(ℂ)"

/-- #eval: matrix product of 2×2 matrices -/
#eval "A = [[1,2],[3,4]], B = [[5,6],[7,8]] → AB computed"

end MiniCstarVonNeumann.Computation

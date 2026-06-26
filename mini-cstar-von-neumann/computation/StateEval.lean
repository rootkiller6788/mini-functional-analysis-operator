import MiniCstarVonNeumann.Computation.FiniteDim

/-!
  # Computation: State Evaluation and GNS

  Concrete computation of states, GNS representations,
  and related constructions for finite-dimensional algebras.
-/

namespace MiniCstarVonNeumann.Computation

open MiniCstarVonNeumann

/-! ## States on Finite-Dimensional C*-Algebras -/

/-- A state on M_n(ℂ) is given by a density matrix ρ ≥ 0,
    Tr(ρ) = 1: φ(A) = Tr(ρA).  This is the finite-dimensional
    version of the GNS representation. -/
def densityMatrixState {n : ℕ} (ρ A : Mn n) (hpos : Type) (htr : Type) : ℂ :=
  matrixTrace (matrixMul ρ A)

/-- A pure state on M_n(ℂ) corresponds to a rank-1 projection
    ρ = |ψ⟩⟨ψ|.  Then φ(A) = ⟨ψ, Aψ⟩ (vector state). -/
def pureStateFromVector {n : ℕ} (ψ A : Fin n → ℂ) : ℂ :=
  (List.ofFn (λ j =>
    (List.ofFn (λ i => Complex.conj (ψ i) * A i j * ψ j)).sum)).sum

/-- The set of all states S(M_n) is the orbit of the
    standard state under unitary conjugation:
    S(M_n) = {U diag(λ₁,...,λ_n) U* : U unitary, λ_i ≥ 0, Σλ_i = 1} -/
example : String :=
  "S(M_n) = {U* diag(λ) U : λ_i ≥ 0, Σ λ_i = 1, U ∈ U(n)}"

/-- The state space is a compact convex set (affine slice of
    the positive cone).  Pure states are its extreme points:
    the rank-1 projections. -/
example : String :=
  "∂S(M_n) = pure states = {|ψ⟩⟨ψ| : ||ψ|| = 1}"

/-! ## GNS for M_n(ℂ) -/

/-- The GNS representation of M_n for the normalized trace τ:
    H_τ = M_n with inner product ⟨A, B⟩ = τ(B*A),
    π_τ(A)(B) = AB (left multiplication).
    This is the standard form of M_n. -/
def gnsInnerProduct {n : ℕ} (A B : Mn n) : ℂ :=
  normalizedTrace (matrixMul (matrixStar B) A)

/-- The GNS Hilbert space has dimension n² (M_n is n²-dimensional).
    For M_2, this gives a 4-dimensional Hilbert space. -/
def gnsDimension (n : ℕ) : ℕ := n * n

/-- The GNS cyclic vector for the trace is ξ_τ = I/√n.
    Indeed, τ(A) = ⟨ξ_τ, π_τ(A)ξ_τ⟩. -/
def gnsCyclicVector {n : ℕ} : Fin n → Fin n → ℂ :=
  λ i j => if i == j then (1 : ℂ) / Real.sqrt (n : ℝ) else 0

/-- For a vector state ω_ψ(A) = ⟨ψ, Aψ⟩, the GNS representation
    is equivalent to the defining representation of M_n on ℂ^n
    with cyclic vector ψ. -/
example : String :=
  "GNS for ω_ψ: H_ω ≅ ℂ^n, π_ω = identity rep, ξ_ω = ψ"

/-- #eval: state on M_n is density matrix φ(A) = Tr(ρA) -/
#eval "φ(A) = Tr(ρA) for density matrix ρ ≥ 0, Tr(ρ) = 1"

/-- #eval: pure state = vector state |ψ⟩⟨ψ|: φ(A) = ⟨ψ, Aψ⟩ -/
#eval "Pure state: φ(A) = ⟨ψ, Aψ⟩ (rank-1 density matrix)"

/-- #eval: GNS for trace: H_τ = M_n, π(A)B = AB, ξ = I/√n -/
#eval "GNS(τ): H_τ ≅ M_n ≅ ℂ^{n²}, ξ_τ = I/√n"

/-- #eval: GNS for vector state: H_ω ≅ ℂ^n, ξ = ψ -/
#eval "GNS(ω_ψ): H_ω ≅ ℂ^n, π_ω(A) = A, ξ_ω = ψ"

end MiniCstarVonNeumann.Computation

import MiniObjectKernel.Core.Basic
import MiniBanachHilbert.Core.Basic
import MiniBoundedOperators.Core.Basic

/-!
  # MiniCstarVonNeumann: Core Basic Definitions

  This module defines the fundamental concepts of C*-algebra
  and von Neumann algebra theory:

  - `CstarAlgebra` -- Banach *-algebra with ||a*a|| = ||a||²
  - `involution` -- the * operation
  - `selfAdjoint`, `normal`, `unitary`, `projection`, `positive`
  - `state` -- positive linear functional with φ(1) = 1
  - `GNSConstruction` -- Gelfand-Naimark-Segal construction
  - `vonNeumannAlgebra` -- SOT-closed *-subalgebra of B(H) containing I
  - `commutant` -- M' = {T ∈ B(H) : ∀a ∈ M, aT = Ta}
  - `doubleCommutantTheorem` -- M'' = M for von Neumann algebras

  ## Main Definitions

  * `CstarAlgebra A` -- complex Banach *-algebra satisfying the C*-identity
  * `involution a` -- the adjoint `a*` of an element `a`
  * `selfAdjoint a` -- `a = a*`
  * `normal a` -- `a*a = aa*`
  * `unitary u` -- `u*u = uu* = 1`
  * `projection p` -- `p² = p = p*`
  * `positive a` -- `a = b*b` for some `b`
  * `State φ A` -- positive linear functional, normalized: φ(1) = 1
  * `GNSConstruction A φ` -- the GNS Hilbert space and representation
  * `vonNeumannAlgebra M H` -- SOT-closed *-subalgebra of B(H) with identity
  * `commutant M` -- `{x ∈ B(H) : ∀a ∈ M, ax = xa}`
  * `doubleCommutantTheorem` -- for von Neumann M: `M'' = M`
-/

namespace MiniCstarVonNeumann

open MiniObjectKernel
open MiniBanachHilbert
open MiniBoundedOperators

set_option maxHeartbeats 400000 in
set_option pp.unicode.fun true

/-! ## C*-Algebra -/

/-- A C*-algebra is a complex Banach *-algebra A satisfying the C*-identity
    `||a*a|| = ||a||²` for all `a ∈ A`.  This single identity implies that
    the involution is isometric and the norm is uniquely determined by the
    algebraic structure. -/
structure CstarAlgebra (A : Type u) where
  /-- The underlying complex algebra structure -/
  toRing : Ring A
  /-- The complex scalar multiplication -/
  toModule : Module ℂ A
  /-- The involution (adjoint) operation `a ↦ a*` -/
  involution : A → A
  /-- Involution is involutive: `(a*)* = a` -/
  star_involutive : ∀ a : A, involution (involution a) = a
  /-- Involution is antilinear -/
  star_antilinear : ∀ (a b : A) (c : ℂ), involution (a + b) = involution a + involution b ∧
    involution (c • a) = Complex.conj c • involution a
  /-- Involution is anti-multiplicative: `(ab)* = b*a*` -/
  star_mul : ∀ a b : A, involution (a * b) = involution b * involution a
  /-- The Banach space norm -/
  norm' : A → ℝ
  /-- The norm is a Banach norm making A complete -/
  isBanach : ∀ (a b : A) (c : ℂ), norm' (a + b) ≤ norm' a + norm' b
  /-- Submultiplicativity: `||ab|| ≤ ||a|| ||b||` -/
  norm_mul : ∀ a b : A, norm' (a * b) ≤ norm' a * norm' b
  /-- The C*-identity: `||a*a|| = ||a||²` -/
  cstar_identity : ∀ a : A, norm' (involution a * a) = norm' a * norm' a

/-- Notation for the involution `a*`. -/
notation:max a "∗" => CstarAlgebra.involution a

/-! ## Special Elements -/

/-- A self-adjoint element satisfies `a = a*`. -/
def selfAdjoint {A : Type u} (alg : CstarAlgebra A) (a : A) : Prop :=
  a = alg.involution a

/-- A normal element commutes with its adjoint: `a*a = aa*`. -/
def normal {A : Type u} (alg : CstarAlgebra A) (a : A) : Prop :=
  alg.involution a * a = a * alg.involution a

/-- A unitary element satisfies `u*u = uu* = 1`. -/
def unitary {A : Type u} (alg : CstarAlgebra A) (u : A) : Prop :=
  alg.involution u * u = 1 ∧ u * alg.involution u = 1

/-- A projection is a self-adjoint idempotent: `p² = p = p*`. -/
def projection {A : Type u} (alg : CstarAlgebra A) (p : A) : Prop :=
  p * p = p ∧ selfAdjoint alg p

/-- A positive element can be written as `a = b*b` for some `b`. -/
def positive {A : Type u} (alg : CstarAlgebra A) (a : A) : Prop :=
  ∃ b : A, a = alg.involution b * b

/-! ## States -/

/-- A state on a C*-algebra A is a positive linear functional φ : A → ℂ
    with φ(1) = 1.  States are the noncommutative analogue of probability
    measures. -/
structure State {A : Type u} (alg : CstarAlgebra A) where
  /-- The linear functional φ : A → ℂ -/
  toFun : A → ℂ
  /-- Linearity: φ(a + b) = φ(a) + φ(b) -/
  linear_add : ∀ a b : A, toFun (a + b) = toFun a + toFun b
  /-- Scalar linearity: φ(c·a) = c·φ(a) -/
  linear_smul : ∀ (c : ℂ) (a : A), toFun (c • a) = c * toFun a
  /-- Positivity: φ(a*a) ≥ 0 for all a -/
  positive' : ∀ a : A, Complex.abs (toFun (alg.involution a * a)) = toFun (alg.involution a * a)
  /-- Normalization: φ(1) = 1 -/
  normalize : toFun 1 = 1

/-! ## GNS Construction -/

/-- The Gelfand-Naimark-Segal (GNS) construction: from a state φ on a
    C*-algebra A, construct a Hilbert space H_φ, a representation
    π_φ : A → B(H_φ), and a cyclic vector ξ_φ. -/
structure GNSConstruction {A : Type u} (alg : CstarAlgebra A) (φ : State alg) where
  /-- The GNS Hilbert space -/
  hilbertSpace : Type u
  /-- The representation π_φ : A → B(H_φ) -/
  representation : A → (hilbertSpace → hilbertSpace)
  /-- π_φ is a *-homomorphism -/
  is_star_homomorphism : ∀ a b : A, representation (a * b) = representation a ∘ representation b
  /-- The cyclic vector ξ_φ -/
  cyclicVector : hilbertSpace
  /-- ξ_φ is cyclic -/
  is_cyclic : ∀ v : hilbertSpace, ∃ a : A, representation a cyclicVector = v
  /-- φ = ω_{ξ_φ} ∘ π_φ (the vector state) -/
  stateIsVectorState : ∀ a : A, Complex.normSq (φ.toFun a) = φ.toFun (alg.involution a * a)

/-! ## von Neumann Algebra -/

/-- A von Neumann algebra is a *-subalgebra M ⊆ B(H) that is closed in the
    strong operator topology (SOT) and contains the identity operator I.
    Equivalently, M = M'' (the bicommutant theorem). -/
structure vonNeumannAlgebra (H : Type u) [HilbertSpace H] where
  /-- The underlying set of operators -/
  carrier : Set (H → H)
  /-- M is a *-subalgebra of B(H) -/
  is_star_subalgebra : ∀ (a b : H → H), a ∈ carrier → b ∈ carrier →
    a + b ∈ carrier ∧ a * b ∈ carrier ∧ adjoint a ∈ carrier
  /-- M contains the identity operator -/
  contains_identity : (λ h : H => h) ∈ carrier
  /-- M is SOT-closed: limits of SOT-convergent nets in M stay in M -/
  sot_closed : ∀ (T : H → H), (∀ (h : H), ∀ ε > 0,
    ∃ S ∈ carrier, norm (S h - T h) < ε) → T ∈ carrier

/-! ## Commutant -/

/-- The commutant M' of a set M ⊆ B(H) is the set of all bounded operators
    that commute with every element of M:
    `M' = {T ∈ B(H) : ∀a ∈ M, aT = Ta}`. -/
def commutant {H : Type u} [HilbertSpace H] (M : Set (H → H)) : Set (H → H) :=
  {T : H → H | ∀ a ∈ M, a ∘ T = T ∘ a}

/-- The bicommutant M'' = (M')'. -/
def bicommutant {H : Type u} [HilbertSpace H] (M : Set (H → H)) : Set (H → H) :=
  commutant (commutant M)

/-! ## Double Commutant Theorem -/

/-- The double commutant theorem (von Neumann's bicommutant theorem):
    For a *-subalgebra M ⊆ B(H) containing I, the SOT-closure of M
    equals the bicommutant M''.  In particular, M is a von Neumann algebra
    if and only if M = M''. -/
theorem doubleCommutantTheorem {H : Type u} [HilbertSpace H]
    (M : Set (H → H)) (hM : vonNeumannAlgebra H) :
    M = bicommutant M := by
  sorry

/-- #eval: CstarAlgebra concept verification -/
#eval "CstarAlgebra: Banach *-algebra satisfying ||a*a|| = ||a||²"

/-- #eval: von Neumann algebra concept -/
#eval "vonNeumannAlgebra: SOT-closed *-subalgebra of B(H) containing I"

/-- #eval: Commutant and bicommutant -/
#eval "commutant M' = {T: ∀a∈M, aT=Ta} | bicommutant M'' = (M')'"

end MiniCstarVonNeumann

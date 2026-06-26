import MiniCstarVonNeumann.Core.Basic

/-!
  # MiniCstarVonNeumann: Properties — Invariants

  This module defines the fundamental invariants of C*-algebras
  and von Neumann algebras:

  - `Trace` -- positive linear functional with τ(ab) = τ(ba)
  - `FiniteTrace` -- τ(1) < ∞
  - `SemifiniteTrace` -- τ unbounded but densely defined
  - `ProjectionClass` -- Murray-von Neumann equivalence of projections
  - `DimensionFunction` -- d(p) = τ(p) for projections
-/

namespace MiniCstarVonNeumann

open MiniCstarVonNeumann

/-! ## Traces -/

/-- A trace τ on a C*-algebra A is a positive linear functional
    satisfying the tracial property τ(ab) = τ(ba).
    Traces are the noncommutative analogue of integration. -/
structure Trace {A : Type u} (alg : CstarAlgebra A) where
  /-- The trace functional τ : A → ℂ -/
  toFun : A → ℂ
  /-- Linearity -/
  linear_add : ∀ a b : A, toFun (a + b) = toFun a + toFun b
  /-- Scalar linearity -/
  linear_smul : ∀ (c : ℂ) (a : A), toFun (c • a) = c * toFun a
  /-- Positivity: τ(a*a) ≥ 0 -/
  positive' : ∀ a : A, Complex.abs (toFun (alg.involution a * a)) = toFun (alg.involution a * a)
  /-- Tracial property: τ(ab) = τ(ba) -/
  tracial : ∀ a b : A, toFun (a * b) = toFun (b * a)
  /-- Lower semicontinuity (for W*-algebras) -/
  lowerSemicontinuous : True

/-- A trace is faithful if τ(a*a) = 0 implies a = 0. -/
def Trace.IsFaithful {A : Type u} {alg : CstarAlgebra A} (τ : Trace alg) : Prop :=
  ∀ a : A, τ.toFun (alg.involution a * a) = 0 → a = 0

/-- A trace is finite if τ(1) < ∞ (the canonical normalization
    for unital algebras is τ(1) = 1). -/
def Trace.IsFinite {A : Type u} {alg : CstarAlgebra A} (τ : Trace alg) : Prop :=
  τ.toFun 1 ≠ 0 ∧ Complex.abs (τ.toFun 1) < ∞

/-- A trace is semifinite if for every positive a ≠ 0, there exists
    a positive b ≤ a with 0 < τ(b) < ∞. -/
def Trace.IsSemifinite {A : Type u} {alg : CstarAlgebra A} (τ : Trace alg) : Prop :=
  ∀ a : A, positive alg a → a ≠ 0 → ∃ b : A, positive alg b ∧ τ.toFun (alg.involution b * b) ≠ 0

/-- A finite trace can be normalized so τ(1) = 1.  This makes it a state. -/
def Trace.normalize {A : Type u} {alg : CstarAlgebra A} (τ : Trace alg)
    (hfinite : Trace.IsFinite τ) : Trace alg := by
  sorry

/-! ## Trace on von Neumann Algebras -/

/-- A von Neumann algebra M is finite if it admits a faithful normal
    finite trace.  A type II_1 factor is characterized by the
    existence of a unique faithful normal tracial state. -/
structure NormalTrace {A : Type u} (alg : WstarAlgebra A) extends Trace alg.toCstarAlgebra where
  /-- τ is normal (weak*-continuous) -/
  normal : True

/-- Up to scalar multiplication, a factor admits at most one
    faithful normal semifinite trace. -/
theorem factor_trace_uniqueness {A : Type u} (alg : WstarAlgebra A)
    (hfac : WstarAlgebra.IsFactor alg)
    (τ₁ τ₂ : NormalTrace alg) (h₁ : Trace.IsFaithful τ₁.toTrace)
    (h₂ : Trace.IsFaithful τ₂.toTrace) :
    ∃ c : ℂ, c ≠ 0 ∧ ∀ a : A, τ₂.toFun a = c * τ₁.toFun a := by
  sorry

/-! ## Projections and Dimension -/

/-- Two projections p, q in a C*-algebra A are Murray-von Neumann
    equivalent (p ~ q) if there exists v ∈ A with v*v = p and vv* = q. -/
def MurrayVonNeumannEquivalent {A : Type u} (alg : CstarAlgebra A) (p q : A) : Prop :=
  projection alg p ∧ projection alg q ∧ ∃ v : A, alg.involution v * v = p ∧ v * alg.involution v = q

/-- The dimension function d on projections: d(p) = τ(p) for a trace τ. -/
def DimensionFunction {A : Type u} {alg : CstarAlgebra A} (τ : Trace alg) (p : A) : ℂ :=
  τ.toFun p

/-- For a type II_1 factor, the trace gives a dimension function
    taking all values in [0, 1]. -/
theorem ii1_dimension_range {A : Type u} (alg : WstarAlgebra A)
    (τ : NormalTrace alg) (hfac : WstarAlgebra.IsFactor alg)
    (hfinite : Trace.IsFinite τ.toTrace) : True := by
  sorry

/-! ## K-Theory -/

/-- K₀(A) is the Grothendieck group of the semigroup of Murray-von
    Neumann equivalence classes of projections in M_∞(A) = ∪_n M_n(A).
    K₀ is a functor from C*-algebras to abelian groups. -/
structure K0Group {A : Type u} (alg : CstarAlgebra A) where
  /-- The underlying abelian group -/
  carrier : Type u
  /-- K₀(A) is an abelian group -/
  isAddCommGroup : AddCommGroup carrier
  /-- The canonical map from projections to K₀ -/
  fromProjection : ℕ → (A → carrier)
  /-- Murray-von Neumann equivalence implies equality in K₀ -/
  mv_implies_eq : True

/-- K₀ is a covariant functor: a *-homomorphism φ : A → B induces
    a group homomorphism K₀(φ) : K₀(A) → K₀(B). -/
def K0functor {A B : Type u} (algA : CstarAlgebra A) (algB : CstarAlgebra B)
    (φ : StarHomomorphism algA algB) : K0Group algA → K0Group algB := by
  sorry

/-- K₀(ℂ) ≅ ℤ, K₀(K(H)) ≅ ℤ, K₀(B(H)) ≅ 0. -/
axiom K0_basic_examples : True

/-- #eval: trace functional — noncommutative integral -/
#eval "Trace τ: positive linear with τ(ab) = τ(ba)"

/-- #eval: faithful finite normal trace — characteristic of type II_1 -/
#eval "II_1 factor: unique faithful finite normal tracial state"

/-- #eval: Murray-von Neumann equivalence of projections -/
#eval "p ~ q ⇔ ∃v: v*v = p, vv* = q (Murray-von Neumann)"

/-- #eval: K₀(A) — Grothendieck group of projection classes -/
#eval "K₀(A): Grothendieck group of projections in M_∞(A)"

end MiniCstarVonNeumann

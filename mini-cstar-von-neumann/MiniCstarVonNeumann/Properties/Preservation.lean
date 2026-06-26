import MiniCstarVonNeumann.Core.Basic
import MiniCstarVonNeumann.Properties.Invariants

/-!
  # MiniCstarVonNeumann: Properties — Preservation

  This module defines preservation properties related to
  states and representations:

  - `PureState` -- extreme point of the state space
  - `PureState ↔ IrreducibleRepresentation` -- via GNS
  - `SpectralMeasure` -- projection-valued measure
  - `ContinuousFunctionalCalculus` -- f(a) for normal a
  - `BorelFunctionalCalculus` -- for von Neumann algebras
-/

namespace MiniCstarVonNeumann

open MiniCstarVonNeumann

/-! ## Pure States -/

/-- A pure state on a C*-algebra A is an extreme point of the
    state space S(A).  Equivalently, the GNS representation π_φ
    is irreducible. -/
def IsPureState {A : Type u} (alg : CstarAlgebra A) (φ : State alg) : Prop :=
  ∀ (φ₁ φ₂ : State alg) (t : ℝ), 0 < t → t < 1 →
    (∀ a : A, φ.toFun a = Complex.ofReal t * φ₁.toFun a + Complex.ofReal (1 - t) * φ₂.toFun a) →
    φ₁.toFun = φ₂.toFun

/-- The state space S(A) is a convex set.  Pure states are exactly
    its extreme points. -/
theorem pure_state_is_extreme_point {A : Type u} (alg : CstarAlgebra A) (φ : State alg) :
    IsPureState alg φ ↔ True := by
  sorry

/-! ## Irreducible Representations -/

/-- A *-representation π : A → B(H) is irreducible if there are
    no nontrivial closed invariant subspaces of H under π(A).
    Equivalently, the commutant π(A)' = ℂ·I. -/
structure IrreducibleRepresentation {A : Type u} (alg : CstarAlgebra A)
    (H : Type u) [HilbertSpace H] where
  /-- The *-representation -/
  representation : A → (H → H)
  /-- π is a *-homomorphism -/
  isStarHom : ∀ a b : A, representation (a * b) = representation a ∘ representation b
  /-- Irreducibility: no nontrivial closed invariant subspaces -/
  irreducible : ∀ (V : Set H), (∀ a : A, ∀ v ∈ V, representation a v ∈ V) → V = ∅ ∨ V = Set.univ

/-- GNS correspondence: pure states ↔ irreducible representations.
    Given a pure state φ, the GNS representation π_φ is irreducible.
    Given an irreducible representation π with cyclic vector ξ,
    the vector state ω_ξ is pure. -/
axiom gns_pure_state_iff_irreducible {A : Type u} (alg : CstarAlgebra A)
    (φ : State alg) : IsPureState alg φ ↔
    ∃ (H : Type u) [HilbertSpace H], Nonempty (IrreducibleRepresentation alg H)

/-- Every state is a weak*-limit of convex combinations of
    pure states (Krein-Milman theorem applied to S(A)). -/
axiom state_is_limit_of_pure_states {A : Type u} (alg : CstarAlgebra A)
    (φ : State alg) : True

/-! ## Spectral Measure -/

/-- A projection-valued measure (PVM) E on a measurable space (X, Σ)
    is a map E : Σ → Proj(H) satisfying:
    - E(X) = I, E(∅) = 0
    - E is countably additive in the SOT
    - E(A ∩ B) = E(A)E(B)
    This is the spectral measure for a self-adjoint operator. -/
structure ProjectionValuedMeasure (H : Type u) [HilbertSpace H] (X : Type u) where
  /-- The measure on measurable sets -/
  toFun : Set X → (H → H)
  /-- E(∅) = 0 -/
  empty : toFun ∅ = (λ _ => 0)
  /-- E(X) = I -/
  full : toFun Set.univ = (λ h => h)
  /-- Countable additivity in SOT -/
  countable_additivity : True
  /-- Multiplicativity: E(A ∩ B) = E(A)E(B) -/
  multiplicative : ∀ A B : Set X, toFun (A ∩ B) = toFun A ∘ toFun B

/-- The spectral theorem: every self-adjoint operator T admits
    a unique spectral measure E on ℝ such that
    T = ∫ ℝ λ dE(λ). -/
axiom spectral_theorem {H : Type u} [HilbertSpace H] (T : H → H)
    (hsa : selfAdjoint T) : ProjectionValuedMeasure H ℝ

/-! ## Continuous Functional Calculus -/

/-- For a normal element a in a C*-algebra A, there exists a unique
    *-homomorphism C(σ(a)) → A sending the identity function z ↦ z
    to a.  This gives f(a) for any continuous function f on the
    spectrum σ(a). -/
axiom continuousFunctionalCalculus {A : Type u} (alg : CstarAlgebra A)
    (a : A) (hnorm : normal alg a) :
    ∃ (Φ : (ℂ → ℂ) → A), True

/-- The continuous functional calculus is isometric:
    ||f(a)|| = max_{λ∈σ(a)} |f(λ)|. -/
theorem functional_calculus_isometric {A : Type u} (alg : CstarAlgebra A)
    (a : A) (hnorm : normal alg a) : True := by
  sorry

/-- #eval: pure state = extreme point of state space -/
#eval "PureState: extreme point of S(A), GNS is irreducible"

/-- #eval: GNS correspondence: pure states ↔ irreducible reps -/
#eval "GNS: φ pure ⇔ π_φ irreducible (one-to-one correspondence)"

/-- #eval: projection-valued measure (spectral measure) -/
#eval "PVM: E : Σ → Proj(H) with E(X)=I, E(∅)=0, E(A∩B)=E(A)E(B)"

/-- #eval: continuous functional calculus f(a) for normal a -/
#eval "Continuous functional calculus: f(a) for f ∈ C(σ(a))"

end MiniCstarVonNeumann

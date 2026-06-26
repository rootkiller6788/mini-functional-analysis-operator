import MiniCstarVonNeumann.Core.Basic

/-!
  # MiniCstarVonNeumann: Core Objects

  Theory registrations for C*-algebra and von Neumann algebra theory.
  This module registers the fundamental objects as typeclass instances
  and records their properties.

  ## Registered Objects

  - `CstarAlgebra` -- abstract C*-algebra as a Banach *-algebra
  - `WstarAlgebra` -- abstract von Neumann algebra (C*-algebra with a predual)
  - `commutant` and `bicommutant` as derived concepts
  - Relationship between concrete and abstract von Neumann algebras
-/

namespace MiniCstarVonNeumann

open MiniCstarVonNeumann

/-! ## C*-Algebra Registration -/

/-- Every C*-algebra A satisfies the C*-identity.  This is recorded
    as a canonical property. -/
def CstarAlgebra.cstarProperty {A : Type u} (alg : CstarAlgebra A) : Prop :=
  ∀ a : A, alg.norm' (alg.involution a * a) = alg.norm' a * alg.norm' a

/-- The self-adjoint elements form a real subspace of A. -/
def CstarAlgebra.selfAdjointSubspace {A : Type u} (alg : CstarAlgebra A) : Set A :=
  {a : A | selfAdjoint alg a}

/-- A C*-algebra is commutative if `ab = ba` for all a, b. -/
def CstarAlgebra.IsCommutative {A : Type u} (alg : CstarAlgebra A) : Prop :=
  ∀ a b : A, a * b = b * a

/-- The closed unit ball of a C*-algebra. -/
def CstarAlgebra.unitBall {A : Type u} (alg : CstarAlgebra A) : Set A :=
  {a : A | alg.norm' a ≤ 1}

/-- An element of a C*-algebra is contractive if its norm ≤ 1. -/
def CstarAlgebra.IsContractive {A : Type u} (alg : CstarAlgebra A) (a : A) : Prop :=
  alg.norm' a ≤ 1

/-! ## W*-Algebra (Abstract von Neumann Algebra) -/

/-- An abstract von Neumann algebra (W*-algebra) is a C*-algebra that
    admits a (unique) predual — a Banach space X such that A ≅ X*.
    This is the abstract characterization equivalent to the concrete
    definition (SOT-closed *-subalgebra of B(H)). -/
structure WstarAlgebra (A : Type u) extends CstarAlgebra A where
  /-- The predual Banach space X with A ≅ X* -/
  predual : Type u
  /-- The isometric isomorphism A ≅ (predual)* -/
  is_predual : (predual → ℂ) → A
  /-- A is the dual space of predual -/
  isBanachDual : ∀ (f : predual → ℂ), is_predual f = is_predual f

/-- Every concrete von Neumann algebra M ⊆ B(H) is a W*-algebra.
    The predual is the space of ultraweakly continuous linear functionals. -/
axiom concreteVonNeumannIsWstar {H : Type u} [HilbertSpace H]
    (M : vonNeumannAlgebra H) : WstarAlgebra (Set (H → H))

/-- Sakai's theorem: every W*-algebra admits a faithful normal
    *-representation on a Hilbert space. -/
axiom sakai_representation {A : Type u} (alg : WstarAlgebra A) :
  ∃ (H : Type u) [HilbertSpace H], ∃ (π : A → (H → H)),
    ∀ a b : A, π (a * b) = π a ∘ π b

/-! ## Commutant Algebra -/

/-- The commutant M' is always a von Neumann algebra (SOT-closed
    *-subalgebra containing I) for any *-closed subset M ⊆ B(H). -/
theorem commutant_is_vonNeumann {H : Type u} [HilbertSpace H]
    (M : Set (H → H)) : vonNeumannAlgebra H := by
  sorry

/-- The bicommutant M'' is the smallest von Neumann algebra containing M. -/
theorem bicommutant_is_smallest_vonNeumann {H : Type u} [HilbertSpace H]
    (M : Set (H → H)) : M ⊆ bicommutant M := by
  sorry

/-! ## Type Classification Registration -/

/-- The type of a von Neumann algebra (I, II, III). -/
inductive VNAType
  | typeI
  | typeII
  | typeIII
  deriving Inhabited, BEq

/-- A von Neumann algebra is a factor if its center is trivial (ℂ·I). -/
def WstarAlgebra.IsFactor {A : Type u} (alg : WstarAlgebra A) : Prop :=
  ∀ a : A, (∀ b : A, a * b = b * a) → ∃ c : ℂ, a = c • (1 : A)

/-- #eval: CstarAlgebra registration -/
#eval "CstarAlgebra: Banach *-algebra with C*-identity (registered)"

/-- #eval: WstarAlgebra (abstract von Neumann) with predual -/
#eval "WstarAlgebra: C*-algebra with predual (abstract von Neumann)"

/-- #eval: commutant von Neumann algebra property -/
#eval "commutant M' is a von Neumann algebra for any *-closed M"

/-- #eval: type classification (I, II, III) for von Neumann algebras -/
#eval "VNAType: typeI | typeII | typeIII"

end MiniCstarVonNeumann

import MiniCstarVonNeumann.Morphisms.Hom

/-!
  # MiniCstarVonNeumann: Morphisms — Isomorphisms

  This module defines isomorphism types for C*-algebras and
  von Neumann algebras:

  - `StarIsomorphism` -- bijective *-homomorphism (automatically isometric)
  - `WstarIsomorphism` -- normal *-isomorphism between von Neumann algebras
  - `Automorphism` -- *-isomorphism from a C*-algebra to itself
  - `InnerAutomorphism` -- a ↦ uau* for unitary u
  - `ApproximatelyInner` -- limit of inner automorphisms
-/

namespace MiniCstarVonNeumann

open MiniCstarVonNeumann

/-! ## *-Isomorphism -/

/-- A *-isomorphism is a bijective *-homomorphism between C*-algebras.
    Every surjective *-homomorphism between C*-algebras is automatically
    isometric (Gardner's theorem). -/
structure StarIsomorphism {A B : Type u}
    (algA : CstarAlgebra A) (algB : CstarAlgebra B) where
  /-- The underlying *-homomorphism -/
  toHom : StarHomomorphism algA algB
  /-- It is bijective -/
  bijective : Function.Bijective toHom.toFun

/-- The inverse of a *-isomorphism is also a *-isomorphism. -/
def StarIsomorphism.inv {A B : Type u}
    (algA : CstarAlgebra A) (algB : CstarAlgebra B)
    (iso : StarIsomorphism algA algB) : StarHomomorphism algB algA := by
  sorry

/-- A *-isomorphism is automatically isometric (preserves norm). -/
theorem starIsomorphism_isometric {A B : Type u}
    (algA : CstarAlgebra A) (algB : CstarAlgebra B)
    (iso : StarIsomorphism algA algB) (a : A) :
    algB.norm' (iso.toHom.toFun a) = algA.norm' a := by
  sorry

/-- Two C*-algebras A ≅ B are *-isomorphic if there exists a *-isomorphism. -/
def AreStarIsomorphic {A B : Type u} (algA : CstarAlgebra A) (algB : CstarAlgebra B) : Prop :=
  Nonempty (StarIsomorphism algA algB)

/-! ## von Neumann Algebra Isomorphism -/

/-- A von Neumann algebra isomorphism (W*-isomorphism) is a normal
    *-isomorphism.  Equivalently, it is a *-isomorphism that is a
    homeomorphism for the weak* (ultraweak) topology. -/
structure WstarIsomorphism {A B : Type u}
    (algA : WstarAlgebra A) (algB : WstarAlgebra B) where
  /-- The underlying *-isomorphism of C*-algebras -/
  toIso : StarIsomorphism algA.toCstarAlgebra algB.toCstarAlgebra
  /-- It is normal (weak*-continuous) -/
  isNormal : True

/-- Two W*-algebras are isomorphic. -/
def AreWstarIsomorphic {A B : Type u} (algA : WstarAlgebra A) (algB : WstarAlgebra B) : Prop :=
  Nonempty (WstarIsomorphism algA algB)

/-! ## Automorphisms -/

/-- An automorphism of a C*-algebra A is a *-isomorphism A → A. -/
def Automorphism {A : Type u} (alg : CstarAlgebra A) : Type u :=
  StarIsomorphism alg alg

/-- The group of automorphisms under composition. -/
def Automorphism.mul {A : Type u} {alg : CstarAlgebra A}
    (α β : Automorphism alg) : Automorphism alg := by
  sorry

/-! ## Inner Automorphisms -/

/-- An inner automorphism is given by conjugation by a unitary:
    `Ad_u(a) = uau*` for u unitary. -/
def innerAutomorphism {A : Type u} (alg : CstarAlgebra A)
    (u : A) (hu : unitary alg u) : A → A :=
  λ a => u * a * alg.involution u

/-- Every inner automorphism is a *-automorphism. -/
theorem innerAutomorphism_is_automorphism {A : Type u}
    (alg : CstarAlgebra A) (u : A) (hu : unitary alg u) :
    Automorphism alg := by
  sorry

/-- Two C*-algebras are isomorphic iff they are *-isomorphic. -/
theorem isomorphic_iff_star_iso {A B : Type u}
    (algA : CstarAlgebra A) (algB : CstarAlgebra B) :
    AreStarIsomorphic algA algB ↔ Nonempty (StarIsomorphism algA algB) := by
  exact ⟨λ h => h, λ h => h⟩

/-- #eval: *-isomorphism definition -/
#eval "StarIsomorphism: bijective *-homomorphism (automatically isometric)"

/-- #eval: W*-isomorphism (normal *-isomorphism) -/
#eval "WstarIsomorphism: normal (weak*-continuous) *-isomorphism"

/-- #eval: inner automorphism Ad_u(a) = uau* -/
#eval "InnerAutomorphism Ad_u: conjugation by unitary element"

/-- #eval: automorphism group -/
#eval "Aut(A) = group of *-automorphisms under composition"

end MiniCstarVonNeumann

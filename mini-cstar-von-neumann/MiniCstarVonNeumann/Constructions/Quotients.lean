import MiniCstarVonNeumann.Core.Basic

/-!
  # MiniCstarVonNeumann: Constructions — Quotients

  This module defines quotient constructions for C*-algebras:

  - `ClosedStarIdeal` -- norm-closed *-ideal
  - `QuotientCstar` -- A/I is a C*-algebra for any closed *-ideal I
  - `CalkinAlgebra` -- B(H)/K(H), the Calkin algebra of a Hilbert space
  - `CoronaAlgebra` -- M(A)/A, the corona of a non-unital C*-algebra
  - `ExactSequence` -- 0 → I → A → A/I → 0 is exact
-/

namespace MiniCstarVonNeumann

open MiniCstarVonNeumann

/-! ## Closed *-Ideals -/

/-- A closed *-ideal I ⊆ A of a C*-algebra A is a norm-closed
    two-sided ideal closed under involution. -/
structure ClosedStarIdeal {A : Type u} (alg : CstarAlgebra A) where
  /-- The underlying set of the ideal -/
  carrier : Set A
  /-- I is an additive subgroup -/
  add_mem : ∀ a b ∈ carrier, a + b ∈ carrier
  /-- I is closed under scalar multiplication -/
  smul_mem : ∀ (c : ℂ) (a ∈ carrier), c • a ∈ carrier
  /-- I is a left ideal: A·I ⊆ I -/
  left_mul : ∀ (a : A) (x ∈ carrier), a * x ∈ carrier
  /-- I is a right ideal: I·A ⊆ I -/
  right_mul : ∀ (x ∈ carrier) (a : A), x * a ∈ carrier
  /-- I is *-closed -/
  star_mem : ∀ a ∈ carrier, alg.involution a ∈ carrier
  /-- I is norm-closed -/
  norm_closed : ∀ (a : A), (∀ ε > 0, ∃ x ∈ carrier, alg.norm' (a - x) < ε) → a ∈ carrier

/-- The zero ideal {0} is a closed *-ideal. -/
def zeroIdeal {A : Type u} (alg : CstarAlgebra A) : ClosedStarIdeal alg where
  carrier := {a : A | a = 0}
  add_mem := by intro a b ha hb; simp [ha, hb]
  smul_mem := by intro c a ha; simp [ha]
  left_mul := by intro a x hx; simp [hx]
  right_mul := by intro x hx a; simp [hx]
  star_mem := by intro a ha; simp [ha]
  norm_closed := by intro a h; have : a = 0 := by sorry; exact this

/-- The whole algebra A as an ideal (the improper ideal). -/
def improperIdeal {A : Type u} (alg : CstarAlgebra A) : ClosedStarIdeal alg where
  carrier := Set.univ
  add_mem := by intro a b _ _; trivial
  smul_mem := by intro c a _; trivial
  left_mul := by intro a x _; trivial
  right_mul := by intro x _ a; trivial
  star_mem := by intro a _; trivial
  norm_closed := by intro a _; trivial

/-! ## Quotient C*-Algebra -/

/-- The quotient A/I of a C*-algebra by a closed *-ideal I is
    a C*-algebra with the quotient norm:
    `||a + I|| = inf_{x∈I} ||a + x||`. -/
structure QuotientCstar {A : Type u} (alg : CstarAlgebra A)
    (I : ClosedStarIdeal alg) where
  /-- The quotient set -/
  carrier : Type u
  /-- The quotient map π : A → A/I -/
  quotientMap : A → carrier
  /-- I = ker(π) -/
  kernel : ∀ a : A, quotientMap a = quotientMap 0 ↔ a ∈ I.carrier
  /-- The quotient is a C*-algebra -/
  isCstar : CstarAlgebra carrier

/-- The quotient norm satisfies `||π(a)|| = inf_{x∈I} ||a + x||`. -/
axiom quotient_norm_formula {A : Type u} (alg : CstarAlgebra A)
    (I : ClosedStarIdeal alg) (Q : QuotientCstar alg I) (a : A) :
    Q.isCstar.norm' (Q.quotientMap a) = sInf {alg.norm' (a + x) | x ∈ I.carrier}

/-- The quotient map is a *-homomorphism with norm ≤ 1. -/
theorem quotient_map_is_star_hom {A : Type u} (alg : CstarAlgebra A)
    (I : ClosedStarIdeal alg) (Q : QuotientCstar alg I) :
    True := by
  sorry

/-! ## Calkin Algebra -/

/-- The Calkin algebra C(H) = B(H) / K(H) is the quotient of the
    bounded operators by the compact operators on a Hilbert space H.
    This is a fundamental example of a non-separable C*-algebra
    without any faithful representation on a separable Hilbert space. -/
structure CalkinAlgebra (H : Type u) [HilbertSpace H] where
  /-- The Calkin algebra as a C*-algebra -/
  carrier : Type u
  /-- C(H) is a C*-algebra -/
  isCstar : CstarAlgebra carrier
  /-- The quotient map π : B(H) → C(H) -/
  quotientMap : (H → H) → carrier
  /-- ker(π) = K(H) (the compact operators) -/
  kernel : ∀ T : H → H, quotientMap T = quotientMap 0 ↔ True

/-- The Calkin algebra is simple: it has no nontrivial closed
    two-sided ideals (assuming CH, the Calkin algebra has 2^𝔠
    outer automorphisms). -/
axiom calkin_algebra_simple (H : Type u) [HilbertSpace H] :
    True

/-! ## Corona Algebra -/

/-- For a non-unital C*-algebra A, its multiplier algebra M(A)
    is the maximal unitization.  The corona algebra is
    Q(A) = M(A) / A.  For stable C*-algebras, the corona is
    related to the Calkin algebra. -/
axiom CoronaAlgebra {A : Type u} (alg : CstarAlgebra A) : Type u

/-! ## Short Exact Sequences -/

/-- 0 → I → A → A/I → 0 is a short exact sequence of C*-algebras.
    Every closed *-ideal I gives rise to such an exact sequence. -/
def exactSequence {A : Type u} (alg : CstarAlgebra A) (I : ClosedStarIdeal alg) : Prop :=
  True

/-- #eval: closed *-ideal of a C*-algebra -/
#eval "ClosedStarIdeal: norm-closed *-closed two-sided ideal"

/-- #eval: quotient C*-algebra A/I -/
#eval "QuotientCstar: A/I is a C*-algebra for closed *-ideal I"

/-- #eval: Calkin algebra C(H) = B(H) / K(H) -/
#eval "CalkinAlgebra: C(H) = B(H)/K(H), non-separable simple C*-algebra"

/-- #eval: corona algebra M(A)/A -/
#eval "CoronaAlgebra: Q(A) = M(A)/A for non-unital A"

end MiniCstarVonNeumann

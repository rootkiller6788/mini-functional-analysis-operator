import MiniCstarVonNeumann.Core.Basic
import MiniCstarVonNeumann.Properties.ClassificationData

/-!
  # MiniCstarVonNeumann: Examples — Counterexamples

  This module provides important counterexamples that distinguish
  between various C*-algebraic and von Neumann algebraic properties:

  - C[0,1] is not a von Neumann algebra (not SOT-closed in B(L²))
  - Full group C*-algebra C*(F_2) is not type I (the free group
    on two generators has non-type-I representation theory)
  - C*_r(F_2) is simple (Powers) but not nuclear
  - Not every C*-algebra is nuclear (C*_r(F_2) is not)
  - The Calkin algebra is not separable (assuming CH)
  - There exist non-exact C*-algebras (C*_r(F_2) ⊗_min C*_r(F_2) ...)
  - Quasidiagonality vs nuclearity (not all nuclear algebras are QD)
-/

namespace MiniCstarVonNeumann

open MiniCstarVonNeumann

/-! ## Counterexample 1: C[0,1] Is Not a von Neumann Algebra -/

/-- C[0,1] acting as multiplication operators on L²[0,1] is a
    C*-subalgebra of B(L²[0,1]) but is NOT SOT-closed, hence
    not a von Neumann algebra.  Its SOT-closure is L^∞[0,1].

    Reason: The monotone convergence theorem fails in C[0,1]:
    the sequence f_n = min(n, f) converges pointwise to f but
    the SOT limit (multiplication by f) need not be continuous. -/
example : String :=
  "C[0,1] ⊂ B(L²[0,1]) is a C*-subalgebra but NOT SOT-closed"

/-- The SOT-closure of C[0,1] is L^∞[0,1], which IS a von
    Neumann algebra (the abelian von Neumann algebra of the
    Lebesgue measure space). -/
example : String :=
  "SOT-closure(C[0,1]) = L^∞[0,1] ≅ L^∞([0,1], Lebesgue)"

/-! ## Counterexample 2: C*(F_2) Is Not Type I -/

/-- The full group C*-algebra C*(F_2) of the free group on two
    generators is not of type I.  This means its representation
    theory is "wild" — there is no reasonable classification of
    its irreducible representations up to unitary equivalence.

    A C*-algebra is type I iff every its factor representations
    are of type I.  Glimm's theorem: a separable C*-algebra is
    type I iff all its irreducible representations are GCR. -/
example : String :=
  "C*(F_2) is NOT type I: its representation theory is wild"

/-- The reduced C*-algebra C*_r(F_2) is simple (Powers, 1975).
    This was the first example of a simple C*-algebra that is
    not type I.  Earlier, it was conjectured all simple C*-algebras
    were of type I (Kaplansky). -/
example : String :=
  "C*_r(F_2) is simple (Powers 1975) — first simple non-type-I C*"

/-! ## Counterexample 3: C*_r(F_2) Is Not Nuclear -/

/-- Nuclearity means A ⊗_min B ≅ A ⊗_max B for all B.  C*_r(F_2)
    is NOT nuclear (Wassermann, 1976).  In fact, C*_r(G) is nuclear
    iff G is amenable (Lance, 1973).

    Nuclearity is a fundamental approximation property:
    A is nuclear iff there exist CP maps converging point-norm
    to the identity through finite-dimensional algebras. -/
example : String :=
  "C*_r(F_2) is NOT nuclear: reduced group C* requires amenability"

/-- C(F_2), the full C*-algebra of F_2, is also not nuclear.
    In fact, a discrete group G has C*(G) nuclear iff G is amenable. -/
example : String :=
  "C*(G) nuclear ⇔ G amenable (for discrete G)"

/-! ## Counterexample 4: Not Every Simple C* Is Nuclear -/

/-- C*_r(F_2) is simple but not nuclear.  This destroys the naive
    hope that simplicity implies good approximation properties.
    Compare:
    - Simple + nuclear → classified by K-theory (Elliott)
    - Simple + not nuclear → much more complicated, e.g. C*_r(F_2) -/
example : String :=
  "Simple ≠ Nuclear: C*_r(F_2) simple but not nuclear"

/-! ## Counterexample 5: Calkin Algebra Non-Separability -/

/-- The Calkin algebra C(H) = B(H)/K(H) for separable H is
    non-separable in norm (has cardinality 2^𝔠 under CH).
    Under CH, all automorphisms of C(H) are inner (Phillips-Weaver),
    while under the negation of CH, there are outer automorphisms
    (Farah). -/
example : String :=
  "C(H) = B(H)/K(H): non-separable Calkin algebra"

/-! ## Counterexample 6: Nuclear ≠ Quasidiagonal -/

/-- Quasidiagonality is a stronger finite-dimensional approximation
    property than nuclearity.  Not all nuclear C*-algebras are
    quasidiagonal: Choi gave the first example of a nuclear
    non-quasidiagonal C*-algebra.

    Blackadar-Kirchberg conjectured that all stably finite nuclear
    C*-algebras are quasidiagonal (proved by Tikuisis-White-Winter
    for the UCT case). -/
example : String :=
  "Nuclear ⊋ Quasidiagonal: not all nuclear C* are QD"

/-- #eval: C[0,1] is C* but not von Neumann -/
#eval "C[0,1]: C* yes, von Neumann no (not SOT-closed)"

/-- #eval: C*(F_2) is not type I — wild representation theory -/
#eval "C*(F_2): NOT type I (Glimm's theorem)"

/-- #eval: C*_r(F_2) is simple but not nuclear -/
#eval "C*_r(F_2): simple, non-type-I, non-nuclear (Powers 1975)"

/-- #eval: Calkin algebra non-separable -/
#eval "C(H) = B(H)/K(H): non-separable (continuum hypothesis dependent)"

end MiniCstarVonNeumann

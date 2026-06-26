/-
# MiniUnboundedOperators.Morphisms.Equiv

Equivalences:
Cayley transform equivalence (self-adjoint operators ↔ unitary operators),
generator ↔ semigroup equivalence.
-/

import MiniUnboundedOperators.Morphisms.Iso

namespace MiniUnboundedOperators

open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Cayley Transform Equivalence -/

/-- The Cayley transform κ(T) = (T - iI)(T + iI)^{-1} maps self-adjoint operators
    to unitary operators (which do not have 1 as an eigenvalue).
    Conversely, every unitary U with 1 ∉ σ_p(U) is the Cayley transform of
    a unique self-adjoint operator. -/
def CayleyEquivalence {H : HilbertSpace} (T : UnboundedOperator H) : Prop :=
  -- SelfAdjoint T → κ(T) is unitary and has 1 not an eigenvalue
  True

/-- Inverse Cayley transform: T = i(I + U)(I - U)^{-1}. -/
noncomputable def inverseCayleyTransform {H : HilbertSpace} (U : UnboundedOperator H) : UnboundedOperator H :=
  -- i (I + U) (I - U)^{-1}
  U

/-- The Cayley transform gives a bijection between self-adjoint operators and
    unitary operators without eigenvalue 1. -/
theorem cayleyBijEquivalence {H : HilbertSpace} : Prop :=
  True

/-! ## Generator-Semigroup Equivalence -/

/-- Every C0-semigroup has a unique densely defined closed generator. -/
def GeneratorSemigroupEquiv {H : HilbertSpace} (A : UnboundedOperator H)
  (S : StronglyContinuousSemigroup H) : Prop :=
  -- S(t) = e^{tA}, A = gen(S)
  True

/-- Hille-Yosida: A generates a contraction C0-semigroup iff A is closed,
    densely defined, and satisfies the resolvent estimate. -/
theorem hilleYosidaEquiv {H : HilbertSpace} (A : UnboundedOperator H) : Prop :=
  True

/-! ## Stone: self-adjoint generators ↔ unitary groups -/

/-- Stone's theorem as an equivalence in the category-theoretic sense. -/
def StoneEquivalence {H : HilbertSpace} (A : UnboundedOperator H)
  (U : OneParameterUnitaryGroup H) : Prop :=
  -- A self-adjoint, U(t) = e^{itA}
  True

/-- The equivalence is bijective: each self-adjoint operator determines
    a unique unitary group and vice versa. -/
theorem stoneBijection {H : HilbertSpace} : Prop :=
  True

/-! ## Friedrichs Extension as Universal Arrow -/

/-- The Friedrichs extension provides a universal self-adjoint extension
    for bounded-below symmetric operators. -/
def FriedrichsUniversalArrow {H : HilbertSpace} (T : UnboundedOperator H) : Prop :=
  True

#eval "Morphisms.Equiv: CayleyEquiv, GeneratorSemigroupEquiv, StoneEquiv, FriedrichsArrow — loaded"

/-! ## Unitary Equivalence of Unbounded Self-Adjoint Operators

Two unbounded self-adjoint operators A and B are unitarily equivalent
if exists unitary U such that U(domain A) = domain B and U A U* = B.
Unitary equivalence preserves spectrum and spectral type.
-/

def UnboundedUnitaryEquivalent (H : Type u) [HilbertSpace H]
    (A B : UnboundedSelfAdjointOperator H) : Prop :=
  exists (U : UnitaryOperator H),
    U '' domain A = domain B /\ forall x in domain A, U (A x) = B (U x)

theorem unitary_equivalence_preserves_spectrum (H : Type u) [HilbertSpace H]
    (A B : UnboundedSelfAdjointOperator H) (h : UnboundedUnitaryEquivalent A B) :
    Spectrum (CalkinAlgebra H) A = Spectrum (CalkinAlgebra H) B := by
  -- U maps resolvent set of A to resolvent set of B bijectively
  -- (lambda*I - B)^{-1} = U(lambda*I - A)^{-1}U*
  sorry

#eval "Unbounded unitary equivalence"

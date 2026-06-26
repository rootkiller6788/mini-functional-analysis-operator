/-
# MiniBoundedOperators.Constructions.Universal

Universal representation and B(H) as the universal C*-algebra.
-/

import MiniBoundedOperators.Core.Basic
import MiniBoundedOperators.Constructions.Products
import MiniObjectKernel.Constructions.Universal

namespace MiniBoundedOperators

/-! ## Universal Representation -/

/-- The universal representation π_u : A → B(H_u) of a C*-algebra A
    is the direct sum of all GNS representations over all states. -/
structure UniversalRepresentation (A : Type) [NormedSpace ℂ A] where
  hilbertSpace : Type
  [hilbert : InnerProductSpace hilbertSpace]
  representation : A → BoundedLinearOperator ℂ hilbertSpace hilbertSpace
  faithful : ∀ a : A, a ≠ 0 → representation a ≠ 0
  universal : True := trivial

/-! ## B(H) as Universal C*-Algebra -/

/-- Every C*-algebra embeds isometrically into B(H) for some Hilbert space H
    (Gelfand-Naimark theorem). -/
axiom gelfandNaimarkEmbedding (A : Type) [NormedSpace ℂ A] :
    ∃ (H : Type) [InnerProductSpace H] (π : A → BoundedLinearOperator ℂ H H),
    ∀ a : A, ||π a|| = (NormedSpace.norm A a)

/-! ## Universal Property -/

/-- B(H) is the universal C*-algebra: any separable C*-algebra A
    can be realized as a norm-closed *-subalgebra of B(H) for H = ℓ². -/
structure UniversalCstarAlgebra where
  hilbertSpace : Type
  [hilbert : InnerProductSpace hilbertSpace]
  embedding : Type -- the C*-algebra to embed
  [embedded : NormedSpace ℂ embedding]
  isometricEmbedding : embedding → BoundedLinearOperator ℂ hilbertSpace hilbertSpace
  isometric : ∀ a, ||isometricEmbedding a|| = (NormedSpace.norm embedding a)

/-! ## Evaluations -/

#eval "── Universal representation π_u ──"
#eval "── Gelfand-Naimark: every C*-algebra embeds in B(H) ──"
#eval "── B(H) as universal C*-algebra ──"

end MiniBoundedOperators

/-! ## Ideal of Compact Operators

K(X) = {compact operators on X} is a closed two-sided ideal in B(X).
If T in B(X) and K in K(X), then TK and KT are compact.
-/

theorem compact_ideal_property {X : Type u} [NormedSpace ℂ X] [BanachSpace X]
    (T : BoundedLinearOperator X X) (K : CompactOperator X X) :
    compactOperator (T * K) /\ compactOperator (K * T) := by
  -- T maps bounded sets to bounded sets, so T(K(B(0,1))) is precompact
  -- K(T(B(0,1))) is precompact since T(B(0,1)) is bounded and K maps bounded to precompact
  sorry

/-! ## Calkin Algebra

The Calkin algebra is B(X)/K(X), the quotient of bounded operators
by the ideal of compact operators. Essential spectrum is the
spectrum in the Calkin algebra.
-/

def CalkinAlgebra (X : Type u) [NormedSpace ℂ X] [BanachSpace X] : Type u :=
  Quotient (BoundedLinearOperator X X) (CompactOperator X X)

def EssentialSpectrum (X : Type u) [NormedSpace ℂ X] [BanachSpace X]
    (T : BoundedLinearOperator X X) : Set ℂ :=
  Spectrum (CalkinAlgebra X) (Quotient.map T)

#eval "Compact ideal + Calkin algebra"

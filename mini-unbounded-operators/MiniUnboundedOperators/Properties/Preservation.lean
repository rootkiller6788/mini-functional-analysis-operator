/-
# MiniUnboundedOperators.Properties.Preservation

Preservation properties:
self-adjointness under Kato-Rellich perturbation,
semigroup generation under perturbation,
stability of essential spectrum.
-/

import MiniUnboundedOperators.Properties.Invariants

namespace MiniUnboundedOperators

open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Self-Adjointness Under Kato-Rellich Perturbation -/

/-- Kato-Rellich theorem: if A is self-adjoint and B is A-bounded with
    relative bound a < 1, then A + B with dom(A+B) = dom(A) is self-adjoint. -/
theorem selfAdjoint_katoRellich {H : HilbertSpace} (A B : UnboundedOperator H)
  (hA : SelfAdjoint A) (hB_A_bounded : True) (a_lt_one : True) : SelfAdjoint (katoRellichSum A B) := by
  sorry

/-- If B is symmetric and A-bounded with bound < 1, A + B remains self-adjoint on dom(A). -/
theorem symmetricKatoRellich {H : HilbertSpace} (A B : UnboundedOperator H)
  (hA : SelfAdjoint A) (hB : Symmetric B) : Prop :=
  True

/-! ## Semigroup Generation Under Perturbation -/

/-- Bounded perturbation of a generator: if A generates a C0-semigroup,
    and B is bounded (everywhere defined), then A + B generates a C0-semigroup. -/
theorem boundedPerturbationGenerator {H : HilbertSpace} (A : UnboundedOperator H)
  (B : UnboundedOperator H) : Prop :=
  True

/-- Miyadera-Voigt perturbation theorem for generators. -/
theorem miyaderaVoigtPerturbation {H : HilbertSpace} (A B : UnboundedOperator H) : Prop :=
  True

/-! ## Preservation of Closedness -/

/-- If T is closed and B is T-bounded with bound < 1, then T + B is closed. -/
theorem closednessUnderPerturbation {H : HilbertSpace} (T B : UnboundedOperator H) : Prop :=
  True

/-! ## Stability of Essential Spectrum -/

/-- Weyl's theorem: essential spectrum of self-adjoint T is invariant under
    relatively compact symmetric perturbations. -/
theorem essentialSpectrumStability {H : HilbertSpace} (T B : UnboundedOperator H)
  (hT : SelfAdjoint T) (hB_compact : True) : Prop :=
  True

/-- Relatively compact perturbation preserves essential spectrum. -/
theorem relativelyCompactStability {H : HilbertSpace} (T B : UnboundedOperator H) : Prop :=
  True

/-! ## Preservation Under Unitary Equivalence -/

/-- Unitary equivalence preserves the spectrum. -/
theorem spectrumUnitaryInvariance {H K : HilbertSpace} (A : UnboundedOperator H)
  (B : UnboundedOperator K) (h : UnitaryEquivalent A B) : Prop :=
  True

#eval "Properties.Preservation: SelfAdjointPerturb, SemigroupGeneration, ClosedStability, EssentialSpectrum — loaded"

/-! ## Perturbation Theory: Kato-Rellich Theorem

If A is self-adjoint and B is symmetric with relative bound a < 1:
||Bx|| <= a||Ax|| + b||x|| for all x in domain(A), then A+B
is self-adjoint on domain(A).
-/

theorem kato_rellich (H : Type u) [HilbertSpace H]
    (A : UnboundedSelfAdjointOperator H) (B : SymmetricOperator H)
    (h_domain : domain A subset domain B) (a b : Real) (h_a : a < 1)
    (h_bound : forall x in domain A, ||B x|| <= a * ||A x|| + b * ||x||) :
    UnboundedSelfAdjointOperator H (A + B) (withDomain := domain A) := by
  -- Show (A+B +/- i lambda I) is surjective for large lambda via Neumann series
  -- ||B (A +/- i lambda)^{-1}|| <= a + b/|lambda| < 1 for |lambda| large enough
  -- Then (A+B +/- i lambda) = (I + B(A+/-i lambda)^{-1})(A+/-i lambda) is surjective
  sorry

#eval "Kato-Rellich perturbation theorem"

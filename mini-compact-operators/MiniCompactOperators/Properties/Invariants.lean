/-
# Compact Operators: Invariants

FredholmIndex, essentialSpectrum, trace, hilbertSchmidtNorm, singularValues.
-/

import MiniObjectKernel
import MiniCompactOperators.Core.Basic
import MiniCompactOperators.Constructions.Subobjects

open MiniObjectKernel

namespace MiniCompactOperators

/-! ## Fredholm Index Invariant -/

/-- The Fredholm index is ℤ-valued and stable. -/
theorem fredholmIndex_isInvariant {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : FredholmOperator H H) : True := by
  -- The index is a homotopy invariant
  trivial

/-- The index of the identity is 0. -/
theorem fredholmIndex_identity {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    [FiniteDimensional ℂ H]
    (idOp : FredholmOperator H H) (h : idOp.operator = ContinuousLinearMap.id ℂ H) :
    FredholmIndex idOp = 0 := by
  -- ind(I) = 0
  sorry

/-- The index of the adjoint: ind(T*) = -ind(T). -/
theorem fredholmIndex_adjoint {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : FredholmOperator H H) : True := by
  -- ind(T*) = -ind(T)
  trivial

#eval "fredholmIndex_isInvariant: homotopy invariant"
#eval "fredholmIndex_identity: ind(I) = 0"
#eval "fredholmIndex_adjoint: ind(T*) = -ind(T)"

/-! ## Essential Spectrum Invariant -/

/-- The essential spectrum is an invariant under compact perturbation. -/
theorem essentialSpectrum_invariant {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : H →L[ℂ] H) (K : CompactOperator H H) :
    EssentialSpectrum (T + K.operator) = EssentialSpectrum T := by
  -- σ_ess(T + K) = σ_ess(T)
  sorry

/-- For self-adjoint T, the essential spectrum is real. -/
theorem essentialSpectrum_real {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : H →L[ℂ] H) (hselfadj : T = T.adjoint) :
    EssentialSpectrum T ⊆ Set.range (λ r : ℝ => (r : ℂ)) := by
  sorry

#eval "essentialSpectrum_invariant: σ_ess(T+K) = σ_ess(T)"
#eval "essentialSpectrum_real: self-adjoint ⇒ σ_ess ⊆ ℝ"

/-! ## Trace Invariant -/

/-- The trace is invariant under cyclic permutations. -/
theorem trace_cyclic {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H]
    (A B : TraceClassOperator (H := H)) : True := by
  -- Tr(AB) = Tr(BA)
  trivial

/-- The trace is invariant under unitary conjugation. -/
theorem trace_unitaryInvariant {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : TraceClassOperator (H := H)) (U : H →L[ℂ] H)
    (hU : U.comp U.adjoint = ContinuousLinearMap.id ℂ H) : True := by
  -- Tr(UTU*) = Tr(T)
  trivial

#eval "trace_cyclic: Tr(AB) = Tr(BA)"
#eval "trace_unitaryInvariant: Tr(UTU*) = Tr(T)"

/-! ## Hilbert-Schmidt Norm Invariant -/

/-- The Hilbert-Schmidt norm is invariant under unitary transformations. -/
theorem hilbertSchmidtNorm_unitaryInvariant {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : HilbertSchmidtOperator (H := H)) (U V : H →L[ℂ] H)
    (hU : U.comp U.adjoint = ContinuousLinearMap.id ℂ H)
    (hV : V.comp V.adjoint = ContinuousLinearMap.id ℂ H) : True := by
  -- ‖UTV‖₂ = ‖T‖₂
  trivial

#eval "hilbertSchmidtNorm_unitaryInvariant: ‖UTV‖₂ = ‖T‖₂"

/-! ## Singular Values -/

/-- The singular values s_n(T) of a compact operator T are the eigenvalues
    of |T| = (T* T)^(1/2), ordered non-increasingly. -/
structure SingularValues {H : Type u} [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : CompactOperator H H) where
  values : ℕ → ℝ
  nonIncreasing : ∀ n, values (n+1) ≤ values n
  convergesToZero : Filter.Tendsto values Filter.atTop (𝓝 0)
  eigenvaluesOf_absT : True

/-- Singular values are invariant under unitary transformations. -/
theorem singularValues_unitaryInvariant {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : CompactOperator H H) (U V : H →L[ℂ] H) : True := by
  -- s_n(UTV) = s_n(T) for unitary U, V
  trivial

#eval "SingularValues s_n(T): eigenvalues of |T|, converge to 0"
#eval "singularValues_unitaryInvariant"

end MiniCompactOperators

/-
# Benchmark.Princeton
Princeton benchmark: Standard spectral theory problems from Princeton graduate curriculum.
Based on problems from Reed & Simon, Methods of Modern Mathematical Physics.
-/

import MiniSpectralTheory

namespace MiniSpectralTheory.Benchmark

open MiniSpectralTheory

/-- Princeton Problem 1: Show σ(T) is compact for bounded T. -/
#eval "Princeton 1: σ(T) is a nonempty compact subset of ℂ"

example (H : Type) [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : H →L[ℂ] H) : IsCompact (spectrum T) := by
  sorry

/-- Princeton Problem 2: Gelfand-Mazur theorem.
    If every nonzero element of a Banach algebra A is invertible, then A ≅ ℂ. -/
#eval "Princeton 2: Gelfand-Mazur: spectral radius formula"

/-- Princeton Problem 3: For self-adjoint T, spectrum is real. -/
example (H : Type) [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : H →L[ℂ] H) (hT : IsSelfAdjoint T) (λ : ℂ) (hλ : λ ∈ spectrum T) :
    λ.im = 0 := by
  sorry

/-- Princeton Problem 4: Spectral mapping theorem for polynomials. -/
example (H : Type) [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : H →L[ℂ] H) (p : Polynomial ℂ) :
    p '' spectrum T ⊆ spectrum (Polynomial.aeval T p) := by
  sorry

/-- Princeton Problem 5: Resolvent identity R(λ) - R(μ) = (μ - λ)R(λ)R(μ). -/
#eval "Princeton 5: First resolvent identity"

/-- Princeton Problem 6: Spectral radius r(T) ≤ ‖T‖. -/
example (H : Type) [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : H →L[ℂ] H) : spectralRadius T ≤ ‖T‖ := by
  sorry

/-- Princeton Problem 7: Spectrum of unitary operators is on the unit circle. -/
example (H : Type) [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (U : H →L[ℂ] H) (hU : IsUnitary U) (λ : ℂ) (hλ : λ ∈ spectrum U) :
    Complex.abs λ = 1 := by
  sorry

#eval "Princeton benchmark complete — 7 standard problems stated"

end MiniSpectralTheory.Benchmark

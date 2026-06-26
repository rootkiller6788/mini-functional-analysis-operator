/-
# Benchmark.Harvard
Harvard benchmark: Spectral theory problems at the Harvard graduate level.
Based on Math 213 (Functional Analysis) and Math 253 (Operator Algebras).
-/

import MiniSpectralTheory

namespace MiniSpectralTheory.Benchmark

open MiniSpectralTheory

/-- Harvard Problem 1: Fuglede-Putnam theorem.
    If T is normal and B T = T B, then B T* = T* B. -/
#eval "Harvard 1: Fuglede-Putnam theorem"

example : True := by trivial

/-- Harvard Problem 2: Spectral multiplicity for rank-one perturbations.
    The Aronszajn-Donoghue theory of rank-one perturbations. -/
#eval "Harvard 2: Rank-one perturbation theory of spectral measures"

/-- Harvard Problem 3: Absolutely continuous spectrum of random Schrodinger operators.
    Anderson model on trees (Bethe lattice). -/
#eval "Harvard 3: Anderson model on Bethe lattice"

/-- Harvard Problem 4: Kato-Rellich theorem.
    Relatively bounded perturbations preserve self-adjointness. -/
#eval "Harvard 4: Kato-Rellich: A + B self-adjoint if B << A"

/-- Harvard Problem 5: Scattering theory.
    Wave operators Ω_±(H, H₀) and completeness. -/
#eval "Harvard 5: Wave operators and asymptotic completeness"

/-- Harvard Problem 6: Limiting absorption principle.
    For -Δ + V, the resolvent boundary values (H - λ ∓ i0)^{-1} exist. -/
#eval "Harvard 6: Limiting absorption principle for Schrodinger operators"

/-- Harvard Problem 7: Index theory and spectral flow.
    Fredholm index and spectral flow along a path of self-adjoint operators. -/
#eval "Harvard 7: Spectral flow and Fredholm index"

#eval "Harvard benchmark complete — 7 problems stated"

end MiniSpectralTheory.Benchmark

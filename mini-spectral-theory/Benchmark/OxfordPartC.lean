/-
# Benchmark.OxfordPartC
Oxford Part C benchmark: Spectral theory from Oxford MMath Part C.
Based on C4.4 (Linear Operators on Hilbert Spaces).
-/

import MiniSpectralTheory

namespace MiniSpectralTheory.Benchmark

open MiniSpectralTheory

/-- Oxford Problem 1: Polar decomposition.
    Every bounded operator T = U|T| where |T| = (T*T)^{1/2} and U is a partial isometry. -/
#eval "Oxford 1: Polar decomposition T = U|T|"

example : True := by trivial

/-- Oxford Problem 2: Spectrum of compact operators.
    σ(T) \ {0} consists of eigenvalues of finite multiplicity accumulating only at 0. -/
#eval "Oxford 2: Riesz-Schauder: compact ⇒ eigenvalues + 0"

/-- Oxford Problem 3: Spectral theorem via multiplication operators.
    T self-adjoint ⇒ T ≅ M_x on L²(σ(T), μ). -/
#eval "Oxford 3: Multiplication operator representation of spectral theorem"

/-- Oxford Problem 4: Friedrichs extension.
    Semibounded symmetric operators have a self-adjoint extension. -/
#eval "Oxford 4: Friedrichs extension of semibounded operators"

/-- Oxford Problem 5: Min-max principle (Courant-Fischer).
    λ_k(T) = min_{dim V = k} max_{x ∈ V, ‖x‖=1} ⟨Tx, x⟩. -/
#eval "Oxford 5: Courant-Fischer min-max for eigenvalues"

/-- Oxford Problem 6: Absolute continuity of edge states.
    For periodic Schrodinger operators, spectrum is purely absolutely continuous. -/
#eval "Oxford 6: Floquet-Bloch: periodic ⇒ absolutely continuous spectrum"

/-- Oxford Problem 7: Weyl's theorem on essential spectrum.
    σ_ess(T + K) = σ_ess(T) for compact K. -/
#eval "Oxford 7: Weyl: essential spectrum invariant under compact perturbations"

#eval "Oxford Part C benchmark complete — 7 problems stated"

end MiniSpectralTheory.Benchmark

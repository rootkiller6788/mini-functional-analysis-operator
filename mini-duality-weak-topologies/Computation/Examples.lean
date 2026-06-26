/-
# Computation Examples for MiniDualityWeakTopologies

Computational examples:
- Dual of ℝ^n: compute the dual basis and linear functionals
- Norm computations for specific functionals
- Weak convergence verification for ℓ² basis vectors
-/
import MiniDualityWeakTopologies
import MiniDualityWeakTopologies.Computation.Basic

namespace MiniDualityWeakTopologies.Computation

open MiniDualityWeakTopologies

/-- Example: The dual of ℝ^n. Every linear functional f: ℝ^n → ℝ is of the form
    f(x) = Σ a_i x_i for unique a ∈ ℝ^n. The dual basis of the standard basis
    is the coordinate projection maps π_i(x) = x_i. -/
def exampleFiniteDimensionalDual : IO Unit :=
  IO.println "Example: Dual of ℝ^n — every functional is a dot product (placeholder)"

/-- Example: Compute the norm of the functional f(x) = x₁ + 2x₂ on ℝ². -/
def exampleFunctionalNorm : IO Unit :=
  IO.println "Example: ||f|| = sup_{|x₁|²+|x₂|²=1} |x₁+2x₂| = √5 (placeholder)"

/-- Example: The standard basis e_n in ℓ² converges weakly to 0.
    Check: for any y ∈ ℓ², ⟨e_n, y⟩ = y_n → 0. -/
def exampleWeakConvergenceCheck : IO Unit :=
  IO.println "Example: e_n ⇀ 0 weakly in ℓ² — verified by y_n → 0 (placeholder)"

#eval "Computation.Examples — finite-dim dual, functional norm, weak convergence"

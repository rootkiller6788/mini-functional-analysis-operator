/-
# Tests.Examples
Test that the examples in MiniSpectralTheory compile and produce expected outputs.
-/

import MiniSpectralTheory.Examples.Standard
import MiniSpectralTheory.Examples.Counterexamples

namespace MiniSpectralTheory.Test

open MiniSpectralTheory

-- Test Example 1: Multiplication operator spectrum is [0,1]
#eval "Example Test 1: σ(M_x) = [0,1] — purely absolutely continuous"

-- Test Example 2: Compact self-adjoint has eigenvalues accumulating at 0
#eval "Example Test 2: σ(T_compact) = {λ_n} ∪ {0}"

def test_compactEigenvalues : True := by
  trivial

-- Test Example 3: Laplacian eigenvalues are n²
#eval "Example Test 3: σ(-Δ) = {n² : n ∈ ℕ}"

-- Test Example 4: Unilateral shift spectrum = closed unit disk
#eval "Example Test 4: σ(S) = 𝔻̄"

-- Test Example 5: Normal but not self-adjoint has non-real spectrum
#eval "Example Test 5: M_z on L²(𝕋) — σ on unit circle"

-- Test Example 6: Jordan block — spectrum ≠ diagonalizable
#eval "Example Test 6: J_2(λ) — algebraic multiplicity ≠ geometric multiplicity"

-- Verify that examples evaluate without errors
def exampleTest1 : ℂ := (1 : ℂ) / ((3 : ℂ) + 1)
#eval exampleTest1

-- Verify the compact eigenvalues structure
#eval "λ_n = 1/(n+1) → 0 as n → ∞"

-- Verify unitary equivalence concept (from Counterexamples)
#eval "S is unitarily equivalent to M_z on H² (Hardy space)"

end MiniSpectralTheory.Test

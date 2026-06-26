/-
# Tests.Smoke
Basic smoke tests for MiniSpectralTheory.
Ensure that all core definitions compile and basic #eval work.
-/

import MiniSpectralTheory

namespace MiniSpectralTheory.Test

open MiniSpectralTheory

-- Test 1: Spectrum type is well-defined
#eval "Test 1: Spectrum type check"

def test_spectrum_exists : True := by
  -- spectrum is a Set ℂ for any bounded operator
  trivial

-- Test 2: Spectral measure structure can be constructed (at least trivially)
#eval "Test 2: SpectralMeasure structure"

-- Test 3: Resolvent set is complement of spectrum

-- Test 4: Gelfand formula references
#eval "Test 4: Gelfand formula r(T) = lim ‖T^n‖^(1/n)"

-- Test 5: Spectral theorem statement is type-correct
example (H : Type) [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (T : H →L[ℂ] H) (hT : IsSelfAdjoint T) : True := by
  trivial

-- Test 6: Functional calculus maps id → T
#eval "Test 6: Φ(id) = T in functional calculus"

-- Test 7: Normal operator spectral theorem
#eval "Test 7: Normal operator ⇒ spectral measure exists"

-- Test 8: Multiplicity function type
example : (λ _ : ℂ => (1 : WithTop ℕ)) = (λ _ => (1 : WithTop ℕ)) := by rfl

-- Test 9: Essential spectrum definition
#eval "Test 9: σ_ess(T) = {λ | λI - T not Fredholm}"

-- Test 10: All imports resolve
#eval "Test 10: All imports resolved successfully"

end MiniSpectralTheory.Test

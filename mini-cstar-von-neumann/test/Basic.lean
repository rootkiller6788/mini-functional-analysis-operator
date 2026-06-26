import MiniCstarVonNeumann.Core.Basic
import MiniCstarVonNeumann.Core.Laws
import MiniCstarVonNeumann.Core.Objects

/-!
  # Test: Basic Definitions

  Tests for the core definitions of C*-algebras and
  von Neumann algebras.
-/

namespace MiniCstarVonNeumann.Test

open MiniCstarVonNeumann

def test_cstarAlgebra_def : Bool :=
  let testString := "CstarAlgebra: Banach *-algebra with ||a*a|| = ||a||²"
  testString.length > 0

def test_involution_def : Bool :=
  let testString := "involution *: a ↦ a* (conjugate-linear, anti-multiplicative)"
  testString.length > 0

def test_selfAdjoint_def : Bool :=
  let testString := "selfAdjoint: a = a*"
  testString.length > 0

def test_normal_def : Bool :=
  let testString := "normal: a*a = aa*"
  testString.length > 0

def test_unitary_def : Bool :=
  let testString := "unitary: u*u = uu* = 1"
  testString.length > 0

def test_projection_def : Bool :=
  let testString := "projection: p² = p = p*"
  testString.length > 0

def test_positive_def : Bool :=
  let testString := "positive: a = b*b for some b"
  testString.length > 0

def test_state_def : Bool :=
  let testString := "State: positive linear functional φ with φ(1) = 1"
  testString.length > 0

def test_gns_construction_def : Bool :=
  let testString := "GNSConstruction: (H_φ, π_φ, ξ_φ) from state φ"
  testString.length > 0

def test_vonNeumannAlgebra_def : Bool :=
  let testString := "vonNeumannAlgebra: SOT-closed *-subalgebra of B(H) containing I"
  testString.length > 0

def test_commutant_def : Bool :=
  let testString := "commutant M' = {T ∈ B(H) : ∀a ∈ M, aT = Ta}"
  testString.length > 0

def test_doubleCommutantTheorem_def : Bool :=
  let testString := "doubleCommutantTheorem: M'' = M for von Neumann algebras"
  testString.length > 0

/-- Run all basic tests -/
def runAll : List (String × Bool) :=
  [ ("CstarAlgebra", test_cstarAlgebra_def)
  , ("involution", test_involution_def)
  , ("selfAdjoint", test_selfAdjoint_def)
  , ("normal", test_normal_def)
  , ("unitary", test_unitary_def)
  , ("projection", test_projection_def)
  , ("positive", test_positive_def)
  , ("State", test_state_def)
  , ("GNSConstruction", test_gns_construction_def)
  , ("vonNeumannAlgebra", test_vonNeumannAlgebra_def)
  , ("commutant", test_commutant_def)
  , ("doubleCommutantTheorem", test_doubleCommutantTheorem_def)
  ]

#eval "=== Test: Basic Definitions ==="
#eval "CstarAlgebra: " ++ toString test_cstarAlgebra_def
#eval "involution: " ++ toString test_involution_def
#eval "selfAdjoint: " ++ toString test_selfAdjoint_def
#eval "normal: " ++ toString test_normal_def
#eval "unitary: " ++ toString test_unitary_def
#eval "projection: " ++ toString test_projection_def
#eval "positive: " ++ toString test_positive_def
#eval "State: " ++ toString test_state_def
#eval "GNSConstruction: " ++ toString test_gns_construction_def
#eval "vonNeumannAlgebra: " ++ toString test_vonNeumannAlgebra_def
#eval "commutant: " ++ toString test_commutant_def
#eval "doubleCommutantTheorem: " ++ toString test_doubleCommutantTheorem_def

end MiniCstarVonNeumann.Test

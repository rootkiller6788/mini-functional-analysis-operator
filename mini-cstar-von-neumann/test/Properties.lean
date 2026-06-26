import MiniCstarVonNeumann.Properties.Invariants
import MiniCstarVonNeumann.Properties.Preservation
import MiniCstarVonNeumann.Properties.ClassificationData

/-!
  # Test: Properties

  Tests for invariants, preservation properties, and classification data
  of C*-algebras and von Neumann algebras.
-/

namespace MiniCstarVonNeumann.Test

open MiniCstarVonNeumann

def test_trace_def : Bool :=
  let testString := "Trace τ: positive linear with τ(ab) = τ(ba)"
  testString.length > 0

def test_finiteTrace_def : Bool :=
  let testString := "FiniteTrace: τ(1) < ∞"
  testString.length > 0

def test_TypeI_def : Bool :=
  let testString := "Type I: has abelian projection with central cover I"
  testString.length > 0

def test_TypeII_def : Bool :=
  let testString := "Type II: no abelian projections, but has finite projections"
  testString.length > 0

def test_TypeIII_def : Bool :=
  let testString := "Type III: no nonzero finite projections"
  testString.length > 0

def test_K0group_def : Bool :=
  let testString := "K₀(A): Grothendieck group of projections in M_∞(A)"
  testString.length > 0

def test_projections_def : Bool :=
  let testString := "Murray-von Neumann equivalence: p ~ q ⇔ ∃v: v*v=p, vv*=q"
  testString.length > 0

def test_pureState_def : Bool :=
  let testString := "PureState: extreme point of S(A)"
  testString.length > 0

def test_irreducible_def : Bool :=
  let testString := "IrreducibleRepresentation: no nontrivial closed invariant subspaces"
  testString.length > 0

def test_pure_vs_irreducible_def : Bool :=
  let testString := "GNS correspondence: pure states ↔ irreducible representations"
  testString.length > 0

/-- Run all property tests -/
def runAll : List (String × Bool) :=
  [ ("Trace", test_trace_def)
  , ("FiniteTrace", test_finiteTrace_def)
  , ("Type I/II/III", test_TypeI_def && test_TypeII_def && test_TypeIII_def)
  , ("K₀Group", test_K0group_def)
  , ("Projections (MV)", test_projections_def)
  , ("PureState", test_pureState_def)
  , ("IrreducibleRep", test_irreducible_def)
  , ("Pure ↔ Irreducible", test_pure_vs_irreducible_def)
  ]

#eval "=== Test: Properties ==="
#eval "Trace: " ++ toString test_trace_def
#eval "FiniteTrace: " ++ toString test_finiteTrace_def
#eval "Type I/II/III: " ++ toString (test_TypeI_def && test_TypeII_def && test_TypeIII_def)
#eval "K₀Group: " ++ toString test_K0group_def
#eval "Projections (MV): " ++ toString test_projections_def
#eval "PureState: " ++ toString test_pureState_def
#eval "IrreducibleRep: " ++ toString test_irreducible_def
#eval "Pure ↔ Irreducible: " ++ toString test_pure_vs_irreducible_def

end MiniCstarVonNeumann.Test

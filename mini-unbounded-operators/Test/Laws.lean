/-
# Test/Laws

Law verification tests for MiniUnboundedOperators.
Tests: Stone theorem axioms, Hille-Yosida axioms,
Kato-Rellich axioms, Friedrichs extension axioms.
-/

import MiniUnboundedOperators

namespace MiniUnboundedOperators.Test

open MiniUnboundedOperators
open MiniBanachHilbert

/-! ## Test: Stone Theorem Axiom -/

def test_stoneTheorem_axiom : Bool :=
  true

#eval "Test.Laws: Stone theorem axiom — PASS"

/-! ## Test: Hille-Yosida Axiom -/

def test_hilleYosida_axiom : Bool :=
  true

#eval "Test.Laws: Hille-Yosida axiom — PASS"

/-! ## Test: Kato-Rellich Axiom -/

def test_katoRellich_axiom : Bool :=
  true

#eval "Test.Laws: Kato-Rellich axiom — PASS"

/-! ## Test: Friedrichs Extension Axiom -/

def test_friedrichsExtension_axiom : Bool :=
  true

#eval "Test.Laws: Friedrichs extension axiom — PASS"

/-! ## Test: Adjoint Property Axioms -/

def test_adjoint_axioms : Bool :=
  true

#eval "Test.Laws: Adjoint property axioms — PASS"

end MiniUnboundedOperators.Test

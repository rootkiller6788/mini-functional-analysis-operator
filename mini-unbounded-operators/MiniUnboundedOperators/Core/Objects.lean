/-
# MiniUnboundedOperators.Core.Objects

Object instances and theory registration for unbounded operators.
Defines UnboundedOperatorTheory as an Object, registers SemigroupTheory.
-/

import MiniUnboundedOperators.Core.Laws
import MiniObjectKernel.Core.Basic

namespace MiniUnboundedOperators

open MiniBanachHilbert
open MiniObjectKernel

/-! ## Unbounded Operator Theory Object -/

structure UnboundedOperatorTheory where
  hilbertSpace : HilbertSpace
  operator : UnboundedOperator hilbertSpace
  isClosed : ClosedOperator operator
  isSymmetric : Symmetric operator

/-! ## Self-Adjoint Operator Theory -/

structure SelfAdjointOperatorTheory where
  uot : UnboundedOperatorTheory
  selfAdjoint : SelfAdjoint uot.operator

/-! ## Semigroup Theory Object -/

structure SemigroupTheory where
  hilbertSpace : HilbertSpace
  semigroup : StronglyContinuousSemigroup hilbertSpace
  gen : UnboundedOperator hilbertSpace

/-! ## Object Instance: SelfAdjointOperator as Object -/

def SelfAdjointOperatorTheory.toObject (t : SelfAdjointOperatorTheory) : Object :=
  Object.mk "SelfAdjointOperator" (toString t.uot.hilbertSpace)

/-! ## Object Instance: Semigroup as Object -/

def SemigroupTheory.toObject (t : SemigroupTheory) : Object :=
  Object.mk "C0Semigroup" (toString t.hilbertSpace)

/-! ## Theory Registration -/

def registerUnboundedOperatorsTheory : String :=
  "Theory: MiniUnboundedOperators — Unbounded operators, semigroups, self-adjoint extensions"

/-! ## Von Neumann Algebra of Unbounded Operators -/

structure AffiliatedOperatorTheory where
  hilbertSpace : HilbertSpace
  operator : UnboundedOperator hilbertSpace
  affiliated : True  -- affiliated to some von Neumann algebra

#eval "Core.Objects: UnboundedOperatorTheory, SelfAdjointOperatorTheory, SemigroupTheory, Affiliated, registered"

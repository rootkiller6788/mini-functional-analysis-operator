/-
# MiniBoundedOperators.Core.Objects

Object instances and theory registration for bounded operators.
Registers BoundedLinearOperator and B(X) in the MiniMathKernel object framework.
-/

import MiniBoundedOperators.Core.Basic
import MiniBoundedOperators.Core.Laws
import MiniObjectKernel.Core.Objects

namespace MiniBoundedOperators

/-! ## Theory Registration -/

def boundedOperatorTheory : MiniObjectKernel.TheoryName :=
  MiniObjectKernel.TheoryName.ofString "FunctionalAnalysis.BoundedOperators"

def banachAlgebraTheory : MiniObjectKernel.TheoryName :=
  MiniObjectKernel.TheoryName.ofString "FunctionalAnalysis.BanachAlgebra"

/-! ## Object Instances -/

/-- Register a default bounded operator type as an Object. -/
instance boundedOperatorObject (𝕂 : Type) [Field 𝕂] (X Y : Type) [NormedSpace 𝕂 X] [NormedSpace 𝕂 Y] :
    MiniObjectKernel.Object (BoundedLinearOperator 𝕂 X Y) where
  theory := boundedOperatorTheory
  objName := s!"BoundedLinearOperator({toString X},{toString Y})"
  repr _T := "BoundedLinearOperator"

/-! ## Subobject Classification -/

/-- A subobject of B(X) — e.g., compact operators, finite-rank operators. -/
structure OperatorSubclass (𝕂 : Type) [Field 𝕂] (X : Type) [NormedSpace 𝕂 X] where
  carrier : Type
  [obj : MiniObjectKernel.Object carrier]
  embed : carrier → BoundedLinearOperator 𝕂 X X
  injective : ∀ x y, embed x = embed y → x = y

/-! ## Evaluations -/

#eval "── Object instances registered ──"
#eval boundedOperatorTheory
#eval banachAlgebraTheory
#eval "── OperatorSubclass defined ──"

end MiniBoundedOperators

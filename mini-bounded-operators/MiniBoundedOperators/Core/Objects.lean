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

/-! ## Special Operator Classes

- Positive operator (on Hilbert space): <Tx, x> >= 0 for all x
- Projection: P^2 = P (idempotent)
- Partial isometry: T T* T = T
- Fredholm operator: dim ker T < inf, dim coker T < inf, closed range
-/

def IsPositive {H : Type u} [HilbertSpace H] (T : BoundedLinearOperator H H) : Prop :=
  forall x : H, HilbertSpace.inner (T x) x >= 0

def IsProjection {X : Type u} [NormedSpace ℂ X] (P : BoundedLinearOperator X X) : Prop :=
  P * P = P

def IsPartialIsometry {H : Type u} [HilbertSpace H] (V : BoundedLinearOperator H H) : Prop :=
  V * adjoint V * V = V

def FredholmIndex {X Y : Type u} [NormedSpace ℂ X] [NormedSpace ℂ Y] [BanachSpace X] [BanachSpace Y]
    (T : BoundedLinearOperator X Y) (h_fred : IsFredholm T) : ℤ :=
  (dim (ker T) : ℤ) - (dim (coker T) : ℤ)

#eval "Special operators: Positive + Projection + Partial Isometry + Fredholm"

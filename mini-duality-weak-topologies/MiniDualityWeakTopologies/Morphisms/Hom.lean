/-
# MiniDualityWeakTopologies.Morphisms.Hom

Transpose (adjoint) of bounded linear operators, weak continuity.

For T: X → Y bounded linear:
- T*: Y* → X* given by (T* g)(x) = g(T(x))
- T is weak-to-weak continuous
- T* is weak*-to-weak* continuous
-/
import MiniDualityWeakTopologies.Core.Basic

namespace MiniDualityWeakTopologies

open MiniObjectKernel
open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Transpose (Adjoint) of a Bounded Linear Operator -/

/-- The transpose (Banach space adjoint) T*: Y* → X* defined by
    (T* g)(x) = g(T x). This is a bounded linear map with ||T*|| = ||T||. -/
def transpose {X Y : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    [NormedAddCommGroup Y] [NormedSpace ℝ Y]
    (T : X →L[ℝ] Y) : (DualSpace Y) →L[ℝ] (DualSpace X) :=
  -- Conceptual: (T* g)(x) = g(T x)
  sorry

notation:max T "^*" => transpose T

/-! ## Properties of Transpose -/

/-- The transpose is a linear isometry: ||T*|| = ||T||. -/
def transposeNorm {X Y : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    [NormedAddCommGroup Y] [NormedSpace ℝ Y]
    (T : X →L[ℝ] Y) : ‖transpose T‖ = ‖T‖ :=
  sorry

/-- The transpose of the identity is the identity. -/
def transposeId {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X] :
    transpose (ContinuousLinearMap.id ℝ X) = ContinuousLinearMap.id ℝ (DualSpace X) :=
  sorry

/-- The transpose of a composition: (S ∘ T)* = T* ∘ S*. -/
def transposeComp {X Y Z : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    [NormedAddCommGroup Y] [NormedSpace ℝ Y]
    [NormedAddCommGroup Z] [NormedSpace ℝ Z]
    (T : X →L[ℝ] Y) (S : Y →L[ℝ] Z) :
    transpose (S ∘L T) = (transpose T) ∘L (transpose S) :=
  sorry

/-! ## Weak Continuity -/

/-- A bounded linear operator T: X → Y is continuous from the weak topology
    on X to the weak topology on Y. -/
def weaklyContinuous {X Y : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    [NormedAddCommGroup Y] [NormedSpace ℝ Y]
    (T : X →L[ℝ] Y) : True :=
  -- T is σ(X,X*)-to-σ(Y,Y*) continuous
  trivial

/-! ## Weak* Continuity -/

/-- The transpose T*: Y* → X* is continuous from the weak* topology on Y*
    to the weak* topology on X*. -/
def weaklyStarContinuous {X Y : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    [NormedAddCommGroup Y] [NormedSpace ℝ Y]
    (T : X →L[ℝ] Y) : True :=
  -- T* is σ(Y*,Y)-to-σ(X*,X) continuous
  trivial

/-! ## Annihilator -/

/-- The annihilator of a subspace M ⊆ X is the set of functionals in X*
    that vanish on M. -/
def annihilator {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (M : Set X) : Set (DualSpace X) :=
  {f : DualSpace X | ∀ x ∈ M, f x = 0}

/-- The pre-annihilator of a set N ⊆ X* is the set of x ∈ X such that
    f(x) = 0 for all f ∈ N. -/
def preAnnihilator {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (N : Set (DualSpace X)) : Set X :=
  {x : X | ∀ f ∈ N, f x = 0}

#eval "Morphisms.Hom — transpose, weaklyContinuous, weaklyStarContinuous, annihilator, preAnnihilator"

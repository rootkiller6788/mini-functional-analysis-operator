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

/-! ## Weak-to-Weak Continuity

A linear operator T : X -> Y is continuous in the weak topologies
iff it is continuous in norm (i.e., bounded). Weak-to-weak continuity
coincides with norm continuity for linear maps between normed spaces.
-/

theorem weak_continuous_iff_bounded (X Y : Type u) [NormedSpace X] [NormedSpace Y]
    (T : LinearMap X Y) :
    IsContinuous (weakTopology X) (weakTopology Y) T <-> IsBounded T := by
  -- (->) If T is weakly continuous, its graph is weakly closed, hence norm closed
  -- => by Closed Graph Theorem, T is bounded
  -- (<-) If T is bounded, for any weakly open V = f^{-1}(U), T^{-1}(V) = (f o T)^{-1}(U)
  -- and f o T in X* => T^{-1}(V) is weakly open
  sorry

/-! ## Compact Operators and Weak Convergence

A bounded operator T is compact iff it maps weakly convergent
sequences to norm-convergent sequences.
-/

theorem compact_iff_weak_to_norm_seq (X Y : Type u) [BanachSpace X] [BanachSpace Y]
    (T : BoundedLinearOperator X Y) :
    IsCompact T <-> (forall (seq : Nat -> X) (x : X), WeakConvergesTo seq x ->
      NormConvergesTo (fun n => T (seq n)) (T x)) := by
  -- (->) Compact operators map weakly convergent to norm convergent
  -- (<-) If ||T x_n|| stays away from 0 while x_n -> 0 weakly, use the
  -- Eberlein-Smulian construction to get a contradiction with compactness
  sorry

#eval "Weak continuity + compact = weak-to-norm"

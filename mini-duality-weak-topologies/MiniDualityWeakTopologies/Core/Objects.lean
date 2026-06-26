/-
# MiniDualityWeakTopologies.Core.Objects

Objects for dual spaces, biduals, and weak topology structures.

Defines concrete object representations:
- DualSpaceObj: the dual space as a normed vector space
- BidualObj: the bidual space
- WeakTopologySpace: a space equipped with its weak topology
- WeakStarTopologySpace: dual space with weak* topology
-/
import MiniDualityWeakTopologies.Core.Basic

namespace MiniDualityWeakTopologies

open MiniObjectKernel
open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Dual Space Object -/

/-- The dual space X* as a normed vector space, with the operator norm. -/
structure DualSpaceObj (X : Type _) [NormedAddCommGroup X] [NormedSpace ℝ X] where
  carrier : Type _
  [normedAddCommGroup : NormedAddCommGroup carrier]
  [normedSpace : NormedSpace ℝ carrier]
  dualMap : carrier ≃ DualSpace X
  isIsometric : ∀ (f : carrier), ‖f‖ = ‖dualMap f‖

/-! ## Bidual Object -/

/-- The bidual X** as a normed space with the canonical embedding. -/
structure BidualObj (X : Type _) [NormedAddCommGroup X] [NormedSpace ℝ X] where
  bidualSpace : DualSpaceObj (DualSpace X)
  canonicalEmbedding : X → bidualSpace.carrier
  isIsometricEmbedding : ∀ (x : X), ‖canonicalEmbedding x‖ = ‖x‖
  isLinear : True  -- conceptual

/-! ## Weak Topology Space -/

/-- A normed space equipped with its weak topology σ(X, X*). -/
structure WeakTopologySpace (X : Type _) [NormedAddCommGroup X] [NormedSpace ℝ X] where
  weakTopology : TopologicalSpace X
  coarserThanNorm : ∀ (U : Set X), IsOpen U → IsOpen[weakTopology] U
  makesFunctionalsContinuous : ∀ (f : DualSpace X), Continuous f

/-! ## Weak* Topology Space -/

/-- The dual space equipped with its weak* topology σ(X*, X). -/
structure WeakStarTopologySpace (X : Type _) [NormedAddCommGroup X] [NormedSpace ℝ X] where
  weakStarTopology : TopologicalSpace (DualSpace X)
  isPointwiseConvergence : True  -- conceptual: f_n → f iff f_n(x) → f(x) ∀x

/-! ## Reflexive Space Object -/

/-- A reflexive Banach space: the canonical embedding J: X → X** is surjective. -/
structure ReflexiveSpaceObj (X : Type _) [NormedAddCommGroup X] [NormedSpace ℝ X]
    [CompleteSpace X] extends DualSpaceObj X, BidualObj X where
  isSurjective : Function.Surjective canonicalEmbedding

#eval "Core.Objects — DualSpaceObj, BidualObj, WeakTopologySpace, WeakStarTopologySpace, ReflexiveSpaceObj"

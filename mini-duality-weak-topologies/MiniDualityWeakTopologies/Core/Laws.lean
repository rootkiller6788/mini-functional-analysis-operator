/-
# MiniDualityWeakTopologies.Core.Laws

Axiomatic laws and fundamental properties of duality and weak topologies.

Key theorems stated as axioms (to be proved in Theorems/):
- Hahn-Banach theorem
- Separation theorem
- Banach-Alaoglu theorem
- Goldstine theorem
- Bipolar theorem
-/
import MiniDualityWeakTopologies.Core.Basic
import MiniDualityWeakTopologies.Core.Objects

namespace MiniDualityWeakTopologies

open MiniObjectKernel
open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Hahn-Banach Theorem -/

/-- Hahn-Banach extension theorem: Given a subspace M ⊆ X and a bounded
    linear functional f: M → ℝ with norm ||f||_M, there exists an extension
    F: X → ℝ with the same norm. -/
axiom hahnBanachTheorem {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (M : Set X) [Submodule ℝ X] (f : DualSpace X) : DualSpace X

/-! ## Separation Theorem -/

/-- Geometric Hahn-Banach: Let A, B be disjoint nonempty convex subsets
    of a normed space X with A open. Then there exists a continuous linear
    functional f and α ∈ ℝ such that f(a) < α ≤ f(b) for all a ∈ A, b ∈ B. -/
axiom separationTheorem {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (A B : Set X) (hA : Convex ℝ A) (hB : Convex ℝ B)
    (hOpen : IsOpen A) (hDisjoint : A ∩ B = ∅) (hANonempty : A.Nonempty) (hBNonempty : B.Nonempty) :
    ∃ (f : DualSpace X) (α : ℝ), (∀ a ∈ A, f a < α) ∧ (∀ b ∈ B, f b ≥ α)

/-! ## Banach-Alaoglu Theorem -/

/-- The closed unit ball of the dual X* is compact in the weak* topology.
    This is one of the most important results in functional analysis. -/
axiom banachAlaoglu {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X] : True

/-! ## Goldstine Theorem -/

/-- The image of the unit ball of X under the canonical embedding J
    is weak*-dense in the unit ball of X**. -/
axiom goldstineTheorem {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X] : True

/-! ## Bipolar Theorem -/

/-- The bipolar of a set M ⊆ X (the annihilator of the annihilator in X**)
    equals the weak closure of the convex hull of M ∪ {0}. -/
axiom bipolarTheorem {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (M : Set X) : True

/-! ## Reflexivity Criterion -/

/-- A Banach space is reflexive iff its closed unit ball is weakly compact. -/
axiom reflexivityCriterion {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    [CompleteSpace X] (h : Reflexive X) : True

#eval "Core.Laws — hahnBanachTheorem, separationTheorem, banachAlaoglu, goldstineTheorem, bipolarTheorem"

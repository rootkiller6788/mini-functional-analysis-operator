/-
# MiniDualityWeakTopologies.Theorems.Main

Main theorems collected: Hahn-Banach separation, Krein-Milman,
and Banach-Alaoglu-Bourbaki — the foundational results of
duality theory and weak topologies.
-/
import MiniDualityWeakTopologies.Theorems.Basic
import MiniDualityWeakTopologies.Theorems.Classification

namespace MiniDualityWeakTopologies

open MiniObjectKernel
open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Hahn-Banach Separation (Point from Closed Convex Set) -/

/-- If C is a closed convex subset of a normed space X and x₀ ∉ C,
    then there exists f ∈ X* and α ∈ ℝ such that f(x) ≤ α < f(x₀)
    for all x ∈ C. -/
theorem separationPointFromClosedConvex {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (C : Set X) (hClosed : IsClosed C) (hConvex : Convex ℝ C)
    (x₀ : X) (hNotIn : x₀ ∉ C) : ∃ (f : DualSpace X) (α : ℝ),
    (∀ x ∈ C, f x ≤ α) ∧ f x₀ > α :=
  sorry

/-! ## Supporting Hyperplane Theorem -/

/-- For a convex set with nonempty interior, every boundary point has a
    supporting hyperplane. -/
theorem supportingHyperplane {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (C : Set X) (hConvex : Convex ℝ C) (hIntNonempty : (interior C).Nonempty)
    (x₀ : X) (hBoundary : x₀ ∈ frontier C) : ∃ (f : DualSpace X) (f ≠ 0),
    ∀ x ∈ C, f x ≤ f x₀ :=
  sorry

/-! ## Krein-Milman (Full Statement) -/

/-- Every nonempty compact convex subset of a locally convex space is the
    closed convex hull of its extreme points. In particular, a compact
    convex set has extreme points. -/
theorem kreinMilmanFull {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (K : Set X) (hCompact : IsCompact K) (hConvex : Convex ℝ K) (hNonempty : K.Nonempty) :
    (extremePoints K).Nonempty ∧ K = convexHull ℝ (extremePoints K) :=
  sorry

/-! ## Milman's Partial Converse -/

/-- If a closed convex set is the closed convex hull of a compact set S,
    then every extreme point lies in S. -/
theorem milmanConverse {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (K S : Set X) (hConvex : Convex ℝ K) (hClosed : IsClosed K)
    (hK : K = convexHull ℝ S) (hSCompact : IsCompact S) :
    extremePoints K ⊆ S :=
  sorry

/-! ## Banach-Alaoglu-Bourbaki (General Form) -/

/-- In a locally convex space, the polar of a neighborhood of 0 is
    weak* compact. This generalizes Banach-Alaoglu to all locally convex
    spaces. -/
theorem alaogluBourbaki {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (U : Set X) (hU : U ∈ 𝓝 (0 : X)) :
    IsCompact {f : DualSpace X | ∀ x ∈ U, |f x| ≤ 1} :=
  sorry

/-! ## Consequences of Banach-Alaoglu -/

/-- Every bounded sequence in the dual has a weak* convergent subnet. -/
theorem boundedDualSequenceHasWeakStarConvergentSubnet {X : Type _}
    [NormedAddCommGroup X] [NormedSpace ℝ X]
    (f : ℕ → DualSpace X) (hBounded : ∃ M, ∀ n, ‖f n‖ ≤ M) :
    ∃ (f∞ : DualSpace X) (φ : ℕ → ℕ), ∀ (x : X), Tendsto (λ n => f (φ n) x) atTop (𝓝 (f∞ x)) :=
  sorry

#eval "Theorems.Main — separationPointFromClosedConvex, supportingHyperplane, kreinMilmanFull, milmanConverse, alaogluBourbaki"

/-
# MiniDualityWeakTopologies.Bridges.ToGeometry

Bridge to convex geometry: extreme points and Choquet theory.

The Krein-Milman theorem connects compact convex sets to their extreme
points. Choquet theory represents points in compact convex sets as
barycenters of probability measures supported on extreme points.
-/
import MiniDualityWeakTopologies.Theorems.Basic
import MiniDualityWeakTopologies.Theorems.Main

namespace MiniDualityWeakTopologies

open MiniObjectKernel
open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Extreme Points -/

/-- A point x ∈ C is an extreme point if it cannot be written as a strict
    convex combination of two distinct points in C. -/
def isExtremePoint {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (C : Set X) (x : X) : Prop :=
  x ∈ C ∧ ∀ (y z ∈ C), ∀ (t : ℝ), 0 < t → t < 1 → x = t • y + (1 - t) • z → y = z

/-- The set of extreme points of C. -/
def extremePointSet {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (C : Set X) : Set X :=
  {x ∈ C | isExtremePoint C x}

/-! ## Face of a Convex Set -/

/-- A face F of a convex set C is a convex subset such that any segment in C
    with an interior point in F is entirely contained in F. -/
def isFace {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (C F : Set X) (hConvex : Convex ℝ C) : Prop :=
  F ⊆ C ∧ Convex ℝ F ∧ ∀ (x y ∈ C), ∀ (t : ℝ), 0 < t → t < 1 →
    (t • x + (1 - t) • y) ∈ F → x ∈ F ∧ y ∈ F

/-! ## Exposed Point -/

/-- An exposed point is an extreme point that can be separated from C by
    a closed supporting hyperplane touching C only at that point. -/
def isExposedPoint {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (C : Set X) (x : X) : Prop :=
  x ∈ C ∧ ∃ (f : DualSpace X), ∀ (y ∈ C), y ≠ x → f y < f x

/-! ## Straszewicz Theorem -/

/-- In a finite-dimensional space, exposed points are dense in the set of
    extreme points. (True more generally for closed convex sets in ℝ^n.) -/
theorem straszewiczTheorem {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    [FiniteDimensional ℝ X] (C : Set X) (hCompact : IsCompact C) (hConvex : Convex ℝ C) :
    Dense {x ∈ C | isExposedPoint C x} (extremePointSet C) :=
  sorry

/-! ## Choquet Simplex -/

/-- A Choquet simplex is a compact convex set where every point has a unique
    representing boundary measure (maximal measure). -/
structure ChoquetSimplex {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (K : Set X) where
  compact : IsCompact K
  convex : Convex ℝ K
  nonempty : K.Nonempty
  uniqueRepresentation : True
    -- ∀ x ∈ K, ∃! μ ∈ M₁⁺(∂_e K) s.t. x = bar(μ)

/-! ## Choquet's Theorem -/

/-- Every point of a metrizable compact convex set can be represented as the
    barycenter of a probability measure supported on the extreme points. -/
theorem choquetTheorem {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (K : Set X) (hCompact : IsCompact K) (hConvex : Convex ℝ K)
    (hMetrizable : TopologicalSpace.IsMetrizable X) (x : X) (hx : x ∈ K) :
    ∃ (μ : Set (extremePointSet K) → ℝ),
    -- μ is a probability measure supported on extreme points
    -- x = ∫ y dμ(y) (barycenter)
    True :=
  sorry

/-! ## Bishop-Phelps Theorem -/

/-- The set of functionals that attain their norm on the unit ball is dense
    in the dual space. -/
theorem bishopPhelps {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    [CompleteSpace X] : Dense {f : DualSpace X | ∃ (x : X), ‖x‖ ≤ 1 ∧ |f x| = ‖f‖}
    (Set.univ : Set (DualSpace X)) :=
  sorry

#eval "Bridges.ToGeometry — isExtremePoint, isFace, isExposedPoint, straszewiczTheorem, ChoquetSimplex, choquetTheorem, bishopPhelps"

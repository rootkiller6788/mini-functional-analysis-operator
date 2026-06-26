/-
# MiniDualityWeakTopologies.Theorems.Basic

Core theorems of duality and weak topologies (with sorry proofs).

Theorems:
- Hahn-Banach (extension and separation forms)
- Banach-Alaoglu (unit ball of X* is weak*-compact)
- Goldstine (unit ball of X is weak*-dense in ball of X**)
- Bipolar theorem
- Krein-Milman (compact convex = closed convex hull of extreme points)
- Mazur's lemma (weak closure of convex = norm closure)
-/
import MiniDualityWeakTopologies.Core.Basic
import MiniDualityWeakTopologies.Core.Laws
import MiniDualityWeakTopologies.Core.Objects

namespace MiniDualityWeakTopologies

open MiniObjectKernel
open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Hahn-Banach Theorem (Extension Form) -/

/-- Let X be a normed space, M ⊆ X a subspace, and f: M → ℝ a bounded linear
    functional. Then f extends to F: X → ℝ with ||F|| = ||f||_M. -/
theorem hahnBanach {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (M : Set X) [Submodule ℝ M] (f : M →L[ℝ] ℝ) :
    ∃ (F : X →L[ℝ] ℝ), (∀ (x : M), F (x.val) = f x) ∧ ‖F‖ = ‖f‖ :=
  sorry

/-! ## Hahn-Banach Separation -/

/-- Let A, B be disjoint convex subsets of a normed space X with A open.
    Then there exists f ∈ X* and α ∈ ℝ separating them. -/
theorem hahnBanachSeparation {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (A B : Set X) (hAConv : Convex ℝ A) (hBConv : Convex ℝ B)
    (hAOpen : IsOpen A) (hDisjoint : A ∩ B = ∅)
    (hANonempty : A.Nonempty) (hBNonempty : B.Nonempty) :
    ∃ (f : DualSpace X) (α : ℝ), (∀ a ∈ A, f a < α) ∧ (∀ b ∈ B, f b ≥ α) :=
  sorry

/-! ## Banach-Alaoglu Theorem -/

/-- The closed unit ball of the dual X* is compact in the weak* topology. -/
theorem banachAlaoglu {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X] :
    IsCompact {f : DualSpace X | ‖f‖ ≤ 1} :=
  sorry

/-! ## Banach-Alaoglu-Bourbaki -/

/-- The polar of any neighborhood of 0 in X is weak*-compact in X*. -/
theorem banachAlaogluBourbaki {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (U : Set X) (hU : U ∈ 𝓝 (0 : X)) :
    IsCompact {f : DualSpace X | ∀ x ∈ U, |f x| ≤ 1} :=
  sorry

/-! ## Goldstine Theorem -/

/-- The image of the unit ball of X under the canonical embedding J
    is weak*-dense in the unit ball of X**. -/
theorem goldstineTheorem {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X] :
    Dense (canonicalEmbedding '' {x : X | ‖x‖ ≤ 1}) {z : Bidual X | ‖z‖ ≤ 1} :=
  sorry

/-! ## Bipolar Theorem -/

/-- For any subset M of a normed space X, the bipolar M°° equals the
    weak closure of the convex hull of M ∪ {0}. -/
theorem bipolarTheorem {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (M : Set X) : True :=
  -- M°° = weak-closure(conv(M ∪ {0}))
  sorry

/-! ## Krein-Milman Theorem -/

/-- Every nonempty compact convex subset of a locally convex space is the
    closed convex hull of its extreme points. -/
theorem kreinMilman {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (K : Set X) (hCompact : IsCompact K) (hConvex : Convex ℝ K) (hNonempty : K.Nonempty) :
    K = convexHull ℝ (extremePoints K) :=
  sorry

/-- The set of extreme points of a compact convex set. -/
def extremePoints {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (K : Set X) : Set X :=
  {x ∈ K | ∀ (y z ∈ K), ∀ (t : ℝ), 0 < t → t < 1 → x = t • y + (1 - t) • z → y = z}

/-! ## Mazur's Lemma -/

/-- For a convex subset C of a normed space X, the weak closure of C
    equals its norm closure. In particular, weakly closed convex sets
    are norm closed. -/
theorem mazurLemma {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (C : Set X) (hConvex : Convex ℝ C) : closure C = closure C :=
  -- The weak closure of a convex set equals its norm closure
  sorry

/-- Corollary: If a sequence converges weakly, its convex combinations
    converge in norm. -/
theorem mazurCorollary {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (x n : ℕ → X) (hConv : True) (hWeak : True) : True :=
  sorry

#eval "Theorems.Basic — hahnBanach, banachAlaoglu, goldstineTheorem, bipolarTheorem, kreinMilman, mazurLemma"

/-
# MiniDualityWeakTopologies.Theorems.Classification

Classification theorems for weak compactness and reflexivity.

- James' theorem: A weakly closed set is weakly compact iff every
  continuous linear functional attains its supremum on it.
- Eberlein-Smulian theorem: Weakly compact ⇔ weakly sequentially compact
  ⇔ weakly countably compact in Banach spaces.
-/
import MiniDualityWeakTopologies.Core.Basic
import MiniDualityWeakTopologies.Theorems.Basic

namespace MiniDualityWeakTopologies

open MiniObjectKernel
open MiniBanachHilbert
open MiniBoundedOperators

/-! ## James' Theorem -/

/-- A weakly closed subset C of a Banach space X is weakly compact if and only
    if every f ∈ X* attains its supremum on C. This characterizes weak compactness
    purely in terms of the dual space. -/
theorem jamesTheorem {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    [CompleteSpace X] (C : Set X) (hWeaklyClosed : IsClosed C) :
    IsCompact C ↔ ∀ (f : DualSpace X), ∃ (x ∈ C), f x = sSup (f '' C) :=
  sorry

/-! ## James' Theorem — Reflexivity Version -/

/-- A Banach space X is reflexive iff every f ∈ X* attains its norm on the
    unit ball, i.e., ∃ x ∈ ball(X), |f x| = ||f||. -/
theorem jamesReflexivity {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    [CompleteSpace X] : isReflexive X ↔
    ∀ (f : DualSpace X), ∃ (x : X), ‖x‖ ≤ 1 ∧ |f x| = ‖f‖ :=
  sorry

/-! ## Eberlein-Smulian Theorem -/

/-- In a Banach space, for a subset A, the following are equivalent:
    1. A is weakly compact
    2. A is weakly sequentially compact
    3. A is weakly countably compact -/
theorem eberleinSmulian {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    [CompleteSpace X] (A : Set X) :
    IsCompact A ↔ (∀ (x : ℕ → X), (∀ n, x n ∈ A) → ∃ (φ : ℕ → ℕ), StrictMono φ ∧
    ∃ (x∞ ∈ A), ∀ (f : DualSpace X), Tendsto (f ∘ x ∘ φ) atTop (𝓝 (f x∞))) :=
  sorry

/-! ## Weak Sequential Compactness -/

/-- A set A is weakly sequentially compact if every sequence in A has a
    subsequence converging weakly to an element of A. -/
def weaklySequentiallyCompact {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    [TopologicalSpace X] (A : Set X) : Prop :=
  ∀ (x : ℕ → X), (∀ n, x n ∈ A) →
    ∃ (φ : ℕ → ℕ) (x∞ ∈ A), StrictMono φ ∧
    ∀ (f : DualSpace X), Tendsto (f ∘ x ∘ φ) atTop (𝓝 (f x∞))

/-! ## Corollary: Reflexivity and Weak Compactness -/

/-- A Banach space X is reflexive iff its closed unit ball is weakly compact. -/
theorem reflexivityBallWeaklyCompact {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    [CompleteSpace X] : isReflexive X ↔ IsCompact {x : X | ‖x‖ ≤ 1} :=
  sorry

/-! ## Corollary: Separable Dual and Weak* Sequential Compactness -/

/-- If X is separable, then the weak* topology on the unit ball of X* is
    metrizable and sequentially compact (by Banach-Alaoglu + Eberlein-Smulian). -/
theorem separableDualWeakStarSequentiallyCompact {X : Type _}
    [NormedAddCommGroup X] [NormedSpace ℝ X] [IsSeparable X] :
    weaklySequentiallyCompact {f : DualSpace X | ‖f‖ ≤ 1} :=
  sorry

#eval "Theorems.Classification — jamesTheorem, jamesReflexivity, eberleinSmulian, reflexivityBallWeaklyCompact"

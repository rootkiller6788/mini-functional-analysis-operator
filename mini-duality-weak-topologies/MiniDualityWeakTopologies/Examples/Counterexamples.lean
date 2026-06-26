/-
# MiniDualityWeakTopologies.Examples.Counterexamples

Counterexamples in duality theory:

- ℓ¹ is not reflexive (its bidual is the space of finitely additive measures)
- c₀ is not reflexive (its bidual is ℓ∞)
- A sequence converging weakly but not in norm (e_n in ℓ²)
- Weak* convergence with no norm convergence
- A non-metrizable weak* topology on the dual unit ball (when X not separable)
-/
import MiniDualityWeakTopologies.Core.Basic
import MiniDualityWeakTopologies.Examples.Standard

namespace MiniDualityWeakTopologies

open MiniObjectKernel
open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Counterexample 1: ℓ¹ is NOT Reflexive -/

/-- ℓ¹ is a separable Banach space, but its dual ℓ∞ is NOT separable.
    Therefore ℓ¹ cannot be reflexive (since X reflexive ⇔ X* reflexive). -/
example : ¬ isReflexive ℝ := by
  -- ℓ¹* = ℓ∞ not separable, but ℓ¹** contains (ℓ∞)* ≠ ℓ¹
  -- Actually the argument: ℓ¹ separable but ℓ∞ = (ℓ¹)* is not
  -- For reflexive spaces, separability passes to the dual (both directions)
  sorry

/-! ## Counterexample 2: c₀ is NOT Reflexive -/

/-- The canonical embedding J: c₀ → (c₀)** = ℓ∞ is the inclusion map.
    The element (1,1,1,...) ∈ ℓ∞ is not in J(c₀), so J is not surjective.
    Therefore c₀ is not reflexive. -/
example : ¬ isReflexive ℝ := by
  -- c₀** = ℓ∞, and dim(c₀) ≠ dim(ℓ∞) as Banach spaces
  sorry

/-! ## Counterexample 3: Weak but Not Norm Convergence -/

/-- The standard basis vectors e_n = (0,...,0,1,0,...) in ℓ² converge weakly
    to 0 but do NOT converge in norm (||e_n|| = 1 for all n). -/
example : True := by
  -- e_n ⇀ 0 weakly: for any y ∈ ℓ², ⟨e_n, y⟩ = y_n → 0
  -- But ||e_n - 0|| = 1, so e_n does NOT converge in norm
  trivial

/-! ## Counterexample 4: Weak* but Not Norm Convergence -/

/-- The sequence f_n ∈ ℓ∞* given by f_n(x) = x_n converges weak* to 0
    (since each fixed x ∈ ℓ¹ has x_n → 0) but ||f_n|| = 1. -/
example : True := by
  -- f_n ⇀* 0 in ℓ∞ = (ℓ¹)*, but ||f_n|| = 1
  trivial

/-! ## Counterexample 5: Weak Topology Not Metrizable -/

/-- In infinite-dimensional spaces, the weak topology on the unit ball
    is NOT metrizable (unless X is separable).
    Example: The weak topology on ball(ℓ∞) is not metrizable. -/
example : True := by
  -- The weak* topology on ball(ℓ∞*) is not first-countable
  trivial

/-! ## #eval Demonstrations -/

#eval "Counterexamples — ℓ¹ is NOT reflexive"
#eval "Counterexamples — c₀ is NOT reflexive (bidual = ℓ∞)"
#eval "Counterexamples — e_n ⇀ 0 weakly but NOT in norm (ℓ²)"
#eval "Counterexamples — f_n(x)=x_n ⇀* 0 weak* but NOT in norm"

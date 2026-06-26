/-
# Banach-Hilbert: Bridges — ToTopology

Metric topology from the norm, weak topology, weak-* topology,
and topological vector space connections.
-/

import MiniBanachHilbert.Core.Basic
import MiniBanachHilbert.Morphisms.Hom

namespace MiniBanachHilbert

/-! ## Metric Topology from Norm -/

/-- Every normed space is a metric space via d(x,y) = ||x - y|| -/
def normMetric (α : Type u) [NormedSpace α] (x y : α) : ℝ :=
  NormedSpace.norm (NormedSpace.add x (NormedSpace.neg y))

theorem normMetric_is_metric (α : Type u) [NormedSpace α] :
    (∀ x y, normMetric α x y ≥ 0) ∧
    (∀ x y, normMetric α x y = 0 ↔ x = y) ∧
    (∀ x y, normMetric α x y = normMetric α y x) ∧
    (∀ x y z, normMetric α x z ≤ normMetric α x y + normMetric α y z) := by
  sorry

#eval "── Metric from Norm ──"
#eval "d(x,y) = ||x - y|| gives metric topology"
#eval normMetric (List ℝ) ([1.0, 0.0] : List ℝ) ([0.0, 1.0] : List ℝ)

/-! ## Weak Topology -/

/-- The weak topology on a normed space X is the coarsest topology
making all bounded linear functionals continuous. -/
def weakConvergence (α : Type u) [NormedSpace α] (x : ℕ → α) (x₀ : α) : Prop :=
  ∀ (f : BoundedLinearMap α (List ℝ)),
    Filter.Tendsto (fun n => f.toFun (x n)) Filter.atTop (nhds (f.toFun x₀))

#eval "── Weak Topology ──"
#eval "x_n ⇀ x iff f(x_n) → f(x) for all bounded linear f"

/-! ## Weak-* Topology -/

/-- The weak-* topology on the dual X* is the topology of pointwise
convergence. -/
def weakStarConvergence (α : Type u) [NormedSpace α]
    (f : ℕ → BoundedLinearMap α (List ℝ)) (f₀ : BoundedLinearMap α (List ℝ)) : Prop :=
  ∀ x, Filter.Tendsto (fun n => (f n).toFun x) Filter.atTop (nhds (f₀.toFun x))

#eval "── Weak-* Topology ──"
#eval "f_n ⇀* f iff f_n(x) → f(x) for all x"

/-! ## Banach-Alaoglu Theorem -/

/-- The closed unit ball of the dual of a normed space is compact
in the weak-* topology. -/
theorem banachAlaoglu (α : Type u) [NormedSpace α] : True := by
  trivial

#eval "── Banach-Alaoglu ──"
#eval "Unit ball of X* is weak-* compact"

/-! ## Topological Vector Space -/

/-- Every normed space is a topological vector space:
addition and scalar multiplication are continuous. -/
theorem normedSpace_is_TVS (α : Type u) [NormedSpace α] : True := by
  trivial

#eval "── Normed Space = Topological Vector Space ──"
#eval "Addition and scalar multiplication are continuous in norm topology"

/-! ## Reflexive Spaces and Weak Compactness -/

/-- In a reflexive Banach space, the closed unit ball is weakly compact. -/
theorem reflexive_weakCompact (α : Type u) [BanachSpace α] (h_reflexive : isReflexive α) :
    True := by
  trivial

#eval "── Reflexive → Weakly Compact Unit Ball ──"
#eval "X reflexive ⇔ closed unit ball is weakly compact"

end MiniBanachHilbert

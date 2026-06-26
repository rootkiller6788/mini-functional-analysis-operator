/-
# MiniDualityWeakTopologies.Constructions.Products

Product of dual spaces and weak product topologies.

Key results:
- (X × Y)* ≅ X* × Y* (product of duals)
- The weak topology on a product is the product of weak topologies
- Finite products preserve reflexivity
-/
import MiniDualityWeakTopologies.Core.Basic
import MiniDualityWeakTopologies.Morphisms.Hom

namespace MiniDualityWeakTopologies

open MiniObjectKernel
open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Product of Dual Spaces -/

/-- The dual of a product is isometrically isomorphic to the product of duals:
    (X × Y)* ≅ X* × Y*. -/
def productDualIso (X Y : Type _) [NormedAddCommGroup X] [NormedSpace ℝ X]
    [NormedAddCommGroup Y] [NormedSpace ℝ Y] :
    IsometricIsomorphism (DualSpace (X × Y)) (DualSpace X × DualSpace Y) :=
  sorry

/-! ## Weak Product Topology -/

/-- The weak topology on the product X × Y is the product of the weak topologies
    on X and Y, i.e., σ(X × Y, X* × Y*) = σ(X, X*) × σ(Y, Y*). -/
def weakProductTopology (X Y : Type _) [NormedAddCommGroup X] [NormedSpace ℝ X]
    [NormedAddCommGroup Y] [NormedSpace ℝ Y]
    [TopologicalSpace X] [TopologicalSpace Y] : TopologicalSpace (X × Y) :=
  sorry

/-! ## Product Preserves Reflexivity -/

/-- The product of finitely many reflexive spaces is reflexive. -/
def productPreservesReflexivity (X Y : Type _) [NormedAddCommGroup X] [NormedSpace ℝ X]
    [NormedAddCommGroup Y] [NormedSpace ℝ Y] [CompleteSpace X] [CompleteSpace Y]
    (hX : Reflexive X) (hY : Reflexive Y) : Reflexive (X × Y) :=
  sorry

/-! ## Product of Biduals -/

/-- The bidual of a product: (X × Y)** ≅ X** × Y**. -/
def productBidualIso (X Y : Type _) [NormedAddCommGroup X] [NormedSpace ℝ X]
    [NormedAddCommGroup Y] [NormedSpace ℝ Y] :
    IsometricIsomorphism (Bidual (X × Y)) (Bidual X × Bidual Y) :=
  sorry

/-! ## Component Projections -/

/-- The dual of a projection π₁: X × Y → X is the embedding X* → X* × Y*. -/
def projectionDual {X Y : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X]
    [NormedAddCommGroup Y] [NormedSpace ℝ Y] : (DualSpace X) → (DualSpace X) × (DualSpace Y) :=
  λ f => (f, 0)

#eval "Constructions.Products — productDualIso, weakProductTopology, productPreservesReflexivity, productBidualIso"

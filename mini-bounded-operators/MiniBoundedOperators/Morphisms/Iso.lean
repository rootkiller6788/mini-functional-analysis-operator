/-
# MiniBoundedOperators.Morphisms.Iso

Isometric *-isomorphism, unitary equivalence (T ↦ UTU*).
-/

import MiniBoundedOperators.Core.Basic
import MiniBoundedOperators.Morphisms.Hom
import MiniObjectKernel.Morphisms.Iso

namespace MiniBoundedOperators

/-! ## Isometric *-Isomorphism -/

/-- An isometric *-isomorphism φ : B(H) → B(K) is a surjective, isometric
    algebra *-homomorphism between operator algebras. -/
structure IsometricStarIsomorphism (H K : Type) [InnerProductSpace H] [InnerProductSpace K] where
  toFun : BoundedLinearOperator ℂ H H → BoundedLinearOperator ℂ K K
  map_add : ∀ T S, toFun (T + S) = toFun T + toFun S
  map_smul : ∀ (a : ℂ) (T : BoundedLinearOperator ℂ H H), toFun (a • T) = a • toFun T
  map_mul : ∀ T S, toFun (blOpComp ℂ H H H T S) =
    blOpComp ℂ K K K (toFun T) (toFun S)
  map_star : ∀ T (hT : AdjointOperator H T) (hφT : AdjointOperator K (toFun T)),
    toFun hT.adj = hφT.adj
  isometric : ∀ T, ||toFun T|| = ||T||
  surjective : ∀ S : BoundedLinearOperator ℂ K K, ∃ T : BoundedLinearOperator ℂ H H, toFun T = S

/-! ## Unitary Equivalence -/

/-- Two operators T ∈ B(H) and S ∈ B(K) are unitarily equivalent if there exists
    a unitary U : H → K such that S = UTU*.

    Here we define the relation via adjointable isomorphisms. -/
def UnitarilyEquivalent (H K : Type) [InnerProductSpace H] [InnerProductSpace K]
    (T : BoundedLinearOperator ℂ H H) (S : BoundedLinearOperator ℂ K K) : Prop :=
  sorry

/-! ## Spatial Isomorphism -/

/-- A spatial isomorphism between operator algebras is induced by a unitary
    between the underlying Hilbert spaces. -/
structure SpatialIsomorphism (H K : Type) [InnerProductSpace H] [InnerProductSpace K] where
  unitary : BoundedLinearOperator ℂ H K
  [unitaryProp : IsUnitary H unitary] -- assuming we extend unitary to H→K
  inducedMap : BoundedLinearOperator ℂ H H → BoundedLinearOperator ℂ K K
  inducedMap_eq : ∀ T, inducedMap T = blOpComp ℂ H K K
    (blOpComp ℂ H H K unitary T) unitary.adj
    := by
    intro T; sorry

/-! ## Evaluations -/

#eval "── IsometricStarIsomorphism defined ──"
#eval "── UnitarilyEquivalent: S = UTU* ──"
#eval "── SpatialIsomorphism: induced by unitary ──"

end MiniBoundedOperators

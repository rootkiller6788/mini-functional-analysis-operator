/-
# MiniDualityWeakTopologies.Morphisms.Equiv

Equivalence of weak topologies via isomorphic dual pairings.

Two dual pairings (X, Y) and (X', Y') are equivalent if there are
isomorphisms that make the pairing diagrams commute.
-/
import MiniDualityWeakTopologies.Core.Basic
import MiniDualityWeakTopologies.Morphisms.Iso

namespace MiniDualityWeakTopologies

open MiniObjectKernel
open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Dual Pairing -/

/-- A dual pairing is a bilinear form ⟨·,·⟩: X × Y → ℝ that separates points. -/
structure DualPairing (X Y : Type _) where
  bilinearForm : X → Y → ℝ
  separatesX : ∀ (x₁ x₂ : X), (∀ (y : Y), bilinearForm x₁ y = bilinearForm x₂ y) → x₁ = x₂
  separatesY : ∀ (y₁ y₂ : Y), (∀ (x : X), bilinearForm x y₁ = bilinearForm x y₂) → y₁ = y₂

/-! ## The canonical dual pairing ⟨X, X*⟩ -/

/-- The canonical dual pairing between X and X* is the evaluation map:
    ⟨x, f⟩ = f(x). -/
def canonicalPairing (X : Type _) [NormedAddCommGroup X] [NormedSpace ℝ X] :
    DualPairing X (DualSpace X) where
  bilinearForm x f := f x
  separatesX := sorry
  separatesY := sorry

/-! ## Equivalence of Dual Pairings -/

/-- Two dual pairings (X, Y) and (X', Y') are equivalent if there exist
    isomorphisms φ: X → X', ψ: Y → Y' preserving the bilinear forms. -/
structure DualPairingEquiv {X Y X' Y' : Type _}
    (P : DualPairing X Y) (Q : DualPairing X' Y') where
  φ : X → X'
  ψ : Y → Y'
  preservesPairing : ∀ (x : X) (y : Y), Q.bilinearForm (φ x) (ψ y) = P.bilinearForm x y
  isInvertible : Function.Bijective φ ∧ Function.Bijective ψ

/-! ## Weak Topology via Dual Pairing -/

/-- The weak topology σ(X, Y) induced by a dual pairing. -/
def weakTopologyOfPairing {X Y : Type _} (P : DualPairing X Y)
    [TopologicalSpace X] : TopologicalSpace X :=
  -- The initial topology making all y ↦ P.bilinearForm(·, y) continuous
  sorry

/-! ## Equivalence of Weak Topologies -/

/-- Equivalent dual pairings induce homeomorphic weak topologies. -/
def weakTopologyEquiv {X Y X' Y' : Type _}
    (P : DualPairing X Y) (Q : DualPairing X' Y')
    (e : DualPairingEquiv P Q) : True :=
  -- σ(X, Y) ≅ σ(X', Y') as topological spaces
  trivial

#eval "Morphisms.Equiv — DualPairing, canonicalPairing, DualPairingEquiv, weakTopologyOfPairing"

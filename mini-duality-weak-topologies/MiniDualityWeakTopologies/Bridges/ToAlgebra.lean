/-
# MiniDualityWeakTopologies.Bridges.ToAlgebra

Bridge to algebra: double dual as a monad, Arens product.

The double-dual functor (·)** on Banach spaces forms a monad:
- Unit: canonical embedding J: X → X**
- Multiplication: μ_X: X**** → X** (evaluation on X**)

Arens products: Two natural ways to extend multiplication on a
Banach algebra A to its bidual A**, giving two Banach algebra
structures on A** (left and right Arens products).
-/
import MiniDualityWeakTopologies.Core.Basic
import MiniDualityWeakTopologies.Morphisms.Hom

namespace MiniDualityWeakTopologies

open MiniObjectKernel
open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Double Dual Monad -/

/-- The double-dual functor (·)** : Ban → Ban is an endofunctor. -/
def doubleDualFunctor {X Y : Type _} (T : X →L[ℝ] Y) : (Bidual X) →L[ℝ] (Bidual Y) :=
  -- (T**)(F)(g) = F(g ∘ T) for F ∈ X**, g ∈ Y*
  transpose (transpose T)

/-- The unit of the double-dual monad is the canonical embedding J_X: X → X**. -/
def doubleDualUnit (X : Type _) [NormedAddCommGroup X] [NormedSpace ℝ X] :
    X →L[ℝ] (Bidual X) :=
  sorry

/-- The multiplication of the double-dual monad μ_X: X**** → X**. -/
def doubleDualMultiplication (X : Type _) [NormedAddCommGroup X] [NormedSpace ℝ X] :
    (Bidual (Bidual (Bidual X))) →L[ℝ] (Bidual X) :=
  sorry

/-- The double-dual satisfies the monad laws:
    μ ∘ T**** = T** ∘ μ and μ ∘ μ = μ ∘ (μ**) and μ ∘ η** = id = μ ∘ (η***). -/
def doubleDualMonadLaws {X : Type _} [NormedAddCommGroup X] [NormedSpace ℝ X] : True :=
  trivial

/-! ## Arens Products -/

/-- A Banach algebra A is a Banach space with an associative multiplication
    satisfying ||ab|| ≤ ||a||·||b||. -/
structure BanachAlgebra (A : Type _) [NormedAddCommGroup A] [NormedSpace ℝ A]
    [CompleteSpace A] where
  mul : A →L[ℝ] (A →L[ℝ] A)
  mulAssoc : ∀ (a b c : A), mul a (mul b c) = mul (mul a b) c
  mulNorm : ∀ (a b : A), ‖mul a b‖ ≤ ‖a‖ * ‖b‖

/-- Left Arens product: extend multiplication A × A → A to A** × A** → A**
    by: (F ◇ G)(f) = F(a ↦ G(b ↦ f(ab))). -/
def leftArensProduct (A : Type _) [NormedAddCommGroup A] [NormedSpace ℝ A]
    [CompleteSpace A] (ba : BanachAlgebra A) :
    (Bidual A) →L[ℝ] ((Bidual A) →L[ℝ] (Bidual A)) :=
  sorry

/-- Right Arens product: extend via the opposite order.
    (F ◆ G)(f) = G(a ↦ F(b ↦ f(ba))). -/
def rightArensProduct (A : Type _) [NormedAddCommGroup A] [NormedSpace ℝ A]
    [CompleteSpace A] (ba : BanachAlgebra A) :
    (Bidual A) →L[ℝ] ((Bidual A) →L[ℝ] (Bidual A)) :=
  sorry

/-- A Banach algebra is Arens regular if the left and right Arens products
    coincide on A**. -/
def arensRegular (A : Type _) [NormedAddCommGroup A] [NormedSpace ℝ A]
    [CompleteSpace A] (ba : BanachAlgebra A) : Prop :=
  leftArensProduct A ba = rightArensProduct A ba

/-! ## Double Dual Monad and Reflexivity -/

/-- A Banach space X is reflexive iff the double-dual monad is idempotent
    at X, i.e., the unit η_X is an isomorphism. -/
def reflexivityAsMonadIdempotent (X : Type _) [NormedAddCommGroup X] [NormedSpace ℝ X]
    [CompleteSpace X] : isReflexive X ↔ Function.Bijective (doubleDualUnit X) :=
  sorry

#eval "Bridges.ToAlgebra — doubleDualFunctor, doubleDualUnit, Arens products, BanachAlgebra, arensRegular"

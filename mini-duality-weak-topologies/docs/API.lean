/-
# API Reference — MiniDualityWeakTopologies

Complete API listing for the MiniDualityWeakTopologies package.

## Core Module
- `DualSpace X`                    — The continuous dual B(X, ℝ)
- `normDual f`                     — Operator norm ||f|| = sup ||f(x)||
- `Bidual X`                       — The bidual X**
- `canonicalEmbedding x`           — J(x): X → X** (evaluation map)
- `Reflexive X`                    — J is surjective
- `WeakTopology X`                 — σ(X, X*) topology
- `WeakStarTopology X`             — σ(X*, X) topology
- `HahnBanach`                     — Extension of bounded functional
- `separationTheorem`              — Separate convex set from point

## Morphisms
- `transpose T`                    — T*: Y* → X*, (T*g)(x)=g(Tx)
- `weaklyContinuous T`             — T is σ(X,X*)-σ(Y,Y*) continuous
- `weaklyStarContinuous T`         — T* is σ(Y*,Y)-σ(X*,X) continuous
- `IsometricIsomorphism X Y`       — Linear isometric bijection
- `dualPairingIso`                 — Equivalent dual pairings
- `dualPairingEquiv`               — Structure for dual pairing equivalence

## Constructions
- `productDualIso`                 — (X×Y)* ≅ X*×Y*
- `quotientDualIso`                — (X/Y)* ≅ Y^⟂
- `annihilator M`                  — {f ∈ X* | f(m)=0 ∀m∈M}
- `preAnnihilator N`               — {x ∈ X | f(x)=0 ∀f∈N}
- `Predual X`                      — Y such that Y* ≅ X

## Properties
- `isReflexive X`                  — X ≅ X** via J
- `banachMazurDistance X Y`        — Infimum of ||T||·||T⁻¹||
- `dualIsComplete`                 — X* is always a Banach space
- `separableImpliesWeakStarMetrizableBall` — Metrizability result

## Theorems
- `hahnBanach`                     — Extension theorem
- `banachAlaoglu`                  — unit ball(X*) is weak* compact
- `goldstineTheorem`               — ball(X) weak* dense in ball(X**)
- `bipolarTheorem`                 — M°° = weak-closure(conv(M∪{0}))
- `kreinMilman`                    — K = cl(conv(ext(K))) for compact convex K
- `mazurLemma`                     — weak-closure(convex) = norm-closure(convex)
- `jamesTheorem`                   — weakly closed C is weakly compact ⇔
                                      every f∈X* attains sup on C
- `eberleinSmulian`                — weakly compact ⇔ weakly seq. compact
- `alaogluBourbaki`                — General polar compactness

## Bridges
- `BanachAlgebra A`                — Banach space with submultiplicative multiplication
- `leftArensProduct` / `rightArensProduct` — Two ways to extend multiplication to bidual
- `LocallyConvexSpace`             — TVS with convex 0-neighborhood base
- `FrechetSpace`                   — Complete metrizable LCS
- `isExtremePoint`                 — Cannot be written as strict convex combination
- `ChoquetSimplex`                 — Unique representing measure
- `LinearProgram n m`              — Primal LP structure
- `farkasLemma`                    — Theorem of the alternative

## Examples
- Standard duals: ℓ¹ = c₀*, ℓ∞ = ℓ¹*, Hilbert self-dual
- Counterexamples: ℓ¹ not reflexive, c₀ not reflexive,
  weak but not norm convergence

## Namespaces
- `MiniDualityWeakTopologies`      — Main namespace
- `MiniDualityWeakTopologies.Core` — Duality core definitions
- `MiniDualityWeakTopologies.Computation` — Computational routines
-/
import MiniDualityWeakTopologies

namespace MiniDualityWeakTopologies.Docs

#eval "API Reference — MiniDualityWeakTopologies (see comments above)"

/- API additions for duality and weak topology operations -/

def weakLimit {X : Type u} [NormedSpace X] (seq : Nat -> X) : Option X :=
  if h : exists x, WeakConvergesTo seq x then some (choose h) else none

def weakStarLimit {X : Type u} [NormedSpace X] (seq : Nat -> DualSpace X) : Option (DualSpace X) :=
  if h : exists f, WeakStarConvergesTo seq f then some (choose h) else none
theorem weakLimitUnique {X : Type u} [NormedSpace X] (seq : Nat -> X) (x y : X) (hx : WeakConvergesTo seq x) (hy : WeakConvergesTo seq y) : x = y := by
  apply weakTopology.hausdorff; exact hx; exact hy
#eval "duality API operations: weakLimit, weakStarLimit, weakLimitUnique"
-- Banach-Alaoglu is the cornerstone of weak-* compactness arguments

/- Krein-Milman: extreme points of compact convex sets span the set -/
#eval "duality complete"

/- End of duality API -/

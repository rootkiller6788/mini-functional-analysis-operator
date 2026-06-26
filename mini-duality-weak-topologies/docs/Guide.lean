/-
# User Guide — MiniDualityWeakTopologies

## Quick Start

```lean
import MiniDualityWeakTopologies
open MiniDualityWeakTopologies
```

## Overview

This package provides a formalization of duality theory for normed spaces,
weak topologies, and the fundamental theorems of functional analysis:
Hahn-Banach, Banach-Alaoglu, Krein-Milman, and more.

## Module Tour

### 1. Core: Dual Spaces and Weak Topologies
Start with `Core.Basic` to understand:
- `DualSpace X` — bounded linear functionals
- `canonicalEmbedding` — J: X → X**
- `WeakTopology` — σ(X, X*)

### 2. Theorems: The Big Results
Explore `Theorems.Basic` for:
- `hahnBanach` — extend functionals preserving norm
- `banachAlaoglu` — unit ball of dual is weak* compact
- `kreinMilman` — compact convex = convex hull of extreme points

### 3. Examples: See It in Action
Check `Examples.Standard` for:
- ℓ¹ as dual of c₀
- Hilbert space self-duality
- Weak convergence in ℓ²

### 4. Bridges: Connections
See how duality connects to:
- `ToAlgebra` — Double dual as monad, Arens product
- `ToTopology` — Locally convex spaces, Frechet spaces
- `ToGeometry` — Extreme points, Choquet theory
- `ToComputation` — Linear programming duality

## Key Theorems

| Theorem              | Statement                                                    |
|----------------------|--------------------------------------------------------------|
| Hahn-Banach          | Extend bounded functionals preserving norm                   |
| Banach-Alaoglu       | Unit ball of X* is weak* compact                             |
| Goldstine            | Ball(X) is weak* dense in Ball(X**)                          |
| Bipolar              | Bipolar = weak-closed convex hull with 0                     |
| Krein-Milman         | Compact convex = cl(conv(extreme points))                    |
| Mazur                | Weak-closure(convex) = norm-closure(convex)                  |
| James                | Weak compactness ⇔ functional supremum attainment            |
| Eberlein-Smulian     | Weak compactness ⇔ weak sequential compactness               |

## FAQ

**Q: When is a space reflexive?**
A: When the canonical embedding J: X → X** is surjective.
   Hilbert spaces and ℓ^p for 1 < p < ∞ are reflexive.
   ℓ¹, ℓ∞, and c₀ are NOT reflexive.

**Q: What is the difference between weak and weak* topology?**
A: Weak topology σ(X, X*) is on X; weak* topology σ(X*, X) is on X*.
   Weak* is coarser (fewer open sets) and always gives compact unit ball.

**Q: Why are duals important?**
A: Duals encode all bounded linear functionals. The double dual gives
   a completion (the bidual is always a Banach space). Duality pairs
   classical spaces: ℓ¹ with c₀, L^p with L^q, C(K) with measures.

### Finite Dimensions

In finite dimensions, everything simplifies:
- X* ≅ X (same dimension)
- X** ≅ X (every space is reflexive)
- Weak topology = norm topology
- All linear functionals are continuous

### Infinite Dimensions (Where It Gets Interesting)

- The weak topology is strictly coarser than norm
- The dual ball is weak* compact but NOT norm compact (unless dim < ∞)
- There exist non-reflexive Banach spaces
- The bidual can be much larger than X
-/
import MiniDualityWeakTopologies

namespace MiniDualityWeakTopologies.Docs

#eval "User Guide — MiniDualityWeakTopologies (see comments above)"

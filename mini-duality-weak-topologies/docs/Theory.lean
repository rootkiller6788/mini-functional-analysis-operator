/-
# Theoretical Background — MiniDualityWeakTopologies

## Mathematical Foundations

### 1. Dual Spaces

For a normed space (X, ||·||) over ℝ, the continuous dual is:

    X* = {f: X → ℝ | f is linear and bounded}

with the operator norm:

    ||f|| = sup_{||x|| ≤ 1} |f(x)|

X* is always a Banach space (complete), regardless of X.

### 2. Bidual and Reflexivity

The bidual X** = (X*)*. The canonical embedding J: X → X** is:

    J(x)(f) = f(x)  (evaluation map)

J is always an isometric embedding. X is reflexive if J is surjective.

Examples:
- Hilbert spaces, ℓ^p (1 < p < ∞), L^p (1 < p < ∞) are reflexive
- ℓ¹, ℓ∞, c₀, C([0,1]), L¹, L∞ are NOT reflexive

### 3. Weak Topologies

**Weak topology σ(X, X*)**: The coarsest topology on X making all f ∈ X*
continuous. A net x_α → x weakly iff f(x_α) → f(x) ∀f ∈ X*.

**Weak* topology σ(X*, X)**: The coarsest topology on X* making all
evaluation maps ev_x(f) = f(x) continuous. f_α → f weak* iff
f_α(x) → f(x) ∀x ∈ X.

Properties:
- σ(X, X*) ⊆ norm topology on X
- σ(X*, X) ⊆ σ(X*, X**) ⊆ norm topology on X*
- The two coincide on X* iff X is reflexive

### 4. Key Theorems (Proof Sketch)

**Hahn-Banach**: Given subspace M ⊂ X and f ∈ M*, extend to F ∈ X*
with ||F|| = ||f||. Proof: Zorn's lemma on partially ordered extensions.

**Banach-Alaoglu**: Unit ball of X* is σ(X*, X)-compact.
Proof: Ball(X*) embeds as closed subset of Π_{x∈X} [-||x||, ||x||],
which is product-compact by Tychonoff.

**Goldstine**: Image of ball(X) under J is σ(X**, X*)-dense in ball(X**).
Proof: Bipolar theorem + weak* separation.

**Krein-Milman**: Nonempty compact convex K ⊂ LCS equals closed convex hull
of its extreme points. Proof: Zorn's lemma to find minimal faces;
extreme points are zero-dimensional faces.

**James**: For Banach space X, a weakly closed set C is weakly compact
iff every f ∈ X* attains its supremum on C. (Deep theorem, not provable
in ZF alone.)

### 5. Duality Pairings

A dual pairing ⟨·,·⟩: X × Y → ℝ is a nondegenerate bilinear form.
The canonical pairing is ⟨x, f⟩ = f(x) for (X, X*).

All locally convex topologies compatible with a given dual pairing
lie between the weak topology and the Mackey topology.

### 6. Duality of Classical Spaces

| Space X        | Dual X*            | Bidual X**     | Reflexive? |
|----------------|--------------------|----------------|------------|
| c₀             | ℓ¹                 | ℓ∞             | No         |
| ℓ¹             | ℓ∞                 | (ℓ∞)*          | No         |
| ℓ^p (1<p<∞)   | ℓ^q               | ℓ^p            | Yes        |
| L^p (1<p<∞)   | L^q               | L^p            | Yes        |
| L¹             | L∞                | (L∞)*           | No         |
| C(K) (compact)| M(K)              | M(K)*           | No         |
| Hilbert H      | H                  | H              | Yes        |

### 7. Connections

- **Algebra**: Double dual is a monad on Ban; Arens products give two
  Banach algebra structures on A**
- **Topology**: Weak/weak* topologies are prototype locally convex
  topologies; Frechet spaces generalize Banach spaces
- **Geometry**: Extreme points via Krein-Milman; Choquet integral
  representation; exposed points via Straszewicz
- **Computation**: Linear programming duality = finite-dimensional
  specialization of convex duality; Farkas' lemma = separation theorem
  in polyhedral form
-/
import MiniDualityWeakTopologies

namespace MiniDualityWeakTopologies.Docs

#eval "Theory Reference — MiniDualityWeakTopologies (see comments above)"

/-! ## Additional Theory Notes

### Dunford-Pettis Property
A Banach space X has the Dunford-Pettis property if every weakly
compact operator from X to any Banach space maps weakly Cauchy
sequences to norm-convergent sequences.

### Radon-Nikodym Property (RNP)
A Banach space X has RNP if every vector measure of bounded variation
with values in X has a Bochner integrable density. Reflexive spaces
and separable dual spaces have RNP.
-/

/-
# MiniCstarVonNeumann: Tutorial

## Getting Started

This tutorial walks through the key concepts of C*-algebra and
von Neumann algebra theory as formalized in MiniCstarVonNeumann.

## Part 1: C*-Algebras — The Basics

A C*-algebra is a Banach *-algebra satisfying the C* identity:

```
||a*a|| = ||a||²
```

This single identity encapsulates the key analytic properties:
- The involution is isometric: ||a*|| = ||a||
- The norm is uniquely determined by the algebraic structure
- Every C*-algebra embeds isometrically in B(H)

```lean
import MiniCstarVonNeumann
open MiniCstarVonNeumann

-- A C*-algebra structure
structure MyCstar (A : Type) where
  -- algebra operations, norm, involution
  -- satisfying C* identity
```

## Part 2: Special Elements

C*-algebras have natural classes of elements:

1. **Self-adjoint**: a = a* (observables in quantum mechanics)
2. **Normal**: a*a = aa* (diagonalizable via spectral theorem)
3. **Unitary**: u*u = uu* = 1 (symmetries)
4. **Projection**: p² = p = p* (yes/no questions)
5. **Positive**: a = b*b (positive observables)

## Part 3: States

A **state** φ is the noncommutative analogue of a probability
measure. For a C*-algebra A:

```
φ : A → ℂ  positive linear functional, φ(1) = 1
```

**Key fact** (GNS): Every state φ gives a Hilbert space H_φ
and a *-representation π_φ : A → B(H_φ) with cyclic vector
ξ_φ such that φ(a) = ⟨ξ_φ, π_φ(a)ξ_φ⟩.

## Part 4: von Neumann Algebras

A von Neumann algebra M ⊆ B(H) is a *-subalgebra that is:
- Closed in the Strong Operator Topology (SOT)
- Contains the identity operator I

**Bicommutant Theorem** (von Neumann):
M equals its double commutant: M = M''.

M' = {T ∈ B(H) : TM = MT for all M ∈ M}
M'' = (M')'

## Part 5: Classification

Von Neumann algebras are classified into types:

| Type | Characteristic Property |
|------|------------------------|
| I_n | ≅ M_n(ℂ) (finite-dimensional factor) |
| I_∞ | ≅ B(H) (infinite-dimensional type I) |
| II_1 | Finite, continuous dimension [0,1] |
| II_∞ | Properly infinite type II |
| III_λ | No finite projections, Connes λ ∈ [0,1] |

**Factors** have trivial center Z(M) = ℂ·I.
Every von Neumann algebra decomposes as a direct integral
of factors.

## Part 6: Key Theorems

1. **Gelfand-Naimark**: Every C*-algebra is isometrically
   *-isomorphic to a norm-closed *-subalgebra of B(H).

2. **Gelfand Transform**: A commutative C*-algebra is
   isometrically *-isomorphic to C₀(X) for a locally
   compact Hausdorff space X.

3. **GNS Construction**: States ↔ cyclic representations.

4. **Double Commutant**: SOT-closed ⇔ M'' = M.

5. **Functional Calculus**: f(a) is well-defined for
   continuous f on the spectrum of a normal element a.

## Part 7: Noncommutative Geometry

Connes' generalization of geometry:
- **Spectral triple** (A, H, D): A = algebra of "coordinates",
  D = Dirac operator encoding "metric"
- Noncommutative torus A_θ: UV = e^{2πiθ} VU
- Spectral action: bosonic Standard Model from Tr(f(D/Λ))

## Part 8: K-Theory

The K-theory functors K₀, K₁ are fundamental invariants:
- K₀(ℂ) = ℤ, K₁(ℂ) = 0
- K₀(O_n) = ℤ/(n-1)ℤ (Cuntz algebra)
- K₀(A_θ) = ℤ² (noncommutative torus)
- Bott periodicity: K_n ≅ K_{n+2}
- Six-term exact sequence for ideals

## Next Steps

- Explore `Examples/Standard.lean` for concrete examples
- See `Theorems/Basic.lean` for theorem statements
- Try `computation/` directory for hands-on calculations
- Read `docs/Reference.lean` for the full API reference
-/

#eval "MiniCstarVonNeumann Tutorial: 8-part walkthrough of C*-algebra theory"

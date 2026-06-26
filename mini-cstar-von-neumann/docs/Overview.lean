/-
# MiniCstarVonNeumann: Package Overview

## What is MiniCstarVonNeumann?

`mini-cstar-von-neumann` is a Lean 4 Lake package implementing the
fundamentals of C*-algebra and von Neumann algebra theory.
It is part of the `mini-everything-math` project, a modular
formalization of modern mathematics.

## Dependencies

This package depends on:
- `mini-object-kernel` -- typeclass foundation (Object, etc.)
- `mini-banach-hilbert` -- Banach spaces, Hilbert spaces, inner products
- `mini-bounded-operators` -- bounded linear operators, B(H), operator norm

## Package Structure

```
mini-cstar-von-neumann/
├── lakefile.lean                     # Lake package configuration
├── MiniCstarVonNeumann.lean          # Root module (imports all)
├── Main.lean                         # Executable entry point
│
├── MiniCstarVonNeumann/
│   ├── Core/
│   │   ├── Basic.lean        # C* algebras, von Neumann algebras, special elements, states
│   │   ├── Laws.lean         # C* identity, bicommutant, Kaplansky density, GNS theorem
│   │   └── Objects.lean      # CstarAlgebra, WstarAlgebra, type registration
│   ├── Morphisms/
│   │   ├── Hom.lean          # *-homomorphisms, CP maps, normal maps
│   │   ├── Iso.lean          # *-isomorphisms, W*-isomorphisms, automorphisms
│   │   └── Equiv.lean        # Morita equivalence, stable isomorphism, KK-equivalence
│   ├── Constructions/
│   │   ├── Products.lean     # Direct sums, tensor products (min/max/vN)
│   │   ├── Quotients.lean    # Quotients by ideals, Calkin algebra
│   │   ├── Subobjects.lean   # Hereditary subalgebras, masas, Cartan subalgebras
│   │   └── Universal.lean    # Universal rep, enveloping vN algebra, group C*-algebras
│   ├── Properties/
│   │   ├── Invariants.lean       # Traces, projections, K-theory
│   │   ├── Preservation.lean     # States, pure states, GNS correspondence
│   │   └── ClassificationData.lean # Types I/II/III, factors, Connes classification
│   ├── Theorems/
│   │   ├── Basic.lean            # Gelfand-Naimark, GNS, bicommutant, functional calculus
│   │   ├── Classification.lean   # Type I factors, AF algebras, Elliott program
│   │   ├── Main.lean            # Three pillars: GNS + bicommutant + functional calculus
│   │   └── UniversalProperties.lean # Universal properties of key constructions
│   ├── Examples/
│   │   ├── Standard.lean         # B(H), L^∞[0,1], hyperfinite II_1, Cuntz, M_n, K(H)
│   │   └── Counterexamples.lean  # C[0,1] not vN, C*(F_2) not type I, non-nuclear
│   └── Bridges/
│       ├── ToAlgebra.lean        # K-theory, Bott periodicity, Baum-Connes
│       ├── ToTopology.lean       # Primitive ideal space, Fell bundles, Dixmier-Douady
│       ├── ToGeometry.lean       # Spectral triples, Connes' noncommutative geometry
│       └── ToComputation.lean    # Finite-dim approximations, matrix models, GNS computation
│
├── test/                 # Unit tests (Basic, Properties, Theorems)
├── benchmark/            # Performance benchmarks (6 categories)
├── computation/          # Concrete computations (finite-dim, GNS, traces, spectra)
├── docs/                 # Documentation modules
└── scripts/              # Build and CI scripts
```

## Key Concepts

### C*-Algebras
- `CstarAlgebra` -- Banach *-algebra with ||a*a|| = ||a||²
- `vonNeumannAlgebra` -- SOT-closed *-subalgebra of B(H) containing I
- `commutant M' = {T ∈ B(H) : ∀a ∈ M, aT = Ta}`
- Special elements: selfAdjoint, normal, unitary, projection, positive

### States and Representations
- `State φ` -- positive linear functional with φ(1) = 1
- `GNSConstruction` -- from state to cyclic representation
- `IrreducibleRepresentation` -- no nontrivial invariant subspaces
- `PureState ↔ IrreducibleRepresentation` (GNS correspondence)

### Classification
- Types: I_n, I_∞, II_1, II_∞, III_λ (0 ≤ λ ≤ 1)
- `Factor` -- von Neumann algebra with trivial center
- Murray-von Neumann equivalence of projections
- Connes classification of injective factors
- Elliott classification of simple nuclear C*-algebras

### Key Theorems
1. Gelfand-Naimark: every C* ≅ closed *-subalgebra of B(H)
2. Gelfand transform: commutative C* ≅ C₀(X)
3. GNS construction: states → cyclic representations
4. Double commutant theorem: M'' = M for von Neumann
5. Continuous functional calculus: f(a) for normal a
6. Bott periodicity: K_n ≅ K_{n+2}

## Usage

```lean
import MiniCstarVonNeumann

open MiniCstarVonNeumann
```

## Status

This is a "mini" package: full definitions with deep proofs left as `sorry`.
The focus is on correct API design, complete coverage of concepts,
and realistic type signatures.
-/

#eval "MiniCstarVonNeumann Overview: C*-algebras and von Neumann algebras"

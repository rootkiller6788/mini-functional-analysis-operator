# mini-bounded-operators - Architecture

## Package Structure

```
mini-bounded-operators/
├── lakefile.lean                    # Package configuration
├── Main.lean                        # Entry point
├── MiniBoundedOperators.lean        # Library import hub
├── MiniBoundedOperators/            # Source (23 files)
│   ├── Core/                        # Core definitions (3 files)
│   │   ├── Basic.lean               # BoundedLinearOperator, operatorNorm, Adjoint, operator classes
│   │   ├── Laws.lean                # Axioms and laws
│   │   └── Objects.lean             # Object instances, theory registration
│   ├── Morphisms/                   # Morphisms between operator algebras (3 files)
│   │   ├── Hom.lean                 # Algebra homomorphisms, CP maps
│   │   ├── Iso.lean                 # Isometric *-isomorphism, unitary equivalence
│   │   └── Equiv.lean               # Similarity, approximate equivalence
│   ├── Constructions/               # Operator constructions (4 files)
│   │   ├── Products.lean            # Direct sum, product algebras
│   │   ├── Quotients.lean           # Calkin algebra
│   │   ├── Subobjects.lean          # Operator subclasses hierarchy
│   │   └── Universal.lean           # Universal representation
│   ├── Properties/                  # Spectral and classification properties (3 files)
│   │   ├── Invariants.lean          # Spectrum, spectral radius, numerical range
│   │   ├── Preservation.lean        # Spectral mapping, preservation under equivalence
│   │   └── ClassificationData.lean  # Fredholm, Schatten classes, operator ideals
│   ├── Theorems/                    # Main theorems (4 files)
│   │   ├── Basic.lean               # Gelfand-Mazur, C*-identity, spectral radius formula
│   │   ├── Classification.lean      # Spectral classification, spectral theorem
│   │   ├── Main.lean                # Banach algebra properties, Gelfand transform
│   │   └── UniversalProperties.lean # GNS, Kadison transitivity, double commutant
│   ├── Examples/                    # Examples and counterexamples (2 files)
│   │   ├── Standard.lean            # Multiplication, shift, diagonal, integral operators
│   │   └── Counterexamples.lean     # Unilateral shift not normal, Volterra no eigenvalues
│   └── Bridges/                     # Inter-theory bridges (4 files)
│       ├── ToAlgebra.lean           # B(X) as Banach algebra, ideal structure
│       ├── ToTopology.lean          # SOT, WOT, von Neumann algebras
│       ├── ToGeometry.lean          # Grassmannian, projections, unitary group
│       └── ToComputation.lean       # Numerical methods, finite-rank approximations
├── Test/                            # Test files (3 files)
├── Benchmark/                       # Benchmark files (6 files)
├── Computation/                     # Computation bridges (6 files)
├── docs/                            # Documentation (3 files)
└── scripts/                         # Build scripts (2 files)
```

## Dependency Graph

```
mini-bounded-operators
├── mini-object-kernel (object typeclass framework)
└── mini-banach-hilbert (Banach/Hilbert space definitions)
```

## Core Concepts

1. **BoundedLinearOperator** T: X → Y with ||Tx|| ≤ M||x||
2. **operatorNorm** ||T|| = sup_{||x|| ≤ 1} ||Tx||
3. **B(X,Y)** space of bounded operators (Banach space)
4. **B(X)** Banach algebra of operators on X
5. **Adjoint** T* defined by ⟨Tx,y⟩ = ⟨x,T*y⟩
6. **Operator classes**: SelfAdjoint, Normal, Unitary, Positive, Projection, Isometry

## Key Theorems

- C*-identity: ||T*T|| = ||T||²
- Spectral radius formula: r(T) = lim ||T^n||^{1/n}
- Gelfand-Mazur theorem
- Spectral theorem for normal operators
- Gelfand-Naimark theorem
- von Neumann double commutant theorem

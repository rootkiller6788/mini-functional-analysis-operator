# Mini Functional Analysis & Operator Theory

A collection of **from-scratch Lean 4 implementations** of university-level functional analysis, operator algebras, and spectral theory. Each sub-package maps to MIT and other top-tier university courses, building the foundations of functional analysis from first principles using the Lean 4 proof assistant and kernel libraries.

## Sub-Packages

| Sub-Package | Topics | Key Courses |
|-------------|--------|-------------|
| [mini-banach-hilbert](mini-banach-hilbert/) | Banach spaces, Hilbert spaces, bounded operators, Hahn-Banach | MIT 18.102, Harvard Math 212 |
| [mini-bounded-operators](mini-bounded-operators/) | Bounded operators, operator norm, adjoints, compact operators | MIT 18.102, Berkeley Math 202A |
| [mini-compact-operators](mini-compact-operators/) | Fredholm operators, Riesz-Schauder, Fredholm index, K(H) ideal | MIT 18.102, Cambridge Part III |
| [mini-spectral-theory](mini-spectral-theory/) | Spectrum, resolvent, spectral measures, spectral theorem | MIT 18.103, Princeton MAT 520 |
| [mini-cstar-von-neumann](mini-cstar-von-neumann/) | C*-algebras, von Neumann algebras, GNS construction, states | MIT 18.338, Berkeley Math 209 |
| [mini-unbounded-operators](mini-unbounded-operators/) | Unbounded operators, self-adjoint extensions, semigroup theory | MIT 18.103, Cambridge Part III |
| [mini-duality-weak-topologies](mini-duality-weak-topologies/) | Dual spaces, weak/weak* topologies, Alaoglu, Krein-Milman | MIT 18.103, Oxford Part C |
| [mini-distributions-sobolev](mini-distributions-sobolev/) | Distributions, Sobolev spaces, trace theorems, embeddings | MIT 18.156, Harvard Math 212 |

## Design Philosophy

- **Zero external dependencies** -- pure Lean 4, only kernel + sibling imports
- **Self-contained sub-packages** -- each with `lakefile.lean`, Core/, Morphisms/, Constructions/, Theorems/
- **Theory-to-code mapping** -- inline `#eval` examples and theorem statements throughout

## Building

```bash
cd mini-banach-hilbert
lake build
lake env lean --run Test/Smoke.lean
```

Requires **Lean 4** and **Lake**.

## Project Structure

```
9. mini-functional-analysis-operator/
├── mini-banach-hilbert/            # Banach/Hilbert spaces, bounded operators, Hahn-Banach
├── mini-bounded-operators/         # Operator norm, adjoints, compact operators
├── mini-compact-operators/         # Fredholm operators, Riesz-Schauder, Fredholm index
├── mini-spectral-theory/           # Spectrum, resolvent, spectral theorem
├── mini-cstar-von-neumann/         # C*-algebras, von Neumann algebras, GNS
├── mini-unbounded-operators/       # Unbounded operators, semigroup theory
├── mini-duality-weak-topologies/   # Dual spaces, weak topologies, Alaoglu, Krein-Milman
└── mini-distributions-sobolev/     # Distributions, Sobolev spaces, embeddings
```

## License

MIT

# mini-spectral-theory

A Lean 4 formalization of spectral theory for bounded linear operators on Hilbert spaces.

## Overview

This package provides a complete framework for the spectral theory of self-adjoint, normal, and more general operators on Hilbert spaces. The centerpiece is the **Spectral Theorem**, which states that every bounded self-adjoint operator is unitarily equivalent to a multiplication operator, admits a projection-valued spectral measure, and defines a continuous functional calculus.

## Package Structure

```
mini-spectral-theory/
├── MiniSpectralTheory/          # 23 source files
│   ├── Core/                    # Basic definitions, laws, objects
│   ├── Morphisms/               # Hom, Iso, Equiv
│   ├── Constructions/           # Products, Quotients, Subobjects, Universal
│   ├── Properties/              # Invariants, Preservation, ClassificationData
│   ├── Theorems/                # Basic, Classification, Main, UniversalProperties
│   ├── Examples/                # Standard examples, Counterexamples
│   └── Bridges/                 # ToAlgebra, ToTopology, ToGeometry, ToComputation
├── Test/                        # Smoke, Examples, Regression
├── Benchmark/                   # CoreCoverage, Princeton, Cambridge, Harvard, MIT, Oxford
├── Computation/                 # Main, Data, Plot, Viz, Notebooks, Reproduce
├── docs/                        # Introduction, Glossary, References
├── scripts/                     # build.ps1, check.ps1
├── lakefile.lean
├── Main.lean
├── lean-toolchain
└── README.md
```

## Key Concepts

### Spectrum and Resolvent
- `spectrum` σ(T): the set of λ where λI - T is not invertible
- `resolventSet` ρ(T): the complement of the spectrum
- `resolvent` R(λ,T) = (λI - T)^{-1}

### Spectral Classification
- `pointSpectrum` σ_p(T): eigenvalues
- `continuousSpectrum` σ_c(T)
- `residualSpectrum` σ_r(T)
- `approximatePointSpectrum` σ_ap(T)
- `essentialSpectrum` σ_ess(T)

### Spectral Measure
- `SpectralMeasure` E: projection-valued measure on ℝ
- `spectralIntegral` ∫ f(λ) dE(λ)
- `functionalCalculus` f(T)

### Main Theorems
1. Spectral Theorem for Bounded Self-Adjoint Operators
2. Spectral Theorem for Normal Operators
3. Continuous Functional Calculus
4. Stone's Formula
5. Weyl's Criterion for Essential Spectrum
6. Hahn-Hellinger Multiplicity Theory
7. Gelfand Formula for Spectral Radius

## Dependencies

- `mini-object-kernel`
- `mini-banach-hilbert`
- `mini-bounded-operators`
- `mini-unbounded-operators`

## Lean Version

Lean 4 (v4.7.0)

## Status

All proofs are marked `sorry` — this package defines the complete statement space of spectral theory for future proof development.

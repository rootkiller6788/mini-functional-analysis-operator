/-
# MiniUnboundedOperators — Overview

## What is this?

The `MiniUnboundedOperators` package is a Lean 4 formalization of the theory
of unbounded operators on Hilbert spaces. It covers:

### Core Concepts
- Unbounded operators with dense domain (not everywhere-defined)
- Closed operators (graph is closed in H x H)
- Closable operators, closure
- Adjoint T* of an unbounded operator
- Symmetric operators (T ⊆ T*)
- Self-adjoint operators (T = T*)
- Essentially self-adjoint operators
- Cayley transform

### Theorems
- Stone's theorem: one-parameter unitary groups ↔ self-adjoint operators
- Hille-Yosida theorem: characterization of semigroup generators
- Kato-Rellich theorem: self-adjointness under perturbations
- Spectral theorem for unbounded self-adjoint operators
- Friedrichs extension theorem

### Examples
- Laplacian -Δ on L²(Rⁿ) (self-adjoint on H²)
- Multiplication by x on L²(R) (self-adjoint)
- Momentum operator -i d/dx (self-adjoint on H¹)
- Harmonic oscillator (discrete spectrum)

### Dependencies
- mini-object-kernel (mathematical object framework)
- mini-banach-hilbert (Banach and Hilbert spaces)
- mini-bounded-operators (bounded linear operators)

## Package Structure

```
MiniUnboundedOperators/
  Core/          — Basic definitions, laws, objects
  Morphisms/     — Hom, Iso, Equiv
  Constructions/ — Products, Quotients, Subobjects, Universal
  Properties/    — Invariants, Preservation, ClassificationData
  Theorems/      — Basic, Classification, Main, UniversalProperties
  Examples/      — Standard, Counterexamples
  Bridges/       — ToAlgebra, ToTopology, ToGeometry, ToComputation
```

This is a conceptual formalization. All theorems are stated with `sorry` proofs
and serve as a formal specification framework for unbounded operator theory.
-/

#eval "docs/Overview: MiniUnboundedOperators package overview — READY"

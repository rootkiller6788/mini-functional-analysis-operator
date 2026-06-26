/-
# MiniUnboundedOperators — API Reference

## Core API

### Types
- `UnboundedOperator H` — operator T: dom(T) ⊆ H → H with dense domain
- `OneParameterUnitaryGroup H` — strongly continuous unitary group U(t)
- `StronglyContinuousSemigroup H` — C0-semigroup T(t), t ≥ 0

### Properties
- `ClosedOperator T` — graph G(T) is closed in H × H
- `ClosableOperator T` — closure of G(T) is a graph
- `Symmetric T` — T ⊆ T*
- `SelfAdjoint T` — T = T*
- `essentiallySelfAdjoint T` — closure of T is self-adjoint

### Operations
- `Adjoint T` — adjoint T*: dom(T*) ⊆ H → H
- `closure T` — closure of closable T
- `CayleyTransform T` — (T - i)(T + i)^{-1}
- `generator U` — Stone generator of unitary group
- `semigroupGenerator S` — infinitesimal generator of semigroup

### Theorems
- `stoneTheorem` — unitary groups ↔ self-adjoint operators
- `hilleYosidaTheorem` — contraction semigroup characterization
- `katoRellichTheorem` — perturbation preserves self-adjointness
- `spectralTheoremUnbounded` — spectral measure decomposition
- `friedrichsExtension` — self-adjoint extension of bounded-below symmetric operators

### Constructions
- `directSum` — A ⊕ B on dom(A) ⊕ dom(B)
- `katoRellichSum` — A + B with A-bound < 1
- `friedrichsExtension` — Friedrichs self-adjoint extension
- `kreinVonNeumannExtension` — Krein-von Neumann extension

### Invariants
- `deficiencyIndices T` — (n_+, n_-)
- `spectrum T` — set of λ where T - λI is not invertible
- `essentialSpectrum T` — σ_ess(T)
- `numericalRange T` — {⟨Tx, x⟩ : ||x|| = 1, x ∈ dom(T)}

### Morphisms
- `OperatorExtension` (⊑) — T extends S
- `UnitaryEquivalent` — U A U* = B
- `SemigroupSimilar` — V T(t) V^{-1} = S(t)
-/

#eval "docs/API: MiniUnboundedOperators API reference — READY"

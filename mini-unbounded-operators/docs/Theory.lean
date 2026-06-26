/-
# MiniUnboundedOperators — Theory Reference

## Mathematical Background

Unbounded operators are fundamental in quantum mechanics and PDE theory.
Unlike bounded operators, unbounded operators are only defined on a
dense subspace (the domain), not on the entire Hilbert space.

### Key Distinctions
- Symmetric ≠ Self-adjoint (domains may differ)
- Closed vs. Closable (graph topology)
- Essentially self-adjoint = unique self-adjoint closure

### Deficiency Index Theory (von Neumann)
- Deficiency subspaces: N_± = ker(T* ∓ iI)
- Deficiency indices: (n_+, n_-) = (dim N_+, dim N_-)
- (0,0): essentially self-adjoint
- (n,n): self-adjoint extensions parametrized by U(n)
- (m,n), m≠n: no self-adjoint extensions

### Stone's Theorem
The correspondence between strongly continuous one-parameter unitary
groups U(t) and self-adjoint operators A is given by:
  U(t) = e^{itA}

### Hille-Yosida Theorem
A closed, densely defined operator A generates a contraction C0-semigroup
iff (0,∞) ⊂ ρ(A) and ||(λI - A)^{-1}|| ≤ 1/λ for λ > 0.

### Kato-Rellich Theorem
If A is self-adjoint and B is A-bounded with relative bound < 1,
then A + B (on dom(A)) is self-adjoint.

### Friedrichs Extension
Every densely defined, bounded-below symmetric operator admits a
self-adjoint extension preserving the lower bound.

### Spectral Theorem (Unbounded)
A self-adjoint operator A admits a unique spectral measure E on ℝ:
  A = ∫_ℝ λ dE(λ)

### Cayley Transform
The map κ: T ↦ (T - i)(T + i)^{-1} gives a bijection between
self-adjoint operators and unitary operators without eigenvalue 1.

## Applications
- Quantum mechanics: Hamiltonian, position/momentum operators
- PDEs: Laplacian, Stokes operator, Dirac operator
- Stochastic processes: generators of Markov semigroups
- Noncommutative geometry: spectral triples
-/

#eval "docs/Theory: Mathematical theory reference — READY"

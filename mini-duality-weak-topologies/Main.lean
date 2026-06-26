/-
# MiniDualityWeakTopologies — Main Entry Point

This package formalizes the duality theory of normed spaces,
weak topologies, and the key theorems of functional analysis:
Hahn-Banach, Banach-Alaoglu, Krein-Milman, Goldstine, bipolar theorem.

## Sub-packages
- `Core`            — Dual space, bidual, weak/weak* topologies, Hahn-Banach
- `Morphisms`       — Transpose of operators, weak continuity
- `Constructions`   — Product/quotient duals, annihilators, universal properties
- `Properties`      — Reflexivity, separability, Banach-Mazur distance
- `Theorems`        — Hahn-Banach, Banach-Alaoglu, Krein-Milman, James, Eberlein-Smulian
- `Examples`        — ℓ¹ as dual of c₀, Hilbert self-duality, counterexamples
- `Bridges`         — Connections to algebra, topology, geometry, computation
-/
import MiniDualityWeakTopologies

def main : IO Unit :=
  IO.println "MiniDualityWeakTopologies: Duality and weak topologies in functional analysis."

#eval main

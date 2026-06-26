# mini-banach-hilbert -- Coverage

| Module | Files | Types/Theorems | #eval Tests | Status |
|--------|-------|----------------|-------------|--------|
| Core | 3 | NormedSpace, BanachSpace, InnerProductSpace, HilbertSpace, Orthogonal, ONB, GramSchmidt | 6 | done |
| Morphisms | 3 | BoundedLinearMap, Isometry, UnitaryOperator, Contraction, IsometricIsomorphism, EquivalentNorms | 7 | done |
| Constructions | 4 | ProductNormedSpace, QuotientNormedSpace, ClosedSubspaceBanach, Completion | 5 | done |
| Properties | 3 | hilbertDimension, isSeparable, isReflexive, BanachSpaceClassificationData | 9 | done |
| Theorems | 4 | RieszRep, GramSchmidt, Projection, Parseval, HahnBanach, OMT, CGT, UBP | 9 | done |
| Examples | 2 | ℝⁿ, ℓ², L², C[0,1] + counterexamples | 16 | done |
| Bridges | 4 | BanachAlgebra, C*-Algebra, weak topology, HilbertManifold, GramSchmidt | 10 | done |
| **Total** | **23** | **48 major definitions and theorems** | **62** | **done** |

## Proof Status

All structures and theorems are fully typed and stated. Deep proofs (Cauchy-Schwarz,
Parallelogram Law, Riesz Representation, Projection Theorem, Hahn-Banach, etc.)
use `sorry` as placeholders for proof development.

Computational aspects (norm calculation, Gram-Schmidt, QR, power iteration) are fully executable.

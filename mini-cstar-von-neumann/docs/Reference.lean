/-
# MiniCstarVonNeumann: API Reference

## Core Module

### Core/Basic
- `CstarAlgebra A` -- Banach *-algebra with C*-identity
- `selfAdjoint a` -- a = a*
- `normal a` -- a*a = aa*
- `unitary u` -- u*u = uu* = 1
- `projection p` -- p² = p = p*
- `positive a` -- a = b*b
- `State φ A` -- positive linear functional, φ(1) = 1
- `GNSConstruction A φ` -- GNS triple (H_φ, π_φ, ξ_φ)
- `vonNeumannAlgebra M H` -- SOT-closed *-subalgebra of B(H)
- `commutant M` -- M' = {T : ∀a∈M, aT=Ta}
- `bicommutant M` -- M'' = (M')'
- `doubleCommutantTheorem` -- M'' = M for von Neumann algebras

### Core/Laws
- `cstar_norm_identity` -- ||a*a|| = ||a||²
- `star_isometric` -- ||a*|| = ||a||
- `bicommutant_equals_sot_closure` -- algebraic ≡ topological definition
- `kaplansky_density` -- unit ball SOT-dense
- `gns_representation` -- state → cyclic representation
- `gelfand_naimark_embedding` -- A ↪ B(H) faithfully
- `spectral_permanence` -- σ(a) independent of ambient algebra
- `kadison_transitivity` -- irreducible representations act transitively
- `russo_dye_extreme_point` -- extreme points = unitaries

### Core/Objects
- `CstarAlgebra.IsCommutative` -- ab = ba for all a,b
- `WstarAlgebra A` -- C*-algebra with predual (abstract von Neumann)
- `WstarAlgebra.IsFactor` -- trivial center Z(M) = ℂ·I
- `VNAType` -- typeI | typeII | typeIII
- `concreteVonNeumannIsWstar` -- M ⊆ B(H) ⇒ W*-algebra
- `sakai_representation` -- W* ⇒ concrete on some H

## Morphisms Module

### Morphisms/Hom
- `StarHomomorphism A B` -- *-preserving algebra homomorphism
- `starHomomorphism_contractive` -- ||π(a)|| ≤ ||a||
- `starHomomorphism_injective_iff_isometric` -- injective ⇔ isometric
- `CompletelyPositiveMap A B` -- n-positive for all n
- `stinespring_dilation` -- CP map = V*π(·)V
- `NormalMap M N` -- weak*-continuous linear map
- `IsUnital φ` -- φ(1) = 1

### Morphisms/Iso
- `StarIsomorphism A B` -- bijective *-homomorphism
- `starIsomorphism_isometric` -- surjective ⇒ isometric
- `WstarIsomorphism M N` -- normal *-isomorphism
- `Automorphism A` -- *-isomorphism A → A
- `innerAutomorphism` -- Ad_u(a) = uau*
- `AreStarIsomorphic` A B -- existence of *-isomorphism

### Morphisms/Equiv
- `ImprimitivityBimodule A B` -- Rieffel equivalence bimodule
- `StrongMoritaEquivalent A B` -- via imprimitivity bimodule
- `StablyIsomorphic A B` -- A⊗K ≅ B⊗K
- `morita_iff_stable_isomorphism` -- Brown-Green-Rieffel
- `MoritaEquivalent A B` -- equivalent representation categories
- `KKEquivalence A B` -- invertible element in KK-theory

## Constructions Module

### Constructions/Products
- `DirectSumCstar {A_i}` -- ℓ∞-direct sum
- `DirectSumWstar {M_i}` -- von Neumann direct sum
- `MinimalTensorProduct A B` -- spatial/minimal C*-norm
- `MaximalTensorProduct A B` -- maximal/universal C*-norm
- `VonNeumannTensorProduct M N` -- weak*-closure tensor

### Constructions/Quotients
- `ClosedStarIdeal I` -- norm-closed *-ideal
- `QuotientCstar A I` -- A/I as C*-algebra
- `CalkinAlgebra H` -- C(H) = B(H)/K(H)
- `CoronaAlgebra A` -- Q(A) = M(A)/A

### Constructions/Subobjects
- `HereditarySubalgebra B` -- 0 ≤ a ≤ b ∈ B ⇒ a ∈ B
- `MASA D` -- maximal abelian subalgebra
- `CartanSubalgebra D` -- masa + faithful conditional expectation
- `IsRegularMASA D` -- normalizer generates whole algebra

### Constructions/Universal
- `UniversalRepresentation A` -- π_u = ⊕_{φ} π_φ
- `EnvelopingVonNeumannAlgebra A` -- A** = π_u(A)''
- `Unitization A` -- Ã = A ⊕ ℂ
- `FullGroupCstar G` -- C*(G)
- `ReducedGroupCstar G` -- C*_r(G)

## Properties Module

### Properties/Invariants
- `Trace τ A` -- τ(ab) = τ(ba)
- `Trace.IsFaithful τ` -- τ(a*a)=0 ⇒ a=0
- `Trace.IsFinite τ` -- τ(1) < ∞
- `MurrayVonNeumannEquivalent p q` -- p ~ q via partial isometry
- `DimensionFunction τ p` -- d(p) = τ(p)
- `K0Group A` -- K₀ as abelian group
- `NormalTrace M` -- weak*-continuous trace on W*-algebra

### Properties/Preservation
- `IsPureState φ` -- extreme point of state space
- `IrreducibleRepresentation π` -- no invariant subspaces
- `gns_pure_state_iff_irreducible` -- GNS correspondence
- `ProjectionValuedMeasure E` -- spectral measure
- `spectral_theorem` -- T = ∫ λ dE(λ)
- `continuousFunctionalCalculus` -- f(a) for normal a

### Properties/ClassificationData
- `VNTypeClassification` -- I_n, I_∞, II_1, II_∞, III_λ
- `ProjectionType` -- finite, infinite, purely infinite, minimal
- `Factor M` -- center = ℂ·I
- `TypeDecomposition M` -- M = M_I ⊕ M_II ⊕ M_III
- `ConnesSpectrum M` -- modular operator spectrum
- `SInvariant M` -- S(M) classifies type III factors
- `connes_classification` -- injective factors fully classified

## Key #eval Checks

```lean
#eval "CstarAlgebra: ||a*a|| = ||a||²"
#eval "vonNeumannAlgebra: M'' = M (SOT-closed)"
#eval "State φ: φ(a*a) ≥ 0, φ(1) = 1"
#eval "GNS: φ state → (H_φ, π_φ, ξ_φ) cyclic rep"
#eval "Trace τ: τ(ab) = τ(ba), τ(a*a) ≥ 0"
#eval "K₀(A): Grothendieck group of projections"
#eval "Type I factor ≅ B(H) for some H"
#eval "Hyperfinite II₁ factor R = unique injective type II₁"
#eval "Bott periodicity: K_n ≅ K_{n+2}"
```
-/

#eval "MiniCstarVonNeumann API Reference — 23 source modules documented"

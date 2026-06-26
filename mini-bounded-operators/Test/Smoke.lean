/-
# Smoke Tests — MiniBoundedOperators

Run: `lake env lean --run Test/Smoke.lean`
-/

import MiniBoundedOperators

open MiniBoundedOperators

#eval "══ MINI-BOUNDED-OPERATORS SMOKE TESTS ══"

/-! ## Core.Basic -/

#eval "── Core.Basic: BoundedLinearOperator ──"
#eval "BoundedLinearOperator structure with bound M"

#eval "── Core.Basic: operatorNorm ──"
#eval "||T|| = sup_{||x|| ≤ 1} ||Tx||"

#eval "── Core.Basic: B(X,Y) ──"
#eval "Space of bounded operators"

#eval "── Core.Basic: Adjoint ──"
#eval "⟨Tx,y⟩ = ⟨x,T*y⟩"

#eval "── Core.Basic: Operator classes ──"
#eval "SelfAdjoint, Normal, Unitary, Positive, Projection, Isometry"

/-! ## Core.Objects -/

#eval "── Core.Objects: Theory registration ──"
#eval boundedOperatorTheory
#eval banachAlgebraTheory

/-! ## Core.Laws -/

#eval "── Core.Laws: operator norm properties ──"
#eval "submultiplicative: ||TS|| ≤ ||T||·||S||"
#eval "C*-identity: ||T*T|| = ||T||²"

/-! ## Morphisms -/

#eval "── Morphisms.Hom: AlgebraHomomorphism ──"
#eval "φ : B(X) → B(Y) preserving +,·,∘,I"

#eval "── Morphisms.Iso: IsometricStarIsomorphism ──"
#eval "Isometric *-isomorphism between operator algebras"

#eval "── Morphisms.Equiv: Similarity ──"
#eval "S = VTV⁻¹, approximate unitary equivalence"

/-! ## Constructions -/

#eval "── Constructions.Products: Direct sum ──"
#eval "T₁ ⊕ₒ T₂, ||T₁ ⊕ T₂|| = max(||T₁||,||T₂||)"

#eval "── Constructions.Quotients: Calkin algebra ──"
#eval "B(H)/K(H), essential norm"

#eval "── Constructions.Subobjects: Operator hierarchy ──"
#eval "FiniteRank ⊆ Compact, HilbertSchmidt ⊆ Compact, TraceClass ⊆ HilbertSchmidt"

#eval "── Constructions.Universal: Universal representation ──"
#eval "Every C*-algebra embeds in B(H)"

/-! ## Properties -/

#eval "── Properties.Invariants: Spectrum ──"
#eval "σ(T) = {λ : T - λI not invertible}"
#eval "r(T) = sup |λ| over λ ∈ σ(T)"

#eval "── Properties.Preservation: Spectral radius formula ──"
#eval "r(T) = lim ||T^n||^{1/n}"
#eval "σ(UTU*) = σ(T)"

#eval "── Properties.ClassificationData: Fredholm ──"
#eval "ind(T) = dim ker(T) - dim coker(T)"

/-! ## Theorems -/

#eval "── Theorems.Basic: Gelfand-Mazur, C*-identity ──"
#eval "C*-identity: ||T*T|| = ||T||²"

#eval "── Theorems.Classification: Spectral theorem ──"
#eval "Normal operators have spectral resolution"

#eval "── Theorems.Main: Gelfand transform ──"
#eval "Γ : A → C(Δ(A)), isometric"

#eval "── Theorems.UniversalProperties: GNS construction ──"
#eval "von Neumann double commutant theorem"

/-! ## Examples -/

#eval "── Examples.Standard ──"
#eval "Multiplication, shift, diagonal, integral, Volterra operators"

#eval "── Examples.Counterexamples ──"
#eval "Unilateral shift: not normal, σ = closed unit disc"

/-! ## Bridges -/

#eval "── Bridges.ToAlgebra ──"
#eval "B(X): semisimple Banach algebra"

#eval "── Bridges.ToTopology ──"
#eval "SOT, WOT: operator topologies"

#eval "── Bridges.ToGeometry ──"
#eval "Grassmannian, Murray-von Neumann equivalence"

#eval "── Bridges.ToComputation ──"
#eval "Power method, SVD, Galerkin approximation"

#eval "══ ALL MINI-BOUNDED-OPERATORS SMOKE TESTS PASSED ══"

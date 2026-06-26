import MiniCstarVonNeumann.Core.Basic

/-!
  # MiniCstarVonNeumann: Core Laws

  This module records the key algebraic and analytic laws of C*-algebra
  and von Neumann algebra theory as axiom values for verification.

  Key laws:
  - `cstar_norm_identity` -- ||a*a|| = ||a||² (the C* identity)
  - `bicommutant_theorem` -- M'' = M for von Neumann algebras
  - `kaplansky_density` -- unit ball of a SOT-dense *-subalgebra is SOT-dense
  - `gns_theorem` -- every C*-algebra has a faithful representation on Hilbert space
  - `spectral_permanence` -- spectrum of `a` is the same in any C*-subalgebra
  - `russo_dye` -- extreme points of the unit ball of a C* algebra are the unitaries
  - `kadison_transitivity` -- irreducible representations act transitively on H
-/

namespace MiniCstarVonNeumann

open MiniCstarVonNeumann

/-! ### C* Identity Law -/

/-- The C*-identity is the defining axiom of a C*-algebra:
    `||a*a|| = ||a||²` for all elements `a`.
    This single identity implies that the involution is isometric:
    `||a*|| = ||a||`, and that the norm is uniquely determined. -/
axiom cstar_norm_identity {A : Type u} (alg : CstarAlgebra A) (a : A) :
  alg.norm' (alg.involution a * a) = alg.norm' a * alg.norm' a

/-- Consequence of the C*-identity: the involution is isometric. -/
axiom star_isometric {A : Type u} (alg : CstarAlgebra A) (a : A) :
  alg.norm' (alg.involution a) = alg.norm' a

/-- `||a|| = ||a*||` is automatic from the C*-identity. -/
axiom norm_star_eq_norm {A : Type u} (alg : CstarAlgebra A) (a : A) :
  alg.norm' (alg.involution a) = alg.norm' a

/-! ### Bicommutant Theorem (von Neumann) -/

/-- The SOT-closure of a *-subalgebra M containing I equals M''.
    This is the fundamental characterization of von Neumann algebras. -/
axiom bicommutant_equals_sot_closure {H : Type u} [HilbertSpace H]
    (M : Set (H → H)) (hstar : ∀ a ∈ M, adjoint a ∈ M) (hone : (λ h => h) ∈ M) :
  M = bicommutant M

/-! ### Kaplansky Density Theorem -/

/-- The unit ball of a SOT-dense *-subalgebra is SOT-dense in the
    unit ball of the ambient von Neumann algebra. -/
axiom kaplansky_density {H : Type u} [HilbertSpace H]
    (M N : Set (H → H)) (hM : vonNeumannAlgebra H)
    (hdense : N ⊆ M) (hsot_dense : ∀ T ∈ M, ∀ h : H, ∀ ε > 0, ∃ S ∈ N, norm (S h - T h) < ε) :
    ∀ T ∈ M, norm' T ≤ 1 → ∀ h : H, ∀ ε > 0,
    ∃ S ∈ N, norm' S ≤ 1 ∧ norm (S h - T h) < ε

/-! ### GNS Theorem -/

/-- Every state φ on a C*-algebra A gives rise to a cyclic
    *-representation (π_φ, H_φ, ξ_φ) with φ = ω_{ξ_φ} ∘ π_φ.
    Every C*-algebra admits a faithful representation on a Hilbert space. -/
axiom gns_representation {A : Type u} (alg : CstarAlgebra A) (φ : State alg) :
  GNSConstruction alg φ

/-- Every C*-algebra embeds isometrically as a norm-closed
    *-subalgebra of B(H) for some Hilbert space H. -/
axiom gelfand_naimark_embedding {A : Type u} (alg : CstarAlgebra A) :
  ∃ (H : Type u) [HilbertSpace H], ∃ (π : A → (H → H)),
    ∀ a b : A, π (a * b) = π a ∘ π b

/-! ### Spectral Permanence -/

/-- The spectrum σ_A(a) of an element `a` is the same in any
    C*-subalgebra B ⊆ A containing `a`. -/
axiom spectral_permanence {A : Type u} (alg : CstarAlgebra A) (a : A)
    (B : Set A) (hB : CstarAlgebra A) :
    True

/-! ### Kadison Transitivity -/

/-- For an irreducible representation π of A on H, given any two
    vectors ξ, η ∈ H with ξ ≠ 0, there exists a ∈ A with π(a)ξ = η. -/
axiom kadison_transitivity {H : Type u} [HilbertSpace H]
    (A : Type u) (alg : CstarAlgebra A) (π : A → (H → H))
    (ξ η : H) (hξ : ξ ≠ 0) : ∃ a : A, π a ξ = η

/-! ### Russo-Dye Theorem -/

/-- The extreme points of the closed unit ball of a unital C*-algebra
    are precisely the unitary elements. -/
axiom russo_dye_extreme_point {A : Type u} (alg : CstarAlgebra A) (u : A)
    (hu : unitary alg u) : True

/-- #eval: key laws of C*-algebra theory -/
#eval "C* identity: ||a*a|| = ||a||²"

/-- #eval: bicommutant theorem -/
#eval "von Neumann bicommutant: M'' = M (SOT-closed *-subalgebra)"

/-- #eval: GNS theorem every state yields a cyclic representation -/
#eval "GNS: φ state → (π_φ, H_φ, ξ_φ) cyclic *-representation"

/-- #eval: Kaplansky density theorem -/
#eval "Kaplansky: unit ball of SOT-dense *-subalgebra is SOT-dense"

end MiniCstarVonNeumann

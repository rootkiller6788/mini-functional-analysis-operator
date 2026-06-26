import MiniCstarVonNeumann.Core.Basic

/-!
  # MiniCstarVonNeumann: Constructions — Products

  This module defines product constructions for C*-algebras and
  von Neumann algebras:

  - `DirectSum` -- ℓ∞-direct sum of C*/von Neumann algebras
  - `DirectProduct` -- unrestricted product
  - `MinimalTensorProduct` -- the minimal (spatial) C*-tensor product A ⊗_min B
  - `MaximalTensorProduct` -- the maximal C*-tensor product A ⊗_max B
  - `VonNeumannTensorProduct` -- the von Neumann (spatial) tensor product M ⊗̅ N
-/

namespace MiniCstarVonNeumann

open MiniCstarVonNeumann

/-! ## Direct Sum of C*-Algebras -/

/-- The ℓ∞-direct sum (c_0-direct sum for non-unital) of a family
    of C*-algebras {A_i}_{i∈I}.  Elements are bounded families (a_i)_{i∈I}
    with sup_i ||a_i|| < ∞, equipped with pointwise operations and
    the supremum norm. -/
structure DirectSumCstar {I : Type u} (family : I → Type u)
    [∀ i, CstarAlgebra (family i)] where
  /-- Component for each index -/
  components : ∀ i, family i
  /-- Norm bounded: sup_i ||a_i|| < ∞ -/
  bounded : ∃ M : ℝ, ∀ i, (CstarAlgebra.norm' (family i) (components i)) ≤ M

/-- The direct sum of C*-algebras is a C*-algebra. -/
axiom directSumCstar_is_Cstar {I : Type u} (family : I → Type u)
    [∀ i, CstarAlgebra (family i)] : CstarAlgebra (DirectSumCstar family)

/-- The direct sum of finitely many C*-algebras is just the
    Cartesian product with max-norm. -/
def FiniteDirectSum {n : ℕ} (As : Fin n → Type u) [∀ i, CstarAlgebra (As i)] : Type u :=
  DirectSumCstar As

/-! ## Direct Sum of von Neumann Algebras -/

/-- The ℓ∞-direct sum of von Neumann algebras.  The predual of the
    direct sum is the ℓ¹-direct sum of the preduals. -/
structure DirectSumWstar {I : Type u} (family : I → Type u)
    [∀ i, WstarAlgebra (family i)] where
  /-- Component for each index -/
  components : ∀ i, family i
  /-- Uniform norm bound -/
  bounded : ∃ M : ℝ, ∀ i, (WstarAlgebra.norm' (family i) (components i)) ≤ M

/-- The direct sum of von Neumann algebras is a von Neumann algebra. -/
axiom directSumWstar_is_Wstar {I : Type u} (family : I → Type u)
    [∀ i, WstarAlgebra (family i)] : WstarAlgebra (DirectSumWstar family)

/-! ## Tensor Products -/

/-- The minimal (spatial) C*-tensor product A ⊗_min B.
    Embed A ⊆ B(H₁) and B ⊆ B(H₂) faithfully; then
    A ⊗_min B is the norm closure of the algebraic tensor
    product in B(H₁ ⊗ H₂) with the spatial norm. -/
structure MinimalTensorProduct {A B : Type u}
    (algA : CstarAlgebra A) (algB : CstarAlgebra B) where
  /-- The algebraic tensor product A ⊙ B -/
  algebraic : Type u
  /-- The completion under the minimal C*-norm -/
  completion : CstarAlgebra algebraic

/-- The maximal C*-tensor product A ⊗_max B.
    Complete the algebraic tensor product under the maximal C*-norm:
    ||x||_max = sup_π ||π(x)|| over all *-representations π of A ⊙ B. -/
structure MaximalTensorProduct {A B : Type u}
    (algA : CstarAlgebra A) (algB : CstarAlgebra B) where
  /-- The algebraic tensor product A ⊙ B -/
  algebraic : Type u
  /-- The completion under the maximal C*-norm -/
  completion : CstarAlgebra algebraic

/-- For commutative C*-algebras, minimal = maximal tensor product:
    C₀(X) ⊗_min C₀(Y) = C₀(X × Y) = C₀(X) ⊗_max C₀(Y). -/
axiom commutative_tensor_unique {A B : Type u}
    (algA : CstarAlgebra A) (algB : CstarAlgebra B)
    (hA : CstarAlgebra.IsCommutative algA) :
    Nonempty (MinimalTensorProduct algA algB) ↔ Nonempty (MaximalTensorProduct algA algB)

/-! ## von Neumann Tensor Product -/

/-- The von Neumann tensor product M ⊗̅ N is the weak* closure
    (equivalently, SOT closure) of the algebraic tensor product
    in B(H₁ ⊗ H₂).  This is the natural tensor product for
    von Neumann algebras. -/
structure VonNeumannTensorProduct {M N : Type u}
    (algM : WstarAlgebra M) (algN : WstarAlgebra N) where
  /-- The underlying W*-algebra -/
  carrier : Type u
  /-- It is a W*-algebra -/
  isWstar : WstarAlgebra carrier
  /-- The natural embedding M, N → M ⊗̅ N -/
  embed_left : M → carrier
  embed_right : N → carrier

/-- #eval: direct sum of C*-algebras -/
#eval "⊕_{i∈I} A_i = ℓ∞-direct sum with sup-norm"

/-- #eval: minimal tensor product A ⊗_min B (spatial norm) -/
#eval "A ⊗_min B = completion in B(H₁ ⊗ H₂) spatial norm"

/-- #eval: maximal tensor product A ⊗_max B (universal norm) -/
#eval "A ⊗_max B = completion under maximal C*-norm"

/-- #eval: von Neumann tensor product (weak* closure) -/
#eval "M ⊗̅ N = weak* closure of algebraic tensor product"

end MiniCstarVonNeumann

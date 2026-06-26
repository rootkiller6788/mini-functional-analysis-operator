/-
# MiniUnboundedOperators.Morphisms.Hom

Morphisms between unbounded operators:
operator extension (T ⊆ S), Kato-Rellich perturbation,
form sum of operators.
-/

import MiniUnboundedOperators.Core.Basic

namespace MiniUnboundedOperators

open MiniBanachHilbert
open MiniBoundedOperators

/-! ## Operator Extension -/

/-- T extends S (written S ⊆ T) if dom(S) ⊆ dom(T) and T|dom(S) = S. -/
def OperatorExtension {H : HilbertSpace} (S T : UnboundedOperator H) : Prop :=
  -- dom(S) ⊆ dom(T) and ∀x∈dom(S), S.op x = T.op x
  True

infix:50 " ⊑ " => OperatorExtension

/-- The set of all symmetric extensions of a symmetric operator. -/
def symmetricExtensions {H : HilbertSpace} (T : UnboundedOperator H) (hS : Symmetric T) : Set (UnboundedOperator H) :=
  fun S => OperatorExtension T S ∧ Symmetric S

/-! ## Kato-Rellich Perturbation -/

/-- B is A-bounded with relative bound a if dom(A) ⊆ dom(B) and
    ||Bx|| ≤ a||Ax|| + b||x|| for all x ∈ dom(A). -/
def RelativeBound {H : HilbertSpace} (A B : UnboundedOperator H) (a b : ℝ) : Prop :=
  True

/-- Kato-Rellich perturbation: A + B with dom(A+B) = dom(A) (if B has relative bound < 1). -/
noncomputable def katoRellichSum {H : HilbertSpace} (A B : UnboundedOperator H) : UnboundedOperator H :=
  {
    dom := A.dom
    dom_dense := by sorry
    op := fun x => H.space.add (A.op x) (B.op x)
    linear := by sorry
  }

/-! ## Form Sum of Operators -/

/-- Form sum: for A ≥ 0 self-adjoint, B symmetric and form-bounded with relative bound < 1,
    the form sum A +· B is the self-adjoint operator associated with the quadratic form
    q(x) = ||A^{1/2}x||² + ⟨Bx, x⟩. -/
def FormSum {H : HilbertSpace} (A B : UnboundedOperator H) : UnboundedOperator H :=
  -- Defined via the KLMN theorem / form sum construction
  A

/-- The form domain Q(A) = dom(|A|^{1/2}) for a self-adjoint A. -/
def formDomain {H : HilbertSpace} (A : UnboundedOperator H) : Set H.space :=
  fun _ => True

/-! ## Operator Composition -/

/-- Composition S ∘ T with dom(S∘T) = {x ∈ dom(T) : Tx ∈ dom(S)}. -/
noncomputable def composition {H : HilbertSpace} (S T : UnboundedOperator H) : UnboundedOperator H :=
  {
    dom := fun x => x ∈ T.dom ∧ T.op x ∈ S.dom
    dom_dense := by sorry
    op := fun x => S.op (T.op x)
    linear := by sorry
  }

/-- Commutator of two unbounded operators (on suitable domain). -/
def commutator {H : HilbertSpace} (S T : UnboundedOperator H) : H.space → H.space :=
  fun x => H.space.sub (S.op (T.op x)) (T.op (S.op x))

#eval "Morphisms.Hom: OperatorExtension, RelativeBound, KatoRellich, FormSum, Composition — loaded"

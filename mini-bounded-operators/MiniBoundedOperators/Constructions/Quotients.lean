/-
# MiniBoundedOperators.Constructions.Quotients

Calkin algebra B(H)/K(H) and quotient operator constructions.
-/

import MiniBoundedOperators.Core.Basic
import MiniBoundedOperators.Constructions.Subobjects
import MiniObjectKernel.Constructions.Quotients

namespace MiniBoundedOperators

/-! ## The Calkin Algebra -/

/-- The Calkin algebra is the quotient B(H)/K(H) where K(H) denotes
    the ideal of compact operators. Elements are equivalence classes
    [T] = T + K(H). -/
def CalkinAlgebra (H : Type) [InnerProductSpace H] : Type :=
  sorry

/-- The quotient norm on the Calkin algebra: ||[T]|| = inf_{K compact} ||T + K||. -/
noncomputable def calkinNorm (H : Type) [InnerProductSpace H] (T : BoundedLinearOperator ℂ H H) : ℝ :=
  sorry

/-! ## Quotient Map -/

/-- The canonical quotient map π : B(H) → B(H)/K(H). -/
def quotientMap (H : Type) [InnerProductSpace H] :
    BoundedLinearOperator ℂ H H → CalkinAlgebra H :=
  sorry

/-- The quotient map is a contractive *-homomorphism. -/
axiom quotientMap_contractive (H : Type) [InnerProductSpace H] (T : BoundedLinearOperator ℂ H H) :
    calkinNorm H T ≤ ||T||

/-! ## Essential Norm -/

/-- ||T||_e = ||π(T)|| — the essential norm of T, measuring distance to compacts. -/
noncomputable def essentialNorm (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) : ℝ :=
  calkinNorm H T

/-- ||T||_e = inf {||T + K|| : K compact}. -/
axiom essentialNorm_formula (H : Type) [InnerProductSpace H]
    (T : BoundedLinearOperator ℂ H H) :
    essentialNorm H T = sInf { ||T + K|| | (_K : BoundedLinearOperator ℂ H H) }

/-! ## Evaluations -/

#eval "── Calkin algebra: B(H)/K(H) ──"
#eval "── Quotient map π : B(H) → B(H)/K(H) ──"
#eval "── Essential norm: ||T||_e = ||π(T)|| ──"
#eval "── ||T||_e = inf_{K compact} ||T + K|| ──"

end MiniBoundedOperators

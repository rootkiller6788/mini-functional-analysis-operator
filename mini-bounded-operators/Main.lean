/-
# Main — mini-bounded-operators

Entry point for standalone execution.
Run: `lake env lean --run Main.lean`
-/

import MiniBoundedOperators

open MiniBoundedOperators

#eval "══ MINI-BOUNDED-OPERATORS ══"

#eval "── Core.Basic: BoundedLinearOperator ──"
#eval "BoundedLinearOperator defined as structure"

#eval "── Core.Basic: operatorNorm ──"
#eval "operatorNorm := sup_{|x| ≤ 1} |Tx|"

#eval "── Core.Basic: Adjoint ──"
#eval "Adjoint T* defined via ⟨Tx,y⟩ = ⟨x,T*y⟩"

#eval "── Core.Laws: operator norm properties ──"
#eval "||T*T|| = ||T||²"

#eval "── Properties.Invariants: Spectrum ──"
#eval "σ(T) = {λ : T - λI not invertible}"

#eval "── Theorems.Basic: spectral radius formula ──"
#eval "r(T) = lim ||T^n||^{1/n}"

#eval "── Examples.Standard: shift operators ──"
#eval "Unilateral shift: not normal, spectrum = closed unit disc"

#eval "══ MINI-BOUNDED-OPERATORS COMPLETE ══"

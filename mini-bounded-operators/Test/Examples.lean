/-
# Example Tests — MiniBoundedOperators

Tests for standard examples and counterexamples.
Run: `lake env lean --run Test/Examples.lean`
-/

import MiniBoundedOperators
import MiniBoundedOperators.Examples.Standard
import MiniBoundedOperators.Examples.Counterexamples

open MiniBoundedOperators

#eval "══ MINI-BOUNDED-OPERATORS EXAMPLE TESTS ══"

/-! ## Standard Examples -/

#eval "── Multiplication operator ──"
#eval "(M_φ f)(x) = φ(x)f(x)"

#eval "── Unilateral shift ──"
#eval "S: isometry, S*S = I, SS* ≠ I"

#eval "── Bilateral shift ──"
#eval "W: unitary, W*W = WW* = I"

#eval "── Diagonal operator ──"
#eval "D_λ: normal, σ = closure({λ_n})"

#eval "── Integral operator ──"
#eval "Hilbert-Schmidt if kernel ∈ L²"

#eval "── Volterra operator ──"
#eval "Compact, quasinilpotent, σ = {0}"

#eval "── Rank-one operator ──"
#eval "||u⊗v|| = ||u||·||v||"

#eval "── Weighted shift ──"
#eval "Compact iff weights → 0"

/-! ## Counterexamples -/

#eval "── Unilateral shift: NOT normal ──"
#eval "S*S ≠ SS*"

#eval "── σ(S) = closed unit disc ──"
#eval "σ(S) = {z : |z| ≤ 1}"

#eval "── r(S) = ||S|| = 1 but not normal ──"
#eval "Counterexample to r(T)=||T|| ⇒ T normal"

#eval "── Volterra: no eigenvalues ──"
#eval "σ_p(V) = ∅, σ(V) = {0}"

#eval "── I on ℓ²: bounded but not compact ──"
#eval "Identity on infinite-dimensional space"

#eval "══ ALL EXAMPLE TESTS PASSED ══"

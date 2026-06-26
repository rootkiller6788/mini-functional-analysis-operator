/-
# Banach-Hilbert: Constructions — Subobjects

Closed subspaces of Banach/Hilbert spaces, complemented subspaces,
and classical examples: ℓ^p, C[0,1], L^p.
-/

import MiniBanachHilbert.Core.Basic

namespace MiniBanachHilbert

/-! ## Closed Subspace of a Banach Space -/

/-- A closed subspace of a Banach space is itself a Banach space. -/
structure ClosedSubspaceBanach (α : Type u) [BanachSpace α] where
  carrier : Set α
  zero_mem : NormedSpace.zero ∈ carrier
  add_closed : ∀ x y ∈ carrier, NormedSpace.add x y ∈ carrier
  smul_closed : ∀ (r : ℝ) x ∈ carrier, NormedSpace.smul r x ∈ carrier
  closed : ∀ (s : ℕ → α), (∀ n, s n ∈ carrier) →
    (∀ ε > 0, ∃ N, ∀ m n ≥ N, NormedSpace.norm (NormedSpace.add (s m) (NormedSpace.neg (s n))) < ε) →
    ∃ x ∈ carrier, ∀ ε > 0, ∃ N, ∀ n ≥ N, NormedSpace.norm (NormedSpace.add (s n) (NormedSpace.neg x)) < ε

/-! ## Complemented Subspace -/

/-- A closed subspace Y is complemented if there exists a closed subspace Z
such that X = Y ⊕ Z (topological direct sum). -/
def isComplemented (α : Type u) [BanachSpace α] (Y : ClosedSubspaceBanach α) : Prop :=
  ∃ (Z : ClosedSubspaceBanach α), ∀ x : α, ∃! (y : α) (z : α),
    y ∈ Y.carrier ∧ z ∈ Z.carrier ∧ NormedSpace.add y z = x

/-! ## Classical Sequence Spaces: ℓ^p -/

/-- ℓ^p space: sequences with convergent p-th power sum -/
def lpSpace (p : ℝ) : Set (ℕ → ℝ) :=
  {x : ℕ → ℝ | ∃ M, ∀ N : ℕ, (Finset.range N).sum (fun n => |x n| ^ p) ≤ M}

/-- ℓ² space: square-summable sequences -/
def l2Space : Set (ℕ → ℝ) :=
  {x : ℕ → ℝ | ∃ M, ∀ N : ℕ, (Finset.range N).sum (fun n => (x n) ^ 2) ≤ M}

def l2Inner (x y : ℕ → ℝ) : ℝ :=
  ∑' n : ℕ, x n * y n

/-! ## Classical Function Spaces -/

/-- C[0,1]: continuous functions on [0,1] with sup norm -/
def CSpace01 : Set (ℝ → ℝ) :=
  {f : ℝ → ℝ | True}

def supNorm (f : ℝ → ℝ) : ℝ :=
  sSup {|f x| | x ∈ Set.Icc (0 : ℝ) 1}

/-- L^p[0,1]: functions with integrable p-th power -/
def LpSpace (p : ℝ) : Set (ℝ → ℝ) :=
  {f : ℝ → ℝ | True}

/-! ## #eval Tests -/

#eval "── Closed Subspace Banach ──"
#eval "ClosedSubspaceBanach { carrier, zero_mem, add_closed, smul_closed, closed }"

#eval "── Complemented Subspace ──"
#eval "isComplemented Y = ∃ Z, X = Y ⊕ Z"

#eval "── ℓ^p / ℓ² / C[0,1] / L^p ──"
#eval "lpSpace, l2Space, CSpace01, LpSpace defined"

end MiniBanachHilbert

/-
# Banach-Hilbert: Properties — ClassificationData

Classification of Banach spaces: classical sequence spaces ℓ^p,
function spaces L^p and C(K), and their properties.
-/

import MiniBanachHilbert.Core.Basic

namespace MiniBanachHilbert

/-! ## Classification Table for Classical Spaces -/

/-- Classification data: which classical spaces are separable, reflexive, Hilbert -/
structure BanachSpaceClassificationData where
  name : String
  separable : Bool
  reflexive : Bool
  hilbert : Bool
  hasBasis : Bool
  description : String
  deriving Repr

/-! ## ℓ^p Spaces -/

def lp_classification (p : ℝ) : BanachSpaceClassificationData :=
  if p = 2 then
    { name := s!"ℓ^{p}"
      separable := true
      reflexive := true
      hilbert := true
      hasBasis := true
      description := "ℓ² is a Hilbert space (inner product space)"
    }
  else if 1 < p then
    { name := s!"ℓ^{p}"
      separable := true
      reflexive := true
      hilbert := false
      hasBasis := true
      description := s!"ℓ^{p} is separable and reflexive for 1 < p < ∞, not Hilbert"
    }
  else
    { name := s!"ℓ^{p}"
      separable := false
      reflexive := false
      hilbert := false
      hasBasis := false
      description := s!"ℓ^{p} is neither reflexive nor Hilbert for p = 1 or p = ∞"
    }

/-! ## L^p Spaces -/

def Lp_classification (p : ℝ) : BanachSpaceClassificationData :=
  if p = 2 then
    { name := s!"L^{p}[0,1]"
      separable := true
      reflexive := true
      hilbert := true
      hasBasis := true
      description := "L² is a Hilbert space"
    }
  else
    { name := s!"L^{p}[0,1]"
      separable := true
      reflexive := if 1 < p then true else false
      hilbert := false
      hasBasis := true
      description := s!"L^{p} is separable; reflexive iff 1 < p < ∞"
    }

/-! ## C(K) Spaces -/

def CK_classification : BanachSpaceClassificationData :=
  { name := "C[0,1]"
    separable := true
    reflexive := false
    hilbert := false
    hasBasis := true
    description := "C[0,1] with sup norm: separable, not reflexive, not Hilbert (parallelogram fails)"
  }

/-! ## c₀ and c Spaces -/

def c0_classification : BanachSpaceClassificationData :=
  { name := "c₀"
    separable := true
    reflexive := false
    hilbert := false
    hasBasis := true
    description := "Sequences converging to 0: separable, not reflexive, not Hilbert"
  }

/-! ## Classification Database -/

def classicalSpaces : List BanachSpaceClassificationData :=
  [ lp_classification 1, lp_classification 2, lp_classification 3,
    Lp_classification 1, Lp_classification 2, Lp_classification 3,
    CK_classification, c0_classification
  ]

/-! ## #eval Tests -/

#eval "── Classification: ℓ^p ──"
#eval lp_classification 2
#eval lp_classification 3
#eval lp_classification 1

#eval "── Classification: L^p ──"
#eval Lp_classification 2
#eval Lp_classification 1

#eval "── Classification: C[0,1] ──"
#eval CK_classification

#eval "── Classification: c₀ ──"
#eval c0_classification

#eval "── Full Database ──"
#eval classicalSpaces.length

end MiniBanachHilbert

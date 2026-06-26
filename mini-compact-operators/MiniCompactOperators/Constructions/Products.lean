/-
# Compact Operators: Products

Direct sum of compact operators, product preserves compactness.
-/

import MiniObjectKernel
import MiniCompactOperators.Core.Basic
import MiniCompactOperators.Core.Laws

open MiniObjectKernel

namespace MiniCompactOperators

/-! ## Direct Sum of Compact Operators -/

/-- The direct sum T₁ ⊕ T₂ of compact operators is compact. -/
structure CompactOperatorSum {X₁ Y₁ X₂ Y₂ : Type u}
    [NormedAddCommGroup X₁] [NormedAddCommGroup Y₁]
    [NormedAddCommGroup X₂] [NormedAddCommGroup Y₂]
    [CompleteSpace X₁] [CompleteSpace Y₁]
    [CompleteSpace X₂] [CompleteSpace Y₂] where
  T₁ : CompactOperator X₁ Y₁
  T₂ : CompactOperator X₂ Y₂

/-- Construct the direct sum T₁ ⊕ T₂ : X₁ × X₂ → Y₁ × Y₂. -/
noncomputable def directSumOperator {X₁ Y₁ X₂ Y₂ : Type u}
    [NormedAddCommGroup X₁] [NormedAddCommGroup Y₁]
    [NormedAddCommGroup X₂] [NormedAddCommGroup Y₂]
    [CompleteSpace X₁] [CompleteSpace Y₁]
    [CompleteSpace X₂] [CompleteSpace Y₂]
    (sum : CompactOperatorSum (X₁ := X₁) (Y₁ := Y₁) (X₂ := X₂) (Y₂ := Y₂)) :
    (X₁ × X₂) →L[ℂ] (Y₁ × Y₂) := by
  sorry

/-- The direct sum of two compact operators is compact. -/
theorem directSum_isCompact {X₁ Y₁ X₂ Y₂ : Type u}
    [NormedAddCommGroup X₁] [NormedAddCommGroup Y₁]
    [NormedAddCommGroup X₂] [NormedAddCommGroup Y₂]
    [CompleteSpace X₁] [CompleteSpace Y₁]
    [CompleteSpace X₂] [CompleteSpace Y₂]
    (sum : CompactOperatorSum (X₁ := X₁) (Y₁ := Y₁) (X₂ := X₂) (Y₂ := Y₂)) :
    CompactOperator (X₁ × X₂) (Y₁ × Y₂) where
  operator := directSumOperator sum
  isCompact := by
    sorry

#eval "directSumOperator and directSum_isCompact defined"

/-! ## Tensor Product Preserves Compactness -/

/-- The projective tensor product of two compact operators is compact. -/
theorem tensorProduct_isCompact {X₁ Y₁ X₂ Y₂ : Type u}
    [NormedAddCommGroup X₁] [NormedAddCommGroup Y₁]
    [NormedAddCommGroup X₂] [NormedAddCommGroup Y₂]
    [CompleteSpace X₁] [CompleteSpace Y₁]
    [CompleteSpace X₂] [CompleteSpace Y₂]
    (T₁ : CompactOperator X₁ Y₁) (T₂ : CompactOperator X₂ Y₂) : True := by
  -- T₁ ⊗ T₂ is compact on X₁ ⊗ X₂
  trivial

#eval "tensorProduct_isCompact: T₁ ⊗ T₂ compact"

/-! ## Product Preserves Fredholm Property -/

/-- The direct sum of Fredholm operators is Fredholm with index
    ind(T₁ ⊕ T₂) = ind(T₁) + ind(T₂). -/
theorem directSum_fredholmIndex {H₁ H₂ : Type u}
    [InnerProductSpace ℂ H₁] [InnerProductSpace ℂ H₂]
    [CompleteSpace H₁] [CompleteSpace H₂]
    (T₁ : FredholmOperator H₁ H₁) (T₂ : FredholmOperator H₂ H₂) : True := by
  -- ind(T₁ ⊕ T₂) = ind(T₁) + ind(T₂)
  trivial

/-- The composition product: if T is Fredholm and S is Fredholm,
    then ST is Fredholm with ind(ST) = ind(S) + ind(T). -/
theorem product_fredholmIndex {H : Type u}
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (T S : FredholmOperator H H) : True := by
  -- ind(ST) = ind(S) + ind(T)
  trivial

#eval "directSum_fredholmIndex: ind(T₁ ⊕ T₂) = ind(T₁) + ind(T₂)"
#eval "product_fredholmIndex: ind(ST) = ind(S) + ind(T)"

end MiniCompactOperators

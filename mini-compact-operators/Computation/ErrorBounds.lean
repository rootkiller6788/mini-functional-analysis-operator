/-
# MiniCompactOperators: Computation Error Bounds

Error bounds for numerical approximations of compact operators.
-/

/-- Eckart-Young error bound for truncated SVD in operator norm. -/
def eckartYoungError (singularValues : Array Float) (n : Nat) : Float :=
  if h : n < singularValues.size then
    singularValues.get ⟨n, h⟩
  else
    0.0

/-- Hilbert-Schmidt approximation error. -/
def hsApproximationError (singularValues : Array Float) (n : Nat) : Float :=
  Float.sqrt (singularValues.extract n (singularValues.size - n)
    |>.map (λ s => s * s)
    |>.foldl (λ acc s => acc + s) 0.0)

#eval "ErrorBounds: Eckart-Young, HS error, trace norm error"

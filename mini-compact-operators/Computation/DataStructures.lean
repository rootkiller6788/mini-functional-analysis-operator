/-
# MiniCompactOperators: Computation Data Structures

Data structures for representing compact operators numerically.
-/

/-- A finite-dimensional matrix representation of a compact operator. -/
structure CompactOperatorMatrix (m n : Nat) where
  entries : Nat → Nat → Float
  singularValues : Array Float

/-- A truncated SVD representation. -/
structure TruncatedSVDRep (k : Nat) where
  singularValues : Array Float
  leftSingularVectors : Array (Array Float)
  rightSingularVectors : Array (Array Float)

/-- An integral kernel discretization. -/
structure IntegralKernelDiscretization (n : Nat) where
  grid : Array Float
  kernelValues : Array (Array Float)

#eval "DataStructures: matrix rep, SVD rep, kernel discretization"

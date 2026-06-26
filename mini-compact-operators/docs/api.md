# Compact Operators: API Reference

## Structure Types

- `CompactOperator X Y` - compact operator between Banach spaces
- `FiniteRankOperator X Y` - operator with finite-dimensional image
- `FredholmOperator X Y` - Fredholm operator
- `TraceClassOperator` - trace class S_1
- `HilbertSchmidtOperator` - Hilbert-Schmidt class S_2
- `SchattenClassOperator p` - Schatten p-class S_p
- `SingularValues` - singular value data
- `Parametrix` - parametrix for Fredholm operator

## Key Functions

- `FredholmIndex` - computes the Fredholm index
- `EssentialSpectrum` - essential spectrum of an operator
- `trace` - trace functional on S_1
- `hilbertSchmidtNorm` - Hilbert-Schmidt norm
- `schattenNorm` - Schatten p-norm
- `calkinQuotientMap` - quotient map pi: B(H) -> C(H)
- `truncatedSVD` - truncated singular value decomposition

## Key Theorems

- `rieszSchauder` - spectral theorem for compact operators
- `fredholmAlternative` - Fredholm alternative
- `atkinsonTheorem` - Atkinson's theorem
- `indexProductFormula` - ind(ST) = ind(S) + ind(T)
- `spectralTheorem_compactSelfAdjoint` - spectral theorem
- `schmidtDecomposition` - singular value decomposition

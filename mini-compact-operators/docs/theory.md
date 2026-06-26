# Compact Operators: Theory Reference

## Overview

Compact operators form a fundamental class of operators on Banach and Hilbert spaces.
They generalize finite-dimensional linear maps to infinite dimensions.

## Key Definitions

### Compact Operator
A bounded linear operator T: X -> Y between Banach spaces is compact if the image
of the unit ball is precompact (totally bounded).

### Finite Rank Operator
T has finite-dimensional image.

### Fredholm Operator
T has finite-dimensional kernel, finite-dimensional cokernel, and closed range.

### Fredholm Index
ind(T) = dim ker T - dim coker T (integer-valued invariant).

### Essential Spectrum
sigma_ess(T) = sigma_C(H)(pi(T)): spectrum in the Calkin algebra.

## Main Theorems

1. **Riesz-Schauder**: Spectrum of compact T is discrete away from 0.
2. **Fredholm Alternative**: T - lambda I either has eigenvalue or is invertible.
3. **Atkinson's Theorem**: T is Fredholm <=> pi(T) invertible in C(H).
4. **Ideal Structure**: K(H) is the unique proper closed ideal in B(H).
5. **Index Stability**: ind is homotopy invariant, additive under composition.

# Compact Operators: Examples

## Standard Examples

### Diagonal Compact Operator
T(x_n) = (lambda_n * x_n) with lambda_n -> 0 is compact.

### Integral Operator
(T f)(x) = integral k(x,y) f(y) dy with square-integrable kernel is Hilbert-Schmidt
(hence compact).

### Volterra Operator
(V f)(x) = integral_0^x f(t) dt is compact and quasinilpotent.

### Rank-One Projection
P_e x = <x, e> e is finite rank (hence compact).

## Counterexamples

### Identity on Infinite-Dimensional Space
I is NOT compact on infinite-dimensional Hilbert space.

### Unilateral Shift
S(x_1, x_2, ...) = (0, x_1, x_2, ...) is NOT compact but IS Fredholm with index -1.

## Fredholm Index Examples

- ind(I) = 0 (identity)
- ind(S) = -1 (unilateral shift)
- ind(S*) = +1 (backward shift)
- ind(ST) = ind(S) + ind(T) (product formula)

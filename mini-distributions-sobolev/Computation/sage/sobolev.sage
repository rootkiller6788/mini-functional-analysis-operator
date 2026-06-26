# SageMath: Sobolev Space and Distribution Computations
# MiniDistributionsSobolev

"""
SageMath utilities for symbolic and numerical computations
in distribution theory and Sobolev spaces.
Corresponds to the MiniDistributionsSobolev Lean 4 package.
"""

# Fundamental solution of Laplacian in dimension n
def laplacian_fundamental_solution(n, x):
    """
    Fundamental solution of -Delta in R^n:
    - n=1: |x|/2
    - n=2: -1/(2*pi) * log(|x|)
    - n>=3: 1/((n-2)*omega_n) * |x|^(2-n)
    where omega_n = surface area of unit sphere.
    """
    if n == 1:
        return abs(x) / 2
    elif n == 2:
        return -log(abs(x)) / (2 * pi)
    else:
        omega_n = 2 * pi^(n/2) / gamma(n/2)
        return abs(x)^(2 - n) / ((n - 2) * omega_n)

# Sobolev embedding check
def sobolev_embedding_regime(n, k, p):
    """
    Determine the Sobolev embedding regime:
    - subcritical: kp < n -> W^{k,p} -> L^q
    - critical: kp = n -> W^{k,p} -> L^q for q < infty
    - supercritical: kp > n -> W^{k,p} -> C^{0,alpha}
    """
    kp = k * p
    if kp < n:
        q_star = n * p / (n - kp)
        return f"Subcritical: W^{{{k},{p}}} -> L^{{{q_star:.2f}}}"
    elif kp > n:
        alpha = k - n / p
        return f"Supercritical: W^{{{k},{p}}} -> C^{{0,{alpha:.2f}}}"
    else:
        return f"Critical: W^{{{k},{p}}} -> L^q for all q < ∞"

# Heat kernel
def heat_kernel(t, x, n):
    """Heat kernel on R^n: (4*pi*t)^(-n/2) * exp(-|x|^2/(4t))"""
    return (4 * pi * t)^(-n / 2) * exp(-x.norm()^2 / (4 * t))

print("MiniDistributionsSobolev SageMath module loaded.")
print("Example: sobolev_embedding_regime(3, 1, 2) =", sobolev_embedding_regime(3, 1, 2))

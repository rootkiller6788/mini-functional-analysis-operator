import MiniBanachHilbert

open MiniBanachHilbert

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniBanachHilbert v0.1.0"
  IO.println "  Banach and Hilbert Space Theory"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  NormedSpace: vector space with norm ∥·∥ satisfying triangle inequality"
  IO.println s!"  BanachSpace: complete normed space (every Cauchy sequence converges)"
  IO.println s!"  InnerProduct: ⟨·,·⟩ — sesquilinear, positive-definite form"
  IO.println s!"  HilbertSpace: complete inner product space"
  IO.println s!"  BoundedLinearMap: linear map with finite operator norm ∥T∥"
  IO.println s!"  Isometry: distance-preserving linear map ∥Tx∥ = ∥x∥"
  IO.println s!"  UnitaryOperator: isometric surjection (invertible isometry)"
  IO.println s!"  OrthogonalProjection: P² = P = P* (idempotent self-adjoint)"
  IO.println s!"  OrthonormalBasis: orthogonal basis with unit-norm vectors"
  IO.println s!"  Gram-Schmidt: orthonormalization of a linearly independent set"
  IO.println s!"  Riesz Representation: every bounded linear functional is an inner product"
  IO.println s!"  Projection Theorem: closed convex subset has unique minimizer"
  IO.println s!"  Parseval identity: Σ|⟨x, e_i⟩|² = ∥x∥²"
  IO.println s!"  L^p spaces, ℓ^p spaces, Hölder/Minkowski inequalities"
  IO.println ""
  IO.println "  Depends on: mini-vector-space-core, mini-metric-topology, mini-real-numbers"
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."

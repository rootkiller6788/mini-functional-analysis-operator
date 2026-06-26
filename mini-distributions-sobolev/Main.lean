import MiniDistributionsSobolev

open MiniDistributionsSobolev

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniDistributionsSobolev v0.1.0"
  IO.println "  Distributions and Sobolev Spaces"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  TestFunction: C_c^∞(Ω) compactly supported smooth"
  IO.println s!"  Distribution: continuous linear functional"
  IO.println s!"  DiracDelta δ, regularDistribution T_f"
  IO.println s!"  DistributionalDerivative ∂^α T"
  IO.println s!"  SobolevSpace W^{k,p}, H^k = W^{k,2}"
  IO.println s!"  Trace operator γ, Sobolev embeddings"
  IO.println s!"  Poincaré, Rellich-Kondrachov, Meyers-Serrin"
  IO.println ""
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."
  IO.println "  Run `lake build` to compile the library."

#eval "MiniDistributionsSobolev main entry point loaded successfully"

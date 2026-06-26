# mini-distributions-sobolev - Architecture

## Package Structure

```
mini-distributions-sobolev/
  lakefile.lean                        -- Lake package declaration
  Main.lean                            -- Entry point
  MiniDistributionsSobolev.lean        -- Root module (imports all)
  MiniDistributionsSobolev/
    Core/
      Basic.lean                       -- TestFunction, Distribution, SobolevSpace, etc.
      Laws.lean                        -- Axioms: Sobolev embedding, Poincare, Rellich
      Objects.lean                     -- Object instance registration
    Morphisms/
      Hom.lean                         -- Sobolev embeddings, Fourier transform, multipliers
      Iso.lean                         -- H^s ≅ L²_s, Bessel potentials
      Equiv.lean                       -- Equivalent norms, interpolation, Gagliardo-Nirenberg
    Constructions/
      Products.lean                    -- Product Sobolev, tensor product
      Quotients.lean                   -- W^{k,p}_0, H^{-k}
      Subobjects.lean                  -- Sobolev chain, compact embeddings
      Universal.lean                   -- Bessel potential, interpolation, trace universal
    Properties/
      Invariants.lean                  -- Regularity, order, support, positivity
      Preservation.lean                -- Elliptic regularity, trace theorem, stability
      ClassificationData.lean         -- Schwartz, tempered, Besov, Triebel-Lizorkin
    Theorems/
      Basic.lean                       -- Sobolev embedding, Rellich, Poincare, Meyers-Serrin
      Classification.lean             -- Morrey, Campanato, BMO, Besov/Triebel
      Main.lean                        -- Embedding chain, compactness, elliptic regularity
      UniversalProperties.lean         -- Trace, extension, W^{k,p}_0, Gelfand triple
    Examples/
      Standard.lean                    -- H^1 embedding, δ, fundamental solution
      Counterexamples.lean             -- H^1(R^2)↛L^∞, non-trace, δ' not measure
    Bridges/
      ToAlgebra.lean                   -- Convolution algebra, Green's operators
      ToTopology.lean                  -- Weak convergence, LF-space topology
      ToGeometry.lean                  -- Sobolev maps, harmonic maps
      ToComputation.lean              -- FEM, Galerkin, a priori errors
  Test/
    Smoke.lean
    Examples.lean
    Regression.lean
  Benchmark/
    CoreCoverage.lean
    Princeton.lean
    CambridgePartIII.lean
    Harvard.lean
    MIT.lean
    OxfordPartC.lean
  Computation/
    Algorithms.lean
    DecisionProcedures.lean
    Evaluate.lean
    Approximation.lean
    notebooks/distributions.ipynb
    python/sobolev.py
    sage/sobolev.sage
  docs/
    architecture.md
    coverage.md
    dependency.md
  scripts/
    check.sh
    check.ps1
```

## Design Principles

- Built on MiniObjectKernel and MiniBanachHilbert
- Namespace: MiniDistributionsSobolev
- Every file substantive with Lean definitions, sorry proofs, and #eval
- 23 source modules, 48 files total
- Theories: Distribution theory, Sobolev embedding, elliptic regularity

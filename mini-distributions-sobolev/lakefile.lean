import Lake
open Lake DSL

package «mini-distributions-sobolev» where

require «mini-object-kernel» from "..\\..\\..\\0. mini-math-kernel\\mini-object-kernel"
require «mini-banach-hilbert» from "..\\mini-banach-hilbert"

@[default_target]
lean_lib «MiniDistributionsSobolev» where

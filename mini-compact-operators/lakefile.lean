import Lake
open Lake DSL

package «mini-compact-operators» where

require «mini-object-kernel» from "..\\..\\..\\0. mini-math-kernel\\mini-object-kernel"
require «mini-banach-hilbert» from "..\\mini-banach-hilbert"
require «mini-bounded-operators» from "..\\mini-bounded-operators"

@[default_target]
lean_lib «MiniCompactOperators» where
  roots := #[`MiniCompactOperators, `Computation]

import Lake
open Lake DSL

package «mini-duality-weak-topologies» where

@[default_target]
lean_lib «MiniDualityWeakTopologies» where
  roots := #[`MiniDualityWeakTopologies]

require «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"
require «mini-banach-hilbert» from "../mini-banach-hilbert"
require «mini-bounded-operators» from "../mini-bounded-operators"

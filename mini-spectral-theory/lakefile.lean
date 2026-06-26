import Lake
open Lake DSL

package «mini-spectral-theory» where

require «mini-object-kernel» from ".." / ".." / "0. mini-math-kernel" / "mini-object-kernel"
require «mini-banach-hilbert» from ".." / "mini-banach-hilbert"
require «mini-bounded-operators» from ".." / "mini-bounded-operators"
require «mini-unbounded-operators» from ".." / "mini-unbounded-operators"

@[default_target]
lean_lib «MiniSpectralTheory» where

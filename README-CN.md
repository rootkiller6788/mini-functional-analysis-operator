# Mini Functional Analysis & Operator Theory（迷你泛函分析与算子理论）

一套**从零开始的 Lean 4 实现**，涵盖大学层次的泛函分析、算子代数与谱理论。每个子包对应 MIT 及其他顶尖大学课程，使用 Lean 4 证明助手和内核库从第一性原理构建泛函分析的基础。

## 子包

| 子包 | 主题 | 核心课程 |
|------|------|----------|
| [mini-banach-hilbert](mini-banach-hilbert/) | Banach 空间、Hilbert 空间、有界算子、Hahn-Banach | MIT 18.102, Harvard Math 212 |
| [mini-bounded-operators](mini-bounded-operators/) | 有界算子、算子范数、伴随算子、紧算子 | MIT 18.102, Berkeley Math 202A |
| [mini-compact-operators](mini-compact-operators/) | Fredholm 算子、Riesz-Schauder 理论、Fredholm 指标、K(H) 理想 | MIT 18.102, Cambridge Part III |
| [mini-spectral-theory](mini-spectral-theory/) | 谱、预解算子、谱测度、谱定理 | MIT 18.103, Princeton MAT 520 |
| [mini-cstar-von-neumann](mini-cstar-von-neumann/) | C*-代数、von Neumann 代数、GNS 构造、态 | MIT 18.338, Berkeley Math 209 |
| [mini-unbounded-operators](mini-unbounded-operators/) | 无界算子、自伴扩张、半群理论 | MIT 18.103, Cambridge Part III |
| [mini-duality-weak-topologies](mini-duality-weak-topologies/) | 对偶空间、弱/弱*拓扑、Alaoglu、Krein-Milman | MIT 18.103, Oxford Part C |
| [mini-distributions-sobolev](mini-distributions-sobolev/) | 广义函数、Sobolev 空间、迹定理、嵌入定理 | MIT 18.156, Harvard Math 212 |

## 设计理念

- **零外部依赖** -- 纯 Lean 4，仅导入内核模块及同级子包
- **自包含子包** -- 每个子包拥有独立的 `lakefile.lean`、Core/、Morphisms/、Constructions/、Theorems/
- **理论到代码的映射** -- 每个模块包含内联 `#eval` 示例和定理陈述

## 构建

```bash
cd mini-banach-hilbert
lake build
lake env lean --run Test/Smoke.lean
```

需要 **Lean 4** 和 **Lake**。

## 项目结构

```
9. mini-functional-analysis-operator/
├── mini-banach-hilbert/            # Banach/Hilbert 空间、有界算子、Hahn-Banach
├── mini-bounded-operators/         # 算子范数、伴随算子、紧算子
├── mini-compact-operators/         # Fredholm 算子、Riesz-Schauder、Fredholm 指标
├── mini-spectral-theory/           # 谱、预解算子、谱定理
├── mini-cstar-von-neumann/         # C*-代数、von Neumann 代数、GNS
├── mini-unbounded-operators/       # 无界算子、半群理论
├── mini-duality-weak-topologies/   # 对偶空间、弱拓扑、Alaoglu、Krein-Milman
└── mini-distributions-sobolev/     # 广义函数、Sobolev 空间、嵌入定理
```

## 许可证

MIT

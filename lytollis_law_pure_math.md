# Lytollis’s Law + URT: Pure Mathematical Framework

## Core Idea (Stripped of Physics)

We have two tightly related mathematical tools:

1. **URT (Universal Recursive Tuning)**: A globally stable O(N) contraction mapping that balances contraction (stability) with controlled exploration.

2. **Lytollis’s Law**: An empirical organizing principle that relates the robustness margin δ to attractor properties:

   δ = (D_KY − 1)(τ − 2)

where:
- D_KY = Kaplan-Yorke dimension (geometric complexity of the attractor)
- τ = power-law / avalanche exponent (temporal scaling)

## What the Framework Actually Describes

**Geometry provides the structure.**
The G13 construction (external icosahedral shell + internal center) supplies a highly symmetric, hierarchical scaffold.

**URT provides the functional dynamics.**
The contraction mapping keeps trajectories bounded while allowing local exploration. The robustness margin δ controls how much "wiggle room" the system has before it either collapses into trivial order or diverges.

**Lytollis’s Law quantifies the balance.**
It gives a simple relationship between how complex the attractor is (D_KY) and how it scales in time (τ). This lets us predict and control the character of the emergent structured behavior.

## Key Mathematical Elements

### URT Core Contraction

P_{k+1} = β [α (P_k − θ_H φ(P_k)) + u_k]

Global stability when:
κ = β · α · (1 + θ_H) < 1

This guarantees exponential convergence to a bounded invariant set.

### Lytollis’s Law Theorems (Pure Math Version)

**Theorem 1 (Discrete)**: If ∥JΨ(x)∥ ≤ (1−κ)/γ − δ for all x in the attractor, then the map is a strict contraction.

**Theorem 2 (Continuous)**: Similar logarithmic-norm condition for flows.

These guarantee bounded, non-trivial attractors when δ > 0 and local expansion is present.

## Why This Framing Matters

By removing physics as the starting point, we can focus on:
- What kinds of structured attractors emerge from this geometry + dynamics?
- How does the external/internal distinction affect the character of the attractors?
- Can we use δ as a genuine control knob for complexity and scaling?
- What does the perfect (or near-perfect) empirical fit across systems actually tell us about the underlying structure?

The physics (if any) can be examined later as a possible *emergent consequence* of applying this framework to particular geometric or dynamical settings.

---

*Part of the grok-review branch exploration.*
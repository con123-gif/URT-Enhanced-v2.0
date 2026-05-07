# 09 — Benchmarks: Rössler, Lorenz, Validation

## Purpose

Validate the δ metric on well-understood deterministic chaotic systems where
ground-truth Lyapunov exponents and attractor dimensions are known analytically.

## Systems

### Rössler attractor (standard parameters: a=0.2, b=0.2, c=5.7)
- λ₁ ≈ 0.071, D_KY ≈ 2.01
- Expected δ ≈ 0.147 (consistent with δ★)

### Lorenz attractor (ρ=28, σ=10, β=8/3)
- λ₁ ≈ 0.906, D_KY ≈ 2.06
- Expected δ consistent with δ★ in chaotic regime

## Key experiments

1. **Feedback control**: Apply URT feedback gain k to Rössler/Lorenz ODE
   and measure δ vs k — confirms URT drives δ → δ★
2. **Parameter sweeps**: Vary c (Rössler) or ρ (Lorenz) through chaos transitions,
   measure δ throughout — should track the edge of chaos
3. **Avalanche statistics**: Extract τ from burst run-lengths and verify
   power-law scaling at the critical point

## Notebooks

| File | Content |
|------|---------|
| `rossler_avalanche_lytollis_law.ipynb` | Rössler + avalanche statistics — Lytollis Law verification |
| `rossler_feedback_torch.ipynb` | Rössler with PyTorch feedback control |
| `lorenz_feedback_benchmark.ipynb` | Lorenz with URT feedback, strong chaos regime |
| `rossler_parameter_sweep.ipynb` | Rössler parameter sweep across chaos transitions |
| `dof_range_partial_data.ipynb` | DOF range analysis (partial run) |

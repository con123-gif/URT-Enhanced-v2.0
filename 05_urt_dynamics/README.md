# 05 — URT Dynamics: The Control Law

## Core equations

```
P_{n+1} = β · (α · (P_n − θ_h · φ(P_n)) + u)

φ(P) = sin(P)    if |P| ≤ π
       sign(P)   otherwise

Stability:  κ = β · α · (1 + θ_h) < 1    (Lyapunov-verified contraction)
Default:    α=1.155, θ_h=2.4, β=0.235  →  κ ≈ 0.94
```

On the 13-node icosahedral graph, the continuous version is:

```
dδᵢ/dt = −0.08·(L·δ)ᵢ − 0.6·e^{−t/10}·(δᵢ−δ★)·(1 + δᵢ²/(1+δᵢ²))
```

Starting from any δᵢ ∈ [0.12, 0.28], all 13 nodes converge to δ★ in 60 steps.

## Properties

- **O(N) complexity** — runs on a £5 microcontroller
- **Lyapunov-verified** contraction guaranteed
- **Universal** — same parameters work across plasma, EEG, robotics, finance
- **No retraining** — the attractor IS δ★, always

## Phase 11E

Notebooks Untitled45–51 implement "Phase 11E" — a cross-domain URT validation framework
that tests the controller simultaneously on multiple chaotic systems and compares
performance against baseline controllers. Think of it as a universal stress-test harness.

## Notebooks

| File | Content |
|------|---------|
| `urt_full_colab_demo.ipynb` | Complete framework demo — start here |
| `urt_framework_v2_validation.ipynb` | V2 validation with benchmarks (Oct 2025) |
| `urt_verification_stress_test.ipynb` | Extreme stress testing, SVD analysis |
| `urt_framework_module.ipynb` | URT packaged as importable module |
| `urt_enhanced_deepmind_benchmark.ipynb` | URT vs DeepMind RL in simulation benchmarks |
| `urt_performance_demo.ipynb` | 1000× speedup demonstration |
| `urt_performance_guarantees.ipynb` | Formal verification of performance guarantees |
| `urt_ab_test_runner.ipynb` | A/B/C statistical test runner for URT variants |
| `phase11e_*.ipynb` | Cross-domain Phase 11E validation framework |
| `real_data_fetcher_v8.ipynb` | 200+ real-world time series downloader |

## Library usage

```python
from urt.control import urt_operator, is_critical

delta_u = urt_operator(my_time_series)
print(f"δ = {delta_u:.4f}  stable={is_critical(delta_u)}")
```

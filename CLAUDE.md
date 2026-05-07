# URT Enhanced v2.0 — Cathedral Framework

## Repository Overview

Universal Recursive Tuning (URT) — a unified icosahedral physics framework built around the single constant:

```
δ★ = (1 − 1/81) × π / (13φ) ≈ 0.14751
```

where φ = (1+√5)/2 (golden ratio), N=13 (icosahedral shell sites), Γ=1/81.

## Key Files

### Core Constants
- `urt/shell_closure.py` — δ★ derivation, 13-site icosahedral shell, `compute_all_constants()`
- `urt/cathedral_v8.py` — Full Standard Model: α, masses, Higgs, CKM
- `urt/cathedral_v9.py` — Anchor-free: all scales from ρ_Λ alone

### Physics Modules
| File | What it computes |
|------|-----------------|
| `urt/rg_flow.py` | RG running δ(μ), crossover μ_c ≈ 197 GeV |
| `urt/qbls.py` | Quantum Bounded Ladder of Scales (δ_rung ≈ 61.32) |
| `urt/qft_cathedral.py` | Cathedral propagator, Mexican-hat potential, Higgs mass |
| `urt/nuclear_magic.py` | Magic numbers {2,8,20,28,50,82,126} from δ★ |
| `urt/axion_cathedral.py` | Axion mass, Peccei-Quinn scale, detection band |
| `urt/quasicrystal.py` | IKT forward/inverse, K₄/A₅ sector split |
| `urt/navier_stokes.py` | Kolmogorov cascade, intermittency exponents |
| `urt/gravity_deficit.py` | Angular deficit, BH entropy, holonomy |
| `urt/arf_closure.py` | ARF fixed point, lepton/proton mass ratios |
| `urt/logistic_verification.py` | δ★ on stable 6-cycle of logistic map |

### New Application Modules (v2.1)
| File | Domain |
|------|--------|
| `urt/periodic_table.py` | Madelung rule from δ★ → noble gases {2,10,18,36,54,86,118} |
| `urt/holography.py` | AdS/CFT: G_N=δ★², RT entropy, BH thermodynamics |
| `urt/consciousness.py` | Kuramoto on icosahedral graph, IIT Φ, EEG δ-band |
| `urt/prime_spectral.py` | Icosahedral Laplacian ↔ Riemann zeros, Ramanujan property |
| `urt/metamaterials.py` | Photonic band gap ω=δ★ω₀, drug capsid binding, Z₂ topology |
| `urt/swarm_intelligence.py` | 13-drone icosahedral swarm, consensus T_c=1/3, satellite LEO |
| `urt/gravitational_waves.py` | IKT GW detection SNR=1/δ★, QNM ringdown, Cathedral strain |

### Neural / ML
- `urt/neural_cathedral.py` — CathedralLayer, CathedralNet, GrokDetector (grokking detector)
- `urt/control.py` — URT control operator (O(N), κ < 1)
- `urt/metrics.py` — Lyapunov exponent, τ_avalanche, D_KY

## Running Tests

```bash
python -m pytest tests/ -q          # all 317 tests
python -m pytest tests/ -q -k gw   # gravitational wave tests only
```

## Key Numerical Values

```
δ★          = 0.14751318...   (icosahedral critical point)
1/δ★        = 6.7791...       (detection/SNR threshold)
δ★²         = G_N             (Cathedral Newton constant, Planck units)
1/δ★        = R_AdS           (AdS curvature radius)
3/(2δ★³)    ≈ 467             (central charge c)
δ★√2        ≈ 0.2086          (1/n_eff, metamaterial refractive index)
λ₂          = 3 = D           (icosahedral spectral gap = spatial dimension!)
K_c         ≈ 1.278           (Kuramoto critical coupling)
```

## Module Quick-Start

```python
from urt import DELTA_STAR, compute_all_constants
from urt import gw_event_summary, formation_positions, capsid_binding_sites
from urt import madelung_order, cathedral_noble_gas_prediction
from urt import riemann_zero_matches, central_charge

# GW150914-like event
event = gw_event_summary(36, 29, 410)

# 13-drone formation at 100 m radius
positions = formation_positions(scale=100.0)

# Drug binding on 15 nm icosahedral capsid
binding = capsid_binding_sites(R_capsid=15.0)
```

## Development Branch

Active development: `claude/13-shell-closure-framework-dXmJi`

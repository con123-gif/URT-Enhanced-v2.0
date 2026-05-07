# 04 — Renormalisation Group Flow

## Running couplings and scale crossover

The theory has a natural energy scale where the coupling constant transitions
from the IR (classical) value to the UV (quantum vacuum) value:

```
δ(μ) = (1 − w(μ)) · δ_IR + w(μ) · δ★

w(μ) = σ(P_RG · ln(μ/μ_c))         sigmoid crossover

P_RG = (6N + 5)/30 = 83/30 ≈ 2.767  RG flow rate
μ_c  = (7/5)(1/γ) + (5/4)(π²/δ_eff) ≈ 197.24 GeV  crossover scale
```

- At μ ≪ μ_c: δ → δ_IR = 0.15 (classical, IR fixed point)
- At μ ≫ μ_c: δ → δ★ = 0.1475 (quantum vacuum)
- Crossover at ~197 GeV — close to the electroweak scale (~246 GeV)

## GUT unification

```
α_GUT = (4/81) · (1 + δ★/(2π))  ≈ 0.0498
sin²θ_W = (3/8) · (1 − α_GUT/π · log(1/γ) · κ)  = 0.2312
```

The GUT coupling and weak mixing angle both follow from δ★ alone.

## Notebooks

| File | Content |
|------|---------|
| `lcft_master_rg_run.ipynb` | Full LCFT RG flow with real-world dataset integration |
| `cosmological_quantum_urt_cmb.ipynb` | CMB power spectrum analysis, G and Λ from δ★, Hubble tension |

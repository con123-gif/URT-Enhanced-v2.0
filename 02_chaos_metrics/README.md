# 02 — Chaos Metrics: Measuring δ from Any Time Series

## The δ metric

```
δ = (D_KY − 1) · (τ − 2)
```

This scalar is computable from **any** time series with no labels, no training, and no domain-specific parameters.

| Component | Definition | Measures |
|-----------|-----------|---------|
| **D_KY** | Kaplan-Yorke dimension from Lyapunov spectrum | how fractally the attractor fills phase space |
| **τ** | power-law exponent of burst avalanches: P(s) ~ s⁻τ | temporal scale-free behaviour |
| **δ** | their product (shifted) | proximity to critical transition |

## Significance of δ★

- **δ ≈ δ★ (0.1475)**: system is at the edge of chaos — maximally complex, stable
- **δ drifting away from δ★**: critical transition approaching
- **δ < δ★**: approaching collapse (seizure, crash, instability)
- **δ > δ★**: leaving critical regime, settling to lower complexity

The same threshold works across domains because δ★ is a geometric invariant, not a domain constant.

## Notebooks

| File | Content |
|------|---------|
| `master_notebook_adaptive_urt.ipynb` | Complete adaptive URT operator — start here |
| `full_delta_measurement_pipeline_v4.ipynb` | Full δ pipeline: increment geometry, windowing, vibration |
| `lytollis_10k_run_evidence.ipynb` | 10,000-run evidence across Rössler, Duffing, Plasma, Cortex |
| `lytollis_law_toe_attractor_dimensions.ipynb` | δ as generative TOE — attractor dimensions from δ alone |
| `rossler_duffing_delta_lyapunov_sweep.ipynb` | D_KY linear law verification: phone-ready evidence |
| `lcft_pde_chi_field_proof_v1.ipynb` | LCFT field theory — χ(x,t) universal collapse proof |
| `lcft_chi_field_proof_v2.ipynb` | Refined χ(x,t) proof |
| `lcft_urt_bulletproof_validation.ipynb` | δ-level statistical validation framework |
| `lcft_urt_statistical_tests.ipynb` | t-test, KS-test, norm validation |
| `delay_embed_delta_metric_analysis.ipynb` | Delay embedding → D_KY computation pipeline |
| `urtf_chaos_preserving_transform.ipynb` | URTF transform that preserves chaotic structure |
| `lytollis_stability_margin_v1/v2.ipynb` | Universal stability margin computation |
| `centre_of_void_v1–v4.ipynb` | Centre-of-the-void test: δ★ as attractor of all systems |
| `unknown_constants_real_world_chaos.ipynb` | New constant predictions + stock/earthquake data tests |
| `real_world_timeseries_fetcher.ipynb` | 1000+ real time series downloader for validation |

## Usage (library)

```python
from urt import lyapunov_rosenstein, tau_avalanche, delta_metric, D_KY_from_l1_proxy

l1  = lyapunov_rosenstein(ts)
DKY = D_KY_from_l1_proxy(l1)
tau = tau_avalanche(ts)
d   = delta_metric(DKY, tau)

print(f"δ = {d:.4f}  (δ★ = 0.1475)")
```

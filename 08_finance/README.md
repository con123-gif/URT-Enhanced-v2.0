# 08 — Finance: Crash Prediction

## The claim

The same δ★ = 0.1475 that predicts epileptic seizures predicts financial crashes.

Financial markets are chaotic systems. At equilibrium, a healthy market sits near δ★.
Before a crash, the δ metric drifts — the same drift seen in EEG before a seizure.

## Method

```
Log-returns r_t = log(P_t/P_{t-1})
      ↓
Sliding window (typically 30–60 trading days)
      ↓
δ = (D_KY − 1)(τ − 2)
      ↓
|δ − δ★| rising → instability warning
```

## GARCH integration

Notebooks combine URT with GARCH(1,1) conditional volatility modelling:
- GARCH gives σ_t (conditional volatility)
- URT gives δ (fractal structure of volatility)
- Together they give a richer crash signal than either alone

## Notebooks

| File | Content |
|------|---------|
| `urt_financial_time_series.ipynb` | URT applied to financial time series |
| `urtf_garch_lytollis_lock.ipynb` | URTF → GARCH → Lytollis Law lock v1.0 |
| `garch_genesis_v7_finance.ipynb` | GARCH-enhanced Genesis v7 system |

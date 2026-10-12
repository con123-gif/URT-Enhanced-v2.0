# Entropy-Driven Dictionary — Results

**Date:** 2026-10-12

Frozen quantities used:
- \(\eta_\Delta = -\ln\Delta \approx 5.9958\)
- \(p_5 = \Delta^2/(1+\Delta^2)\)
- binary entropy \(H_2(p_5)\)

## Maps (normalized)
```
exp(-η σ)         [1.00, 25.28, 139.39]     inverted
exp(-η σ/σ1)      [1.00, 43.61, 320.85]     inverted
exp(-S σ/Δ)       [1.00, 1.018, 1.027]      too mild
φ^(-η σ)          [1.00, 4.73, 10.76]       inverted
relative η         [1.00, 0.03956, 0.007174] hierarchical
```

## Diagnostic
The relative form

\[
\frac{m_i}{m_1} = \exp\bigl(-(\sigma_1 - \sigma_i)\eta_\Delta\bigr)
\]

produces a hierarchy in the correct direction.
- Middle generation: 0.0396 vs observed ~0.0073 (factor ~5)
- Lightest: 0.0072 vs observed ~1.3\times10^{-5} (still short)

No free parameter. Entropy is the stiffness.

## Status
Partial success. The entropy supplies the correct direction and brings the middle generation inside an order of magnitude. The lightest generation still requires additional frozen suppression.

Operation Condor continues.

# 01 — Geometry: The Icosahedral Origin of δ★

## Core claim

The universal chaos constant δ★ is not fitted — it falls directly out of icosahedral geometry:

```
δ★ = (1 − γ) · π / (N · φ)
   = (80/81) · π / (13 · φ)
   ≈ 0.14751081
```

where:
- **N = 13** — icosahedral close-packing (1 centre + 12 vertices; kissing number in D=3)
- **φ = (1+√5)/2** — golden ratio, arising from 5-fold rotational symmetry (q=5)
- **γ = 1/81 = 1/(G+F+1)** — suppression from the icosahedral symmetry group H₃ (order G=60)
- **V=12, E=30, F=20** — vertices, edges, faces of the icosahedron

## Why D=3 is special

The kissing number (maximum spheres touching a central sphere) equals **12** only in 3 dimensions — the icosahedron. This is the geometric fact the entire framework rests on.

| Dimension | Kissing number | Structure |
|-----------|---------------|-----------|
| 1 | 2 | line endpoints |
| 2 | 6 | hexagonal packing |
| **3** | **12** | **icosahedron ← here** |
| 4 | 24 | 24-cell |
| 6 | 72 | E₆ root system |

## Notebooks

| File | Content |
|------|---------|
| `urtf_first_principle_delta_star_v1.ipynb` | First derivation of δ★ from URTF fixed point |
| `urtf_first_principle_delta_star_v2.ipynb` | Refined derivation with effective corrections |
| `arf_zero_deviation_closure.ipynb` | Zero-deviation ARF closure proof |
| `fisher_metric_geodesic_flow.ipynb` | Geodesic flow on information manifold (Fisher metric) |
| `delta_star_equation_visualization.ipynb` | Visual derivation and equation rendering |
| `golden_angle_analytic_formulas.ipynb` | Golden angle deviation → complete analytic formulas |
| `kissing_numbers_dimensional_attractor.ipynb` | Kissing numbers across dimensions, attractor classification |

## Key identity

The cosmological dark matter / dark energy split is encoded in the Laplacian spectrum of the 13-node icosahedral graph:
- **4 positive eigenvalues** → Ω_m = 4/13 ≈ 0.308
- **9 negative eigenvalues** → Ω_Λ = 9/13 ≈ 0.692

No cosmological fitting. Pure eigenvalue counting.

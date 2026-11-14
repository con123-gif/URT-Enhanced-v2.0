# Q95 — Exact source-specific hidden clock response from the original five-solid source

**2026-11-14. Exact theorem for the Q89 source-shape carrier and native Q; independent floating verification with all 50 vertices of five Platonic solids. Conditional on the Q93 Gaussian residual clock action. Physical ARF and gauge normalisation OPEN.**

## Provenance / no fitting

- `cathedral_engine/geometry.py`: exact Platonic vertices, original icosahedral `C`, `Ph`, `P3`, `P5` and 64-history embedding `M` (`cathedral_engine/histories.py`).
- `cathedral_engine/source.py`: the original 50-vertex `Eraw G^-1/2` and icosahedral `I H^-1/2`, with nonlinear `f=(C x)^2`, `h3=P3 f`, `h5=P5 f`; archived e0+e3 input.
- Q89 (2026-11-13): for this original full-five `Eglobal(e0+e3)` source, the 12-vector `x` is in the exact two-dimensional space `span{Z,XY}`.
- Q93–Q94 (2026-11-14): exact primitive Q inverse and hidden projector trace under a **declared** Gaussian 24-clock action.

No old ARF formula, target residue or experimentally measured quantity is an input. This result replaces generic projector traces with a source-specific bilinear response but is **not** a physical coupling law.

## Theorem (exact in original Q89 source subspace)

For the 12 icosahedral vertices `v`, let `Z_v = v_z`, `XY_v = v_x v_y`, and choose any `x=aZ+bXY`, with `a,b` arbitrary scalars. Let `f=(C x)∘(C x)` and `h3=P3 f`, `h5=P5 f`. Exact symbolic identities, computed from the native face adjacency, are:

```
P3 (CZ)^2 = P5 (CZ)^2 = 0
P3 (CXY)^2 = 0
P5 [(CZ)(CXY)] = 0
h3 = 2ab P3[(CZ)(CXY)]
h5 = b^2 P5[(CXY)^2].
```

Define the original hidden H64 source `y_s=M h_s/sqrt(2)`, and its nonnegative norm `n_s=||h_s||²=||y_s||²`. With `K(z)=(zI-Q)^*(zI-Q)`, `z=exp(i omega)`, Q93's finite inverse and exact icosahedral algebra give **for every a,b**, with no free coefficient:

```
R_source(omega) = (y3+y5)^* K(z)^-1 (y3+y5)
  = (3/2)n3
    + n5 [ 17/6 + cos(omega) + (17/15)cos(2omega)
           + (1/6)cos(3omega) - (8/15)cos(4omega) ].
```

The inter-sector cross-Gram `(1/2)(R_i^T M h3)^T(R_j^T M h5)` vanishes **for every i,j=0..5**, exactly. The normalized coefficient vectors `a_d/n_s` are:

```
lag d       0       1      2       3       4       5
3-sector   3/2      0      0       0       0       0
5-sector  17/6     1/2   17/30    1/12    -4/15    0
```

The exact proof is not a pattern-match from the numerical original source. `Q95_SOURCE_CARRIER_EXACT.py` builds the original vertex geometry over `Q(sqrt5)`, constructs `P3,P5,M,Q`, evaluates **symbolically** each of the 36 Gram products and asserts all equations.

## Clock-integrated observable (conditional)

As in Q93, let `omega_k=theta+2pi k/24`. All nonzero lag harmonics vanish over 24 modes. Thus

```
sum_{k=0}^{23} R_source(omega_k)
 = 24 [ (3/2)n3 + (17/6)n5 ],
```

independent of the uniform phase twist `theta`. For the actual e0+e3 five-solid source, the independent float reconstruction reproduces the archived Q81 normalizations
```
n3 = 0.032194544822365221694503455948311627...
n5 = 0.0018261794348137894279051028989514859...
```
and produces `24[(3/2)n3+(17/6)n5] ≈ 1.283183815172481` unscaled. If (and only if) Q93's extra kinetic normalization `r=pi/e` is taken, the result is approximately `0.960678544978236` in internal units.

This is a source-dependent quantity **not a universal physical ARF**. The original e0+e3 selection, clock Gaussian residual, charged source and physical normalisation still require first-principles derivation.

## Local execution and next step

```
python research_archive/2026-11-14_q95_full_five_source/Q95_SOURCE_CARRIER_EXACT.py
python research_archive/2026-11-14_q95_full_five_source/Q95_ALL_FIVE_NUMERICAL_CHECK.py
```

Local exact SymPy exit 0; numeric all-50-vertex reconstruction exit 0, historical native norm residuals under `1e-12`, Q89 span residual `2.9e-16`, three independent 64x64 complex inverse comparisons passed. GitHub CI registered/pending.

**RESUME HERE:** Replace Q93's declared Gaussian clock residual with a generator derived from the original *coupled* H64/24-clock plus charged 600-cell or v61 Wilson sector. Test the source transport at first and second Ward orders, nontrivial pole and scale normalisation; only then consider a physical ARF. Do not impose the four old equations.

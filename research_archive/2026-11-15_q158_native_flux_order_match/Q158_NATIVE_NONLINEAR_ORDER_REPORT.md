# Q158 — Connect initial finite-wave instability to the actual nonlinear physical flux vacuum

Date 2026-11-15; real physics Track M. Uses original all-five moving/hidden source through native Q109 and exact saved Q152/Q157b original-source output. Does NOT fit observables or import retired Q77 equations.

## Closed original Q157 result and the physical limitation
Native Q157 [run 43723169735](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43723169735) passed. Native Q157b repeated computation and **persisted all 48 original 11×11 momentum-block spectra** at source-state commit `e76948b0f885e195ae05aa46b12f0ffce6b7473b` and Git blob SHA `791a249c51791f54968d461400180e6c73956936`. Original 528×528 Hessian has 397 positive, 84 negative, 47 gauge zeros, spectral reconstruction discrepancy 3.50e−10.

Exactly 84 negative physical modes reside in 24 momentum blocks. Every temporal index n_t=0,…,5 has three singly staggered spatial sectors (100),(010),(001), 4 negative modes each; (111), 2 negative; four other spatial sectors zero. All 11 zero-momentum uniform-link modes are positive. The instability is **spatial Nyquist at π** on the tiny 2×2×2 spatial lattice. It is NOT proof of a physical continuum ordering wavelength.

## Actual source-to-vacuum nonlinear comparison
Q158 reads the ORIGINAL Q152 saved 528 gauge angles (pinned Git blob `ad746e6f14a5332e8d3b84fb8a2cd46eff65e258`) and reconstructs the 3216 genuine q_min=1/3 gauge-invariant Wilson loops using the **corrected Q149 face ordering**: 55 squares per site then 12 triangles per site, across all 48 sites. No gauge-dependent A Fourier transform is used; we Fourier transform the physical complex Wilson holonomy `U_f(x)=exp(i curl_f A/3)` for each of 67 original face types. Exactly from Parseval `Σ_{k,f}|Û_f(k)|²=3216` (|U_f|=1 on 3216 faces).

The independent original-binary local calculation already obtained:
- zero-k Wilson power `P0≈2314.1930942`, nonuniform power `≈901.8069058`,
- nonuniform power in the **24 independently identified linear unstable sectors** `≈568.63532769`,
- share of nonlinear gauge-invariant nonuniform flux structure in those sectors `≈0.6305510903` (63.0551%).

This is no fit, and it is not a proof of actual real-time dynamics from the linear A=0 instability to Q152: the nonlinear flux contains stable-sector harmonics as well. It quantitatively connects the same source's initial finite-wavelength instability with its nonuniform stationary classical vacuum. Q158 redoes this on the **original native Q149 face geometry** and exact Q157b saved spectra in GitHub Actions.

## Dynamical time warning from actual Q157b spectra
For EVERY nonzero spatial momentum sector at π, the **complete 11 eigenvalue block spectrum** is independent of the six temporal frequencies to ≲1.1e−11, despite nonzero temporal dispersion in some k_sp=0 sectors. This unusual temporally flat sector response is an explicit challenge to obtaining a 4D propagating Maxwell photon from this original 2³ spatial Wilson model. It may result from severe spatial aliasing and/or the conditional kinetic prescription; do NOT turn it into a global continuum no-go. A spatially larger original source (NS≥3, additional q in (0,π)) and first-principles time transfer are needed.

## Next true physics gate
Numerically or analytically continue the ORIGINAL v61 charged determinant to spatial volumes 3³,4³ (keeping its actual link/fermion definitions, changing only lattice size), calculate momentum-resolved Q109 current/seagull at zero and stable backgrounds, and test whether unstable wavelengths stay pinned at cutoff or develop controlled long-wavelength Maxwell response. Separately derive the relative kinetic/time normalization from primitive full five-Platonic 190/H64/24 positive transfer. The historical four ARF polynomials remain provisional, not fixed targets.

Status at commit: Q158 native source cross-check registered and pending; local original-binary Q152 Fourier power check passed, original Q157b 48-block source JSON already persisted.

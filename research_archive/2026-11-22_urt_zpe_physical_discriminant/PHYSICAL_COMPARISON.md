# ENTROPY-FIRST URT–ZPE: physical discriminant (22 November 2026)

**Result class:** Conditional physical comparison / internally verified calculation; **not physical closure**. Standalone URT–ZPE, no Cathedral ARFs.

## Same-state input and physical redshift

Use the **already archived** finite central-strip core2 estimates (nx=96,nz=12) from `research_archive/2026-11-21_urt_zpe_horizon_limit/HORIZON_CENTRAL_THERMAL.md`: sector +: `sigma=0.030556428769, chi=0.005704884685`, sector −: `sigma=0.039432894513, chi=0.006579746423`. These are **central trace diagnostics, not proven full-area thermodynamic coefficients**. All comparisons below are conditional on using them.

From `S/k_B=sigma A/ell²`, `ell²=4 sigma ell_P²` (physical entropy-area identification), and redshifted `E=(hbar c/R) chi A/ell²`, obtain `rho=3 eta c^4/(8 pi G R²)`, `eta=2 pi chi/sigma`, independently of observed cosmological values.

- Sector +: `eta=1.17307058043`, `c_HDE=sqrt(eta)=1.08308382890`.
- Sector −: `eta=1.04840810092`, `c_HDE=1.02391801474`.

This is *not* an original cosmological evolution law: with the **additional** future-event-horizon cutoff it becomes the established Li holographic dark energy (HDE) model. URT's conditional contribution is the candidate numerical coefficient, not the HDE equation.

## Competing horizon selections: decisive consistency test

- **Apparent/Hubble horizon `R=c/H`:** exact `Omega_URT=eta`. The current finite diagnostics `eta>1` would require negative leftover matter fraction. As the only stress source, flat Friedmann requires `eta=1` and leaves `H` undetermined. This result is conditional on treating central-strip eta as the physical coefficient; it does **not** rule out a different continuum eta or correct combined matter state.
- **Future event horizon `R=a int_t^infinity c dt'/a(t')`:** conditionally self-consistent with separately conserved dust. Evolution `w=-1/3-2 sqrt(Omega)/(3 sqrt(eta))`, `Omega'=Omega(1-Omega)(1+2 sqrt(Omega/eta))`. A self-consistent accelerated branch exists for `eta>1`, `a(t)~t^p`, `p=sqrt(eta)/(sqrt(eta)-1)`; exact event-horizon integral checked against `R_E H/c=sqrt(eta)`. Nevertheless the original URT recurrence/entropy calculations do **not select** future over apparent horizon.
- **Absolute scale:** HDE normalized equations fix `H(z)/H0` but have `H0 -> lambda H0` degeneracy. Even `eta=1` permits de Sitter of arbitrary H; the observed H0 or Lambda are **not** derived.

## Current empirical discriminants

An independent September 2026 late-time HDE analysis of H(z)+DESI DR2+DES-Dovekie+RSD reports `c_HDE=1.011^{+0.076}_{-0.072}`, `Omega_m0=0.270^{+0.009}_{-0.008}`, `H0=67.860^{+1.534}_{-1.579} km/s/Mpc`. [EPJC 2026, doi:10.1140/epjc/s10052-026-16300-z](https://doi.org/10.1140/epjc/s10052-026-16300-z). Both finite URT estimates are inside its *marginal* 1 sigma c range, but there is no URT-specific joint likelihood here and no proof of continuum convergence.

**Opposing physical signature:** For dust + HDE, the local CPL parameter is `w_a=-dw/da|a=1 = sqrt(Omega0) Omega_m0 [1+2 sqrt(Omega0/eta)]/(3 sqrt(eta)) > 0` for every positive `eta` and nonzero ordinary matter. Some DESI DR2+CMB+SN analyses instead favor `w0>-1, wa<0`, with evidence depending on dataset; e.g. [A&A 2026](https://doi.org/10.1051/0004-6361/202557820) and [MNRAS 2026](https://doi.org/10.1093/mnras/stag1607). This is an **observationally testable sign disagreement**, not established statistical exclusion.

For the explicitly **observational, non-primitive benchmark** `Omega_m0=0.270`:

| Result | Sector + | Sector − |
|---|---:|---:|
| `w0` | −0.859239 | −0.889628 |
| `wa` (local CPL) | +0.183011 | +0.200433 |
| `q0` | −0.440867 | −0.474143 |
| `H(z=1)/H_LCDM(z=1)` at same H0 and matter | 1.070188 | 1.061530 |
| `D_M(z=1)/D_M_LCDM(z=1)` | 0.957629 | 0.963729 |

Repeating with Planck's `Omega_m0=0.315` gives `wa=+.202863/+.222081` and `H(z=1)/H_LCDM=1.066538/1.059246`. This is a **comparison, not a parameter-free cosmological prediction**: matter density has not been derived by URT.

## Verdict and reproducibility

The redshifted entropy model is **conditionally capable of accelerating expansion**, and the candidate HDE coefficient is observationally plausible, but future-horizon selection, continuum normalization, microscopic causal-horizon interpretation, and absolute H0 remain underived. More decisively, the predicted sign `wa>0` offers a *physical test* against the `wa<0` evolving-dark-energy preference. No imaginary fitted correction or added cosmological term is used.

**Local execution:** `OPENBLAS_NUM_THREADS=1 python research_archive/2026-11-22_urt_zpe_physical_discriminant/cert.py`; four scenario combinations, independent Friedman reconstruction, analytic future-horizon integral and shape distances passed locally (model container 22 November 2026). Remote CI must be checked separately.

**RESUME HERE:** Do not repeat static vacuum or make new arbitrary entropy corrections. The priority is a physically justified horizon-selection rule, and a full joint likelihood for the fixed native candidate on DESI/CMB/SN data **after** an independently certified thermodynamic coefficient. Do not claim predicted H0 until a genuine microscopic boundary condition determines it.

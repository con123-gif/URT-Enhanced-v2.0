# Recovered v61 H64 charged-wall physical pole and photon-source audit — 17 October 2026

## Input and strict interpretation

The October 8 Cathedral continuation ZIP from the user's Library contains `canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py` (SHA-256 `e6bd037ffd706150dd9fe8eeeca8908a7c1a88c71a21f589b7eb05ce93128d75`), `canonical_nature_work/binding_audit.py`, its saved outputs, and separate photon/gauge-source scripts.

A new execution called the ORIGINAL `microscopic_response_wall_certificate()` and ORIGINAL `wall_poles()` functions, then extracted spectra, phases, and the canonical conserved-charge vertex for e/mu/tau. Full reproducible runnable source and outputs are retained in conversation artifact `H64_true_wall_photon_recovery_2026-10-17.zip`.

**Crucial source limitation:** The wall links are populated from `response_mass_certificate()`'s already declared attenuation tree. The pole calculation is real but the mass tree is not independently derived from a photon/H64 selected physical transfer. Do not promote this to a theory-of-nature prediction.

## Numerically rerun, dimensionless

| Readout | mu/e | tau/mu | Koide Q | generalized cosine amplitude r | spectral delta rad |
|---|---:|---:|---:|---:|---:|
| response products | 207.7049306214 | 16.7390473760 | 0.666233918575 | 1.413295266903 | 0.222836559620 |
| actual free wall lowest positive poles | 207.0590724941 | 16.0270288277 | 0.661841837405 | 1.403941246787 | 0.228273169502 |
| conditional common-scale one-loop QED | 203.3257524953 | 15.8739434587 | 0.660714661376 | 1.401530580564 | 0.229366694302 |

Comparison only, NOT an input: exact Koide requires Q=2/3 and r=sqrt(2); e/mu inferred Koide phase is ~0.222222047073. The uncorrected response products are strikingly close but chosen at the RESPONSE level before the wall was built. Solving the actual wall poles moves Q and delta away from that benchmark, and the specified perturbative photon correction moves further away.

Generalized exact three-positive-mass Fourier coordinates:
`sqrt(m_j)=A[1+r cos(delta+2*pi*j/3)]` for j=(tau,e,mu);
`Q=1/3+r^2/6`. Fitting delta alone cannot correct a spectrum with r!=sqrt(2).

## New current conservation check (all 3 lepton poles)

For the actual 24x24 free chiral wall D, retained endpoint E and internal I, define
`D_eff(z)=D_EE+D_EI (zI-D_II)^-1 D_IE`,
`Z(z)=I+D_EI(zI-D_II)^-2 D_IE`.
For the *full* unit charge current (retained plus internal), the source vertex is
`Gamma(z)=I+D_EI R(z) I_internal R(z) D_IE=Z(z)`,
hence the correctly normalized on-shell vertex is `Z^-1/2 Gamma Z^-1/2=I_2` on e, mu and tau.
Numerical residuals: 2.2e-16, 2.2e-16, 5.0e-16.

Actual pole Z eigenvalues:
- e: 1.000099137140, 10.935255768620
- mu: 1.000102675202, 11.003606107036
- tau: 1.001090453484, 12.012546919122

These are **fermion-history kinetic factors**, not photon slowdown velocities. The bare photon speed 1/sqrt(2) belongs to the declared A4 clock and cannot automatically be treated as a physical vacuum light-speed deficit.

## Photon test scope

The QED row assumes the recovered wall poles are common-scale MS masses at mu=m_tau, and converts to first-order pole mass
`m_pole=m_MS(mu)[1+(alpha/pi)(1+(3/4)log(mu^2/m_MS^2))]`
with alpha from the existing Cathedral polynomial. It tests standard perturbative photon response only, NOT the full nonperturbative, gauge-projected, species-loaded URT/H64 action. A universal charge vertex does not force universal additive mass shifts; it permits mass-dependent self-energy. A common optical phase, by contrast, cannot change any singular mass ratio.

The exact source-controlled result is the free-wall pole plus Ward vertex calculation. There is no independently selected photon-dressed H64 mass spectrum or unique Koide phase in this verified executable. This is a local source-identification limit, not a global Cathedral no-go.

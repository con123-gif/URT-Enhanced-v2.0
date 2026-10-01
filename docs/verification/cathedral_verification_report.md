# Newton's Cathedral / URT — Short Reproducibility Audit

This report deliberately separates **arithmetic / finite mathematics**, **physical identification**, and **empirical comparison**.

## External reference values used only after the Cathedral calculations

- NIST 2022 CODATA: inverse fine-structure constant = 137.035999177(21).
- PDG 2025 kaon-sector Cabibbo determination: |V_us| = 0.22431(85).
- Planck 2018 base-LambdaCDM: Omega_m = 0.315 ± 0.007.

None of these values is used to compute the Cathedral formulas below.

## Results

| Claim | Cathedral calculation | External comparison | Numerical result | Verification status |
|---|---:|---:|---:|---|
| Fine-structure scalar residue | `137 + (17572/1215)Δ - (9/65)Δ²` | NIST alpha^-1 | 137.035999178194999; difference 1.195e-09 (0.057 sigma) | Arithmetic verified; physical EM identification **open** |
| Cabibbo response | `sqrt(8/159)` | PDG 2025 | 0.224308861636818; difference -1.138e-06 (-0.0013 sigma) | Exact inside declared response law; prospective status **not established** |
| Matter fraction | `6/19` | Planck 2018 | 0.315789473684211; difference 7.895e-04 (0.113 sigma) | Numerically compatible; cosmological dynamics **open** |
| Dark-energy complement | `13/19` | flat complement of Planck Omega_m | 0.684210526315789 | Same limitation as above |
| Entropy/BKM duality | `chi35 * kappa_gen = eta_Delta^2` | internal identity | residual 0.000e+00 | **Verified** |
| A4 root tight frame | `sum alpha⊗alpha = 10 P_V4` | finite linear algebra | residual 0.000e+00 | **Verified** |
| A4 triangle frame | `M^2 = 5M`, rank 6 | finite linear algebra | residual 0.000e+00 | **Verified** |
| Gauge trace | `kY:k2:k3 = 5/3:1:1` | finite trace | Tr(Y²)=5/6, normalized Tr(T1²)=Tr(T3²)=1/2 | **Verified relative normalization** |

## What this establishes

The short-form arithmetic and the audited finite linear algebra are reproducible. In particular, the A4 root frame, triangle bivector frame, gauge trace normalization, Cabibbo arithmetic, scalar-residue arithmetic, and entropy/BKM identities are not just prose claims.

## What it does not establish

1. The value 137.035999178195 is not yet proved to be the **physical** electromagnetic coupling. The common current/action normalization is still required.
2. `sqrt(8/159)` is exact inside the Cathedral response law, but the response law's derivation from the most primitive URT transfer is not independently established.
3. `6/19` and `13/19` are response coordinates, not yet outputs of a derived Friedmann/perturbation dynamics.
4. Agreement with already-known measurements is **retrospective compatibility**, not a blind prediction unless a timestamped pre-measurement lock can be demonstrated.

## Bottom line

**Verified finite mathematics is stronger than the critique implies, but verified finite mathematics is not the same thing as a verified theory of nature.**

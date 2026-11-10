# Coupled cycle 25 — London / Meissner kernel about the π-flux + 4_5 vacuum

Classification: **PROVED**. About the derived all-π vacuum with the
4_5 condensate, at the large-vev slice, the gauge-invariant
transverse kernel is positive definite and identity-like, not
Maxwell-like. There is no unique derived κ, so α_eff was not
compared to R_α. Advances a physical ARF? No.

The machine-readable `results.json` records `classification:
CONDITIONAL` because two conservative numerical gates (H3 versus
the intermediate slice r = 100, and the 10^{-6} Ward threshold at
r_*) did not fire. Those gates are discussed below and do not
overturn H1 or H2.

## Background
At A_π = π·1_30 and r = r_* = 8.6126068637762×10^5, E_min = 10.000
(the formerly unpaired mode, lifted by K[π] v0 = 10 v0). At r = 20
the same mode sits at E_min = 7.338 (pairing and kinetics still
mix). Gauge invariance about A_π holds to 10^{-14} at moderate r
and to 9×10^{-10} at r_* (absolute BdG round-off at pairing scale
∼ 3×10^5). The longitudinal Ward identity holds to 3×10^{-9} at
r = 20 and 1×10^{-8} at r = 100. At r_* the finite-difference
Hessian along a gauge orbit is O(10^{-4}), matching
ε_mach × (Σ E_pair) / ε_g² rather than a physical violation.

The A = 0, r = r_*, T = 0 control recovers Π_T ≈ −I/12
(c_I = −0.083331, relative 2.7×10^{-5} to −1/12), as in alt 34.
Changing the finite-difference step from 0.02 to 0.05 at
(r_*, T = 0, A_π) changes λ_min by relative 5.0×10^{-5}.

## Transverse kernel about A_π
At the physical large-vev slice (r_*, T = 0):

    Π_T = +0.083329 I_19 = +(1/12) I_19
    (identity residual 3.17×10^{-5}; all 19 eigenvalues in
    [0.083324, 0.083333]).

This is the sign-reversed unpaired-mode polarisation of alt 34,
now evaluated at E = 10 instead of E = 0. It is positive definite
(a Meissner mass exists as an isotropic number) but not
Maxwell-like: the residual of the best fit to Δ1_T is 0.4588, the
generalised eigenvalues κ_i lie in [0.01591, 0.10908] with relative
spread 2.326, and κ_iso = 0.020832 ≈ +1/48. The same thresholds as
alt 34/35 therefore reject a unique Maxwell coefficient.

At (r_*, T = η) the kernel is again a positive multiple of the
identity, with c_I = 0.056876 against the unpaired-mode prediction
tanh(10/(2η))/12 = 0.056881 (relative 9.2×10^{-5}). Maxwell residual
0.4588, spread 2.326, not usable.

## y_even dependence
Because r_* ∝ y_even in the large-vev formula, the r-scan is a
ye-scan. Intermediate amplitudes are not yet asymptotic:

- r = 20 (T = 0): mixed signs, λ ∈ [−0.0459, +0.0219], 7 negative
- r = 100 (T = 0): already positive definite, c_I = 0.06108
  (27 % below 1/12; identity residual 0.127)
- r = r_* (T = 0): c_I = 0.083329, matching +1/12 to 5×10^{-5}

The predeclared 5 % test of c_I(r_*) against c_I(r = 100) therefore
fails, which is why the script’s H3 gate is false. The large-vev
limit itself is independent of y_even: once pairing gaps have
dropped out, the kernel saturates at the unpaired E = 10
contribution +[tanh(E/2T)/12] I, with pairing corrections vanishing
as 1/E_pair ∝ 1/ye². It does not depend on ye through pairing
ratios.

## α_eff versus R_α
Π_T is positive definite at (r_*, T ∈ {0, η}) but neither
Maxwell-like nor unique, so 1/κ is not an electromagnetic coupling.
R_α = 3/(64 φ) + 1/(79 φ²) was not compared, and no rewriting of
+1/12 or +1/48 was promoted after the fact. Look-elsewhere was not
run.

## Integrity
Predeclaration sha256:
`b241f66f64f9c7ff785fd2af21e67079d29bdebc61f1874dcb7d05662fd40c48`.
Test-script hashes (original numpy.eigh call and the scipy.linalg.eigh
patch) are in HASHES.txt. No ARF target was used.

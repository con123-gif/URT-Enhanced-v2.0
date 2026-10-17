# Source-level electromagnetic gauge fixing of H64/charged Yukawa (17 October 2026)

**Executed against unmodified October 8 Cathedral continuation matrices**, not a fitted phase ansatz. Reproducible conversation artifact: `URT_H64_neutral_gauge_photon_mass_source_2026-10-17.zip`, containing source-array hash manifest, untouched extracted matrix subset, NumPy regression script, results JSON and detailed report.

## Exact SU(2) neutralization that was missing
The recovered 48x48 history-loaded Yukawa matrix uses the non-neutral Higgs probe h=(1,2i)/sqrt(5). The constant SU(2) transformation

```
U = [[2i,-1],[1,-2i]]/sqrt(5), U*h=(0,1)
G48 = I3 (x) diag(I3 (x) U, U, I8)
D48_neutral = G48 D48 G48†
```

has det U=1 and preserves the **full 48x48 spectrum** to 5.82e-15. Original electromagnetic generator fixed on a non-neutral Higgs had [Q,D48] norm 2.92573400623; in the properly neutral gauge [Q,D48_neutral] norm is 1.96e-16. The exact charged 3-generation L_L electron / e_R chiral block of D48_neutral equals archived Y_e to 2.60e-16, with no extra Higgs normalization coefficient.

Charged chiral singular amplitudes: 1.931637539895040, 1.351662255167389, 0.670957484853635. If *hypothetically* these were sqrt-mass amplitudes, Q=0.384263270674323 and generalized Koide (r,delta)=(0.552792568733, 0.569696907194). They are Yukawa amplitudes, **not demonstrated physical dressed pole masses**, and do not obey Koide Q=2/3.

## Correct electromagnetic source
Electron-type electromagnetic charge acts as -I3 on both L and R generation spaces, so Q_L Y_e - Y_e Q_R=0 exactly. The source bundle separately contains the A4 photon Maxwell 10-link kernel, but the recovered fixed matrices **do not contain a specified photon kinetic/current vertex jointly connecting that A4 link space to this 48x48 charged Yukawa and the signed 64-history carrier**. A universal optical speed correction is not an allowable substitute for the vertex or a photon self-energy.

Conditional standard one-loop QED conversion, using internal alpha candidate and treating singular-square amplitudes as masses at a common scale, produces Q=0.383960883106118. This is explicitly a limited perturbative benchmark.

EM gauge Ward covariance does not uniquely fix mass dynamics: explicit illustrative analytic covariant polynomials Y+tYY†Y preserve the same Ward identity but give Q=0.384263270674 (t=0), Q=0.461468910974 (t=phi^-2) and Q=0.510317077824 (t=1). These alternatives **are not** claimed to satisfy all the URT-history source selection laws; they certify only that electromagnetic Ward identity does not determine the missing nonlinear mass structure.

**Status:** Exact physically consistent neutral-Higgs gauge join and charged-matter source extracted. The experimental Koide phase has *not* been derived from the action, and no arbitrary chiral/photonic phase was inserted. This is a local source-specific result, not a global no-go.

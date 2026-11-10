# Block 15 — coupled cycles 43–46 and alt 55–57 integration

Date: 10 November 2026 (Europe/London).
Branch: `arf-coupled-research` off `newtons-cathedral`.
Adds only files under `research_archive/2026-11-10_coupled_arf_derivation/`.

## Coupled cycle 43 — Hodge Gauss / IR projection
Classification: PROVED (H1 conditional on working Q_geo; H2;
H3 as computed; H4). Unique coexact Gauss projector P_T on the
icosahedral 2-complex (b₁ = 0, nT = 19). Projected subcritical
Π_T is Maxwell-like and positive (resid_M = 0.060123) but not
unique (spread 0.305459, κ_iso = 0.002061847). Conversion gate
fails; no K_γ; no α_eff comparison. Pred sha256
`5ead2de0c68984e6dea1118f91029d2fa7d4dd815a429bc06f67d9fbdfcea147`.

## Coupled cycle 44 — derived refinement / continuum test
Classification: PROVED. A5-equivariant frequency-n subdivisions,
n = 1, 2, 3 (clock C_N not run). Combinatorial κ_iso =
0.002061944, 0.002246307, 0.002276376 appears to approach a
finite nonzero value on the predeclared three-point test, but
spread stays ≈ 0.26 (not unique Maxwell) and the coframe
conversion remains missing. No K_γ; no α_eff comparison.
Pred sha256
`6143b4e05af532f1b71ff63617e01534fe33b4a34b7197edb5626e1267ce62d2`.

## Coupled cycle 45 — G_{13} coupled-operator relation
Classification: PROVED. Archived G_{13} is not a sub-block,
quotient or restriction of geometric H13, K0, joint 32-site,
subcritical BdG, five-solid 0-form, or H64. 125 icosahedral
perfect matchings; none yields the Cayley surface. Internal
G_{13} structure left to the alt line. Pred sha256
`b1325ab5cf30356321646bd54f854050a916c4b5751a7d15fd736c576f5111cf`.

## Coupled cycle 46 — SYNTHESIS update
Classification: PROVED as a compilation. Pred sha256
`2dea0ac4a47d396bdfc5fd7077063bcb54b1361355420e02f5f2c6e764d740d4`.

## Alt-route integration (cycles 55–57)
55 archived δ-flow with the G_{13} Laplacian has zero homogeneous
shift (Δ_δ identification FALSIFIED; 1/63 and 1/40 arithmetic
only). 56 R_mass list (5,5,5,5,5,7,7,9,13) is uniquely the G_{13}
spectrum minus its four smallest eigenvalues among 29 spectra;
prefactors stipulated; G_{13} not A5-equivariant. 57 documentary
arf.py 1/α inconsistency (unshifted implementation 137.0360100
versus docstring d_eff 137.0359993; difference 1.07×10^{-5}).
Not duplicated. No ARF derived.

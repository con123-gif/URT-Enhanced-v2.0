# Block 9 — coupled cycles 22–24 and alt 34–36 integration

Date: 10 November 2026 (Europe/London).
Branch: `arf-coupled-research` off `newtons-cathedral`.
Adds only files under `research_archive/2026-11-10_coupled_arf_derivation/`.

## Coupled cycle 22 — Question C: is y_even fixed?
Classification: PROVED. Overall y_even is FREE.

Unit-norm visible sources map under F to ||h5|| = O(1); matching that
to the condensed vev would require ye ∼ 10^{-6} << y_c,even, which is
incompatible with condensation. Z_hist does not depend on ye; the
counterfactual matchings Z_hist(η) = 2 and Z_hist(0) = 64 at T = η
would give ye ≈ 0.00205 and 0.00501, both subcritical and in
disagreement with each other, and are extra postulates. KMS data
(T = η, ρ★) are independent of ye. The charge-2 Ward identity
extracts charge 2 independently of ye and is homogeneous in ye
(cycle 12: it holds for every Yukawa pair). No unique derived scale.

## Coupled cycle 23 — Question D: GI current, WI, Meissner
Classification: PROVED for gauge invariance and the longitudinal Ward
identity. Meissner positivity remains FALSIFIED.

Ω(A + dλ, θ − λ) = Ω(A, θ) to ∼ 10^{-14}; the Hessian along every
gauge orbit is ≲ 10^{-8}. Frozen-Δ scans of exact A give a negative
curvature (the alt29 artefact), cancelled to ∼ 10^{-9} by θ = −λ.
The unitary-gauge transverse kernel reproduces alt29
(r = 20, T = η: [−0.0015488, +0.0066481], 4 negative / 15 positive;
T = 0: all 19 negative in [−0.09526, −0.07076]) and stays
non-positive at r = 100, approaching −1/12 at T = 0. Alt29 was not
missing Nambu–Gor’kov vertices or a transverse Goldstone; it was
missing Goldstone compensation along exact A. The non-positive
transverse kernel is the genuine one-loop result (no tree |DΔ|²;
unpaired charged fermion). R_α was not compared.

## Coupled cycle 24 — non-pairing ratios
Classification: DID_NOT_RUN (ye is FREE). Symbolic formulas
R13 = 13/E_3 and R_odd = √(2 c_odd)/E_3, both ∝ 1/ye², were recorded;
no ARF comparison was performed.

## Alt-route integration (cycles 34–36)
These routes were not duplicated.

### alt34 — induced Maxwell κ (PROVED)
Integrating out the charged matter coupled to the 30 icosahedral
edges does not produce a unique positive Maxwell coefficient. At T = 0
the primary transverse Hessian is −(1/12) I_19 (the unpaired mode),
not a multiple of Δ1_T: Maxwell residual 0.459, κ_iso = −1/48,
generalised κ in [−0.109, −0.016]. Every sector (graph, Hodge Λ,
13-site Hodge, spinor) selects π-flux. No unique positive κ.
Pred sha256: `fbbb0892457b055b3f5fa849d653507ee8f27091f3c371f189896d1bca606c11`.

### alt35 — derived vacuum and 1/κ vs R_α (PROVED)
The derived vacuum (no external Maxwell term) is all-π. Spectrum
10 ⊕ 3 ⊕ 6 ⊕ 2, not three singlets; C_mass and R_mass were not
compared. Because induced κ fails uniqueness, positivity and
Maxwell-likeness, 1/κ was not compared to R_α ≈ 0.033805.
Pred sha256: `f401434d06dfc47b28d32e572dff02a4abcc038a5fbd592ffee0aa25dab4ccc2`.

### alt36 — read-only review d71974d..6bad7b3 (PROVED)
Eight commits (10 November 2026, 07:23:17–07:24:31 Europe/London) add
three files (279 lines) and modify nothing prior: an H64 Walsh/Hbits
A5 quartet certificate (verification rerun: PASS). They derive no
Maxwell coefficient, no new spatial current onto the 30 icosahedral
edges, no change to H13 kinetics, and no historical ARF. They do not
change the hypotheses of routes 34–35.
Pred sha256: `7443626033ad600a412600778aadd4626c56027e5e7fccbe69da91bb8fcf6610`.

## Next question
The overall y_even scale remains free, so non-pairing ratios are not
predictions. The archived one-loop EM kernel is gauge-invariant once
the Goldstone orbit is included, but it is not a positive Meissner
mass and the induced κ is negative (unpaired mode). A later cycle
should proceed only if a new derived principle is proposed.

No ARF was derived in this block.

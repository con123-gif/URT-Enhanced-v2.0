# SYNTHESIS — Newton’s Cathedral / URT coupled ARF programme

Date: 10 November 2026 (Europe/London).
Branch: `arf-coupled-research`.
Archive: `research_archive/2026-11-10_coupled_arf_derivation/`.
This note compiles coupled cycles 01–26 and alt routes 01–39. It
performs no new numerical experiment.

Frozen constants used throughout: γ = 1/81, δ★ = 80π/(1053 φ),
Δ = 3/20 − δ★, η = −ln Δ, ρ★ = (I4 ⊕ Δ² I4)/[4(1+Δ²)],
φ = (1+√5)/2. Historical ARFs are comparison targets only.

## Original reconstruction questions A–E

### A. Reconstruct the 190-cochain, 64-history and 24-clock operators
**PROVED** (coupled cycle 01). Five-solid Hodge–Dirac
(Tr D² = 720, Tr D⁴ = 3456, (V,E,F) = (50,90,50)), Cbridge,
rank-8 portal Plinear, P3 and P5, Hbits spectrum
0(2), 10(12), 16(30), 18(20), and 24-clock gaps at m = 9 (charge 1)
and m = 18 (charge 2). Not a 13-node reduction.
Script: `coupled_cycle01_reconstruct/`.

### B. Independently reproduce the nonlinear sources and the printed V
**FALSIFIED** against the printed archive
V = 0.490435304391 t² f² + 4.16132699108×10^{-7} f⁴
(cycle 02). The formulae
h3 = 2 P3[(C t) ⊙ (C f)], h5 = P5[(C f) ⊙ (C f)],
A3 = 18 I24 + (π/e)² L2, A5 = 16 I24 + (π/e)² L2 and the single-mode
reduction V = c3 ||h3||² + Δ² c5 ||h5||² with
c3 = 1/4 − 1/(2(18+ρ)), c5 = 1/4 − 1/(2(16+ρ))
were reconstructed without adjustment
(c3 = 0.2222379983269106, c5 = 0.21876996521511627).
No listed convention matches both printed digits; the two relative
discrepancies are unequal, so a single rescaling of (t, f) cannot
repair them.
Script: `coupled_cycle02_reproduce_V/`.

### C. Full map F : Sym²(3 ⊕ 5) → 4_3 ⊕ 4_5 and the 8-amplitude Hessian
**PROVED** (cycle 03). F is rank 8, kernel 28; only 3 ⊗ 5 → 4_3 and
Sym² 5 → 4_5 are nonzero. Hidden Hessian eigenvalues
2 c3 = 0.4444759966538212 (×4) and 2 Δ² c5 = 2.7110263135564066×10^{-6}
(×4). Subsequent **Question C** of the condensed-phase series
(cycle 22): the overall y_even scale is **FREE** (see below).
Scripts: `coupled_cycle03_map_F_hessian/`,
`coupled_cycle22_ye_normalisation/`.

### D. Are invariant eigenvalue ratios independent of source direction?
**FALSIFIED** (cycle 04), with an explicit counterexample: signed
histories 0 and 1 give distinct portal-ratio tuples (maximum absolute
difference 0.5). Hidden Hessian ratios are direction-independent.
Subsequent **Question D** of the condensed-phase series (cycles 23
and 25): the joint (A, θ) action is gauge-invariant and the
longitudinal Ward identity holds; the transverse kernel at A = 0 is
not positive definite, while about the derived π-flux vacuum it is
positive definite but identity-like, not Maxwell-like (see below).
Scripts: `coupled_cycle04_ratio_invariance/`,
`coupled_cycle23_gi_current/`,
`coupled_cycle25_piflux_kernel/`.

### E. Five-solid constraints, response, Ward, H13 ⊕ H51
**PROVED** for the five-solid identities, the T0 poles/residues, the
1/2/n-step transfers and the original Ward contacts (cycle 05).
**OPEN**, after the full subsequent programme, for a unique
Maxwell term, three charged singlets, a derived y_even, and any of
the four historical ARFs.

H13 = 2·1 ⊕ 3 ⊕ 3' ⊕ 5. Inversion then hopping collapse eight H13
Yukawas to a residual ratio r = y_even / y_odd (cycles 10–11). The
even channel is adjacent to 4_5 and the odd channel to 4_3. There
is no unique fermion kinetic beyond the graph Laplacian of the 12
icosahedral vertices (and its recorded alternatives: Hodge Λ = K+I,
the 13-site geometric Hodge, and the vertex12 ⊗ 2 spinor lift).
Script: `coupled_cycle05_response_matter_arf/` and cycles 06–26.

## Condensed-phase status

4_5 condensation is **PROVED** (cycle 18, Nambu/BdG measure; alt 25).
The pairing quadratic is attractive; the Dirac channel was a
misapplied stiffening. Any y_even > y_c,even(η) = 0.006011318618427269
condenses. The large-vev formula is r_* / y_even = N / (4 c_even)
with nuclear norm N = 4.640379972803843 and
c_even = Δ² c5 = 1.3555131567782033×10^{-6}, i.e.
r_* / y_even = 8.558345504799715×10^5
(numerical minimum at y_even = 1: r_* = 8.6126068637762×10^5).
The residual ratio r = y_even / y_odd is **not fixed** by
condensation (cycle 19); the effective theory after condensation is
two-dimensional.

Pairing-dominated mass ratios are parameter-free (cycle 20):
singular values 0 : √(2/15) : √(1/6) : √(3/10) = 0 : 2 : √5 : 3
(multiplicities 1, 3, 6, 2). The 6 splits absolutely by 2√5 under
the graph Laplacian. An extra unpaired H13 mode sits at E = 13
when A = 0 (K v = 13 v, Δ v = 0). Non-pairing ratios 13/E_pair and
m_odd / E_pair scale as 1/y_even² and are not predictions while
y_even is free (cycles 22, 24).

Question C (cycle 22), **PROVED**: y_even is FREE. Unit-norm
visible sources, Z_hist (independent of y_even; Z_hist(η) = 2,
Z_hist(0) = 64), KMS data (η, ρ★) and the charge-2 Ward identity
(homogeneous in y_even) do not uniquely fix a value above
criticality without an extra postulate.

Question D (cycles 23, 25, 26):
- Gauge invariance and the longitudinal Ward identity hold once
  the Goldstone orbit θ → θ − λ accompanies A → A + λ_i − λ_j.
- At A = 0 the transverse kernel is not positive definite
  (Meissner of the archived one-loop action **FALSIFIED**; Π_T =
  −I/12 at T = 0 from the unpaired mode; alt 29 / 34 / cycle 23).
  Alt 29 was missing Goldstone compensation along exact A = dλ,
  not Nambu–Gor’kov vertices or a transverse Goldstone.
- The derived vacuum of the archived action (κ_ext = 0) is all-π
  flux (alt 31–35). The unpaired mode is lifted to E = 10.
- About that vacuum, at the large-vev slice (cycle 25),
      Π_T(T = 0) = +(1/12) I_19
      Π_T(T = η) = +[tanh(10/(2η))/12] I_19 ≈ 0.056881 I_19.
  Positive definite (a Meissner mass exists as an isotropic
  number) but **not Maxwell-like** (residual to Δ1_T is 0.459;
  generalised κ in [0.01591, 0.10908], spread 2.33; κ_iso = +1/48).
  In the large-vev limit the leading piece is independent of
  y_even; pairing corrections vanish as 1/E_pair ∝ 1/ye².
- The spinor completion (cycle 26) is the same story with the
  sign-reversed alt-34 coefficient: Π_T(A = π, T = 0) = +0.141772 I
  and Π_T(A = 0, T = 0) = −0.141772 I. E_min(A_π) = 9.253254.
- Because neither kernel is a unique positive Maxwell coefficient,
  α_eff = 1/κ was not compared to
  R_α = 3/(64 φ) + 1/(79 φ²) ≈ 0.03380535602328556.

## Parameter-free predictions (not ARF identifications)

- Single-mode hidden couplings c3, c5 and H3 = 2 c3, H5 = 2 Δ² c5.
- √(H5/H3) = Δ · √((14+ρ)(18+ρ)) / (16+ρ) (cycle 14).
- Z_hist(β) = 2 + 12 e^{−10β} + 30 e^{−16β} + 20 e^{−18β}.
- Pairing charge +2; hopping picks λ_j − λ_i, pairing picks λ_i + λ_j.
- Even-channel condensation for any y_even > y_c,even(η), with
  pairing singular-value ratios 0 : 2 : √5 : 3.
- Derived fermion-only vacuum: all-π flux, spectrum
  10 ⊕ 3 ⊕ 6 ⊕ 2 (spatial) or 2 ⊕ 6 ⊕ 12 ⊕ 4 (spinor).
- One-loop transverse polarisation: −I/12 at A = 0, T = 0 and
  +I/12 at A = π, T = 0 (spatial graph); the spinor analogue
  ±0.141772 I.

## Remaining free parameters

The overall y_even is free. After inversion and hopping the
Yukawa sector is a 2-plane (y_even, y_odd); condensation does not
fix their ratio. Observables that scale as 1/y_even² (13/E_pair,
m_odd/E_pair) are therefore not predictions. No Yukawa ray was
found, so the one-loop / EM / ARF pipeline was not run.

## Obstructions

1. The printed V string is not reproduced from the reconstructed
   operators (Question B).
2. Portal eigenvalue ratios depend on the source direction
   (Question D, original).
3. y_even is not fixed by any archived history normalisation
   (Question C, condensed-phase).
4. The archived one-loop action has no tree-level |D_A Δ|². Its
   induced Π_T is an isotropic mass from the unpaired (or
   spin-lifted) charged mode, not a multiple of Δ1_T, so there is
   no unique positive Maxwell κ and no derived α.
5. The condensed spectrum is not three nondegenerate charged
   singlets. A4 (spatial) or 2I (spinor) protects multiplets;
   combining π-flux with the spin connection preserves A4 and
   yields face traces −2 cos(π/10) without picking a U(1)
   handedness (alt 38). Gaussian fluctuations of 4_5 / 4_3 do not
   split multiplets: after sanitizing a noisy raw Hessian, the
   static one-loop self-energy is a scalar on every A4 irrep
   (alt 39).
6. The H64 certificate’s nested counts 276 ⊃ 8 ⊃ 4 ⊃ 2 match the
   Yukawa / inversion / hopping dimensions, but the concrete
   subspaces are orthogonal inside Sym² H64 for every
   energy-respecting embedding tested (principal angles 90°;
   different CG types 1⊗4 versus 3⊗3', 3⊗5, 3'⊗5, Sym² 5). This
   is a coincidence of counts, not an identification (alt 37).
7. All four historical ARFs remain underived.

## Alt routes 37–39 (integrated, not duplicated)

- **alt 37 (PROVED).** Principal angles between our V8/V4 and the
  certificate’s C8/C4_S are 90° on all eight energy-respecting
  embeddings (max overlap singular value ≲ 10^{-16}). C4_B was
  not constructed (archived Uh is not unique from the new files);
  orthogonality of V8 to C8 already implies orthogonality to every
  subspace of C8. Pred sha256
  `ec4c48302559e5abd3964812cee1af2dd846b16e2621ccdbcd372a645180a179`.
- **alt 38 (PROVED).** Combined π-flux × spinor face holonomy
  equals −2 cos(π/10) on all 20 faces. Stabiliser of the combined
  pattern plus Δ is A4 (order 12), not ℤ3 or ℤ2; traces are real
  and time reversal does not pick a handedness. Fermion-only
  vacuum remains π-flux (ΔΩ(T = 0) = −8.506). Spectrum at A_π is
  2 ⊕ 6 ⊕ 12 ⊕ 4 with E_min = 9.253254, not three singlets.
  Pred sha256
  `41506a6dadd257d348b398a30a09aada123762e61d915c31ec2e8b2a8da743a8`.
- **alt 39 (PROVED).** A raw 8×8 finite-difference Hessian mixes
  the O(10^{-6}) 4_5 block with cancellation noise (apparent
  negative eigenvalues ∼ 10^{-6}). Directional second derivatives
  are stable and positive definite: κ_rad = 2 c_even =
  2.711024×10^{-6}, κ_ang = 1.626079×10^{-6} (the 3 of A4),
  κ_odd = 2 c3 ≈ 0.444475. Relative fluctuation amplitudes are
  ∼ 7×10^{-4}. The five A4 directions are not selected
  (order-by-disorder). With the sanitized covariance, the static
  self-energy W is a scalar on every multiplet (relative spreads
  ∼ 10^{-14}); an A4-invariant W cannot split a 3. C_mass and
  R_mass were not compared. Pred sha256
  `c64442acb624642fcd3ca34ef814be7659dd49f6a5fad10a7fe4b61c09ac3a5c`.

## Paths to verification scripts

Coupled line, under `/workspace/arf_research/coupled_cycleNN_*/`
and the same names in this archive: 01 reconstruct, 02 V, 03 F,
04 ratios, 05 response, 10 Noether current, 11 residual 2-plane,
12 Ward / RG of the ratio, 14 √(H5/H3), 17 modular Z, 18 Nambu
measure, 19 vev and r, 20 effective reduction, 21 numpy-only
verifier, 22 y_even normalisation, 23 GI current at A = 0, 24
non-pairing ratios (DID_NOT_RUN), 25 π-flux kernel, 26 spinor
π-flux kernel. Independent verifier:
`coupled_cycle21_independent_verification/`.

Alt line, under `alt_routes/alt_cycleNN_*/` and
`/workspace/arf_research/alt_cycleNN_*/`: 25 condensation, 29
charge-2 Higgs / London, 31–32 π-flux vacuum and spectrum, 33
spinor lift, 34 induced κ at A = 0, 35 derived-vacuum spectrum,
36 repo diff through 6bad7b3, 37 principal angles, 38 π-flux ×
spinor, 39 Gaussian fluctuations.

No ARF was derived.

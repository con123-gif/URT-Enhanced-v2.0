# SYNTHESIS — Newton’s Cathedral / URT coupled ARF programme

Date: 10 November 2026 (Europe/London).
Branch: `arf-coupled-research`.
Archive: `research_archive/2026-11-10_coupled_arf_derivation/`.
This note compiles coupled cycles 01–37 and alt routes 01–48. It
performs no new numerical experiment. Alt cycles 49–51 (C3 flux
stability, spinor C3 spectrum, handedness) had no reports at the
time of writing and were not integrated or duplicated.

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
`coupled_cycle25_piflux_kernel/`,
`coupled_cycle28_unbroken_photon/`,
`coupled_cycle29_momentum_expansion/`.

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
- Cycle 28: no second derived, independently gauged U(1) charges
  the condensate (clock Wilson charges coincide with global Q_geo
  on geometry; ker Hbits ⊥ 4_5; End_{A5}(4) ≅ ℝ). There is no
  electroweak-like mixing angle and no massless Maxwell photon
  from a combination Q_geo + c Q_other. The geometric U(1) is
  Higgsed to ℤ2.
- Cycle 29: the canonical Frobenius projection is
  Π_T = m² I + κ Δ1_T + β Δ1_T² + R with, at large vev,
  m² → 1/12 (T = 0) and tanh(10/(2η))/12 (T = η), and with
  κ, β consistent with 0 (w_κ ∼ 10^{-5}). α_eff was not compared.
- Cycle 31: the Cathedral does not uniquely identify U(1)_EM with
  Q_geo on the 30 icosahedral edges. Several candidate maps are
  recorded (finite-algebra u(1), 16-carrier / H64 species charge,
  Hodge–Maxwell connection on those edges, coupled-line Peierls
  Q_geo) and none is selected. A propagating continuum photon is a
  desired closure obligation, not a microscopic axiom that Q_geo
  remain unbroken.
- Cycle 32 (dichotomy). Supercritical (y_even > y_c(T)):
  superconducting, A ≡ π, London mass 1/12, not Maxwell.
  Subcritical (y_even < y_c(T), r = 0): U(1) unbroken; at T = 0
  the connection is exactly flat (Π_T = 0); at T = η the derived
  vacuum is A = 0 (Ω(π)−Ω(0) = 0.087736; all 40 random connections
  lie above A = 0) and Π_T is positive definite and Maxwell-like
  (residual 0.060) but not unique (generalised-κ spread 0.305,
  w_β = 0.210). No unique positive Maxwell κ; α_eff was not
  compared. The subcritical T = η kernel has a near-zero London
  piece (m² = −1.71×10^{-4}, w_m = 0.023).
- Cycle 33: T_c(y_even = 1) = 1.844301×10^5 = 3.076×10^4 η.
  Every O(1) coupling has T_c ≫ η. The only derived temperature
  η places all O(1) Yukawas deep in the supercritical branch.
  High-T formula T_c^{HT} = y_e² / (4 c_even), from
  ||Δ_unit||_F² = 2.
- Cycle 35: the archive uniquely states α(0)^{-1} = 4π K_γ for a
  4D infrared transverse q² residue K_γ in the electron chart,
  and does not uniquely extract that K_γ from the finite-graph
  Π_T (λ free; no q → 0 mode; inequivalent discrete avatars;
  “massless photon projection” is electroweak Q = Y+T_3 plus
  running). No unique κ_IR; α_eff was not compared to R_α or
  to 1/137.036.
- Cycle 36: the spinor-lifted subcritical branch at T = η has
  the same dichotomy. Vacuum A = 0 (Ω(π)−Ω(0) = 0.167833);
  gap 0.746746^{⊕4} at A = 0; Π_T positive definite and
  Maxwell-like (residual 0.046) but not unique (spread 0.215,
  w_β = 0.176, m² = −1.28×10^{-4}). No α_eff comparison.
- Cycle 37: no derived coupling selects the subcritical branch.
  Δ and Δ² lie below y_c(0) (would never condense if they were
  y_even); γ = 1/81 lies above y_c(η). Cycle 22 still stands:
  y_even is FREE. Occupying the subcritical branch requires an
  extra postulate y_even < y_c(η) ≈ 0.006.

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
  ±0.141772 I. The Frobenius projection of the π-flux kernel
  confirms m² = 1/12 and κ = 0 at large vev (cycle 29).
- No electroweak-like unbroken gauged combination (cycle 28).
- Subcritical (r = 0) identities (cycle 32): Ω_f[A] is exactly
  flat at T = 0 (K[A] ⪰ 0, Tr K[A] = 60); spectra
  0 ⊕ (5−√5)^3 ⊕ 6^5 ⊕ (5+√5)^3 at A = 0 and
  10 ⊕ (5+√5)^3 ⊕ 4^5 ⊕ (5−√5)^3 at A = π;
  Ω_f(π)−Ω_f(0) = 0.08773582709207517 at T = η;
  Tr(K^4) equals 14880 (A = 0) and 19680 (A = π).
- T_c^{HT}(y_e) = y_e² / (4 c_even) with ||Δ_unit||_F² = 2
  (cycle 33); T_c(1) = 1.844301×10^5.

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
4. The archived one-loop action has no tree-level |D_A Δ|². On
   the supercritical branch its induced Π_T is an isotropic
   London mass from the unpaired (or spin-lifted) charged mode,
   not a multiple of Δ1_T (cycle 29: κ consistent with 0). Cycle
   28 finds no second gauged U(1) that could leave a massless
   mixed photon. On the subcritical branch at T = η the kernel
   is Maxwell-like (residual 0.060) with a near-zero London mass,
   but κ is not unique (spread 0.305), so α_eff is still not
   compared (cycle 32). The unique derived temperature η does
   not place O(1) couplings on that subcritical branch
   (cycle 33: T_c(1)/η ≈ 3.08×10^4). The Cathedral itself does
   not declare Q_geo to be U(1)_EM, nor does it impose a
   massless microscopic photon (cycle 31).
5. The condensed spectrum is not three nondegenerate charged
   singlets. A4 (spatial) or 2I (spinor) protects multiplets;
   combining π-flux with the spin connection preserves A4
   (alt 38). The duality-lifted dodeca even channel condenses
   with stabiliser D3, but the joint H13+dodeca vacuum aligns
   with the icosahedral A4 ray (alt 40–41); the joint spectrum
   still has leftover multiplets, so C_mass and R_mass were not
   compared (alt 42).
6. The H64 certificate’s nested counts 276 ⊃ 8 ⊃ 4 ⊃ 2 match the
   Yukawa / inversion / hopping dimensions, but the concrete
   subspaces are orthogonal inside Sym² H64 for every
   energy-respecting embedding tested (principal angles 90°;
   different CG types 1⊗4 versus 3⊗3', 3⊗5, 3'⊗5, Sym² 5). This
   is a coincidence of counts, not an identification (alt 37).
7. All four historical ARFs remain underived.

## Dichotomy (cycles 31–33)

The key tension of this block — in the condensed vacuum the
geometric U(1) is Higgsed, with photon mass 1/12 — is a tension
with a desired continuum output and with the coupled line’s
working identification of that U(1) as Q_geo, not a violation of
an archived microscopic requirement (cycle 31). The even channel
then splits into two derived phases.

- SuperCRITICAL, y_even > y_c(T): superconducting. Derived flux
  vacuum A ≡ π; unpaired mode at E = 10; Π_T = (1/12) I
  (T = 0) or [tanh(10/(2T))/12] I (T = η); not Maxwell-like.
- SubCRITICAL, y_even < y_c(T): normal, r = 0, U(1) unbroken.
  Derived flux vacuum A = 0 at T = η and the entire connection
  torus at T = 0. Unpaired mode at E = 0. Π_T(T = 0) = 0;
  Π_T(T = η) is positive definite and Maxwell-like but not a
  unique κ. No α_eff comparison. Parameter-free spectral
  identities as listed above.
- The KMS temperature η lies far below T_c for every O(1)
  Yukawa, so the programme’s only derived temperature selects
  the supercritical / London-massive side.
- No unique archived map sends the subcritical Π_T to a
  Thomson α_eff = 1/(4π K_γ) (cycle 35). The spinor lift
  repeats the structural prediction (cycle 36) and does not
  create such a map. The subcritical phase is consistent but
  unselected (cycle 37).

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

## Alt routes 40–42 (integrated, not duplicated)

- **alt 40 (PROVED).** Abstract H51 is not a condensate carrier
  (no canonical embedding into H64). The only derived pairing on
  the A5-covariant complement is the polar-duality lift of the
  residual even/odd frames onto the dodecahedron. The even
  channel condenses at T = η, y = 1 (y_c = 0.005791,
  r_* = 9.85212×10^5) with stabiliser D3 (order 6), not A4. The
  odd channel does not condense (y_c = 2.345). Tetrahedron, cube
  and octahedron have Hodge kinetics but no derived pairing.
  Pred sha256
  `151029c0f4c22ffa3100a7138f7d6fd549816a2c32baf1d3363850dd453340c3`.
- **alt 41 (PROVED).** A single shared hidden 4_5: there is no
  extra relative-orientation modulus. The joint nuclear-norm
  maximiser coincides with the icosahedral A4 ray (overlap 1) and
  not with the dodeca D3 ray (overlap √6/4). Joint stabiliser
  A4; Cbridge does not reduce it. Even joint y_c = 0.004147,
  r_* = 1.79764×10^6; odd joint does not condense.
  Pred sha256
  `b7af64ab104d209945ef9a94ea52254aaa7527bd4f631a64310b640dc0a6163f`.
- **alt 42 (PROVED).** Joint stabiliser is A4, not smaller. The
  32-site spectrum has leftover multiplets (K0: two positive
  singlets plus 4, 3, 5, 3, 12, 2; KC: four singlets plus the
  same multiplets), so three nondegenerate charged singlets do
  not appear. C_mass and R_mass were not compared.
  Pred sha256
  `8e569988e670badfa454e3e64e8d05a5e595715d5fcce478ecf2e8a2d692d228`.

## Alt routes 43–45 (integrated, not duplicated)

- **alt 43 (PROVED on H1–H2; H3 FALSIFIED).** Joint nuclear-norm
  potential α(ĥ) = ||Δ_ico||_* + ||Δ_dodeca||_* on RP³. A4 is
  the global maximiser. A C3 critical point exists as a
  metastable local maximum of α below A4; it is not a winning
  Z3 minimum. Pred sha256
  `6245008f4aff749ff1899cd048469b19609485c66552812bbe9922824d251557`.
- **alt 44 (PROVED).** Derived weight changes (two-sided spinor
  lift, χ isotropy, Cbridge) do not invert the A4 < C3 < D3
  ranking of Ω at T = η. Pred sha256
  `5577ffaeb7554a66eff3d09bb0d1d1e99eb8d1b2959a8cd6bcbb82ca3a2b1957`.
- **alt 45 (PROVED).** A smaller stabiliser does not win at
  physical values (T = η, y = 1). C_mass and R_mass were not
  compared. Pred sha256
  `1ff4f1717c94f6a4a6c6c1ddf1add218a66b8ff3ae9435f4baf76c2c79cc4c6c`.

## Alt routes 46–51 (integrated as far as reported; not duplicated)

- **alt 46 (CONDITIONAL).** Metastable mixed C3 spectrum (not
  the ground state). Three pairing-scale singlets appear;
  predeclared ratios do not match |C_mass| or |R_mass| at
  10^{-4} (closest: ρ31 vs |C_mass| at 1.333%). Catalogue
  hits are look-elsewhere (84% of random numbers also hit).
  Not an ARF. Pred sha256
  `ee8be58a24f26fda80f07df42739581c667075f9d62dcf4316648e9c7aad3b24`.
- **alt 47 (PROVED; H2 FALSIFIED).** Haar basins on RP³
  (N = 800): A4 29.1%, C3 70.9%, D3 0. The C3 basin has
  positive measure and is the majority; each A4 well is
  individually larger. Pred sha256
  `eea4f5803c9d5cce67d410be3e7807e731bf939addf961d0393fba06f681f9e7`.
- **alt 48 (PROVED).** A4–A4 mountain pass in field space has
  a D3 core (Ω-barrier 2.779×10^5). No spatial wall is derived
  without a hidden kinetic, which is not introduced. Pred sha256
  `d4fab25509c17ee83f02d0fc0f84b62b1df1c1d6704ffcd2ccf199a972e36d85`.
- **alt 49–51.** No reports at the time of writing (C3 flux
  stability, spinor C3 spectrum, handedness). Not duplicated.

## Paths to verification scripts

Coupled line, under `/workspace/arf_research/coupled_cycleNN_*/`
and the same names in this archive: 01 reconstruct, 02 V, 03 F,
04 ratios, 05 response, 10 Noether current, 11 residual 2-plane,
12 Ward / RG of the ratio, 14 √(H5/H3), 17 modular Z, 18 Nambu
measure, 19 vev and r, 20 effective reduction, 21 numpy-only
verifier, 22 y_even normalisation, 23 GI current at A = 0, 24
non-pairing ratios (DID_NOT_RUN), 25 π-flux kernel, 26 spinor
π-flux kernel, 28 unbroken combination, 29 momentum expansion, 31 Cathedral
EM U(1) reading, 32 dichotomy / subcritical kernel, 33 T_c vs η,
35 IR projection / κ_IR, 36 spinor subcritical kernel, 37 subcritical
consistency.
Independent verifier:
`coupled_cycle21_independent_verification/`.

Alt line, under `alt_routes/alt_cycleNN_*/` and
`/workspace/arf_research/alt_cycleNN_*/`: 25 condensation, 29
charge-2 Higgs / London, 31–32 π-flux vacuum and spectrum, 33
spinor lift, 34 induced κ at A = 0, 35 derived-vacuum spectrum,
36 repo diff through 6bad7b3, 37 principal angles, 38 π-flux ×
spinor, 39 Gaussian fluctuations, 40 dodeca / H51 condensation,
41 joint H13+dodeca vacuum, 42 joint spectrum, 43 joint 4_5 sphere,
44 derived weights, 45 smaller-stabiliser spectrum, 46 C3 metastable
spectrum, 47 RP³ basins, 48 A4 domain defects. Alt 49–51 had no
reports.

No ARF was derived.

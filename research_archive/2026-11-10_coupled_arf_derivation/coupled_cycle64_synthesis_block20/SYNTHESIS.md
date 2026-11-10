# SYNTHESIS — Newton’s Cathedral / URT coupled ARF programme

Date: 10 November 2026 (Europe/London).
Branch: `arf-coupled-research`.
Archive: `research_archive/2026-11-10_coupled_arf_derivation/`.
This note compiles coupled cycles 01–64 and alt routes 01–73
(alt 67 was absent). It performs no new numerical experiment.
Coupled cycle 64 is a compilation only. Alt routes 71–73 are
integrated from their REPORT.md files, not duplicated.
Suggested cycles 59–60 were folded into coupled cycle 61 as
status notes, not run as separate cycles. Both lines agree
that the ARF derivation has reached a pause point; see the
section “Pause point / what would unblock” below.

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
the four historical ARFs. Cycle 51 names the exact obstruction to
a unique 4D coframe; cycle 52 finds no derived principle that
selects the y_even branch; cycle 53 records that C_IR remains
blocked by the missing hidden-51 embedding; cycle 55 finds no
derived term that bounds the y-runaway; cycle 56 records that
three charged singlets are still missing; cycle 57 records that
y_π is not a selector; cycle 61 finds that alt-65 P1 is a block
of the coupled H13 kinetic, not of any other named 4-block;
cycle 62 derives ρ_10 = 1/(φ√5) and finds it is not a
historical ARF. Coupled cycle 64 records a pause: further
numerical cycles on the present operators will not close E
without one of the four new inputs listed below.

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
- Cycle 39: the archive’s own missing inputs for physical α and
  masses include M_U, f_G, the coframe/continuum conversion, the
  electron chart as a matching condition, C_IR, the hidden-51
  determinant, the physical clock and Gauss projection, the
  Maxwell stiffness λ, running/thresholds/EW photon projection,
  Newton’s G, lepton/Higgs poles, and T_*[A]. None of these is
  fixed by proved coupled-line structure through cycle 38.
- Cycle 40: the product of the solid with the 24-clock supplies a
  genuine discrete momentum but not the archive’s K_γ. Π_T(0) is
  nonzero (spatial λ ∈ [0.001611, 0.012756]; spinor
  [0.003289, 0.024387]), so lim Tr[Π]/(nT q²) diverges. The
  dynamical residue R(q) = (Π(q)−Π(0))/[4 sin²(q/2)] is neither
  unique (spreads 4.45 and 3.96) nor positive (K_iso ≈ −1.35×10^{-5}
  spatial, −2.85×10^{-5} spinor). No α_eff comparison.
- Cycle 41: y_c(η) = Δ √(c5/χ(η)) is an exact identity of the
  definitions y_c = √(c_even/χ) and c_even = Δ² c5 (relative
  error 0 on the ico numbers). √(c5/χ(η)) = 2.38638 is O(1), so
  y_c is O(Δ). This does not set y_even = Δ.
- Cycle 43: the derived Hodge structure uniquely fixes the
  Gauss-law / transverse projector P_T (sphere: b₁ = 0; unique
  Δ0⁺ zero-mode removal; 19 coexact modes). At r = 0 the
  charge-0 Hodge–Noether current is unique, conditionally on
  the working Q_geo identification (cycle 31 stands). The
  projected subcritical Π_T is positive definite and
  Maxwell-like (resid_M = 0.060123) but not unique (spread
  0.305459, w_β = 0.2096, κ_iso = 0.002061847). The conversion
  gate therefore fails; no K_γ and no α_eff comparison.
- Cycle 44: the unique A5-equivariant frequency-n subdivisions
  of the 2-complex (n = 1, 2, 3) are a derived refinement
  sequence. Combinatorial κ_iso = 0.002061944, 0.002246307,
  0.002276376 appears to approach a finite nonzero value under
  the predeclared three-point test, but spread stays ≈ 0.26
  (not unique Maxwell at n = 3) and the coframe conversion
  remains missing. No K_γ; no α_eff comparison. The dyadic
  clock list N = 12, 24, 48, 96 was not run.
- Cycle 45: the archived G_{13} graph is not a sub-block,
  quotient or restriction of geometric H13, K0, the joint
  32-site Laplacian, subcritical BdG, the five-solid 0-form
  Laplacian, or the H64 hypercube. Internal structure of G_{13}
  is left to the alt line.
- Cycle 47: lumped A5-invariant Hodge metrics on the frequency-n
  2-complex form a cone of dimension 3, 6, 11 at n = 1, 2, 3
  (2, 5, 10 after scale). No unique derived weighting exists
  at n ≥ 2. All eight named geometric Hodge stars are
  well-defined and inequivalent. None of the predeclared
  family, including G_comb, is unique Maxwell (zero hits at
  spread < 0.05; smallest observed 0.089 at one named point
  of n = 2, not selected). The ~26% residual is not resolved.
  No K_γ.
- Cycle 48: there is no unique coframe / continuum conversion.
  The exact obstruction is the conjunction of (i) no unique
  discrete κ, (ii) no unique Hodge inner product, (iii) no
  unique Jacobian even to the S² symbol ℓ(ℓ+1)=2
  (combinatorial Rayleigh → 0; spherical DEC/circ → 2.05;
  Euclidean → 2.67; none selected), and (iv) no unique 4D
  coframe (the Thomson formula is 4D; an S² match would not
  be that map). No Z, no K_γ, no α_eff comparison.
- Cycle 50: cycle 31 still stands. No principle of cycles 32–48
  selects a unique U(1)_EM generator or fixes the electron
  Q = −1 chart beyond the stated convention. κ_iso was not
  promoted to K_γ.

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
fix their ratio. Cycle 52 tested free-energy minimisation of the
full coupled machine at T = η (including the gauge sector),
stability of the origin, and the resolvent
R(z) = (I − z T_coupled)^{-1}: none selects a unique finite y
or a branch without a postulate on y_even (the free energy, if
minimised in y as an extra postulate, runs away to large y).
Cycle 55 finds no derived term already in the coupled machine
that bounds that runaway (in particular no tree Maxwell term
and no tree |D_A Δ|²). Cycle 57 records that y_π is not a
selector. Observables that scale as 1/y_even² (13/E_pair,
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
  unselected (cycle 37). Adding the 24-clock as a periodic
  direction (cycle 40) produces a genuine q but not a unique
  positive q² residue; the literal archive limit still diverges.
  The missing inputs that would close physical α and masses
  remain those listed by the archive itself (cycle 39). The
  smallness of y_c is exactly Δ times an O(1) factor (cycle 41).
  The Hodge Gauss projector is now uniquely derived (cycle 43),
  but it does not make the subcritical Π_T a unique q² residue.
  A derived spatial refinement (cycle 44) appears to stabilise
  combinatorial κ_iso near 0.00228 without collapsing the
  spread and without supplying the coframe conversion. The
  archived G_{13} graph is not a block of the coupled-line
  A5 kinetics (cycle 45). No unique A5-invariant lumped Hodge
  metric removes the subcritical spread (cycle 47). There is
  no unique coframe conversion; the obstruction is the
  conjunction of non-unique κ, non-unique inner product,
  non-unique 2-complex Jacobian, and a missing 4D coframe
  (cycle 48). Cycle 51 attacks clause (iv) directly and finds
  no unique derived 4D / spacetime coframe with Maxwell symbol
  (K/4)∫F²: the spatial geometry is a 2-complex (at most 2+1
  with time); the only exact 4-real-dimensional archival chart
  (Theory of Nature §9, a local Hopf chart on HP¹ = S⁴) lacks
  global gluing, Lorentzian signature, metric scale, connection
  and continuum Maxwell dynamics; C_24 was not reused and
  spherical DEC was not selected for its S² Rayleigh. The
  electron Q = −1 chart remains a matching condition (cycle 50).
  No derived principle occupies one y_even branch without a
  postulate on y (cycle 52); just above y_c there is a window
  in which a small even condensate forms on A = 0 before A = π
  is preferred, which still does not select a unique y.
  Hidden-51 has no new canonical embedding into H64, so C_IR
  remains a missing input (cycle 53). No derived term already
  in the machine bounds the y-runaway (cycle 55). Three
  nondegenerate charged singlets remain missing (cycle 56).
  y_π is not a selector of y_even or of a branch (cycle 57).
  Convention-applied R_mass^(C) and det′L, and the 1/α / K_γ
  chain, remain blocked (status notes folded into cycle 61).
  Alt-65 P1 is a 4-block of the coupled H13 kinetic, related
  to K0 by a cone-lift, and is not any other named 4-block
  (cycle 61). The unique unweighted gap ratio
  ρ_10 = λ_min(Δ1_T)/λ_min(Δ0^+) = 1/(φ√5) does not match a
  historical ARF (cycle 62).

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

## Alt routes 46–54 (integrated; not duplicated)

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
- **alt 49 (PROVED on H1, H3; H2 with a pairing-gauge caveat).**
  The metastable C3 point is a local minimum of the hidden-field
  Ω (positive even-angular, radial and odd curvatures). Fermion-
  only Ω prefers icosahedral π-flux for both C3 and A4; the
  A4−C3 gap −99841 is flux-independent and is not closed by
  π-flux. C3 remains metastable, not the ground state. Pred
  sha256
  `c7d5f746483de024e919b520bf0ae8f3a801e1a87b27a96f81bbc0b6965185ee`.
- **alt 50 (CONDITIONAL).** Two-sided spinor lift of the
  metastable C3 point: spatial pairing singlets become doublets
  (⊗ ε at doubled r_*). Zero pairing-scale singlets on A = 0 and
  on all-π. C_mass and R_mass were not compared. Pred sha256
  `c7c798856080f9ae9bebdd17889b3e7865d70c10b8c1ddd4333ea897b8125a05`.
- **alt 51 (PROVED on H1–H2; H3 FALSIFIED).** Time reversal is a
  symmetry of the C3 vacuum with and without π-flux (holonomy
  traces real; H ≅ H_TR ≅ H*). No leftover 3-fold orientation
  or opposite-chirality C3 orbit. The even+/odd− history-parity
  rule does not assign opposite signs to g and g^{-1}. Pred
  sha256
  `fc6d57b2cf8d1186b9788433b24a2e298d605b4f8ed0f52c3a9497cebd0b7fb6`.
- **alt 52 (PROVED, documentary).** Archival intended meanings
  of the four historical ARFs, not recomputed here: Δ_δ is the
  shift of the effective vacuum rail off δ★
  (Δ_δ = −δ★³/63 − γ/40; δ_eff = δ★ + Δ_δ); R_α is the
  subleading electromagnetic correction in 1/α; C_mass is a mass
  coefficient, not a named PDG ratio; R_mass is the A_5 mass
  residue. A conflict between the arf.py docstring (uses d_eff)
  and the executed 1/α formula (uses unshifted δ★) is recorded,
  not resolved. Coupled-line α_eff work was not duplicated.
  Pred sha256
  `fa0edf9a4f7d7070cc66fff7fb9efaf590b0b914ebf5bebc67a168b3b6b949ed`.
- **alt 53 (PROVED; identification with Δ_δ FALSIFIED).** The
  unique parameter-free Hessian shift is
  O_★ := (3/20 − √(κ_even/κ_odd)) − δ★ ≈ +1.950×10^{-5}
  (tree / Hbits, and essentially unchanged on both the
  supercritical A4 condensate and the parameter-free subcritical
  point y = 0). Relative mismatch to historical Δ_δ is 1.054
  (no 10^{-4} hit; polynomial types disagree). Pred sha256
  `ccbbe0854f5fb0ac54e0350ce3ededdb9ac01aa0ca697161c38a07773eec92de`.
- **alt 54 (PROVED).** Given those archival meanings, none of
  C_mass, R_mass or R_α has a newly computable matching
  observable from proved structure alone. R_α still needs a
  unique electromagnetic current and an IR projection of 1/α
  (the coupled line’s present work). Pred sha256
  `6e65bb8bc50f50cd4d36f3abecec2946bbcc70b56d5dd3e3822a3a508764e123`.

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
consistency, 39 missing-input catalogue, 40 clock-momentum q² residue,
41 y_c identity, 43 Hodge Gauss / IR projection, 44 derived
refinement / continuum test, 45 G_{13} coupled-operator relation,
47 A5-invariant Hodge weightings, 48 coframe / continuum
obstruction, 50 charge chart / electron convention, 51 4D
coframe obstruction, 52 y_even branch selection, 53 hidden-51
/ C_IR status, 55 y-runaway bound, 56 three-singlet status,
57 y_π integrity, 61 P1 versus coupled 4-blocks
(with folded status 59–60), 62 gap ratio ρ_10, 64
compilation and pause point.
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
spectrum, 47 RP³ basins, 48 A4 domain defects, 49 C3 full stability,
50 spinor C3 spectrum, 51 C3 handedness, 52 archival ARF meanings,
53 Δ_δ as a fixed-point shift, 54 archival observables for C_mass,
R_mass and R_α, 55 archived δ-flow fixed point with the G_{13}
Laplacian, 56 R_mass spectral list, 57 arf.py 1/α inconsistency
(documentary), 58 G_{13} structure and the K4 cut, 59
prefactor / denominator origins, 60 1/α chain blockers, 61
what is unique about N=13, 62 G_{13} archive inventory, 63
C_mass 5/16 and 7/8, 64 geometric-H13 scratch substitution,
65 H13 isotype sector assignment, 66 D=3 coincidence
catalogue, 68 uniqueness.py on geometric cones, 69 H13
prefactor look-elsewhere, 70 R_mass form on the P1
complement, 71 derived R_mass form or stop, 72 U(1) /
three-singlet blockers on H13, 73 heat-kernel and zeta
invariants. Alt 67 was absent.

## Alt routes 55–57 (integrated; not duplicated)

- **alt 55 (PROVED; identification with Δ_δ FALSIFIED).** The
  archived π-φ-e flow with L equal to the G_{13} Laplacian has
  a unique homogeneous fixed point at δ★: the shift is
  identically zero, independently of the stipulated coefficients
  η_L and μ. G = 60, D = 3, F = 20 are the archive’s integers,
  so 1/63 and 1/40 follow arithmetically from G+D and 4F, not
  from the fixed-point equation. Relative error to historical
  Δ_δ is 1. Pred sha256
  `9c39b52409cc9f1695d71544ac15fdd87bb4e338ca0924572cda40e6e81912d2`.
- **alt 56 (PROVED; partial on R_mass).** Among 29 derived or
  archival spectra, the unique match to the stipulated list
  (5,5,5,5,5,7,7,9,13) is the G_{13} Laplacian spectrum after
  deleting its four smallest eigenvalues {0,3,3,5}. The graph
  is not A5-equivariant (alt 02). The production prefactors
  3/35, 4/51 and 1/N remain stipulated; finding the list
  derives the spectral sum s, not those weights and not a
  unique A5 origin. Pred sha256
  `7cbecfccc3c57f9268b1941874b2307f130d928b7c6d761ff989c2e7a33f26b7`.
- **alt 57 (PROVED, documentary).** `arf.py` implements
  1/α = 137 + δ★²/π² + R_α = 137.0360100481, in agreement with
  `docs/DERIVATION.md` step 10, while the module docstring uses
  d_eff in place of δ★ and gives 137.0359993124 (difference
  1.0736×10^{-5}). The docstring writing sits closer to CODATA
  137.035999084; that fact is recorded, not used to choose a
  writing. No IR photon / α_eff was constructed (coupled-line
  work, not duplicated). Pred sha256
  `3d173df0844a83a20f5ac4f0002445c3c9e6c7a07014e4765d5c8bbb4c80cd01`.

## Alt routes 58–60 (integrated; not duplicated)

- **alt 58 (PROVED).** Internal structure of the archived G_{13}
  graph (Aut of order 768, no A5 subgroup; Aut-isotypes of the
  Laplacian). The four-smallest eigenvalue cut that produces
  the R_mass list is not a derived projection: no Aut-invariant
  4-space, and no Klein-four invariant 4-space, has spectrum
  {0, 3, 3, 5}. A uniqueness claim that identifies this Cayley
  cone with geometric H13 is a misidentification (geometric
  H13 has λ_2 = 6−√5, not 3). The R_mass list remains a
  stipulated-graph multiset. Pred sha256
  `d0f53a5e6fa141e8aea79303f070373420d5fa4b60af2a87f8ba381beae44405`.
- **alt 59 (PROVED).** The R_mass prefactors D/35, (D+1)/51 and
  1/N, and the d_eff denominators G+D and 4F, remain stipulated.
  Tree-level back-reaction on the archived flow gives a zero
  shift, not Δ_δ. A one-loop shift exists only conditionally on
  a stipulated measure and has the wrong polynomial type.
  In a predeclared catalogue those integers are not rare.
  Coupled-line work was not duplicated. Pred sha256
  `df4f69a63cc6ebd6b2c4193d2c20d689cc9ea034bebedea0f4b987fce6cc55dd`.
- **alt 60 (PROVED).** The unique derived self-consistent rail
  of the archived flow is δ★, not d_eff. The physical 1/α chain
  is blocked even on that rail: no unique IR photon / α_eff
  (I2), 1/π² stipulated (I3), R_α still blocked (I4). The two
  writings 137.0360100 and 137.0359993 are restated as
  archival arithmetic, not selected by CODATA, and not computed
  here as a derived 1/α. Pred sha256
  `4b9f85915af852801b8c4bbb57f26fb0b3dd39775de7b7a0196a2ada733b2527`.

## Coupled cycles 51–53

- **cycle 51 (PROVED).** No unique derived 4D / spacetime
  coframe with Maxwell symbol (K/4)∫F². Exact obstruction: the
  cycle-48 conjunction (i)–(iii), plus (iv) no unique 4D
  geometry with a unique vierbein (spatial 2-complex is at most
  2+1 with time; ToN §9’s local HP¹ chart is not a Maxwell
  coframe; internal 4-spaces and H64 = Q_6 are not spacetime;
  C_24 not reused; spherical DEC not selected). The archive
  still lists the vierbein as missing (ToN §15, §41, §43, §46;
  NATIVE_137). No K_γ. Pred sha256
  `9aaee7250a51e406de7d9bf74ebd6f4e2360774a13f6348ce07830c54ba8c8b4`.
- **cycle 52 (PROVED).** Free-energy minimisation at T = η
  including the gauge sector, origin stability, and the
  resolvent poles do not select the y_even branch or a unique
  finite y. Subcritical ω ≡ 0; supercritical ω runs away as
  −N² y²/(16 c_even) (relative error 1.4×10^{-4} at y = 1).
  Minimising in y is an extra postulate (cycle 22) and, if
  granted, has no interior minimum. A near-threshold window
  y_c < y < y_π ∈ (0.0059995, 0.01) prefers A = 0 with a small
  condensate; it does not occupy a branch without choosing y.
  Pred sha256
  `0179844439f2dfdad768433323942df02208087748b71aa657e746c262a96797`.
- **cycle 53 (PROVED as a status reading).** No new unique
  embedding of abstract H51 into H64 (Hom_A5(4, Sym² H51) still
  has dimension 90). C_IR remains a missing input and is not a
  graph κ. Pred sha256
  `2f2549b3f33f007a8e6852f3e7f80c7cc332ea31f0c1affa72ecf0585554f301`.

## Alt routes 61–63 (integrated; not duplicated)

- **alt 61 (PROVED).** uniqueness.py Theorem 1 has no geometric
  winner among the true platonic cones (icosahedron+centre has
  λ₂ = 6−√5, not 3). C1 alone selects cube+centre (N=9); C2
  alone selects both N=13 and N=21. The only uniqueness of N=13
  is combinatorial: it is the smallest simple platonic cone, or
  equivalently V+1 for the 12-vertex A5-orbit, already written
  in foundations and independent of the Cayley edges. Lemma L4
  holds for every geometric platonic cone and does not uniquely
  select N=13. Theorem 1 is not restored and G_{13} was not
  retuned. Pred sha256
  `3222e7bfd511e60d2ce07eba2c88eda047d08487f76a3cb344a9319afd49ec32`.
- **alt 62 (PROVED).** Archived G_{13} (Cay(Z_12, {1,5,7,11}),
  Aut 768) is an isolated stipulation: no primary file derives
  the edge set. Downstream production modules that import
  `graph.laplacian` or hardcode the Cayley spectrum (dynamics,
  geometry, qft, lorentz, sectors, dark, gravity, uniqueness)
  therefore leave UNDERIVED-via-G13 the R_mass spectral list and
  sum, the K4 list {0,3,3,5} as used in gravity/qft, uniqueness
  Theorem 1 and the Cayley L4 check, and the flow-operator
  frequencies. Independent of the Cayley edges (and still
  possibly stipulated for other reasons): δ★, the Δ_δ
  denominators G+D and 4F, 137 and R_α, C_mass’s 5/16 and 7/8,
  and the sector sizes 4 and 9 as D+1 and D². The gravity.py
  formula |Aut| = V·(D+1)^D = 768 is an integer identification,
  not a derivation of the edges. Pred sha256
  `b176bae20c9bd7dea4eb769409ce7cf6941190ac76fb0812b35baaf92d414aa2`.
- **alt 63 (PROVED).** C_mass’s rationals 5/16 and 7/8 have no
  unique predeclared PT or Casimir role (5/16 has three
  coinciding D=3 writings dim(5)/2^{D+1} = q/16 = dim(5)/(D+1)²;
  7/8 has two, 7_{H13}/2^D and (2^D−1)/2^D). No resolvent-trace
  ratio on geometric H13 hits either target at 10^{-4}. The V_0
  expansion about δ★ is (N/2)(1+δ★²)x² + N δ★ x³ + (N/2)x⁴, with
  no (7/8)πφ term and with cubic coefficient N δ★ ≈ 1.918, not
  5/16. Both fractions occur in a predeclared look-elsewhere
  catalogue (14 and 3 expressions). C_mass as a whole remains
  underived (rationals not unique, πφ pairing stipulated, three
  charged singlets still missing). Pred sha256
  `18b8d3331ac85a06105e20d0f0a19d6fca804b4cd6e3dcd7624f5ae7ee25efa6`.

## Coupled cycles 55–57

- **cycle 55 (PROVED).** No derived term already in the coupled
  machine bounds the cycle-52 y-runaway. The existing
  Nambu-plus-gauge functional has leading form
  −N² y²/(16 c_even); remainders on the existing sample
  {0.1, 1, 2} are +51.752, +139.408, +198.498 and do not turn
  ω upward. A tree Maxwell term and a tree |D_A Δ|² are absent
  from the archived action and were not introduced. History
  normalisations, resolvent poles, induced Π_T, the finite
  graph, y_odd and the history complex supply no potential or
  compact domain for y. Pred sha256
  `206b7742081ffa65ef005a17c8fbbe1a2b04e15925f51a9dc9142230e25e2b5e`.
- **cycle 56 (PROVED as a status reading).** No new unique
  spectrum of three nondegenerate charged singlets has been
  derived since alt 42. C_mass and R_mass still lack that
  matching observable. Pred sha256
  `26079809d7e9f8c5f5aea36cc848d73e673447e8f6726157757888edcf9f5de7`.
- **cycle 57 (PROVED as an integrity / status reading).** y_π
  is not a derived selector of y_even or of the sub- versus
  supercritical branch (both sides of y_π are supercritical).
  y_π was not located or compared to γ, Δ, or a historical
  coefficient. G13 was not retuned and the 35/51/63/40 search
  was not reopened. Pred sha256
  `72bc5968f606be678ed8b8718a7792cc36df506af7804409a076c04ec153195b`.

## Alt routes 64–66 (integrated; not duplicated)

- **alt 64 (PROVED).** In a scratch copy only, geometric H13
  was substituted for stipulated G13 with no retuning (repo
  remained clean). Live graph: 13 vertices, 42 edges, surface
  degree 6, tr(L)=84, spectrum
  {0, (6−√5)×3, 7×5, (6+√5)×3, 13}. The homogeneous flow
  fixed point remains δ★. Five live audits fail (graph,
  sectors, geometry, lorentz, qft: degrees, traces, integer
  spectrum, Fiedler=D, heat-trace formula, det′L). Eighteen
  audits pass, several only by insulation (uniqueness, dark,
  gravity). Class-A tests: 8 failed, 130 passed. As-written
  R_MASS is unchanged. The convention-applied four-smallest
  complement is observational only
  (R_mass^(C)=−2.428071256588326), not a derived ARF. Live
  det′L = 31³·7⁵·13 = 6,509,065,381. Pred sha256
  `1832590c7e412de5dd1b9eb48e85d86b11092d1f02b450e5fb9b0fac7e5fe14a`.
- **alt 65 (PROVED).** Geometric H13 isotypes give a derived
  4+9 assignment under the predeclared four-smallest /
  lowest-isotype rule: P1 = {0} ⊕ {(6−√5)×3} versus
  {7×5, (6+√5)×3, 13}, coinciding with the unique
  four-smallest cut (gap √5). Four Aut-invariant 4-spaces
  exist; P3 yields none without splitting an irrep. None
  equals the Cayley lists {0,3,3,5} and {5×5,7,7,9,13}. The
  fermions.py λ=3 / λ∈{5,7} identification does not carry
  (no eigenvalue 3 or 5). This does not recover R_mass
  prefactors and was not PDG-fitted. Pred sha256
  `954b149e43963a9391b5b39eab0eb09023cb2ed939943d3c3ca51547542568ea`.
- **alt 66 (PROVED for aliasing and Theorem 2; C3 as a
  geometric degree identity FALSIFIED).** Honest effective
  independent D=3 coincidence count is 3 (C4:
  2^{D+1}=(D+1)²; C6: G+F+1=D^{D+1}, which is uniqueness
  Theorem 2 and is one derivation of 81, not two of γ;
  C7: λ_5(H13)=2^D−1, counted only if 7/8 is so written),
  or 2 if C7 is dropped. C5 is an alias of C4. C3 fails on
  geometric H13 (total degree 6 ≠ q=5). Cayley tr(L)=72 and
  Aut=768 are not geometric inputs. Readings and writings
  (C1, C2, C10–C12) have weight 0. This does not derive any
  ARF prefactor. Pred sha256
  `d2c25f9dd9436559b92947c69704d01a74a90d57fd390868cc9a77b19b816357`.

## Coupled cycles 61–62 (59–60 folded as status)

- **cycle 61 (PROVED).** Alt-65 P1 = 1_const ⊕ 3_low, spectrum
  {0, (6−√5)×3}, is a block of the geometric H13 kinetic
  already used on the coupled line. It is the H13 kernel plus
  the cone-lift of the 12-site Fiedler 3 (6−√5 = (5−√5)+1).
  It is not the K0 4-block {0, (5−√5)×3}, not the hidden
  Hessians 4_3 or 4_5, and not the dodeca 3- or 5-eigenspaces
  (which are 4-dimensional but have spectra {3}⁴ and {5}⁴).
  No mass or charge formula was built from it. Folded status
  notes: convention-applied R_mass^(C) and det′L are not
  promoted to ARFs (59); 1/α and K_γ remain blocked by the
  coframe and C_IR obstructions, and κ_iso is not promoted
  (60). Pred sha256
  `eaead43c8a3f4c47033371d8a092f50c800b8e5e0da887c964bfe6aa6c5ea92f`.
- **cycle 62 (PROVED).** The unique dimensionless gap ratio
  ρ_10 = λ_min(Δ1_T)/λ_min(Δ0^+) on the unweighted icosahedral
  2-complex equals (3−√5)/(5−√5) = (5−√5)/10 = 1/(φ√5) =
  2/(5+√5) ≈ 0.276393202250021. No T1 or T2 hit at 10^{-4}.
  A 4,763-value look-elsewhere catalogue hits only algebraic
  aliases of this closed form. ρ_10 is a derived A5
  irrational, not a historical ARF. Pred sha256
  `8995e34ff1880167166e5f2056d94170ef0c9f301028eda5e98f897e7781734c`.

## Alt routes 68–70 (integrated; not duplicated). Alt 67 absent.

- **alt 67.** No directory was present at write time; skipped.
- **alt 68 (PROVED).** In a scratch copy, uniqueness.py’s
  hardcoded Cayley λ₂ and spectrum were replaced by genuine
  geometric-cone data, without retuning Theorem 1’s winner
  string. Theorem 1 then has no winner (AssertionError on an
  empty list). Theorem 2 is untouched. L4 holds for every
  geometric platonic cone and does not uniquely select N=13.
  Tests: 3 failed, 6 passed. This is the companion to alt 64’s
  insulated uniqueness_audit pass. Pred sha256
  `ce007bb506294da440992c2faa6f02da87d2dd80b710f9a793d03e769ced16b8`.
- **alt 69 (PROVED).** A look-elsewhere catalogue built only
  from genuine H13 / S1 integers (Cayley-only 72, 36, 768, 3,
  5, 9 excluded) still hits 35, 51, 63, 80, 5/16 and 7/8 at
  comparable rates (32–45 integer expressions; 16 and 28
  rational). None is a unique named geometric invariant.
  Prefactors remain underived. Pred sha256
  `722192185661d0bcada9b62a1ab56c33b16fdbe3a06d747fa3d31a71b8a2fe71`.
- **alt 70 (PROVED).** The production R_mass form evaluated on
  the derived P1 complement gives R_P1 = −2.428071256588326.
  The historical two-atom writing is identically the
  stipulated piece T; the residual is identically the
  stipulated sum S, with weight 0.08%. Almost all of the
  numerical agreement is stipulated, not a property of the
  P1 list. Independence fails on the summand, 1/N, and the
  two-atom prefactors. No closer writing is adopted. Pred
  sha256
  `6612e688befb74fec93caaddecfe4b514ca8c78c477fa0024e404230236c79d4`.

## Coupled cycle 64 (compilation)

Classification: PROVED as a compilation. No new numerical
experiment. Alt 71–73 reports existed and were integrated,
not duplicated. Pred sha256
`39a0cb21c5e5222dbe7effc3aa867cb0cbb63d655be4c5f32ec142c79d023502`.

## Alt routes 71–73 (integrated; not duplicated)

- **alt 71 (PROVED; R_mass-to-historical-closeness line
  STOPPED).** There is no unique derived R_mass form from
  resolvent / Casimir / dimension traces on geometric H13 or
  P1. The only unique derived scalar under the predeclared
  averaging rule is a mass-weight of the same type as cycle
  70’s S (O(10^{-3}), type-incompatible with an O(1) R_mass
  coefficient). π³ does not arise as a resolvent, Casimir or
  dimension of L. No type-compatible average matches R_hist
  at 10^{-4}. Pred sha256
  `6039222d4fce27b12d81154fd22fb7ea4bfe173369fd14f17d87095f8861d0f1`.
- **alt 72 (PROVED; three-singlet spectrum FALSIFIED; unique
  Aut-invariant harmonic current FALSIFIED).** Geometric H13
  has exactly two Aut-invariant 0-form singlets (λ=0 and
  λ=13), not three. The unique Aut-invariant 1-form is not
  harmonic: it is the coboundary of the radial singlet 1_hub
  (constant on the 12 spokes, zero on the 30 surface edges).
  dim(ker Δ_1)^{Aut} = 0, while b1=30. These remain blockers
  for an alt-line 1/α chain. No α_eff was built, and the
  coupled line’s EM/IR work was not duplicated. Pred sha256
  `9ee6a5875a0ee8cd420c512afb3694cf42d050841b8e302b07e3cdcbc598666b`.
- **alt 73 (PROVED).** A closed list of 132 heat-kernel and
  spectral-zeta invariants on geometric H13 and the P1 blocks,
  compared in 228 gated pairs to the four historical ARFs (and
  type-gated 1/α), produced zero hits at relative 10^{-4} and
  zero in a 10^{-3} band. No invariant entered the 1/α gate
  [50, 200]. The miss is not a near miss of a unique
  correspondence. Pred sha256
  `dc31dc21f83dbae386cc68e7b11c7dea0e077749ae4a5226d826cf943bea30f8`.

## Pause point / what would unblock

Both the coupled line (through cycle 62, compiled here) and
the alt line (through cycle 73) agree that the ARF derivation
has reached diminishing returns on the operators already in
hand. Unique derived numbers continue to appear (icosahedral
and H13 closed forms, isotype blocks, heat-kernel and zeta
invariants), but they are not the four historical ARFs, and
the same structural blockers remain. Further numerical cycles
that only scan the present machine — more gap ratios, more
look-elsewhere catalogues, more identifications of one named
block with another, retuning of G_{13}, Hodge-weight hunts,
promotion of κ_iso or of convention-applied R_mass, locating
y_π, or reopening the integers 35, 51, 63 and 40 — will not
close Question E.

No ARF has been derived. Question E remains OPEN for a unique
Maxwell term, three charged singlets, a derived y_even, and
any of the four historical ARFs.

What would unblock the programme is a *new derived input*,
not another scan. The four required new inputs are:

1. A unique derived 4D / spacetime coframe, together with the
   unique infrared residue K_γ that would convert
   α(0)^{-1} = 4π K_γ. This is blocked today by the cycle-51
   obstruction (no unique vierbein; the spatial geometry is a
   2-complex; Theory of Nature §9’s local HP¹ chart is not a
   Maxwell coframe).
2. A canonical embedding of hidden-51 into H64, together with
   the continuum Coulomb residue that would fix C_IR
   (CHARGE_TRACE). Abstract H51 still has no unique intertwiner
   (Hom_A5(4, Sym² H51) has dimension 90; cycle 53). κ_iso is
   not unique and is not that residue.
3. A derived potential, or a derived compact domain, for the
   Yukawa y_even. The overall scale remains free (cycle 22).
   Free-energy minimisation of the existing Nambu-plus-gauge
   functional, if granted as an extra postulate, runs away as
   −N² y²/(16 c_even), and no term already in the machine
   bounds that runaway (cycles 52, 55). y_π is not a selector
   (cycle 57).
4. A derived spectrum of three nondegenerate charged singlets,
   which would supply the missing matching observable for
   C_mass and R_mass. A4 / 2I still protect multiplets; the
   joint H13+dodeca vacuum still has leftover multiplets
   (alt 42; coupled cycle 56). On geometric H13 itself there
   are only two Aut-invariant 0-form singlets (alt 72).

A genuinely new principle not already in the catalogue could
also unblock the programme. Until one of these inputs is
derived, this archive is the pause point of the coupled ARF
derivation line.

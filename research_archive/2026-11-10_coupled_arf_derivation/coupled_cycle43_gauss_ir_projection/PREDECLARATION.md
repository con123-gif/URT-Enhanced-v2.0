# Coupled cycle 43 predeclaration — unique GI EM current and Hodge Gauss/IR projection

Date: 2026-11-10 (Europe/London)

Cycle 35 found that the archive’s conversion α(0)^{-1} = 4π K_γ needs a
unique positive infrared q² residue, and that the finite shell’s Π_T
does not uniquely supply one. Cycle 40 added a 24-clock momentum and
still did not obtain a unique positive residue. This cycle asks a
prior question on the coupled finite system itself: does the derived
Hodge structure uniquely fix (i) a gauge-invariant electromagnetic
current and (ii) a Gauss-law / transverse projector, and, if so, does
the projected subcritical kernel then have a unique positive q²
coefficient?

No historical ARF is inserted into the action. The original
`newtons-cathedral` tip remains read-only at `6bad7b3`. Predeclaration
is hashed before any Hessian or current computation is run.

## Arena and action (frozen)

The spatial complex is the icosahedral 2-complex already derived in
coupled cycle 01 and alt cycle 02: 12 vertices, 30 edges, 20 triangular
faces, homeomorphic to a sphere (χ = 2). Fermions occupy the 12
vertices. The subcritical branch of cycle 32 is used: r = 0 (no
pairing), T = η, background A = 0 (the derived T = η vacuum). The
one-loop action is the fermion free energy Ω of the magnetic hopping
Laplacian K[A], the same Ω as cycles 32 and 40. No tree Maxwell term
and no tree |DΔ|² are introduced. The overall hopping scale remains
the combinatorial unit of those cycles.

This is the working Q_geo / Peierls coupling already used on the
coupled line. Cycle 31 remains in force: the Cathedral does not
uniquely identify U(1)_EM with that generator. The present cycle
asks whether, once that working coupling is accepted, the Hodge
structure still uniquely fixes a current and a Gauss projector, and
whether the projected kernel is a unique positive Maxwell term.

## (i) Gauge-invariant EM current

Objects that will be distinguished before numbers are seen:

- The charge-0 U(1) Noether current j_K of the unique Hodge hopping
  ray of alt cycle 02 / coupled cycle 10 (the variational derivative
  of ||d_A φ||² with respect to A). Cycle 10 already named this
  current as unique in the charge-0 sector; it will be re-verified
  that Hom_{A5}(trivial charge-0 line, coexact 1-cochains) does not
  invent a second independent charge-0 current on this complex, and
  that at r = 0 the charge-+2 pairing currents of cycle 10 are off.
- Conservation / Gauss: j is retained only through its coexact
  (divergence-free) part, because exact components are pure gauge
  (see (ii)).
- Inequivalent currents that will NOT be selected among after seeing
  numbers: the four-dimensional pre-inversion space of cycle 06, the
  two-dimensional even/odd pairing-current space of cycle 10, hidden
  4_3 or 4_5 currents, clock-Wilson charges, H64 species charge, or
  any linear combination fitted to R_α.

j_K is classified as a unique GI EM current on this system only if
all of the following hold, with no extra postulate: it is the
Noether current of the unique Hodge ray; it is conserved in the
sense d^* j = 0 on shell (or its exact part is projected out by
(ii) uniquely); and no other independent charge-0 current is
admitted by the same Hodge + A5 + gauge data at r = 0.

If uniqueness fails, the failure is recorded and no current is
chosen in order to force a K_γ.

## (ii) Gauss-law / transverse projector from the Hodge structure

The unique (up to overall scale, already fixed combinatorially)
Hodge operators of the 2-complex are

    d0 : C⁰ → C¹,     δ0 = d0ᵀ : C¹ → C⁰,
    d1 : C¹ → C²,     δ1 = d1ᵀ : C² → C¹,
    Δ0 = δ0 d0,       Δ1 = d0 δ0 + δ1 d1.

The 2-complex is a sphere, so b₀ = 1, b₁ = 0, b₂ = 1. Consequently:

- ker Δ0 is the one-dimensional space of constant 0-cochains
  (the Gauss-law zero mode: total charge). The pseudoinverse Δ0⁺
  is unique on the orthogonal complement of the constants and
  annihilates constants.
- ker Δ1 = {0}: there are no harmonic 1-forms. The finite-shell
  warning of 16 October stands.
- The Hodge decomposition C¹ = im d0 ⊕ im δ1 is unique and
  orthogonal. dim im d0 = 11 (pure gauge / exact), dim im δ1 = 19
  (coexact / transverse).

The Gauss-law projection is the unique orthogonal projector onto
the coexact summand,

    P_T = I_{30} − d0 Δ0⁺ δ0    (= projector onto ker δ0 = im δ1).

This is the same 19-dimensional cycle space used in cycles 23–40,
now named as the unique Hodge Gauss-law projector, not as a
choice among discrete avatars of K_γ. Further truncations that
will NOT be treated as the Gauss projector unless a unique
derived principle forces them: restriction to the lowest
eigenspace of Δ1_T (the 3 with λ = 3−√5); any mode cutoff;
κ_REM; clock Fourier projectors; electroweak Q = Y+T₃.

Zero-mode removal on 0-forms is the unique deletion of ker Δ0
in Δ0⁺. It does not, by itself, invent a new projector on 1-forms
beyond P_T.

## Projected kernel and the q² test

Π is the Hessian of Ω with respect to the 30 edge connections, at
A = 0, T = η, r = 0. The projected kernel is

    Π_T = P_T Π P_T    (in the 19-dimensional coexact frame).

The discrete q² operator is the same Hodge Laplacian restricted to
coexact 1-forms, Δ1_T = P_T Δ1 P_T. A unique positive q²
coefficient means all of the following, with the thresholds already
used in cycles 25, 32 and 40:

    κ_i = generalised eigenvalues of (Π_T, Δ1_T),
    spread = (max κ_i − min κ_i) / max(|mean κ_i|, 10^{-12}),
    unique iff spread < 0.05,
    positive iff min κ_i > 0 and Π_T ≻ 0 (λ_min(Π_T) > 10^{-10}),
    Maxwell-like iff ||Π_T − κ_iso Δ1_T||_F / ||Π_T||_F < 0.10,
    where κ_iso = ⟨Π_T, Δ1_T⟩_F / ||Δ1_T||_F².

The identity / London piece and the Frobenius projection
Π_T = m² I + κ Δ1_T + β Δ1_T² + R of cycle 29 are reported as
structural data (m², w_m, w_β, w_κ). They are not used to select a
replacement for κ_iso after seeing numbers.

The Hessian will be computed both by the finite-difference scheme of
cycles 32/40 (ε = 0.02) and by the exact trace-derivative formula
for Ω = Σ_n f(λ_n(K[A])), as a cross-check. The two must agree on
κ_iso, spread and residuals to relative 10^{-4} or to an absolute
10^{-8} floor; if they disagree, the finite-difference kernel of
cycle 32 is the comparison standard and the discrepancy is reported.
Gauge transversality is checked: Π annihilates exact 1-forms to
numerical zero (|vᵀ Π v| < 10^{-8} for unit exact v).

## Conversion gate (frozen)

The conversion α_eff^{-1} = 4π K_γ, with

    R_α = 3/(64 φ) + 1/(79 φ²),
    α_PDG := 1/137.036     (final check only),
    match iff |α_eff − target| / target < 10^{-4},

is applied if and only if (i) a unique GI EM current exists in the
sense above, (ii) the Hodge Gauss projector is the unique P_T just
named (this is a structural claim, independent of numbers), and
(iii) the projected Π_T has a unique positive q² coefficient in the
sense above. Then K_γ is identified with that unique κ (κ_iso, which
then equals every κ_i to the spread tolerance) in combinatorial
units, and α_eff^{-1} = 4π K_γ.

If any of (i)–(iii) fails, no unique archive K_γ is defined by this
projection and no comparison with R_α or 1/137.036 is performed.
Look-elsewhere is not run in that case. Diagnostic numbers
(κ_iso, κ_REM, m², spread, residual) are still reported and are not
rewritten as an electromagnetic coupling.

Inequivalent normalisations that will NOT be selected among after
seeing numbers: 16/3, 1/16, 1/24, 1/48, a coframe Jacobian, κ_REM,
Tr(Π_T)/Tr(Δ1_T), λ_min(Π_T), or the cycle-29 (κ, β) pair when
spread ≥ 0.05.

## Hypotheses

H1. At r = 0 the charge-0 Hodge–Noether current j_K is unique on
    this complex, and the charge-+2 pairing currents are off. This
    uniqueness is conditional on the working Q_geo identification
    (cycle 31 is not reopened and is not claimed to be solved).
H2. The Gauss-law / transverse projector supplied by the derived
    Hodge structure is unique: it is the coexact projector P_T
    together with the unique zero-mode removal in Δ0⁺. There are
    no harmonic 1-forms (b₁ = 0).
H3. The projected subcritical Π_T may or may not be a unique
    positive multiple of Δ1_T; this is computed, not assumed.
    Cycle 32 already found a Maxwell-like but non-unique kernel
    (residual 0.060, spread 0.305) with the same P_T; the present
    cycle re-derives P_T from the Hodge Gauss law and re-tests
    the uniqueness clause of the conversion gate.
H4. If H3 fails uniqueness or positivity, no K_γ is identified and
    no α_eff comparison is performed.

Classification: PROVED / CONDITIONAL / FALSIFIED / OPEN by the
construction and the computation. No ARF target is used to select
a current, a projector, or a residue.

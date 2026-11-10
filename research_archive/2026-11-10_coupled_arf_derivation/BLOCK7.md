# Block 7 — coupled cycles 18–19 and alt 28–30 integration

Date: 10 November 2026 (Europe/London).
Branch: `arf-coupled-research` off `newtons-cathedral`.
Adds only files under `research_archive/2026-11-10_coupled_arf_derivation/`.

## Decisive adjudication: cycle 13 versus alt25

Cycle 10 placed the residual Yukawas in the charge-+2 pairing sector of
Sym²(ℂ¹²). Cycle 18 evaluates the Grassmann path integral of the actual
coupled action (H13 Hodge kinetic + residual pairing frames + hidden
4_3/4_5 with V_hist) in the Nambu basis, and identifies the measure that
the coupled pairing theory dictates.

A symmetric Grassmann bilinear ψᵀ Δ ψ vanishes identically, so an extra
antisymmetric flavor ε_ab (s-wave BCS) is required. In the Nambu spinor
Ψ = (ψ₁, ψ̄₂) the quadratic action is exactly Ψ̄ H_BdG Ψ with
    H_BdG = [[K, Δ], [Δ, −K]]
and no extra ½. The Euclidean Matsubara integral is
    Ω_f(T) = −T Σ_α log(2 cosh(E_α/2T)) + T Σ_i log(2 cosh(|ξ_i|/2T)),
    Ω_f(0) = −½ Σ_α E_α + ½ Σ_i |ξ_i|,
which is alt25’s pairing measure. Particle-hole symmetry of H_BdG holds
to 1.4×10⁻¹⁴. Because Ω_f is minus a convex increasing function of the
positive BdG energies,
    Ω_f = −χ (y r)² + O(r⁴),   χ > 0.

Cycle 13’s formula Z_f = det(K + Δ), inherited from alt16, is the
charge-0 particle-hole / Dirac channel (ψ̄ M ψ). Its quadratic piece is
the positive stiffness +½ y² π ρ². Charge counting: ψ̄ M ψ has charge 0;
ψᵀ Δ ψ has charge +2. The two evaluations use the same residual frames
and have similar magnitude, but they are alternative measures of
different operators, not two terms of one potential, and must not be
added (confirmed independently by alt28).

**PROVED:** the coupled pairing theory dictates the Nambu / BdG pairing
measure (alt25). Cycle 13’s +y² π, used as the pairing measure, is the
Dirac / particle-hole channel misapplied (**FALSIFIED** as the measure
of the coupled pairing action). Alt25’s BCS attraction is **not** wrong.

## Coupled cycle 18 — Nambu path-integral measure
Classification: PROVED for the path-integral identity and the sign.
4_5 condensation at y_even = 1 is **PROVED**. Dimension still 2 for the
Yukawa ratio. Pipeline not run.

Primary kinetic: geometric H13 (centre + 12 vertices; 12 spokes + 30
surface edges), spectrum 0, 13, 6±√5, 7. Pairing lives on the 30 surface
edges (cycle-11 frames); the centre row of Δ vanishes.

| channel | χ(T=η) | y_c(η) | χ(T=0) | y_c(0) | Dirac π_D | condenses at y=1? |
|---|---|---|---|---|---|---|
| even / 4_5 | 0.037511 | 0.006011 | 0.077380 | 0.004185 | +0.05267 | yes |
| odd / 4_3 | 0.038433 | 2.405 | 0.091462 | 1.559 | +0.07373 | no |

A 1D scan of V_hist + Ω_f along the even nuclear-norm maximiser
(Σσ = 4.64038, the same direction as alt25) finds a deep minimum at
r_* ∼ 8×10⁵, Ω_* ∼ −9.9×10⁵. The odd scan stays at the origin
(y_c,odd > 1). Controls: the 12-vertex Laplacian of alt25 gives
y_c,even(η) = 0.005940144 and χ_even = 0.038416, reproducing alt25.
Cycle 13’s Hodge-weighted Λ (eigenvalues 1, 6±√5, 7) gives
χ_even = 0.037511, matching H13 (the 3, 3', 5 sectors coincide; the
unpaired singlet does not contribute to χ). In every kinetic the pairing
quadratic is attractive and the Dirac quadratic stiffens.

Predeclaration sha256:
`5a18553d288be1e6526d5f37da133e0c58fb90c9396032c91068ac4b866f3b37`.

## Coupled cycle 19 — vev scale and r in the condensed phase
Classification: PROVED that the even vev is finite and matches the
large-r balance; “condensed phase selects a unique r = y_even/y_odd”
is **FALSIFIED**. Surviving dimension: **2**. Pipeline not run.

- T = η and T = 0: r_* = 8.54983×10⁵, Ω_* = −9.92793×10⁵
  (the minimum sits at r σ / T ≫ 1, so both temperatures agree).
- Analytic large-vev balance r = (nuclear norm)/(4 c_even) = 8.55835×10⁵
  (relative difference 0.100%). The vev is finite, not a runaway.
- F : Sym² → 4_3 ⊕ 4_5 is surjective (cycle 03), so the unrestricted
  portal V_hist(h − F(S)) supplies no extra hidden quartic.
- The A4 direction lies in the rank-1 cone of Sym²(5) → 4_5
  (alignment 1 − 3×10⁻¹⁴) and can be sourced by a pure 5 without
  inducing h3.

Does condensation fix r?
- T1. ∂Ω/∂h3 at h3 = 0, h5 = v_* has norm 1.65×10⁻⁸ against an even
  force scale 2 c_even r_* ≈ 2.32. The tadpole vanishes (inversion:
  even vacuum cannot source odd h3).
- T2. Sym²(5) sources only 4_5. A pure-5 lift of the A4 direction
  induces no h3.
- T3. Joint scans at O(1) Yukawa pairs: the even vev turns on if and
  only if y_even > y_c,even ≈ 0.00601, independently of y_odd provided
  y_odd < y_c,odd ≈ 2.405. Pairs (0,1), (1,1), (0.1,1) all condense on
  the same even ray; (1, 0.001) stays off (0.001 < y_c,even); (1, 0)
  stays at the origin (odd subcritical). When the even vev is on, its
  magnitude scales as y_even, not as y_even/y_odd.

No unique r is selected.

Predeclaration sha256:
`024d975bec5ce3ea58e39fe87675f0a2fa6018686d758f50343f5ab101995a80`.

## Alt-route integration (cycles 28–30)

Alt 28–30 reports and the LEDGER_ALT frontier update are now on disk
and copied into `alt_routes/`. No Yukawa ray was derived, so the
one-loop / EM / ARF pipeline was not run.

### alt28 — robustness of the 4_5 condensate (PROVED, H1–H4)
Confirms cycle 19 on the ico-Laplacian kinetic used by alt25:
- Vev finite at T = η and T = 0, for (y_e, y_o) = (1, 0) and (1, 1);
  r_* = 8.61261×10⁵ versus the analytic pairing-only balance
  8.55835×10⁵ (relative 0.6%). Cycle 19’s H13 refined scan
  (8.54983×10⁵ versus 8.55835×10⁵, 0.100%) is the same physics on the
  primary H13 kinetic.
- F is surjective onto the hidden 4_3 ⊕ 4_5, so V∘F adds no extra
  hidden quartic. The A4 direction is realizable in the rank-1 cone
  (||α|| ≈ 1.516 for the unit hat, ≈ 1890 for the large vev).
- χ and π must not be added. They are alternative measures (Dirac
  second variation of −log det(Λ + y h·T) versus pairing second
  variation of the Nambu free energy), opposite thermodynamic sign,
  similar magnitude (χ_even / (π_e/2) = 2.92). A counterfactual that
  added π to the pairing potential would shrink r_* to 88.1; that
  combination is not a term of either measure.
- Induced h3 at the even vacuum is tiny: ||h3||/||h5|| ≈ 7.8×10⁻¹².
  The official report and LEDGER_ALT record the stabilizer as robust
  A4 (the raw script flag H4_stab_A4_robust = 0 is a numerical
  threshold artefact of that near-zero tadpole). This matches cycle
  19’s vanishing inversion tadpole and alt30’s A4-preserving analysis.
Pred sha256: `4a6b86143276595bc0ce26e85fcb2d2f31facf0d88a6f52f45a5dbdf30baa01e`.

### alt29 — Higgs / Meissner of the charge-2 condensate
Classification: H1 and H2 PROVED; H3 FALSIFIED; H4 PROVED.
Overall CONDITIONAL.
- Pairing charge is +2: hopping picks λ_j − λ_i, pairing picks
  λ_i + λ_j. Frozen real Δ breaks local U(1); the global U(1) is broken
  to ℤ₂. At the level of symmetry this is a superconducting phase (H1).
- The BdG zero mode has K v₀ = 0 and ||Δ v₀|| ≈ 1.0×10⁻¹⁰: an unpaired
  constant charged fermion, not the U(1) Goldstone (H2). Replacing Δ
  by e^{iθ} Δ leaves the BdG spectrum invariant (max difference
  4.7×10⁻¹⁰). That bosonic phase would be eaten by A if a charge-2
  Higgs kinetic term were present.
- There is no archived tree-level |D_A Δ|². The fermion-induced London
  kernel on the 19-dimensional cycle space, evaluated at a numerically
  safe pairing scale r = 20, is **not** positive definite (H3
  FALSIFIED): at T = η eigenvalues lie in [−0.00155, +0.00665]
  (4 negative, 15 positive); at T = 0 they lie in [−0.0953, −0.0708]
  (all negative). Finite-A scans at r = 10, 100 and at the physical
  vev r_* ≈ 8.61×10⁵ typically lower Ω. The photon is not shown to
  acquire a Meissner mass. The cycle-23 infrared problem (a massless
  Hodge photon coupled to a massless charged fermion) remains. No
  comparison with R_α is performed (H4).
Pred sha256: `6179cdd27ac0b876eb13df54c70028463828f9385207d49effe44501f789fca7`.

### alt30 — A4 → ℤ₃ / three singlets (PROVED, H1–H4, negative)
No listed derived effect breaks A4 or splits the triplets into three
singlets without new parameters. The 3 of A4 is irreducible, so
A4-invariant operators (induced singlet h3, ρ★, Hodge / Cbridge
kinetics) cannot do it, and there is no labelling-independent insertion
of a clock phase θ = 2π/φ². Induced ||h3||/||h5|| ~ 10⁻¹¹ and the
stabilizer remains A4. Hodge Λ lifts the unpaired mode to energy 1 and
K+C_ico lifts it to 4, but a pairing doublet remains in every case;
no spectrum consists of three nondegenerate singlets. C_mass and
R_mass were recorded (4.44680 and −2.43000) but not compared. This
agrees with cycle 19 (vanishing tadpole, rank-1 cone, A4 preserved)
and with alt26 (spectrum 0 ⊕ 3 ⊕ 6 ⊕ 2, not three charged singlets).
Pred sha256: `2bc28647cfcfa8e26cf9aacc74d7625d3db91f9feef6b202832c49b188fff9c5`.

## Next question
The residual 2-plane survives pairing condensation of 4_5: the even
vev turns on independently of y_odd (provided y_odd stays below its
much larger critical value) and does not induce an h3 tadpole that
could fix r. A4 does not split to three singlets. The London kernel of
the charge-2 condensate is indefinite, so a massive photon is not
established. A later cycle should proceed only if a new derived
principle is proposed.

No ARF was derived in this block.

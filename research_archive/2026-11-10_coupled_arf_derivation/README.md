# Questions A–E (coupled ARF programme, 10 November 2026)

These five questions are the numbered tasks of the superseding brief.
Computations use the unmodified operators of
`research_archive/2026-11-07_joint_interacting_native/cathedral_constructed_joint_dynamics_2026_11_07.py`
(construction half, before the RNG split). No toy model and no fitted
parameter was introduced. The four historical ARFs were compared only at
the end of Question E.

## A. Reconstruct the original 190-cochain, 64-history and 24-clock operators

**Classification: PROVED.**

Coupled cycle 01 reconstructed the five-solid Hodge–Dirac operator
(`Tr D² = 720`, `Tr D⁴ = 3456`, `(V,E,F) = (50,90,50)`), `Cbridge`
(`Tr = 160`), the rank-8 portal `Plinear`, face incidence `C`, hidden
projectors `P3` and `P5` (each rank 4), `Hbits` with spectrum
`0(2), 10(12), 16(30), 18(20)`, the hidden isometry
`Hbits Uh P3 = 18 Uh P3` and `Hbits Uh P5 = 16 Uh P5`, and the 24-clock
gaps minimized at `m = 9` (charge 1) and `m = 18` (charge 2). All 18
predeclared identities held. These are the original operators, not a
13-node reduction.

## B. Independently reproduce the nonlinear coupled sources and the printed V

**Classification: FALSIFIED** against the printed archive
`V = 0.490435304391 t² f² + 4.16132699108e-7 f⁴`
(mixed derivative `1.961741217564 tf = 4a`, an identity of the monomial
`a t² f²`, not extra data).

The formulae
`h3 = 2 P3[(C t) ⊙ (C f)]`, `h5 = P5[(C f) ⊙ (C f)]`,
`A3 = 18 I24 + (π/e)² L2`, `A5 = 16 I24 + (π/e)² L2` and
`V_hist = (|h3|² + Δ² |h5|²)/4 − ½ (h3† A3⁻¹ h3 + Δ² h5† A5⁻¹ h5)`
were reconstructed and used without adjustment. On a single charge-2
mode they collapse to `V = c3 ||h3||² + Δ² c5 ||h5||²` with golden-mode
`c3 = 0.2222379983269106`, `c5 = 0.21876996521511627`.

The coefficients `(a, b)` depend strongly on the Iico axis pair:
`a ∈ [0.01842752160576284, 1.3288163404866948]`,
`b ∈ [1.8073508757042662e-7, 4.0665394703346127e-7]`.
No listed convention (Iico unit axes, golden mode, vanishing clock,
factor `N = 24`, untruncated November 7 source on axis `(0,0)`) matches
the printed digits. Nearest candidate, axis `(0,0)` at the golden mode:

- `a = 0.48154259920004555` (relative discrepancy `1.813 %`)
- `b = 4.0665394703346127e-7` (relative discrepancy `2.278 %`)

The two ratios `a_arch/a = 1.0184671204701876` and
`b_arch/b = 1.0233091357988435` are unequal, so a single rescaling of
`(t, f)` cannot repair both. The printed string does not occur in the
cloned repository text.

## C. Full map F : Sym²(3 ⊕ 5) → 4_3 ⊕ 4_5 and the 8-amplitude Hessian

**Classification: PROVED.**

`F` is rank 8, kernel 28, singular values `2.383963416875298` (×4) and
`1` (×4). A5 selection leaves only two nonzero component tensors, each
surjective: `3 ⊗ 5 → 4_3` (this is `h3 = 2 P3[(C t) ⊙ (C f)]`) and
`Sym² 5 → 4_5` (this is `h5 = P5[(C f) ⊙ (C f)]`). The blocks
`3 ⊙ 3 → 4_3, 3 ⊙ 3 → 4_5, 3 ⊗ 5 → 4_5, 5 ⊙ 5 → 4_3` vanish to
`10^{-15}`.

Hidden Hessian eigenvalues: `2 c3 = 0.4444759966538212` (×4) and
`2 Δ² c5 = 2.7110263135564066e-6` (×4). No nulls. Each 4-fold degeneracy
is protected by the A5 irrep 4; the two blocks are separated by the
`Hbits` eigenvalues 18 versus 16. The quartic operator `K = F* G F` on
the 36-dimensional `Sym²` has the same rank and kernel and positive
eigenvalues `1.263041120711679` (×4) and `1.3555131568e-6` (×4).

## D. Are invariant eigenvalue ratios independent of source direction?

**Classification: FALSIFIED**, with an explicit counterexample.

The hidden Hessian of C is direction-independent. The portal Hessian of
`V ∘ q` is not. Signed histories 0 and 1 (original six-bit dictionary,
`σ_s = ±1` on the twelve icosahedral vertices) give ratio tuples

- history 0: `(0, 0, 0, 0, 0, 3/4, 3/4, 1)`
- history 1: `(0, 0, 0, 0, 1/4, 1/4, 1, 1)`

Maximum absolute difference `0.5`. The same non-invariance holds for
0-1 occupancy histories, all 15 Iico axis pairs, and single-bit
coherent superpositions. The six weight-1 Fourier combinations on the
6-cube *are* invariant (all give history 1's ratios). Portal ratios at
a fixed spatial background are clock-independent to `10^{-10}` because
`Δ² c5 / c3 ≈ 6×10^{-6}` and an overall `c3(m)` cancels; the hidden
ratio `c3(m)/(Δ² c5(m))` itself ranges from `162823.8958437176` to
`163951.19236992727` across the 24 charge-2 modes.

## E. Five-solid constraints, recursive response, transfers, Ward, H13 ⊕ H51

**Classification: PROVED** for the five-solid identities, the `T0`
poles/residues, the 1/2/n-step transfers (with no time-step identification)
and the original Ward contacts; **OPEN** for charged-matter fermion poles
and electromagnetic responses, and for derivation of the four ARFs.

Independently recomputed lowest `T0` levels:

- `E1 = 0.0025584063752757697` (geom kernel × charge-1 `m = 9`, mult 2),
  `λ1 = 0.9847773659298271`, pole `z1 = 1.015457944705908`,
  scalar residue `−1.015457944705908`.
- `E2 = 0.010228725137850734` (hist kernel × charge-2 `m = 18`, mult 2),
  `λ2 = 0.9405134122394003`, pole `z2 = 1.0632490584253973`,
  scalar residue `−1.0632490584253973`.
- n-step eigenvalues `e^{−n η E_k}`; `λ2/λ1 = 0.9550518165609617`;
  `Γ = η(E2 − E1) = 0.04598968179431101`.

`ker Hg = 2` is spanned by the all-solid vertex-constant and face-constant
(residuals `1.3×10^{-15}`). `ker Hbits = 2` is the original Gaussian
quotient. Clock charges are 1 on geometry and 2 on history.

`H13 = 2·1 ⊕ 3 ⊕ 3' ⊕ 5`, `Hom_A5(4, H13) = 0`, `Sym²(H13)` contains four
quartets, so two hidden sources give 8 real H13 Yukawas. Abstract
`H51 = 2·1 ⊕ 3·3 ⊕ 3·3' ⊕ 4·4 ⊕ 3·5`. Uniform-charge `H13 ⊕ H51` count
for two sources: 276. No unique fermion kinetic, no unique EM current on
the 90 edges, and mean-field fermion poles vanish at a centred hidden
ensemble.

### ARF comparison (end only) and look-elsewhere

Targets: `Δδ = -0.00035959042756760504`, `Rα = 0.03380535602328556`,
`C_mass = 4.446800183122003`, `R_mass = -2.4299997428893794`.
Nearest structural near-hit among derived numbers:
`3/20 − E1 = 0.14744159362472423` versus `δ★ = 0.1475108101595796`
(relative `0.0469 %`). This is not an identity. Look-elsewhere: 16 of
the 25 listed Cathedral integers appear in the four ARF writings;
`Rα` previously had 8 template rivals within `10^{-4}` and `1/40` had
34 trace writings. No ARF is derived.

## Next question

Derive, from the original five-solid 190-cochain incidence and the now
explicitly known map `F` (only `3 ⊗ 5 → 4_3` and `Sym² 5 → 4_5`), whether
a unique A5-equivariant, gauge-covariant charged current exists on the
90 spatial edges that can couple those two hidden channels to H13 vertex
matter with Ward contacts. Record the dimension if several currents survive.
Do not insert historical ARF expressions into that current.

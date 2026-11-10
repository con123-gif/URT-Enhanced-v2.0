# Block 10 — coupled cycles 25–27 and alt 37–39 integration

Date: 10 November 2026 (Europe/London).
Branch: `arf-coupled-research` off `newtons-cathedral`.
Adds only files under `research_archive/2026-11-10_coupled_arf_derivation/`.

## Coupled cycle 25 — π-flux + 4_5 London / Meissner kernel
Classification: PROVED (physical claims). About the derived all-π
vacuum, at r_* = 8.61261×10^5:

- T = 0: Π_T = +(1/12) I_19 (identity residual 3.2×10^{-5}).
- T = η: Π_T = +[tanh(10/(2η))/12] I_19 (c_I = 0.056876 vs 0.056881).

Positive definite, not Maxwell-like (residual 0.459, generalised κ
in [0.01591, 0.10908], spread 2.33, κ_iso = +1/48). No unique
derived κ; α_eff was not compared to R_α. In the large-vev limit
the leading piece is independent of y_even. Control at A = 0
recovers −I/12. Pred sha256
`b241f66f64f9c7ff785fd2af21e67079d29bdebc61f1874dcb7d05662fd40c48`.

## Coupled cycle 26 — spinor lift about its π-flux vacuum
Classification: PROVED. E_min(A_π) = 9.253254. At r_* (T = 0),
Π_T = +0.141772 I_19, the exact sign reverse of the A = 0 control
(−0.141772 I, matching alt 34). Positive definite, not Maxwell-like
(residual 0.459, spread 2.33). Leading large-vev kernel independent
of y_even (r_* vs r_*/10). α_eff was not compared. Pred sha256
`2010f21ddb51b29d746ae0a56b8ffc4772f51ea3db13b52af716062df22048c4`.

## Coupled cycle 27 — SYNTHESIS.md
Classification: PROVED as a compilation. Answers Questions A–E,
lists parameter-free predictions, the free y_even, obstructions,
and verification paths. Pred sha256
`8825cb6eb72c88a70925a98bae35c1f2171ef20a0e475a3723950f90670ea3a9`.

## Alt-route integration (cycles 37–39)
Not duplicated.

### alt37 — 276→8→4→2 principal angles (PROVED)
The matching nested dimensions are a coincidence of counts: V8 ⊥ C8
and V4 ⊥ C4_S (principal angles 90°) for every energy-respecting
embedding of H13 into H64 (eight embeddings). CG types differ
(1⊗4 versus 3⊗3', 3⊗5, 3'⊗5, Sym² 5). Pred sha256
`ec4c48302559e5abd3964812cee1af2dd846b16e2621ccdbcd372a645180a179`.

### alt38 — π-flux × spinor (PROVED)
Combined face traces equal −2 cos(π/10). Stabiliser is A4, not ℤ3
or ℤ2; no U(1) handedness. Vacuum remains π-flux (ΔΩ = −8.506 at
T = 0). Spectrum 2 ⊕ 6 ⊕ 12 ⊕ 4, E_min = 9.253, not three singlets.
Pred sha256
`41506a6dadd257d348b398a30a09aada123762e61d915c31ec2e8b2a8da743a8`.

### alt39 — Gaussian fluctuations (PROVED)
Raw FD Hessian is noisy in the even block. Directional curvatures
are positive definite (κ_rad = 2 c_even, κ_ang = 1.626×10^{-6},
κ_odd = 2 c3). No order-by-disorder selection. Sanitized W is a
scalar on every multiplet (no split). C_mass and R_mass were not
compared. Pred sha256
`c64442acb624642fcd3ca34ef814be7659dd49f6a5fad10a7fe4b61c09ac3a5c`.

No ARF was derived in this block.

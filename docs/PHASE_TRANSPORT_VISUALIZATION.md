# δ★ Phase-Transport Visualization

*Status: framework documentation, v2.9.87.  External contribution:
James Lockwood (2026) — interactive δ★ phase-transport visualization
(CodePen).  This document records the visualization and a worked
verification of the mathematics behind it; it does **not** add to the
framework's predictions, modules, or CI gates.*

---

## What it is

An interactive animation that renders the Cathedral constant δ★ as a
**deterministic irrational rotation** — "phase transport" rather than
random motion.  The particles look quasi-random, but the source is a
rigid, non-repeating rotation of the circle.

## The engine

The animation is driven by the framework's own constant, written in
turn-fraction form:

```
δ★/π = 80/(1053φ),     φ = (1+√5)/2
```

This is exactly the framework's δ★.  Since the framework defines
`δ★ = (1 − 1/81)·π/(13φ) = (80/81)·π/(13φ)` and `81 × 13 = 1053`, the
two expressions are identical (verified to 130 decimal digits).  The
`1053` is just `N/γ = 13·81`.

The **turn fraction** simplifies to a quadratic irrational:

```
δ★/(2π) = 40/(1053φ) = 20(√5 − 1)/1053 ≈ 0.0234770746…
```

(using `1/φ = φ − 1 = (√5−1)/2`).  Because this is irrational, the
phase samples `n·δ★ mod 2π` never close into a finite cycle, and by
**Weyl's equidistribution theorem** they are equidistributed on the
circle.  That is the core trick: ordered enough to form structure,
irrational enough never to repeat.

## Why the φ matters (low-discrepancy strengthening)

`20(√5−1)/1053` is not merely irrational — it is a *quadratic*
irrational (it lives in ℚ(√5)).  By Lagrange's theorem its continued
fraction is eventually periodic, hence has bounded partial quotients,
hence the number is *badly approximable*.  Badly approximable rotation
numbers have the lowest possible discrepancy, `O(log n / n)`.  So the
coverage is not just uniform in the limit — at every finite frame
count it is about as evenly spread as a deterministic sequence can be.
The φ buried inside δ★ is what buys that.

## Visual layers

| Layer | Rule |
|---|---|
| 6 logarithmic spiral arms | `r(θ) = r₀·exp(tan(δ★)·θ)`, pitch set by δ★ |
| Arm rotation | `ω_arm = δ★ × 8×10⁻⁴` rad/frame |
| 780 drifting particles | amber / cyan alternating by arm (phase-coloured) |
| Resonance shells | `r = R₀·φⁿ`, `n = 0…5` — golden-ratio radial spacing |
| Ring pulse | `1.3×` the δ★ frequency |
| Central singularity | pulses with period `T = 2π/δ★ = 1053φ/40` |
| Phase clock / oscilloscope | readable overlay; click injects a phase pulse |

## The central period

```
T = 2π/δ★ = 1053φ/40
  = 42.594744753840981878985748414675423448987139158386707345715685…
```

(verified to ~130 digits).  The centre almost behaves like a 43-step
clock, but `1053φ/40` is irrational — it never reaches an exact integer
closure.

## Honest caveats

The verification above confirms the *core* claim — irrational rotation,
Weyl equidistribution, the period T.  Two framing points are softer
than the headline:

1. **The `1.3×` ring pulse is rational.**  `1.3 = 13/10`, so the
   ring-pulse subsystem and the phase clock *are* commensurate — that
   pair does close.  The genuine non-repetition comes only from the
   irrational angular rotation itself.

2. **Radius and angle are not independent.**  The radial spacing φ and
   the angular increment `20(√5−1)/1053` both live in ℚ(√5) — they
   share their `√5`.  "Two incommensurate order systems" is hedged
   enough to be defensible, but the cleaner statement is: one
   irrational rotation, plus a φ-geometric radial scaffold built from
   the same field.

## Relation to the framework's dynamics

The visualization uses δ★ as a **rotation number** (an angle added each
step).  The framework's *primary* role for δ★ is different — it is the
**attracting fixed point** of the URT iteration / π-φ-e flow on
`G_{13}`.  Those are distinct dynamical objects:

- the URT iteration's Laplacian `L` is real symmetric, so its spectrum
  is real and the per-mode contraction factors are real positive — δ★
  is a **node** (pure radial contraction, no intrinsic rotation);
- the visualization's δ★-rotation is a separate construction that
  reuses the same scalar as an angle — a uniquely-ergodic circle
  rotation with no fixed point.

Both are legitimate uses of the constant.  The discipline is not to
transport a theorem across uses: a stability or uniqueness result
proved for δ★-as-fixed-point says nothing automatically about
δ★-as-rotation-number.  A genuine "spiral sink" that is *both* — a
contraction with rotation number δ★ — is a natural construction (put
δ★ on the off-diagonal of a 2×2 block, or complexify a mode pair so the
eigenvalue is `r·e^{iδ★}`, `r < 1`), but it is not currently in the
repository.

## Cathedral hooks in the visual parameters

Several of the visualization's design constants echo Cathedral
integers: **6** spiral arms and **6** resonance shells (`n = 0…5`)
`= D!`; **780** particles `= G·N = 60·13`; **1053** `= N/γ = 13·81`.
Whether chosen deliberately or not, they are consistent with the
framework's integer vocabulary.

---

*Credit: the visualization is James Lockwood's work; the constant δ★
and the `80/(1053φ)` structure it comes from are part of the URT /
Cathedral framework.  This document records and verifies — it does not
extend the framework.*

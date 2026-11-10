# Q8 — Independent exact five-vacuum K₂ reconstruction

**Date:** 2026-11-10. **Agent:** GPT. **Result:** THEOREM. **Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING (for the stipulated finite source dictionary, not for gate A or the four ARFs).

## Exact statement

Use the original six antipodal-pair bit order, the nonlinear icosahedral face output of the archived five-solid 50→8→12 pullback, and the five hidden-5 singlets fixed by the A4 normalizers inside the 60-element proper icosahedral rotation group. For the 64-history de Bruijn transfer

`(Qf)(h) = [f(2h mod 64) + f((2h+1) mod 64)]/2`, 

the five unit-normalized stationary second cumulant rates form the exact multiset

`{5/6, 25/24, 67/48, 33/16, 33/16}`, with equal-vacuum mean `71/48`.

## Proof and executable certificate

`independent_native_k2.py` builds the twelve vertices over Q(√5) from `(0, ±1, ±φ)` and cyclic coordinate placements, derives all 30 edges and 20 faces, obtains the exact hidden face-5 projector

`P5 = [I20 − C(Cᵀ C)⁻¹ Cᵀ](L_face − 3 I20)/2`,

and enumerates all 60 orientation-preserving graph automorphisms by exact determinant parity. It enumerates the five four-element Klein subgroups, takes their twelve-element normalizers, and extracts the rank-one 20-dimensional projectors `P5 A_V P5`.

For each of 64 signed histories with the archived least-index antipodal ordering, the script computes exactly

`u = Σ_i sign_i v_(pair_i,first), d_j = v_j·u/(φ+2), z = u·u/(φ+2)`;
`a_j = (5/16)(d_j² − z/3), b_j = d_j/2`;
`E_f = (Σ_(j∈f) a_j)² + (Σ_(j∈f) b_j)²/2`.

For each nonzero vector `t` in the corresponding rank-one hidden-5 projector, the scalar cylinder source is `g_t(h)=Σ_f t_f E_f(h)`. The script asserts that its mean vanishes and `Q⁶g_t = 0`. It evaluates the finite Green–Kubo sum

`K₂(t) = [⟨g_t²⟩ + 2 Σ_(d=1)^5 ⟨g_t Q^d g_t⟩]/⟨t,t⟩`

using rational/Q(√5) arithmetic, and asserts the exact multiset and its mean; an incorrect value yields a nonzero exit code. It imports **no archived scripts or K₂ values** for construction: the target fractions occur only in the terminal assertions. No measured inputs, fits, random stand-ins, or physical ARF normalizations enter.

**Scope:** the equality of the full five-solid pullback with this icosahedral face output is the already archived algebraic identity `Eglobalᵀ Eglobal = I8`, `Plinear = Iico Eglobalᵀ` in `forward/URT_EXACT_SOURCE_WALSH_CORRELATIONS_2026-11-09.py`. This certificate independently reconstructs and checks the equivalent icosahedral output; it does not independently construct the full 190-cochain embedding or derive the six-bit axis dictionary from π–φ–e. Gate A remains open.

## Execution and limits

Executed in GPT's container on 2026-11-10, Python 3.11, sympy 1.14.0, networkx 3.6.1, exit 0 in 1.45 seconds wall time, output:

```
Q8 independent exact native K2: 5/6, 25/24, 67/48, 33/16, 33/16
A5 mean: 71/48
Certificate executed: exact geometry, five A4 projectors, Q^6; physical ARFs not derived
```

This does not derive any ARF, choose a physical A4 vacuum, establish the H64–v61 Wilson source map, or close any physical gate. GitHub CI must re-execute the committed script; sandbox success alone is not a CI verdict.

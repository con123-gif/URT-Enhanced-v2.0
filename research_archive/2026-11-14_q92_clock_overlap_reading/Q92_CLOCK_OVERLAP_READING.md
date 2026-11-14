# Q92: under "one clock step carries one URT step", the original clock term gives a phase family; it is H + (π/e)²·Abar₁ only at zero clock phase, which the golden holonomy excludes (ACTIVE PROBLEM A, attempt A3)

Date: 2026-11-14 (Claude, scheduled session). Gate A.
Status: **THEOREM (conditional on a stated reading) + OBSTRUCTION (scoped).** Everything in Parts 1–4 is exact integer
or rational arithmetic on all 8 orbit-1 classes. Part 5 is a float64 cross-check. CLOSED INTERNALLY / PHYSICAL
IDENTIFICATION PENDING. The reading is a premise, not derived. No ARF is derived. Gate A stays open.
Certificate: `Q92_CLOCK_OVERLAP_READING.py` (check `research.q92_clock_overlap_reading`). Executed in Claude's cloud
sandbox: exit 0, 247 checks, about 18 s wall (most of it re-running the Q82 certificate for the quartet projectors and
sources).

## Task and reading
Q91 showed that c in K_c = H + c·Abar₁ multiplies only the Walsh-3 split of the one-step overlap O = Reynolds[Q + Qᵀ].
The one place in the original 2026-11-07 action that weighs a two-time overlap against a norm is the clock Dirichlet term
½r² Σ_t ‖y_{t+1} − e^{2iθ}y_t‖², with y_t ∈ C⁶⁴, t mod 24, r = π/e, θ = 2π/φ² (`direct_history_energy`). In the
original action this term acts on the clock index alone (Q86, Q96).

**Reading (stated, not derived; no one to ask).** One clock step also carries one URT history step. The covariant
difference becomes y_{t+1} − e^{2iθ}Q y_t, and the result is A5-averaged through the selected dictionary, as in
Q86/Q91. On the clock Fourier mode y_t = e^{2πimt/24}f this term is ‖f − e^{iψ_m}Qf‖², with ψ_m = 2θ − 2πm/24.
That set of phases is gauge invariant: only the holonomy 48θ enters. So the history kernel of mode m is

  K(ψ) = H + r²·M̄(ψ),  M̄(ψ) = I + G₁ − cos ψ·O − i sin ψ·W,

where G₁ = Reynolds[QᵀQ], O = Reynolds[Q + Qᵀ] and W = Reynolds[Q − Qᵀ]. The literal one-tick substitution
y_{t+1} → Qy_t gives the same family at ψ = −2θ. Every result below depends only on cos ψ and sin²ψ, so it covers that
reading too.

## Part 1 (exact): where the overlap and the chronology current live
On all 8 orbit-1 classes:
- **W lives entirely in the Walsh-3 quartet block: E₃WE₃ = W, and W ≠ 0.** The A5-averaged antisymmetric part of the URT
  step, its chronology current, vanishes on every other A5 isotypic and Walsh block, including P5, dark, w₀ and w₆₃.
  (Q59's un-averaged Q − Qᵀ has rank 42; the twirl confines it to the 8-dimensional quartet.) This appears to be new.
- O and G₁ commute with E₂, E₃ and E₄.
  - O = 1/3 on Walsh 2 and −1/6 on Walsh 4.
  - G₁ = 2/3, 1/2 and 1/3 on Walsh 2, 3 and 4.
  - Abar₁ = I + G₁ − O (Q91 identity, rechecked).
- Write A = E₃OE₃, which is traceless. Then **A² = (9/400)E₃, W² = −(1/16)E₃ and AW + WA = 0.** So on the 2×2 quartet
  multiplicity space of Walsh 3, A and iW act as anticommuting Pauli matrices, with norms 3/20 and 1/4.

## Part 2 (exact): the spectrum of K(ψ) on the quartet isotypic V
Each value below has multiplicity 4, one A5 quartet. Because A and iW anticommute, X(ψ) = −cos ψ·A − i sin ψ·W
satisfies X² = (9cos²ψ + 25 sin²ψ)/400·E₃ = (9 + 16 sin²ψ)/400·E₃.

| branch | pole of K(ψ) | at ψ = 0 |
|---|---|---|
| P5 (Walsh 2) | 16 + r²(5 − cos ψ)/3 | 16 + 4r²/3 |
| P3, lower | 18 + r²[3/2 − √(9 + 16 sin²ψ)/20] | 18 + 27r²/20 |
| P3, upper | 18 + r²[3/2 + √(9 + 16 sin²ψ)/20] | 18 + 33r²/20 |
| dark (Walsh 4) | 16 + r²(8 + cos ψ)/6 | 16 + 3r²/2 |

The two extreme histories also become exact eigenvectors:
- **The parity history has mass exactly r² = (π/e)² at every ψ**: K(ψ)w₆₃ = r²w₆₃.
- The constant has K(ψ)w₀ = r²(2 − 2cos ψ)w₀.

So the reading breaks Q86's τ-symmetry (w₀ ↔ w₆₃) of the original action and gives w₆₃ a native mass in the clock's
own unit r².

Two features are new compared with K_c:
- The P3 splitting now depends on the clock phase through sin²ψ. That is the chronology current W entering.
- The P5−dark ordering flips at cos ψ = 2/3: dark − P5 = r²(cos ψ/2 − 1/3). In K_c the dark branch always sits c/6
  above P5.

## Part 3 (exact): the source weights are (4, 2, 2, 0) at every clock phase
Exactly, tr(G₃A) = 0 and tr(G₃W) = 0, with G₃ = U_hP₃U_hᵀ. The second holds because G₃ is symmetric and W antisymmetric.
The branch projectors are Π± = ½(E₃ ± X/λ). So the P3 source splits exactly 2 + 2 on the two Walsh-3 branches. Those
branches are complex for sin ψ ≠ 0.

The P5 source (trace 4) sits entirely in the rank-4 Walsh-2 branch, and nothing sits on dark. **The weights are
(4, 2, 2, 0) for every ψ, and for every r.** Like c in Q82, the clock phase moves only the poles.

## Part 4 (exact): when the reading lands in the K_c family
**Theorem.** K(ψ)|_V ∈ span_C{P_V, H, Abar₁}|_V if and only if ψ ≡ 0 (mod 2π). Then K(0) = H + r²·Abar₁, that is
**c = r² = (π/e)²**.

Proof:
1. Write K = S + iT, with S real symmetric and T = −r² sin ψ·W real antisymmetric.
2. A complex combination of real symmetric matrices has zero antisymmetric part. Since W|_V ≠ 0, this forces sin ψ = 0.
3. The real part is S = H + r²[(1 − cos ψ)(I + G₁) + cos ψ·Abar₁].
4. If cos ψ ≠ 1, then G₁|_V would have to lie in the span. Its Walsh-3 traceless part is 0, so its Abar₁ coefficient
   must vanish, because T_{Abar₁} = −A ≠ 0. But then its Walsh-2 and Walsh-4 values would have to agree: P_V and H take
   equal values there (1 and 16). G₁ takes 2/3 and 1/3, so this fails. Hence cos ψ = 1, and M̄(0) = I + G₁ − O = Abar₁. ∎

**Obstruction at the native holonomy.** ψ_m ≡ 0 for some m would require 48θ/2π = 48/φ² = 96 − 48φ to be an integer.
It is irrational, so **no native golden clock mode lands in the K_c family.** The closest modes have ψ at distance > 0.05
from 0 (float64). This matches the strictly positive minimum ℓ_m in Q96.

## Part 5 (float64 cross-checks)
- The reading's clock term, evaluated directly on the original Q with a deterministic 24×64 test configuration, equals
  Σ_m f_m* M(ψ_m) f_m to 1e−9 relative error.
- Direct diagonalisation of K(ψ_m) on D₀ at all 24 native modes reproduces the Part-2 poles to below 1e−9.
- At every mode the P3 weights are 2, 2 and the parity energy is r².
- Sample (m, ψ mod 2π, P5, P3−, P3+, dark):
  - m = 0: (4.7999, 18.1873, 19.6705, 20.3367, 17.8004);
  - m = 1: (4.5381, 18.3034, 19.6729, 20.3343, 17.7423).

These values are internal units only.

## What this establishes, and what it does not
- **Established, exact, conditional on the reading:**
  - the native history law K(ψ) on V and its four poles as functions of the clock phase;
  - the weights (4, 2, 2, 0) at every phase;
  - the parity mass r²;
  - K(ψ) is in the K_c family only at ψ = 0, where c = (π/e)²;
  - the golden holonomy excludes ψ = 0.
- **Established, exact, reading-free:** the A5-averaged chronology current W = Reynolds[Q − Qᵀ] lives only in the
  Walsh-3 quartet, and there A and iW anticommute.
- **Not established:**
  - that the reading is forced. The original action's clock term does not contain Q (Q86, Q96), and nothing here derives
    the coupling y_{t+1} ↔ Qy_t;
  - that c should equal (π/e)². That value holds only at a phase the native holonomy forbids. The historical c = 1 is not
    reproduced and is not a target (Con, 2026-11-14);
  - any selection among the 24 modes, or how to combine them (sum, trace or determinant);
  - any physical pole, residue or ARF.

Comparison with old candidates, only afterwards: at the forbidden ψ = 0 the poles are those of Q82 with c = (π/e)². At the
native modes the law is **not** of the H + c·Abar form at all. By the 2026-11-14 form-freedom rule, if this reading is
adopted, the ψ-family replaces K_c; it does not fail to reproduce it.

## Next
Q104 [derive]: the reading is the premise. Decide whether the joint 190/64/24 action admits a gauge-covariant coupling
that transports histories along clock steps, y_{t+1} − e^{2iθ}T y_t, with T a native history map: Q, the Q72 bridge, or
P_σ₁. The coupling must keep the original action's large-gauge (D²) covariance, its unique stationary vacuum (Q56) and
the 24-periodicity. Note that Q is not invertible and Q²⁴ = J/64, so a 24-periodic transported history must be handled
through the Fourier modes, not by iterating Q. If such a coupling is forced, derive it. If several are allowed, give the
exact non-uniqueness, and then compute the clock-mode-summed source trace of K(ψ_m) in closed form (Chebyshev, as in
Q96).

# URT / Newton's Cathedral: exact 24-fold monodromy and no-fit phase-selection tests

**10 November 2026. Original five-Platonic source; no fitting; no inserted historical four-ARF coefficients.** Four physical ARFs remain unproved. All new statements distinguish *mathematical source-information transport* from actual electromagnetic/matter observables.

## Theorem 1: exact 24-fold clock information holonomy

Let the primitive URT invariant-circle map generate uniform six-symbol binary histories on `h=0,...,63`. Partition the same phase circle into 24 equal arcs indexed by `j`. Let `C(a)_{j,h}` be the Lebesgue measure of the intersection of clock arc `[j/24+a,(j+1)/24+a)` with binary-history cylinder `[h/64,(h+1)/64)` (modulo one), and let `B(a)=sqrt(24*64) C(a)`.

Let `H` be the fixed, covariance-normalized, original five-solid hidden source (64×8), and `U(a)` the full-rank polar partial isometry of `S(a)=B(a)H`. With `R` the cyclic 24-row permutation, the interval definition gives **exactly**

`B(a+1/24)=R B(a)`, `U(a+1/24)=R U(a)`.

Consequently, each overlap link `polar(U(a)^T U(a+da))` repeats after `1/24` of a phase cycle. For any mesh with N=24m uniform increments, the canonical ordered Wilson product obeys exactly (to machine roundoff in its matrix implementation)

`W_full=(W_segment)^24`.

Direct full-loop vs 24th-power checks at `N=192,384,768` had residual about `1e-13`; the 24th-power algorithm extends precision cheaply to `N=24,576`. The four positive rotation eigenphases at the finest mesh were approximately `(1.59378543, 1.77087524, 1.92685335, 2.20164549)` radians, with `det(W)` within `4e-13` of 1. **These are four SO(8) holonomy angles, not the four historical physical ARFs.** Source: `URT_BERRY_24FOLD_MONODROMY_2026_11_10.py`.

## Theorem 2: golden readout origin cannot be selected by full-loop Berry eigenangles

The exact source-induced one-form `A(a)=U(a)^T U'(a)` is `1/24`-periodic. For a smooth, periodic matrix connection, full-period holonomies based at different `a0` are related by similarity (conjugacy) using the parallel-transport operator between those basepoints. Hence all holonomy eigenangles are **independent of the initial phase a0**. This is a gauge-basepoint theorem, not an approximate fit. Independently sampled bases `0`, `1/7`, `phi^-2`, `sqrt(2)-1`, and `0.495` converged to the same four eigenangles: largest discrepancy decreased from `0.01848` at `m=64` to `0.0000606` at `m=1024`. The finite-mesh differences arise from passing across piecewise-differentiable bin-alignment kinks. Thus a *global loop eigenangle* is not by itself a selector of the irrational golden offset; golden-phase specificity must enter through a genuinely anchored geometry/current coupling. Source: `URT_BERRY_GOLDEN_BASEPOINT_CONJUGACY_2026_11_10.py`.

## Theorem 3: exact closed-form 24×64 coupling norm at every phase

Since `lcm(24,64)=192`, in each alignment interval `a∈(k/192,(k+1)/192)` let `z={192a}`. Clock arcs contain length eight and history arcs length three when measured in `1/192` units. For the three starting residues modulo three, each occurring eight times among the 24 clock bins, the nonzero overlap lengths are exactly:

- residue 0: `(3-z), 3, (2+z)`;
- residue 1: `(2-z), 3, 3, z`;
- residue 2: `(1-z), 3, 3, (1+z)`.

Summing their squares and multiplying by `24*64/192²` yields **symbolically**

`Tr[B(a)^T B(a)] = 64/3 - 2z + 2z²`,

with sharp bounds `125/6 ≤ Tr[B^T B] ≤ 64/3`. Extrema occur at `z=1/2` (minimum) and `z=0` (maximum). The irrational golden offset `phi^-2` has irrational `z`, is neither extremum, and cannot be selected by *bare overlap purity* alone. The identity was also checked numerically at seven unrelated offsets to `<2e-14`. The exact proof is `URT_24x64_OVERLAP_TRACE_EXACT_CERTIFICATE_2026_11_10.py`.

## Test 4: exhaustive original-source fidelity over the entire phase circle

For the **unchanged original full-five-solid normalized source** `H`, define `F(a)=||B(a)H||_F²`. Because `B(a)` is affine between alignments and clock-row permutations make `F` 1/24 periodic, the entire phase domain is determined by precisely **eight convex quadratic pieces**. Exhaustive calculation of their derivatives and interior vertices shows:

- Global maximum `F_max=2.403273501426586` at `a=0 (mod 1/24)`.
- Global minimum `F_min=2.120484360243258` at one representative `a=0.019616793867655836 (mod 1/24)`.
- Golden phase `a=phi^-2≈0.381966011250105`: `F=2.293391794670449`, nonzero derivative `F'(a)≈-10.909896918662279`.

Thus golden is **not even stationary** for the source's natural raw-fidelity objective. This is an exhaustive piecewise-numeric check using the existing original source, not a proof that every possible physical action fails. Reproduce with `URT_SOURCE_FIDELITY_GOLDEN_PHASE_SELECTION_2026_11_10.py`.

## Theorem 5: original positive-history Gaussian determinant does not fix golden phase

For native 24-clock, charge-two phase theta, `r=pi/e` and original nonzero 64-history eigenenergies `E=10` (12-fold), `16` (30-fold), `18` (20-fold), the positive-mode log determinant satisfies the exact Chebyshev product identity

`logdet(theta) = const + sum_E d_E log[T_24(1+E/(2r²)) - cos(48 theta)]`.

Its derivative is `48 sin(48theta) sum_E d_E/[T_24(1+E/(2r²)) - cos(48theta)]`. Each denominator and multiplicity is positive, while at the golden phase `theta=2*pi/phi²` the factor `sin(48theta)` **cannot vanish** because `48theta/pi=96/phi²` is irrational. Therefore the original quotient Gaussian determinant has a strictly nonzero slope at golden. The independent 24-mode spectral determinant agrees at 110-digit precision:

`d logdet/d theta | golden ≈ +4.6183208229516210e-21`,

`logdet(golden)-logdet(0)≈+1.6790803402738811e-22`.

The smallness is a 24-fold winding suppression, not a mathematical zero. The Gaussian sector alone prefers commensurate rather than golden holonomy. This **does not exclude** selecting golden through the combined full nonlinear geometry/gauge/matter action. Reproduce with `URT_NATIVE_GOLDEN_HOLONOMY_STATIONARITY_2026_11_10.py`.

## What this advances and what remains

All five Platonic solids, the original 64 signed histories, hidden `4_3+4_5`, and the genuine 24-clock overlap are retained. The above theorems give a drastically faster exact holonomy calculation and three stringent, no-fit phase-selection tests. They delimit the physical challenge: a golden-phase-dependent, gauge-covariant **charged source or geometric action** must select the golden phase, and its normalized gauge/fermion poles must produce the actual four ARFs. The bare URT shift, unanchored source-information Wilson loop, overlap norm, original-source fidelity, and charged Gaussian determinant alone do not. Source Berry angles and BKM entropy stiffness remain conditional mathematical information geometry, not physical masses or fine-structure coupling.

Third-party Yang–Mills results and James's work are not included or modified. No pre-existing repository file is overwritten.

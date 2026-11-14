# Q93 — Exact primitive 64-history / 24-clock trace law (2026-11-14)

**Result status: THEOREM (native finite history algebra) + CONDITIONAL (specified Gaussian clock action); local certificate executed exit 0, CI pending. Physical identification OPEN.** No prior ARF equation, chosen coefficient, empirical target or fitted input enters. This does not close Gate A, B, C, D, E or F.

## Prior-work ledger (no rediscovery)

- `cathedral_engine/histories.py`: original `Q2[h,2h mod64] = Q2[h,2h+1 mod64] = 1`, `Q=Q2/2` and `Q^6=P=J64/64` (native exact).
- `research_archive/2026-11-12_q59_time_generator/` (Q59): primitive Q selects no conservative Hamiltonian/time generator; clock transfer interpretations are inequivalent.
- `research_archive/2026-11-14_q86_parity_history_energy/` and `research_archive/2026-11-14_q91_bridge_loss_sequence/`: historical `H+c Abar` lacks a derived c; no loss sequence in the tested family fixes it.
- `docs/ARF_FIRST_PRINCIPLES_CORRECTION_2026-11-14.md`: existing four ARFs and their residues are not derivation targets.

**New calculation:** exact Frobenius orthogonality of all centered powers of *native* Q; from it an exact inverse-quadratic trace and closed 24-mode trace for a declared Markov-residual action. It does not claim the latter action is uniquely forced by URT.

## Theorem 1: centered native Q powers are Frobenius orthogonal

For b-bit history words (n=2^b), define the native two-successor de Bruijn transition
```
Q_b[h,2h mod n] = Q_b[h,2h+1 mod n] = 1/2.
P = J_n/n; R_j = Q_b^j-P, j=0,...,b-1 (Q_b^0=I).
```
Then `Q_b^b=P`, and exactly
```
Tr(R_i^T R_j) = delta_ij * (2^(b-i)-1),  0<=i,j<b.
```
In particular b=6 gives `diag(63,31,15,7,3,1)` and total **120**.

**Proof.** In the uniform Walsh character basis on bit words, applying Q once either annihilates a character containing the freshly appended bit or shifts its nonempty bit support one place. A surviving nonconstant Walsh character shifted i steps is orthogonal to the same character shifted j!=i steps. Thus the centered powers have zero cross-Frobenius products. After i steps exactly `2^(b-i)-1` nonconstant Walsh characters survive, and the image of each surviving normalized character has norm 1, establishing each diagonal. Independently, `Q^i[h,k]` is `2^-i` on the `2^i` possible length-i successors of h, zero otherwise, while `Q^b=P`; the exact script computes every support overlap without floating-point arithmetic. Summing the diagonal gives `C_b = 2^(b+1)-b-2`.

## Theorem 2: exact frequency response

For `z = exp(i omega)`, `z != 1`, set `A(z)=zI-Q_b` and `K(z)=A(z)^* A(z)`. Since `Q_b^b=P`, `P R_j=R_j P=0`, the inverse is the *finite* expression
```
A(z)^-1 = P/(z-1) + sum_{j=0}^{b-1} z^(-j-1) R_j.
```
By Theorem 1,
```
Tr K(z)^-1 = ||A(z)^-1||_F^2
            = C_b + 1/|z-1|^2
            = 2^(b+1)-b-2 + 1/(2-2cos omega).
```
**For b=6:** `120 + (2-2cos omega)^-1`. Also `det K(z)=|z-1|^2` because the eigenvalues of Q are 1 once and 0 with multiplicity 63. The constant-pole term is the conserved history mode; all 63 nonconstant modes contribute the flat **120** trace, despite nonnormality of Q.

## Theorem 3: conditional 24-clock Gaussian law

**Declared extra assumption (not proved from the primitive operators):** complex history amplitude `y_t in C^64` has residual action
```
S[y] = r^2/2 * sum_{t=0}^{23} || y_{t+1} - Q y_t ||^2,
r = pi/e,   y_{t+24} = exp(i*24*theta) y_t.
```
Its Fourier modes have `z_k=exp(i(theta+2pi*k/24))`. Away from zero holonomy,
```
Tr (H_clock^-1)
 = (e/pi)^2 sum_{k=0}^{23} [120 + 1/(4sin^2((theta+2pi*k/24)/2))]
 = (e/pi)^2 [2880 + 144 csc^2(12theta)].
```
The trigonometric identity is `sum_k csc^2(x+k*pi/24) = 24^2 csc^2(24x)`, obtained by differentiating the cotangent multiplication formula. For an *illustrative* original golden offset `theta = q*2pi/phi^2`, `phi=(1+sqrt5)/2`, charges q=1,2,4 give internal trace values `2584.978530841250, 2299.371043868031, 2300.999683886431` respectively. These are **not** predictions of alpha, masses, or actual measured clock rates. Neither the Gaussian action nor its physical scale is uniquely selected; the chosen charge interpretation is conditional.

At zero holonomy the constant mode is null; the full 24-clock pseudoinverse trace is `(e/pi)^2 [2880 + (24^2-1)/12]`, not the divergent twisted inverse.

## Evidence / resume

Executed locally in an isolated container:
```
python research_archive/2026-11-14_q93_primitive_clock_response/Q93_NATIVE_MARKOV_CLOCK_TRACE.py
```
Exact Fraction overlap assertions for each b=1,...,7 passed, including all 36 six-bit Gram entries and Q^b=P; the direct 24-frequency sum passed against the closed formula for q=1,2,4. Independent NumPy dense inversion of the actual 64x64 Q at k=0,1,7,13,23 gave trace differences below 1e-12. **Local PASS; GitHub CI verdict pending.**

**Not established:** choice of kinetic action, charged source map, Ward-completed response, absolute physical normalisation, physical ARF. This exact history-only result does not incorporate all 190 cochains as an interacting action, nor imply that the full Cathedral reduces to 64 histories.

**RESUME HERE:** Pull back this exact finite resolvent through the original all-five `U_h` and the original source `Eglobal(e0+e3)` using `cathedral_engine` (avoid a synthetic source). Compute the 8x8 projected frequency response and test its clock covariance with the actual charge-two Wilson bridge; evaluate both Ward orders before calling any pole a physical law. Do not impose `(4,2,2,0)` or any historical ARF.

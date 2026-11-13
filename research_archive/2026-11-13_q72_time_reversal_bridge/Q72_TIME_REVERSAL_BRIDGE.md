# Q72: time reversal and the invariant measure single out the bridge (ACTIVE PROBLEM A, attempt A2b)

Date: 2026-11-13 (Claude, scheduled session). Gate A.
Status: **THEOREM (exact finite statements; Part 4 in float64 with a wide margin) under two stated requirements.
CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.** Gate A stays open.
Certificate: `Q72_TIME_REVERSAL_BRIDGE_CERTIFICATE.py` (check `research.q72_time_reversal_bridge`). Executed in
Claude's cloud sandbox: exit 0 in 16 s.

## Question (A2b)

Q64 scores a reversible history σ against the one-step admissibility-conditioned chronology
p(h→k) = S_D[h,k]/(S_D[h,2h]+S_D[h,2h+1]). Q65 showed that the n-step (n ≥ 3) and Doob conditionings pick other
dictionary orbits, while the uniform-marginal bridge of M_D picks Q64's orbit 1 and σ₁. A2b asks for an original
operator or property that decides which conditioning is the right one.

Reading adopted (no one to ask): the candidates are the Gibbs conditionings of K_D = S_D/120 on URT admissibility,
F_D = {P = diag(r) M_D diag(c) row-stochastic, r, c > 0}. This family contains the one-step chain (c = 1), every
n-step chain (c = u_{n−1} = M_D^{n−1}1), the Doob chain (c = Perron vector) and the bridge. The decision uses only
original data: the exact history symmetry R of Q24 and the invariant measure shared by Q2, K_D and every lift.

## Results

1. **R is exact time reversal of the chronology (exact, all 768 classes).** S_{R(D)} = R_g S_Dᵀ R_g, where R_g is
   bit reversal on the 64 histories and R(D) the reversed dictionary. R_g also reverses the URT graph
   (R Q R = Qᵀ). K_D is doubly stochastic, so the uniform measure is its invariant measure.
2. **Q64's functional breaks R (exact).** L_row(R(D), R σ⁻¹ R) = L_col(D, σ) = raw(D, σ)/∏_k colsum_k(M_D): the
   time reverse of the forward (future-admissibility) conditioning is the backward (past-admissibility) one. The
   two differ as functions on 640 of the 768 classes, so A1 as stated is not R-invariant. Its maximiser set
   is R-closed: both peak on orbit 1, where they agree. This explains the R-covariance check in Q64.
3. **Uniform preservation forces the bridge (exact).** The family splits into 32 disjoint positive 2×2 blocks
   [[a,b],[c,d]] (rows x, x+32; columns 2x, 2x+1). If a member also preserves the uniform measure, each block is
   doubly stochastic. It then has the form [[t,1−t],[1−t,t]], and its cross ratio, which scaling leaves unchanged,
   gives t²/(1−t)² = ad/bc. So t is unique: **the bridge is the only uniform-preserving member of F_D.** It is
   R-covariant, bridge(R(D)) = R_g bridge(D)ᵀ R_g, checked edge by edge on all 768 classes. The one-step and
   n-step chains, n = 1..30, preserve the uniform measure on **no** class (exact column sums).
4. **The Doob chain is excluded too (float64).** Its stationary measure is u_L∘u_R, and on every class
   max_h |64π_h − 1| ≥ 0.7024. A uniform measure would give 0, and the Perron residuals are below 10⁻⁹. Doob is
   R-covariant, so time reversal alone does not exclude it; the invariant measure does. (An exact supporting
   fact: if Doob preserved the uniform measure on every class, it would equal the bridge there by Result 3,
   but Q65 certified that their maximisers differ, orbit X against orbit 1.)
5. **R-symmetrised A1 (exact).** L_row·L_col, the R-invariant symmetrisation of the Q64 functional, is uniquely
   maximised on orbit 1 with σ₁, with no tied bit and margin ×20.65.

## What this establishes

Suppose the chronology that scores a reversible history must (i) be a Gibbs conditioning of the native Q3 chronology
on URT admissibility, (ii) respect the exact native time reversal R, and (iii) preserve the invariant measure that
Q2/2, K_D and every reversible lift share, the uniform measure on the 64 histories. Then it is **uniquely the
uniform-marginal bridge**, and (iii) alone already forces this within (i). Requirement (ii) independently excludes
Q64's one-step chain as stated. Q65 Result 4 then gives the selection: **orbit 1 (e.g. D = (0,2,4,6,10,9)) with
lift σ₁, unique, margin > 3.12.** This is the same answer as A1, now attached to a conditioning that is forced
under (i)–(iii) rather than chosen.

A4's first robustness test follows for the bridge. For a time-homogeneous doubly stochastic kernel B and a bijection
σ, the n-step path likelihood over all 64 starting histories is ∏_{t<n} ∏_h B[σᵗh, σᵗ⁺¹h] = L_B(σ)ⁿ, so the
maximiser does not depend on the horizon. This is elementary and not separately certified.

## Scope and limits

- (i) and (iii) are requirements, not consequences of the recurrence: (iii) asks the scoring kernel to share the
  invariant measure of every original operator, and (i) restricts to endpoint reweightings of K_D. A conditioning
  outside F_D (for example one built from U_h or the 24-clock) is not covered.
- Part 4 is floating-point, with a margin about nine orders of magnitude above the residuals. It is not an
  exact certificate.
- Nothing physical is identified, and A3 (chronology coefficient, weights (4,2,2,0)) is untouched.

## Next

A4, second half: test whether the selection survives when the bridge is built from the joint history ⊗ 24-clock
chronology or from a U_h-weighted Q3 twirl, so that the family is no longer restricted to F_D. Then A3.

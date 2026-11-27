import New.TwistedHecke.ElementaryDivisors
import Mathlib.Tactic

/-!
# RUN51 — remove the excess multinomial valuation budget at the actual projector
27 November 2026. SOURCE-MATCHED human mathematical strengthening; Lean
probes and arithmetic bridge PREPARED, not compiled. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, unchanged at latest
query; Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005 retained; upstream latest query
7c4ccbd64d02774b0a5b40a5f923f5b7a18e8abc, no revision migration.
Mission blob a69122b6ad568910a45d2bc13961ab9da4855143 including mandatory
engine; AGENTS, protocol, handoff, expansion, continuity preflight read.
Latest peer 0aa83347, 42bc7348, 38cee09b, c3a3b7e4, 85d03bf7 inspected.
Own RUN35 e82befc52 and theta RUN55 1cc71623 already prove the original
class mean/projector and telescoping. RUN50 7e6fe010 reduces pairing to
one masked determinant. Do not redo them. This run changes the scale
itself, not the notation or the telescoping proof.

Exact sources relative to grh-compact/src:
New/TwistedHecke/ClassMeans.lean b0cc77bf52f463d3c62d755b43030f964d32f8cf:
exists_invariant_diagonal_form, exists_mean.
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307:
of_pairing, exists_depth_factorization, exists_projector, hasType_twisted_hecke.
New/TwistedHecke/FrobeniusFactors.lean c6cb25c36279a298cf4de03a6b788786354e00f3:
pow_dvd_coeff_conj_frobOperator, degree_le_of_coeff_frobOperator.
New/TwistedHecke/TwistingData.lean fd376cc6956e23a5cc117093e5f4083238cbc144.
New/TwistedHecke/Counting.lean 42f70c497698b45ac20533664cb50929222151b9:
HeckeSizes and both dimension bounds.

## 1. Single aggregate carry bound, not a separate bound per binomial

In the native valuation domain O of characteristic zero, p is prime
and a nonunit. Let s>=1 be the number of variables, f>=1, alpha a
nonnegative integer multiindex of degree d<p^f, and M=d!/prod alpha_i!.
Legendre gives the EXACT cancellation
    v_p(M) = sum_{j=1}^{f-1} ( floor(d/p^j) - sum_i floor(alpha_i/p^j) )
           = sum_{j=1}^{f-1} floor( sum_i (alpha_i mod p^j)/p^j )
           <= (s-1)(f-1).
The equality is Euclidean division of every coordinate BEFORE summing.
Each remainder is in [0,p^j), hence the floor lies between 0 and s-1.
There are no contributions at j>=f because d<p^f. The uniform
exponent e_s=(s-1)(f-1) replaces the source's s*f. It works also when
s=1 or f=1. For a known cutoff d<=D<p^f one may further take
    e_s(D) = sum_{j=1}^{f-1} min(s-1, floor(D/p^j)).
This also works for D=0. The actual caller has k>=2 (0<r,2r<=k)
and f=o0*N>=1 (five_le_P and NeZero N). No degenerate division.

Any integer prime to p is a unit in O by Bezout and p in the
maximal ideal. Therefore M divides p^e_s in O even when O is
nondiscrete or p is not a uniformizer. Set q_alpha=p^e_s/M in
Frac(O) in low degree, and zero in high degree; q_alpha belongs
to O. For d<=D use e_s(D) and zero outside that cutoff instead.
The SAME contingency-table proof as RUN35 gives
    c_(alpha,beta)(A) q_alpha = q_beta c_(beta,alpha)(A^T)
because both weighted coefficients equal the same common scale
times alpha! beta! / (d! prod t_ij!) for each transposed table.
Different degrees give zero on both sides. Thus the full native
transpose identity is unchanged, not just for a generic A.
No inversion of a nonunit inside O.

## 2. Propagate through the actual restricted trace and two projector fields

Keep exact original cutoff A=N*n*k*(ell+2), D=A*P^ell, N=2ell,
f=o0*N. Source h guarantees A+n+k<P^ell, hence D+k<P^N=p^f,
and n<p^f. Keep all density, trace restriction, generator span and
Levi conjugation premises and proofs from RUN35/RUN55.

For the class mean use q on s=k^2 variables with exponent
E_M=e_(k^2), or e_(k^2)(D). Reconstruct K(F)_alpha=q_alpha
coeff_alpha(F) and the very same restricted trace. Do NOT divide
an arbitrary preexisting class mean by p. The trace argument
for selected row weights gives exactly p^E_M eval_I(F) on each
homogeneous monomial of degree<=D: the multinomial coefficient
cancels q_alpha. The invariance, off-weight zero and conjugate
span proofs use linearity and transpose compatibility, not the
magnitude of the scale. The high-degree zero fields are retained.
Thus both means exist with this smaller COMMON scale. Their
difference still kills all high row weights.

For the letter representation, use s=k and exponent E_B=e_k
(or e_k(n)). b_beta=product_s q_(beta_s); take b'_beta as the
product of the integer multinomial coefficients. Then
    B B' = p^(N E_B) I,
    B rho(g^T)=rho(g)^T B
exactly over O, including odd letters by the original
inverse-transpose definition. In particular no inverse of B
is used. Same Z*=Z(kappa_1-kappa_0) B', with same Frobenius
polynomial and actual letter maps, has image in
excessCond (w^c) theta. RUN35's lower pairing proof uses exactly
one conjugate mean per telescoping term and the two strict
weight gaps; it is unaffected by either scale change.
At identity Z(kappa_1)=p^(N E_M) I. Consequently the actual
approximate-projector congruence strengthens to
    w^c | y^T B Z* F - p^E_new y^T F,
    E_new=N*(E_B+E_M)
          = N*(k+k^2-2)*(f-1)    (uniform choice).
Compare E_old=N*(k+k^2)*f:
    E_old-E_new=N*(k+k^2+2*f-2)>0.
The two other projector fields are unchanged, with all
original quantifiers. The refined cutoff-dependent choice
can only reduce E_new further. This is a human replacement
of the actual exists_projector, not a numerical approximation.

## 3. Actual caller: preserve old size guards, lower the scalar

At hasType_twisted_hecke use c'=2*E_new+2, so the original
size guard 6*(2*E_old+2)+2<=y implies 6*c'+2<=y.
Keep the original HeckeSizes hypothesis: Counting.lean's two
native dimension lemmas accept it unchanged. Both depth
factorizations work at arbitrary natural c, now c'; their
determinant bounds do not depend on c. The lower pairing
threshold y-(4c'+2)>=2c' follows from the inherited guard.
The root/depth and all-translates hypotheses are unchanged.

Use the SAME block pairing formulas with the new B and Z*.
The scalar in of_pairing is a=w^(2E_new)=p^E_new and the
error is divisible by w^c', thus by aw=w^(c'-1). Conversely,
from Qu-Mv=aw F and membership of the left side in (w^c')
for the relevant bad translated coordinates, cancel the
nonzero w^(c'-1) to get divisibility by w. This is exactly
the native residue condition, not division in the residue
field. RUN50's one-determinant argument applies at this
interface without modifying its proof. It gives a witness
with n_pair+l<=dim W0 and determinant factor a^n_pair z^l.
The common scalar contribution to the index budget is
E_new*n_pair instead of E_old*n_pair (in p-exponents).
The particular witness l, bases and matrices may change;
no comparison of individual l values claimed. Both original
depth determinants compose as before. Final scalar estimate
can use c'/2<=y, retaining the original coarse HasType
conclusion and original count premises. This does NOT yet
prove a globally weaker HeckeSizes or sharper star_inequality:
the remaining marked-prime budget and both dimension proofs
must be re-audited for such a claim. No changed output of
the final RH theorem is claimed.

Original local graph: binomial valuations -> diagonal form ->
class means / letter diagonal -> projector -> pairing and
depth determinants -> hasType_twisted_hecke -> marked index -> A.
Candidate human graph: aggregate Euclidean carries -> same
diagonal and trace interfaces at lower scales -> same two
projector fields -> same pairing consumer at c' -> unchanged
HasType statement. Preserve original graphs, all source proofs,
unresolved edges, actual axiom evidence. No native node
retirement. Context key includes p,O,W, f,k,N,n,D, all
iota maps, r,ell,theta,c', class mean P and actual caller;
never reuse a mean across changed cutoff or support.

## 4. Actual execution / trust boundary

Local PATH: lean/lake not found; no new native rh_scan,
rh_prune, rh_reduce, rh_auto or rh_auto_frontier. The old-pin
engine is not assumed compatible with the compact pin.
Exact integer diagnostic executed locally (Python stdlib):
    from math import factorial
    from itertools import product
    ct=0
    for p in (2,3,5,7):
      for f in range(1,4):
        if p**f>40: continue
        for s in range(1,5):
          for a in product(range(p**f),repeat=s):
            n=sum(a)
            if n>=p**f: continue
            m=factorial(n)
            for j in a: m//=factorial(j)
            v=0
            while m%p==0: m//=p; v+=1
            assert v<=(s-1)*(f-1)
            ct+=1
    print(ct)
56993 cases, all assertions completed, exit 0. This only
diagnoses the exact multinomial bound, not the native
operator or the infinite argument. Proof is section 1.
No URT or synthetic operator comparison.

Actual CI 45803534769 jobs and persisted outputs retrieved:
status blob a56e2d3afb99ed8275e81fd63c8494306e57c43f,
targeted_results blob 088cd2ec0e935ee1a282f10096949bcf671cc804:
six named B/C checks standard axioms only; A build timeout
124 after 2700.11s, all_requested_checks_ok=false,
full_RH_replay=false. Wrapper job success is not native PASS.
New Lean probes below prepared, not compiled. No new axiom
ledger claimed.

RESUME HERE: independently audit lower q scale in ClassMeans
restricted trace and verify exact substitution of c' and
scalar into hasType_twisted_hecke. Replay in existing A-only
compact runner once available; inspect original and reduced
actual proof terms and #print axioms before removing edges.
If seeking weaker HeckeSizes, inspect both Counting proofs
for whether the old projector size guard is actually used
(its proof field may be redundant there). Preserve all
other quantitative and root conditions. Do not redo
RUN35 telescoping or RUN50 determinant. RH remains OPEN.
HANDOFF TO integration/editor, prime, theta, formal audit.
-/

namespace KernelRun51

-- Algebraic scale gap with s=k-1, t=k^2-1, f=original f-1.
theorem scale_gap (s t f N : ℕ) :
    ((s+1)+(t+1))*(f+1)*N =
      (s+t)*f*N + (s+t+2*f+2)*N := by ring

-- At fixed c, the improved scalar also meets the weaker congruence.
theorem power_guard {R : Type*} [CommRing R]
    (w : R) (e c : ℕ) (h : 2*e+2 ≤ c) :
    w^(2*e+1) ∣ w^c := by
  exact pow_dvd_pow w (by omega)

theorem two_remainder_guard (r s q : ℕ)
    (hr : r < q) (hs : s < q) : r+s < q+q := by omega

theorem lower_threshold (c y : ℝ) (h : 6*c+2 ≤ y) :
    2*c ≤ y-(4*c+2) := by linarith

#print axioms scale_gap
#print axioms power_guard
#print axioms two_remainder_guard
#print axioms lower_threshold
end KernelRun51

#check ClassMean.exists_invariant_diagonal_form
#check ClassMean.exists_mean
#check TwistingData.exists_projector
#check TwistingData.of_pairing
#check TwistingData.hasType_twisted_hecke
#check TwistingData.index_mul_finrank_excessCond_le
#check TwistingData.sum_finrank_deepForms_le
#print axioms ClassMean.exists_invariant_diagonal_form
#print axioms ClassMean.exists_mean
#print axioms TwistingData.exists_projector
#print axioms TwistingData.hasType_twisted_hecke

import New.TwistedHecke.Counting

/-!
# RUN57 — exact cyclic flag-volume factor and aggregate deep-form budget
26 November 2026. Human source-matched proof, native scalar probes PREPARED.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; manuscript
d76b408556ea55ffbd893072a4beac498b8adb2c.
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES.
Peer c22bb6a0 already supplies pairing/depth factorization, 575d0d31
already supplies marked transfer; do not duplicate. Latest peer heads
a3276066, 1a365375, a6e9cc7f, b5cd3751, 837dd3d8, 7ce0b84e,
650d9426, c7a92f2d, b0ec37d0 read. This work discharges the volume
part left open by c22bb6a0, and reconstructs its actual two dimension
budgets conditional on separately named finite-field suppliers.

Source ledger, relative to grh-compact/src:
New/TwistedHecke/InterlacingCone.lean 23d3fd2c39ef5ee3c3ce7e908436b86cff7e2676
  lines 14–23 permStep/slab/pieriCone, 27–36 det_interlacing_indicator,
  47–106 volume_inter_slab_eq_signed_sum, 111–138 prod_mul_volume_inter_slab.
New/TwistedHecke/Counting.lean 42f70c497698b45ac20533664cb50929222151b9
  29–38 index_borel_le, 49–115 finrank_excessCond_le_volume,
  120–127 excessWeight_dotProduct_permStep, 131–145 shift vector,
  149–159 slab bound, 163–166 HeckeSizes, 173–203 index_mul_finrank_excessCond_le,
  210–233 sum_finrank_deepForms_le.
New/TwistedHecke/TwistingData.lean fd376cc6956e23a5cc117093e5f4083238cbc144
  25–34 data, 70–96 deep/excess definitions.
New/TwistedHecke/DeepFormCost.lean f6c6a6f69b83d7b59e4b2de375e9407ca92f80d8
  13–16 sum_deepIndicator, 21–92 exists_le_weight_of_mem_deepForms.
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307
  217–259 hasType_twisted_hecke (both dimension budgets used together).
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48
  146–239 Columns.hasType_markOperator.
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
  233–240 hasType_prod_markOperator_pow, final index-divisibility consumer.

## 1. Interlacing determinant by nested suffixes, then exact cyclic Jacobian
For antitone x,y of length k, row i of the matrix [y_j<x_i] is
a suffix of ones beginning at t_i=#{j:y_j>=x_i}. The t_i are
nondecreasing. A nonzero determinant requires k distinct t_i
in {0,...,k-1} (t_i=k gives zero row); thus t_i=i. Conversely
this is a unit upper triangular matrix. This proves exactly
det_interlacing_indicator including equal entries and k=0.
For N>=1, P>1, q=P^N, write B_sigma=permStep with a permutation
sigma_j at each cyclic letter and arbitrary signs v_j. The absolute
Jacobian equals det(q I-A_tau), where A_tau is the permutation
operator of the cyclic product (inverse/conjugate conventions
do not change the cycle lengths). To see it, discard row signs
and cyclically reorder equations to P nu_(j+1)-A_j nu_j.
Eliminate N-1 blocks using pivots P I_k. The final Schur block
is P I_k-P^{-(N-1)}A_tau. Its determinant times P^{k(N-1)}
gives the asserted absolute Jacobian. For N=1 this is immediate.
Each cycle of length l contributes q^l-1>0, so the map is invertible
without any sign assumption beyond P>1.

Fix any native slab Sigma (D arbitrary real per letter), and Omega
with B_id nu in Omega iff nu in pieriCone. Ignore finitely many
hyperplanes beta_coordinate=0, and ties of entries of nu, which
have Lebesgue measure zero. At each nu having the fixed per-letter
degree slabs, sum over the k! sorting permutations at each letter:
the indicator of B_id applied to relabelled nu in Omega with beta>0
is 0 or 1. Indeed positivity plus the interlacing inequalities forces
each relabelled column to be decreasing, hence the relabelling is
uniquely its sorting permutation. The signed sum over all edge
permutations of 1_{B_sigma nu>0} equals a product of k-by-k
indicator determinants (expand each determinant). Relabel the
rows and columns by their sorting permutations; their signs cancel
around the cycle. At each edge the determinant is exactly the
indicator of interlacing by the suffix argument, with transpose
when the sign reverses. Thus the two sums agree pointwise off the
null walls. The degree slab condition is unchanged by independent
permutations because the column sums of B_sigma nu do not depend
on sigma. All sets have finite measure by boundedness of Sigma
and invertible B_sigma. Integrate and change variables. Put
Delta_tau=prod_{cycles c of tau}(1-q^{-len(c)}).
Each sorting tuple has absolute Jacobian q^k Delta_id.
Each cyclic product tau occurs (k!)^{N-1} times among edge tuples.
Consequently
  vol(Omega intersect Sigma)=Delta_id/k! *
       sum_tau sign(tau)/Delta_tau * vol(Sigma).
This is the source's signed-sum identity, with no divisions by slab
volume (covers zero-volume slabs as well).

## 2. Evaluate the signed sum by one formal recurrence, not a second volume
Let t=1/q and A_k=(1/k!) sum_{tau in S_k} sign(tau)/Delta_tau,
A_0=1. A permutation with c_l cycles of length l has multiplicity
k!/prod_l(l^{c_l} c_l!), sign prod_l(-1)^{(l-1)c_l}.
Thus in the formal power series ring R[[z]],
  F(z)=sum A_k z^k
      =exp(sum_{l>=1} (-1)^{l-1} z^l/(l(1-t^l))).
Subtract the logarithm at tz before exponentiation: every
1-t^l cancels, leaving log(1+z). Hence
  F(z)=(1+z)F(tz),
  (1-t^k) A_k=t^{k-1} A_{k-1}, k>=1.
No analytic convergence or infinite product interchange is needed.
Induction yields A_k=t^{k(k-1)/2}/prod_{l=1}^k(1-t^l).
Since Delta_id=(1-t)^k, the exact decisive volume ratio is
  [prod_{l=1}^k (q^l-1)/(q-1)] vol(Omega intersect Sigma)
    = vol(Sigma).
This independently replaces the source's one-letter normalization
via a second geometric volume (lines 118–138) by elementary cycle
enumeration. Includes k=0, N=1, arbitrary signs and any real D.
No unconditional prime estimate is deduced.

## 3. Exact excess telescoping, explicit feasible shift, native flag budget
For actual TwistingData (N even, P>=5), for adjacent b,b' define
d_s=nu(b,s)-nu(b',s), and beta=B_id nu. At either parity,
beta(rootVar b b' s)-beta(rootVar b' b s)=d_s-P d_(s+1).
The excess weight has numerator P^{(s-i) mod N} multiplying this
difference plus (q-1) beta(rootVar b b' i). The cyclic weighted sum
telescopes to (1-q)d_i. Hence
  L_i(beta)=(1-1/q)(beta(rootVar b b' i)-d_i).
This is exactly excessWeight_dotProduct_permStep and proves that
the zero excess cone pulls back to pieriCone.

For block cut r>=1 let u_b=2P^{2(r-1-b)} for b<r, zero otherwise,
and nu(b,s)=u_b on even letters, P u_b on odd letters. Then the
shift sigma=B_id nu has even entries (P^2-1)u_b and odd entries
zero. In an even letter L_i=(1-1/q)(P^2 u_(b+1)-u_b);
in an odd letter it is -(1-1/q)P(u_b-u_(b+1)). Both are <=0,
and at b+1=r they are <=-1 since q>=5. All entries lie between
0 and 2P^{2r}<=P^{3r}. This proves the native feasible shift
exists_mem_excessCone_mem_Icc; parity of the initial letter is
immaterial. No assumption that other excess inequalities are absent.

Let h=y be HeckeSizes threshold, and use the actual native
finrank_excessCond_le_volume (lines 49–115), with threshold
h+N(k+1), the Levi flag multiplier, and slab D=n+k+1.
Take the slightly shorter shift tau=(h+N(k+1))*sigma. Every point
in that excess region plus tau lies in the zero cone; the new slab
upper endpoint at letter s is D_s=n+k+1+sum_b tau(b,s).
The HeckeSizes size condition gives D_s <= n+n/h, since
(h+N(k+1))*k*P^{3r}+k+2 <= n/h. This uses precisely the native
threshold (no need for extra N in the shift).
The parahoric index times the Levi flag multiplier is at most the
full flag number, by subgroup inclusion/index multiplication.
Thus the result of section 2 cancels the whole flag number
before the volume bound. The real volume of the per-letter
nonnegative slab of width 1 is <=D_s^{k-1}/(k-1)! by the simplex
volume formula and integrating the total degree over an interval
of length at most 1. Let M=binom(n+k-1,k-1), the exact number of
degree-n monomials. M>=n^{k-1}/(k-1)!. Hence
  index(parahoric) dim(excessCond) <= M^N (1+1/h)^{N(k-1)}
    <= M^N exp(N(k-1)/h) <= (1+kappa) M^N.
The last step uses 2(N+2)k/h<=kappa<=1, so t=N(k-1)/h<=1/2,
and exp(t)<=1+2t on [0,1/2] (convexity chord; exp(1/2)<2).
This is the exact index_mul_finrank_excessCond_le caller,
conditional on finrank_excessCond_le_volume. That amplification
lemma's finite-field root/minimal-weight argument remains open
in this human reconstruction; do not infer it from volume alone.

## 4. Aggregate the depth cost once, without per-depth estimates
Use the exact native exists_le_weight_of_mem_deepForms premise:
each nonzero form in V_d has a nonzero coefficient at a monomial
whose cost C(beta)>=d, with cost per deep variable P^{-2r} if
b>=2r, P^{-1} otherwise, and zero on other variables.
HeckeSizes implies 3r<ell and hence 2r<N: P^{3r}<=n<P^ell
with P>1, using r>=1,k>=2, h>=1, and N=2ell.
Restriction to all coordinates with C>=d is injective on V_d.
Thus sum_{d<M0} dim V_d <= sum_beta min(M0,1+floor C(beta))
<= M^N (1+mean C). The monomials have fixed n per letter, and
permutation of the k rows proves each coordinate mean is n/k.
Alternating parity makes every row deep in exactly N/2 letters.
Consequently
  mean C = N*n/(2*k) * [2r/P + (k-2r)/P^{2r}]
         <= N*n * [P^{-2r}+r^2/(kP)] <= z.
This yields sum_{d<M0} dim V_d <= (1+z) M^N for EVERY M0,
including M0=0; no dependence on max depth. The weighted
vanishing/cost theorem (DeepFormCost lines 21–92) remains a
separate primitive, not replaced by a combinatorial average.

## 5. Actual common Hecke consumer and audit boundary
Use both dimension budgets at ElementaryDivisors.hasType_twisted_hecke
with the SAME T, big, source classes, tensor factors and coset systems.
The pairing of peer c22bb6a0 yields exceptional count l<=kappa*n0
with n0=|X||I|, and the two depth determinants cost at most
(1+z)*n0 in p-exponent, because w^2=p. The common projector cost
A0=(k+k^2)*o0*N^2 adds A0*n0, with A0+1<=y. Therefore the
combined budget is <=(z+kappa*m+y)*n0, precisely the native
HasType at truncation m. This passes via Columns.hasType_markOperator
and HasType.prod to the marked p^jetCeil index bound. No independent
witnesses substituted. Preserve hY, exact native projector,
root_lemma, finite-field amplification and weighted vanishing,
HeckeSizes proof at actual D, and all remaining A/B/C premises.

Static original role path:
InterlacingCone -> Counting.excess/deep dimension -> ElementaryDivisors
 -> Columns.hasType_markOperator -> LocalStatement -> short_forms.
Candidate replaces the second volume normalization by cycle recurrence,
and shortens shift/deep bookkeeping; no kernel edge deletion asserted.
Original/reduced graph and axiom ledgers unchanged; no root imported.
No local lean/lake binary. Actual CI run 45803534769 state receipts
a56e2d3a and 088cd2ec retrieved: all_requested_checks_ok=false,
A module build returncode 124 after 2700.11s, B/C six named probes
standard axioms only. GitHub workflow conclusion success does NOT
mean native A success. No new competing replay; A-only peer retry
1a365375 remains coordinated through approved runner. No PASS for
RUN57, native scalar probes below uncompiled.

Executed Python exact arithmetic check, 13665 assertions:
cycle_sum 48, cycle_recurrence 42, indicator_det 6375,
shift_box 144, telescoping 2808, shift_cone 2808, deep_mean 1440.
Zero failures. This is regression evidence, not proof of finite-field
amplification, general volume argument or RH. Reproduce with Python 3:
```python
from fractions import Fraction as F
from itertools import permutations, combinations_with_replacement, product
from math import factorial
from collections import Counter
counts=Counter()
def cycles(p):
    todo=set(range(len(p))); out=[]
    while todo:
        i=min(todo); l=0
        while i in todo: todo.remove(i); l+=1; i=p[i]
        out.append(l)
    return out
for q in (2,3,5,11,25,125):
    for k in range(8):
        a=F(0)
        for p in permutations(range(k)):
            C=cycles(p); d=F(1)
            for l in C: d*=1-F(1,q**l)
            a+=F((-1)**(k-len(C)),1)/d
        a/=factorial(k)
        ratio=(1-F(1,q))**k*a
        expected=F(1)
        for l in range(1,k+1): expected*=F(q-1,q**l-1)
        assert ratio==expected; counts['cycle_sum']+=1
        if k:
            assert (1-F(1,q**k))*a==F(1,q**(k-1))*prev; counts['cycle_recurrence']+=1
        prev=a
for k in range(1,5):
    seq=list(combinations_with_replacement(range(5),k))
    for X,Y in product(seq,repeat=2):
        x=X[::-1]; y=Y[::-1]
        t=[sum(v>=u for v in y) for u in x]
        exact=sum((-1)**(k-len(cycles(p))) for p in permutations(range(k)) if all(y[p[i]]<x[i] for i in range(k)))
        assert exact==int(t==list(range(k))); counts['indicator_det']+=1
for P,N,k,r in product((5,7,11), (2,4,6), range(2,9), range(1,5)):
    if 2*r>k: continue
    q=P**N; u=[2*P**(2*(r-1-b)) if b<r else 0 for b in range(k)]
    nu=[[u[b]*(1 if s%2==0 else P) for s in range(N)] for b in range(k)]
    beta=[[((-1)**s)*(P*nu[b][(s+1)%N]-nu[b][s]) for s in range(N)] for b in range(k)]
    assert all(0<=v<=P**(3*r) for row in beta for v in row); counts['shift_box']+=1
    for b,i in product(range(k-1),range(N)):
        root=lambda s: b+1 if s%2==0 else b
        L=sum(F(P**(1+(s-1-i)%N)*beta[root(s)][s]-P**((s-i)%N)*beta[2*b+1-root(s)][s],q) for s in range(N))
        assert L==(1-F(1,q))*(beta[root(i)][i]-nu[b][i]+nu[b+1][i]); counts['telescoping']+=1
        assert L<=(-1 if b+1==r else 0); counts['shift_cone']+=1
for n,N,k,r,P in product(range(1,9),(2,4,6),range(2,10),range(1,5),(5,7,11)):
    if 2*r>k: continue
    mean=F(N*n,2*k)*(F(2*r,P)+F(k-2*r,P**(2*r)))
    assert mean<=N*n*(F(1,P**(2*r))+F(r*r,k*P)); counts['deep_mean']+=1
print(dict(counts), 'total',sum(counts.values()))
```

RESUME HERE: prove finite-field amplification in Counting lines 49–115
by its actual Frobenius residue packing, root_lemma and coefficient
recovery, and DeepFormCost's weighted vanishing input if not already
completed by theta. Audit the cycle-volume proof and shorter shift
independently, integrate exact caller into A; do not refine adequate
constants further. Root/global star not newly closed.
HANDOFF TO theta, integration, editor, audit, kernel.
-/

namespace CompactPrimeRun57

-- Scalar comparison for recurrence uniqueness; not a formal cycle-index proof.
theorem recurrence_unique (d r a b c : ℝ) (hd : d ≠ 0)
    (ha : d * a = r * c) (hb : d * b = r * c) : a = b := by
  exact (mul_left_cancel₀ hd) (ha.trans hb.symm)

-- The exact telescoping result after collecting the cyclic weighted terms.
theorem excess_collect (q d b S : ℝ) (hq : q ≠ 0)
    (hS : S = (1-q)*d) :
    (S+(q-1)*b)/q = (1-1/q)*(b-d) := by
  rw [hS]
  field_simp
  <;> ring

-- Same numerical budget used at the actual pairing consumer.
theorem combined_budget (z kap m y a n l : ℝ)
    (hm : 0 ≤ m) (hn : 0 ≤ n) (hl : l ≤ kap*n) (ha : a+1 ≤ y) :
    (1+z)*n+a*n+m*l ≤ (z+kap*m+y)*n := by
  have h1 := mul_le_mul_of_nonneg_left hl hm
  have h2 := mul_le_mul_of_nonneg_right ha hn
  nlinarith

#check TwistingData.index_mul_finrank_excessCond_le
#check TwistingData.sum_finrank_deepForms_le
#check prod_mul_volume_inter_slab
#print axioms excess_collect
#print axioms combined_budget

end CompactPrimeRun57

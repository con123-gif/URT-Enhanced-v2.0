import New.TwistedHecke.ElementaryDivisors
import Mathlib.Tactic

/-!
# RUN52 — exact minimal universal multinomial scale at the actual projector
27 November 2026. SOURCE-MATCHED human derivation; generic Lean transition
certificates and native probes PREPARED, not compiled. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
HEAD confirmed unchanged; Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005 retained; HEAD observed
7c4ccbd64d02774b0a5b40a5f923f5b7a18e8abc, no migration.

Mission blob a69122b6ad568910a45d2bc13961ab9da4855143 (including mandatory
engine), AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, continuity and
research state inspected. Own RUN51 fced7763 supplies reduced uniform
carry bound; prime RUN77 cbe15af7 independently audits and splits both
count guards; theta RUN78 f1abc81e removes log(b) from marked index using
even the original count guards. Latest peer commit summaries bd652fd1,
82672996, fab4aba0, 80f4ff6e, 446c68f9, c8d08359, b892a87c, 788d56c5,
2f004f32 inspected. Do not duplicate their count/size proof.
This run replaces the still excessive cutoff scalar by its EXACT
minimum for this diagonal normalization, with a constructive witness.

Sources relative to grh-compact/src:
New/TwistedHecke/ClassMeans.lean b0cc77bf52f463d3c62d755b43030f964d32f8cf
  lines 57–73 exists_invariant_diagonal_form, 80–137 exists_mean.
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307
  lines 153–208 exists_projector, 217–261 hasType_twisted_hecke.
New/TwistedHecke/Counting.lean 42f70c497698b45ac20533664cb50929222151b9
  HeckeSizes, index_mul_finrank_excessCond_le, sum_finrank_deepForms_le.
Keep all non-scalar foundations and original source declarations.

## 1. Exact cutoff scale: all per-level maxima can occur simultaneously

For prime p, s>=1, D>=0, multiindex alpha of degree d<=D,
let C_j(alpha)=floor(d/p^j)-sum_i floor(alpha_i/p^j). Legendre
identifies v_p(multinomial(alpha)) with sum_{j>=1} C_j(alpha).
For j>=0 put A_j=floor(D/p^j), B_j=floor(s*(p^j-1)/p^j),
and C_j=min(A_j,B_j). Both upper bounds hold for every alpha:
the first by nonnegativity; the second by Euclidean remainders,
each at most p^j-1. Hence
    E(s,D)=sum_{j>=1} min(floor(D/p^j), floor(s*(p^j-1)/p^j))
is a universal upper bound, sharper than RUN51's (s-1)(f-1)
and its cutoff-only refinement whenever the extra caps are strict.

It is EXACT. Write D_j=A_j mod p, S=s*(p-1).
A_{j+1}=floor(A_j/p); B_{j+1}=floor((B_j+S)/p).
The second identity follows by multiplying the argument of the
floor by 1/p and using floor(floor(x)/p)=floor(x/p).
Consequently p*C_{j+1}<=C_j+S (both cap sequences satisfy this).
Define d_j=max(0,C_j-p*C_{j+1}), t_j=max(0,p*C_{j+1}-C_j).
Then 0<=t_j<=S. Also 0<=d_j<=D_j: if C_{j+1}=A_{j+1},
use C_j<=A_j=p*A_{j+1}+D_j; otherwise C_{j+1}=B_{j+1},
and B_j<=B_{j+1} makes d_j=0.
Choose s base-p digits with sum t_j (greedily assign up to p-1
per coordinate). The exact digit identity is
    C_j+t_j=p*C_{j+1}+d_j.
C_0=0 and C_j=0 beyond D, so this is the actual addition carry
recurrence for the s constructed integers. Their sum d has
digits d_j, hence d<=D; their carry at every level is C_j.
Thus the upper bound is attained by ONE multiindex. D=0 is
the zero vector, and s=1 has zero carries.

In the actual valuation domain O, the prime-to-p factor of every
multinomial is a unit. If p is a nonunit, p^a does not divide p^b
for a>b (cancel nonzero p^b, obtain a unit contradiction).
Consequently E(s,D) is the exact least exponent making every
q_alpha=p^E/multinomial(alpha) integral for degree<=D.
This is minimal for this universal diagonal recipe, NOT a
lower bound for arbitrary projectors or the RH proof.

## 2. Exact homogeneous degree scale, even smaller for letters

The letter module only uses degree n, not the entire cutoff <=n.
For fixed d, let A_j=floor(d/p^j), d_j=A_j mod p, S=s*(p-1).
Set c_0=0 and recursively
    c_{j+1}=min(A_{j+1}, floor((c_j+S-d_j)/p)).
The numerator is nonnegative since S>=p-1>=d_j.
Every degree-d multiindex has carries bounded by c_j, by induction:
its next carry is bounded by A_{j+1} and by the second cap
with its current carry in place of c_j. Both are monotone.
The greedy maximal sequence is feasible: c_j<=A_j, so
p*A_{j+1}+d_j>=c_j. Also
p*floor((c_j+S-d_j)/p)+d_j>=c_j+S-(p-1)>=c_j.
Thus t_j=p*c_{j+1}+d_j-c_j lies in [0,S]. Distribute the
digits t_j among s coordinates exactly as in section 1.
The resulting sum is exactly d; c_j are its carries.
Therefore E_fixed(s,d)=sum_{j>=1} c_j is the exact maximum
for homogeneous degree d. Example p=2,s=2,d=3 gives zero,
whereas the cutoff <=3 needs one power. This difference
is real, not a failure of monotonicity in the proof.

Both exponent computations use one pass over base-p digits:
O(log_p(D+1)) arithmetic steps, NOT bit complexity or a claim
about overall proof search. Constructing the witness digits
takes O(s log_p(D+1)) arithmetic steps. No URT comparison.

## 3. Actual source consumption; no duplicate count work

Use D=N*n*k*(ell+2)*P^ell, N=2ell, f=o0*N,
as in exists_projector's call to exists_mean, with D<p^f
and n<p^f from the original size hypotheses. For the matrix
class means use E_M=E(k^2,D). For the letter diagonal use
E_B=E_fixed(k,n). For class means set q=0 outside degree<=D;
for letter diagonal set q=0 outside degree=n. These support
choices preserve the transpose relation: linear substitutions
preserve total degree; within the retained degree the same
contingency-table identity cancels the factorials, as RUN51.
Use both means at the SAME E_M, and rebuild each mean from
the integral diagonal and the existing trace construction.
Do not divide a previously constructed mean by p. Every
trace input in ClassMeans.exists_mean is homogeneous of
degree<=D; outside this range its final coefficient is zero.
The literal original Lean statement expects exponent k^2*f;
a NEW theorem with the restricted diagonal is necessary.

The letter representation uses only Monomials _ n;
choose the complementary diagonal from integer multinomials
so BB'=p^(N E_B) I. The coefficient and parity identities
from RUN35/RUN51 remain; no inverse of B is needed.
The actual three projector fields therefore have common scalar
    p^E_*,  E_*=N*(E_fixed(k,n)+E(k^2,D)).
This is <= RUN51's N*(k+k^2-2)*(f-1).
Carry maxima in the two recipes need not be attained by
the same multiindex; the common scalar is the product
of their independently constructed sufficient scales.
Retain actual Frobenius coefficient divisibility, Levi
trace/density/support and generator-span proofs.

At hasType_twisted_hecke take c=2E_*+2; use the existing
RUN50 pairing (or original pairing) and depth factors.
The original size hypotheses imply 6c+2<=y. If using
prime RUN77's human split guards, that sole projector
guard can be replaced by 6(2E_*+2)+2<=y; the two count
inputs are the independent flag/slab and exact mean guards
already derived there. No new count result claimed.
The pairing scalar is w^(2E_*) and error mod w^c.
Keep all original residual conditions, exact caller matrices
and range mapping. The coarse HasType output is unchanged;
no claim of a smaller actual global marked index, archimedean
budget or RH bound. Theta RUN78's log-free bound is independent.

Original graph: binomial valuations -> diagonal -> class means/
letter diagonal -> projector -> pairing + depth -> HasType -> A.
Candidate graph: exact digit carry maxima -> restricted diagonals
-> SAME trace and Frobenius interfaces -> same pairing at c
-> same HasType. Original nodes not retired until native replacement
and audit; no missing types/constructor/axiom edges silently dropped.
Context key: pin, p,O,W,s,k,N,n,ell,D, iota, row weight, support,
class mean P, theta,c and all actual caller matrices. No declaration-only
cache for a specialized diagonal or changing support.

## 4. Execution and trust boundary

Actual local Python 3 exact diagnostic enumerated weak compositions
for p in (2,3,5,7,11), s=1..5, D=0..14. Computed each valuation by
Legendre; constructed the greedy witness separately for both formulas,
checked digit ranges, total degree, witness valuation and equality
with exhaustive maxima. Output:
    cases=375 vectors=77515 strict=32
    2 2 3 1 0
    5 25 1000 53 53
    13 64 1000000 222 222
The last columns are cutoff and homogeneous exact exponents.
A preceding larger brute-force attempt timed out; not counted.
These are finite diagnostic results, not native operator evidence.
Reproduction:
    def comps(d,s):
        if s==1: yield (d,); return
        for a in range(d+1):
            for b in comps(d-a,s-1): yield (a,)+b
    def val(a,p):
        d=sum(a); v=0; q=p
        while q<=d:
            v+=d//q-sum(x//q for x in a); q*=p
        return v
    def construct(p,s,D,fixed=False):
        c=0; a=[0]*s; q=1; cost=0
        while q<=D:
            A=D//q; A1=A//p; dj=A%p
            if fixed:
                nxt=min(A1,(c+s*(p-1)-dj)//p); out=dj
            else:
                nxt=min(A1,s*(q*p-1)//(q*p)); out=max(0,c-p*nxt)
                assert out<=dj
            t=p*nxt+out-c
            assert 0<=t<=s*(p-1)
            for i in range(s):
                z=min(t,p-1); a[i]+=q*z; t-=z
            assert t==0
            cost+=nxt; c=nxt; q*=p
        assert c==0 and sum(a)<=D and (not fixed or sum(a)==D)
        assert val(a,p)==cost
        return cost
    cases=vectors=strict=0
    for p in (2,3,5,7,11):
        for s in range(1,6):
            best=0
            for D in range(15):
                mx=-1
                for a in comps(D,s):
                    mx=max(mx,val(a,p)); vectors+=1
                best=max(best,mx)
                e=construct(p,s,D); e2=construct(p,s,D,True)
                assert e==best and e2==mx
                strict+=e2<e; cases+=1
    print(cases,vectors,strict)

Local command -v lean/lake returned neither. No new native rh_scan,
rh_prune, rh_reduce, rh_auto or rh_auto_frontier. The old native
engine baseline does not certify the compact replacement.
Retrieved actual CI 45803534769 jobs and persisted targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804: six B/C named checks
only propext, Classical.choice, Quot.sound; A build timeout 124
after 2700.11s; all_requested_checks_ok=false, full_RH_replay=false.
No new native PASS or axiom ledger. Generic Lean transition lemmas
below prepared, not compiled. Preserve all unresolved obligations.

RESUME HERE: independently audit simultaneous attainment, especially
the two cap recurrences, then port the restricted-support diagonal into
ClassMeans using exact degree cutoff and replay at exists_projector.
The two count guards have already been split by prime RUN77; do not
redo them. This diagonal normalization is now exact/minimal within its
recipe, so do not spend another run reducing its exponent unless a
different projector construction is identified. Prioritize native
replacement and other actual A primitive suppliers. RH remains OPEN.
HANDOFF TO integration/editor, prime, theta, formal audit.
-/

namespace KernelRun52

-- A single cutoff digit transition; x = current carry, y = p*next carry.
theorem cutoff_digit (x y S digit : ℕ)
    (h₁ : y ≤ x+S) (h₂ : x ≤ y+digit) :
    let d := x-y
    let t := y-x
    d ≤ digit ∧ t ≤ S ∧ x+t=y+d := by
  dsimp
  omega

-- The exact fixed-degree digit transition with prescribed output digit.
theorem fixed_digit (x y S digit : ℕ)
    (h₁ : x ≤ y+digit) (h₂ : y+digit ≤ x+S) :
    ∃ t : ℕ, t ≤ S ∧ x+t=y+digit := by
  refine ⟨y+digit-x, ?_, ?_⟩ <;> omega

-- Simultaneous caps preserve the one-step upper constraint.
theorem cap_transition (a b next S : ℕ)
    (ha : next ≤ a+S) (hb : next ≤ b+S) :
    next ≤ min a b + S := by
  rcases le_total a b with h | h
  · simpa [min_eq_left h] using ha
  · simpa [min_eq_right h] using hb

#print axioms cutoff_digit
#print axioms fixed_digit
#print axioms cap_transition
end KernelRun52

#check ClassMean.exists_invariant_diagonal_form
#check ClassMean.exists_mean
#check TwistingData.exists_projector
#check TwistingData.hasType_twisted_hecke
#print axioms ClassMean.exists_invariant_diagonal_form
#print axioms ClassMean.exists_mean
#print axioms TwistingData.exists_projector
#print axioms TwistingData.hasType_twisted_hecke

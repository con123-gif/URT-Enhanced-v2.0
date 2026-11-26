import New.TwistedHecke.Counting
import Mathlib.Tactic

/-!
RUN33 kernel lane, 26 November 2026. Independent REVIEW of prime RUN58
(efbbc42e4c52cc585af6f8f4ed5e5c205b7bdb76), plus a missing explicit
layer-count and exact coefficient-mass calculation at the actual
sum_finrank_deepForms_le consumer. Human source-matched argument;
native probes PREPARED, NOT executed. Credit Alpöge, Sernau,
Anthropic collaborators and Claude.

Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; manuscript
d185408f9b17703c84b1584444bfde1f65d57e74. Read protocol, handoff,
expansion, AGENTS, continuity and state. Previous kernel RUN32
2e27597e; peer acceleration 03380f28, theta 663c88ca, editor e7cdaea4,
integration cd6be32e. RUN58 reached the planned interpolation primitive
before this lane; do not count the independent review as a new proof
obligation. Here fill the explicit remaining aggregate dimension step.

Pinned sources relative to grh-compact/src:
Lib/General/Algebra/ZerosCostDegree.lean f572d0f6d5038d5e13b6de766797f44128a5990b
New/TwistedHecke/TwistingData.lean fd376cc6956e23a5cc117093e5f4083238cbc144
New/TwistedHecke/DeepFormCost.lean f6c6a6f69b83d7b59e4b2de375e9407ca92f80d8
New/TwistedHecke/Counting.lean 42f70c497698b45ac20533664cb50929222151b9
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307

1. REVIEW: weighted polynomial basis and actual interpolation.
Let H_v=X_v^kappa_v-g_v. In the proposed RUN58 replacement the
strictly smaller costs of g_v imply that X^a H^gamma has sole
highest-cost monomial X^(a+kappa*gamma), a_v<kappa_v. Distinct
leading monomials, and the common denominator of the finitely many
positive rational weights, give independence and terminating spanning
by descending cost, without a total monomial order. Multiplication
by H_v shifts gamma. Consequently J0=(H_v) has codimension prod kappa
and J0^d is spanned by |gamma|>=d. By CRT for the distinct points,
J=intersection m_y has codimension #points. J0 subset J and the
native #points>=prod kappa imply J0=J (not merely a radical equality).
Pairwise comaximality of the powers then gives intersection m_y^d
=J^d. The leading monomial argument proves the same nonzero
polynomial cost conclusion, including d=0. This is a sound shorter
human argument under exactly the native hypotheses; no Lean bridge
has been compiled.

For DeepFormCost, r<=k/2 and 2r<N. Use actual I=Fin r times
Fin(k-2r+1), rho(a,l)=a, sigma(a,0)=a+r, sigma(a,l)=k-l for l>0.
At recovery index i, j=0 for l=0; otherwise j=2a or 2a+1 chosen so
i-j is even in the native parity. Since j<2r<N, reducing modulo N
does not change j. Specialize x_(b,s) to 0^max(floor(((i-s) mod N)/2)-b,0),
with 0^0=1. For near row l=0, even i identifies its own sigma;
odd i only allows the same a, hence column (a,l')>=row (a,0).
For far l>0, even i-j identifies l; its shallow coefficient index
a' survives iff a'>=a. Thus the recovery matrix is upper triangular
with unit diagonal, including either initial parity and char 2.
The corresponding monomial cost is P^j/P<1 for near rows and
P^j/P^(2r)<1 for far rows. Frobenius gives the required relations
for each z_v^kappa_v; shallow coordinates are zero. The map from
residue lifts is independent of the lifts: for each letter i,
u=iota_i(w) satisfies u^q=u. If w is nonunit then 1-w^(q-1)
is a unit and its image is nonzero, so u=0. If w is unit its image
is nonzero. Thus each iota factors through an injective residue
embedding. Recovery gives distinct points and #points=prod kappa,
as the alternating cyclic parity forces N even and each b is deep
in N/2 letters. A^2=0 and the action of (1+A)^(-1) turns each deep
variable into X_v-z_v(y); the same F is used at every point.
This validates RUN58's human argument under the actual source
premises. Shallow variables become coefficients in the fraction
field; the readout polynomial stays nonzero by independence of
the original variables. No need to claim kernel proof-body pruning.

2. Actual outstanding aggregate mass step, Counting.sum_finrank_deepForms_le.
Write B for the set of all letterwise degree-n exponent vectors,
D=#B=binom(n+k-1,k-1)^N, and for beta in B write
 w(beta)=sum_(b,s) beta_(b,s) deepIndicator(r,b,s)/
                              P^ite(2r<=b,2r,1).
Here retain actual HeckeSizes, so r>=1, k>=2r and 2r<N (the
latter from its scale conditions as in Counting). K has char p.
For any integer d>=0, let V_d=T.deepForms(k,n,r,d).
Restriction to the coefficient set B_d={beta:w(beta)>=d}
is a K-linear injection V_d -> K^(B_d). Indeed any nonzero
element of its kernel contradicts exactly
exists_le_weight_of_mem_deepForms, proved by the preceding argument.
This uses a SINGLE fixed coefficient restriction, not a choice
of a different monomial per independent basis vector followed by
an unjustified counting of them.

For every natural M, sum the rank bounds and exchange finite sums:
 sum_(0<=d<M) dim V_d <= sum_beta min(M, floor(w(beta))+1)
                       <= D + sum_beta w(beta).
Nonnegative w justifies both the floor convention and the +1
for the d=0 layer. M=0 works. This is the actual finite-layer
bound, with no estimate for the largest occurring depth needed.

At each letter s, permutation of the k row labels is a bijection
of B. Hence the sum over B of beta_(b,s) is independent of b.
Summing over b gives nD, so each coordinate sum is nD/k.
No independence assumption or equidistribution of actual forms
is made; the uniform counting is only over the full monomial set.
Now substitute the exact mass before estimates. For each b there
are N/2 deep letters. There are 2r near row indices and k-2r far.
Therefore
  (sum_beta w(beta))/D
   = (n/k)*(N/2)*(2r/P+(k-2r)/P^(2r))
   = N*n*(r/(k*P)+(1/2-r/k)/P^(2r)).
This is an exact rational identity. Since r>=1 and k>0,
r/k <= r^2/k, and 1/2-r/k <= 1. It follows immediately from the
last conjunct of the SAME HeckeSizes record that mean cost <= z.
Consequently
  sum_(0<=d<M) dim V_d <= (1+z)*D
for every M. No alteration of native z or of the downstream
elementary-divisor bound. This supplies the depth dimension
argument explicitly, not merely the existence of a high-cost
monomial. The proof is valid over the native field regardless of
characteristic since the averaging takes place in real numbers,
not K (division by k in K would be invalid if p divides k).

3. Exact caller and surviving obligations.
ElementaryDivisors.hasType_twisted_hecke sets S=T.map(residue O),
uses the native p-nonunit assumption to get CharP of residue O,
selects x from the finite maximal depth, then uses
S.sum_finrank_deepForms_le big x (the second U' in its obtain).
The argument above supplies exactly U' <= (1+z)D at that x
and the same S, with no extra premise. Do not replace the paired
excess dimension U, exists_projector, both depth factorizations,
of_pairing or determinant transport; those are separately used.
In the final native bound U' enters additively with m*U,
not a product with U. The source retains the final
(z+kappa*m+y)*#X*#I HasType cost, with the original f.range.
No additional rank-dependent slack is needed. No change to
the common prime or marked row witness.

Evidence: actual local Python integer/Fraction checks:
77000 specialized matrix entries, 6600 recovery cost guards,
80 point cardinality equalities, 1280 exact mean/budget checks
for r=1..4, k=2r..2r+4, even N=2r+2..2r+8, P in 5,7,8,9,
n=1..4. The matrix regression used standard initial parity;
the proof above handles both. Independent full monomial checks
enumerated weak compositions n=0..6, k=2..8, checked 245 individual
coordinate mean identities. Full product checks (both initial
parities, P=5) at (k,n,N,r)=(2,1,4,1),(2,2,4,1),(3,1,4,1),
(4,1,6,2) gave 48 exact mean and layer identities with M=0..4.
These are finite structural regression checks only, not evaluation
of the huge actual Data or a substitute for the proof. Reproduce
the latter checks:
```python
from fractions import Fraction as Q
from itertools import product
from math import comb
def compositions(n,k):
    if k==1:
        yield (n,); return
    for a in range(n+1):
        for t in compositions(n-a,k-1): yield (a,)+t
c=0
for k in range(2,9):
    for n in range(7):
        C=list(compositions(n,k)); m=comb(n+k-1,k-1)
        assert len(C)==m
        for b in range(k):
            assert sum(v[b] for v in C)==Q(n*m,k); c+=1
q=0
for k,n,N,r in [(2,1,4,1),(2,2,4,1),(3,1,4,1),(4,1,6,2)]:
    C=list(compositions(n,k)); D=len(C)**N
    for parity in (0,1):
        P=5
        w=[sum(Q(a[b],P**(2*r if b>=2*r else 1))
           for s,a in enumerate(A) for b in range(k)
           if ((s+parity)%2==0)==(b>=r))
           for A in product(C,repeat=N)]
        assert len(w)==D
        assert sum(w)==D*N*n*(Q(r,k*P)+(Q(1,2)-Q(r,k))/P**(2*r))
        q+=1
        for M in range(5):
            assert sum(sum(d<=a for a in w) for d in range(M))==sum(min(M,int(a)+1) for a in w)
            q+=1
print(c,q) # 245 48
```
No local lean/lake (checked command availability). Actual RUN29 receipt
read from state branch status.json a56e2d3a: run 45803534769 outer
jobs successful but target status ERROR, returncode 1, A timeout.
Do not confuse the orchestrator physics summary with native proof
verification. No new compact rh_scan/prune/auto invocation possible;
new scalar probes below are uncompiled and their axioms unknown.
Original and reduced graphs preserved; static candidate edges:
ZerosCostDegree -> DeepFormCost -> coefficient restriction
-> exact layer sum and coordinate mean -> sum_finrank_deepForms_le
-> hasType_twisted_hecke -> marked local index -> short_forms -> star.
All original type/value/axiom edges retained until native verification.
RUN58 proof of excess dimension is not independently replayed here.
No root theorem import. No URT assumptions.

RESUME HERE: integration/editor insert exact layer/mean argument
after RUN58's high-cost monomial proof, keeping original constants.
Audit lane review the weighted-basis replacement and the source
scale guard 2r<N. Kernel A-only bounded replay should compile
ZerosCostDegree, DeepFormCost and RootLemma before Counting, then
the actual named consumer and #print axioms; use the existing runner
and no competing job. Next inspect actual stage support and
Schur-jet transfer against latest theta notes, rather than redo
either dimension supplier. No claim of complete A/B/C or human RH.
HANDOFF TO prime-window, theta, integration, editor, audit and kernel.
-/

namespace CompactKernelRun33

theorem mean_cost_identity (n k N r a b : ℝ) (hk : 0 < k) :
    n / k * (N / 2 * (2*r*a + (k-2*r)*b)) =
      N*n*(r/k*a+(1/2-r/k)*b) := by
  field_simp [ne_of_gt hk] <;> ring

theorem mean_cost_budget (r t a b : ℝ) (hr : 1 ≤ r)
    (ht : 0 ≤ t) (ha : 0 ≤ a) (hb : 0 ≤ b) :
    t*a+(1/2-t)*b ≤ r*t*a+b := by
  have h1 := mul_nonneg (sub_nonneg.mpr hr) (mul_nonneg ht ha)
  have h2 := mul_nonneg (show 0 ≤ 1/2+t by linarith) hb
  nlinarith only [h1, h2]

end CompactKernelRun33

#check TwistingData.exists_le_weight_of_mem_deepForms
#check TwistingData.sum_finrank_deepForms_le
#print axioms exists_le_cost_of_vanishing
#print axioms TwistingData.exists_le_weight_of_mem_deepForms
#print axioms TwistingData.sum_finrank_deepForms_le
#print axioms CompactKernelRun33.mean_cost_identity
#print axioms CompactKernelRun33.mean_cost_budget

import New.TwistedHecke.Counting
import New.TwistedHecke.DeepFormCost

/-!
RUN58, 26 November 2026. Human source-matched reconstruction, independent
audit and native replay pending. Credit Levent Alpöge, Luke Sernau,
Anthropic collaborators and Claude. Compact pin lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. Mission blob
3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; manuscript
57e7f36aa8032da2dd16f54a539e23d992a7cf96. Read current protocol, handoff,
expansion, AGENTS, continuity, RUN57 and recent peer commits. In particular
kernel RUN32 2e27597e supplies root_lemma, used here rather than duplicated;
c561038c supplies independent prefix recurrence, c423f7ff other A/B/C
suppliers. No root theorem import.

Pinned source ledger (relative to grh-compact/src):
New/TwistedHecke/Counting.lean 42f70c497698b45ac20533664cb50929222151b9
  49–115 finrank_excessCond_le_volume; 173–203 and 210–233 consumers.
New/TwistedHecke/TwistingData.lean fd376cc6956e23a5cc117093e5f4083238cbc144
  25–34, 53–96, 108–124, 137–150.
New/TwistedHecke/RootLemma.lean 0b933c458f7ccf3ee856dfda11a145a846d667b7
  83–91 root_lemma (peer human proof awaiting audit).
New/TwistedHecke/DeepFormCost.lean f6c6a6f69b83d7b59e4b2de375e9407ca92f80d8
  21–92 exists_le_weight_of_mem_deepForms.
Lib/General/Algebra/ZerosCostDegree.lean f572d0f6d5038d5e13b6de766797f44128a5990b
  271–314 exists_le_cost_of_vanishing.
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307
  217–259 hasType_twisted_hecke.

1. Amplification gives the exact finite-field dimension bound (conditional
on the actual root lemma, reconstructed by peer RUN32).
Use the original T, n, adjacent a,a'=a+1, char K=p, q=P^N, and
V=excessCond(n,a,a',0,h). Let L be the two-block Levi at a', H its
intersection with the lower Iwahori and R a right transversal in the
sense L=H R, containing 1. Its size is the native relative index.
It is finite since the residue field of W is finite. In characteristic p
each letter map factors through the residue field: its values satisfy
u^q=u by Frobenius around the circle. For a nonunit x of W,
1-x^(q-1) is a unit, so iota_s(x)(1-iota_s(x)^(q-1))=0 implies
iota_s(x)=0; a unit cannot map to zero. In particular H acts by
weight-nondecreasing substitutions for w(b,s)=b on even letters and
-b on odd letters (lower triangular on even, upper on odd).
For h0∈H, the substitution by h0 never decreases w-weight.

For m=q^t, take a family F_u∈V indexed by u∈{0,...,m-1}^{kN}.
For every letter s set
  gamma(u)_(b,s)=u_(b,s)+1_(b=a) m(k-floor(sum_b u_(b,s)/m)).
All entries are nonnegative, gamma(u)≡u mod m coordinatewise, and
the per-letter degree is km+(sum_b u mod m) in [km,(k+1)m).
The K-linear packing
  P(F)=sum_u x^gamma(u) F_u(x^m)
is injective by disjoint exponent residues; within each block the
map beta↦m beta+gamma(u) is injective too. Substitution x↦x^m
commutes with letter actions because m is a power of q and all letter
matrix entries satisfy c^q=c; coefficients of F_u are not raised.
Take nonzero F and a monomial x^alpha with nonzero coefficient in
g P(F), g∈R, minimizing w·alpha over ALL such translates.
For any l∈L write l^(-1)g=h0 r with h0∈H,r∈R. Every term of
l^(-1)g P(F) has w-weight at least w·alpha by the triangular property.
Since w_adic^2=p=0 in K and K is a field, w_adic=0; the root lemma
at adic level l=0 applies (nonzero coefficient is not divisible by 0).
For adjacent b,b' within one Levi block the root variable difference
in the w-weight is exactly 1 for every letter. Thus all normalized
excesses of alpha at these roots are ≤0. This uses precisely the
same minimal alpha, not independent choices for different roots.

For the single boundary root a,a', expand g P(F). A nonzero coefficient
at alpha implies at least one contributing pair
  alpha=m delta+epsilon,
where delta belongs to a nonzero coefficient of g F_u and epsilon
to g x^gamma(u). Both are nonnegative, and epsilon has unchanged
per-letter degree in [km,(k+1)m). The defining condition on V at
g∈L gives all boundary excesses of delta ≤h. Every coordinate
of the excess functional lies in [-1/5,1] by the actual T lemma.
Hence for each letter i,
  excess_i(alpha/m) ≤ h+sum_(b,s) epsilon_(b,s)/m ≤ h+N(k+1).
At every letter, alpha/m has total degree in [n+k,n+k+1].
Consequently alpha/m lies in the exact bounded convex region
  C=excessCone(a',h+N(k+1)) ∩ slab(n+k+1).
All F are therefore detected by the linear map recording coefficients
of g P(F) at exponents m C∩Z^(kN), for every g∈R. If this map
had a nonzero kernel, the minimizing alpha just constructed would
give a nonzero recorded coefficient. Rank-nullity yields
  m^(kN) dim_K V ≤ |R| # (m C ∩ Z^(kN)).
Divide by m^(kN), let t→∞. The normalized lattice count tends to
vol(C) because C is bounded convex with boundary of Lebesgue measure
zero (if lower-dimensional the entire set is null). This is the
native finrank_excessCond_le_volume, including all its h and n
quantifiers; no need for positive volume. Combined with RUN57's
flag-volume cancellation and feasible shift it supplies the
actual index_mul_finrank_excessCond_le inequality.

2. Short general weighted multiplicity lemma (exact premises of
exists_le_cost_of_vanishing), using a filtered polynomial basis.
Let K be any field, finite variable set I, positive integers kappa_i,
weight cost(x^alpha)=sum alpha_i/kappa_i. Let S consist of distinct
K-points, |S|≥prod kappa_i, and let H_i=x_i^kappa_i-g_i where
every monomial of g_i costs strictly less than 1 and H_i vanishes
on S. For 0≤a_i<kappa_i and gamma_i≥0 the polynomial
  B_(a,gamma)=x^a prod_i H_i^gamma_i
has a unique highest-weight monomial x^(a+kappa*gamma), coefficient
one. These monomials exhaust all exponent vectors exactly once by
coordinatewise Euclidean division. Therefore the B's are a K-basis:
for any polynomial subtract the corresponding B for each highest
weight monomial; every new term has strictly smaller weight and
weights lie on a discrete nonnegative rational lattice, so this
terminates. Independence follows from the distinct leading monomials
among the maximal-weight terms of any finite linear combination.
The argument includes the empty variable set with the empty product.
Multiplication by H_i shifts gamma by e_i, hence the ideal J0=(H_i)
has basis those B with |gamma|≥1, and dim K[x]/J0=prod kappa_i.
By CRT the vanishing ideal J of S has quotient dimension |S|.
Since J0⊆J, the cardinal hypothesis forces equality J0=J and
|S|=prod kappa_i. The distinct point maximal ideals are pairwise
comaximal; their powers are also comaximal. Consequently
  intersection_(z∈S) m_z^d = J^d = J0^d
    = span{ B_(a,gamma): |gamma|≥d }.
This holds at d=0 also. Every nonzero polynomial in this span
has a leading monomial of weight |gamma|+cost(a)≥d. This proves
the source theorem with the same hypotheses, avoiding a separate
jet interpolation dimension count at EACH d. No added term order
assumption; strict weighted decrease is the only required property.

3. The actual DeepFormCost interpolation points and triangular recovery.
Retain 2r≤k, 2r<N, F∈deepForms(n,r,d), F≠0. Alternating parity
implies N even (go around circle) and each row is deep in N/2
letters. Put m0=k-2r, I= {0,...,r-1} × {0,...,m0} in lexicographic
order; rho(a,l)=a, sigma(a,0)=a+r, sigma(a,l)=k-l for l>0.
Over K(x_(b,s)) define points z(y), y∈F_q^I, by
  z_v(y)=sum_t c(v,t) iota_s(y_t),
where c(v,t)=0 unless v=rootVar(rho_t,sigma_t,s), in which case
c(v,t)=epsilon_s x_(opposite root variable), epsilon_s=+1 if
even, -1 if odd. As in source, iota acts on any residue lift.
Only deep coordinates of z can be nonzero. Work with all kN
polynomial variables over this fraction field, shallow variables
having kappa=1 and zero point coordinates. Deep variables have
kappa_v=P if b<2r, P^(2r) otherwise. Frobenius gives exactly
  z_v(y)^(P^j)=sum_t c(v,t)^(P^j) iota_(s+j)(y_t).
For every i and target row t=(a,l) choose j_t=0 if l=0,
otherwise the unique j_t∈{2a,2a+1} for which i-j_t is even.
These are <N, and v_t=rootVar(rho_t,sigma_t,i-j_t).
The row-vector z_(v_t)^(P^j_t) recovers all entries iota_i(y_t)
by inverting the matrix M_(t,t')=c(v_t,t')^(P^j_t).
Indeed specialize every x_(b,s) to 1 if b≥floor(((i-s) mod N)/2),
and 0 otherwise. If l=0 and i is even, the deep index a+r
uniquely identifies t. If l=0 and i is odd, the deep index a
restricts t' to the same first coordinate a, hence t'≥t.
If l>0, i-j_t is even and the deep index k-l fixes the second
coordinate l; the shallow index a' contributes only for a'≥a.
The resulting matrix is upper triangular in the stated lex order
with nonzero diagonal ±1 (powers preserve units). Thus its
determinant is not the zero polynomial, in every characteristic.
Each v_t is deep. For l=0 its cost exponent is P^0/P<1.
For l>0 the index is ≥2r and j_t<2r, giving cost P^(j_t-2r)<1.
Hence every linear combination of the iota_i(y_t) has a polynomial
expression in z with support cost <1. The actual powers z_v^kappa_v
are such linear combinations by Frobenius for deep v; for shallow
v they are zero. Recovery at i=0 proves point injectivity using
the residue field embedding proved in section 1.
The cardinal hypothesis holds with exact equality:
  |S|=q^(r(m0+1))=P^(N r(m0+1))=prod_v kappa_v,
since each row has N/2 deep letters. The r=0 case is included:
I empty, all kappa=1, one point at zero; the assumptions on deep
indicator and the source's count still yield the same identity.
(In the actual HeckeSizes consumer r>0.)

4. Same-point vanishing and transfer back to F.
For y∈F_q^I let A=sum_t y_t^lift E_(rho_t,sigma_t). All sources
are <r, targets ≥r, so A²=0 and g=1+A has inverse 1-A over W.
The native deepForms hypothesis says every nonzero monomial in
g F has depth ≥d. In g^(-1)'s polynomial action over the fraction
field, shallow variables are fixed; each deep variable becomes
X_v-z_v(y), after evaluating shallow variables as the constants x_v.
This is because on even letters the inverse acts by 1-A, and on
odd letters by the transpose of 1+A. Therefore the polynomial
F read over the fraction field in just the deep variables is
in m_(z(y))^d for every y, where the shallow variables in the
all-variable formulation are unused. It is nonzero: a nonzero
coefficient polynomial in independent shallow x's remains nonzero
in their fraction field. Equivalently the source's eval₂Hom is
injective on the original polynomial by evaluating deep variables
at the original independent x's. Apply section 2 with section 3's
exact points and kappa. A monomial of cost ≥d in the image must
come from at least one nonzero original F coefficient at identical
deep exponents; its weight is exactly the native deepIndicator/
P^ite(2r≤b,2r,1) cost. No loss or norm estimate. This supplies
exists_le_weight_of_mem_deepForms at Counting.sum_finrank_deepForms_le.
Combining sections 1–4, RUN57 and peer RUN32 reconstructs both
native dimension suppliers for the SAME T and big in
ElementaryDivisors.hasType_twisted_hecke; peer pairing and projector
still require audit and are NOT independently proved here.
No claim that all A, B, C or prime cancellation is completed.

Executed deterministic Python arithmetic regression (231262 assertions):
shift_guard 10500, recovery_cost 10500, triangular_diag 10500,
point_count 150, triangular_zero 55580, padding 71596,
residue_unique 71596, excess_guard 840; no failures. Reproduce:
```python
from itertools import product
from collections import Counter
from fractions import Fraction as F
c=Counter()
for N in (4,6,8,10,12):
 for r in range(1,N//2):
  for k in range(2*r,2*r+5):
   I=list(product(range(r),range(k-2*r+1)))
   sig=lambda t:t[0]+r if t[1]==0 else k-t[1]
   for parity in (0,1):
    even=lambda s:(s+parity)%2==0
    for i in range(N):
     for idx,t in enumerate(I):
      a,l=t; j=0 if l==0 else 2*a+int(not even(i-2*a)); s=(i-j)%N
      assert j<N; c['shift_guard']+=1
      v=sig(t) if even(s) else a
      kap=1 if v<2*r else 2*r
      assert j<kap; c['recovery_cost']+=1
      for idx2,t2 in enumerate(I):
       b,_=t2; sv=sig(t2)
       root=sv if even(s) else b; shallow=b if even(s) else sv
       val=(1 if even(s) else -1)*int(root==v and shallow>=((i-s)%N)//2)
       if idx2<idx: assert val==0; c['triangular_zero']+=1
       if idx2==idx: assert abs(val)==1; c['triangular_diag']+=1
    exp=sum((1 if b<2*r else 2*r) for b,s in product(range(k),range(N)) if even(s)==(b>=r))
    assert exp==N*len(I); c['point_count']+=1
for k,m in product(range(2,6),range(2,7)):
 for a in range(k):
  seen=set()
  for u in product(range(m),repeat=k):
   g=tuple(v+(m*(k-sum(u)//m) if b==a else 0) for b,v in enumerate(u))
   assert k*m<=sum(g)<(k+1)*m and tuple(v%m for v in g)==u; c['padding']+=1
   assert g not in seen; seen.add(g); c['residue_unique']+=1
for P,N,k in product((5,7,11),(2,4,6),range(2,7)):
 q=P**N
 for i,s in product(range(N),repeat=2):
  pos=F(P**(1+(s-1-i)%N),q); neg=-F(P**((s-i)%N),q)
  assert -F(1,5)<=neg<=0<=pos<=1; c['excess_guard']+=1
print(dict(c),sum(c.values()))
```
No native lean/lake in local environment. Native receipt actually read:
compute/rh-compact-primitives-replay-20261126/status.json
a56e2d3a and outputs/targeted_results.json 088cd2ec on state branch,
run 45803534769: all_requested_checks_ok=false; A build code 124
after 2700.11s, B/C six native probes report standard three axioms.
Outer workflow success is NOT a successful A build. No new replay
or PASS; native probes below prepared only. Original and reduced
role/axiom graphs untouched. Static chain:
RootLemma -> Counting.amplification -> excess dimension;
ZerosCostDegree -> DeepFormCost -> Counting.depth dimension;
both -> ElementaryDivisors -> Columns marked index -> short_forms -> star.
Candidate mathematical replacement of ZerosCostDegree via weighted basis
does not assert kernel dependency deletion. Original source retained.
RESUME HERE: independent audit of exact residue embedding, same-weight
minimum and weighted-basis ideal powers, and native caller verification
of both dimension inequalities. Integration/editor combine RUN32/57/58
with pairing/projector at the SAME hasType_twisted_hecke caller; next
untranslated A supplier is actual stage support or Schur charge transfer,
check current theta notes before selecting. Keep all other A/B/C frontier
items explicit. No new competing runner or protected edits.
HANDOFF TO theta, integration, editor, audit, kernel.
-/

namespace CompactPrimeRun58

-- Exact degree padding scalar interface; not the full polynomial injection.
theorem packing_degree (m k s : ℕ) (hm : 0 < m) (hs : s / m ≤ k) :
    m*k ≤ s + m*(k-s/m) ∧ s + m*(k-s/m) < m*(k+1) := by
  have he : m*(k-s/m) + m*(s/m) = m*k := by
    rw [← Nat.mul_add, Nat.sub_add_cancel hs]
  have hmod := Nat.mod_lt s hm
  have hd := Nat.mod_add_div s m
  constructor <;> nlinarith

theorem exact_excess_boundary (h N k e : ℝ)
    (he : e ≤ N*(k+1)) : h+e ≤ h+N*(k+1) := by linarith

end CompactPrimeRun58

#check TwistingData.finrank_excessCond_le_volume
#check TwistingData.index_mul_finrank_excessCond_le
#check TwistingData.exists_le_weight_of_mem_deepForms
#check TwistingData.sum_finrank_deepForms_le
#print axioms exists_le_cost_of_vanishing
#print axioms TwistingData.finrank_excessCond_le_volume
#print axioms TwistingData.exists_le_weight_of_mem_deepForms
#print axioms CompactPrimeRun58.packing_degree

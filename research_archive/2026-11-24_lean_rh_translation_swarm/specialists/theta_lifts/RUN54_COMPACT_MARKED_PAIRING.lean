import Mathlib

/-!
# RUN54 — marked Hecke elementary divisors: direct repaired determinant
26 November 2026. Human source-matched derivation and a candidate shorter
proof of the actual pairing lemma, NOT native-compiled.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; unified witness
7ad9c7c64f53c621ad20422226ad9d0b756ee28e; current manuscript
b2f589b5fe6c96a650f3fd30c654e0d0bbdc05c3.
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES.
Prior own RUN53 40e57948; peer prime RUN56 36a56d6c reconstructs
Schur jet valuation, explicitly leaves marked elementary divisors open.
Reviewed latest kernel f4015a87, graph bb09b6c2, editor 0807db85,
B d0f9a536 and Landau b18678e2. Do not duplicate their work.

Actual source ledger (relative to grh-compact/src):
New/TwistedHecke/ElementaryDivisors.lean 1373fd6d510b5df87bfde3b6a0d7bdce4c7ee307
  card_le_finrank_translatesIn, of_pairing, exists_depth_factorization,
  exists_projector, hasType_twisted_hecke
New/TwistedHecke/Counting.lean 42f70c497698b45ac20533664cb50929222151b9
  HeckeSizes, index_mul_finrank_excessCond_le, sum_finrank_deepForms_le
New/TwistedHecke/RootLemma.lean 0b933c458f7ccf3ee856dfda11a145a846d667b7
  root_lemma (still a supplier)
New/TwistedHecke/FrobeniusFactors.lean c6cb25c36279a298cf4de03a6b788786354e00f3
  pow_dvd_coeff_conj_frobOperator (still a supplier)
New/TwistedHecke/InterlacingCone.lean 23d3fd2c39ef5ee3c3ce7e908436b86cff7e2676
  prod_mul_volume_inter_slab (still a supplier)
New/Core/ModuleIndex.lean 214cc116f97852925f444db42bfa36cf563af508
  IndexDvd.of_det_dvd, comp, map, HasType.prod
New/Columns/TwistedHeckeType.lean ccae44b8b21d1bface80bc3c8b10370a48c8ea48
  Columns.hasType_markOperator
New/Columns/MarkedPrimeType.lean 5433d457d06b8f0e209209be1407fe1971ef86f8
  Data.IsMarked.hasType_markOperator
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
  Data.IsMarked.hasType_prod_markOperator_pow,
  Data.exists_indexDvd_Bmu_divisible
New/Columns/SizeEstimates.lean 0b666c5f3cead375b65b97c6af8a25675486b473
  allowedLoss, sum_allowedLoss_mul_log_le

## 1. Replace of_pairing by a single determinant witness

Keep exactly the native valuation-domain context O, residue field F,
finite ambient free module L, E=O^n and matrices Q,M:E->L,
R,beta:L->E, with RQ=1. Let A be the residue subspace
(X -> (map (residue O) T).translatesIn n G bottom B) in the source,
and assume the actual two hypotheses:
  beta M - a I has every entry in aw O;
  Q u - M v = aw F0 implies residue(F0) lies in A.
The latter follows from the source's coordinatewise translatesIn
hypothesis. w is a nonunit. The application has a=w^j !=0;
the zero-a case is also handled below. No assumption of a DVR,
discrete valuation, or finite residue field is needed here.

Since RQ=1, L=Q(E) direct sum ker R. The complement is a finite
projective module over the local ring O and hence free. In this
basis M has components B=RM and C=(1-QR)M. Apply Smith form to C:
choose an invertible V on E and a basis U_i of the complement
with C V e_i=t_i U_i for the nonzero diagonal entries, zero
otherwise. (For a rectangular matrix there are only as many
nonzero slots as the rank; zero slots require no U_i.) Classify
a slot i as low iff aw does NOT divide t_i. All zero slots
are high. By total divisibility, for a nonzero low t_i choose
s_i with aw=t_i s_i. In particular equality of valuations
is HIGH, unlike the larger non-strict counting set in the
original source proof. Let l be the number of low slots.

Every Q e_i has residue in A: take u=aw e_i, v=0, F0=Q e_i.
For every low slot take v=s_i V e_i and u=R M v. Then exactly
   Q u - M v = -C v = -aw U_i.
Thus residue(U_i) lies in A. The Q e_i and these U_i form a
subset of one integral basis of L, so remain independent
modulo the maximal ideal. Consequently n+l <= dim_F A.
This is the required dimension inequality with the strict
low count, not a dimension inferred from a determinant.

Define one square matrix H by columns:
   H_i = beta Q R M V e_i     if i is high,
   H_i = beta M V e_i         if i is low.
In the high case the difference beta C V e_i lies in aw O^n;
in the low case the original congruence applies directly.
Therefore H=a(V+w D) for an integral matrix D. The residue
of V+wD is the invertible residue of V, so det(V+wD) is a
unit in O. In the actual nonzero-a case det(H) is a^n times
a unit. Put S=diag(z if low, 1 otherwise). Every column of
HS is in beta Q(E)+z E: high columns already in beta Q(E);
low columns are multiples of z. The decisive identity is
   det(HS)=a^n z^l det(V+wD),       det(V+wD) in O^*.
By IndexDvd.of_det_dvd this proves EXACTLY the conclusion
of of_pairing: IndexDvd top (im(beta Q)+z top) (a^n z^l),
with n+l<=dim_F A. No second determinant comparison, no
auxiliary image-repair matrix, and no added term in the budget.
For a=0 the same construction works (H=0 if n>0 because the
chosen columns vanish by the two congruences; for n=0 det=1).
The dimension argument still holds, with s_i=0 if needed.
Alternatively the zero matrix and target scalar 0 suffice
for the determinant part when n>0. No cancellation of a
or z is needed, even when z=0.

This is a candidate replacement of the body of the actual
of_pairing, not a claim that the global native graph has
already changed. It uses ordinary Smith form, local projective
freeness, and native IndexDvd.of_det_dvd; original proof used
a Smith factorization of ((Q R M - M) R) plus a separate
image-index composition. Direct complement Smith reduces the
human argument while preserving exact hypotheses.

## 2. Reconstruct the depth determinant without a discrete valuation

Let J be the native stacked matrix in exists_depth_factorization:
for e=(source class, parahoric representative), block
   J_e(F)=D_w rho(g_e) F(source e),
where D_w=diag(w^depth(beta)), rho=letterRep.
If a scalar t divides all coefficients of JF, it divides every
coefficient of D_w rho(g) F(x), for every x and every g in GL_k(W).
Indeed the covering hypothesis gives g_e g^-1 in the parahoric.
The entrywise divisibility p_dvd_letterMatrix_of_mem_parahoric,
w^2=p, and symmetric tensor multiplication make
D_w rho(h) D_w^-1 integral for h and h^-1 in that parahoric.
Multiplying by this integral matrix transports divisibility
from the representative to any frame. This is exactly hf in
the source; retain the parahoric letter divisibility theorem.

The stacked map has full column rank: coverage includes every
class, each diagonal D_w is invertible over the fraction field,
and rho(g) invertible. Primitive Hermite factorization J=Q d
gives RQ=1; choose Smith invariant factors t_i of d, with
primitive source vectors v_i a basis. Thus t_i divides Jv_i,
and the preceding transport works for all frames. Taking g=1
and an integral unit coordinate of v_i, with depth<=x, proves
t_i divides w^x. Let k_i be the least integer j in [0,x] such
that t_i divides w^j. Then
   k_i = sum_(tau=0..x-1) 1_(t_i does not divide w^tau).
For a slot with t_i not dividing w^tau, every translated
coefficient of v_i at depth<=tau is in the maximal ideal:
if it were a unit, t_i dividing w^depth times that coefficient
would force t_i dividing w^tau. Hence its residue belongs to
the native deepForms tau. The selected v_i are independent
modulo the maximal ideal because they are part of a basis.
At each tau their number is at most the dimension of the
space of class-indexed deepForms tau. Summing over tau gives
   det d divides w^(sum_(tau<x) dim_F(X -> deepForms tau)).
This is the exact source determinant bound with no assertion
that t_i is literally a power of w. The argument uses only
integer rounding of divisibility, not a discrete valuation.

## 3. Reconstruct the excess condition on the primitive image Q

Fix the native index i of a letter, adjacent a<r and the
linear excess functional L(beta)=excessWeight_i(a,r). For any
input j, choose F with JF=w^x Qj: this is possible since all
Smith factors of d divide w^x, as proved above. For each
class separately, define the weight omega on variables
   omega = deepIndicator_r - excessWeight_i(a,r)/2,
so W(beta)=depth(beta)-L(beta)/2.
For each monomial beta, let l_beta be the largest integer
up to max(0,ceil(x-W(beta))) for which every GL_k(W) translate
of F has its beta coefficient divisible by w^l_beta.
This is a finite bounded search, including zero coefficients,
and works even in nondiscrete valuation rings. All coefficients
in all translates lie in their corresponding powers; also
w^depth(beta) times the coefficient is divisible by w^x
from the parahoric transport in section 2.

Let m0=min_beta(l_beta+W(beta)). If m0<x, a minimizing beta
cannot be at the upper cap, since the cap plus W(beta) is
at least x. Hence some translate realizes a coefficient not
divisible by w^(l_beta+1). All translates of this very same
polynomial satisfy the Gauss filtration lower bound m0.
Apply the native root_lemma with the constant block map
(tau=0, entire GL group), weight omega and this coefficient.
The source proves its weight-difference guard [2/5,8/5]
from excessWeight_mem_Icc and deepIndicator. The conclusion
is L(beta)<=0. Thus W(beta)>=depth(beta), implying
l_beta+depth(beta)<x, contradicting w^x-divisibility of
the weighted coefficient (cancel w^depth, w!=0 and
w nonunit). Therefore m0>=x.

For every beta, each translated coefficient of F is divisible
by w^max(0,ceil(x-W(beta))). Multiplying by w^depth(beta)
gives divisibility by w^ceil(x+L(beta)/2) whenever L(beta)>0
(the exponent with nonnegative ceiling is understood).
If L(beta)>h>=2c, this is at least w^(x+c). Cancelling w^x
shows the corresponding primitive-image coefficient is
divisible by w^c. Apply this to the actual e and all Levi
translates: D_w commutes with the Levi representation because
deepIndicator is constant on its blocks (with the native
letter orientation); hence the coefficients of Qj obey
excessCond n a r (span{w^c}) h. Repeat for every letter i,
not independent choices of Q. This completes the human
depth-factorization argument CONDITIONAL on the named
parahoric/weight and root lemma suppliers; it does not prove
the latter from scratch.

## 4. Exact propagation to the marked-prime caller

At hasType_twisted_hecke take n0=|X||I|, D0=|Monomials|^N,
A0=(k+k^2)o0 N^2 and c=2A0+2. The source's two depth
factorizations on the two actual coset systems use the same
w and c. Their combined determinant cost is
   w^(2(1+z) n0) in valuation notation,
i.e. at most p^((1+z)n0) since w^2=p. Here a real bound
denotes an upper bound on the actual integer sum, not
a ring element raised to a real power.

The projector supplier is still required: exists_projector
gives a diagonal b, Z with the exact excess conditions and
bZ pairing modulo w^c against vectors of lower excess
threshold y-(4c+2), with main pairing scalar p^A0.
The native beta and M in of_pairing are formed from Q',
b, Z, the block-diagonal u matrices and R'; retain the
transpose-intertwining property of b in hY. The actual
pairing congruence modulus aw=w^(2A0+1) is weaker than
w^c. The difference condition uses the excess submodule
closure and 6c+2<=y, so both primitive images satisfy
the required thresholds. No choice of different coset
families or column operators is allowed.

There are |X||H| times [GL:parahoric] class blocks in the
ambient pairing. By index_mul_finrank_excessCond_le their
residue condition has dimension <= (1+kappa)n0, using
I equiv Monomials^N times H. Thus section 1 yields
l<=kappa n0. Taking z of section 1 to be p^m (m is the
native truncation exponent of HasType), the pairing
determinant costs p^(A0 n0 + m l). Adding the two depth
determinant costs and applying the original IndexDvd.comp/map
and hY gives the required budget:
   [(1+z)+A0] n0 + m l
      <= (z+kappa*m+y)n0,
because A0+1=c/2<=y. Here z is HeckeSizes.z, not the
auxiliary ring scalar. No new denominator, no independent
optimization, no changed local place or twist. The original
tensor identification and pushforward through f are retained.

This feeds Columns.hasType_markOperator at its actual
TwistingData/HeckeSizes witnesses, and thence
Data.IsMarked.hasType_markOperator with the native per-place
coefficient 128 A_l logB/(m_lift p) + s/x^14 + x^40.
LocalStatement.hasType_prod_markOperator_pow still sums
the original bounds over all marked l and all m_lift lifts,
and Data.exists_indexDvd_Bmu_divisible still uses the SAME
S=image(Y^m_lift)+p^jetCeil M, uniformly in twists/datum.
The previously derived collision bypass and prime RUN56 jet
bound are independent suppliers to the same caller.
No improvement of numerical constants is needed.

## 5. Actual execution and retained frontier

No local lean/lake executable. Native compact RUN29 state read:
compute/rh-compact-primitives-replay-20261126/status.json
a56e2d3afb99ed8275e81fd63c8494306e57c43f and
outputs/targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804.
Run 45803534769 status error; module_1_build JetExponentBound
returncode 124 after 2700.11 seconds. Six named B/C theorems
were checked with only propext, Classical.choice, Quot.sound;
none is a new A certificate. No native PASS for this work.
Old source-version rh_scan/rh_prune/rh_auto results do not
transfer automatically. No new CI job or protected file edit.

Executed Python exact determinant tests: 600 integer-localized
matrix cases, 193 equality pivots (high), 559 low slots,
1241 high slots, including 73 all-low and 234 all-high cases.
Also 3627 exact rational valuation threshold/count checks
and 5 negative controls. These validate only algebraic
regressions, not the abstract native module or RH.
Reproducer (SymPy, deterministic seed):
  from random import Random
  from sympy import Matrix,eye,zeros,diag
  from fractions import Fraction
  rng=Random(54261126)
  def randmat(n,m): return Matrix(n,m,lambda i,j:rng.randrange(-5,6))
  def unimod(n):
   V=eye(n)
   for _ in range(3*n):
    if n>1:
     i,j=rng.sample(range(n),2)
     V[i,:]=V[i,:]+rng.randrange(-3,4)*V[j,:]
   return V
  def val(a,p):
   a=abs(int(a))
   if not a:return float('inf')
   k=0
   while a%p==0:a//=p;k+=1
   return k
  N=equality=low_count=high_count=all_low=all_high=0
  for p in (2,3,5,7,13):
   for n in range(1,6):
    for rep in range(24):
     d=rng.randrange(1,n+2); A=rng.randrange(0,4)
     w=p**rng.randrange(1,3); a=p**A; aw=a*w; z=p**rng.randrange(0,5)
     V=unimod(n); U=unimod(d); C0=zeros(d,n); low=[]
     for i in range(min(n,d)):
      e=rng.randrange(0,A+val(w,p)+3)
      if rng.randrange(5):
       C0[i,i]=p**e; equality+=e==A+val(w,p)
       if aw%int(C0[i,i])==0 and int(C0[i,i])%aw!=0:low.append(i)
     C=U*C0*V.inv(); L=randmat(n,d); D=randmat(n,n)
     B=a*(eye(n)+w*D)-L*C; beta=B.row_join(L)
     M=eye(n).col_join(C); Q=eye(n).col_join(zeros(d,n))
     assert beta*M==a*(eye(n)+w*D)
     P=beta*M*V; F=B*V; H=F.copy(); S=eye(n)
     for i in low:H[:,i]=P[:,i]; S[i,i]=z
     assert all(int(t)%aw==0 for t in H-a*V)
     assert val(H.det(),p)==A*n
     assert val((H*S).det(),p)==A*n+val(z,p)*len(low)
     for i in low:
      v=(aw//int(C0[i,i]))*V[:,i]
      assert Q*v-M*v==aw*zeros(n,1).col_join(-U[:,i])
     for i in range(n):assert Q*(aw*eye(n)[:,i])==aw*Q[:,i]
     assert abs(int(diag(eye(n),U).det()))==1
     N+=1; low_count+=len(low); high_count+=n-len(low)
     all_low+=len(low)==n; all_high+=not low
  assert (N,equality,low_count,high_count,all_low,all_high)==(600,193,559,1241,73,234)
  K=0
  for x in range(13):
   for den in range(1,10):
    for j in range(x*den+1):
     t=Fraction(j,den); k=(j+den-1)//den
     assert sum(t>tau for tau in range(x))==k and t<=k
     K+=1
  assert K==3627
  for p in (2,3,5,7,13):
   Q=Matrix([1,0]); M=Matrix([1,1]); beta=Matrix([[0,p]])
   assert (beta*M).det()==p and (beta*Q).det()==0

Original local graph (source-level, not elaborated):
Data.short_forms <- exists_indexDvd_Bmu_divisible
<- hasType_prod_markOperator_pow <- IsMarked.hasType_markOperator
<- Columns.hasType_markOperator <- hasType_twisted_hecke
<- {of_pairing, exists_depth_factorization (twice), exists_projector,
    index_mul_finrank_excessCond_le, sum_finrank_deepForms_le}.
Reduced candidate: same outer graph, replace of_pairing internal
repair/composition by complement Smith and one determinant; replace
depth proof by the threshold sum and least capped weight argument.
Retain root_lemma, class means, Frobenius factors, projector and cone
bounds, all source transport, axioms and unresolved native nodes.
Context key (compact pin, actual D,P,p,l,T,W,O, marked set, coset
systems, actual truncation, same good datum family). No global pruning,
no new axiom, no RH theorem imported. No independent native verification.

RESUME HERE: reconstruct exists_projector at the EXACT excess thresholds,
including the class-mean diagonal forms and Frobenius coefficient
divisibility; then the two dimension bounds via InterlacingCone.
Audit the depth weight guard against RootLemma; use native fallback
until the replacement of_pairing is independently kernel-checked.
Previous RUN53 conjugate-frame/central-equivariance audit remains open.
HANDOFF TO integration/editor, audit, kernel and prime-window:
pairing lemma candidate and full conditional depth factorization
human derivation now available; do not mark A or human RH complete.
-/

namespace RHTheta54
open Matrix

/-- Scalar determinant part of the proposed repaired-column witness.
The unit inverse is supplied by reduction modulo the maximal ideal. -/
lemma repaired_det_dvd {O E : Type*} [CommRing O] [Fintype E] [DecidableEq E]
    (V D S : Matrix E E O) (a w z u : O) (l : ℕ)
    (hS : S.det = z ^ l) (hU : (V + w • D).det * u = 1) :
    ((a • (V + w • D)) * S).det ∣ a ^ Fintype.card E * z ^ l := by
  refine ⟨u, ?_⟩
  rw [Matrix.det_mul, Matrix.det_smul, hS]
  calc
    a ^ Fintype.card E * z ^ l =
        (a ^ Fintype.card E * z ^ l) * ((V + w • D).det * u) := by rw [hU, mul_one]
    _ = _ := by ring

lemma pairing_excess_budget (n l kappa : ℝ)
    (h : n + l ≤ (1 + kappa) * n) : l ≤ kappa * n := by
  linarith [show (1 + kappa) * n = n + kappa * n by ring]

lemma marked_budget (n l m A z y kappa : ℝ)
    (hn : 0 ≤ n) (hm : 0 ≤ m) (hl : l ≤ kappa * n)
    (hy : A + 1 ≤ y) :
    (1 + z + A) * n + m * l ≤ (z + kappa * m + y) * n := by
  have h1 := mul_le_mul_of_nonneg_left hl hm
  have h2 := mul_le_mul_of_nonneg_right hy hn
  nlinarith

end RHTheta54
#print axioms RHTheta54.repaired_det_dvd
#print axioms RHTheta54.pairing_excess_budget
#print axioms RHTheta54.marked_budget

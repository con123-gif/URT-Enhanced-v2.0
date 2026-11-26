import New.DiscreteSeries.GaussianShape

/-!
# RUN57 — conjugated minor and normalized Gaussian estimate
26 November 2026. Human source-matched derivation; independent audit and new Lean replay pending.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0 Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; RUN56 3bd2eee96a85e6b8fa6a0fc819cebcaccb60946e.
Latest manuscript d185408f9b17703c84b1584444bfde1f65d57e74; editor e7cdaea4 (local cut),
geometry c394200f (packet mass), dependency 05e90181 (C covariance), theta 663c88ca (A)
are distinct from this near-identity argument. Read mission, AGENTS, protocol, queue, continuity.
No physics or URT; no RH root import. Keep original source graph and all earlier work.

## 1. Actual minor caller, mask and same witness
New/DiscreteSeries/MinorExpansion.lean blob 772d0fa5ac3e3b6bfbd4cf90c181e3e1ad359acb,
exists_principalMinor_eq_exp. Keep hg : l.HasGap h, g in U(S), X=g-I,
d=||X||_F<1/1000. S is the sign diagonal; P projects on a lower l-set,
R=I-P. k in maxCompactU, Q=kPk*, a=||[P,X]||, b=||[P,k]||.
Set r=lowerMask epsilon l X, u=lowerMask epsilon (-l) X,
y=(I-u)g(I-r), Z=y-I. Both masks retain strictly triangular entries within
sign blocks, so ||u||,||r||<=d, det(I-u)=det(I-r)=1.
Expansion Z=X-u-r-uX-Xr+ur+uXr gives ||Z||<=3d+3d²+d³<=4d.
g,(I-u)g,y are accretive (also adjoints), since their distance to I is <1.
Use the actual flenstedJensen_shift_eq_conj twice, first u and then r*
on ((I-u)g)*; this gives FJ(1,y)=FJ(1,g)=dsCoeff(g).
Supplier FramedCoefficient.lean 301a17ed7f41e384178a00ba28c4545ba6f2c1e3,
shift uses native flenstedJensen_eq_of_accretive and opposite-Borel
minor invariance. These representation-theoretic suppliers remain explicit,
not independently reconstructed in this run.

With indices ordered by increasing l, u is strictly upper triangular
and r strictly lower triangular (zero outside sign blocks).
For a terminal l-set (in particular R), the terminal rows of I-u
have zero entries in the initial columns and the terminal columns of
I-r have zero entries in the initial rows. Hence
 det(y_RR)=det((I-u)_RR)det(g_RR)det((I-r)_RR)=det(g_RR).
Also det y=det g. Both identities hold for empty/full sets.
This is the actual complement-minor equality, not an assumed equality
of arbitrary conjugated minors.

## 2. Three compressions: exact quadratic sign before norms
Let A=[P,X], B=[P,u], C=[P,r], D=B+C, W=A-D.
The mask commutators are entrywise masks of A, so ||B||,||C||<=a.
D is exactly the same-sign part of A and W the opposite-sign part;
||W||<=a. Thus SAS=D-W=A-2W and tr(DW)=tr(WD)=0. In particular
 tr(A²)-2tr(W²)=tr(SASA).                                      (1)
From the exact expansion of Z, the product rule for commutators gives
 ||[P,Z]-W|| <= (6d+3d²)a <=7da.
Indeed three quadratic products contribute at most 2da each,
and the cubic product contributes at most 3d²a.
Since k is unitary and commutes with S, ||Q-P||=b and
 ||[Q,Z]-W||<=7da+8db<=16d(a+b).
The matrix [Q,P] is same-sign and W opposite-sign, giving
 tr([Q,P]W)=0 exactly.

Apply RUN56's source-matched compression lemma (original 100 constant)
to (R,R,X,-A,c=a), (R,R,Z,-W,c=4a),
and (Q,P,Z,W,c=4(a+b)), respectively. It gives errors x,z,t
with |x|<=100da², |z|<=6400da², |t|<=6400d(a+b)².
All original projection, norm, orthogonality and delta<=1/2 premises
are supplied above; no independent choice of y is made for each P,k.
Writing Lg=logOneAdd X, Ly=logOneAdd Z, the three determinant exponents:
 logdet compress R,g = tr(R Lg)-tr(A²)/4+x,
 logdet compress R,y = tr(R Ly)-tr(W²)/4+z,
 logdet compress Q,y = tr(P Ly)-tr(W²)/4+t.
Here 'logdet' means an exponent whose exponential equals the
determinant, NOT a globally chosen logarithm.
The first two determinants are equal by the complement identity,
and exp(tr Ly)=det y=det g=exp(tr Lg).
Multiply/divide these nonzero exponential identities, not their
logarithms, to eliminate Ly and obtain
 principalMinor(k*y k,p)
 = exp(tr(P Lg)+(tr(A²)-2tr(W²))/4+t+z-x).
Conjugation transport is det(I+P k*Zk)=det(I+QZ), using det(I+UV)=det(I+VU).

Since g*=Sg^(-1)S and SP=PS, putting V=g^(-1)-I gives
 A*=S(A+E)S, E=VA+AV+VAV.
The inverse norm bound ||V||op<=d/(1-d)<=2d implies ||E||<=5da.
Using (1),
 tr(SASA)=||A||²-tr(E SAS).
The total error e=t+z-x-tr(E SAS)/4 therefore satisfies
 |e|<=d[6500a²+6400(a+b)²+(5/4)a²]
      <=200000d(a²+b²).
This is precisely exists_principalMinor_eq_exp with its original
constant and one y, for every admissible p and k. No dependence on
dimension or individual eigenvalue approximations enters the error.
Retain the native accretive-shift supplier as noted in section 1.

## 3. Gaussian aggregation at the actual integral consumer
New/DiscreteSeries/GaussianShape.lean 37f359a0100b2ed6b67b4256af5e976bbbb19259,
dsCoeff_gaussian_shape, hypotheses Nonempty n, HasLargeGap A,
|l_i|<=L, ||X||<=delta, T>=1,n²,n² log(n+L+1), delta*T<=10^-12.
RepresentationDefs.lean 94fea15fbc65ed74c2a44e83dda2cd423d39fbea
gives Lambda=lowestKType=mu-2rho_c, mu=paramAddRho l, w=-mu,
FJ(1,y)=integral |weightMinors(Lambda,k)|²/weightMinors(w,k*y k) dk / H0,
H0=integral |weightMinors(Lambda,k)|² dk, Haar probability.
Native hg.paramAddRho_lt_iff ensures all thresholds of w are lower l-sets.
Use section 2 at EVERY threshold, then RUN56's exact layer identities.
The determinant power in weightMinors cancels the added a0=sum|w_i|
in the trace sum, since det y=det g. Define E0=tr(diag Lambda Lg),
q=gapWeightedNormSq(w,X)/4, v=gapWeightedNormSq(Lambda,k)/2.
The result is
 weightMinors(w,k*y k)=exp(q-E0-r_k),
 |r_k|<=200000 delta [4q+gapWeightedNormSq(w,k)] + 2delta n².
The last term is |tr(diag(2rho_c)Lg)|<=2delta n²:
|2rho_c,i|<=n, Frobenius norm of Lg<=2delta, n^(3/2)<=n².
Also |w_i-w_j|<=|Lambda_i-Lambda_j|+2n, so using ||k||_F²=n,
 gapWeightedNormSq(w,k)<=2v+2n².
Consequently the exact native budget (retaining its constants) is
 |r_k|<=10^6 delta(q+v+n²).                                  (2)
The sign of r is chosen to match the inverse minor formula; the
absolute bound is unchanged. The common phase E0 has not been bounded.

## 4. Normalization and integrated small/large error
TailBounds.lean 3c13565c8bfecf91497747b0fe7cd7e39e50369c,
measure_ball_le_integral_dsCoeff, with compact inclusion and r=1.
Native dsCoeff_of_mem_maxCompactU identifies its integrand with
|weightMinors(Lambda,k)|². Every k has operator norm 1.
Thus 1<=4(2000(n+L+1)^6)^(2n²) H0, with H0>0.
Taking logs, log4<2, log2000<8, and the actual T guards give
 log(1/H0)<=2+16n²+12n² log(n+L+1)<=30T.
This derives the normalization bound from the actual covering/Lipschitz
supplier. That supplier and representation identity remain native
inputs; do not count them as independently translated here.

Set kappa=exp(-q) in (0,1]. The integral formula gives the exact identity
 dsCoeff(g)/exp(E0)-kappa
 = kappa/H0 * integral |weightMinors(Lambda,k)|² (exp(r_k)-1) dk.
On |r_k|<1/20, |exp(r_k)-1|<=exp(1/20)-1<1/10
(e.g. exponential series bounded by geometric series).
The integral over this region is bounded by kappa/10 because the
nonnegative weight divided by H0 has total mass one.
On its complement put U=q+v. From (2), delta*T<=10^-12, n²<=T,
 1/20<=10^-6(U/T+1), hence U>=49999 T.
RUN56's unitary-minor bound gives |weightMinors(Lambda,k)|²<=exp(-v).
Using |exp r-1|<=2exp(|r|) and (2), the normalized error integrand
is at most
 2 exp(30T-U+10^-6(U+1)) <= exp(-100T),
since T>=1, U>=49999T and log 2<=1.
Integrating the latter over a subset of the probability space gives
 EXACTLY ||dsCoeff(g)/exp(E0)-kappa||<=kappa/10+exp(-100T).
This supplies the actual Gaussian theorem needed twice in
IsTwoFactor.laplace_method (RestrictionLemma.lean
3d34e61d993473d314a9af56d55f0444a874aab6), with same phase and
no new constants, and closes the near-identity analytical algebra
conditional on the explicit native representation/covering inputs.

## Dependency and execution ledger
Original source-level path (not elaborated kernel DAG):
 B -> filling -> Bessel system -> isBesselFunction -> laplace_method
 -> dsCoeff_gaussian_shape -> {exists_principalMinor_eq_exp,
 norm_weightMinors_sq_le_exp, sum_norm_lie_coordProj_sq,
 kTypeNormSq_pos, measure_ball_le_integral_dsCoeff}.
 exists_principalMinor_eq_exp -> {flenstedJensen_shift_eq_conj,
 exists_det_compress_eq_exp_logOneAdd, mask/conjugation identities}.
Candidate human replacement graph:
 {strict triangular masks, native accretive-shift, RUN56 compression,
 exact sign trace identity} -> principalMinor;
 {principalMinor, RUN56 layer/decay, native compact coefficient and
 covering bound, probability error split} -> dsCoeff_gaussian_shape
 -> actual two-factor caller.
No global dependency deletion; representation and covering primitives,
all previous A/B/C gaps, axiom and graph evidence preserved.
Local command -v lean and -v lake returned no executable. No native
rh_scan/prune/reduce/auto/frontier this run. Historical state records
45577239749 (b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc) and
45576756833 (7da354941e402b6f8b364ed03d8c5c82d27b7717) fetched,
both status pass, original pin only. Compact RUN28 targeted success
reported in mission; no new native PASS, no new axiom audit.

Actual local Python/SymPy checks (regressions only):
160 exact mask/trace identities for all 16 sign patterns and 5 cuts,
using X=[[2,3,-1,4],[-3,0,2,1],[1,4,0,-2],[3,1,4,2]].
For each P=diag(1_(i<cut)), masks r,u keep same-sign lower/upper
entries. Assert tr(A²)-2tr(W²)=tr(SASA) and expanded commutator
of Z minus W equals -[P,uX]-[P,Xr]+[P,ur]+[P,uXr].
10100 exact Fraction tail checks T=1..100, U=49999T+j,j=0..100,
assert 1+30T-U+(U+1)/10^6<=-100T.
10201 exact Fraction minor budget checks a,b=0..100,
assert 6500a²+6400(a+b)²+5a²/4<=200000(a²+b²).
Zero violations. These are exact abstract algebra regression checks,
not substitutes for native matrices or universal proof.

RESUME HERE: integrate sections 1–4 with RUN55 and RUN56 at the
actual two-factor caller. Independently audit sign of exponential
division and all mask support. Next derive compact covering
measure_ball_le_covering and the explicit dsCoeff Lipschitz bound
from TailBounds (including Casimir derivative and curve), or the
boxed-frame separation if that is the remaining B primitive.
HANDOFF TO: geometry, editor, audit, kernel. Batch scalar candidates
below in permitted shared compact verification; do not alter workflows.
-/

namespace CompactRun57
lemma minor_budget (a b : ℝ) :
    6500*a^2 + 6400*(a+b)^2 + (5/4)*a^2 ≤ 200000*(a^2+b^2) := by
  nlinarith [sq_nonneg (a-b), sq_nonneg a, sq_nonneg b]

lemma gaussian_error_budget (q v N : ℝ) (hq : 0 ≤ q) (hv : 0 ≤ v)
    (hN : 0 ≤ N) :
    200000*(4*q+2*v+2*N)+2*N ≤ 1000000*(q+v+N) := by
  linarith

lemma gaussian_large_error (T U : ℝ) (hT : 1 ≤ T)
    (hU : 49999*T ≤ U) :
    1 + 30*T - U + (U+1)/1000000 ≤ -100*T := by
  linarith

lemma gaussian_normalization_budget (T N A : ℝ)
    (hT : 1 ≤ T) (hN : N ≤ T) (hA : A ≤ T) :
    2 + 16*N + 12*A ≤ 30*T := by
  linarith

#print axioms minor_budget
#print axioms gaussian_error_budget
#print axioms gaussian_large_error
#print axioms gaussian_normalization_budget
end CompactRun57

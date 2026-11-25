import Development.AutomorphicArithmetic.MeanSquareBounds.meanSqK
import Development.AutomorphicArithmetic.MeanSquareBounds.MeanSqAbs
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN34, 25 Nov 2026. Human source-matched replacement for the actual
meanSqK supplier (conditional on the original upstream analytic
lemmas); scalar/finite pair Lean certificate PREPARED, NOT COMPILED.
RH OPEN. Do not substitute into the live proof until audit.

Preflight: current mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc,
SWARM/HANDOFF/EXPANSION/AGENTS and continuity records, live manuscript
464e82f81f646d4af85e1f5f70d379026df46261, RUN33 7b758b50.
Latest peers read: 46b28d29 (principal degree), 3003c0aa (reduced slice),
d41c3276 (raw row counts), d0ca7069 (density telescoping), 5d85634d
(character density); no overlap with this finite Gram reduction.
Pinned source 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream
head observed d91ae2678eea19a0c3045ffca37f1da757c2e719, 13:24 UTC,
merge batch 19 #3142. Old paths meanSqK, MeanSqAbs, twistK all returned
404 at new head; no assertion about their new names or semantics.
All mathematical sources below use only the original pin.

COMPACT HUMAN PROOF BLOCK. Fix the exact premises of QH.meanSq_abs
except its uniform per-prime B bound (not needed in this replacement).
N=floor_nat Z, finite P of primes q>N^2 all in the same class a0 mod
m0, 8|m0, gcd(a0,m0)=1, y>=0, eta>=0, |kappa(n)|<=1. Let c(n)
=Lambda(n) min(1,y/n). For each prime power n=p^j <=N set its key
k(n)=p if j odd and p does not divide m0, and k(n)=1 otherwise.
All other c(n)=0. The native jacobi_class and soutPart_prime_pow
give a fixed sign sigma_n in {+-1}, independent of q in P, with
 Jacobi(n,q)=sigma_n Jacobi(q,k(n)).
In particular the sign is not replaced with its absolute value
before aggregating. Put A_k=sum_{n:k(n)=k} sigma_n c(n) kappa(n).
The support K of keys is contained in {1} union primes <=N not
dividing m0; use all those keys including zero coefficients.
Then S_q=sum_{k in K} A_k Jacobi(q,k). For each k in K the latter
Jacobi symbol has modulus one since q>N^2. Thus exactly
 sum_q |S_q|^2 = |P| sum_k |A_k|^2
   +2 sum_{k<l} Re(A_k conj(A_l)) sum_q Jacobi(q,k*l).
Every off-diagonal product k*l is odd, squarefree, coprime to m0,
>1 and <=N^2. Moreover distinct unordered pairs have distinct
products: prime products correspond to (1,p); composite products
are precisely products of two distinct primes. Unique factorization.
Consequently the single exceptional squarefree kernel nstar
can corrupt AT MOST ONE unordered off-diagonal pair. If it is
not supported, there is no exceptional pair. Its entire signed
contribution is <=2|P| |A_i||A_j| <= |P|(|A_i|^2+|A_j|^2)
<= |P| sum_k |A_k|^2. All remaining off-diagonal terms together
are <=eta|P| (sum_k |A_k|)^2 by the ORIGINAL hJ assumption
restricted to actual distinct key products. Hence one equation:
 sum_q |S_q|^2 <= |P| [2 sum_k |A_k|^2 + eta (sum_k |A_k|)^2]. (1)

This works also for P empty, N=0 or 1, nstar=0,1,2 or any
unsupported integer, with no division by |P|. It needs neither
a uniform per-prime bound B nor a split into prime/composite
exceptional cases, and no normalization max(nstar,2).
Because |A_1|<=RR(c,m0,N), and for each other key p,
|A_p|<=sP(c,N,p), sum |A|<=sum c, (1) implies
 sum_q |S_q|^2 <= |P|[2(RR^2+sum_{p prime<=N} sP^2)
                         +eta(sum_{1<=n<=N}c(n))^2]. (2)
The diagonal majorant counts all p (including those dividing
m0), which is safe. No extra coprimality of n is assumed.

Actual caller QH.meanSqK: existential C>0 chosen BEFORE eps,K;
for every 0<eps<=1, K>=1, exists Y0 such that all Y>=Y0 and
all U,m0,a0 satisfying admitted eps Y U m0 a0 and each prime
divisor p of m0 obeys p<=Y^(eps/5) OR (Y^K)^400<p. The conclusion
is MeanSq C Z PPset [Y,Y^K] for Z=(Y^K)^400. This includes EVERY
y in the interval and EVERY bounded complex kappa. Keep these
quantifiers. Choose the same thresholds as the native proof:
log Z<=sqrt Y, 2 log Z<=Y^(eps/6)/2, and twistK at A=800K,
B=K+1. Thus q>N^2 (from sqrt U<q and Z^2<=sqrt U) and
the original kernel estimate holds with eta=Y^(-K-1).
The same native RR_le, sPsq_le, sum_cN_le and sizes estimates
give R<=5 C1 sqrt y, sum sP^2<=C3*y*log y,
sum c<=C4*y*log Z. Since y>=3, log y>=1 and
eta*y*(log Z)^2<=Y^(-K-1)*Y^K*Y=1, (2) gives
 MeanSq with Cnew=50 C1^2+2 C3+C4^2>0.
This replaces the native C3+25 C1^2+4 C2^2+20 C1 C2+C4^2.
Not claimed numerically smaller: it is an existential constant.
The direct C2/exists_primePowerSum_le_mul_log consumer in meanSqK
can be removed. RR_le itself still uses this lemma, so no global
deletion of that supplier. Exact original meanSq_abs numerical
bound is NOT claimed implied by (2); replace at the existential
meanSqK caller, not at other consumers requiring its constants.
For the original theorem fallback all hypotheses and edges remain.

The retained twistK supplier is NOT a GRH assumption. At the
pin it takes positive eps,A,B, then uniform Y0, then each admitted
host, then ONE nstar before every s. Admission contains
(log Y)^2 log m0/4 <= log U, Y^(eps/6)<=log U <=
Y^(eps/5)(log Y)^2. In its native proof take L=log Y,u=log U,
ell=log(m0*Y^A). Admission and u>=Y^(eps/6) imply for large Y
u>=L^2 ell/8, log u<= (eps/5+2)L. Thus relative PNT errors
exp(-c u/log(m0*s)) and exp(-sqrt(c u)) and exceptional
non-close correction u exp(-c0 u/ell) beat any fixed Y^(-B).
The actual exceptional-character uniqueness is still required:
bad s has an exceptional real character restricting to Jacobi
on the classes 1 mod m0 and zero with 1-beta<c0/ell.
page_across + jacobi_separate prove at most one such s;
choose it (or 0). For other s twist_one cancels the class main
term by character orthogonality, leaving the relative error and
exceptional correction. count_a gives |PPset|>=U^(9/10),
so discarded primes <=sqrt U cost at most U^(-2/5)|PPset|.
The proof budgets 4r<=eta/8,2|k|<=eta/8,d<=eta/4;
twist_one <=(4r+2|k|)(|PPset|+sqrt U)<=5eta|PPset|/16
<=eta|PPset|. Keep actual PNTAPRelW, zero-free, exception bound,
page_across, jacobi_separate, twist_one, count_a suppliers and
their exact native assumptions; not independently reconstructed
all the way down in this run. No removal of PNT/zero-density
premises, nor proof of principal-character prime discrepancy.

SOURCE / GRAPH LEDGER (relative to src at original pin):
Development/AutomorphicArithmetic/MeanSquareBounds/
 meanSqK.lean 136f54f1321278b0ed23791fb2660ddd162bac97 lines
  25-48 sizes; 51-63 exact quantifiers and suppliers; 72-122
  host and hJ; 128-221 caller budget.
 MeanSqAbs.lean 5879874cae411e438076e9971740635a7f56335e
  8-14 exact statement; 19-58 meansq_expand, split, pairs_one/r.
 PrimeSetTwoBounds.lean 45616f33334b6ef360b18a8e64c0eb325f9463b8
  13-27 S, admitted, MeanSq.
 RRLe.lean dd50c4c7c23183245ab6e2731e9695179e53e780 9-14,19-99.
 twistK.lean 07e569eaf54b3b91fedad4117991838a23b93603
  11-22,31-39,148-159,172-176,229-281,292-end.
Formalism/GL3MeanSquares/GenusMeanAsymptotics/JacobiCharacterSums/
 MSqJac.lean aae22119484ea66d129aaa48e7b80e1c926aa500
  10-36 and 141-166 (fixed sign).
 MSqPairs.lean b719435fe6a773723586e6ad66ee2344c0f8c3be
  15-16,134-138,195-199,255-259,307-318 (old cases).
 MSqMain.lean 511e72ceee15f466ad8900660fa432f42fa8ae7f
  19-25 (cN support),38-53 (pair identity),55-154 (separate
  consumer meanSquareHypW_of_pnt remains untouched).
 MSqDiagA.lean 28ec0cfe0667ef26b02dc98aa7f2df9000d29ea1.
Actual source-visible supplier chain retained from RUN33:
supplyOfAdmOf -> pairEx -> pair_exists -> pair_share -> stage ->
meanSqK -> meanSq_abs -> meansq_expand/split,pairs_one,pairs_r.
Reduced candidate: same upstream chain -> meanSqK -> (1),(2),
jacobi_class,soutPart_prime_pow,prime unique factorization,
RR_le,sPsq_le,sum_cN_le,twistK and same threshold steps.
All unknown elaborated value/type/constructor edges and axioms
remain pending; no kernel-authenticated new reachability claim.
Cache context includes source pin, same host m0,a0,U, finite P,
N,y,eta,nstar,kappa. The one-pair argument cannot be reused with
multiple exceptional kernels without a new spectral bound.

Actual local Python 3 execution, exit 0: 146 distinct genuine
primes q from sieve to 240000; 6408 signed regrouping identities,
1851 distinct pair keys; 30192 exact integer-weight bounds and
30192 actual log-weight floating bounds (minimum slack
417.4260010371087). Exact tests use integer test weights, not
exact logs. Each eta is the observed maximum OTHER kernel
correlation divided by |P|, not the analytic Y^(-K-1).
These are regression checks on (1), NOT verification of twistK
or asymptotic estimates. Negative control: q=17, keys 1,3 with
A1=1,A3=Jacobi(17,3), gives energy 4 vs diagonal 2; factor two
cannot be universally deleted. Reproduce in Python:

import math
from collections import defaultdict
from itertools import combinations
Nmax=240000
sieve=bytearray(b'\1')*(Nmax+1);sieve[:2]=b'\0\0'
for p in range(2,math.isqrt(Nmax)+1):
 if sieve[p]: sieve[p*p::p]=b'\0'*((Nmax-p*p)//p+1)
primes=[p for p in range(2,Nmax+1) if sieve[p]]
def leg(n,q):
 t=pow(n%q,(q-1)//2,q);return -1 if t==q-1 else t
def jac(q,fs):
 return math.prod(leg(q,p) for p in fs)
checks=0; matches=0; exact=0; floats=0; qset=set(); minslack=math.inf
for N in (32,64,128):
 rows=[]
 for p in primes:
  if p>N:break
  n=p;k=1
  while n<=N:rows.append((n,p,k));n*=p;k+=1
 for m in (8,24,120):
  qs=[q for q in primes if q>N*N and q%m==1][:24];assert len(qs)==24;qset.update(qs)
  M=len(qs);groups={1}|{p for n,p,k in rows if k%2 and m%p};groups=sorted(groups)
  fs={a:() if a==1 else (a,) for a in groups}
  J={a:[jac(q,fs[a]) for q in qs] for a in groups}
  R=[]
  for n,p,k in rows:
   a=p if k%2 and m%p else 1
   sign=leg(n,qs[0])*J[a][0]
   for i,q in enumerate(qs):assert leg(n,q)==sign*J[a][i];checks+=1
   R.append((n,p,a,sign))
  corr={}
  for a,b in combinations(groups,2):
   key=a*b
   assert key not in corr
   corr[key]=abs(sum(x*y for x,y in zip(J[a],J[b])));matches+=1
  for y in (3,7,17,N):
   for mode in range(4):
    for use_log in (False,True):
     A=defaultdict(complex if use_log else int);raw=[0]*M
     for n,p,a,sgn in R:
      c=min(1,y/n)*math.log(p) if use_log else min(n,y)*(N//n+1)
      mult=(1 if mode==0 else (-1)**n if mode==1 else (-1 if n%3==1 else 1) if mode==2 else (1j if use_log and n%2 else -1 if n%2 else 1))
      z=c*mult;A[a]+=sgn*z
      for i,q in enumerate(qs):raw[i]+=z*leg(n,q)
     def sq(z):return z.real*z.real+z.imag*z.imag if use_log else z*z
     agg=[sum(A[a]*J[a][i] for a in groups) for i in range(M)]
     if use_log:assert max(abs(x-z) for x,z in zip(agg,raw))<1e-10
     else:assert agg==raw
     lhs=sum(map(sq,raw));D=sum(sq(A[a]) for a in groups);L=sum(abs(A[a]) for a in groups)
     for exc in [0,1,2,105,*corr]:
      etaM=max((v for key,v in corr.items() if key!=exc),default=0)
      rhs=2*M*D+etaM*L*L
      if use_log:assert lhs<=rhs+1e-8;floats+=1;minslack=min(minslack,rhs-lhs)
      else:assert lhs<=rhs;exact+=1
print(len(qset),checks,matches,exact,floats,minslack)
assert (1+leg(3,17)**2)**2==4 and 1+leg(3,17)**2==2
End Python.

Local Lean/Lake not present (command -v both empty). Retrieved
actual CI statuses: prior 45577239749 pass 98.87s blob
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and 45576756833 pass
77.94s blob 7da354941e402b6f8b364ed03d8c5c82d27b7717. These
are older engine/conditional root checks, not this replacement.
Original reduced root axioms propext, Classical.choice, Quot.sound,
324 pending scan nodes retained. No new native PASS. Scalar finite
pair bound below prepared, with actual native scan/prune commands.
Full signed grouping, unique-factorization pair map and caller
replay still need implementation and independent Lean check.

RESUME HERE: independently audit (1) and the exceptional edge
uniqueness, formalize grouping and replay at QH.meanSqK (not the
old fixed-constant meanSq_abs). Then reconstruct actual twist_one
and count_a inputs from the pinned relative PNT theorem, coordinate
with character_boxes' density/repulsion lane; preserve fallback.
HANDOFF TO integration/editor, formal audit, kernel and character
boxes. One proof block only, no new independent RH criterion.
-/

namespace RHExceptionalKernel34

theorem exception_pair {ι : Type*} [DecidableEq ι] (I : Finset ι)
    (u : ι → ℝ) (i j : ι) (hi : i ∈ I) (hj : j ∈ I) (hij : i ≠ j) :
    2*u i*u j ≤ ∑ k ∈ I, (u k)^2 := by
  have hs : ({i,j} : Finset ι) ⊆ I := by
    intro k hk
    simp only [Finset.mem_insert, Finset.mem_singleton] at hk
    rcases hk with rfl | rfl
    · exact hi
    · exact hj
  have hb := Finset.sum_le_sum_of_subset_of_nonneg hs
    (fun k _ _ => sq_nonneg (u k))
  have he : (∑ k ∈ ({i,j} : Finset ι), (u k)^2) =
      (u i)^2+(u j)^2 := by simp [hij]
  rw [he] at hb
  nlinarith [sq_nonneg (u i-u j)]

theorem aggregate_energy (E D X R P : ℝ)
    (hP : 0 ≤ P) (hX : X ≤ D) (hE : E ≤ P*(D+X+R)) :
    E ≤ P*(2*D+R) := by
  exact hE.trans (mul_le_mul_of_nonneg_left (by linarith) hP)

theorem replay (E D X R P : ℝ)
    (hP : 0 ≤ P) (hX : X ≤ D) (hE : E ≤ P*(D+X+R)) :
    E ≤ P*(2*D+R) := by
  first
  | (rh_reduce 2 using [aggregate_energy]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact aggregate_energy E D X R P hP hX hE

end RHExceptionalKernel34

rh_scan QH.meanSqK limit 2000
rh_scan QH.meanSq_abs limit 2000
rh_prune QH.meanSqK as RH34OriginalMeanSqKPruned
rh_prune QH.meanSq_abs as RH34OriginalMeanSqAbsPruned
#print axioms QH.meanSqK
#print axioms QH.meanSq_abs
#print axioms RHExceptionalKernel34.exception_pair
#print axioms RHExceptionalKernel34.replay

# RUN26 — uniform squarefree minorant replaces the Green local weight identities
25 November 2026. Lane 8. SOURCE-MATCHED human replacement implication, RH OPEN. Mission e0dc8f7faa1e35a5e3210b817b5b34f8d8cf20f1 read first, updated mission and preflight AGENTS, SWARM, HANDOFF, expansion, state/runner/continuity excerpts, CI #430 (45573722261, predates this work). Peer math three-cylinder reduction (fb122c58), join pruning (e1cd5d8f), rank aggregation (9532e2af), geometry RUN26, integration quasipolynomial reduction, dependency corGK frontier and structure RUN26 read. The three-cylinder reduction is already done by lane 2; do not duplicate. Earlier own RUN25 91a5aa50 retained exact Whittaker squarefree formula and lower Jacquet comparison on every label. This run weakens both together; no new global row estimate.

## One replacement hypothesis
Pin P=40e56bab026552e089d7afcfeff08d2defb9c005. Keep the actual source host, range, rank N, places I of cardinality f, labels and GoodAt condition. Put g=card K>1. For each actual place v let w_v(c)=wtOf D k (A.eVec k v) (monicOf c), c in K^N. Retain nonnegativity and normalization sum_c w_v(c)=1 (and the source zero-weight rule outside IsLabel when transporting arbitrary tuples). Instead of requiring an auxiliary Whittaker probability law, its exact squarefree formula, and comparison on ALL labels, it suffices that
    w_v(c) >= (1-1/g)*g^(-N)     for every c in sqSet K N.    (M)
For U slots one may instead take factor 1; otherwise all slots have factor 1-1/g. Here sqSet requires squarefree monic polynomial and nonzero constant. This is strictly a local replacement in locShare_le_Wg / weightAllRows_of; the source proof of (M) from the previous Green premises remains available. No change to other consumers of admLq or to the two-cylinder/global supplier. No assertion (M) holds for an arbitrary idempotent.

## Proof: uniform coefficient law
Let U(c)=g^(-N), the genuinely uniform probability on all monic coefficient vectors. The native proof of square_mass_lower_bound already establishes U(c)<=sqWeight(monicOf c) (factor degrees positive and sum N), and squarefree_count gives U(sqSet^c)<=2/g. There is no need to prove the exact normalization of sqWeight or to extend it to a probability.

In propW_of, retain the very same five sets S1,S3,S4(c0),S5(a),S6 and its hcover inclusion. All of S3,S4,S5,S6 lie in sqSet. Therefore their uniform probabilities are bounded above by the sums of the original sqWeight, and the original local_estimate_second, third, fourth, fifth give respectively
    U(S3)<=23 log(g)/sqrt(g);
    U(S4)<=1/(4 min(q1,d))+(1+log N)/(g-1);
    U(S5(a))<=7/8;
    U(S6)<=1-1/(5 log N).
The U(S1)<=2/g estimate was just proved. Under the product of independent uniform laws, the union of exceptional events in hcover thus has mass <= B, where
    B=2f/g+23 f log(g)/sqrt(g)+2fm*(1/(4 min(q1,d))+(1+log N)/(g-1))
      +(N/2)*(7/8)^f+exp(-f/(5 log N)).
These are exactly the source property_W terms, with no enlarged constant. Use floor(N/2)<=N/2 and 1-z<=exp(-z). All original finite-field, type-character and host arithmetic hypotheses of those estimates retained; N>=100 and g>=4096 as in RangeW. Let C be the complement of that union. It is contained in the native GoodAt event by hcover and consists only of squarefree tuples, since it excludes S1 in every coordinate. In particular U^f(C)>=max(0,1-B).

On C multiply (M) over the places, and sum. If j slots need the factor a=1-1/g and the others have the optional stronger factor 1, Q(C)>=a^j U^f(C), where Q=product w_v. Hence the actual bad mass satisfies the decisive inequality
    Q(not GoodAt) <= 1-(1-1/g)^j * max(0,1-B) <= B+f/g = Wg.  (*)
The second bound uses 1-a^j<=j/g<=f/g; if B>=1 it is trivial. This also proves the correct bound for all subsets of native bad tuples by the existing hred injection and nonnegative summation. Do not mistake this proof for independence of actual global rows: Q is only the native local MODEL product. The global count comparison, peer polynomial-distortion two-bad-count supplier, and all other TopG/ASK-MAIN and cohomology obligations stay open.

The original Green conditions imply (M) immediately on squarefree valid labels by sqWeight>=g^(-N), with the native lower comparison for J and exact U formula. But now the only representation-theoretic quantitative task needed here is the direct pointwise lower bound (M), not exact U formula or all-label comparison separately. No claims that the original representation-theoretic supplier has already been eliminated from the kernel DAG, that (M) is easier to prove for native idempotents, or that the retained local estimates are verified independently. Potential route: derive (M) directly from the rank-one contribution to the Gelfand–Graev multiplicity formula restricted to regular semisimple labels. No need for the nonsquarefree comparison in this branch. The prior lane result removed the upper comparison; this is a different strengthening of the reduction.

## Evidence and exact test
Pinned files fetched, blobs:
- src/Formalism/LocalToGlobal/GlobalTheory/ConcNWeight.lean 614c24bf786e29690c2202de789bbf35c2224196: sum_wtOf, wtOf_eq_zero_of_not_label, locShare_le_Wg (hred,hT,hW), weightAllRows_of.
- src/Formalism/PadicSubsetSums/StableGradedCounts/LocalEstimateIVOfTypeSetWeight.lean 3fe623b4437dbc893fb200b5d31dc54f5e73b947: sqWeight_eq, inv_pow_sum_le, square_mass_lower_bound (1242ff), propW_of (2290ff), hcover, local_estimate_fourth, local_estimate_fifth, propW_of_localEstimates.
- same directory PropertyWOfEstimates.lean 2e655d92011aff00569dd1e4658b7ab5c345c6bc; SquareSetMemExceptionalUnion.lean 7888a2ed015c53b365b674fdc70cf7d06a58a6d8 (local_estimate_second); LocalEstimateThird.lean 06220500fd5c67fa0dacd89d94a98b50817500a9 (local_estimate_third).
- ThirdPlaceSeries/TopShape.lean 3f791ca182db235c4a8ff582d3f038019320d5cd; LinkIrr.lean 278e3fba595f2f3643c163ed6297b12330ef7d51; TopShapeAlt.lean 0c6a19a019a55bd4e8b070c0384d8840cf4cd890 (retained actual irrC and Green branch).
Latest upstream main 75e2012dcc6f3093e223ef8d327b88395ff7d27c unchanged since RUN25, checked via fetch_commit. Source search for actual producer of irrC returned no matches; EveryCharacterOfLiteratureOfVWin tail checked again, FockModels/EveryCharacterE hypsE2 is not evidence of the actual third-place irrC producer. Do not fill in missing chain by guessing filenames. Independent review requested. No new literature result claimed. Neither lean nor lake on local PATH, no kernel replay. No URT.

Executed local CPython exact regression (exit 0). Small finite-field polynomial counts and exact weight comparisons only, below native N/g; not native representation weights, and not a test of the analytic estimates or RH. Reproduce:
```python
from itertools import product
from fractions import Fraction as Q
from math import prod
def rem(a,b,p):
 a=list(a)
 while len(a)>=len(b):
  k=len(a)-len(b); c=a[-1]*pow(b[-1],-1,p)%p
  for i,v in enumerate(b): a[k+i]=(a[k+i]-c*v)%p
  while a and a[-1]==0:a.pop()
 return tuple(a)
def gcd(a,b,p):
 while b:a,b=b,rem(a,b,p)
 return a
def trim(a):
 a=list(a)
 while a and a[-1]==0:a.pop()
 return tuple(a)
def div(a,b,p):
 a=list(a); z=[0]*(len(a)-len(b)+1)
 for k in range(len(z)-1,-1,-1):
  c=a[k+len(b)-1];z[k]=c
  for i,v in enumerate(b):a[k+i]=(a[k+i]-c*v)%p
 assert not any(a)
 return tuple(z)
def degrees(a,p):
 d=[]
 for k in range(1,(len(a)-1)//2+1):
  for c in product(range(p),repeat=k):
   b=c+(1,)
   while len(a)>=len(b) and not rem(a,b,p):
    a=div(a,b,p);d.append(k)
  if 2*k>=len(a)-1:break
 if len(a)>1:d.append(len(a)-1)
 return d
n=s=cases=0
for p in (2,3,5,7):
 for r in range(1,5):
  sq=0; mass=Q(0)
  for c in product(range(p),repeat=r):
   a=c+(1,);n+=1
   der=trim(tuple(i*a[i]%p for i in range(1,r+1)))
   if not c[0] or len(gcd(a,der,p))!=1:continue
   sq+=1;s+=1;ds=degrees(a,p);assert sum(ds)==r
   w=Q(1,prod(p**d-1 for d in ds));assert w>=Q(1,p**r)
   mass+=w
  assert Q(sq,p**r)>=1-Q(2,p)
  assert mass>=Q(sq,p**r)
  cases+=1
b=0
for p in (2,3,5,7,4099):
 for f in range(0,51):
  a=(1-Q(1,p))**f
  for B in (Q(0),Q(1,100),Q(1,2),Q(1),Q(2)):
   B0=min(1,B)
   assert 1-a*(1-B0)<=B0+Q(f,p)<=B+Q(f,p)
   b+=1
print('monic polynomials',n,'squarefree nonzero constant',s,'field-degree cases',cases,'product bounds',b)
```
Observed: monic polynomials 3730 squarefree nonzero constant 2690 field-degree cases 16 product bounds 1275.

RESUME HERE: derive (M) directly for actual regular semisimple eJ labels by tracing the Gelfand–Graev squarefree supplier and retaining only the required nonnegative contribution; if the exact multiplicity remains necessary, keep it and instead request actual irrC producer identifier from dependency lane. Do not duplicate the three-cylinder reduction or treat local model as global counts. HANDOFF TO math, geometry, integration, audit, dependency. RH OPEN.

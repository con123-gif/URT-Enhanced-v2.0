# RUN26 — Direct TopAtLevel/count cancellation, no lattice detour
2026-11-25. Lane 7. Status: conditional human derivation, not kernel checked; no RH closure. Mission e0dc8f7faa1e35a5e3210b817b5b34f8d8cf20f1 and recursive update 3bc50a3649438bbca4e8410eb0af425cc4f5c1ff. Preserve all previous work. Peer boundary: theta RUN25 local LinkIRR clauses (91a5aa5002472c62c20fca1c6af984c8), audit error coefficient envelope (d5f4c8511ecf03968efd74a031ce46d94f2d3db8), signed prime reduction (223e6835cc23a35edaf85e62756b318e2da51998). This is a different implication. Repository orchestrator checkpoint 428 is not Lean validation.

## One-line reduction
Pin P=40e56bab026552e089d7afcfeff08d2defb9c005. Use the native TopAtLevel and fifth conjunct of LevelWindow for the SAME D, ell, N, TT,T2,a,w,G,C,T, and each u in finite additive group H. Let f=card PhiSet>0, m natural, a_t>=0, v=G.v>0, w(u,j,rho)>0 on PhiSet, k=G.k>0, T(u)>0 (as supplied by LevelWindow), x=G.x>=1 and epsilon>0. Write
A=sum_TT a_t;
L(u)=sum_j (1/f)sum_rho log w(u,j,ePhi rho);
kappa=C.cCount*(G.La+m^2*G.La/k);
Omega=gamma+log(pi/v)-Re ell(chC);
Lambda(u)=L(u)+m*log(v/pi)+m*G.lg-kappa;
S(u)=sum_t sum_j ASK D N a_t t (w u j);
M(u)=m*sum_t a_t*(log a_t-1-gamma+Re ell(chC))-A*L(u);
SDiv=m*sum_t (ph(a_t)-a_t*Omega);
B0=2*card(H)*m*bTx*x^epsilon;
Nc=card(T2)*k*bTx*x^epsilon/(card(H)*(card(H)*x^(-epsilon)));
E_D=C.cDiv*card(TT)*aTx*G.La+C.cDiv*m*(B0+Nc)*x^(C.eDiv*epsilon).
All bTx,aTx evaluated at (x,epsilon). At zero a_t use the source totalized Real.log; no log of a zero weight.

TopAtLevel says S(u)<=SDiv-A*log T(u)+m*A*G.lg+E_D.
LevelWindow says log T(u)>=Lambda(u).
Define r(u)=SDiv-A*log T(u)+m*A*G.lg+E_D-S(u)>=0,
s(u)=log T(u)-Lambda(u)>=0.
Expansion of log(w*v/pi) (positive w,v), f>0, and ph(a)=a log a-a gives exactly
SDiv-A*Lambda(u)+m*A*G.lg=M(u)+A*kappa.
Consequently the decisive local identity is

**S(u)-M(u)=E_D+A*kappa-A*s(u)-r(u).**

For latticeCollapse's stronger input hs+S(u)<=... with hs>=0, define r with -hs on the right and subtract hs in the identity. Since A>=0, average over all u in H (nonempty) to obtain
mean_H(S-M)<=E_D+A*kappa - A*mean_H(s)-mean_H(r) [minus hs in the stronger case].
In particular mean_H(S-M)<=E_D+A*kappa. All constants and signs explicit. No need for the other level constraints, lattice realization, trace estimates, slopes, quotient errors or entropy for THIS conditional implication. No claim that they are redundant for proving the premises or for the original Lean root.

The source ch_top_main_eq identifies the same M with the sum of Re MAIN under IdentU. The source Data.Main and mkData agree with the expansion above. No arbitrary replacement of an ASK input by a model value is licensed.

## Why it matters / hard boundary
latticeCollapse takes hTop (the very inequality above, with hs), defines gG(u) as the ASK sum and gE=m*A*G.lg, constructs collFam with coll_Ga=gG, coll_Fo=gE-gG, coll_EeJ=gE/m, coll_IO=0, coll_Rd=0, and uses hTop in the DIV proof. lattice_completion invokes it with hs=0. Thus the TopAtLevel branch's geometric construction is unnecessary for the local ASK-MAIN conclusion: the required signed estimate is already in the inputs. This is a sound conditional replacement, not an unconditional geometric proof. ev_topW establishes TopAtLevel for Model.DA and ell=0 using ModelEv.askDA_le; this is not an authentication of actual arithmetic host TopAtLevel. Chain2CoreOfTop explicitly requires TopAtLevel for hostData and hostEll. The actual root's third-place TopG route is not proven equivalent to this branch. No root obligations discharged here; all prior obligations stay in the frontier. No novelty claim for elementary algebra. No URT run.

## Source anchors (pinned P)
- src/Formalism/SizeWindowBrackets/Chain2aCoreNoAnalytic.lean blob 65f69d1384df4c02143504aab03c4b15acd5bc04: mkData (226ff), LevelWindow (662ff), TopAtLevel (673ff), CompletionSigns, LatticeCompletion, Chain2CoreOfTop (699ff).
- src/Formalism/SizeWindowBrackets/ChainSlopeWindows/ChainLatticeSizesModelEventually.lean blob 91279318ea75ee3a1d127a93a9b87e1ea0ca8fca: latticeCollapse, lattice_completion, collFam, coll_Ga, coll_Fo, coll_EeJ, coll_IO, coll_Rd, ev_topW.
- src/Formalism/RankGapBounds/MeanBoundSecondForm.lean blob e4332fd8680d2b2f82e0a1e44a276453e03e2109: Main (107ff), HidaSetting, DIV, ph.
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChTop.lean blob ce06a34a9e0b1b332e10d3b7efb04a06e9ab77f5: ch_top_main_eq (11ff), ch_top (37ff).
- src/Formalism/RankGapBounds/RankGapProofs/WeightedMeanData.lean blob 9172d2d30c5cec478b08c10a4b34e39fa16ab981: Data.key_identity.
- src/Formalism/SizeWindowBrackets/ChainSlopeWindows/LevelOfCongruence.lean blob e08edc360cdf8d5d95d82ef1b805a8ea1a6151ef: key_identity5, weighted_mean_bound_statement.
Latest main observed 75e2012dcc6f3093e223ef8d327b88395ff7d27c (merge 1508, 07:24:48Z). Chain2aCoreNoAnalytic now blob c6b1d5bcde04f820a690b03d8d867fa33098304e with named definitions absent at original path; MeanBoundSecondForm blob 6665ceafcdb75d9d42e86243e0dcf790acc863e0. ChainLatticeSizesModelEventually and ChTop original paths returned 404. No assumption that latest source is equivalent; derivation strictly pinned.

## Reproduction
Executed python stdlib Fraction regression in local container, exit 0: 6144 exact rational cases, 2 sign controls. Logs are formal independent scalar placeholders; this is an algebra check, NOT a check of number-field, prime, or Lean hypotheses.
```python
from fractions import Fraction as Q
from itertools import product
n=0
for a1,a2,m,f,g,l,v,k,E,h,s,r in product([0,1,3],[0,2], [1,2],[1,3],[-2,1],[-1,2],[-3,1],[0,2],[0,5],[0,1],[0,2],[0,3]):
    A=a1+a2
    B=m*sum(a*(z-1-g+l) for a,z in zip([a1,a2],[2,-1]))
    L=sum(Q(j+rho-2,f) for j in range(m) for rho in range(f))
    lg=Q(2,3)
    Lam=L+m*v+m*lg-k
    main=B-A*L
    sdiv=B+m*A*v
    logT=Lam+s
    S=sdiv-A*logT+m*A*lg+E-h-r
    assert sdiv-A*Lam+m*A*lg==main+A*k
    assert S-main==E+A*k-h-A*s-r
    assert S-main<=E+A*k-h
    n+=1
assert -(-1)*2>0
assert -3*(-2)>0
print(f'{n} exact rational cases, 2 sign controls')
```

RESUME HERE: trace the actual third-place host TopG supplier to the first genuinely arithmetic signed ASK-MAIN premise; identify whether any theorem supplies the above TopAtLevel on that same host, or whether an independent direct average inequality can replace it. Do not infer this from Model.DA. Preserve exact parameters and root reachability; stop expanding unrelated height theory. HANDOFF TO lanes 6, 8, 11 (audit), 13 (reduction).

# Joint exponential-scale reconstruction of six native size fields
Status: source-matched conditional mathematical derivations. Not proof of actual complete family existence or independent Lean kernel verification. Pin leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005.

Sources:
- src/Formalism/SharpRestriction/ElevenLe.lean (75f2ab1404c69a5d1330671d96d8f6cd35e74e52), exact SizeBot, SizeDe2, SizeEta (9 clauses), SizeNodes (7), SizeLstar (2), SizeDel (8).
- src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean (688162690ac7cbfe620037fcee8e451e7116f45b), RankVal, HostVal, HCVal, Val, SzRow, h0v, Delv.
- src/Formalism/LocalRingCardinality/DataParams₂.lean (50914500995df91e2646d91a6c5c99a7e603a51b), Scale, Sc_eq, density identity, bT_ge.
- src/Formalism/LocalRingCardinality/DataHost.lean (7e9af8ab364965c62be250ae93974098141598c0), v=rdE/2.
- Previous native rank, thick sphere, Bernoulli selection, harmonic rank closure chapters.

## 1. Exact witnesses, not invented scales
For fixed eps in (0,1/52) and fixed C satisfying Std, Val C cD ch L supplies Del=ceil(x^cD), etaSz=m*h0v=2m ceil(x^ch), LaG=G.La C.GK s, bT upper bound, CGam=C.CGam, Ct=C.Ct. SizeData2 supplies Sc=4k Del, de2=|T2|/n and de2>0. HostVal supplies |T2|>=n*x^-eps. Thus SizeBot and SizeDe2 are direct consequences, with szNst=2n delta1. In SzRow the quantifier order is fix eps,C, choose c1, for EVERY cD>=c1 choose c2, for EVERY ch>=c2 choose x0, then every Val witness beyond x0. We preserve this order, and do not claim that such a witness exists.

Assume native rank envelopes already derived, HostVal, SizeLa (only LaG>=x^eps used for SizeDel), and SizeQD upper bound on rdE together with fixed HostConst. All thresholds uniform over the indicated witnesses at fixed eps,C,cD,ch.
For sufficiently large x use n<=x^3, m<=x, k,r<=x^5, f<=x^3, t<=x^400 from previous rank calculation, N=k+m(t+1)<=x^402; r<=x^5 follows from r=k+m-1 and k exponent strictly below 5. L=x^eps<=x, x^tau<=x. Choose cD>=414 and ch>=max(1210,cD+20). Then Del=O(x^cD), Sc=O(x^(cD+5)), etaSz=O(x^(ch+1)), and etaSz/m>=2x^ch. These are a sufficient alternative envelope, not a claim that source chooses these same constants.

## 2. One exact scale separation lemma
Write B=exp(x^eps), E=exp(x^(eps/3)); b=B, b'=xB/E, w''=B/(nE), X''=xnE. For every fixed real a, x^a/E ->0 and x^a E/B ->0, since a log x - x^(eps/3) -> -infty and a log x+x^(eps/3)-x^eps -> -infty. Also log of any uniformly polynomially bounded positive quantity is O(log x) from above. Thus each fixed polynomial is negligible compared with b', w'', B, and each fixed polynomial times b'/B tends to zero. This is exact harmonic/log-scale separation, not a floating numerical approximation. Products/quotients of positive monomials can use one-pass exponent vectors; sums use fixed-degree envelopes. No arbitrary symbolic expression simplification asserted O(N).

## 3. SizeEta: all nine clauses
Let eta=etaSz. First t<=eta follows from the lower eta bound and ch>400. Second eta*t^3*f*k^3 is polynomially bounded and therefore <=B eventually. Third log eta<=x^(eps/4) eventually. Clauses 4,5,6,7,8 compare respectively t eta, m(t+1)eta, m(Sc+eta), N eta, eta^2 r L against w''/x, w'', w'' L, de2*m*w'', de2*m*(w'')^2. In every case the left side has a fixed polynomial upper bound and the right side dominates every polynomial, using m>=2, de2>=x^-eps and L>=1. Hence all hold eventually.
Clause 9: szlA=k*x^eps/(m de2) is positive and polynomially bounded. Divide by de2*m*B. Then r*(b'+Sc)*log(x)*szlA/(de2*m*B) is bounded by a fixed polynomial times (x/E + Sc/B), tending to zero. This proves the ninth exact inequality. No need for a new eta formula.

## 4. SizeNodes and SizeLstar from the same common denominator
Set
 P=n*t^2*(N+t)*L^2 + k*n^2*(Sc+t+L).
Then szlStar=m B/P, so B/szlStar=P/m. P>0 and P=O(x^p) with p=max(1207,cD+16,411); p<ch. All seven SizeNodes left-hand sides have polynomial envelopes of degrees at most
 max(p,400), 406, 111, 1206, 11, 1203, 412
 respectively (the sixth comes from 3*max(r degree=5,m+t degree=401)). Each degree is strictly below ch. Hence each is <=eta/m eventually. The exact coefficients 12,2,8,4,6 etc. are fixed and absorbed by strict margins, not discarded.
For SizeLstar, szlStar>=B/(C_p x^p) for a fixed C_p>0. Divide each requested left side by szlStar. Polynomial terms vanish, while b'/szlStar=(x/E)*(P/m) also vanishes. The two inequalities are therefore strict eventually.

## 5. SizeDel: all eight clauses
The first two follow from Del>=x^cD with cD>=414, since N*m^10<=x^412 and x^tau*m*N<=x^404. Third log Del<=x^(eps/4)/2 eventually. Fourth and fifth compare k Sc and x^tau*m*k*Del (polynomial) against w'' (dominates all polynomials). Sixth and seventh compare 4Sc and 4*x^tau*k^2*Del against LaG*b'/k and LaG*b'; both RHS dominate all polynomials since LaG>=x^eps.
Last: v=rdE/2>0. From the earlier SizeQD/HostConst estimate log rdE<=2x^eps eventually, log v<=2x^eps. If log v is negative the inequality is immediate. Otherwise x^tau*m log v<=2x^(1+eps+tau) <= k eventually, since k>=x^(9/2+999eps/100). This uses the retained rdE bound, not a new arithmetic assumption.

## 6. Coverage bookkeeping and remaining exact work
Previous chapter conditionally reduced 13/24 SizesAt categories. The six here (SizeBot, SizeDe2, SizeEta, SizeNodes, SizeLstar, SizeDel) give 19/24 conditional category reductions, not 19 independent geometry proofs. Remaining categories are SizeQD, SizeLa, SizeBm, SizeXpp, SizeWords. In particular SizeQD and SizeLa were INPUTS in previous reductions and must not be counted as established. Actual Val witness, all uniform constants, and assembly into FamP are still substantive obligations.
RESUME HERE: locate exact G.La and GamL definitions, PairRow prime bounds X1/X2 and native rdE estimate, and partition of host places for the HCVal b1 lower bound and SizeXpp. Then reconstruct SizeWords via Val.words and GamL. Seek source theorem that combines all SzRow fields rather than constructing a parallel model. Integrate these chapters with the existing manuscript and keep proof dependencies visible.

## Executed certificate
{
  "checked": 60,
  "cDmin": 414,
  "chMin": "max(1210,cD+20)",
  "degreeEnvelopes": {
    "n": 3,
    "m": 1,
    "k": 5,
    "t": 400,
    "r": 5,
    "f": 3,
    "N": 402,
    "L": 1
  },
  "nativeSourceFields": [
    "SizeEta",
    "SizeNodes",
    "SizeLstar",
    "SizeDel",
    "SizeBot",
    "SizeDe2"
  ]
}
The certificate checks integer degree margins across six example choices of cD. The symbolic max comparison establishes the whole cD,ch range; no test of native arithmetic-geometric existence. No local Lean check.

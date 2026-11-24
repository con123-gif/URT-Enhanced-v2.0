# Joint scale-separation lemma for the remaining native size conditions
Status: SOURCE-MATCHED conditional reconstruction. All conclusions require the actual Val/SizeData2 witnesses and fixed family constants. Original pin leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. No independent full family construction or kernel validation.

Sources:
- src/Formalism/SharpRestriction/ElevenLe.lean (75f2ab1404c69a5d1330671d96d8f6cd35e74e52), exact SizesAt clauses.
- src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean (688162690ac7cbfe620037fcee8e451e7116f45b), Std, RankVal, HostVal, HCVal, Val, SzRow, Delv, h0v.
- src/Formalism/LocalRingCardinality/DataParams₂.lean (50914500995df91e2646d91a6c5c99a7e603a51b), Scale, wj, SizeData₂ (bT_ge, Sc_eq, typeDensity_eq_card_div, win_thick/top/thin).
- src/Formalism/LocalRingCardinality/DataHost.lean (7e9af8ab364965c62be250ae93974098141598c0), topPlaces, thickPlaces, IsThin, rdE, v=rdE/2, FactRd.
- src/Formalism/LocalRingCardinality/RhoDetPrimeEqMuTildeMulChiPow.lean (6ab57a7f313a9f8c351005051933a60a22a0da08), D.eTau is an equivalence onto R.Psi.
Previous chapters harmonic_rank_closure_and_host_sizes and harmonic_scale_size_algebra supply the native rank reductions.

## 1. Exact scale coordinates and shared separation
Fix 0<eps<1/52, fixed uniform family constants, and a Val C cD ch L witness at x. Retain SizeLa (x^eps<=LaG<=x^(eps+eps/100)) and a discriminant bound rdE<=QS*sqrt(q*d)/2, rdE>0 (FactRd or SizeQD input). Do not assume these for an arbitrary record without their producers. Let tau=eps/100, L0=x^eps, b=exp(L0), a=x*b, X'=exp(x^(eps/3)), b'=x*b/X', w=b'/(x*n)=b/(n*X'). Let de2=|T2|/n. Val.host gives x^(-eps)*n<=|T2|; thus de2>=x^(-eps), i.e. SizeDe2, since n>0. Val.bT_le is precisely SizeBot after szNst=2n*x^(-eps/8). These two implications require no asymptotic proof.

The native identities are Del=ceil(x^cD), etaSz=m*h0, h0=2ceil(x^ch), Sc=4kDel. Choose cD>=420 first, then ch>=max(2000,cD+40), then x sufficiently large for all estimates. This is the quantifier order of SzRow: fixed eps,C; choose c1; every cD>=c1; choose c2; every ch>=c2; choose x0. Our generous thresholds are explanatory choices, not the literal source thresholds.

The prior rank construction gives eventually
 n<=x^3, f<=x^4, m<=x, k<=x^5, k>=x^4, r<=x^6, t<=x^400, N(m)=k+m(t+1)<=x^403.
Hence Del<=x^(cD+1), Sc<=x^(cD+7), etaSz<=x^(ch+2), etaSz/m=h0>=2x^ch; all after fixed-constant absorption. For every fixed A>0, x^A=o(w), x^A=o(b'), and x^A*b'/b ->0; also x^A/b->0. Proof by logarithms: log w=x^eps-x^(eps/3)-log n, log(b'/b)=log x-x^(eps/3). Since log n=O(log x), both claims follow. This one scale-separation lemma replaces repeated individual exp/rpow arguments. URT harmonic coordinate x=phi^s changes none of the exact inequalities.

## 2. SizeEta — all nine clauses
1. t<=etaSz because t<=x^400 and etaSz>=2x^ch, ch>=2000.
2. etaSz*t^3*f*k^3<=b eventually: product is polynomial and b dominates.
3. log etaSz<=(ch+2)log x<=x^(eps/4) eventually.
4. t*etaSz<=w/x: polynomial x*t*etaSz=o(w).
5. m*(t+1)*etaSz<=w: polynomial dominated by w.
6. m*(Sc+etaSz)<=w*L0, since L0>=1 and left polynomial.
7. N(m)*etaSz<=de2*m*w: multiply left by x^eps and compare to w, since de2>=x^(-eps), m>=1.
8. etaSz^2*r*L0<=de2*m*w^2: same comparison using w^2.
9. szlA=k*x^eps/(m*de2) is polynomially bounded (<=x^(5+2eps)). Divide r*(b'+Sc)*log x*szlA<=de2*m*b by b; use 1/de2<=x^eps, m>=1, and x^A*b'/b->0, x^A*Sc/b->0 for suitable fixed A. This proves the inequality eventually with the original right-hand side, not merely a power estimate. All denominators are strictly positive.

## 3. SizeNodes — all seven clauses
Write P=n*t^2*(N(m)+t)*L0^2+k*n^2*(Sc+t+L0). Then szlStar=m*b/P, and b/szlStar=P/m. P>0; from polynomial envelopes P<=x^p with p=max(1220,cD+30) for sufficiently large x. In detail first summand has exponent at most 1209 using N+t<=x^404; second at most max(cD+7,400,1)+13; constants absorbed by slack. Since ch>=max(2000,cD+40)>p+2, etaSz/m=h0>=2x^ch dominates each of:
- 12P/m+2t+8
- k*t*L0
- x^tau*r^19*f^5*L0
- 4N(m)^3+2t+6
- x^tau*k*m^(9/2)
- 2(r+m*t)^3+t+3
- N(m)*m^10.
The largest exponent among the latter six is <=1211 (allowing constants), strictly below 2000. Thus all SizeNodes inequalities hold, no invocation of geometry beyond the retained polynomial witness.

## 4. SizeLstar — both clauses
szlStar=m*b/P>=b/x^p. Since P/m is polynomial and b'/b is superpolynomially small, the ratios of b', Sc, etaSz, b/szlStar, t and 1 to szlStar all tend to zero. Therefore each required finite positive sum is strictly below szlStar eventually. This preserves strictness and both coefficients 2,8 in the second condition.

## 5. SizeDel — all eight clauses
Del>=x^cD with cD>=420 dominates N(m)*m^10<=x^413 and x^tau*m*N(m)<=x^405. log Del<=(cD+1)log x<=x^(eps/4)/2 eventually. The polynomial products k*Sc and x^tau*m*k*Del are <=w. Also 4*k*Sc and 4*x^tau*k^2*Del are <=LaG*b' since LaG>=x^eps>=1 and b' dominates polynomials. Finally v=rdE/2>0 and log v<=log rdE<=log(QS*q*d) under the retained discriminant upper bound. HostVal/PairWin/PairRow give log(QS*q*d)<=2x^(eps/5)*(log x)^2<=2x^eps eventually. Thus x^tau*m*log v<=2x^(1+eps+tau)<=k eventually (k>=x^4). If log v is negative the inequality is immediate. All eight original clauses are covered.

## 6. SizeBm and SizeXpp — uniform over actual embeddings
HCVal provides b_j=b1+j*h0, e_j=b_j+h0/2 at every tau. D.eTau lies in Psi by its type. Each embedding is top, thick, or thin by definition, with a top witness t from the image defining topPlaces. In the top case b1=bT(t)+floor(b'/x)>=b' (use bT_ge and floor nonnegative); thick case b1>=ceil(b)>=b; thin case b1=ceil(w)>=w. Since b>=w and b'>=w eventually, b1>=w. As (m-1)h0 is polynomial and w dominates, b_{m-1}<=b1+w<=2b1 eventually. This proves SizeBm with actual b_j indices and positive baseline, not a statement about generic weights.

For 1<=j<=m, the source wj equals e_{j-1}. Use win_thick/top/thin. The lower bound is w in all cases: b>=w; top bT+b'/x>=b'>=w; thin direct. The upper bound is a=x*b in all cases eventually: thick b+etaSz+1<=a; thin w+etaSz<=a; top bT+b'/x+etaSz<=a because SizeBot and SizeRho imply bT<=2b' (the nonnegative coefficient szNst*x^eps*LaG/k<=x^-2/4), and b'/a->0, etaSz/a->0. Therefore w<=wj<=a. For all pairs, wj<=a=(a/w)*w<=(a/w)*wj', and a/w=X''. This proves SizeXpp without treating the open terms as scalar-identical across embeddings. Uniform estimates independent of tau,t,j.

## 7. Coverage and residual
Previous 13 category reductions plus SizeBot, SizeDe2, SizeEta, SizeNodes, SizeLstar, SizeDel, SizeBm, SizeXpp give 21 of 24 SizesAt categories as conditional reductions from Val and stated bounds. This is NOT a count of unconditionally established FamP fields, nor RH coverage. The three residual categories are SizeQD (all exact lower and upper prime/discriminant/derivative conditions), SizeLa (LaG=G.La and fixed constants), SizeWords (GamL bound from actual word count). In addition the actual existence of Val, uniform fixed constants, family assembly and geometric/automorphic producers remain OPEN. Need locate the exact SzRow theorem producer and prove or cite its native hypotheses. No extra hypothesis silently removed.

## 8. Executed exact arithmetic replay
{
  "chosenThresholdPairs": 7,
  "strictExponentChecks": 84,
  "examples": [
    {
      "cD": 420,
      "ch": 2000,
      "P": 1220,
      "checks": [
        [
          "P term1",
          1209,
          1220
        ],
        [
          "P term2",
          440,
          1220
        ],
        [
          "nodes1",
          1222,
          2000
        ],
        [
          "nodes2",
          406,
          2000
        ],
        [
          "nodes3",
          136,
          2000
        ],
        [
          "nodes4",
          1211,
          2000
        ],
        [
          "nodes5 doubled",
          21,
          4000
        ],
        [
          "nodes6",
          1207,
          2000
        ],
        [
          "nodes7",
          413,
          2000
        ],
        [
          "Del1",
          413,
          420
        ],
        [
          "Del2",
          405,
          420
        ],
        [
          "Del8 coarse",
          3,
          4
        ]
      ]
    },
    {
      "cD": 421,
      "ch": 2000,
      "P": 1220,
      "checks": [
        [
          "P term1",
          1209,
          1220
        ],
        [
          "P term2",
          441,
          1220
        ],
        [
          "nodes1",
          1222,
          2000
        ],
        [
          "nodes2",
          406,
          2000
        ],
        [
          "nodes3",
          136,
          2000
        ],
        [
          "nodes4",
          1211,
          2000
        ],
        [
          "nodes5 doubled",
          21,
          4000
        ],
        [
          "nodes6",
          1207,
          2000
        ],
        [
          "nodes7",
          413,
          2000
        ],
        [
          "Del1",
          413,
          421
        ],
        [
          "Del2",
          405,
          421
        ],
        [
          "Del8 coarse",
          3,
          4
        ]
      ]
    }
  ]
}
These are integer exponent tests of conservative polynomial envelopes for seven selected cD,ch choices. Arbitrary cD>=420 and ch>=max(2000,cD+40) follow from the symbolic inequalities above. No actual native Val witness generated by these tests, no full Lean verification, no speed estimate or URT-specific performance advantage.

RESUME HERE: find G.La and GamL definitions and actual SzRow/Val family producer; close SizeQD, SizeLa, SizeWords with exact source bounds. Then assemble the native geometric family theorem, not another round of the same inequalities. Integrate into proof_editor manuscript and retain all open Val/HostVal obligations.

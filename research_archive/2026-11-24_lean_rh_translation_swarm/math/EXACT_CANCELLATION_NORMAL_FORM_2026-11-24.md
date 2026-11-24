# RH exact cancellation normal form — source-matched human reconstruction
Status: SOURCE-MATCHED, human algebra; no independent kernel replay or measured URT speedup. Separate RH lane. Upstream revision 40e56bab026552e089d7afcfeff08d2defb9c005.
Sources (relative to src/):
- Formalism/RankGapBounds/MeanBoundSecondForm.lean (e4332fd8680d2b2f82e0a1e44a276453e03e2109): ph, Data.logOm, Data.sumA, Data.Main, HidaSetting and slope premises.
- Formalism/RankGapBounds/RankGapProofs/WeightedMeanData.lean (9172d2d30c5cec478b08c10a4b34e39fa16ab981): Data.abelian₂, SDiv, key_identity.
- Formalism/SizeWindowBrackets/QuotientSlopeBoundsWith.lean (f9f34a9147750e215a6b2f206eb6f9889aa726b6): Count5, EComp5, Lo5, LossBounds, ErrX5at, PointwiseBoundVariant.
- Formalism/SizeWindowBrackets/ChainSlopeWindows/LevelOfCongruence.lean (e08edc360cdf8d5d95d82ef1b805a8ea1a6151ef): Lam5, key_identity5, each_unit_bound_statement.
## Exact cancellation (not approximate)
Fix u0; finite t, j in Fin m, rho in Fin f, with f>0, v>0 and every w_jrho>0. Other real parameters as in Data; no additional positivity of a_t or k is needed for the equality under Lean total division/log conventions. Under HidaSetting k>0 and a_t>=0. Let
A = sum_t a_t,
B = sum_t a_t (log a_t -1 -gam +LpL),
R = sum_j (1/f) sum_rho log w_jrho,
q = log(pi/v).
Then Main = mB - AR, SDiv = mB - mAq, by expanding ph(a)=a log a-a and logOm=gam+q-LpL.
The normalized count log sum equals R-mq since log(w*v/pi)=log w-q and f>0. Thus for any correction E, define Lambda(E)=R-mq+m*lg-E.
Direct substitution gives
SDiv-A Lambda(E)+mA lg = (mB-mAq)-A(R-mq+m lg-E)+mA lg = Main + AE.
This proves a common algebraic normal form for both existing equalities:
- Data.key_identity: E=cCount*(L+m² L/k)+2 logGam/(f k).
- key_identity5: E=cCount*(La+m² La/k).
Crucial: the variant used by ch_top has La, not L, and does NOT have the gamma correction in its Count5 premise. The blueprint's approximate narrative must not substitute one variant for the other.
Evaluation: one pass over a_t, one over w_jrho: O(nT+mf) arithmetic/log evaluations, instead of naive Main expansion O(nT*m*f) (or O(nT*m+mf) with hoisting). This is conventional distributivity; no demonstrated URT-specific gain. Arithmetic operation counts, not bit complexity or Lean runtime. No numerical or kernel execution claimed.
## Eleven premises of PointwiseBoundVariant
All fixed finite U0, W(u0) nonempty, Top, natural m,f, data D, constants C, real Xpp. The theorem returns for every u0: ASK(u0) <= Main(u0)+ErrX5at(u0). The source's eleven obligations (in order):
1 HidaSetting: x,b,k,v>0, a,b'>=0, f>0; all a_t>=0, w,d,T>0; muN<=muMaxN; cSl1>=0; delBar<1; etaBar>=0; 0<=eBar<=1/4.
2 DIV: muCC+h-Fo <= SDiv-A log T+EDiv, pointwise in u0,u.
3 EComp5: |Ee-m A lg|<=cE*m*B0, pointwise.
4 HComp: |(h(u)+A log T(u))-(h(u')+A log T(u'))|<=cH*(nT*a*La+m*B0), for all u0,u,u'.
5 Count5: Lam5<=log T<=cCount*m*L; |log T(u)-log T(u')|<=cCount*log k.
6 Slopes: -cSlope*nT*a*La*(1+m/k)<=muM and muMaxM<=cSlope*nT*a*La.
7 QuotientSlopeBoundsWith: muMaxN<=muMaxM+Ga+Fo-Ee+cSl1*m*B0; muM+Ga+Fo-Ee-Lo5<=muN; Lo5=cSl1*IO+cSl1*nT*m*(a/k+b')*log T+cSl1*Xpp+1.
8 LossBounds: for every u0, ASK-Ga<=LoP and IO<=LoP, with LoP=cLoss*nT*m*b*x^(eLoss*eps).
9 SlopeIneq: whenever 0<=del<1, eta>=0, 0<=e<=1/4, s-muMinCC<=HH and HH>0, then s-log|W|-(1-del)^(-1)*(4*uF*log(1+HH/uF)+(eta+4 sqrt(e))*HH)<=muCC.
10 HHBound: s-muMinCC<=HH, 0<HH<=x^cHH*b.
11 FParams: 0<=del<=delBar, 0<=eta<=etaBar, 0<=e<=eBar.
All pointwise premises carry the universal index quantifiers from source. HComp and Count5 compare two points within the same W(u0). Here s is the d-weighted mean of muN-h, uF=max_u(muMaxN-h)-s, EDiv=cDiv*nT*a*La+cDiv*m*(B0+Nc)*x^(eDiv*eps).
## Next algebraic elimination
From 2,3,5,6,7, positive A and weights, derive s >= Ga+muCC-K5v5-mean(Lo5). K5v5 = cSlope*nT*a*La*(1+m/k)+m*(A*lg+cE*B0)+SDiv-A*Lam5+EDiv. The exact identity above reduces K5v5 to Main+K0v5. Then bound uF by K3+mean(Lo5) via 3,4,5,6,7; combine 9–11 to eliminate s and muCC. Finally 5 and 8 bound mean(Lo5) and ASK-Ga. The source proves this via s_lower5, Vvar_bound5, u_function_le_mean, Ga_bound5, weighted_mean_lower_bound_le, each_unit_bound_statement.
RESUME HERE: reconstruct uF bound and phi_bound with every positivity condition; then trace the actual proofs discharging all eleven premises in the Main route. Do not claim full geometric proof from the conditional assembly.

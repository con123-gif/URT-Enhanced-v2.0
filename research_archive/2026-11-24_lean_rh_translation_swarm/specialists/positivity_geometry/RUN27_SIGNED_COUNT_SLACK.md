# RUN27 — preserve count slack before slope/entropy bounds (25 Nov 2026)
Status: human source-matched conditional reduction; arithmetic leaves OPEN; native replacement certificate PREPARED, not executed. RH not proved. No URT or physics.

## Actual root branch
Source pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream main observed 75e2012dcc6f3093e223ef8d327b88395ff7d27c (07:24:48 UTC, merge #1508); no upstream changes incorporated. Current mission blob 8dc6705e1bc6540b600f6c22309294466ec88fd0, including unified engine. Read protocol, queue, expansion, AGENTS and continuity; peer f5bab469, 2f135e5b, cc5937fc, a31ec62d, 51592596, RUN26. Unlike RUN26 alternative TopAtLevel branch, this is the actual source call path (not a new elaborated export):
Main.riemannHypothesis -> rhOfAll -> allChi -> everyCharacter -> everyCharacter_of_row -> every_character_of_literature_of_vWin -> every_character_of_theta_integrals_local_matching -> every_character_of_green_v_win -> zero_free_all_of_green_v_win -> zeroFreeAll_of_topG -> level_gm_le_on_family_scales -> windowInequality_of_artinInputs -> core_gm -> Deduction.ch_top -> each_unit_bound_statement.
Keep all other edges and branches. The original local branch is Count5 (three clauses), HidaSetting, DIV, EComp5, Slopes, QuotientSlopeBoundsWith, HComp, SlopeIneq, FParams, HHBound, LossBounds -> s_lower5 / u_function_le_mean / key_identity5 / weighted_mean_lower_bound_le -> Ga_bound5 -> each_unit_bound_statement -> ch_top. Candidate replacement: signed identity + same entropy bound + count lower and spread + one reference-count inequality + eventual coefficient absorption -> same ErrX5at bound. No global binder or edge deletion yet; all original graph/axiom exports unchanged. This is a replacement theorem argument rather than deleting a binder from the old proof.

## Exact cancellation, at one actual translation u0
Use the pinned Data and Consts, keep native finite nonempty word space W(u0), positive weights d and all original assumptions except the second clause of Count5 (and see replacement below). Write mean for its normalized weighted mean, A=D.sumA, m native real-cast word parameter, k=D.k>0, x=D.x; all quantities below at the same u0. A>=0 from HidaSetting. Let
- kap = C.cCount*(D.La+m^2*D.La/k), L = Lam5 D C u0, ED = D.EDiv C, SD = D.SDiv.
- beta = C.cSl1*D.nT*m*(D.a/k+D.b'), L0 = C.cSl1*D.IO u0+C.cSl1*Xpp+1.
- Lo_i = Lo5 D C Xpp u0 i = L0+beta*log(T_i).
- ell_i = log(T_i)-L >= 0 (Count5 first clause).
- p_i = SD-A*log(T_i)+ED-(muCC+h_i-Fo) >= 0 (DIV, sum_aT_mul).
- q_i = muN_i-(muM_i+Ga+Fo-Ee_i-Lo_i) >= 0 (lower quotient slope).
- s=mean(muN-h).
Native key_identity5: SD-A*L+m*A*lg = Main+A*kap.
Substitute DIV and quotient identities before bounding any slack:
muN_i-h_i=muM_i+Ga+muCC-SD+A*log(T_i)-ED-Ee_i-Lo_i+p_i+q_i.
Consequently the exact signed identity is
```
ASK-Main = (ASK-Ga)+(s-muCC)+ED+A*kap
           +mean(Ee-m*A*lg-muM+Lo-A*ell-p-q).
```
This keeps the count slack on the favorable side, whereas the original s_lower5 drops it before bounding Lo.

## Replacement inequality
Put K0=K0v5 D C and K3=D.K3 C. Use the same native pointwise upper EComp5, lower Slopes and ASK-Ga<=LoP. The preceding identity gives
gap <= LoP+(s-muCC)+K0+mean(Lo)-A*mean(ell)-mean(p+q).

The native u_function_le_mean remains valid with Count5 spread alone: for i,j subtract the lower quotient slope at j from the upper at i, after subtracting h_i,h_j respectively. Ga+Fo cancels exactly. The remaining Ee_j-Ee_i is at most 2*m*C.cE*B0; HComp gives h_j-h_i <= C.cH*(nT*a*La+m*B0)+A*(log(T_i)-log(T_j)); the Count5 spread bounds the final term by A*C.cCount*log(k). The two original Slopes bounds plus C.cSl1*m*B0 then give
(muMaxN_i-h_i)-(muN_j-h_j) <= K3+Lo_j.
Average j, maximize i: uF<=K3+mean(Lo). Also uF>=0 by HidaSetting and positive normalized weights.

Set X=x^C.cHH, lambda=4*log(1+X)/(1-D.delBar), J=(D.etaBar+4*sqrt(D.eBar))*X*D.b/(1-D.delBar).
Retain all native SlopeIneq, FParams, HHBound and HidaSetting hypotheses. Their entropy bound, using phi_bound exactly as in Ga_bound5 (including uF=0 handled with totalized division), yields
s-muCC <= log(card W)+lambda*(K3+mean(Lo)+b)+J.
In particular lambda>=0. Substitute mean(Lo)=L0+beta*L+beta*mean(ell). The decisive scalar inequality becomes
```
gap <= LoP+K0+log(card W)+lambda*(K3+b)+J
       +(1+lambda)*(L0+beta*L)
       -[A-(1+lambda)*beta]*mean(ell)-mean(p+q).
```
Thus if (1+lambda)*beta<=A, beta>=0 and L<=C.cCount*m*D.L, use IO<=LoP and obtain L0+beta*L<=MLo5 D C Xpp. The original exact ErrX5at D C Xpp u0 follows, unchanged. We replace the pointwise second Count5 clause (log T_i upper bound for every word) with the single scalar inequality on Lam5. Original Count5 implies it by choosing any word (nonempty) and combining its lower and upper bounds. The new upper-reference premise does NOT itself imply the old pointwise upper; the signed slack absorbs any excess. The old lower and spread clauses are retained. This is a weaker sufficient reference-count obligation in the eventual native regime, not a proof of its actual geometric supplier.

## Coefficient absorption is eventual in the native caller, not a new conjecture
From ErrWindows0: m*x<=k, k*b'<=a, C.cSl1<=K, x>=1, b>=1, nT>=1, k>=1, nonnegative relevant constants. RestSize a<=2*x*b. IdentU+SizesA and positivity: A>=nT*(x-1)*b>=nT*a/3 for x>=3. (CoreAtH specializes the same data to the principal character; no change of host.) Hence A>0, beta>=0 and beta<=2*K*nT*a/x, giving beta/A<=6*K/x.
ErrWindows gives delBar<=1/2, hence lambda<=8*log(1+x^C.cHH)<=8*(1+C.cHH*log x). Therefore
(1+lambda)*beta/A <= 6*K*(1+8*(1+C.cHH*log x))/x -> 0.
Uniform for fixed K and upper bound cHH on C.cHH in CoreAtH; the RHS uses cHH instead of C.cHH for the uniform threshold. No added epsilon restriction. Absorb into the already eventual x threshold; finite small x not claimed. The native log/T spread is still necessary in the uF step. Actual geometry, Count lower, slopes, EComp, DIV, entropy, TopG, all-prime/cohomology leaves, uniform tied-family construction and prime-window cancellation remain unresolved. May be used with peer one-selected-translation reduction, but one must still construct that actual selected host.

## Source evidence and pending independent audit
Pinned exact Git blobs:
- Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean ee340012ab19713a8acfecf8adc6a331cbc2f1a4; ZeroFreeAllOfTopG.lean 54d1b4b84e8c4b97c98379f0bf1bd6bf2f3b2da1.
- Development/AutomorphicArithmetic/PrimitiveCosets/LevelGmLeOnFamilyScales.lean de994949e6fd2d7238cfcb1c19d361ccdfe904fc; WindowInequalityOfArtinInputs.lean c349e34925ac26b8bc76bd36e9b91562f86d6b8d; CoreGm.lean 3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d; CoreAtH.lean 0ba3621036f19146e7e67fa9c0e8a1c38661a097.
- Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChTop.lean ce06a34a9e0b1b332e10d3b7efb04a06e9ab77f5; DedekindLFunctions/SplitInertia.lean b5662cda1f3523fc53b547ee582a46bd3cd826d4.
- Formalism/SizeWindowBrackets/ChainSlopeWindows/LevelOfCongruence.lean e08edc360cdf8d5d95d82ef1b805a8ea1a6151ef (s_lower5, u_function_le_mean, key_identity5, Ga_bound5, each_unit_bound_statement); QuotientSlopeBoundsWith.lean f9f34a9147750e215a6b2f206eb6f9889aa726b6 (Lo5, Count5, ErrX5at, MLo5, UBar5).
- Formalism/RankGapBounds/RankGapProofs/WeightedMeanData.lean 9172d2d30c5cec478b08c10a4b34e39fa16ab981 (key_identity, phi_bound); Formalism/RankGapBounds/MeanBoundSecondForm.lean e4332fd8680d2b2f82e0a1e44a276453e03e2109.
- Formalism/SizeWindowBrackets/SChain.lean a4bc8cecac40a1f5fd307661e151639aaf6a6efa; ErrorFormsWeakWindowsFalse.lean 1d1d179d111b5aa668893327264648558f30fdb6.
Root prefix source trace from peer Landau RUN24. Existing native CI status.json retrieved: 45577239749 conditional half-strip baseline PASS (98.87s); 45576756833 pruning baseline PASS (77.94s). Baseline only, not this replacement. No new native graph or axiom evidence; retain original ledgers and pending nodes. Local PATH has neither lean nor lake. Engine sources fetched from current repository: RHRecursiveReductionFixed.lean 976c28572f11ffb00e1ae730555e938eeb564cb7, RHRecursiveReductionAutoV3.lean a113dc56ea987abac3bf29eb480782140b82ab4a, RHProofTermPrune.lean f6d3e7f6047a7895ecf183be3fb54c203f4fc46a. Native invocation not performed. No new CI PASS claimed.

### Prepared Lean scalar certificate (not executed; extract into .lean)
```lean
import Mathlib
namespace RHGeometry
theorem count_slack_transfer
    (g base A beta lam L ell L0 Lbar : ℝ)
    (hlam : 0 ≤ lam) (hell : 0 ≤ ell)
    (habsorb : (1+lam)*beta ≤ A)
    (href : L0+beta*L ≤ Lbar)
    (h : g ≤ base+(1+lam)*(L0+beta*(L+ell))-A*ell) :
    g ≤ base+(1+lam)*Lbar := by
  have h1 := mul_nonneg (sub_nonneg.mpr habsorb) hell
  have h2 := mul_le_mul_of_nonneg_left href
    (show 0 ≤ 1+lam by linarith)
  nlinarith only [h, h1, h2]
#print axioms count_slack_transfer
end RHGeometry
```
In pinned environment import the actual ChTop module and existing engine modules; scan actual Deduction.ch_top and each_unit_bound_statement (use full namespace discovered from source). Run rh_prune on actual theorem and retain original bridge; mathematical weakening here cannot be obtained merely by pruning its Count5 binder. Apply rh_reduce 4 using [RHGeometry.count_slack_transfer] at the instantiated scalar goal with the stated local hypotheses, rh_auto 4 and rh_auto_frontier 4 on the actual weakened native theorem, auditing every surviving goal; no auto-admission or imported RH. This is a prepared next test, not a successful proof search. Use context keys (pin, declaration, host, u0, fixed K/cHH, weakened count clauses) in existing cache, not a fresh corpus scan. Backtrack to original Count5 if coefficient or reference proof unavailable.

### Actual exact integer regression (executed in JS, not native geometry)
The following reproducible script checks the algebra after clearing the positive mean denominator, not existence of geometric data. No floating-point approximation within these small integer ranges.
```js
let identity=0, absorbed=0, negative=0;
for(const A of [0,1,3,8,24]) for(const beta of [0,1,2,5])
for(const lam of [0,1,3]) for(const L of [-3,0,4])
for(const ell of [0,1,7]) for(const p of [0,2]) for(const q of [0,3])
for(const w of [1,2,5]){
 const d=[w,1], den=w+1, sum=v=>d[0]*v[0]+v[1];
 const es=[ell,ell+1], ps=[p,p+1], qs=[q,q+2];
 const t=es.map(e=>L+e), Lo=t.map(z=>2+beta*z);
 const Main=13,kap=2,ED=3,m=2,lg=1,Ga=17,Fo=5,muCC=9,ASK=19;
 const SDiv=Main+A*kap+A*L-m*A*lg;
 const Ee=[1,3],muM=[-1,2];
 const h=t.map((z,i)=>SDiv-A*z+ED-muCC+Fo-ps[i]);
 const muN=t.map((z,i)=>muM[i]+Ga+Fo-Ee[i]-Lo[i]+qs[i]);
 const sn=sum(muN.map((z,i)=>z-h[i]));
 const rhs=den*(ASK-Ga-muCC+ED+A*kap)+sn+
 sum(Ee.map((z,i)=>z-m*A*lg-muM[i]+Lo[i]-A*es[i]-ps[i]-qs[i]));
 if(den*(ASK-Main)!==rhs)throw Error("identity"); identity++;
 if((1+lam)*beta<=A){
  const Lbar=2+beta*L+1;
  const g=(1+lam)*sum(Lo)-A*sum(es)-sum(ps)-sum(qs);
  if(g>den*(1+lam)*Lbar)throw Error("absorption"); absorbed++;
 }
}
if(!((1+3)*2*5-3*5>0))throw Error("guard control");negative++;
if(!(2*5>2*4))throw Error("reference control");negative++;
if(!(-2<2))throw Error("slack sign control");negative++;
console.log({identity,absorbed,negative});
```
Observed: identity 6480, absorbed 3780, negative 3. The last three are elementary sign controls, not arithmetic counterexamples to RH.

RESUME HERE: trace the actual geometric producer of Count5 upper and lower, replace the upper by the reference bound on Lam5 using native weights (peer cc5937fc), and check whether upstream construction obligations genuinely disappear; audit the signed replacement at ch_top with native engines. HANDOFF TO integration, kernel extractor, formal audit, theta and proof editor. No change to root closure status.

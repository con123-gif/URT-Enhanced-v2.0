# RUN10 — Native cutoff and loss-envelope producers (2026-11-24)

Status: SOURCE-MATCHED / conditional human reconstruction; exact finite regression executed in V8. Pin 40e56bab026552e089d7afcfeff08d2defb9c005. No Lean replay, no claim of full RH reconstruction, kernel reachability or URT acceleration. No premises removed. This follows RUN9 (four served-prime counting bounds), not a repeat.

Preflight: read AGENTS, research state/log/protocol/continuity excerpts, swarm protocol, handoff queue, expansion, RUN7 and RUN9, all 14 peer latest RESUME HERE notes (kernel, dependencies, integration, acceleration, editor, geometry, audit, literature, character boxes, math, Galois, theta, structure, Landau). None claims this particular adapter. General CI summary 16:07:34Z PASS is not RH validation. The external blueprint was referenced by the queue but not reread this run. No physics changes.

## 1. What is actually proved

Work with the native D : D7, L : SizeData₂ D, X : G.Inst D L, K : G.Consts, real Cr,C,bo, and abstract P : Par. The same records occur throughout. Let x=L.sc.x, a=L.sc.a, b'=L.sc.b', w''=L.sc.w'' D.R.n, k=D.R.k, H0=L.sc.p0 D.R.k, X'=L.sc.X', M=max(C,0). The native set PsAt is the range of bndP (finite cutoff) filtered by primality AND InertK (SuppSat 26–31); no assumption that all primes belong. ldAt maps L₁(p) to the real cast of leastPowerExponent L p, fl to flG L C, lo to loG L C bo (54–71). ParTie (73–92) identifies x,epsilon,e₂,nA,k,N,t,p₀=natural ceil(H0), La,rG,Sc,η,ρ,th,K₀=k² x^(3 Scale.A),d,C=M,Y,bo, with their native values. The functions pd_a, pd_f, pd_Xp, pd_lx, pd_Sk and first/second_loss_param_eq give the other derived parameter ties (PowFour 908–961). Retain the entire ParTie record, not merely the displayed fields.

Under ParTie, theorem pd_fl (1058–1076) proves for EVERY p in PsAt the floor-envelope inequality, and loss_constant_le_prime_pow (1078–1096) proves for EVERY p in PsAt with p<P.p₀ the order guard. Under ParTie PLUS bo>=0, L.LaG>=0 and H0<=X', pd_lo (1114–1197) proves for EVERY p in PsAt the lower-envelope inequality. These bounds are stronger in quantifier domain than the served-only fl/lo requirements of SecondKindLoss. They do not assert a geometric gain estimate, nor a native host's existence.

## 2. Order guard is a ceiling identity, not a new arithmetic assumption

Native leastPowerExponent (LocalQuadraticParts 485):
  L₁(p) = ceil_N(log_p(Y)) + 1, where Y=k² x^(3 Scale.A).
Here ceil_N is natural ceiling, so this is valid even if Y<1; do not silently use a signed integer ceiling for negative logarithms. For p in PsAt, pd_prime (996–999) gives p prime, hence p>1. Scale.one_lt_alt gives x>1, and D.R.m_add_three_le_k gives k>0, so Y>0 even for a real exponent. Let e=ceil_N(log_p(Y)). Since log_p(Y)<=e and base p>1, monotonicity of real exponentiation yields Y=p^(log_p(Y))<=p^e. Cast the natural e+1 into R before subtracting 1: L₁(p)-1=e exactly. By tie.K₀, this proves K₀<=p^(L₁(p)-1). The proof introduces p<P.p₀ and does NOT use it (1080); it actually gives the bound on all PsAt, while the stated source theorem retains the low-prime condition. The source uses Real.rpow_logb and Nat.le_ceil; no numerical log evaluation is needed. As in RUN9, multiply by p>0 then reciprocate to get p^(-L₁)<=1/(K₀ p). Removing +1 is invalid: p=2,Y=3,ceil(log₂3)=2; without +1 the right side is 2, not >=3. No assumption about additive order of Frobenius is used to prove this particular cutoff guard. Do not confuse L₁ with a minimal actual orbit order.

## 3. Floor envelope

Set z=log_p(a)>=0 using p>1 and pd_one_le_a (963–967). Native expression unfolded by pd_fl:
  fl = C f N² z + C f z².
Abstract flF equals M f N² z + M f z² after pd_f, tie.N and pd_a. Because f is a natural cast and N²,z,z²>=0, C<=M can be multiplied by each nonnegative factor; sum. No restriction C>=0 is assumed here. This reproduces the exact source estimate; the later counting argument requires P.C=M>=0, not C>=0.

## 4. Lower envelope and all cutoff branches

Let
  A1=rG b' log x,
  A2=b'/x+η+Sc+(w''+t)log x/δ₁,
  B=La a/(p k) + (if p<H0 then a p^(-L₁(p)) else a/p²),
  Z=(Sc+k+η) log_p(2a).
The native lower term unfolded by pd_lo 1181–1192 is
  lo = C Z + (if I then (if L then C A1 else if W then C A2+bo else 0) else 0)
       + (if I and W then C log x B else 0),
where I means D.host.cls p = PrimeClass.inertClass (not the broader InertK filter), L means (p:R)<H0, W means (p:R)<X'. These are distinct predicates. The abstract loF, after parameter ties, equals
  M Z + (if W then (if L then M A1 else M A2+bo)+M log x B else 0).
This uses p<P.p₀ iff (p:R)<H0 via tie.p₀ and Nat.lt_ceil (1133–1134). Equality with a cutoff belongs to the upper branch; do not use <= in place of <. H0<=X' guarantees L implies W. pd_lo explicitly uses sc_pos (x,b,a,X',b' positive), log x>=0, delta1>0, pd_wpp_pos, Sc_pos, etaSz_pos, natural k,t,rG nonnegative, p>1, a>=1, and the separate hypotheses La>=0, bo>=0. These prove A1,A2,B,Z>=0. Then C Z<=M Z, C A1<=M A1, C A2<=M A2, C log x B<=M log x B.

pd_key (1098–1112) is the exact conditional expression inequality behind this. For arbitrary decidable predicates I,L,W and real c1,c2,cB,m1,m2,mB,bo, assume L=>W; c1<=m1,c2<=m2,cB<=mB; m1,m2,mB,bo>=0. Then
 (if I then (if L then c1 else if W then c2+bo else 0) else 0)
 + (if I and W then cB else 0)
 <= (if W then (if L then m1 else m2+bo)+mB else 0).
Proof by cases: if not W, not L, and both sides zero. If W and I, use c1<=m1 or c2<=m2 with the same bo, and cB<=mB. If W and not I, left zero and right nonnegative. No case requires c1,c2,cB>=0. In pd_lo, c1=C A1, c2=C A2, cB=C log x B, m1=M A1,m2=M A2,mB=M log x B. Add C Z<=M Z. The logic would fail without L=>W or bo>=0 in the non-inert high branch; executable controls below show this.

## 5. Exact transfer to the joint loss hypotheses

side_at (1199–1209) universally takes the native X,K,Cr,C,bo, H:PtH X K Cr, P,tie, and hbo,hLa,hp0. Its ten conjuncts, in order: native top-weight range, odd exponent and positive lower weights, exceptional exponent>=1 and nonnegative weights, pd_fl, pd_lo, the order guard, Xpp equality, a equality, Xp equality, theta equality. PtH itself is the seven-field record at SuppSat 94–101 (fills, supp_sat, drop_iff, Knn, kapI, Cr1, numN). lossHyp_at (1989–1998) additionally assumes LinkG_at; constructs ParametersHyp using unitRule_at, side_at, served_le, high_gt, loss_bound_at, nonserved_zero. It restricts the universal fl and lo bounds to served p and passes the order guard unchanged. LossRequirementsOfSmallShares.loss_setting_family (41–80, especially 71) consumes this in the joint loss theorem. This closes the exact producers of hL,hfl,hlo requested in RUN9, while the *different*, substantive served-ledger inequality in loss_bound_at still depends on LinkG_at. Do not infer it from ceiling algebra. Other class and scale hypotheses unchanged.

## 6. Source anchors, hashes and drift

All links are relative to https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/ :
- src/Formalism/LocalToGlobal/GlobalTheory/PowFourLtCeilThresholdPrime.lean | 8166795ec6e846795d7272781119ee7d17d426c0 | pd_a 911–912, pd_Xp 914–915, pd_f 927–928, pd_lx 942–943, pd_Sk 951–952, first_loss_param_eq 954–956, second_loss_param_eq 958–961, pd_one_le_a 963–967, pd_wpp_pos 969–973, pd_prime 996–999, pd_fl 1058–1076, loss_constant_le_prime_pow 1078–1096, pd_key 1098–1112, pd_lo 1114–1197, side_at 1199–1209, unitRule_at 1982–1987, lossHyp_at 1989–1998.
- src/Formalism/LocalToGlobal/GlobalTheory/SuppSat.lean | 80c1d0526b661eae74d87ec3b569d6a459e900ce | bndP 26–27, PsAt 31, clAt 43–47, ldAt 54–71, ParTie 73–92, PtH 94–101.
- src/Formalism/SharpRestriction/Divisibility/LocalQuadraticParts.lean | c89c0cac1fccf0ac28b4129f1d8f1ca5b689a265 | leastPowerExponent 485, floorTermOfPrime 489–491, lowerTermOfPrime 495–507 (the latter is related, but uses groupRank instead of rG; do not identify it definitionally with loG).
- src/Formalism/LocalToGlobal/GlobalTheory/LossRequirementsOfSmallShares.lean | 287dcaae544bf078e47910aa5c9986ec501bdbd2 | loss_setting_family 41–80, call at 71.
- src/Formalism/SizeWindowBrackets/PrimeClassLossHypothesesSatisfiable.lean | 3f609406f5456e034f5dfb94e9688fca6c9f95a9 | PrimeClassLossHypotheses 86–94.

Latest upstream observed 1da818b50f1e18808db2792b9dc735bda8cb84d8 (2026-11-24 15:42:48 UTC, merge PR #1198). Compared full fetched text for three files: PowFour changed blob to 74c8dc05d5ed540a5af4ef295afbd7d40b973082 but all blocks pd_fl through side_at old 1058–1209/new 1025–1176 match line-for-line (common prefix 287 lines); lossHyp_at old 1989–1998/new 1638–1647 matches (19-line prefix). SuppSat changed to d5821c10326628e5285dfbca3dcf787a1cb19aab; ldAt and ParTie blocks still match (81 and 62-line prefixes). LocalQuadraticParts changed to cd0fa6ba21f8fc89064651e72fc02eb4a9439baa; exact starting declaration leastPowerExponent no longer found in that file. It may have moved; not asserting deletion or migration equivalence. No upstream pin change.

## 7. Reproducible executed regression

Save the following as run10.cjs and run node run10.cjs. Exact integer/rational tests; no native Lean objects, real transcendental evaluation, or proof-term extraction. For positive rational Y, the natural ceiling is modeled by the least e>=0 with p^e>=Y, equivalent by monotonicity. Floor terms and branch expressions use exact small-integer/rational surrogates of nonnegative multipliers. Negative controls explicitly drop +1, L=>W, bo>=0 or multiplier nonnegativity. No inference from finite sampling to universal theorem.

```js
function regression(){
 const c={ceil_guard:0,reciprocal:0,floor_clamp:0,cutoff:0,branch_transport:0,negative:0};
 const ck=(v,k)=>{if(!v)throw Error(k+" #"+c[k]);c[k]++};
 function exponent(p,u,v){let pow=1n,e=0;while(pow*v<u){pow*=p;e++}return [pow,e]}
 for(let p=2n;p<=19n;p++)for(let u=1n;u<=100n;u++)for(let v=1n;v<=16n;v++){
  let [pow,e]=exponent(p,u,v);
  ck(pow*v>=u&&(e===0||pow*v<p*u),"ceil_guard");
  let L=e+1;ck(p**BigInt(L)*v>=u*p,"reciprocal");
 }
 for(let C=-6;C<=6;C++)for(let f=0;f<=5;f++)for(let N=-3;N<=3;N++)for(let n=0;n<=5;n++)for(let d=1;d<=5;d++){
  let B=f*(N*N*n*d+n*n);ck(C*B<=Math.max(C,0)*B,"floor_clamp");
 }
 for(let p=0;p<=20;p++)for(let n=0;n<=90;n++)for(let d=1;d<=9;d++)
  ck((p<Math.floor((n+d-1)/d))===(p*d<n),"cutoff");
 function branch(C,a,b,z,bo,inert,low,within){
  let M=Math.max(C,0);
  return [(inert?(low?C*a:within?C*b+bo:0):0)+(inert&&within?C*z:0),
    within?((low?M*a:M*b+bo)+M*z):0]
 }
 for(let C=-4;C<=4;C++)for(let a=0;a<=5;a++)for(let b=0;b<=5;b++)for(let z=0;z<=5;z++)for(let bo=0;bo<=4;bo++)for(let inert of [false,true])for(let [low,within] of [[true,true],[false,true],[false,false]]){
  let [l,r]=branch(C,a,b,z,bo,inert,low,within);ck(l<=r,"branch_transport");
 }
 let [_,e]=exponent(2n,3n,1n);
 ck(2n**BigInt(e-1)<3n,"negative"); // removing +1 from L1 fails
 for(let args of [[1,1,0,0,0,true,true,false],[0,0,0,0,-1,false,false,true],[-1,-1,0,0,0,true,true,true],[-1,0,0,-1,0,true,false,true]]){
  let [l,r]=branch(...args);ck(l>r,"negative");
 }
 return c;
}
console.log(JSON.stringify(regression()));
```

Actual V8 output: {"ceil_guard":28800,"reciprocal":28800,"floor_clamp":16380,"cutoff":17199,"branch_transport":58320,"negative":5}. All assertions succeeded. Positive tests 149499, five negative controls. Complexity O(number of enumerated samples times max exponent for the exact loop); no comparison to a URT method.

## RESUME HERE

Next source-linked task: reconstruct the actual served-ledger inequality loss_bound_at (PowFour, around 768 onwards) and its exact LinkG_at inputs. Trace the proof of the retained-top sum and its native gain/tau equality; locate actual loG/flG declarations rather than assuming the related LocalQuadraticParts groupRank formula equals rG. Begin by inspecting that pinned theorem and its direct call to hG, then trace the upstream producer of LinkG_at. Independent audit requested: check the natural ceiling, strict cutoffs, distinction inertClass vs InertK, signed C, nonnegative bo and B, and that this adapter does not independently prove the served-ledger inequality. Request dependency lane exact qualified names and typed role reachability for loss_constant_le_prime_pow, pd_fl, pd_lo, lossHyp_at. HANDOFF TO math, geometry, audit, editor, integration and dependency lanes. Project OPEN.

# RUN24 — all nine PrimeSumNumericFacts fields, uniform family threshold and pinned consumer

2026-11-25. RESULT: SOURCE-MATCHED human reconstruction of the complete local numerical supplier and its pinned consuming chain; stronger asymptotic n3 bound below. PARTIAL for elaborated root reachability and independent Lean replay. No change to Cathedral physics.

## Provenance
P = 40e56bab026552e089d7afcfeff08d2defb9c005, repository leanprover-community/riemann-hypothesis. All paths below relative to src/Formalism/SharpRestriction/GrowthBounds/ unless specified. Blob hashes as returned by GitHub.
- LogarithmicSums/PrimeSumNumericFacts.lean 43ebae418a3fadff3319cdd5c4ccb6d18d05abcb: NumG5' L12–22; prime_sum_facts_eventually L27–369; prime_sum_facts_of_scaled L375–406; prime_sum_facts_along_family L408–425.
- LogarithmicSums/NumData.lean 16d92dcc7a0cc5044b661107e2e6c1ff6d099e86: ev_log/ev_pow/ev_const L10–51, rE L53–55, first_bound_arith L57–73, n1'_arith L75–97, second_bound_arith_a/b L99–128, fourth_bound_arith L130–152.
- LogarithmicSums/NinthBoundArithB.lean 874b0ed6cf3eaf0f6af08db21bb83600427c3652: forty_le_exp_four L7–12, ninth_bound_arith_b L14–64.
- LogarithmicSums/SecondConstantNonneg.lean 9a81c995f590ec0a1a7aa4c92729b804f38514dc: lX and final PrimeSumNumericFacts L12–33.
- LogarithmicSums/PrimeRpowNegLevelLe.lean 2534d4828612d86863a3b3eca1525827d625cbed: c1–c4, cfl L163–172 (prior RUN23).
- LogarithmicSums/LatticeChainSuccOfPartial.lean c48148c0af73a80a8647630b9bfc484594b3d641: consumers L33,119,191.
- LogarithmicSums.lean ca9322c11898c23018dfb6076d58d08219259eab: rest3 L76–88, stmtEF L98–99, stmtF L101–102.

Preflight: read swarm protocol, queue, 15-lane expansion, AGENTS and research state/log/protocol/continuity excerpts, RUN23, recent commit subjects and most peer RESUME excerpts. Editor diff unavailable via fetch_commit; no exhaustive full archive or external blueprint reread. Latest Cathedral CI summary #423, run 45556824120 PASS at 06:14:38 UTC, not RH validation. Peer audit 86bdbcc33c972093997ff1443f4480287ec4bd25 already covers core_gm, so this task follows RUN23's other frontier. No duplicate full manifest scan.

## 1. Quantifiers and a uniform elementary threshold
The native theorem fixes real eps, K with K.Nonneg, real C>=0; THEN there exists a real threshold R such that for every x>=R and every D:D7,L:SizeData₂ D with L.sc.x=x, L.sc.eps=eps, SizesAt L, ParameterChoice' D L and adm5 D L K (eps/48), NumG5' D L K C bo holds, where bo=b^(x^(-eps/2)). The threshold is independent of D,L. If eps is not in (0,1/52), no L with that epsilon exists by Scale's hypotheses: the implication holds vacuously, not by applying estimates at forbidden eps.

For x>=1, α>0, integrate 1/t <= t^(α/2-1) from 1 to x: log x <= (2/α)(x^(α/2)-1). Thus c log x <= x^α for all x>=max(1,(2|c|/α)^(2/α)), with c=0 trivial. For α<β, c x^α <= x^β once x>=max(1,|c|^(1/(β-α))). For α>0, c<=exp(x^α) once x>=max(1,|c|^(1/α)), since exp(u)>=1+u. These elementary proofs reproduce the eventual lemmas, including negative c; all thresholds can be joined by a finite maximum.

Let t=23 eps/48, Y=exp(x^t), X= X'=exp(x^(eps/3)), b=exp(x^eps), a=xb, b'=a/X, w=b'/(xn)=b/(Xn), V=X''=a/w=Xxn, S=Sc, z=log X, theta=1/(k x^13), delta1=x^(-eps/8), f=2n. Use distinct letters Y for the envelope (not the family's lattice witness Y) and X here for the real cutoff (not the Inst witness). Native size estimates imply x²<=n<=x³, x⁴<=k<=x⁶, k>=1, S>=100, Nm<=S, cG=4S=16k Del, log eta<=x^(eps/4), log Del<=x^(eps/4)/2, 1<=w<=a. These are from L65–149 and L316–359 with Nm_le_Sc, Sc_facts, w''_le; retain the underlying SizesAt and ParameterChoice' hypotheses. No new assumptions on family existence.

For clarity the 17 eventual conditions in source L36–52 are: 14 log x<=x^t; C<=Y; 10<=Y; log x<=x^eps; 3x^eps<=x; 14x^t<=x^eps; 4x^(eps/3)<=x^eps; 4x^(eps/4)<=x^eps; 4x^(eps/2)<=x^eps; 8<=x^eps; 40log x<=x^(eps/3); 2(log4)C rE(eps)log x<=x; 2(log4)C log x<=x; 40C log x<=x; 4C log x<=x; 120x^eps<=x; 5log x<=x. Also x>=16,120. rE=ceil(8(4+8eps)/eps)+1 fixed. Choose the maximum once before D,L. This is the quantifier order of filter_upwards.

These imply x^j<=Y for 0<=j<=14, eta<=Y, Del<=sqrt(Y), 16k<=x^7<=sqrt(Y), hence 0<=cG<=Y, Nm<=Y, xn<=Y, f<=Y. log a=log x+x^eps, log(2a)<=3x^eps<=x<=Y (log2<=1<=x^eps). Y^7 X<=b follows from 7x^t+x^(eps/3)<= (1/2+1/4)x^eps. z>=1 and z(1+z)<=2x^(2eps/3)<=2x. The latter uses eps<1/52. All these estimates are uniform. 

## 2. Nine fields, with exact error budgets
Write c1=C(cG+eta)log(2a), cfl=C f(Nm² log a+(log a)²/log2), c2=C rE b' log x+C log x a/(k x^26)^4, c3=b'/x+eta+C w log x/delta1+bo, c4=C log x(La a/k+a/p0), p0=k²x^26. These are the native constants, not fitted coefficients.

(1) one_le_card_tops: SizeTT lower bound is n x^(-eps/100)delta1. SizeN gives n>=x^(2+8eps-eps/100), so this product is at least x^(2+(8-2/100-1/8)eps)>=1 (L180–189).

(2) n1: c1(V+2)<=Y(2Y)Y(2XY)=4Y^4 X<=Y^7 X<=b. Here V+2<=2XY since X>=1,Y>=10.

(3) n1': log2=integral_1^2 dt/t>1/2. Hence Nm² log a+(log a)²/log2<=Y³+2Y²<=2Y³, and cfl(V+2)<=4Y^6 X<=Y^7 X<=b.

(4) n2: put W=x^26, g1=(log4)C rE log x, g2=(log4)C log x. Both g_i<=x/2. k² W x²<=x^40<=X, from the log cutoff. Since b'X=xb, g1 k² W b'<=b/2. Also W>=x², W>=1,k>=1 imply x² k²W<=(kW)^4; therefore g2 k²W (xb/(kW)^4)<=b/2. Adding proves log4 p0 c2<=b.

(5) n3: bo=exp(x^(eps/2)) exactly, by positive real powers. X b'/x=b. The remaining three contributions satisfy 40X eta<=b and 40X bo<=b by exp(4)>=40 and the exponent inequalities from conditions 7–10. Moreover Xw=b/n, so 40X C w log x/delta1=40 C log x x^(eps/8) b/n<=b, using 40C log x<=x, x^(eps/8)<=x, n>=x². Therefore log4 X c3 <= (log4)(43/40)b <= (59641/40000)b < (3/2)b (native log4<=1387/1000, L173–177). Note this estimate does NOT scale homogeneously with C.

Additional uniform asymptotic sharpening under the same fixed-C hypotheses: divide by b and put T=x^eps. Then Xc3/b=1+X eta/b+C log x x^(eps/8)/n+exp(T^(1/3)+T^(1/2)-T). The second and fourth terms are bounded by exp(-T/2) eventually, since T^(1/3)+T^(1/2)<=T/2 eventually (eta uses T^(1/4) instead of T^(1/2)). The third tends to zero uniformly, by n>=x² and the integral logarithm estimate above. Nonnegativity gives a lower bound of 1. Thus (log4)Xc3/b tends to log4 uniformly over valid instances (expressed as an eventual two-sided estimate, no assumption every x has an instance). For every fixed d>log4 one may replace 3/2 by d after a larger uniform threshold; d<log4 cannot work on arbitrarily large valid instances. This is a human consequence, not a claimed native theorem.

(6) n4: h5.2.1 supplies La<=x^(eps+eps/48)<=x, while K.Nonneg gives La>=0. Thus La*x³<=k and p0>=x³. We have z(1+z)<=2x and C log x<=x/4. Therefore z(1+z)c4<=2x*(x/4)*(2a/x³)=a/x=b. No lower adm5 La bound used for this step; full adm5 retained in native theorem.

(7) n5 is x>=120 by threshold. (8) n7 follows x^(-2+eps)=x^eps/x²<=1/(120x).

(9) n9: lg=log(2V)>=0, lg<=x^(eps/3)+5log x<=2x and lg<=Y since 2x<=x²<=Y. Also V<=XY, 0<=S<=Y, theta<=1, 480 x² theta<=1 (x>=120,k>=1). Let E=(V(theta+3S/w)+2)lg(theta w+S). Expand exactly, using Vw=a:
 E=lg(a theta²+2theta w)+lg((Vtheta+2)S+3SVtheta+3S² V/w).
 First part <=6x a theta=6x² b theta<=b/80.
 Second part <=lg(9Y² V)<=9Y^4 X<=b/80, since Y³>=1000>=720 and Y^7X<=b. Hence E<=b/40. This is ninth_bound_arith_b, with every positivity premise accounted for.

All nine fields of NumG5' are supplied (there are no n6 or n8 fields). For final PrimeSumNumericFacts, apply them at coefficient 40C. c1,cfl,c2,c4 are linear homogeneous in C: their four bounds divide by 40. c3 is affine with nonnegative coefficient w log x/delta1: c3(C)<=c3(40C), so n3 retains its bound, not b/40. one_le_card_tops, n5,n7,n9 are independent of C. This reconstructs prime_sum_facts_of_scaled exactly. In the asymptotic sharpening above, the coefficient 40C is still fixed.

## 3. Native family and actual local consumer
Fix Fm:FamP eps, K.Nonneg, C31,Ce,Cm,C>=0 (only C is constrained nonnegative in this particular theorem; C31,Ce,Cm are arbitrary real parameters here), dependent witnesses Inst and LatInst and hA:AdmFam Fm K X Y C31 Ce Cm. From Fm.Ix_zero choose i to obtain eps>0 via Fm.L_eps. Apply hA at eps/48>0 to get x1 and the uniform admission of all indices; apply the numerical theorem at 40C to get x2. Set R=max(Fm.x1+1,max(x1,x2)). For every x>=R and every i:Fm.Ix x, Fm.x1<x ensures Fm.L_x and Fm.params apply, Fm.L_eps gives the epsilon identity, admission supplies a5 and aSz.1=SizesAt. Apply numerical theorem then scaling. This is L408–425, with no choice of threshold after i and no unconditional construction of AdmFam.

Pinned local value-call chain (source inspection, not an elaborated root path): stmtF -> stmtEF -> rest3 -> prime_sum_facts_along_family -> prime_sum_facts_of_scaled and Nu.prime_sum_facts_eventually -> helper bounds. In parallel rest3 calls latticeChain_succ_of_partial with the numerical record and hG, WReq from second_estimate_and_mean_along_family, plus admitted a2,a3,a4. rest3 threshold max(x1,max(x2,x3)), where x1 supplies admission, x2 mean/weight condition, x3 numerical facts. At each x,i it accepts the additional gain hypothesis hG. This connects RUN22–24 in the pinned source, but does not authenticate a Main->stmtF path in the exported proof graph. Other family conclusion and arithmetic hypotheses are preserved.

## 4. Upstream change — do not conflate historical and live proof
H observed 2026-11-25: a18a350c3e5aad997766cff2670b292313e46574 (PR #2164 merge, 05:32:50 UTC). Old paths PrimeSumNumericFacts.lean, NinthBoundArithB.lean, SecondConstantNonneg.lean and GainBoundAllAddOneOfGainBoundAllRequired.lean return 404. H LogarithmicSums.lean blob 567c67a62257c7a671d673fe52bd7f0d50b0315f contains EMPTY former NinthBoundArithB, PrimeSumNumericFacts and ThirdEstimateOfNumericFacts clump sections at H L541–605. H L96–117 stmtEF_of now takes only three family inputs (FamilyAskBounds, RemainingCountingStatement, FamilyFourthBound) and H L674–675 stmtEF calls rest0, remainingCountingStatement_of_restStar, rest2 only. P L98–99 calls six, including restW, rest3 and restT. At H rest3 and restT absent in this module. H NumData blob 50b6c2b4520315145099a3b2f9fe044919025ca3 retains eventual helper names but not the first/n1'/second/fourth helper declarations in its theorem listing. This is positive source evidence of a changed assembly, not proof these statements are globally absent or unnecessary at P. Request exact root reachability classification for P; do not spend further effort on historical branches before checking priority with integration.

## 5. Reproducible finite check
Executed in V8 with text(counts) in place of console.log(counts). Node can run the following code unchanged. These are integer/rational cross-multiplication tests of the algebraic envelopes, NOT native D7 instances, numerical verification of asymptotic convergence, or a Lean kernel run. In second tests G=2g, fourth G=4C log x, ninth theta=t/d and w=a/V. n1' uses upper bound 1/log2<=2. The third negative control drops the theta cap (theta=1,S=0,lg=1, V=1). The second tests strict threshold equality.
```js
const counts={first:0,fl:0,second:0,fourth:0,ninth:0,scale:0,budget:0,negative:0};
const ck=(v,k)=>{if(!v)throw Error(k);counts[k]++};
for(const Y of [10n,11n,20n])for(const X of [1n,2n,5n])for(const C of [0n,1n,Y])for(const c of [0n,1n,Y])for(const e of [0n,1n,Y])for(const l of [0n,1n,Y])for(const xn of [0n,1n,Y]){
 const b=Y**7n*X;
 ck(C*(c+e)*l*(X*xn+2n)<=b,"first");
 ck(C*c*(e*e*l+2n*l*l)*(X*xn+2n)<=b,"fl");
}
for(const x of [2n,3n,10n])for(const k of [1n,2n,7n])for(const W of [x*x,x**3n])for(const bp of [0n,1n,5n])for(const G of [0n,1n,x]){
 const X=k*k*W*x*x,b=bp*X/x;
 ck(G*k*k*W*bp<=b,"second");
 ck(G*k*k*W*x*b<=b*(k*W)**4n,"second");
}
for(const z of [0n,1n,2n,5n])for(const x of [16n,32n,100n])for(const a of [0n,1n,20n])for(const L of [0n,1n,5n])for(const G of [0n,1n,x])if(z*(1n+z)<=2n*x){
 const k=(L+1n)*x**3n,p0=x**3n;
 ck(z*(1n+z)*G*(L*a*p0+a*k)*x<=4n*a*k*p0,"fourth");
}
for(const x of [2n,3n,5n,10n])for(const Y of [10n,11n,20n])for(const X of [1n,2n,5n])for(const V of [1n,X,X*Y])for(const lg of [0n,1n,2n*x<Y?2n*x:Y])for(const S of [0n,1n,Y])for(const t of [0n,1n]){
 const d=480n*x*x,b=Y**7n*X*V,w=x*Y**7n*X;
 const lhs=(V*(t*w+3n*S*d)+2n*d*w)*lg*(t*w+S*d);
 ck(40n*lhs<=b*d*d*w,"ninth");
}
for(const C of [0n,1n,7n])for(const u of [0n,1n,5n])for(const base of [0n,1n,9n]){
 ck(40n*C*u=== (40n*C)*u,"scale");
 ck(base+C*u<=base+40n*C*u,"scale");
}
ck(1387n*43n===59641n,"budget");ck(2n*59641n<=3n*40000n,"budget");
ck(1n+40n*2n!==40n*(1n+2n),"negative");
ck(10n>=10n&&!(10n>10n),"negative");
const x=10n,Y=10n,X=1n,V=1n,b=Y**7n*X*V,w=x*Y**7n*X;
ck(40n*(V+2n)*w>b,"negative");
console.log(counts);
```
Actual executed counts: first 2187, fl 2187, second 324, fourth 324, ninth 1944, scale 54, budget 2: total 7022 positive assertions; three negative controls. General result derives from analytic proof, not finite cases.

## RESUME HERE
Independent audit requested: verify all nine fields, especially nonhomogeneous n3 and uniform threshold/quantifier order, and the new asymptotic sharpening. Dependency/kernel/acceleration: request cached exact role paths from Main to P stmtF, stmtEF, rest3, prime_sum_facts_along_family and latticeChain_succ_of_partial; do not launch another full raw scan. Given H removal of rest3/restT, prioritize the authenticated pinned Main path to the actual Gm / WindowHypOfRpow analytic bridge next; coordinate with Landau and audit (core_gm already covered). If rest3 is unreachable at P, label this entire historical branch accordingly rather than count it as core proof coverage. HANDOFF TO audit, integration, dependencies, kernel, acceleration, Landau, editor, prime_window. Full RH reconstruction OPEN; no Lean kernel validation or URT-specific advantage.

# RUN23 — odd-power ask cap, exact deficit decomposition and improved conditional PointsLemma

2026-11-25. RESULT: SOURCE-MATCHED human derivation of ask_bounds, ask_high, dfc_le, dfc_high, lo_bounds, fl_bounds; new conditional constant 491/150 instead of 5 in the first PointsLemma conjunct. Exact finite BigInt regressions executed. Not Lean replay or an unconditional arithmetic estimate.

## Provenance and preflight
P=40e56bab026552e089d7afcfeff08d2defb9c005, leanprover-community/riemann-hypothesis. All following paths relative to src/Formalism/SharpRestriction/GrowthBounds/ at P, unless stated. Source URL prefix https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/SharpRestriction/GrowthBounds/
- IsResidueClassZero.lean 9fbb7879d0519f9a136e190551422881ef5d2f0b L154–159 fill, kaJ, fillG; L341–369 tauP, ioP, gainP, TTP, askG; L378–393 lo/fl.
- LogarithmicSums/Conclusion1OfGainBoundAll.lean a37d19e7affc2c873c5a325fb25af7bf7834d9a0 L99–122 InWin/GainBoundAt (askG, not askP).
- LogarithmicSums/SummableAndTsumLeTwoMulDivOfLeDivPow.lean 5a9eb8949b592ca65eceece0dbe3fe1b4b8a38fb L12–141 fill and Sc suppliers; L142–175 general geometric domination; L177–238 thW/InWin/ask_bounds; L240–269 thS; L277–357 ask_high.
- LogarithmicSums/DfcHigh.lean 3ae0d61345dc80d56ce8093ed9e3fb9637f6ae91 L36–46, L99–104, L175–230 Dfc, io_le, subset, dfc_le/high.
- LogarithmicSums/PrimeRpowNegLevelLe.lean 2534d4828612d86863a3b3eca1525827d625cbed L163–215 constants and ceiling bound, L216–330 lo_bounds, L332–356 fl_bounds.
- LogarithmicSums/SecondConstantNonneg.lean 9a81c995f590ec0a1a7aa4c92729b804f38514dc L73–142 Sets/E1/low_le.
- LogarithmicSums/LatticeChainSuccOfPartial.lean c48148c0af73a80a8647630b9bfc484594b3d641 L29–116 sum_low, L118–173 sum_high, L189–258 final assembly.

Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN22 (398a176a699312a300e7c845104c2cdba5ae76e2), RUN13 excerpts; research state/log/protocol and continuity excerpts; latest 35 commit subjects and RESUME excerpts for other lanes, including acceleration RUN23, kernel RUN23, dependencies 0512, audit 0448 and editor 0456. General CI #419 (45547271883) PASS prior to this artifact, not RH validation. External blueprint not reread this run; no claim exhaustive cross-lane search. No physics changes.

Upstream H=27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59, merge PR 2057 at 04:16:12 UTC, unchanged from RUN22. At H all three pinned paths DfcHigh, PrimeRpowNegLevelLe and SummableAndTsumLeTwoMulDivOfLeDivPow return 404; do not infer elimination of every related obligation. Acceleration RUN23 (7df9865e8a95f1ca06b38fd0c0ddc29272079566) reports exact manifest rows Formalism.MainNotions.AuxBlock8.Pf.AdmFam 1289266 raw refs 58647757,58647765; Formalism.MainNotions.AuxBlock8.AdmF 1285612 refs 58195776,58195809; Formalism.MainNotions.AuxBlock8.FamilyClosedForm 1289250 refs 17831024,58647285. These are peer-reported identities in the authenticated reachable manifest, not an incoming role path for dfc_le, and not independent re-extraction in this run. Preserve P hypotheses.

## 1. Native positive-fill supplier and odd-power majorant
Fix D,L,P:ParameterChoice' D L, X:Inst D L, integer-valued a,b on HH(D), h:InWin L a b, j in lifts, s in T=host.TT. Write A=L.sc.a>0, w=L.sc.w'' n, S=L.Sc, theta=thW=1/(k x^(Scale.A/2)). Native Sc_facts gives S>=100, w>=5S. It uses m>=2, k>=m+3>=5, Del>=N(m)*m^10>=5120 and L.Sc_eq, P.kS_le. The same bound on Del implies N(m)<=Del and kaJ<=S for 1<=j<=m by the explicit linear expression kaJ=(k+(2j-1)(t+1))/2. Native fill_ge: w=b'/(xn)<=b'/x=b_scale/X'<=b_scale; the top/thick/thin offset lower bounds dominate w, and the added b on tops is nonnegative by InWin. Hence fillG=fill-kaJ>=w-S>=4w/5>0 (fillG_ge). Also 0<theta<=1/5 from k>=5 and x>1, Scale.A=26. The exact window gives A<=y=a(s)<=A(1+theta)<=6A/5.
For every natural exponent e, set f_e=1_{e odd} max(0,y/p^e-fillG(partner_e)), exactly askG's summand. For every prime p>=2, 0<=f_e<=1_{e odd} y/p^e. Comparison with the summable geometric series proves summability, including the zero term e=0. The odd series is y/p times sum_{r>=0}p^(-2r)=yp/(p^2-1). This is at most 4y/(3p) since p^2>=4. Thus the stronger native-hypothesis consequence
    0<=askG<=8A/(5p)<=3A/p.
The source uses the general, non-parity-specific bound y/(p-1)<=2y/p (L142–175) and then 2y<=3A. The improvement uses odd support explicitly; no new premise, and no claim that 8/5 is sharp under the full native positive-fill hypothesis. Unlike gainP in RUN13, this is a bound on askG, not on gain.

## 2. Exact high-prime support (no primality premise in ask_high)
Set V=X''=A/w>=1 (native w<=b_scale<=A), sigma=thS=theta+3S/w. Then 0<theta<=sigma<=4/5, and
 (w-S)(1+sigma)-w(1+theta)=S(2-theta-3S/w)>=0.
For natural p>V, p>=2 automatically. Then y<=w(1+theta)p. For odd e>=3, p^e>=4p and fillG>=4w/5, so y<=fillG*p^e. Every e except 1 has f_e=0, without an interchange issue since all terms are pointwise zero. Thus askG=max(0,y/p-fillG(partner_1)). For V<p<V(1+sigma), it is <=theta*w+S by y/p<=w(1+theta). For p>=V(1+sigma), y<=V*w*(1+theta)<=V*(w-S)*(1+sigma)<=(w-S)*p, so it is zero, including equality at the upper cutoff. The theorem ask_high quantifies over every natural p>V, not just primes.
Dfc high: VV empty because a nonempty VV implies Cand and p<X'<=V. gainP=0 by its p>V guard, tauP=0 by VV empty, ioP=0 by VV nonempty guard. Therefore Dfc is the sum of asks only. Summing the preceding bound over m lifts and N tops gives precisely dfc_high. Retain high-prime sum supplier N.n9 and all source high interval bounds from RUN22.

## 3. Low deficit: exact algebra before bounding
Fix K,C,bo, hG:GainBoundAt X K C bo a b; p prime, IsResidueClassZero D p, p<=V and lo>=0 (all native dfc_le premises). Let T'=TTP subset T, z=|T minus T'|, u=|T'|, N=z+u, m=|lifts|. Write g=sum_j gainP_j-tauP, l=lo, F=fl, i=ioP. Specialize hG (second conjunct, inert disjunct) to get sum_{j,s in T'}askG - m*u*l - m*F <= g. Exact decomposition:
 Dfc=sum_{j,s in T minus T'}askG + sum_{j,s in T'}askG - g + i
     <= sum_{j,s in T minus T'}askG + m*u*l + m*F+i
     <= (8/5)*m*z*A/p + m*u*l + m*F+i.
This is stronger than the native dfc_le, since u<=N and l>=0. The first inequality does not itself require l>=0; it is needed for the replacement u by N. No sign needed on g or i for that algebra; positivity of the final majorant comes later from lo/fl and the bound io_le, not from assuming i>=0. No assumption of existence of weights: the statement is for each pair satisfying InWin and GainBoundAt.

## 4. Low/high error suppliers: logarithmic factors and strict branches
Let B=C(cG+eta), U=C log x, Y=(k x^Scale.A)^4, R=C rG b' log x, Lc=La K L.sc, c3=b'/x+eta+C*w*log x/delta1+bo. Use C,bo>=0, K.La>=0, native positive scales, p prime inert, p0>0. Native L1=ceil(log_p Y), so p^L1>=Y>0 and p^(-L1)<=1/Y. For inert p the exact lo consists of B log_p(2A) plus:
- p<p0, p<X': R+U*(Lc*A/(pk)+A*p^(-L1)).
- p<p0, p>=X': R.
- p>=p0, p<X': c3+U*(Lc*A/(pk)+A/p^2).
- p>=p0, p>=X': 0.
No p0<X' premise is necessary for these four exhaustive branches. Each term nonnegative under the indicated hypotheses. Multiplication by log p>0 converts the common term to c1=B log(2A); use the ceiling bound for the lower-prime tail and A/p^2<=A/(p*p0) for p>=p0. Thus log(p)*lo<=c1+1_{p<p0}log(p)c2+1_{p<X'}log(p)c3+1_{p<X'}(log(p)/p)c4 with c2=R+U*A/Y and c4=U*(Lc*A/k+A/p0). Extra nonnegative terms in the low branch are harmless. These are exactly the native constants L163–172. For fl=C*f*(Nm^2 log_p A+(log_p A)^2), multiplication by log p gives C*f*(Nm^2 log A+(log A)^2/log p)<=cfl=C*f*(Nm^2 log A+(log A)^2/log 2), with nonnegativity since A>1 and C>=0. Log change of base is justified by p>=2 and the increasing natural log (log p-log 2=integral_2^p dt/t>=0). No prime density theorem introduced here.

## 5. Revised conditional budget for PointsLemma
Retain every premise of latticeChain_succ_of_partial (RUN22), including all PrimeSumNumericFacts, Sets, WReq, adm2, adm3, ArchimedeanSignatureMatching, hSig, nonnegative constants and GainBoundAll. Retain native E1 terms 1–4; replace omission coefficients 3 by c=8/5 in terms 5–7, and 4 by c+1=13/5 in term 8, because the additional io_le coefficient remains 1. This follows by multiplying the improved dfc bound by nonnegative log p, using sdiff_le and io_le, and taking max with zero against the nonnegative resulting majorant. No change to WReq or its threshold.
RUN22 and native sum_low L48–116 bound each of the first four contributions by M*(1/20,1/40,3/2,1/40), M=m*N*A/x>=0. The remaining four are now M*(c/120,c,c/120,(c+1)/120). Justification: b5<=1/(120x), b6<=1/x, b7<=N/(120x), b8<=1/(120x), exactly the native log-sum/exceptional-prime numerical hypotheses and estimates. (The log-div sum uses sum_{k<=floor X'}1/k<=1+integral_1^{floor X'}dt/t<=1+log X', RUN22.)
High contribution remains M/40 under N.n9. Summing all nine coefficients in denominator 600 gives (30+15+900+15+8+960+8+13+15)/600=1964/600=491/150.
    sum_{p in finite inert S} log(p)*max(0,Dfc(p)) <= (491/150)*M <= 5*M.
This is a conditional strengthening of the first PointsLemma conjunct, not a new proof of any weighted sparsity/admission hypothesis. The second io sum is unchanged. No independent Lean replay, no proof-root edge authentication for these local theorems, no demonstrated URT acceleration. The original constant 5 remains valid.

## 6. Reproduce finite regression (executed in V8; replace text(c) by console.log(c) in Node)
The test uses exact BigInts, finite odd-power sums and simplified real-parameter instances, not native number-field operators. It exercises composite p as permitted in the high lemma; the full low argument only needs p>=2 but its native hypothesis remains prime. All general claims rely on the analytic derivations, not finite testing.
```js
const c={ask:0,high:0,cutoff:0,deficit:0,budget:0,negative:0};const ck=(b,k)=>{if(!b)throw Error(k);c[k]++};
for(const p of [2n,3n,4n,5n,7n,11n])for(const w of [500n,1000n,2500n])for(const S of [100n,200n,500n])if(5n*S<=w)for(const X of [2n,5n,12n])for(const t of [0n,1n,2n])for(const y10 of [10n*w*X,(10n+t)*w*X])for(const F of [w-S,w,2n*w]){
 const A=w*X;let num=0n;const den=10n*p**7n;
 for(const e of [1n,3n,5n,7n]){let n=y10-10n*F*p**e;if(n>0n)num+=n*p**(7n-e)}
 ck(0n<=num&&5n*p*num<=8n*A*den,"ask");
 ck(w*w*(10n+t)<=(w-S)*(w*(10n+t)+30n*S),"cutoff");
 if(p>X){
  ck(num===(y10>10n*F*p?(y10-10n*F*p)*p**6n:0n),"high");
  const inBand=10n*w*p<X*(w*(10n+t)+30n*S);
  ck(inBand?num<= (t*w+10n*S)*p**7n:num===0n,"high");
 }
}
for(const m of [1n,2n,3n])for(const N of [0n,1n,2n,3n])for(let served=0n;served<=N;served++)for(const lo of [0n,2n,5n])for(const fl of [0n,4n])for(const io of [-3n,0n,4n])for(const q of [0n,3n,8n])for(const r of [0n,3n,8n])for(const slack of [0n,5n]){
 const full=m*(served*q+(N-served)*r), net=m*served*(q-lo)-m*fl+slack, dfc=full-net+io;
 ck(dfc<=m*(N-served)*8n+m*served*lo+m*fl+io,"deficit");
 ck(dfc<=m*(N-served)*8n+m*N*lo+m*fl+io,"deficit");
}
const old=[30n,15n,900n,15n,15n,1800n,15n,20n,15n],newB=[30n,15n,900n,15n,8n,960n,8n,13n,15n];
const sum=a=>a.reduce((s,v)=>s+v,0n);
ck(sum(old)===2825n&&sum(newB)===1964n,"budget");ck(sum(newB)*150n===491n*600n,"budget");
ck(5n*2n*12n*2n===8n*10n*(4n-1n),"negative");
ck(6n*7n>8n*4n,"negative");
ck(2n*5n>8n,"negative");
// without served gain lower bound, one served ask=8, net=0, lo=fl=io=0, omitted=0.
ck(8n>0n,"negative");
console.log(c);
```
Actual corrected execution: {"ask":1944,"high":1512,"cutoff":1944,"deficit":19440,"budget":2,"negative":4}. 24842 positive assertions plus four controls (first control equality of geometric majorant with zero fill, second dropping parity, third dropping window, fourth dropping gain premise). Initial run failed due to a factor-two typo in the first control, fixed by using p rather than p^2 in the numerator; all prior assertions and all corrected controls then executed. These regressions include nonnative theta=0 and m=1, harmless for testing the weaker algebra; do not claim that these represent valid native D7. No CI replay of this embedded script.

## RESUME HERE
Request independent audit of the 8/5 askG bound, exact served-cardinality algebra, strict high cutoff and 491/150 budget. Ask dependencies/kernel/acceleration for exact role-labelled path from Main to manifest rows 1289266,1285612,1289250 and then to latticeChain_succ_of_partial/dfc_le; no duplicate scans. Next translate actual source of PrimeSumNumericFacts eventual family supplier (all n1–n9 fields) only if relevant; otherwise prioritize authenticated root-reachable UpperTheory.Comparison₂.core_gm (manifest 864997) in coordination with audit and math lanes, avoiding their existing work. Keep weighted sparsity inputs as obligations and distinguish H removal from P reachability. HANDOFF TO audit, dependencies, kernel, acceleration, integration, editor, prime_window. Full RH reconstruction OPEN.

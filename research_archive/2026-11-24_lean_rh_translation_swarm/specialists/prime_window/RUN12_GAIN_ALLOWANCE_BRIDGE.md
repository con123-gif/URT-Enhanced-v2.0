# RUN12 — Gain allowance bridge to the retained-top prime window

Status: SOURCE-LINKED CONDITIONAL HUMAN DERIVATION; finite exact arithmetic checks executed. Not an original Lean theorem name, not Lean kernel replay, not full LinkG or RH. Source pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005. Latest observed upstream head 307cef33f046955ee79dba47e0d828d06496d75f, unchanged from RUN11.

## Preflight and task boundary

Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, continuity/research state/log/protocol excerpts, RUN11, recent peer commit handoffs, acceleration RUN12 and combined 47-target dependency request. CI checkpoint 385 at 18:02:52 is unrelated physics CI, not RH validation. External blueprint not reread; peer scan not exhaustive. No overlap found with this exact allowance comparison. RUN11 transports the third LinkG_at conjunct into loss_bound_at; this run identifies a conditional route to that conjunct from the separate AuxBlock8.Conclusion1 estimate, and the actual source lemma producing the askP/askG comparison. A search returning no direct LinkG producer is not evidence of nonexistence. No unconditional producer claimed.

## 1. Exact sources and scopes

All line references below are to the original pin; prefix for links:
https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/

- src/Formalism/SharpRestriction/GrowthBounds/SmallOrderPrimes.lean (blob a35ad58d20f072b48cbb03f619f1bf0f1501e66f), 15–21: Formalism.MainNotions.AuxBlock8.Conclusion1 D L X K C bo. For EVERY natural prime p with IsResidueClassZero D p OR IsSg D p and p ≤ X'', all lifts j satisfy 0 ≤ gainP ≤ 4|TT|a/p, and
  sum_{j,s in TTP} (askG X (aL L) (bL L) p j s - G.lo K L C bo p) - m G.fl ≤ sum_j gainP - tauP.
  Here sum over j is over all lifts; the same p, weights, X,K,C,bo are used throughout. Conclusion2 (23) is a different MeanKappaBound proposition.
- src/Formalism/SharpRestriction/GlobalTheoremInputs.lean (blob ba31f5120ed089d48968754ae577427912d467c5), 97–120: InertK, flG, rG, leastPowerExponent, loG. LinkG_at (122–136) has FIVE clauses. Third (129–135): for every place w with InertK at p=resChar(w) and p≤X'', gain bounds and sum_{j,t in TTw(w)} (vonMangoldtClassSum - loG) - m flG ≤ sum_j L.gain - L.tau. LinkG (138–140) has common existential C,x0,δ→0 before all x≥x0 and all i. GlobalTheoremInputs (158–164) still assumes LinkG.
- src/Formalism/SharpRestriction/GrowthBounds/IsResidueClassZero.lean (blob 9fbb7879d0519f9a136e190551422881ef5d2f0b), 37–59: G.rG, cG=4Sc, Nm=N(m), G.L1, G.La; 100–102: inertClass and signal definitions (opposite disjunction order in InertK); 154–159 fill and fillG=fill−kaJ; 362–374 TTP and odd-index infinite sums askG, askP; 378–393 G.lo and G.fl; 395–410 aL,bL, ParametersFill. G.rG agrees with the main rG by the definitions. Neither ask sum is automatically the finite arithmetic sum without a fill and truncation argument.
- src/Formalism/LocalRingCardinality/DataParams₂.lean (blob 50914500995df91e2646d91a6c5c99a7e603a51b), 9–45: x>1, 0<eps<1/52, J≥1, b=exp(x^eps), a=xb>1, X'=exp(x^(eps/3)), b'=a/X', w''=b'/(xn), X''=a/w'', A=26, p0=k²x^A, delta1=x^(-eps/8)>0. Top weight conditions 80,83. Sc and eta positivity 142–164; TTw and wPart≥1 at 166–180; finite vonMangoldtClassSum at 240–242, odd i in range Nat.log p (aT t).toNat+2. Params.lean (blob 09d1aeec3049821ed6d190c7970cdca9ec5b34cf) 6–14: k≥m+3≥5.
- src/Formalism/LocalToGlobal/GlobalTheory/SuppSat.lean (blob 80c1d0526b661eae74d87ec3b569d6a459e900ce), 94–101: PtH; includes all-place fills, support saturation for p≤X'', K.Nonneg. Retain full record, not just the fields used below.
- src/Formalism/LocalToGlobal/GlobalTheory/PowFourLtCeilThresholdPrime.lean (blob 8166795ec6e846795d7272781119ee7d17d426c0), 298–310 ask_at; 766–816 loss_bound_at, downstream consumer covered RUN11.

## 2. Different cutoff exponents: exact inequality

Put B=k²x^(3A), B_G=(kx^A)^4=k⁴x^(4A)=B*p0.
For p prime with p<p0, log_p B_G = log_p B + log_p p0 ≥ log_p B+1. Both B and B_G exceed 1; natural ceiling coincides with the ordinary ceiling on their positive logarithms. Integer translation of the ceiling gives

ell = ceil_N(log_p B)+1 ≤ E = ceil_N(log_p B_G) = G.L1.

Thus p^(-E) ≤ p^(-ell). This is not the RUN10 guard B≤p^(ell−1); it compares two distinct native exponents. It is valid also at p=p0 but the actual branch uses strict p<p0. No need to assume p0≤X'.

## 3. Comparison of lower and floor allowances

Assume C≥0 and fix C*=max(1,4C), independently of p and w. Let S=Sc, η=etaSz, W=w'', t=D.R.t, U=b'/x, H=log x/delta1, Z=log_p(2a), R=rG. All are nonnegative. From K.Nonneg, G.La=K.La*N1² log a≥0, and the last field of ParametersFill identifies it with L.LaG. For each prime p:

(a) Common term: C(4S+η)Z≤C*(S+k+η)Z, where C* denotes the enlarged constant, not multiplication by an unspecified factor.
(b) Both special prime terms vanish off inertClass, including signal. If inert and p<p0, old R b' log x times C is bounded by the same term times C*. If inert and p≥p0 and p<X', old term U+η+CWH+bo is bounded by new term C*(U+η+S+(W+t)H)+bo: their difference is (C*−1)(U+η)+C*S+(C*−C)WH+C*tH≥0. The signed bo cancels exactly. Otherwise these terms are zero.
(c) The order correction occurs only for inert and p<X'. Compare C log x [La*a/(pk)+a p^(-E)] to C* log x [La*a/(pk)+a p^(-ell)] in the low branch; the preceding exponent inequality and nonnegative factors prove the comparison. The other branch uses a/p² in both expressions.

Hence G.lo(C,bo)≤loG(C*,bo). Also G.fl(C)≤flG(C*) since both multiply the same nonnegative coefficient f*N(m)^2*log_p a + f*(log_p a)^2. This preserves the separate thresholds and class conditions; it is not a definitional identification of lo and loG.

## 4. Actual native supplier of askP≤askG

src/Formalism/SharpRestriction/GrowthBounds/LogarithmicSums/Conclusion1OfGainBoundAll.lean (blob a37d19e7affc2c873c5a325fb25af7bf7834d9a0), 99–127: InWin, GainBoundAtPairUniform/AllUniform (askP), GainBoundAt/All (askG), RequiresAll. RequiresAll quantifies all a,b with a_s≤2a_scale and b_s≥0 on tops, then every prime p, every lift j and top s. It bounds askP≤askG≤askP+Nm log_p(2a). inWin_sizeData (151–154) supplies native top weights.

src/Formalism/SharpRestriction/GrowthBounds/LogarithmicSums/GainBoundAllAddOneOfGainBoundAllRequired.lean (blob dfe9f7e2fcb214def5642643ea24ad562c40fa10), namespace Formalism.MainNotions.AuxBlock8.Pf.As:
- shift_ge (12–35), p≥2, y,κ≥0, w≥0, decidable Q: the nonnegative terms (y/p^e−w_e−κ)_+ are ≤(y/p^e−w_e)_+ on Q, and summability follows by domination by y(1/p)^e.
- shift_le (37–131), additionally y≤A, A≥1, w≥1, Q⇒Odd: difference per index lies in [0,κ], vanishes unless p^e<A. Such positive odd indices number at most floor(log_p A), hence total difference ≤κ log_p A. Exclusion of e=0 matters. This is a finite support argument, not an estimate of a divergent series.
- n_pos (133–137), fill_ge (139–174), kaJ_bounds (176–189), asksAll_of (191–247): assumes Nm D+1≤w'' and the native data. The top/thick/thin offset constraints give fill≥w'', and 0≤kaJ≤Nm gives fillG≥1. Apply shift_ge/shift_le with w=fillG and κ=kaJ; if a_s<0 both sums vanish. Thus RequiresAll is actually produced under its size premise.
- lo_succ (249–307), fl_succ (309–331), TTP_subset₂ (333–337), gainBoundAll_add_one_of_gainBoundAllRequired (339–389): assumes K.La≥0, RequiresAll, Nm≤cG and GainBoundAllUniform at C. Increasing C to C+1 enlarges lo by at least (cG+eta)log_p(2a), absorbing the per-top ask correction; the floor does not decrease. The retained set is a subset of the tops. This yields GainBoundAll at C+1. No unconditional uniform gain assertion is supplied by this lemma.

## 5. Conditional third-conjunct bridge (new human derivation, no Lean replay)

Assume PtH, RequiresAll, Conclusion1 at C≥0. Fix any place w satisfying the native third-clause class and cutoff; retain the explicit premise that its residue characteristic p is prime (the native place-record primality supplier still to trace). The class predicates agree up to disjunction order. ParametersFill identifies wPart for every j,t,e with the filled weight. For t in TTw, aL L t=aT t>0. Since wPart≥1, e≥Nat.log p (aT t).toNat+2 implies p^e>aT t and the positive part vanishes. Odd excludes zero. Consequently vonMangoldtClassSum equals askP for that t by exact truncation of the tsum.

The top-size fields give aL≤2a and bL≥0, using k≥5, x>1, A>0. RequiresAll then gives askP≤askG. ParametersFill maps TTw into TTP with the injective subtype map, so reindex the finite sum without multiplicity loss. PtH support saturation puts w in support; fill identifies gainP with L.gain on that support and class, and tauP with L.tau. Apply Conclusion1's pointwise gain bounds and its retained-top sum, using Section 3 termwise and m≥0 for the floor:

sum_{j,t in TTw(w)}(vonMangoldtClassSum j t p - loG(C*,bo)) - m flG(C*)
≤ sum_{j,s in TTP}(askG p j s - G.lo(C,bo)) - m G.fl(C)
≤ sum_j gainP - tauP = sum_j L.gain - L.tau.

This yields precisely the third-clause estimates on the stated domain, subject to the explicit residue-prime premise. If these inputs hold uniformly eventually with one C and the same bo(x,i), then C* is a single constant for all x,i,p,w; no exchange of the family existential and universal quantifiers. The other four LinkG_at clauses remain separate obligations. No claim that Conclusion1 is itself discharged along the RH root.

## 6. Actual family frontier

src/Formalism/SharpRestriction/GrowthBounds/LogarithmicSums/RemainingCountingStatement.lean (blob b9435d525f79b2af1a971259b99c155f7b90ce63), 10–19: FamilyAskBounds and RemainingCountingStatement are propositions, not proven by their definitions. The latter quantifies K nonnegative, C31>0, Ce,Cm≥0, then exists a single C≥0 before all X,Y; AdmFam implies eventually GainBoundAll(C,b^(x^(-eps/2))). stmtEF_of (47–74) assumes these, plus h2,hW,h3,hT; chooses the same C, takes the maximum of six thresholds and uses inWin on aL,bL. It does not prove RemainingCountingStatement. AdmFam itself (Conclusion1OfGainBoundAll 156–159) is ∀δ>0 ∃x0>1 ∀x≥x0 ∀i admitted.

src/Formalism/SharpRestriction/GrowthBounds/LogarithmicSums/StarFam.lean (blob 77ce70d77fff63c80a591d6a3b7636c9e7d5fc7a), 11–36: actual star_fam, under K.Nonneg, C31>0 and AdmFam, produces eventual StarAll; that is not yet GainBoundAll. StarAt/StarAll defined in Conclusion1OfGainBoundAll 129–134. This is the next upstream counting frontier.

## 7. Executed reproducible finite check

Run the following JS with Node or another BigInt-capable ECMAScript runtime. The run used V8. All numerical computations are exact integers; log coefficients in the envelope test are nonnegative symbolic fixtures, not numerical evaluations of real logs or actual geometry. The fixtures include signed bo and distinct threshold branch orderings. The four negative witness assertions illustrate why same C, C=0 in the medium branch, removal of the exponent guard, and allowing e=0 in the shift estimate are not justified. These tests are regression checks of algebra, not Lean validation.

~~~js
function check(){
 const c={ceiling:0,reciprocal:0,envelope:0,transport:0,cutoff:0,shift:0,negative:0};
 function ck(b,k){if(!b)throw Error(k+" "+c[k]);c[k]++}
 const max=(a,b)=>a>b?a:b;
 function ceilLog(p,n,d=1n){let v=d,e=0;while(v<n){v*=p;e++}return e}
 function floorLog(p,y){let v=1n,e=0;while(v*p<=y){v*=p;e++}return e}
 const ps=[2n,3n,5n,7n,11n,13n,17n,19n,23n,29n,31n,37n,41n,43n,47n];
 for(const p of ps)for(let k=5n;k<=10n;k++)for(let d=1n;d<=6n;d++)for(let n=d+1n;n<=d+8n;n++){
  const A=26n, rN=k*k*n**A,rD=d**A;
  const lowN=k*k*n**(3n*A),lowD=d**(3n*A);
  const oldN=k**4n*n**(4n*A),oldD=d**(4n*A);
  ck(oldN*lowD*rD===lowN*rN*oldD,"ceiling");
  if(p*rD<=rN){
   const ell=ceilLog(p,lowN,lowD)+1, E=ceilLog(p,oldN,oldD);
   ck(ell<=E,"ceiling");ck(p**BigInt(E-ell)>=1n,"reciprocal")
  }
 }
 for(const p of [2n,3n,5n])for(let C=0n;C<=5n;C++)for(let s=1n;s<=4n;s++)for(let k=5n;k<=7n;k++)for(let eta=1n;eta<=3n;eta++)for(let mode=0;mode<5;mode++)for(let gap=0;gap<=2;gap++){
   const D=max(1n,4n*C), t=3n,B=7n,w=2n,r=11n,logx=3n,ell=2, E=ell+gap,a=17n,laPart=13n,deltaInv=2n,lb=5n,bo=-9n;
   const scale=p**BigInt(E), isI=mode!==0, low=mode===1||mode===4, win=mode===1||mode===2;
   const oldPr=!isI?0n:low?C*r*B*logx:win?B+eta+C*w*logx*deltaInv+bo:0n;
   const newPr=!isI?0n:low?D*r*B*logx:win?D*(B+eta+s+(w+t)*logx*deltaInv)+bo:0n;
   const oldOr=isI&&win?C*logx*(laPart*scale+(low?a:a*scale/(p*p))):0n;
   const newOr=isI&&win?D*logx*(laPart*scale+(low?a*p**BigInt(gap):a*scale/(p*p))):0n;
   const old=scale*(C*(4n*s+eta)*lb+oldPr)+oldOr;
   const newer=scale*(D*(s+k+eta)*lb+newPr)+newOr;
   ck(old<=newer,"envelope");
   const oldFloor=2n*C*scale, newFloor=2n*D*scale;
   const G=15n*scale, P=12n*scale, m=2n;
   const rhs=m*(G-old)-m*oldFloor;
   ck(m*(P-newer)-m*newFloor<=rhs,"transport");
 }
 for(const p of ps.slice(0,8))for(let y=1n;y<=90n;y++)for(let A=y;A<=y+4n;A++)for(let k=0n;k<=4n;k++){
  const N=floorLog(p,y)+2, F=floorLog(p,A), E=Math.max(N+4,F+2), den=p**BigInt(E);
  let before=0n,after=0n,finite=0n,count=0n;
  for(let i=0;i<=E;i++){
   const pe=p**BigInt(i);if(i%2===0)continue;
   const w=1n+BigInt(i%3); const u=y*(den/pe), b=max(0n,u-w*den),a=max(0n,u-(w+k)*den);
   before+=b;after+=a;if(i<N)finite+=b;if(pe<A)count++;
  }
  ck(before===finite,"cutoff");
  ck(after<=before&&before-after<=k*count*den&&count<=BigInt(F),"shift");
 }
 ck(4n*10n+1n>10n+5n+1n,"negative");
 ck(7n+2n>0n,"negative");
 ck(ceilLog(101n,5n)+1>ceilLog(101n,20n),"negative");
 ck(1n>0n,"negative");
 return c;
}
console.log(JSON.stringify(check()));
~~~

Actual output: {"ceiling":8640,"reciprocal":4320,"envelope":9720,"transport":9720,"cutoff":18000,"shift":18000,"negative":4}. Total 68,400 positive assertions; four simple witness assertions. Last witness represents the positive shift loss numerator for p=2, y=A=3/2, w=1, κ=1/2 at e=0: loss=κ>κ log₂(3/2). The strict log inequality follows from 1<3/2<2, not floating point.

## 8. Upstream comparison and limitations

At head 307cef33f046955ee79dba47e0d828d06496d75f:
- IsResidueClassZero blob 0622fc3b6d32afcdece44b5bac2496fd8ab099a6: pinned 37–59 at 75, 100–102 at 138, 378–393 at 404, 395–410 at 421 match. TTP/askG/askP individually match at 388–390, 394–395, 399–400; combined block differs by extra blank lines.
- GlobalTheoremInputs blob 5c32a96fe300e445ca6fe371b1b95e99632edae6: pinned 97–140 now starts 121, matched.
- DataParams₂ blob 3d693d76e763b7b7b9d7c5679c223ac91cc92692: pinned 41–43 now starts 83, matched.
- SmallOrderPrimes blob ad70c916f276a693ddd51cb9387c38ebaeb4ffb7: pinned 15–23 now starts 51, matched.
- GainBoundAllAddOneOfGainBoundAllRequired and RemainingCountingStatement same-path head retrieval returned 404. Relocation vs removal unresolved; do not infer equivalence or absence.

Peer manifest membership LinkG_at 869799, LinkG 869816, Loss.loss_bound_at 1076940 is not a proof edge. Reverse role projections requested, pending independent verification. The original pinned source remains authoritative for this checkpoint. No Lean execution performed.

## RESUME HERE

Locate the native residue-characteristic primality supplier; then follow actual reverse dependency/role references from GainBoundAllUniform, RemainingCountingStatement, Conclusion1 and LinkG. In particular trace StarAll to the uniform counting inequality, keeping all candidate exceptional cases and admitted-family premises. Do not conflate the conditional bridge above with a native unconditional LinkG theorem. Independent audit requested: verify both lower allowance formulas, ceiling direction, support and subtype transport, bo cancellation, family scopes, and actual kernel-root provenance. Editor may integrate Sections 2–5 only as a conditional bridge until audit and producer tracing complete.

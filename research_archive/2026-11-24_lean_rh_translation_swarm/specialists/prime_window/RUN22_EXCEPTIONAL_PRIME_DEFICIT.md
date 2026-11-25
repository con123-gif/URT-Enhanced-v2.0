# RUN22 — exceptional-prime losses, exact fibre identity and PointsLemma assembly

2026-11-25. RESULT: SOURCE-MATCHED independent reconstruction of the pinned adm2/BTT/adm3 consumer; exact finite regression executed. The two weighted estimates remain hypotheses, not unconditional arithmetic results. The local dependency chain is authenticated by source text, not by a Main-root elaborated path. No kernel replay or URT speed claim.

## Provenance and continuity
P=40e56bab026552e089d7afcfeff08d2defb9c005, leanprover-community/riemann-hypothesis. H=27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59 (2026-11-25 04:16:12 UTC; merge PR 2057), previous observed fcb6eac7534875d32d68030967e2deae6d686151. All paths below relative to src/Formalism/SharpRestriction/GrowthBounds/ at P unless otherwise stated.
- SmallOrderPrimes.lean a35ad58d20f072b48cbb03f619f1bf0f1501e66f L32–45 WReq/PointsLemma, L85–103 primesResidueBelow/BTT/adm2/adm3, L107–114 ArchimedeanSignatureMatching, L241–277 admitted/family definitions.
- IsResidueClassZero.lean 9fbb7879d0519f9a136e190551422881ef5d2f0b L37 hG, L97–102 hP/class definitions, L141–184 Inst/stepP/reps/topsOn/Nv/topsPos/Good, L279–293 Cand/goodReps/Sig/VV, L348–351 ioP, L362–365 TTP.
- LogarithmicSums/DfcHigh.lean 3ae0d61345dc80d56ce8093ed9e3fb9637f6ae91 L14–34 dropI/WReq_iff/candidate membership/lp_nonneg, L38–90 Dfc/io_le, L92–173 not_singular_of_central/TTP_subset/sdiff_le, L175–178 dfc_le statement.
- LogarithmicSums/SecondConstantNonneg.lean 9a81c995f590ec0a1a7aa4c92729b804f38514dc L12–33 PrimeSumNumericFacts, L73–96 Sets/E1, L98–142 low_le.
- LogarithmicSums/PrimeSums.lean 71ac80d66bb05a93246e321f4258d81d7830b22f L11–68 sum_ite_mem_le, mem_prB, card_prB_le, sum_log_prB, sum_logdiv_prB.
- LogarithmicSums/LatticeChainSuccOfPartial.lean c48148c0af73a80a8647630b9bfc484594b3d641 L12–27 exponent lemmas, L29–116 sum_low, L118–173 sum_high, L175–187 inWin_of_box, L189–258 latticeChain_succ_of_partial.
- LogarithmicSums/RemainingCountingStatement.lean b9435d525f79b2af1a971259b99c155f7b90ce63 L31–40 FamilyFifthBound/RestT, L47–80 stmtEF_of/stmtF_of_stmtEF.
- src/Formalism/LocalRingCardinality/DataParams₂.lean 50914500995df91e2646d91a6c5c99a7e603a51b L9–17, L27–45 scale ranges and definitions.

Preflight: SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, RUN21, correct research state/log/protocol/continuity locations and latest general CI #416 run 45540458272 (before this commit; not RH evidence), 30 latest branch commit subjects and peer handoff excerpts from all 14 other lanes (editor commit metadata only, not its full manuscript). Acceleration RUN22 explicitly has prime requests 302–304 for AdmFam/AdmF/FamilyClosedForm; dependencies 0412 reports 300 projections, but no prime root path reported in that summary. Do not duplicate extraction; request exact results. No duplicate of the following local translation observed in inspected notes. Not every peer artifact or the linked external blueprint reread. No physics changes.

## 1. What adm2 and adm3 actually assume
Fix native D,L,X,K, scale x>1, 0<e<1/52. Write U=L.sc.X', V=L.sc.X'' D.R.n, T=D.host.TT, N=|T|, q=x^(e/4), o(p)=addOrderOf(hP D p), w(p)=log(p)/p. Here class-zero means inertClass, not signal. Native X'_le_X'' yields U<=V (LatticeChain L196, n_pos D). Directly V=x*n*U by a/w'' with positive n.
Let
 A3={p prime, inert, p<V, o(p)<q};
 A4={p prime, InBand D K L.sc p, p< U via the band definition};
 PS={p prime, inert, p<U, q<=o(p)}.
All are finite, represented by natural ceiling range filters. Strict p<V in A3 must not be changed to <=V; at p>=U the omission is zero, so no endpoint gap. Order equality belongs to PS, not A3.
For t in T let r_p(t)=X.bs(stepP D p)t. Write B_p=#{t in T : not Good X p (r_p(t))}. Good is the specified IsGoodOrbit on topsPos with exact native orbit parameters, not an arbitrary prime property.
 BTT=sum_{p in PS} w(p) B_p.
 adm2: n*delta1/2<=N<=2*n*delta1 AND BTT<=N*x^(-2+e).
 adm3: sum_{p in A3}w(p)<=x^(-hG+e)=x^(-2-7e).
These are distinct weighted sparsity assumptions on the bad orbit mass and small-order primes. Neither follows merely from finite cardinality or from the adm5/Archimedean estimates. The local consumer LatticeChain L197 uses only the second conjunct of adm2. This is not permission to erase the first conjunct globally.

## 2. Exact fibre identity (strengthening of local inclusion)
By definition reps=image of r_p on the full finite HH D. Thus every r_p(t) is in reps, even without using bs_orb or bs_step. By definition goodReps={r in reps:Good X p r}. For every t in T:
 r_p(t) in goodReps iff Good X p r_p(t).
Taking complements within T proves exact finite-set equality
 T minus {t in T:r_p(t) in goodReps} = {t in T:not Good X p r_p(t)}.
Consequently B_p=sum_{r in reps, not Good X p r} Nv X p r, because fibres topsOn partition T. LatticeChain L214–222 proves the weaker inclusion and card bound hbad. A bad orbit with many tops is weighted by its number of tops, not counted once.

## 3. Construct all nine fields of Sets
Use A3,A4,PS,B_p above. hA3: p<U<=V implies p<V. hA4: from prime and band membership and p<U; hPS: Cand includes all PS membership conditions; hPSsub: PS subset prB U; hbad: §2; hbad0: B_p>=0. s3=adm3; s4=last conjunct of ArchimedeanSignatureMatching; s2=second conjunct of adm2. This is the actual construction at LatticeChain L201–226, including the strict bounds. No new choice of constants or primes.

## 4. Pointwise omission estimate sdiff_le
Fix a,b and assume Sig>=0 on Cand. Let z_p=|T minus TTP|, d_p=1 if Sig>x^(-e), else 0; write W_p=1_Cand*w(p)*(2*d_p+4*Sig). Since w>=0, all RHS terms below are nonnegative. For prime inert p:
 w(p)*z_p <= N*1_A3*w(p)+N*1_A4*w(p)+1_PS*w(p)*B_p+N*W_p.
Proof by the source's cases (DfcHigh L138–173):
- If p>=U, TTP=T by definition, z_p=0. (Signal is excluded by distinct class constructors.)
- If p<U and o(p)<q, p belongs to A3; z_p<=N.
- If p<U, o(p)>=q and p>=p0 and InBand, p belongs to A4; z_p<=N.
- Otherwise p<U and o(p)>=q with the band exclusion, hence Cand and PS. If Sig<=x^(-e), VV=goodReps and z_p=B_p by §2. Otherwise d_p=1; 2+4*Sig>=1, so the fourth term dominates w(p)*N.
Equality at the Sig threshold is the served case, not dropped. A3 and A4 need not be disjoint; this is a nonnegative majorant, not a partition of prime sets.
Summing over any finite S of inert primes and using the three Sets bounds and WReq gives the independent corollary:
 sum_{p in S} w(p) z_p <= N*(x^(-2-7e)+x^-1+x^(-2+e)+x^-9).
This corollary is conditional, and does not establish adm2/adm3 themselves.

## 5. How the exceptional estimates enter the exact deficit budget
Keep ALL source hypotheses of latticeChain_succ_of_partial: K.Nonneg, P:ParameterChoice' D L, C>=0, bo>=0, GainBoundAll X K C bo, Sig>=0 for every a,b and candidate p, adm2, adm3, ArchimedeanSignatureMatching, PrimeSumNumericFacts D L K C bo. For every a,b in their specified boxes with WReq, inWin_of_box supplies InWin and GainBoundAll specializes to GainBoundAt.
Dfc=sum_{j,s in T}askG - (sum_j gainP - tauP - ioP). The local dfc_le (statement L175–178) bounds Dfc by 3*m*a*z_p/p + m*N*lo + m*fl + ioP; uses p prime inert, p<=V, InWin, GainBoundAt and lo>=0. Keep the native lo_bounds/fl_bounds and io_le suppliers; no claim of independent reconstruction of their full internal proofs in this run. Multiplying by log p>=0 and taking max with zero is safe because the majorant in low_le is nonnegative, by all the sign premises. This is low_le's eight-term E1 with the omission inequality and the extra io allowance (3+1=4 coefficient for W_p).

Let M=m*N*a/x>=0. For arbitrary finite S of inert primes split into p<=V and p>V (inclusive boundary in low branch). For low branch the eight sums b1–b8 are dominated, respectively, by:
  V+2; log(4)*p0; log(4)*U; log(U)*(1+log(U)); 1/(120*x); 1/x; N/(120*x); 1/(120*x).
Explanation:
- Finite subset monotonicity of nonnegative terms (PrimeSums L11–16). #prB(y)<=ceil(y)<=y+1; p<=V implies p<V+1.
- The two log sums use the imported Mathlib Chebyshev.theta_le_log4_mul_x (not a new proof of Chebyshev here); native prB(y) subset of primes <=floor(y).
- For y>=1, log p<=log y and sum_{p<y}1/p <=sum_{k=1}^{floor y}1/k <=1+integral_1^{floor y}dt/t <=1+log y, by monotonicity of 1/t on each [k-1,k], k>=2. This gives the fourth bound, including y=1.
- A3 exponent -2-7e<=-2; x>=120 gives x^-2<=1/(120x). A4 bound is the original x^-1. PS uses N.n7, which is exactly x^(-2+e)<=1/(120x), equivalent for x>1 to x^(1-e)>=120, eventually uniform at fixed e<1. WReq exponent -9<=-2 likewise.
Now multiply by the nonnegative E1 coefficients, using every numerical field N.n1,n1',n2,n3,n4,n5,n7 and N.one_le_card_tops in the low branch:
 q1=M/20 (both n1/n1' and N>=1);
 q2=M/40; q3=3M/2; q4=M/40;
 q5=M/40; q6=3M; q7=M/40; q8=M/30.
Their exact sum is (281/60)M <=(47/10)M. Source sum_low uses the latter bound. For high branch retain N.n9 and dfc_high; sum_high uses the integer interval (floor V,ceil(V*(1+thS))] and its cardinal <=V*thS+2. Points outside the strict upper support contribute zero; log p<=log(2V) on support under native thS bounds. This gives M/40. Hence the displayed q bounds in the pinned argument actually yield (113/24)M<=5M, slightly sharper than the original 5M target (the native proof first rounds low to 47/10). This improvement is merely constant bookkeeping, not a change to any required hypothesis.
Second PointsLemma conjunct: io_le and sum_ite_mem_le with nonnegative W_p and WReq give sum_{p in S}log(p)*ioP<=m*N*a*x^-9 for every finite prime S. All weight vectors are quantified BEFORE S, but WReq is assumed for each chosen pair; no existence of a,b inferred.
Native exact downstream: latticeChain_succ_of_partial concludes PointsLemma; FamilyFifthBound is a predicate requiring eventual GainBoundAll -> PointsLemma; stmtEF_of consumes it alongside FamilyAskBounds, RemainingCountingStatement, FamilyFourthBound, RestW, RestT to produce FamilyClosedForm. The local theorem is not itself a proof of FamilyFifthBound without its uniform suppliers. No authenticated root path from Main.riemannHypothesis to these declarations or actual family constructor obtained.

## 6. Upstream changes
H SmallOrderPrimes blob ad70c916f276a693ddd51cb9387c38ebaeb4ffb7 (same as RUN21 head's file): L233–239 drops adm2/adm3 and PointsLemma/WeightVectorExists/WeightedPrimeSumBound from its local admitted/Conclusion₂ predicates. H pinned paths for LatticeChainSuccOfPartial.lean and RemainingCountingStatement.lean return 404, and H LogarithmicSums directory has seven files instead of the 21 in P. This is positive evidence of restructuring/removal at these paths, not proof of elimination everywhere or equality of whole proof obligations. Keep P obligations and source hashes, do not silently substitute H. Exact source role paths requested via acceleration request indices 302–304; no claim of root reachability or absence.

## 7. Exact finite regression (executed V8; copy to Node)
The finite tests abstract Good, orbit map, candidate/prime flags and nonnegative log weights. These are structural regressions, NOT native D7 or an arithmetic/Lean proof. The derivation above supplies the general argument.
```js
const counts={fibres:0,pointwise:0,weighted:0,thresholds:0,budget:0,negative:0};
const ck=(v,k)=>{if(!v)throw Error(k);counts[k]++};
for(let a=0;a<3;a++)for(let b=0;b<3;b++)for(let c=0;c<3;c++){
 const bs=[a,b,c],reps=new Set(bs);
 for(let T=0;T<8;T++)for(let G=0;G<8;G++){
  const tops=[0,1,2].filter(t=>T>>t&1), good=r=>!!(G>>r&1);
  const goodReps=new Set([...reps].filter(good));
  const bad=tops.filter(t=>!good(bs[t])).length;
  ck(bad===tops.filter(t=>!goodReps.has(bs[t])).length,"fibres");
  ck(bad===[...reps].filter(r=>!good(r)).reduce((s,r)=>s+tops.filter(t=>bs[t]===r).length,0),"fibres");
 }
}
for(const X of [3,5,7,11])for(const XX of [X,X+4,X+12])for(const p0 of [2,5,9])for(const p of [2,3,5,7,11,13])for(const ord of [0,1,2,3,4])for(const cut of [1,2,3])for(const inBand of [false,true])for(const sig of [0n,1n,2n,3n,4n,8n])for(const N of [0n,1n,3n])for(let bad=0n;bad<=N;bad++){
 if(inBand&&!(p0<=p&&p<X))continue;
 const A3=p<XX&&ord<cut,A4=inBand,PS=p<X&&ord>=cut,Cand=PS&&!inBand,drop=Cand&&sig>2n;
 const missed=p>=X?0n:Cand&&!drop?bad:N;
 const rhs=(A3?N:0n)+(A4?N:0n)+(PS?bad:0n)+(Cand?((drop?2n:0n)+sig)*N:0n);
 ck(missed<=rhs,"pointwise");
}
for(let mask=0;mask<32;mask++)for(let s=0;s<32;s++)for(const N of [0n,1n,3n,10n]){
 const w=[30n,20n,12n,8n,6n],bad=w.map((_,i)=>BigInt(i)%(N+1n));
 const S=w.reduce((a,v,i)=>a+((mask>>i&1)&&(s>>i&1)?v*bad[i]:0n),0n);
 const F=w.reduce((a,v,i)=>a+((mask>>i&1)?v*bad[i]:0n),0n);
 ck(S<=F&&F<=N*w.reduce((a,v,i)=>a+((mask>>i&1)?v:0n),0n),"weighted");
}
for(const d of [53n,60n,104n,200n])for(const m of [1n,2n,3n])if(52n*m<d)for(const b of [2n,3n,5n]){
 const x=b**d,xe=b**m;
 ck(120n<=x&&120n*xe<=x,"thresholds");
 ck(120n<=x*xe**7n,"thresholds");
 ck(120n<=x**8n,"thresholds");
}
const q=[6n,3n,180n,3n,3n,360n,3n,4n],total=q.reduce((a,b)=>a+b,0n);
ck(total===562n&&total<=564n,"budget");
ck(total+3n===565n&&total+3n<=600n,"budget");
ck(3n>1n,"negative");ck(1n>0n,"negative");ck(1n>0n,"negative");ck(!(5<5)&&5<=5,"negative");
console.log(counts);
// Actual adversarial omission witnesses (separate executed check):
function missedAndTerms(p,X,XX,p0,ord,cut,band,sig,N,bad){
 const A3=p<XX&&ord<cut,A4=band,PS=p<X&&ord>=cut,Cand=PS&&!(p0<=p&&band),drop=Cand&&sig>2n;
 return [p>=X?0n:Cand&&!drop?bad:N,[A3?N:0n,A4?N:0n,PS?bad:0n,Cand?((drop?2n:0n)+sig)*N:0n]];
}
const cases=[[2,5,10,4,1,2,false,0n,3n,0n,0],[2,5,10,4,2,2,false,0n,3n,2n,2],[3,5,10,2,2,2,true,0n,3n,0n,1],[2,5,10,4,2,2,false,3n,3n,0n,3]];
for(const c of cases){let [m,t]=missedAndTerms(...c.slice(0,10));let j=c[10];if(m<=t.reduce((a,v,i)=>a+(i===j?0n:v),0n))throw Error("omission control failed")}
const tops=[0,1,2],bs=[0,0,0],good=new Set();
if(!(tops.filter(t=>!good.has(bs[t])).length>new Set(bs.filter(r=>!good.has(r))).size))throw Error("orbit multiplicity");
let [m]=missedAndTerms(5,5,8,2,1,2,false,0n,3n,0n);if(m!==0n)throw Error("boundary");
console.log({negative_omission:cases.length,negative_orbit_multiplicity:1,boundary:1});
```
Actual execution: {"fibres":3456,"pointwise":160650,"weighted":4096,"thresholds":54,"budget":2,"negative":4}. The four elementary negative assertions alone are not substantive; independent omission witnesses returned {"negative_omission":4,"negative_orbit_multiplicity":1,"boundary":1}. Total 168258 positive regression assertions plus 10 controls. Integer stand-in weights and abstract classification only; no Lean or CI run of this artifact.

## RESUME HERE
Request independent audit of the exact fibre identity, case guards, E1 budget and source-removal distinction. Ask acceleration/dependency/kernel for real results of request 302–304 and exact P Main-root roles for AdmFam/AdmF/FamilyClosedForm and latticeChain_succ_of_partial; avoid duplicate raw scans. Next reconstruct dfc_le and its imported askG cap plus low/high numerical error suppliers, or switch to the authenticated reachable prime-window branch if this legacy path is not on the root; do not assume nonreachability from a missing projection. Preserve adm2/adm3 as unproved arithmetic inputs at P, irrespective of upstream changes. HANDOFF TO audit, dependencies, kernel, acceleration, integration, editor, prime_window. Full RH reconstruction OPEN.

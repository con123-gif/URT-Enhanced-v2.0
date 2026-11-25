# RUN19 — ArchimedeanSignatureMatching: both band sums and exact remaining radius condition

2026-11-25. RESULT: SOURCE-MATCHED / independent human derivation of the entire predicate under explicit sufficient and necessary residual hypotheses; exact finite regression executed. Native admission constructor and authenticated root reachability remain PARTIAL. No Lean replay or URT-specific improvement.

P = 40e56bab026552e089d7afcfeff08d2defb9c005.
H = 4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061 (upstream head observed; compare reports 711 commits ahead of RUN18's b2f365a68500e2bde98cd60a2324263fc62fba10, zero behind).

## Preflight
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN18 and research state/log/protocol/continuity excerpts, CI summary #407 (01:06:19 UTC, 45520766355, physical checks only), latest 40 working-branch commit subjects and peer handoffs in dependency/kernel/integration/editor/audit/Landau/structure/math/acceleration/geometry/literature/character/Galois/theta. No duplicate found in inspected records. Linked blueprint PDF and some full peer files not reopened. GitHub search for CbLarge, ArchimedeanSignatureMatching, InBand0, AdmFam returned zero hits; not a certificate of absence. Continue RUN18's explicit alternate target, rather than invent a native incoming constructor. No physics changes.

## Source anchors
Paths relative to https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/.
- SharpRestriction/GrowthBounds/SmallOrderPrimes.lean blob a35ad58d20f072b48cbb03f619f1bf0f1501e66f L107–113: AuxBlock8.ArchimedeanSignatureMatching; L241–244 admitted; L256–260 AdmF.
- SharpRestriction/GrowthBounds/IsResidueClassZero.lean blob 9fbb7879d0519f9a136e190551422881ef5d2f0b L14–33 Consts/Nonneg; L37–43 hG, KG, rG, N1; L56–85 Nstar, La, rho, rhoB, CbLarge, rho_le_rhoB, InBand0, InBand. L401–410 ParametersFill (last equality La = L.LaG).
- LocalRingCardinality/DataParams₂.lean blob 50914500995df91e2646d91a6c5c99a7e603a51b L9–17 Scale, L27–45 L,b,a,X',b',w'',X'',A,p0,delta1.
- SharpRestriction/ParConsts.lean blob c3a5cddc3af0b027ad62b50a79cdb008712613a6 L31–55 FamP and GK_nonneg; L62 fills; L79 rho_le (for GK specifically).
- SharpRestriction/FamCore.lean blob 44cd54c38881086724fdf7f10f32b7d8e80e35b3 L74–85 (nonvacuity, L_x, L_eps), L138–142 exists_pt.
- SharpRestriction/GrowthBounds/LogarithmicSums/StarNum.lean blob 47c8e4430e4150f61202b8afa77ca2b6369c8043 L38–40 cGE,cNE; L94–134 first_count_le_log; L144–146 one_le_k.
- SharpRestriction/GrowthBounds/UnramifiedQuadraticSetting.lean blob c36e22ceab2885a6ab812f6187bfd1a86472a6ec L247–248 orbitWindowCount.
- SharpRestriction/ElevenLe.lean blob 75f2ab1404c69a5d1330671d96d8f6cd35e74e52 L68 SizeLa.

## 1. Generic weighted prime-power band lemma (independent elementary proof)
Let X>1, log X>=1, P0>=2, 0<=r<=1/2. Define
  B(r)={p prime : P0<=p<X, exists d in positive integers, X(1-r)<=p^d<=X(1+r)}.
This is finite. The source Finset.range ceil(X) does not impose a stronger cutoff: for natural p, p<X iff p<ceil(X), including the case of integral X. Preserve the lower cutoff inclusive, upper prime cutoff strict, both power boundaries inclusive, and d>=1.

Write Lx=log X (not the source's Scale.L). If p has witness d, then 2^d<=p^d<=X(1+r); taking logs gives
  d log 2 <= Lx+log(1+r) <= Lx+r <= 2 Lx.
Here log(1+r)=integral_1^(1+r) dt/t<=r and log 2=integral_1^2 dt/t>=1/2. Thus d<=4 Lx. There are at most floor(4 Lx) positive integers d.

For a fixed d, define u=[X(1-r)]^(1/d)>0, v=[X(1+r)]^(1/d). The allowable primes lie in [u,v] and [P0,X). If none, their sum is zero. Otherwise let m be the least and M the greatest allowable prime for this d (integers). Then
  sum_{p allowable} 1/p <= sum_{n=m}^M 1/n
    <= 1/m + integral_m^M dt/t
    = 1/m+log(M/m)
    <= 1/P0 + log(v/u)
    = 1/P0 + (1/d) log((1+r)/(1-r))
    <= 1/P0 + 4r/d.
The integral inequality follows termwise from 1/n<=integral_(n-1)^n dt/t for n>m. For the last step use integral_(1-r)^(1+r) dt/t<=2r/(1-r)<=4r. These arguments also hold at r=0 and m=M.

Because every prime in the set is <X, its log is positive and <=Lx. Multiplying the preceding bound by Lx bounds the fixed-d weighted sum. Taking the union over d and upper bounding by the sum over d is valid because every weight log(p)/p is nonnegative, even if multiple witnesses exist. Therefore
  sum_{p in B(r)} log(p)/p <= 4 (log X)^2 (1/P0+4r).
This elementary overestimate counts all integers in each interval; no distribution theorem about primes is invoked.

## 2. Exact native scale specialization
Write x=s.x, e=s.eps, k=D.R.k, X=s.X'=exp(x^(e/3)), P0=s.p0 k=k^2 x^26. Assume the source scale hypotheses x>1, 0<e<1/52, and k>=1 (native one_le_k). For x>=400 we have P0>=x^26>=2, log X=x^(e/3)>=1.
For either radius r satisfying 0<=r<=x^(-2), r<=1/2, the generic bound becomes
  4 x^(2e/3)(x^(-26)+4 x^(-2))
  <=20 x^(-2+2e/3)
  <=x^(-1).
The final step follows from 1-2e/3>1/2 and x>=400, giving x^(1-2e/3)>=sqrt(x)>=20. The threshold is sufficient, not optimal, and independent of p, d, n, k, fibre index, and even e in its native range.
Apply r=rho and r=rhoB separately; these are exactly the two source band sums. Alternatively rho<=rhoB gives inclusion of InBand0 into InBand by positive X and nonnegative radii, and hence the first sum follows from the second by nonnegative weights. No classification by Frobenius order or primality beyond the original prime filter is added.

## 3. Radius inequalities and exact remaining hypothesis
For fixed K with K.Nonneg, x>1 gives log(a)>0 from a=x exp(x^e)>1. Thus La=K.La*N1^2*log(a)>=0; Nstar>=0, k>=1, and both rho and rhoB are nonnegative.
The exact difference (not a new assumption) is
  rhoB-rho = K.rho * La/k * (K.CN log x - N1).
Therefore rho<=rhoB iff (K.rho=0 OR K.La=0 OR CbLarge K s), since N1>=1 by orbitWindowCount, and log(a)>0. The zero factors are necessary cases: CbLarge is not equivalent to the ordering without their exclusion. The source theorem rho_le_rhoB uses CbLarge as sufficient, not necessary. For a fixed positive K.La and K.rho>0 the ordering is exactly CbLarge. Merely K.Nonneg does not force it; CN=0 and N1>=1 violate ordering if both factors positive.
If additionally rhoB<=x^(-2), then all four predicate components of ArchimedeanSignatureMatching are equivalent (for x>=400) to the single ordering rho<=rhoB: forward by projection, backward by the preceding lemma twice and rho<=rhoB<=x^(-2).

## 4. Family quantifier scope and relation to RUN18
Here specialize K=Fm.GK, not arbitrary K, because FamP.rho_le and GK_nonneg concern that fixed field. Let Eventual(R) mean exists T>1, forall x>=T, forall i:Fm.Ix x, R at the instance. Use x1+1 to ensure L_x, L_eps, and rho_le. The pointwise equivalence yields
  Eventual(ArchimedeanSignatureMatching) iff
  (GK.rho=0 OR GK.La=0 OR Eventual(CbLarge GK)).
To justify the disjunction under eventual quantifiers, GK.rho and GK.La are constants fixed before x and i; split their zero cases first. No swapping of existential thresholds with individual primes or fibres. For any threshold T on one side, max(T,400,x1+1) works on the other, with harmless adjustment to ensure T>1. If using RUN18's independent family admission reduction where GK.La>0 is required, the remaining condition is GK.rho=0 OR Eventual(CbLarge GK). This is an equivalent residual obligation, not unconditional admission.

A sufficient fixed condition is GK.CN>=St.cNE(e): first_count_le_log gives N1<=cNE(e) log x for x>=exp(1), and log x>0. Conversely if Eventual(CbLarge) holds, the native orbitWindowCount gives N1>=((5+8e)/log 2)log x+1, so a genuine instance above the threshold implies GK.CN>(5+8e)/log 2. Nonvacuity uses FamCore.exists_pt; no claim that all fibres are nonempty. The latter is a necessary condition, not shown sufficient. In particular do not select a new CN to force this on an already fixed GK. For general K not equal to GK one needs its own rhoB bound; no inference from FamP.rho_le for arbitrary K.

A promising separate native positivity route is FamP.fills -> ParametersFill last equality La=LaG -> SizeLa's positive lower bound, once a genuine place w is supplied at a genuine large family instance. This is a source-level candidate only; authenticate the nonempty place supplier and actual caller before closing that obligation.

## 5. Upstream comparison
At H, SmallOrderPrimes blob ad70c916f276a693ddd51cb9387c38ebaeb4ffb7 L102–108 identical to P L107–113 (exact string comparison). IsResidueClassZero blob 0622fc3b6d32afcdece44b5bac2496fd8ab099a6 H L96–123 identical to P L58–85 (exact comparison). H ParConsts blob 9c325c376642368457542fa7a47cb8488b799b16 L78 rho_le has same displayed field. H DataParams₂ blob 3c27f632cf4de6f41fc4e4cf077510613afe8f9a L33–49 scale definitions displayed unchanged. H StarFam blob 8349438a297e547750c0465daaa269730773bbca L91–94,147–188 (migrated first_count_le_log) and 345–347,388–430 (additional version); no namespace conflation asserted. H admitted L233–236 still omits adm2/adm3 compared to P; Conclusion₂ L238–239 also differs. No claim of whole upstream equivalence or kernel reachability.

## 6. Executed independent finite regression (Node/V8)
The log interval uses atanh series log(a/b)=2 sum_{i>=0} ((a-b)/(a+b))^(2i+1)/(2i+1), after reducing the ratio to [1,2]. This follows by integrating 2/(1-t^2) from 0 to (a-b)/(a+b). At M=24 the remaining tail, scaled by Q=10^18, is at most 2Q*(1/3)^49/[49*(1-1/9)]<1. Each of the M floor terms loses <1, so upper bound is lower+M+1, then add exact integer multiples of the interval for log 2. All band membership and tested inequalities use BigInt; small primality loop uses exact small integer remainder and sqrt bound on n<=256. These are finite arithmetic regressions, not proofs of analytic quantifiers or real native D7 instances.

```js
const Q=10n**18n,M=24;
function unitLog(a,b){const u=a-b,v=a+b;let s=0n;for(let i=0;i<M;i++){const j=BigInt(2*i+1);s+=2n*Q*u**j/(j*v**j)}return [s,s+BigInt(M)+1n]}
const l2=unitLog(2n,1n);function logBounds(n){let a=BigInt(n),b=1n,k=0n;while(a>=2n*b){b*=2n;k++}let [lo,hi]=unitLog(a,b);return [lo+k*l2[0],hi+k*l2[1]]}
const prime=n=>n>=2&&Array.from({length:Math.floor(Math.sqrt(n))-1},(_,i)=>i+2).every(d=>n%d);
const counts={perExponent:0,union:0,nesting:0,sign:0,negative:0};const ck=(b,k)=>{if(!b)throw Error(k);counts[k]++};
const add=(a,b,p)=>[a*BigInt(p)+b,b*BigInt(p)];
const logs=new Map(Array.from({length:257},(_,i)=>[i,i>=1?logBounds(i):[0n,0n]]));
const inBand=(p,d,X,p0,rn,rd)=>d>=1n&&p>=p0&&p<X&&X*(rd-rn)<=p**d*rd&&p**d*rd<=X*(rd+rn);
for(const X of [4,5,8,9,16,25,27,32,49,64,81,100,125,128,169,243,256])for(const p0 of [2,3,4,5,7,11,17,31,63])for(const [rn,rd] of [[0n,1n],[1n,100n],[1n,20n],[1n,10n],[1n,4n],[1n,2n]]){
 const x=BigInt(X),pmin=BigInt(p0),L=logs.get(X)[1];let union=new Set,half=new Set,ds=0n;
 for(let d=1n;2n**d*rd<=x*(rd+rn);d++){
  ds++;let a=0n,b=1n,weight=0n;
  for(let p=p0;p<X;p++)if(prime(p)){
    if(inBand(BigInt(p),d,x,pmin,rn,rd)){[a,b]=add(a,b,p);weight+=(logs.get(p)[1]+BigInt(p)-1n)/BigInt(p);union.add(p)}
    if(inBand(BigInt(p),d,x,pmin,rn,2n*rd))half.add(p);
  }
  const bn=rd*d+4n*rn*pmin,bd=pmin*rd*d;
  ck(a*bd<=b*bn,"perExponent");
  ck(weight*bd<=L*bn,"perExponent");
 }
 let a=0n,b=1n;for(const p of union)[a,b]=add(a,b,p);
 ck(a*pmin*rd<=b*ds*(rd+4n*rn*pmin),"union");
 ck([...half].every(p=>union.has(p)),"nesting");
}
for(let n=1n;n<=8n;n++)for(let k=1n;k<=8n;k++)for(let c=0n;c<=4n;c++)for(let r=0n;r<=4n;r++)for(let B=0n;B<=8n;B++){
 const A=3n*n*c;
 const rho=A+r*n*c,rhoB=A+r*B*c;
 ck((rho<=rhoB)===(r===0n||c===0n||n<=B),"sign");
}
ck(3n*2n+2n>3n*2n,"negative");
ck(inBand(2n,3n,8n,2n,0n,1n)&&!inBand(2n,3n,8n,3n,0n,1n),"negative");
ck(!inBand(5n,1n,5n,2n,0n,1n),"negative");
ck(inBand(3n,2n,12n,2n,1n,4n)&&!inBand(3n,2n,12n,2n,24n,100n),"negative");
console.log(counts);
```
Actual execution: {"perExponent":9396,"union":918,"nesting":918,"sign":14400,"negative":4}. Total 25,632 positive regression assertions plus four guard/negative witnesses. Sign test cancels common positive denominator k, so repetitions over k are not distinct sign cases. Weighted check compares outward log upper sum against outward log X upper bound, and is not a strict interval certificate of comparison to true log X; the exact reciprocal checks and analytic inequality are separate. No CI or Lean replay claimed.

## RESUME HERE
Authenticate nonempty place w for a genuine large FamP instance and apply fills/ParametersFill/SizeLa to GK.La; then trace actual supplier of Eventual(CbLarge GK), or the first uncovered residual admission predicate if no native caller is authenticated. Request independent audit of integral comparisons, strict cutoff, zero factors, K=GK restriction, necessary CN lower bound and threshold quantifiers. Request authenticated role-labelled reachability of Pf.AdmFam/AdmF, ArchimedeanSignatureMatching and CbLarge; do not infer reachability from imports. Preserve all original obligations in integrated chapter.
HANDOFF TO audit, dependency, kernel, integration, editor, prime_window. Project OPEN.

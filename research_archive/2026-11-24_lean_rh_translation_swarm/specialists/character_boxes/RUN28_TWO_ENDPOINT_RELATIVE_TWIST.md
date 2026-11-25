# RUN28 — two-endpoint relative twist: remove the exceptional-zero size lower bound from this consumer
25 November 2026. Lane 6. SOURCE-MATCHED human conditional replacement, not native replay. RH OPEN.

Preflight: current ONE_EQUATION_MISSION blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc including unified reduction engine and newer human-readable native equation/ten-page requirements; AGENTS, SWARM, HANDOFF, EXPANSION, continuity, state, research protocol/log excerpts; live HUMAN_PROOF_ONE_EQUATION, audit RUN28_FULL_MEANSQ_HIGHER_POWER_TRANSFER (038cd3a487c00164bc9b22b4db0789b34c861245), prime-window RUN28 and latest peer list through faa0d552. This extends RUN27 and the audit's full MeanSq transfer, not an independent RH criterion. No physical changes.

## Compact result for the shared proof
The native QH.twistK calls count_a with ExcBound (Siegel-type lower bound), to absorb the primes below sqrt(U). This is avoidable for the twist estimate itself: subtract the two relative PNT formulae before taking norms. Retain page_across, PNTAPRelW, all admitted hypotheses, exact host and native twistK conclusion. The argument even works for the original arbitrary odd squarefree s, not just RUN27 semiprimes.

Write L=log Y, u=log U, V=sqrt U, M=m0*s, Z=m0*Y^A. Fix eps,A,B>0 before all Y,U,m0,a0. Admitted implies u>=Y^(eps/6), log m0<=4u/L², u<=Y^(eps/5)L². Uniformly for 1<s<=Y^A, for large Y we have AL<=4u/L², V>Y^A, and log M<=log Z<=8u/L²; log(log M+2)=O_eps,A(L). Hence both endpoints W=U,V meet the native PNTAPRelW threshold C0 log M log(log M+2)<=log W. Moreover log W/log Z>=L²/16 and sqrt(log W)/L tends uniformly to infinity. The *same* exceptional pair e=e(M) is used at both endpoints (the native quantifier chooses e before X,b). Its relative error can be bounded by
    delta=|A0|[exp(-c3 L²/16)+exp(-sqrt(c3 u/2))].
This is o(Y^-B) uniformly for every fixed B. The native page_across + jacobi_separate argument still gives at most one exceptional s=nstar across M<=Z: if the pair aligns with the Jacobi character on the subgroup b=1 mod m0 and beta>1-c0/log Z, it is bad; two bad s have equal characters on the common units, hence equal squarefree s. For every other aligned exceptional pair, beta<=1-c0/log Z and beta>=1/2 (native IsExcPair and 8|M). By liX_pow_le at both endpoints, use common
    r=4u exp(-c0 L²/16)=o(Y^-B),
since log u<= (eps/5+2)L. All nonaligned terms vanish by the native coset orthogonality. The thresholds depend only on eps,A,B and the native constants, never the host or s.

Let C=clsB(m0,s,a0). For each b in C write f_b(W)=mainAP(e,b,W), A_W=sum_C f_b(W), T_W=sum_C j(b) f_b(W), j(b)=(b/s). Each f_b positive for large Y: e=none gives li(W)/phi(M), or e=some gives [li(W) +/- li(W^beta)]/phi(M), since quadratic characters on units are +/-1 and 1/2<=beta<1. Crucially, uniformly even when beta approaches one, f_b(V)<=f_b(U)/2 for sufficiently large Y:
* Unbiased: li(V)/li(U)<=4u U^-1/2.
* Plus: (li(V)+li(V^beta))/(li(U)+li(U^beta))<=8u U^-1/2.
  These use native liX_upper and liX_lower and V^beta>=2.
* Minus: the cancellation must be exact. Substitute t=U^z in the integral:
      li(U)-li(U^beta)=integral_beta^1 U^z/z dz,
      li(V)-li(V^beta)=integral_beta^1 U^(z/2)/z dz
         <= U^-1/4 [li(U)-li(U^beta)].
  This last ratio is uniform in beta and requires no lower bound on 1-beta. All ratios eventually <=1/2. The same e at both endpoints is indispensable.

Now the strict PPset cutoff means, exactly,
    P=card PPset=sum_C (piAP(U,M,b)-piAP(V,M,b)),
    T=sum_{q in PPset} (q/s)=sum_C j(b)(piAP(U,M,b)-piAP(V,M,b)).
Every q>V>s is a unit mod s, and a0 coprime m0 excludes all primes dividing m0. CRT supplies precisely C; floors and endpoint inclusion are preserved. Let a=A_U, b=A_V. Then 0<=b<=a/2 and a+b<=3(a-b). PNTAPRelW gives |P-(a-b)|<=delta(a+b), while native main_twist_bound at each W gives |T_W|<=2r A_W (positivity of mainAP removes its abs). Therefore |T|<=(2r+delta)(a+b). For delta<=1/6,
    P >= (a-b)/2,
    |T| <= (12r+6delta) P <= Y^-B P.                     (NEW)
Choose Y large enough that r,delta<=Y^-B/32 and r<=1/2. No division by P is required, even if P=0. This proves the original twist conclusion from the two retained analytic suppliers, without count_a or ExcBound or any absolute small-prime error. It is not a proof of PNTAPRelW or ZFRDirichlet themselves.

This eliminates a genuine local dependency on an exceptional-zero *size* bound, distinct from the retained Page uniqueness bound. The native count_a remains necessary in Stage1/Stage2 existence/positive candidate-count arguments unless separately replaced. Do not delete ExcBound from the global graph; PNTAPRelW may itself use a Siegel input, as the near-range proof calls etaOf_lower. The exact remaining quantitative leaf in this branch is PNTAPRelW on both endpoints of admissible moduli (with shared e), plus ZFRDirichlet for Page uniqueness. PNTFinal proves PNTAPRelW using prime_count_of_psi, glue_ranges, psi_relative_near_range and psi_relative_far_range with explicitS_proof', differenced_explicit_formula, zero_sum_bound_lossy, logDensityM_proof' and deuringHeilbronnMB_proof'. No new independent proof of those imported suppliers claimed.

## Source ledger and dependency change
Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Exact paths relative to src/:
- Development/AutomorphicArithmetic/MeanSquareBounds/twistK.lean 07e569eaf54b3b91fedad4117991838a23b93603; original final_ineqK, twistK.
- same directory PrimeSetTwoBounds.lean 45616f33334b6ef360b18a8e64c0eb325f9463b8; admitted and MeanSq.
- Formalism/GL3MeanSquares/SecondEstimateOfIntervalHypothesis.lean bdea967f4db26bfc2b040f01beeebbed0ff8909c; PPset.
- Formalism/GL3MeanSquares/GenusMeanAsymptotics/JacobiCharacterSums/MeanSquareHypWIff.lean 0d25e5e062a1478f85f0115d7684eb9a6ff90f29; piAP, liX, mainAP, IsExcPair, PNTAPRelW.
- same directory MSqTwistB.lean b59dc9c511610ee5d4cc877702b18ef933e3a3c4; main_twist_bound, twist_one. MSqTwistC.lean 96109d8c74b74048f56c1549c9f1936f84292574; liX_upper/lower/pow_le.
- MSqPage.lean b209f60afe70e6c96a6c59dc90d67bf8f330bccd; page_across. MSqOrth.lean 95bd2dd0db29ec20c5d208ef22c8627dab591a4b; jacobi_separate.
- MSqCount.lean 6883d25c4f9fcd1dbe49b19e4dea23bfe8c87935; count_a, removed only in replacement twist.
- PNTFinal.lean 616aec99297d346eb1570dc53468c5e9bf79886c; PNTRangeA.lean 91acb9e608ae0b94882fe181ddb0917d86335d99; PNTGlue.lean 6e6f6f96c860d401ccd24925673095ad549357e3.
Latest upstream head observed 251c7b05dd869ceba1aa42c6001c00b4010f23f9: old twistK path returns 404, PNTFinal blob now 1fe9f0eae8d647c9f312b427778b4f2844be3df1; no revision mixing or deletion inference.

Original local graph twistK -> {PNTAPRelW, ZFRDirichlet, ExcBound, count_a, page_across, jacobi_separate, final_ineqK, twist_one, liX_pow_le}. Proposed graph -> {PNTAPRelW, ZFRDirichlet, page_across, jacobi_separate, main_twist_bound, liX_pow_le, positive integral ratio, exact interval CRT, uniform log bounds, scalar transfer NEW}. Keep original and all pending type/value/constructor/axiom edges; no global kernel pruning claimed. Context key=(pin,eps,A,B,Y,U,m0,a0,s,shared e(M),endpoints U,V); cache same e only for same M. Backtrack to original twistK on failure. RUN27 Gram plus audit RUN28 full MeanSq transfer are subsequent consumers; no altered BadShare input needed. Actual Main root path remains source-matched overlay and has not been re-elaborated.

## Executed regression
JS code below actually executed in the current session with result {"actualPrimes":8713,"cases":88,"residueChecks":5220,"ratioChecks":60,"controls":2}. Exact integer checks of real prime counts on CRT slices, and floating-point quadrature of scalar logarithmic integrals for deliberately chosen beta values (NOT claims of actual exceptional zeros or PNT verification). Controls demonstrate that independent endpoint exceptions break positivity of the difference, and Jacobi zero for nonunits. The analytic proof, not this finite test, establishes the conditional uniform estimate.

```javascript
function verify(){
 const ck=(b,m)=>{if(!b)throw Error(m)};
 const N=90000, sieve=new Uint8Array(N+1).fill(1);sieve[0]=sieve[1]=0;
 for(let p=2;p*p<=N;p++)if(sieve[p])for(let n=p*p;n<=N;n+=p)sieve[n]=0;
 const primes=[];for(let p=2;p<=N;p++)if(sieve[p])primes.push(p);
 const gcd=(a,b)=>b?gcd(b,a%b):a;
 function leg(a,p){a%=p;if(!a)return 0;let t=1,e=(p-1)/2;while(e){if(e%2)t=t*a%p;a=a*a%p;e=Math.floor(e/2)}return t===1?1:-1}
 let cases=0,residueChecks=0,ratioChecks=0,controls=0;
 for(const X of [10000,40000,90000])for(const m of [8,24,40])for(const a of [1,3,7,11].filter(a=>gcd(a,m)===1))for(const [p,r] of [[3,5],[5,7],[7,11],[11,13]].filter(([p,r])=>gcd(p*r,m)===1&&p*r<Math.sqrt(X))){
  const s=p*r,M=m*s,V=Math.sqrt(X),j=b=>leg(b,p)*leg(b,r);
  const hi=new Int32Array(M),lo=new Int32Array(M);let count=0,signed=0;
  for(const q of primes){if(q>X)break;if(q%m!==a%m)continue;hi[q%M]++;if(q<=V)lo[q%M]++;else{count++;signed+=j(q)}}
  let n=0,t=0,orth=0;
  for(let b=0;b<M;b++)if(b%m===a%m&&gcd(b,s)===1){n+=hi[b]-lo[b];t+=j(b)*(hi[b]-lo[b]);orth+=j(b);residueChecks++}
  ck(n===count&&t===signed&&orth===0,"CRT endpoint identity");cases++;
 }
 const integ=(u,a,b)=>{let t=0;for(let i=0;i<4096;i++){const v=a+(b-a)*(i+.5)/4096;t+=Math.exp(u*v)/v}return t*(b-a)/4096};
 const li=(u,b=1)=>integ(u,Math.log(2)/u,b);
 for(const u of [16,32,64,128,256])for(const beta of [.5,.75,.99,1-2**-40]){
  const minus=integ(u,beta,1),minusV=integ(u/2,beta,1);
  ck(minusV/minus<=Math.exp(-u/4)*(1+1e-8),"suppressed class");ratioChecks++;
  const plus=li(u)+li(u,beta),plusV=li(u/2)+li(u/2,beta);
  ck(plusV/plus<=8*u*Math.exp(-u/2)*(1+1e-8),"plus class");ratioChecks++;
  ck(li(u/2)/li(u)<=4*u*Math.exp(-u/2)*(1+1e-8),"unbiased class");ratioChecks++;
 }
 const u=32,beta=1-2**-40;ck(integ(u,beta,1)<li(u/2),"changing exception at endpoint fails");controls++;
 ck(leg(3,3)===0,"unit restriction");controls++;
 return {actualPrimes:primes.length,cases,residueChecks,ratioChecks,controls};
}
console.log(verify());
```

## Prepared native scalar certificate (NOT compiled)
No lean/lake/gh on PATH. Prior CI status files independently retrieved: 45577239749 pass returncode 0 (98.87s), 45576756833 pass returncode 0 (77.94s); only earlier engines and conditional strip root, not this result. No new Lean run, no new axiom ledger or claimed PASS. Extract into pinned environment with three verified engine modules available.
```lean
import Development.AutomorphicArithmetic.MeanSquareBounds.twistK
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3
import RHProofTermPrune
namespace RHTwoEndpoint
theorem transfer (a b P T d r : ℝ) (hb : 0 ≤ b) (hba : 2*b ≤ a)
    (hd : 0 ≤ d) (hd' : d ≤ 1/6) (hr : 0 ≤ r)
    (hP : |P-(a-b)| ≤ d*(a+b))
    (hT : |T| ≤ (2*r+d)*(a+b)) :
    |T| ≤ (12*r+6*d)*P := by
  have hgap : 0 ≤ a-b := by linarith
  have hsum : a+b ≤ 3*(a-b) := by linarith
  have h1 := mul_le_mul_of_nonneg_left hsum hd
  have h2 := mul_le_mul_of_nonneg_right hd' hgap
  have h3 := (abs_le.mp hP).1
  have h4 : a-b ≤ 2*P := by nlinarith
  have hnon : 0 ≤ 2*r+d := by linarith
  have h5 := mul_le_mul_of_nonneg_left hsum hnon
  have h6 := mul_le_mul_of_nonneg_left h4 (show 0 ≤ 3*(2*r+d) by positivity)
  nlinarith

theorem transfer_auto (a b P T d r : ℝ) (hb : 0 ≤ b) (hba : 2*b ≤ a)
    (hd : 0 ≤ d) (hd' : d ≤ 1/6) (hr : 0 ≤ r)
    (hP : |P-(a-b)| ≤ d*(a+b))
    (hT : |T| ≤ (2*r+d)*(a+b)) :
    |T| ≤ (12*r+6*d)*P := by
  rh_auto_frontier 2
  all_goals first | exact transfer a b P T d r hb hba hd hd' hr hP hT | rh_reduce 3 using [transfer] | rh_auto 3

rh_scan QH.twistK limit 2000
rh_prune QH.twistK as RHTwoEndpoint.twistK_pruned
#print axioms QH.twistK
#print axioms transfer
end RHTwoEndpoint
```
Pruning original body is not expected to remove count_a because it is explicitly used. A new caller-level bridge is needed. Remaining native work: integral substitution for liX difference and finite CRT interval identity, followed by assembly with actual PNTAPRelW and page_across; check original theorem type and transitive axioms. No RH import shortcut. No URT speed claim.

RESUME HERE: independently audit NEW and the shared-exception uniform ratio, compile the two-endpoint bridge, then check actual PNTFinal near/far-range obligations specifically in the admitted host context; retain independent count_a selection consumers. HANDOFF TO formal audit, kernel extractor, integration and editor. Use compact proof block if this branch is required by the common native manuscript; no separate RH detour. RH remains OPEN.

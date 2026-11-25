# RUN27 — prime-only Gram bound eliminates the higher-power mean-square branch
25 Nov 2026. Lane 6, RH OPEN. SOURCE-MATCHED human reduction, conditional on the actual native twistK theorem. Independent audit and new Lean replay pending. One result: for the RUN26 signed selection, the native prime-power moment analysis can be replaced by a two-prime exceptional block and an elementary diagonal bound. No claim to prove twistK, RH, or the whole original MeanSq conclusion.

Preflight: latest ONE_EQUATION_MISSION blob 8dc6705e1bc6540b600f6c22309294466ec88fd0 including mandatory reduction engine; AGENTS, SWARM, HANDOFF, expansion, state/log/protocol/continuity and CI excerpts; RUN26 05530e1b and latest peer commits through affaca49 (especially 359a3b34, a31ec62d, cc5937fc, 3eba527a). The latter address other actual branches, not the prime-only moment below. Not exhaustive archive audit. Native baseline statuses actually fetched: 45577239749 and 45576756833 both status pass, returncode 0, with root half-strip axiom ledger propext, Classical.choice, Quot.sound and bounded scan pending 324. Those statuses predate this result. Local Lean unavailable in this workflow; no claim of new native execution. No URT or physics.

## 1. Exact replacement
Pin P=40e56bab026552e089d7afcfeff08d2defb9c005. Fix eps in (0,1], K>=1, Y sufficiently large, Z=Y^(400K), N=floor Z. Keep admitted eps Y U m0 a0 and the native condition on prime factors of m0: p|m0 implies p<=Y^(eps/5) or p>Z. Write Q=PPset m0 a0 U, M=|Q|. Native meanSqK proves every bounded coefficient moment for all prime powers. RUN26 requires only coefficients supported on primes (including all tail masks used by BadShare).

Invoke actual twistK at A=800K, B=400K+1 (instead of the original B=K+1). Its quantified theorem permits every positive A,B and yields a common nstar for all odd squarefree s coprime to m0 with 1<s<=Y^A, s!=nstar. Put eta=Y^(-400K-1). For sufficiently large Y the native admitted lower bound on log U gives q>N^2 for every q in Q, exactly as in meanSqK; this is independent of B. No change to actual host or scale. Let I={p prime: p<=N, p does not divide m0}. Because 8|m0, all p in I are odd.

For arbitrary complex a_p on I, set G_pr=sum_{q in Q} (p/q)(r/q). Then G_pp=M; for p!=r quadratic reciprocity (q fixed modulo 4) gives |G_pr|=|sum_q (q/(pr))|. Distinct primes have squarefree product coprime to m0, so |G_pr|<=eta M except pr=nstar. Unique factorization implies at most ONE unordered exceptional pair. If nstar is not the product of two distinct primes in I, there is none. The exceptional pair contributes at most M(|a_p|²+|a_r|²), since 2|a_p||a_r|<=|a_p|²+|a_r|². The remaining off-diagonal sum is bounded by eta M (|I|-1) sum |a_p|² using the same pair inequality. Expanding the actual norm squared before applying these bounds proves, with no division by M,
    sum_{q in Q} |sum_{p in I} a_p (p/q)|²
       <= (2+eta*max(|I|-1,0)) M sum_{p in I} |a_p|²
       <= (2+1/Y) M sum_{p in I} |a_p|².                 (G)
This holds also for I or Q empty, complex coefficients, and an exception with arbitrary sign. Stronger than the original need on the restricted subspace. No probabilistic independence claim. The choice of larger B absorbs cardinality exactly, without a sum_cN or Mertens tail estimate.

## 2. Elementary diagonal and ramified-prime cost
For y in [Y,Y^K], y>=3, put a_p=log p * min(1,y/p)*kappa(p), |kappa(p)|<=1. Use theta(t)<=c*t with c=log 4, from primorial<=4^floor(t) (the same elementary bound used in native SPsqLe, not PNT). Then
    sum_{p<=y} |a_p|² <= c*y*log y.
For p>y split into 2^j*y<p<=2^(j+1)*y, j>=0. On this interval bound log p by log y+(j+1)log 2 and 1/p² by 1/(2^j*y)²; the sum of log p is at most c*2^(j+1)*y. The total tail is bounded by 2c*y*sum_{j>=0}2^(-j)(log y+(j+1)log 2)=4c*y*log y+8c*y*log 2. Thus sum_{p<=Z}|a_p|²<=13c*y*log y. No prime-power diagonal or repeated-power estimate needed.

Every omitted prime divisor of m0 is <=w=Y^(eps/5); its total absolute contribution for any q is <=theta(w)<=c*w. This gives the full prime-supported moment using |u+v|²<=2|u|²+2|v|²:
    sum_q |S(Z,y,q,kappa)|² <= (78c+2c²) M*y*log y.    (P)
Here kappa vanishes on nonprimes; w²<=y^(2/5)<=y*log y, 2+1/Y<=3. Constant is universal and no asymptotic use of RH. Original prime-factor restriction and admitted premises remain. Stage 1 m0=8; stage 2 m0=16*oddM(z,q_fixed), not F*U. The native CharOf supplies this factor restriction (small primes <=z or q_fixed>Z). Do not confuse the CRT modulus with conductor bound F.

## 3. Actual caller bridge and backtracking
BadShare.bs_sum_D_le replaces kappa by 1_{n>y}*kappa; this retains prime support. The rest of BadShare uses the original kappa, that mask, and dyadic blocks. Thus the proof of bad_share specializes verbatim to the restricted MeanSq predicate; it is not valid to pass (P) into the unmodified general MeanSq type. Same uniform exception fraction for every prime-supported coefficient and every y, with one chosen q per stage. RUN26 coefficients k1=1_prime, k2=1_prime*(1+a)/2 are prime-supported; stage 2 coefficient depends on the already selected q_fixed, never the candidate d. Keep the zero-box exclusion B1, count_a/count_bad, RowsOfMem, tailK, kappa4, all scale/admitted conditions and original host/geometry/Galois obligations. No assertion that prime-only moment supplies individual full-ramp estimates to other consumers. BoundedTw's first output is indeed separately constructed from hg.bounds and supplyOfAdmOf stores it in EAtH; leave original stronger PairGood for any caller that still needs it. If restricted BadShare or caller replacement cannot be verified, backtrack to original meanSqK, which already implies the restricted bound.

Original local source graph: QH.meanSqK -> {twistK, meanSq_abs, RR_le, exists_primePowerSum_le_mul_log, sPsq_le, sum_cN_le}; QH.meanSq_abs -> {meansq_expand, abs_pair_sum_eq, meansq_split, pairs_one, pairs_r}; QH.bad_share -> bs_block -> bs_sum_D_le -> MeanSq (all coefficients).
Reduced local graph: prime-only moment -> {twistK on distinct prime products, reciprocity, unique factorization, pair inequality, primorial bound, admitted factor/scale conditions}; prime-only bad_share -> same dyadic and derivative proofs with prime-supported masks -> (P); RUN26 signed selection -> restricted bad_share and its unchanged other suppliers. This is source-body trace of actual QH.pairEx/StagePow suppliers, not an authenticated new elaborated Main-root graph. No global deletion of shared consumers or axiom evidence. Context cache key: (P, prime-supported coefficient, eps,K,Y,U,m0,a0,Q,Z; fixed first-stage prime when applicable). No native scan/prune of these new nodes executed. The new sufficient cancellation frontier is twistK restricted to semiprimes (with stronger B), not a proof of it; the actual global geometry and prime lower bound are still open.

## 4. Source hashes and upstream changes
Pinned exact paths under src/Development/AutomorphicArithmetic/MeanSquareBounds/:
twistK.lean 07e569eaf54b3b91fedad4117991838a23b93603; meanSqK.lean 136f54f1321278b0ed23791fb2660ddd162bac97; MeanSqAbs.lean 5879874cae411e438076e9971740635a7f56335e; BadShare.lean 5cd176ccccf4c232a31c6f852536aa579320d4d3; PrimeSetTwoBounds.lean 45616f33334b6ef360b18a8e64c0eb325f9463b8; SPsqLe.lean 7a41c980223b08f9f1f556369276c013a38c8a78; SumCNLe.lean 2e21f4236c446a72b47511ed280bfcd7d28cbca4; CharOf.lean 3eeed8077330efa249cde313d99d89a7c09d8ba6; Stage1Succ.lean 79f79fe71e41f403a4d22e5b86540410748ac7c3.
CharacterBoxes/BoundedTw.lean 69e88858735720bd60454c30c64d6380e216613f; ShortNorms/supplyOfAdmOf.lean 04ca5068e90544580c7684a316ec79c49d3572fc; ShortNorms/hostOfFieldOf.lean 261b566b0ea0d155ef1a434889d720c3b439735f.
Observed upstream head a85077714ca7b298f69e48798497519ed5326a89 (09:29:19 UTC, merge PR #2456 doc/agents-batch-rules), changed since RUN26. All four old paths queried at this head (twistK, meanSqK, MeanSqAbs, BadShare) returned 404; no inference of semantic deletion and no mixing versions.

## 5. Executed regression, exact integer arithmetic
The following JS was actually run on genuine primes in finite residue-class sets, with q>N², complex Gaussian integer coefficients, exact moment expansion and actual observed maximum nonexceptional correlation. These small finite cases are NOT the asymptotic admitted scales and do not validate twistK. Output: {"matrices":9,"reciprocity":732,"unique":375,"checks":3375,"controls":1}. The negative control shows why several uncontrolled edges cannot be dropped in the Gram bound.

```javascript
function certificate(){
 const ck=(x)=>{if(!x)throw Error("assertion")};
 const isP=n=>n>=2&&Array.from({length:Math.max(0,Math.floor(Math.sqrt(n))-1)},(_,i)=>i+2).every(k=>n%k);
 const primes=Array.from({length:12000},(_,i)=>i+1).filter(isP);
 const leg=(n,p)=>{n%=p;if(!n)return 0;for(let i=1;i<p;i++)if(i*i%p===n)return 1;return -1};
 const L=(n,p)=>{let a=n%p,e=(p-1)/2,b=1;if(!a)return 0;while(e){if(e%2)b=b*a%p;a=a*a%p;e=Math.floor(e/2)}return b===1?1:-1};
 let matrices=0,reciprocity=0,unique=0,checks=0,controls=0;
 for(const N of [20,30,50])for(const [m,a0] of [[8,3],[24,11],[120,7]]){
  const I=primes.filter(p=>p<=N&&m%p!==0),Q=primes.filter(q=>q>N*N&&q% m===a0);
  ck(Q.length>0);const M=Q.length,n=I.length;
  const X=Q.map(q=>I.map(p=>L(p,q)));
  const G=I.map((p,i)=>I.map((r,j)=>X.reduce((s,x)=>s+x[i]*x[j],0)));
  for(let i=0;i<n;i++)for(let j=0;j<n;j++){ck(G[i][i]===M);if(i===j)continue;
    let p=I[i],r=I[j],sign=((p-1)/2+(r-1)/2)*((a0-1)/2)%2?-1:1;
    let sum=Q.reduce((s,q)=>s+leg(q,p)*leg(q,r),0);
    ck(G[i][j]===sign*sum);reciprocity++;
  }
  const modes=[0,...I.flatMap((p,i)=>I.slice(i+1).map(r=>p*r))];
  for(const star of modes){
    let h=0,E=0;
    for(let i=0;i<n;i++)for(let j=0;j<n;j++)if(i!==j){if(I[i]*I[j]===star)E++;else h=Math.max(h,Math.abs(G[i][j]));}
    ck(E===0||E===2);unique++;
    for(let t=0;t<9;t++){
      const A=I.map((p,i)=>[(p*(t+1)+i)%11-5,(p+2*i*t)%7-3]);
      const D=A.reduce((s,[u,v])=>s+u*u+v*v,0);
      const direct=X.reduce((s,x)=>{let u=0,v=0;x.forEach((z,i)=>{u+=z*A[i][0];v+=z*A[i][1]});return s+u*u+v*v},0);
      let expand=0;for(let i=0;i<n;i++)for(let j=0;j<n;j++)expand+=G[i][j]*(A[i][0]*A[j][0]+A[i][1]*A[j][1]);
      ck(direct===expand);ck(direct<=(2*M+h*(n-1))*D);checks++;
    }
  }matrices++;
 }
 const q=101,I=[3,5,7],A=I.map(p=>L(p,q));
 ck(A.reduce((s,v,i)=>s+v*L(I[i],q),0)**2>2*A.reduce((s,v)=>s+v*v,0));controls++;
 return {matrices,reciprocity,unique,checks,controls};
}
console.log(certificate());
```

## 6. Prepared native checks (NOT executed; no new PASS)
In the pinned upstream build, compile the verified-version engine modules from kernel_extractor as local imports. Then use:
```lean
import Development.AutomorphicArithmetic.MeanSquareBounds.meanSqK
import Development.AutomorphicArithmetic.MeanSquareBounds.BadShare
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

rh_scan QH.meanSqK limit 2000
rh_scan QH.twistK limit 2000
rh_prune QH.meanSqK as RHMeanSqPruned
#print axioms QH.meanSqK
#print axioms QH.twistK
#print axioms QH.bad_share

theorem rhPrimePairBudget (u v : ℝ) :
    2 * |u| * |v| ≤ u^2 + v^2 := by
  nlinarith [sq_nonneg (|u| - |v|), sq_abs u, sq_abs v]

theorem rhPrimePairWeighted (m u v : ℝ) (hm : 0 ≤ m) :
    m * (2 * |u| * |v|) ≤ m * (u^2 + v^2) := by
  exact mul_le_mul_of_nonneg_left (rhPrimePairBudget u v) hm

#print axioms rhPrimePairBudget
#print axioms rhPrimePairWeighted
```
The actual finite Gram theorem and restricted BadShare caller still require elaboration; do not report these snippets as kernel evidence. Next apply rh_reduce/rh_auto/rh_auto_frontier at those actual new goals after compiling the engines, keep pending nodes, negative controls and original-statement bridge. Do not run the unmodified general MeanSq replacement with a prime-only hypothesis.

RESUME HERE: trace twistK after restricting s to products of two distinct primes; prove the uniform nonexceptional correlations from the actual page_across and PNTAPRelW supplier or identify the exact remaining quantitative leaf. Independently audit this stronger choice of B and specialized BadShare bridge. HANDOFF TO math, audit, kernel, integration and editor. No global proof closure. RH OPEN.

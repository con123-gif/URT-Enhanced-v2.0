# Lane 10 RUN28 — restore full native MeanSq without the prime-power pairing branch

25 Nov 2026. REVIEW / SOURCE-MATCHED human proof, not kernel replay. RH OPEN.
One result: the prime-only Gram reduction of peer 8f108c35bb6fa4bda53393327a1e5bccaacc9dcf extends to the **original unrestricted QH.MeanSq** by an elementary, uniformly bounded higher-power remainder. No restricted BadShare rewrite or prime-support caller assumption is necessary. This is a local replacement, not a global proof or deletion.

Preflight: read latest ONE_EQUATION_MISSION.md (blob 8dc6705e1bc6540b600f6c22309294466ec88fd0, mandatory unified engine), SWARM, AGENTS, HANDOFF, state/log/protocol excerpts and latest commits through 3f57da2ed5d5e60cae8468b525c28bcd0fc327db. Reviewed peer RUN27 Gram bound, selectedPointS and selected_io_bound checkpoints; latter two are unrelated open geometric bridges. Upstream observed head a85077714ca7b298f69e48798497519ed5326a89, but all mathematical sources below are at initial pin 40e56bab026552e089d7afcfeff08d2defb9c005; no version mixing. Latest orchestrator summary checkpoint 434, run 45584953091, prior PASS only.

## Exact proof
Let Q=PPset m0 a0 U, M=|Q|, Z=(Y^K)^400, N=floor Z, y in [Y,Y^K], Y>=3, and arbitrary complex kappa with |kappa(n)|<=1, exactly as QH.meanSqK. Write cN(y,n)=Lambda(n) min(1,y/n). Define kappa_P(n)=kappa(n) if prime and 0 otherwise, kappa_H=kappa-kappa_P. The actual S satisfies S(kappa)=S(kappa_P)+S(kappa_H) by finite linearity. In particular no support restriction is imposed on the input kappa.

Put d=log(4)+4, the native dA_KC. For each higher prime power n=p^k<=N, k>=2, put m=p^floor(k/2). Then m<=N, n>=m^2, Lambda(n)=Lambda(m)=log p. The map has multiplicity at most two by unique prime-power representation: k=2j or 2j+1. Therefore, for ALL y>=1, N>=0,

    H(y,N) := sum_{p^k<=N,k>=2} log(p) min(1,y/p^k)
       <= 2 sum_{m=1}^N Lambda(m) min(1,y/m^2)
       <= 2 d sum_{m=1}^N min(1,y/m^2)
       <= 6 d sqrt(y).                                             (H)

The second and third steps are exactly native dA_vM_major and dA_sum_min_sq. The monotone weight is nonnegative; no RH, PNT, cancellation or asymptotic limit used. For every q (in fact no primality restriction for this step, since |Jacobi|<=1), |S(kappa_H)|<=H. In particular higher powers cannot be discarded exactly, but their squared contribution is O(y) uniformly in Z.

Independently rechecked peer prime Gram: twistK permits A=800K, B=400K+1 uniformly in admitted U,m0,a0 after Y0(eps,K). Every q>N^2 by admitted.lo and eventual_log; 8|m0 and fixed residue give constant reciprocity sign, and for p!=r outside m0, s=pr is odd squarefree, coprime to m0, <=Y^(800K). The one nstar exception yields at most one unordered pair. The matrix norm upper bound follows by exact expansion and 2|a_p a_r|<=|a_p|^2+|a_r|^2. The nonexceptional row bound eta max(|I|-1,0)<=1/Y. Peer diagonal: c=log4, prime log weights below y at most c*y*log y; dyadic tail at most 4c*y*log y+8c*y*log2, total <=13c*y*log y. Omitted primes dividing m0 contribute at most c*w where w=Y^(eps/5)<=y^(1/5); w^2<=y log y. Thus (P) in RUN27 holds with C_P=78c+2c^2. No division by M, and empty Q or prime set allowed.

By |u+v|^2<=2|u|^2+2|v|^2, summing before bounding,

    sum_{q in Q} |S(Z,y,q,kappa)|^2
      <= 2 sum_q |S(Z,y,q,kappa_P)|^2 + 72 d^2 M y
      <= (156c + 4c^2 + 72d^2) M y log y.                         (FULL)

Since y>=3, log y>=1. FULL has exactly the native MeanSq quantification over all norm-bounded complex kappa, including nonmultiplicative coefficients. C is positive and independent of eps,K,Y,U,m0,a0,y,kappa. Same Y0=max of twistK threshold, 3 and q>N^2 threshold. No requirement to modify BadShare or caller masks. This restores the entire local output type, rather than only the prime-supported subspace.

## Original and reduced local dependency ledgers
Original: QH.meanSqK -> QH.meanSq_abs -> meansq_expand, abs_pair_sum_eq, meansq_split, pairs_one, pairs_r; also RR_le, sPsq_le, exists_primePowerSum_le_mul_log, sum_cN_le and twistK. Retained: original MeanSq, S, cN, twistK (semiprimes only, larger B), admitted, reciprocity, prime-factor restriction, elementary primorial bound, dA_vM_major, dA_sum_min_sq, finite triangle/Gram expansion. Reduced: FULL -> {prime-only Gram and diagonal/ramified estimate, H, linearity and norm-square inequality}. No need for separate even/odd pair enumerators, RR, prime-power diagonal estimates, or sum_cN_le in this replacement. This is a source-matched local graph, not a new kernel reachability result. All old declarations, graphs, axioms and other consumers remain. BadShare can retain its original type (the strong interface is restored). Context key=(pin, admitted eps K Y U m0 a0, Z, Q, all norm-bounded kappa); do not cache the prime-only estimate as the general one until H is supplied. Backtrack to native meanSqK if bridge fails. Root-facing BoundedTw still needs PairGood and all log derivative/zero-box/host/geometry obligations; source-matched supplier chain, no claim of full root-reachable kernel coverage.

## Pinned source anchors
- src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean 45616f33334b6ef360b18a8e64c0eb325f9463b8 (S, MeanSq, admitted).
- same directory meanSqK.lean 136f54f1321278b0ed23791fb2660ddd162bac97; MeanSqAbs.lean 5879874cae411e438076e9971740635a7f56335e; twistK.lean 07e569eaf54b3b91fedad4117991838a23b93603; BadShare.lean 5cd176ccccf4c232a31c6f852536aa579320d4d3; SPsqLe.lean 7a41c980223b08f9f1f556369276c013a38c8a78; RRLe.lean dd50c4c7c23183245ab6e2731e9695179e53e780 (explicit cN formula and native use of square majorant).
- src/Formalism/GL3MeanSquares/GenusMeanAsymptotics/JacobiCharacterSums/MSqDiagA.lean 28ec0cfe0667ef26b02dc98aa7f2df9000d29ea1 (dA_KC, dA_vM_major, dA_sum_min_sq).
- same directory MeanSquareHypWIff.lean 0d25e5e062a1478f85f0115d7684eb9a6ff90f29 (RR, sP, soutPart).
- src/Development/AutomorphicArithmetic/CharacterBoxes/BoundedTw.lean 69e88858735720bd60454c30c64d6380e216613f (actual downstream PairGood consumer).

## Executed finite certificate
Actual JS output {"fibers":287,"ramps":462,"perPrime":287,"identities":8988,"numeric":280,"controls":2}. Exact BigInt checks for prime-power fibers, ramp comparisons and real/imaginary Jacobi decomposition (log p factored per prime), and numerical checks with real log weights for H/FULL transfer. These are regression tests on genuine primes, not tests of asymptotic twistK or Lean. Controls: a single-preimage bound fails at 4,8 and simply dropping higher powers fails at kappa supported on 4. Reproduce by running the following JS in Node or equivalent engine and printing run() instead of the last expression.

```javascript
function run(){
 const ck=(x)=>{if(!x)throw Error("assertion")};
 const isP=n=>{if(n<2)return false;for(let i=2;i*i<=n;i++)if(n%i===0)return false;return true};
 const leg=(n,p)=>{let a=BigInt(n%p),m=BigInt(p),e=(m-1n)/2n,b=1n;if(!a)return 0n;while(e){if(e%2n)b=b*a%m;a=a*a%m;e/=2n}return b===1n?1n:-1n};
 const abs=x=>x<0n?-x:x;
 const phases=[[1n,0n],[-1n,0n],[0n,1n],[0n,-1n],[0n,0n]];
 let fibers=0,ramps=0,perPrime=0,identities=0,numeric=0,controls=0;
 for(const N of [1,2,8,27,64,128,256,512]){
  const primes=Array.from({length:N},(_,i)=>i+1).filter(isP);
  const qs=[];for(let q=Math.max(3,N*N+1);qs.length<3;q++)if(isP(q))qs.push(q);
  for(const y of [1,3,8,19,49,121,513]){
   let bound=0;const norm=qs.map(()=>[0,0]);const full=qs.map(()=>[0,0]);const prime=qs.map(()=>[0,0]);
   for(const p of primes){
    const powers=[];for(let n=p;n<=N;n*=p)powers.push(n);
    const D=BigInt(powers[powers.length-1]);
    const w=n=>D*BigInt(Math.min(y,n))/BigInt(n);
    const wm=m=>{const den=BigInt(m)*BigInt(m);return [BigInt(y)<den?BigInt(y):den,den]};
    const f=new Map();let sum=0n;
    for(let k=2;k<=powers.length;k++){
     const n=powers[k-1],m=powers[Math.floor(k/2)-1], [a,b]=wm(m);
     ck(n>=m*m&&w(n)*b<=D*a);ramps++;
     f.set(m,(f.get(m)||0)+1);sum+=w(n);
    }
    for(const c of f.values()){ck(c<=2);fibers++}
    // Bound each fiber by 2 times its square weight, using its own exact denominator.
    for(const [m,c] of f){let t=0n;for(let k=2;k<=powers.length;k++)if(powers[Math.floor(k/2)-1]===m)t+=w(powers[k-1]);const [a,b]=wm(m);ck(t*b<=2n*D*a);perPrime++}
    bound+=Number(sum)/Number(D)*Math.log(p);
    for(let j=0;j<qs.length;j++){
     const q=qs[j];let R=0n,I=0n,PR=0n,PI=0n,HR=0n,HI=0n;
     for(let k=1;k<=powers.length;k++){
      const n=powers[k-1],[a,b]=phases[(n+3*j+y)%5],sg=leg(n,q),r=w(n)*a*sg,i=w(n)*b*sg;
      R+=r;I+=i;if(k===1){PR+=r;PI+=i}else{HR+=r;HI+=i}
     }
     ck(R===PR+HR&&I===PI+HI);identities++;
     ck(HR*HR+HI*HI<=sum*sum);identities++;
     const l=Math.log(p)/Number(D);
     norm[j][0]+=Number(HR)*l;norm[j][1]+=Number(HI)*l;
     full[j][0]+=Number(R)*l;full[j][1]+=Number(I)*l;
     prime[j][0]+=Number(PR)*l;prime[j][1]+=Number(PI)*l;
    }
   }
   const d=Math.log(4)+4,B=6*d*Math.sqrt(y);
   ck(bound<=B+1e-10);numeric++;
   for(let j=0;j<qs.length;j++){ck(Math.hypot(...norm[j])<=bound+1e-10);numeric++}
   const ss=a=>a.reduce((s,[r,i])=>s+r*r+i*i,0);
   ck(ss(full)<=2*ss(prime)+2*qs.length*B*B+1e-8);numeric++;
  }
 }
 // multiplicity one is false: p=2, k=2 and 3, y=8, both ramps equal 1.
 ck(Math.floor(2/2)===Math.floor(3/2)&&Math.min(1,8/4)+Math.min(1,8/8)>Math.min(1,8/4));controls++;
 // Higher powers cannot simply be deleted: kappa supported at 4 and q=11.
 ck(leg(4,11)===1n&&Math.log(2)>0);controls++;
 return {fibers,ramps,perPrime,identities,numeric,controls};
}
run();
```

## Prepared Lean adapter (not compiled)
The following checks the actual S mask identity and the full MeanSq transfer given a restricted prime moment and uniform higher-power bound. The remaining native implementation task is the finite two-to-one H comparison; the proof above supplies it. No sorry, no claimed RH imports. Save as a Lean file in pinned environment, check and scan both declarations with the common engines; then replace meanSqK at the caller and check original statement plus axiom ledger.

```lean
import Development.AutomorphicArithmetic.MeanSquareBounds.PrimeSetTwoBounds
open Finset
namespace QH
noncomputable section
def auditPrimeMask (k : ℕ → ℂ) (n : ℕ) : ℂ := if n.Prime then k n else 0
def auditHigherMask (k : ℕ → ℂ) (n : ℕ) : ℂ := if n.Prime then 0 else k n
theorem audit_S_split (Z y : ℝ) (q : ℕ) (k : ℕ → ℂ) :
    S Z y q k = S Z y q (auditPrimeMask k) + S Z y q (auditHigherMask k) := by
  classical
  unfold S
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro n hn
  by_cases h : n.Prime <;> simp [auditPrimeMask, auditHigherMask, h]

theorem audit_full_moment (C B Z : ℝ) (P : Finset ℕ) (A : Set ℝ)
    (hlog : ∀ y ∈ A, 0 ≤ y ∧ 1 ≤ Real.log y)
    (hP : ∀ y ∈ A, ∀ k : ℕ → ℂ, (∀ n, ‖k n‖ ≤ 1) →
      ∑ q ∈ P, ‖S Z y q (auditPrimeMask k)‖ ^ 2 ≤ C * y * Real.log y * P.card)
    (hH : ∀ y ∈ A, ∀ k : ℕ → ℂ, (∀ n, ‖k n‖ ≤ 1) →
      ∀ q ∈ P, ‖S Z y q (auditHigherMask k)‖ ≤ B * Real.sqrt y) :
    MeanSq (2*C+2*B^2) Z P A := by
  classical
  intro y hy k hk
  obtain ⟨hy0, hl⟩ := hlog y hy
  have hs : ∀ q ∈ P, ‖S Z y q k‖ ^ 2 ≤
      2 * ‖S Z y q (auditPrimeMask k)‖ ^ 2 + 2 * (B^2*y) := by
    intro q hq
    have ht : ‖S Z y q k‖ ≤ ‖S Z y q (auditPrimeMask k)‖ + ‖S Z y q (auditHigherMask k)‖ := by
      rw [audit_S_split]
      exact norm_add_le _ _
    have h1 := pow_le_pow_left₀ (norm_nonneg _) ht 2
    have h2 := pow_le_pow_left₀ (norm_nonneg _) (hH y hy k hk q hq) 2
    rw [mul_pow, Real.sq_sqrt hy0] at h2
    nlinarith [sq_nonneg (‖S Z y q (auditPrimeMask k)‖ - ‖S Z y q (auditHigherMask k)‖)]
  have h := Finset.sum_le_sum hs
  rw [Finset.sum_add_distrib, ← Finset.mul_sum, Finset.sum_const, nsmul_eq_mul] at h
  have h1 := hP y hy k hk
  have h2 : B^2 * y ≤ B^2 * y * Real.log y :=
    le_mul_of_one_le_right (mul_nonneg (sq_nonneg _) hy0) hl
  have h3 := mul_le_mul_of_nonneg_left h2 (Nat.cast_nonneg P.card : (0:ℝ) ≤ P.card)
  nlinarith
#print axioms audit_S_split
#print axioms audit_full_moment
end
end QH
```

Native environment check: command -v lean/lake/gh returned no executable; git ls-remote failed DNS. Actual prior compute status.json for rh-recursive-reduction-strip-root-20261125 and rh-proof-term-prune-native-20261125 fetched from cathedral-research-state: both status pass, returncode 0, half-strip root only propext, Classical.choice, Quot.sound; scan visited 2000 with 324 pending. Direct result.json lookup at both compute roots returned 404 (status tail carries logs). No new rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier run, no new kernel PASS or axiom removal claimed. Original full graph and unresolved leaves preserved.

Verdict AGREE with RUN27 restricted Gram proof. DISAGREE with treating prime-support as a necessary change to downstream MeanSq or dropping higher powers without a remainder. PARTIAL for actual native replacement: proof of H and FULL at human level, prepared adapter not replayed, original uniform twistK and actual geometry suppliers not independently re-proved. RH remains OPEN.

RESUME HERE: compile the actual adapter and implement the higher-power map H with Finset fibers at the pinned source, then check the original meanSqK type using the restricted Gram proof; run rh_scan/rh_prune and bounded frontier reduction at this exact caller context. If compile fails preserve original and repair only the new bridge.
HANDOFF TO: character_boxes, kernel_extractor, integration.

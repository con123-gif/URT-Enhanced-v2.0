import Development.AutomorphicArithmetic.MeanSquareBounds.twistK
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Lane 10 RUN29 — audit RUN28 and cancel the interval main term before norms
25 Nov 2026. REVIEW / SOURCE-MATCHED human proof; Lean certificate PREPARED,
not executed. RH OPEN. One result: direct signed interval transfer, preserving
the full original QH.twistK type, without its count_a or main_twist_bound
consumer. This is a local replacement, not global axiom or dependency removal.

Preflight: current ONE_EQUATION_MISSION blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc
(including mandatory unified engine, native equation and simultaneous pyramid);
SWARM 4b77b161d6876915c15cea5a4d4a519beaf5de74; AGENTS
8db0201da965541e0487d6dd1271e010bdaa0972; HANDOFF
bbc46df7d7716a6d8863275b5271801eacfaad0d; state/log/protocol/continuity excerpts;
live HUMAN_PROOF_ONE_EQUATION f101edec638db5e7d6b3cfbc7907687fc4e15c6e;
peers through 9211eae7d0aaccad592493dbfd17e13beaa8bd59. Most relevant:
7232e7b598a1b9d163ccc83f6399028340b81a1d (two-endpoint twist),
eae577c6f88513ac817a57da3eef56a13f26e2be (full MeanSq), 66ce5bdf (thin).
No independent RH detour, no changes to Cathedral gates or manuscript.

## Integration-ready proof
Keep every original admitted hypothesis and the quantifier order of twistK.
Fix eps,A,B>0 before Y0. Put L=log Y, u=log U, V=sqrt U, M=m0*s,
Z=m0*Y^A. Uniformly for all permitted s and sufficiently large Y,
u>=Y^(eps/6), log M<=log Z<=8u/L^2, log u<=(eps/5+2)L.
In particular V>Y^A, V^beta>=2 when beta>=1/2, and the relative PNT
hypotheses hold at both U,V. Their common error bound is
d=|A0|[exp(-c3 L^2/16)+exp(-sqrt(c3 u/2))]=o(Y^-B).
The actual PNTAPRelW chooses e(M) BEFORE X,b; use exactly this same
exception at both endpoints. IsExcPair and 8|M imply 1/2<=beta<1.
The native page_across and jacobi_separate proof permits at most one
bad aligned s=nstar (alignment on the subgroup b=1 mod m0, with
1-beta<c0/log Z). For every other aligned exceptional pair,
1-beta>=c0/log Z. Keep this full quantifier and exception selection.

Write C=clsB(m0,s,a0), J(b)=(b/s). CRT identifies C as a coset of
H={b mod M: b=1 mod m0, b unit mod M}. J is a nontrivial quadratic
character on H because s>1 is odd squarefree and coprime to m0.
Thus sum_C J=0. An exceptional chi is +/-1 on units. If chi|H=J|H,
then sum_C chi=0 and J(b)chi(b)=constant +/-1 on C.
Otherwise sum_C J chi=0, by the usual coset character orthogonality.
These are exact finite equalities, before taking any norms.
Let F_b(W)=mainAP(e,b,W), a=sum_C F_b(U), b0=sum_C F_b(V).
The peer's pointwise ratio F_b(V)<=F_b(U)/2 is sound: for no exception
or a plus sign use liX bounds 2W and W/(2 log W), giving ratios
<=8u U^(-1/2). For a minus sign the substitution t=U^z gives
liX(U)-liX(U^beta)=integral_beta^1 U^z dz/z;
the corresponding V integral is <=U^(-1/4) times this integral.
Both positive and uniform as beta approaches 1. Hence 0<=2b0<=a.

Now cancel the TWO endpoint main terms before bounding the signed sum:
    D=sum_C J(b)(F_b(U)-F_b(V)).
If e=none or chi is not aligned, D=0 exactly. If aligned, orthogonality
gives a-b0=|C|/phi(M)*(liX(U)-liX(V)) and
|D|=|C|/phi(M)*(liX(U^beta)-liX(V^beta)).
Since liX(U)-liX(V)>= (U-V)/u>=U/(2u), and
0<=liX(U^beta)-liX(V^beta)<=2U^beta, we obtain directly
    |D| <= r*(a-b0), r=4u exp(-c0*u/log Z).
This avoids applying main_twist_bound and liX_pow_le at both endpoints
and uses the full upper endpoint gap, not the weaker half-log exponent.
r<=4u exp(-c0 L^2/8)=o(Y^-B) uniformly. No new lower bound on 1-beta
for NONALIGNED characters, whose signed main term vanishes exactly.
The unsigned main mass may nevertheless be suppressed there:
do not replace a-b0 by the unbiased formula in that branch.

Let P=card PPset and T=sum_PPset J(q). V>s and gcd(a0,m0)=1 imply
each counted prime is a unit mod M. The original strict cutoff gives the
exact CRT identities P=sum_C (piAP(U,M,b)-piAP(V,M,b)) and
T=sum_C J(b)(piAP(U,M,b)-piAP(V,M,b)). All floor endpoints are preserved.
PNT at U,V implies |P-(a-b0)|<=d(a+b0) and |T-D|<=d(a+b0).
As a+b0<=3(a-b0), combine BEFORE dividing:
    (1-3d)|T| <= (r+3d) P.                                  (INTERVAL)
Proof: |T|<=r(a-b0)+d(a+b0)<=(r+3d)(a-b0) and
P>=(1-3d)(a-b0); multiply by nonnegative factors. For eta=Y^-B<=1,
choose uniformly r<=eta/4 and d<=eta/12. Then r+3d<=eta/2,
1-3d>=3/4, so |T|<=eta P. No division by P, no assumption P>0.
This recovers precisely QH.twistK, conditional on its native PNT and
Page inputs, for arbitrary allowed squarefree s, not only semiprimes.
It is not a proof of PNTAPRelW, ZFRDirichlet or the final RH inequality.

The scalar INTERVAL is sharp under the abstract error premises:
a=2,b0=1,d=1/12,r=1/4,P=3/4,D=1/4,T=1/2 gives equality.
At d=1/3 the denominator may vanish (a=2,b0=1,P=0,D=0,T=1),
so retain strict 3d<1 when extracting a relative conclusion.
The example is a scalar control, not a model of prime distribution.

## Source and graph audit
Pinned 40e56bab026552e089d7afcfeff08d2defb9c005; exact paths relative to src/:
Development/AutomorphicArithmetic/MeanSquareBounds/twistK.lean
07e569eaf54b3b91fedad4117991838a23b93603 (twistK, bad and huniq);
same directory PrimeSetTwoBounds.lean 45616f33334b6ef360b18a8e64c0eb325f9463b8 (admitted).
Formalism/GL3MeanSquares/SecondEstimateOfIntervalHypothesis.lean
bdea967f4db26bfc2b040f01beeebbed0ff8909c (PPset strict lower cutoff).
Formalism/GL3MeanSquares/GenusMeanAsymptotics/JacobiCharacterSums/:
MeanSquareHypWIff.lean 0d25e5e062a1478f85f0115d7684eb9a6ff90f29
(piAP, liX, mainAP, IsExcPair, PNTAPRelW);
MSqTwistB.lean b59dc9c511610ee5d4cc877702b18ef933e3a3c4 (main_twist_bound, coset);
MSqTwistC.lean 96109d8c74b74048f56c1549c9f1936f84292574 (liX bounds);
MSqPage.lean b209f60afe70e6c96a6c59dc90d67bf8f330bccd;
MSqOrth.lean 95bd2dd0db29ec20c5d208ef22c8627dab591a4b;
MSqCount.lean 6883d25c4f9fcd1dbe49b19e4dea23bfe8c87935 (count_a).
PNTFinal.lean 616aec99297d346eb1570dc53468c5e9bf79886c lines 22-24:
prime_count_of_psi (glue_ranges psi_relative_near_range
 (psi_relative_far_range explicitS_proof' differenced_explicit_formula
  (zero_sum_bound_lossy logDensityM_proof' deuringHeilbronnMB_proof'))).
PNTRangeA.lean 91acb9e608ae0b94882fe181ddb0917d86335d99 lines 161-163:
psi_relative_near_range calls etaOf_lower 1 one_pos. Thus do NOT claim
the entire branch is independent of Siegel inputs. Retain original count_a
for other selection consumers and etaOf_lower inside the retained PNT.

Original source overlay: ... -> meanSqK -> twistK -> {count_a,
ExcBound,PNTAPRelW,ZFRDirichlet,page_across,jacobi_separate,twist_one,
main_twist_bound,liX_pow_le,final_ineqK}.
RUN28 replacement: two-endpoint PNT and main_twist_bound at both endpoints.
RUN29: same PNT/Page/CRT inputs -> exact coset cancellation + positive
endpoint ratio + direct interval scalar bound. Removed invocations are
local only; original graphs/type/value/constructor/axiom evidence unchanged.
Cache context includes pin, eps,A,B,Y,U,m0,a0,s,shared e(M),chi restriction,
both endpoints; never reuse across a different host or exceptional choice.
Backtrack to original twistK if new bridge fails. Native full-root
reachability not independently established this run; source-matched chain only.

## Executed regression (JS, exact integer arithmetic)
Output scalar=85995, orth=2076, crt=212, actualPrimes=2262, controls=3.
Sharpness was initially a tautological equality control; independently
reran with explicit a,b,d,r,P,T below and obtained P24=18,T24=12.
These are finite arithmetic/CRT controls, NOT exceptional-zero/PNT tests.
Reproduce with Node:
```javascript
const ck=(x,m)=>{if(!x)throw Error(m)};
const gcd=(a,b)=>b?gcd(b,a%b):a;
const leg=(a,p)=>{let b=a%p;if(!b)return 0;let z=1,k=(p-1)/2;while(k){if(k%2)z=z*b%p;b=b*b%p;k=Math.floor(k/2)}return z===1?1:-1};
let scalar=0,orth=0,crt=0,controls=0;
for(let a=0;a<=40;a++)for(let b=0;2*b<=a;b++)
for(let d=0;d<=4;d++)for(let r=0;r<=12;r++)
for(const sign of [-1,0,1]){
 const P=24*(a-b)+sign*d*(a+b),T=r*(a-b)+d*(a+b);
 ck((24-3*d)*T<=(r+3*d)*P,"scalar");scalar++;
}
const primes=[];for(let p=2;p<=20000;p++){let ok=true;for(let j=2;j*j<=p;j++)if(p%j===0){ok=false;break}if(ok)primes.push(p)}
for(const m of [8,24,40])for(const factors of [[3],[5],[7],[3,5],[5,7],[7,11],[3,5,7]]){
 const s=factors.reduce((x,y)=>x*y,1);if(gcd(m,s)>1)continue;
 for(let a=0;a<m;a++)if(gcd(a,m)===1){
 const C=[];for(let b=a;b<m*s;b+=m)if(gcd(b,s)===1)C.push(b);
 const jac=(b,mask)=>factors.reduce((z,p,i)=>z*((mask>>i)&1?leg(b,p):1),1);
 const all=(1<<factors.length)-1,j=b=>jac(b,all);
 const sum=f=>C.reduce((z,b)=>z+f(b),0);
 ck(sum(j)===0,"jac");orth++;
 for(let mask=0;mask<=all;mask++)for(const sign of [0,1]){
  const chi0=b=>sign&&b%4===3?-1:1,chi=b=>chi0(b)*jac(b,mask);
  ck(sum(chi)===(mask===0?chi0(a)*C.length:0),"mass");orth++;
  ck(sum(b=>j(b)*chi(b))===(mask===all?chi0(a)*C.length:0),"twist");orth++;
  const L=17,E=5;const mass=sum(b=>L-chi(b)*E),twist=sum(b=>j(b)*(L-chi(b)*E));
  ck(mass===L*C.length-E*sum(chi)&&twist===-E*sum(b=>j(b)*chi(b)),"aggregate");orth++;
 }
 for(const U of [10000,20000])if(s<Math.sqrt(U)){
  const V=Math.sqrt(U),p=primes.filter(q=>q<=U&&q%m===a&&q>V);
  let N=0,T=0;for(const b of C){const v=primes.filter(q=>q<=U&&q%(m*s)===b).length-primes.filter(q=>q<=V&&q%(m*s)===b).length;N+=v;T+=j(b)*v}
  ck(N===p.length&&T===p.reduce((z,q)=>z+j(q),0),"CRT");crt++;
 }
 }}
 const a=2,b=1,d=2,r=6,P=24*(a-b)-d*(a+b),T=r*(a-b)+d*(a+b);
 ck((24-3*d)*T===(r+3*d)*P&&P===18&&T===12,"sharp");controls++;
 ck(3*(2-1)-(2+1)===0&&2+1>0,"denominator");controls++;
 ck(17-16<17,"mass guard");controls++;
 console.log({scalar,orth,crt,actualPrimes:primes.length,controls});
```

Native environment: lean/lake/gh absent; git ls-remote failed DNS.
Actual published status.json for 45577239749 and 45576756833 independently
read, both pass/returncode 0. Blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717. Tail confirms half-strip root
only propext, Classical.choice, Quot.sound, and scan 2000 visited with 324 pending.
Separate lean_actual_root.log and prune_actual.log fetches returned 404;
status tails carry actual output. Prior orchestrator #437 run 45594425585
PASS at c063b20 only. No new Lean or CI verification or URT advantage claimed.

Verdict AGREE with RUN28 same-exception and uniform minus ratio.
DISAGREE with treating nonalignment as an unbiased unsigned main term
or dropping the denominator guard. PARTIAL: exact local human reduction,
prepared scalar Lean bridge below; full caller replacement, transitive
axioms and RH equation remain open.
RESUME HERE: formalize the two-endpoint coset identities in pinned
QH.twistK and apply interval_transfer to its actual PNT inputs; use the
same host and exception, then check original theorem type and axioms.
HANDOFF TO character_boxes, kernel_extractor, integration/editor.
-/

namespace RHDirectIntervalAudit

-- Scalar bridge only: hD must come from the native coset and interval proof.
theorem interval_transfer (a b P T D d r : ℝ)
    (hb : 0 ≤ b) (hba : 2*b ≤ a) (hd : 0 ≤ d)
    (hd' : 3*d ≤ 1) (hr : 0 ≤ r)
    (hP : |P-(a-b)| ≤ d*(a+b))
    (hT : |T-D| ≤ d*(a+b)) (hD : |D| ≤ r*(a-b)) :
    (1-3*d)*|T| ≤ (r+3*d)*P := by
  have hsum : a+b ≤ 3*(a-b) := by linarith
  have hpos : 0 ≤ 1-3*d := by linarith
  have hrpos : 0 ≤ r+3*d := by linarith
  have hbudget := mul_le_mul_of_nonneg_left hsum hd
  have hP0 := (abs_le.mp hP).1
  have hP1 : (1-3*d)*(a-b) ≤ P := by nlinarith
  have htriangle : |T| ≤ |T-D|+|D| := by
    have h := abs_add_le (T-D) D
    rwa [sub_add_cancel] at h
  have hT1 : |T| ≤ (r+3*d)*(a-b) := by nlinarith
  calc
    (1-3*d)*|T| ≤ (1-3*d)*((r+3*d)*(a-b)) :=
      mul_le_mul_of_nonneg_left hT1 hpos
    _ = (r+3*d)*((1-3*d)*(a-b)) := by ring
    _ ≤ (r+3*d)*P := mul_le_mul_of_nonneg_left hP1 hrpos

theorem interval_rule (a b P T D d r : ℝ)
    (hb : 0 ≤ b) (hba : 2*b ≤ a) (hd : 0 ≤ d)
    (hd' : 3*d ≤ 1) (hr : 0 ≤ r)
    (hP : |P-(a-b)| ≤ d*(a+b))
    (hT : |T-D| ≤ d*(a+b)) (hD : |D| ≤ r*(a-b)) :
    (1-3*d)*|T| ≤ (r+3*d)*P := by
  first | rh_reduce 3 using [interval_transfer] |
    exact interval_transfer a b P T D d r hb hba hd hd' hr hP hT hD

theorem interval_frontier (a b P T D d r : ℝ)
    (hb : 0 ≤ b) (hba : 2*b ≤ a) (hd : 0 ≤ d)
    (hd' : 3*d ≤ 1) (hr : 0 ≤ r)
    (hP : |P-(a-b)| ≤ d*(a+b))
    (hT : |T-D| ≤ d*(a+b)) (hD : |D| ≤ r*(a-b)) :
    (1-3*d)*|T| ≤ (r+3*d)*P := by
  rh_auto_frontier 2
  all_goals first | exact interval_transfer a b P T D d r hb hba hd hd' hr hP hT hD | rh_auto 3

rh_scan QH.twistK limit 2000
rh_prune QH.twistK as RHNativeTwistKPruned
rh_scan interval_transfer limit 2000
#print axioms QH.twistK
#print axioms interval_transfer
end RHDirectIntervalAudit

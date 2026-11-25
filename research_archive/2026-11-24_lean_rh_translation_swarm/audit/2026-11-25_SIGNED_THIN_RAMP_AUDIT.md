# Lane 10 — independent audit: preserve the signed thin prime correlation before taking norms
25 Nov 2026. REVIEW + stronger local sufficient bound. RH OPEN. One contribution: sharpen and independently audit peer 53e08a781b2098e302ab6bde518b675b0c9b7ba3 (geometric-mean centering) by using the exact supporting line of each ramp. No proof of the required uniform arithmetic cancellation.

Preflight: read current ONE_EQUATION_MISSION blob 8dc6705e1bc6540b600f6c22309294466ec88fd0 first (mandatory unified engine from 4b677bc2), SWARM_PROTOCOL, AGENTS, HANDOFF_QUEUE, research state/log/protocol/continuity excerpts, latest peers 53e08a78, b0afce1d, cb92aa3a, 05530e1b, 9402fbb4. Not exhaustive archive re-audit. No Cathedral edits or URT.

## Exact source and scope
Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005. Fetched at this pin:
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean blob 878f5077bc382426c7da988e5a375b85deeaa7de: lines 19–75 sum_A, sum_Th; 76–151 th_le; 286–333 core; 440–443 core caller in ch_core.
- src/Formalism/SizeWindowBrackets/ChainSlopeWindows/StronglyIrreducible.lean blob 94a385f59f3781ae6b1ab4beddc73850708a2bc6: ortho_coset (274), orthogonality_ramified (311), Kc (446), inner_eq (655).
- src/Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean blob b5662cda1f3523fc53b547ee582a46bd3cd826d4.
The source-matched local graph is inner_eq + ortho_coset + nonnegative Kc -> th_le -> core -> ch_core -> downstream family window. The original graph and all native premises remain; the proposed local replacement is conditional on A0=H and the actual thin translation coverage, as in peer 53e08a78. No elaborated root reachability beyond the separately checked half-strip adapter is claimed for this replacement. Do not delete ThinScales, LipW, other consumers, pending nodes, or any original axiom evidence.

## Audit and one stronger inequality
Use peer notation: h=|H|>0, F=2h, C_i={(1,i,k):k in H}, I_g={u:g thin for u}, c_i=|I_g|/h constant within C_i (c_0=1-d,c_1=1,d=|T2|/h). Omit empty cosets. Fix t,j,A=a(t)>0. All actual weights v_ug=w(u,j,partner(t,g))>0, with the native thin upper bound v_ug<=2b'. Let mu_g be the conditional arithmetic mean and b_i the common geometric mean of all v_ug in that coset (h^2 c_i cells). The native expansion is
    P_g(v)=R_g(v)+(A/F) log v+C_g,
    R_g(v)=sum_n Lambda(n) Kc(n,g) (A/n-v)_+.
For each genuine prime power Kc is real nonnegative and sums to 2 over G by ortho_coset; n=1 contributes zero. All sums are finite after restriction to the maximum cutoff. Centering constant C_g is independent of v, including ell. Peer Jensen/positive-excess argument is valid under those premises.

The sharper supporting line, for any real a,b,v, is
    (a-v)_+ >= (a-b)_+ - (v-b) 1_{a>b}.
Proof: if a>b use (a-v)_+>=a-v; otherwise RHS is zero. This works at equality a=b; choosing the strict active set is a legitimate subgradient. Sum with a=A/n and the nonnegative Lambda(n)Kc(n,g), then average over u and sum over g. Because the common geometric mean gives EXACT cancellation of sum log(v_ug/b_i), define
    S_g(b_i)=sum_{n<A/b_i} Lambda(n) Kc(n,g).
Then the replacement lower bound is
    (1/h) sum_{g in C_i} sum_{u in I_g} P_g(v_ug)
      >= c_i sum_{g in C_i} P_g(b_i)
          - c_i sum_{g in C_i} (mu_g-b_i) S_g(b_i).
No Jensen is needed: the signed linear correction already commutes with the average.

At common b_i, the unchanged four-character orthogonality argument and |GPsi(chi,A/b_i)| <= (A/b_i) theta_i give the sufficient signed thin loss budget
    E_thin <= 2 A sum_i c_i theta_i
                + sum_i c_i sum_{g in C_i} (mu_g-b_i) S_g(b_i).        (*)
The reference bound applies at each of the two scales; b_i<=2b' and the original size assumptions ensure its required lower cutoff. If a nonnegative loss budget is needed, take max(0,RHS). The previous exact positive-excess error is sum_i c_i sum_g (mu_g-b_i)_+ sum_{n<=A/b_i} Lambda(n)Kc(n,g); termwise the new signed error is no larger. It can be strictly smaller and can even be negative. The signed correlation is genuine, not forced zero by log centering: arithmetic means need not equal geometric means, and the prime weights differ by g. Do not replace S_g by its total/mean without a valid correlation estimate. Equality n=A/b_i is not silently included in the new active set. The original fallback remains.

Caller scope: keep the thick error from cb92aa3a, native hTop, hY, HostFactsS, SizesA, hT2, plus all positivity/size conditions. Replace ONLY the sufficient averaged thin error in the conditional principal-host argument; retain the original proof graph and axiom ledger separately. No global premise deletion, no bound on actual mu_g or signed correlation, no proof of the native geometric supplier. Formula (*) is a weaker sufficient local error estimate than the exact positive-excess budget in 53e08a78, not a new RH criterion or independent RH closure.

## Executed exact regression
The following JS was actually executed in a tool isolate (all integer products in the safe exact integer range). The finite group is C2^3 with genuine quadratic character prime-power coefficients mod 3,5,7; it is NOT a native asymptotic host. Kc=Fourier sum/4, so inertia zeros are retained and the coefficient sum is 2. Balanced products verify log cancellation algebraically rather than with float logs. Checks on each n are independent of the positive irrational factor log p. The negative controls reject dropping the active-set guard, dropping the geometric-mean constraint, and dropping the signed correction. Counts of strictly improved, negative-credit and omitted-correlation failures are per-n finite cases, not estimates for actual geometry.
```javascript
function certificate() {
  const ck=(b)=>{if(!b)throw Error("assertion failed")};
  const pos=x=>Math.max(x,0);
  let scalar=0, controls=0, primePowers=0, kernel=0, checks=0, improvements=0, credit=0, omittedFails=0, balance=0;
  for(let A=1;A<=24;A++)for(let n=1;n<=12;n++)for(let b=1;b<=8;b++)for(let v=1;v<=8;v++){
    ck(pos(A-n*v)>=pos(A-n*b)-(A>n*b?n*(v-b):0));scalar++;
  }
  ck(pos(1-2)<pos(1-3)-(2-3));controls++;
  ck(1*1!==2**2);controls++;
  const isPrime=p=>{for(let k=2;k*k<=p;k++)if(p%k===0)return false;return p>=2};
  const leg=(n,p)=>{if(n%p===0)return 0;for(let k=1;k<p;k++)if(k*k%p===n%p)return 1;return -1};
  const sign=(m,g)=>{let x=m&g,s=1;while(x){s=-s;x&=x-1;}return s};
  const rows=[];
  for(let p=2;p<=1200;p++)if(isPrime(p))for(let n=p;n<=1200;n*=p){
    const l=[3,5,7].map(q=>leg(n,q));
    const coeff=Array.from({length:8},(_,g)=>Array.from({length:8},(_,m)=>{
      let c=sign(m,g);for(let j=0;j<3;j++)if(m&(1<<j))c*=l[j];return c;
    }).reduce((a,b)=>a+b,0)/4);
    ck(coeff.reduce((a,b)=>a+b,0)===2);
    for(const c of coeff){ck(Number.isInteger(c)&&c>=0);kernel++}
    rows.push({n,coeff});primePowers++;
  }
  for(const i of [0,1]){
    const gs=[1+2*i,5+2*i];
    const pairs=gs.flatMap((g,k)=>[0,1].filter(u=>i===1||u!==k).map(u=>({g,u})));
    const m=pairs.length;
    for(const b of [2,3,4])for(let mask=0;mask<3**m;mask++){
      let code=mask;
      const vs=pairs.map(()=>{let v=[1,b,b*b][code%3];code=Math.floor(code/3);return v});
      if(vs.reduce((a,v)=>a*v,1)!==b**m)continue;
      balance++;
      const dev=gs.map(g=>pairs.reduce((s,r,j)=>s+(r.g===g?vs[j]-b:0),0));
      for(const A of [12,50,100,240,900])for(const {n,coeff} of rows){
        const lhs=pairs.reduce((s,r,j)=>s+coeff[r.g]*pos(A-n*vs[j]),0);
        const ref=pairs.reduce((s,r)=>s+coeff[r.g]*pos(A-n*b),0);
        const signed=A>n*b?n*gs.reduce((s,g,j)=>s+coeff[g]*dev[j],0):0;
        const old=A>=n*b?n*gs.reduce((s,g,j)=>s+coeff[g]*pos(dev[j]),0):0;
        ck(lhs>=ref-signed);ck(signed<=old);checks++;
        if(signed<old)improvements++;
        if(signed<0)credit++;
        if(lhs<ref)omittedFails++;
      }
    }
  }
  ck(omittedFails>0&&credit>0&&improvements>0);controls++;
  return {scalar,controls,primePowers,kernel,balance,checks,improvements,credit,omittedFails};
}
console.log(certificate());
```
Observed: {"scalar":18432,"controls":3,"primePowers":222,"kernel":1776,"balance":66,"checks":73260,"improvements":866,"credit":855,"omittedFails":1551}

## Prepared native certificate (NOT EXECUTED)
Save the following as ThinSignedRamp.lean and run lake env lean -DwarningAsError=true ThinSignedRamp.lean in the pinned Mathlib environment. The local real scalar bridge is independent of Main. The finite sum bridge retains coefficient nonnegativity; no attempt to close actual host obligations. The snippet requires native elaboration before being treated as a kernel fact.
```lean
import Mathlib
open Finset
namespace RHAuditThin
theorem signed_ramp (a b v : ℝ) :
    max (a - b) 0 - (if b < a then v - b else 0) ≤ max (a - v) 0 := by
  by_cases h : b < a
  · rw [if_pos h, max_eq_left (sub_nonneg.mpr h.le)]
    linarith [le_max_left (a - v) (0 : ℝ)]
  · rw [if_neg h, max_eq_right (sub_nonpos.mpr (le_of_not_gt h))]
    simpa using (le_max_right (a - v) (0 : ℝ))

theorem signed_sum {ι : Type*} (s : Finset ι) (a k : ι → ℝ) (b v : ℝ)
    (hk : ∀ i ∈ s, 0 ≤ k i) :
    (∑ i ∈ s, k i * (max (a i - b) 0 - (if b < a i then v - b else 0))) ≤
      ∑ i ∈ s, k i * max (a i - v) 0 := by
  exact Finset.sum_le_sum fun i hi =>
    mul_le_mul_of_nonneg_left (signed_ramp (a i) b v) (hk i hi)

#print axioms signed_ramp
#print axioms signed_sum
end RHAuditThin
```

## Native baseline inspected and failed attempts
Lean and Lake absent from PATH; native git ls-remote failed DNS. Source file search for StronglyIrreducible.lean returned no matches, recovered by exact pinned path. Direct state result.json paths returned 404; fetched actual GitHub Actions job logs instead:
- run 45577239749 job 139078198272: PASS (98.87s), RHActualRoot.reduced_strip_root and Formalism.VW.rh_of_right axioms [propext, Classical.choice, Quot.sound]; automatic frontier rejection has no axioms.
- run 45576756833 job 139076580079: PASS (77.94s), ROOT_SCAN rh_of_right visited=2000 values=1642 noValue=358 axioms=3 missing=0 pending=324. This bounded scan is not the full Main proof.
No native rh_prune/rh_scan/rh_reduce/rh_auto invocation on this new lemma or actual caller; no CI PASS claimed for it. New scalar certificate and caller bridge prepared; retain all original/reduced evidence. Unresolved actual host weights, signed correlation, full native geometry and principal prime cancellation remain. No RH theorem import or URT.

RESUME HERE: use actual CanonInst.off -> w(u,j,partner(t,g)) mapping to bound the signed correlation in (*) at the actual reference scales, not its absolute-value envelope; ask kernel lane to elaborate the prepared scalar and finite-sum bridge and then actual caller. HANDOFF TO geometry, structure, kernel extractor, integration.

Verdict: AGREE with peer conditional Jensen/geometric mean reduction. DISAGREE with dropping the signed prime correlation or active set. PARTIAL on actual host use and RH.
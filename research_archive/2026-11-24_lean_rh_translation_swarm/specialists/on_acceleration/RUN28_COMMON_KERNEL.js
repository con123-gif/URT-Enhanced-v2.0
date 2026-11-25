/*
RUN28 — one common positive arithmetic kernel replaces row-specific score construction.
25 Nov 2026. Lane 14. SOURCE-MATCHED conditional human reduction + executed exact finite certificate. RH OPEN.
Pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005.
Read latest ONE_EQUATION_MISSION blob 8dc6705e1bc6540b600f6c22309294466ec88fd0 (mandatory engine), AGENTS, SWARM, HANDOFF, EXPANSION, state/log/protocol/continuity excerpts, prior RUN27 6fec2cae, peer almost-coverage e8d168ea, selected core 3eba527a, selected point loss fec5acd7, count reference 4d395181, full mean-square eae577c6. No duplication of URT compression.

Actual target: RUN27 combined signed D'_v = - sum_t sum_n Lambda(n) Kc(n,e1(v-t)) c(A_t,n), where
  c(A,n) = (A/n-A/y)_+ -(A/n-b)_+ + J 1_{n<=A/b}, J=eta+1, y=y_L.
Retain shared TT,T2, A_t, b, eta, y_L, all original reference, ramification and geometric requirements.
Actual aT_win gives a=xb <= A_t <= a+b; y>=x+1 is an explicit sufficient guard, available eventually from the native thin reference scale (or retain it as a guard and revert to RUN27 if unavailable). b>0,J>=0. For n>0 and x>=1, define the common upper kernel:
  c^+(n)=b-a/y+J                 if n<=x;
         (a+b)(1/n-1/y)+J 1_{n<=x+1} if x<n<=y;
         0                        otherwise.
Exact inequality:
  0 <= c^+(n)-c(A_t,n) <= (b/y)1_{n<=x}+(b/n)1_{x<n<=y}+J 1_{x<n<=x+1}.    (A)
For n<=x both ramps active, cost=b-A_t/y+J. For x<n<=y, first ramp=A_t(1/n-1/y), second is nonnegative, bounded above by (A_t-a)/n because a/n<b. The difference of indicator terms lies between 0 and J 1_{n<=x+1}. Combining the two ramp differences gives <= b/n, not two independent ramp bounds. Beyond y both ramps and indicator vanish. No sign approximation.
Set P_g=sum_n Lambda(n) Kc(n,e1(g)) c^+(n), C_v=sum_{t in TT}P_{v-t}. Positivity and total Kc mass <=2 on this slice follow from orthogonality_ramified (mass 2 on full group, also at ramified prime powers). Thus -C_v<=D'_v and
  E=sum_v(C_v+D'_v) <= 2|TT|[b psi(x)/y+b sum_{x<n<=y} Lambda(n)/n+J log(x+1)].
The unit interval (x,x+1] contains at most one integer, Lambda(n)<=log n. Chebyshev psi(z)<=C z and Stieltjes partial summation bound the normalized penalty 2E/(|TT|b) by
  4[C x/y + C(1+log(y/x)) + (J/b) log(x+1)].
Native y_L<=xn X', X'=exp(x^(eps/3)), log n=O(log x), J/b<=1 eventually (CostWindows), so this is O(x^(eps/3)+log x), strictly smaller than the required RH-scale x^(1/2+eps). No RH or prime cancellation used.
Choose u by RUN27 dyadic selector on -C; with d=|T2|/h, exact finite averaging yields
  M(u) >= mean_H M - d E.                                  (B)
Proof: M=B0+sum_s D'_{s+u}; >=B0-sum_s C_{s+u} >=B0-d sum C = mean M-d E.
For rational upper enclosures of P, add their actual aggregate mass error to E; no uncertified floating comparisons. The factor d cancels at the final normalization Qd/2, Q=|TT|mb. No arbitrary u is justified. A geometry witness still must exist at the chosen u with the same data and required gap; almost-coverage peer variant would require selection on its admissible subset or the corresponding additional coverage loss, not established here.

Computational change: build P in one pass over supplied prime-power/Frobenius entries (including every nonzero inertia-coset entry in production), then circularly convolve with 0/1 TT mask, then linear dyadic selection. No dependence on individual A_t in selection, except their certified range. This removes repeated per-row prime-power arithmetic and real tie comparisons; the original exact A_t values remain in geometry, downstream references, and all other consumers. Direct sparse scatter O(|TT|*P_entries) vs shared O(P_entries+h) aggregation + exact packed big-integer convolution; not a linear bit-complexity claim for the multiplication. Standard exact NTT/CRT is an alternative with explicit coefficient bounds. Packing chooses base strictly above sum P; no carries, full exact independent comparison. Context cache key includes pin, group isomorphism, actual host D inertia/Frobenius, TT,T2, x,b,y,J, cutoffs and enclosure precision. Different A_t within certified range may reuse selection but must not reuse downstream geometric proof. Preserve full original role graph RUN25 ce477f4e and original proof. Candidate source-facing reduced edges: common native tables -> common kernel -> convolution -> dyadic witness -> actual carrying geometry -> signed two-reference transfer -> ch_core/size -> zero-free. Not new kernel extraction. No premise globally deleted.

Pinned source anchors: src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de (sum_Th,th_le,core); ChBalance.lean 37648715bcf507e086374e8cc476ee746fd274f4 (ounram,askExp,ch_balance); src/Formalism/SizeWindowBrackets/ChainSlopeWindows/StronglyIrreducible.lean 94a385f59f3781ae6b1ab4beddc73850708a2bc6 (Kc,orthogonality_ramified); src/Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean 7828c8b1060818fe158e23f87f1ad9e2efcf79eb (winO, common data,CoverAll). Actual native A_t, admissible TT/T2, and full host table unavailable in this run. Tests use genuine unramified Frobenius of Q(zeta_(4h))^+(sqrt(-3),sqrt(-7)), control scale x=1009,b=10000,y=40000,J=7 and prime-derived control masks, not a valid native geometric instance. Ramified p=2,3,7 omitted only in this explicitly limited benchmark, never in theorem (A)/(B). Logs bounded by exact 24-term atanh series on z<=1/3, floor each term at 2^48 precision, tail <1 unit; log p uses k log 2 + log(p/2^k). Exact integer tests include threshold and incorrect frozen left endpoint negative controls. Timing is repeated wall-clock V8 compute with prebuilt input records, not disk cold; no URT ablation because earlier negative and deterministic exact kernel. Peak RSS unavailable in V8, Node replay reports process peak RSS. Run result:
{
  "primes": 4203,
  "checks": 714382,
  "negative_controls": 2,
  "report": [
    {
      "h": 128,
      "TT": 16,
      "T2": 128,
      "prime_power_records": 1055,
      "scatter_terms": 16880,
      "shared_records": 1055,
      "scatter_ms": [
        1,
        2,
        1,
        1,
        1
      ],
      "packed_ms": [
        1,
        0,
        0,
        0,
        0
      ],
      "scatter_warm_ms": 1,
      "packed_warm_ms": 0,
      "selected": 0,
      "normalized_certified_gap": 2.6834691511924347,
      "same_output": true
    },
    {
      "h": 512,
      "TT": 64,
      "T2": 500,
      "prime_power_records": 1055,
      "scatter_terms": 67520,
      "shared_records": 1055,
      "scatter_ms": [
        5,
        5,
        4,
        6,
        5
      ],
      "packed_ms": [
        1,
        0,
        1,
        0,
        1
      ],
      "scatter_warm_ms": 5,
      "packed_warm_ms": 1,
      "selected": 304,
      "normalized_certified_gap": 2.6517112965534024,
      "same_output": true
    },
    {
      "h": 2048,
      "TT": 256,
      "T2": 1079,
      "prime_power_records": 1055,
      "scatter_terms": 270080,
      "shared_records": 1055,
      "scatter_ms": [
        22,
        25,
        34,
        23,
        20
      ],
      "packed_ms": [
        3,
        2,
        2,
        3,
        2
      ],
      "scatter_warm_ms": 25,
      "packed_warm_ms": 2,
      "selected": 80,
      "normalized_certified_gap": 2.487815253611219,
      "same_output": true
    }
  ],
  "peak_rss_bytes": null,
  "scope": "finite genuine unramified Frobenius arithmetic, control scales and masks; not native geometry or RH"
}

Native pipeline status: prior status.json for rh-recursive-reduction-strip-root-20261125 and rh-proof-term-prune-native-20261125 retrieved, actual previous CI pass 98.87s and 77.94s respectively; neither validates this run. Lean/lake absent locally. Retrieved RHProofTermPrune.lean f6d3e7f6047a7895ecf183be3fb54c203f4fc46a, RHRecursiveReductionFixed.lean 976c28572f11ffb00e1ae730555e938eeb564cb7, RHRecursiveReductionAutoV3.lean a113dc56ea987abac3bf29eb480782140b82ab4a. Prepared (not compiled) scalar bridge for actual selected-core caller:
  theorem RHCommonKernelTransfer (M B d E L U : ℝ)
      (h1 : B-L ≤ M) (h2 : L ≤ d*U) (h3 : U = E + (U-E)) :
      B-d*(U-E)-d*E ≤ M := by
    have h : B-d*U ≤ M := by linarith
    linarith
The h3 premise is tautological and is deliberately unnecessary; use the weaker version below instead:
  theorem RHCommonKernelTransferWeak (M B d E L U : ℝ)
      (h1 : B-L ≤ M) (h2 : L ≤ d*U) :
      B-d*(U-E)-d*E ≤ M := by
    have h : B-d*U ≤ M := by linarith
    nlinarith
  #print axioms RHCommonKernelTransferWeak
  rh_scan Deduction.CharacterBalanceMoves.core limit 2000
  rh_scan Deduction.CharacterBalanceMoves.th_le limit 2000
  rh_prune Deduction.CharacterBalanceMoves.th_le as RHCommonKernelThLeCandidate
In pinned environment import actual ChCore plus compiled engines, prove scalar ramp cases and finite convolution transfer, use rh_reduce/rh_auto/rh_auto_frontier at actual selected caller and inspect unresolved goals. No Main import; no new CI or axiom PASS; backtrack to original score if any guard or selected geometry fails. Prior graphs and axioms remain intact. Native selected caller, geometric carrying-point construction, uniform count/rank/TopG and RH prime-window cancellation remain OPEN.

RESUME HERE: integrate (A)/(B) into actual selected-core Lean caller using certified y_L>=x+1 from native scale, produce real P from authenticated host table with ramification and compare original/reduced typed dependency graphs. Prioritize geometry existence and decisive prime inequality, not further benchmark variants.
HANDOFF TO integration, kernel, geometry, audit, editor.
*/

function run() {
  const ck=(b,m)=>{if(!b)throw Error(m)};
  const sum=a=>a.reduce((s,v)=>s+v,0n);
  const S=1n<<48n, terms=24;
  function atanhLog(a,b) {
    ck(a>=0n&&3n*a<=b,"log range");
    let lo=0n, p=a, q=b;
    for(let i=0;i<terms;i++){lo+=2n*S*p/(q*BigInt(2*i+1));p*=a*a;q*=b*b}
    ck(3n*S<3n**BigInt(2*terms+1),"tail");
    return [lo,lo+BigInt(terms+1)];
  }
  const log2=atanhLog(1n,3n);
  function logBounds(p) {
    const P=BigInt(p),k=BigInt(P.toString(2).length-1),r=1n<<k;
    const [l,u]=atanhLog(P-r,P+r);
    return [k*log2[0]+l,k*log2[1]+u];
  }
  function primes(N) {
    const a=new Uint8Array(N+1);a.fill(1,2);
    for(let p=2;p*p<=N;p++)if(a[p])for(let i=p*p;i<=N;i+=p)a[i]=0;
    return Array.from(a.keys()).filter(i=>a[i]);
  }
  const x=1009n,b=10000n,y=40000n,J=7n,a=x*b;
  const pp=primes(Number(y)), logs=new Map(pp.map(p=>[p,logBounds(p)]));
  const max0=z=>z>0n?z:0n;
  function actual(n,A) {
    return A*max0(y-n)-y*max0(A-b*n)+(n*b<=A?J*n*y:0n);
  }
  function major(n) {
    if(n<=x)return (b+J)*n*y-a*n;
    if(n<=y)return (a+b)*(y-n)+(n<=x+1n?J*n*y:0n);
    return 0n;
  }
  const ceil=(v,d)=>(v+d-1n)/d;
  let checks=0,controls=0;
  for(const n of [1n,x-1n,x,x+1n,x+2n,y-1n,y,y+1n])for(const r of [0n,1n,b/2n,b-1n,b]){
    const g=major(n)-actual(n,a+r);
    const cap=n<=x?b*n:n<=y?b*y+(n<=x+1n?J*n*y:0n):0n;
    ck(g>=0n&&g<=cap,"boundary envelope");checks++;
  }
  ck(major(x+1n)-J*(x+1n)*y<actual(x+1n,a+b),"threshold negative control");controls++;
  ck(actual(x+2n,a)<actual(x+2n,a+b),"left endpoint negative control");controls++;
  function fixture(h) {
    const mod=4*h,lookup=new Map();let v=1;
    for(let i=0;i<h;i++){ck(!lookup.has(v)&&!lookup.has((mod-v)%mod),"coordinate collision");lookup.set(v,i);lookup.set((mod-v)%mod,i);v=v*5%mod}
    ck(v===1&&lookup.size===2*h,"coordinate coverage");
    const TT=new Map(),T2=new Set(),rows=[];
    for(const p of pp) {
      if(p===2||p===3||p===7)continue;
      const k=lookup.get(p%mod);ck(k!==undefined,"Frobenius");
      if(TT.size<h/8&&!TT.has(k))TT.set(k,a+BigInt(p)% (b+1n));
      if(p<=10000)T2.add(k);
      // Genuine unramified Frobenius slice e1 = (nontrivial -3, trivial -7).
      if(p%3!==2||![1,2,4].includes(p%7))continue;
      const [l,u]=logs.get(p);
      for(let n=p,i=1;n<=Number(y);n*=p,i++){
        if(i%2===0)continue;
        const N=BigInt(n),den=N*y,up=2n*ceil(major(N)*u,den);
        rows.push({r:k*i%h,n:N,l,u,up,den});
      }
    }
    return {h,TT:[...TT],T2:[...T2],rows};
  }
  function scatter(f) {
    const z=Array(f.h).fill(0n);
    for(const [t] of f.TT)for(const r of f.rows)z[(t+r.r)%f.h]+=r.up;
    return z;
  }
  function packed(f) {
    const h=f.h,z=Array(h).fill(0n),mask=Array(h).fill(0n);
    for(const r of f.rows)z[r.r]+=r.up;
    for(const [t] of f.TT){ck(mask[t]===0n,"duplicate TT");mask[t]=1n}
    const w=Math.max(1,(sum(z)+1n).toString(16).length);
    const pack=v=>BigInt("0x"+v.slice().reverse().map(x=>x.toString(16).padStart(w,"0")).join(""));
    const digits=(pack(z)*pack(mask)).toString(16).padStart(w*2*h,"0"),out=Array(h).fill(0n);
    ck(digits.length===w*2*h,"packed overflow");
    for(let i=0;i<2*h;i++){const end=digits.length-i*w;out[i%h]+=BigInt("0x"+digits.slice(end-w,end))}
    ck(sum(out)===sum(z)*BigInt(f.TT.length),"mass conservation");
    return out;
  }
  function select(d,t) {
    const h=d.length,c=Array(h).fill(0n);
    for(const s of t)c[s]=1n;
    const levels=[[d,c]];
    while(levels.at(-1)[0].length>1){const [a,b]=levels.at(-1),q=a.length/2;levels.push([a.slice(0,q).map((v,i)=>v+a[i+q]),b.slice(0,q).map((v,i)=>v+b[i+q])])}
    let a=0,total=sum(d)*BigInt(t.length);
    for(let k=levels.length-2;k>=0;k--){const [v,c]=levels[k],q=v.length;let l=0n;for(let j=0;j<q;j++)l+=v[j]*c[(j-a+q)%q];const r=total-l;if(r<l){a+=q/2;total=r}else total=l}
    ck(total===sum(t.map(s=>d[(s+a)%h])),"leaf");
    ck(BigInt(h)*total<=BigInt(t.length)*sum(d),"mean");
    return [a,total];
  }
  function timed(fn) {
    const ts=[];let v;
    for(let i=0;i<5;i++){const t=Date.now();v=fn();ts.push(Date.now()-t)}
    return {v,first_ms:ts[0],warm_median_ms:ts.slice(1).sort((a,b)=>a-b)[2],samples_ms:ts};
  }
  const report=[];
  for(const h of [128,512,2048]){
    const f=fixture(h),slow=timed(()=>scatter(f)),fast=timed(()=>packed(f));
    ck(slow.v.every((v,i)=>v===fast.v[i]),"convolution mismatch");checks+=h;
    const lower=Array(h).fill(0n),upper=Array(h).fill(0n);let cap=0n;
    for(const [t,A] of f.TT)for(const r of f.rows){
      const v=actual(r.n,A),g=major(r.n)-v;
      const bound=r.n<=x?b*r.n:b*y+(r.n<=x+1n?J*r.n*y:0n);
      ck(v>=0n&&g>=0n&&g<=bound,"actual term envelope");checks++;
      const j=(t+r.r)%h,l=2n*(v*r.l/r.den),u=2n*ceil(v*r.u,r.den);
      ck(l<=u&&u<=r.up,"log interval");checks++;
      lower[j]+=l;upper[j]+=u;
      cap+=r.up-l;
    }
    ck(upper.every((v,i)=>v<=fast.v[i]),"pointwise upper");checks+=h;
    ck(cap===sum(fast.v)-sum(lower),"aggregate error");checks++;
    const [u,cost]=select(fast.v,f.T2);
    const target=BigInt(f.T2.length),actualSelectedHi=sum(f.T2.map(s=>upper[(s+u)%h]));
    ck(BigInt(h)*actualSelectedHi-target*sum(lower)<=target*cap,"normalized mean transfer");checks++;
    report.push({h,TT:f.TT.length,T2:f.T2.length,prime_power_records:f.rows.length,scatter_terms:f.TT.length*f.rows.length,shared_records:f.rows.length,scatter_ms:slow.samples_ms,packed_ms:fast.samples_ms,scatter_warm_ms:slow.warm_median_ms,packed_warm_ms:fast.warm_median_ms,selected:u,normalized_certified_gap:Number(2n*cap)/Number(S*BigInt(f.TT.length)*b),same_output:true});
  }
  return {primes:pp.length,checks,negative_controls:controls,report,peak_rss_bytes:typeof process!=="undefined"?process.resourceUsage().maxRSS*1024:null,scope:"finite genuine unramified Frobenius arithmetic, control scales and masks; not native geometry or RH"};
}
if (typeof console !== 'undefined') console.log(JSON.stringify(run(),null,2));

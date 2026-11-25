/*
RUN29 — exact three-channel factorization of selected native arithmetic score
25 Nov 2026. Lane 14. SOURCE-MATCHED conditional human proof and executed finite certificate. RH OPEN.
Pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005.
Read mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc (mandatory engine), AGENTS, SWARM, HANDOFF, EXPANSION, live manuscript, peers 65c381c4,d4c1ff4b,0e9468bc,604f95bc,e8d168ea,3eba527a,fec5acd7 and prior RUN28 93284779. No duplicate URT work.
Result: exact score with THREE cyclic convolutions (two if boundary integer is not a prime power or slice kernel zero). No row-height approximation loss. Retain actual common TT,T2,D,y=y_L,b>0,J=eta+1>=0,x>=1,a=xb,a<=A_t<=a+b,y>=x+1 (retain guard). Set q=floor(x)+1. K_n(g)=Lambda(n) Re Kc(D,n,e1(g)), nonnegative by native ramified orthogonality; include ALL inertia-coset contributions.
 c(A,n)=(A/n-A/y)_+-(A/n-b)_++J 1_(nb<=A).
 C(v)=-D'_v=sum_(t,n) K_n(v-t)c(A_t,n).
 For n<=x both ramps active, c=b+J-A/y.
 For x<n<=y, n != q, integer n>x+1, hence A/n<b, c=A(1/n-1/y).
 At n=q retain exact c(A,q), including equality; beyond y c=0.
 Therefore, with * the finite group convolution,
 C = W_L * P_L + W_R * P_R + W_q * P_q,
 W_L(t)=1_TT(t)(b+J-A_t/y), W_R(t)=1_TT(t)A_t,
 W_q(t)=1_TT(t)c(A_t,q), P_L=sum_(n<=x) K_n,
 P_R=sum_(x<n<=y,n!=q) (1/n-1/y)K_n, P_q=K_q.
 All six factors nonnegative (A_t/y<=b). Equality at every v, even ramified; works on any finite abelian group. Only one non-affine integer threshold. If q not prime power, third term vanishes. With certified nonnegative factor intervals, convolve lower with lower, upper with upper; L_v<=C_v<=U_v. E=sum(U-L). Choose u with sum_s U_(s+u)<=d sum U, d=|T2|/|H| (RUN27). Then M(u)=B-sum_s C_(s+u)>=mean M-d E. E now only interval arithmetic, not a height-envelope loss. For peer almost-coverage G use min upper over G with separate coverage penalty (do not infer geometry). Actual carrying geometry at selected u remains required.
 Complexity O(R+|TT|+|H|) aggregation/vector work plus three group convolutions (six for interval bounds); no linear bit-complexity claim for multiplication. Packing base strictly exceeds product of sums. Direct baseline scatters SAME quantized coefficients, independently checked against exact per-pair rational log enclosures. Timings exclude sieve/fixture and include aggregation/convolution; first invocation not cold storage. V8 peak RSS unavailable; Node replay reports total process RSS. No URT schedule ablation because deterministic algebra and prior negative comparisons. Genuine unramified Frobenius Q(zeta_(4h))^+(sqrt(-3),sqrt(-7)), excludes p=2,3,7 ONLY in benchmark; control scales/masks, not valid native geometry; x=1018.5 with prime boundary 1019 active. Logs bounded by RUN28 24-term atanh series. Initial certificate run failed due to reading array .size; repaired to .length, reran successfully before commit.
 Pinned ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de (sum_Th,th_le,core), src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean; src/Formalism/SizeWindowBrackets/ChainSlopeWindows/StronglyIrreducible.lean 94a385f59f3781ae6b1ab4beddc73850708a2bc6 (Kc, orthogonality_ramified); src/Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean 7828c8b1060818fe158e23f87f1ad9e2efcf79eb (winO uses aT_win lower/upper, linkGLOBAL_of). Actual blobs retrieved. Original role graph RUN25 ce477f4e unchanged. Candidate overlay RUN27/28 exact D' -> factorized score -> mean-qualified selection -> same genuine geometry -> original signed transfer -> native G equation. No global deletion, no new elaborated edges. Cache key includes pin, actual group isomorphism, host inertia/Frobenius, x,b,y,J, cutoff q, TT and actual heights. P can be reused across height changes, W and selected point cannot. Backtrack to original score if guard fails.
 Native lean/lake absent locally. Published status.json read: 45577239749 b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc returncode 0 98.87s; 45576756833 7da354941e402b6f8b364ed03d8c5c82d27b7717 returncode 0 77.94s. Prior conditional half-strip axiom ledger propext/Classical.choice/Quot.sound only, not validation of this run. Prepared scalar Lean certificate (NOT compiled), with actual ChCore and existing engines:
 theorem RHLeftRamp (A n b y J : ℝ) (h1 : 0 ≤ A/n-A/y) (h2 : 0 ≤ A/n-b) :
     max (A/n-A/y) 0 - max (A/n-b) 0 + J = b+J-A/y := by
   rw [max_eq_left h1,max_eq_left h2]
   ring
 theorem RHRightRamp (A n b y : ℝ) (h1 : 0 ≤ A/n-A/y) (h2 : A/n-b ≤ 0) :
     max (A/n-A/y) 0 - max (A/n-b) 0 = A*(1/n-1/y) := by
   rw [max_eq_left h1,max_eq_right h2]
   ring
 #print axioms RHLeftRamp
 #print axioms RHRightRamp
 rh_scan Deduction.CharacterBalanceMoves.core limit 2000
 rh_prune Deduction.CharacterBalanceMoves.th_le as RHFactorThLeCandidate
 Use rh_reduce/rh_auto/rh_auto_frontier at actual selected combined-score caller, prove finite distributivity and guards, preserve unresolved geometry, original/reduced structural/type/value/axiom evidence. No new CI PASS.
 RESUME HERE: hand exact score factorization to integration/kernel as replacement for RUN28 selection kernel only; prioritize actual carrying-point producer and same-host rank/count/TopG instead of further control benchmarks. If y>=x+1 unavailable, retain original proof. HANDOFF TO integration, geometry, audit, kernel, editor. RH OPEN.
 Executed output (V8):
 {
  "checks": 714387,
  "negative_controls": 2,
  "primes": 4203,
  "report": [
    {
      "h": 128,
      "TT": 16,
      "T2": 128,
      "records": 1055,
      "active_boundary": 1,
      "direct_pairs": 16880,
      "shared_input_records": 1055,
      "direct_ms": [
        8,
        7,
        7,
        7,
        7
      ],
      "shared_ms": [
        3,
        2,
        3,
        2,
        2
      ],
      "direct_warm_ms": 7,
      "shared_warm_ms": 2,
      "normalized_interval_width": 3.0228866246968523e-7,
      "selected": 0
    },
    {
      "h": 512,
      "TT": 64,
      "T2": 500,
      "records": 1055,
      "active_boundary": 1,
      "direct_pairs": 67520,
      "shared_input_records": 1055,
      "direct_ms": [
        29,
        31,
        30,
        30,
        31
      ],
      "shared_ms": [
        10,
        10,
        11,
        11,
        13
      ],
      "direct_warm_ms": 31,
      "shared_warm_ms": 11,
      "normalized_interval_width": 3.0242165136105117e-7,
      "selected": 0
    },
    {
      "h": 2048,
      "TT": 256,
      "T2": 1079,
      "records": 1055,
      "active_boundary": 1,
      "direct_pairs": 270080,
      "shared_input_records": 1055,
      "direct_ms": [
        130,
        128,
        132,
        118,
        138
      ],
      "shared_ms": [
        49,
        46,
        45,
        47,
        43
      ],
      "direct_warm_ms": 132,
      "shared_warm_ms": 46,
      "normalized_interval_width": 3.0245431597049064e-7,
      "selected": 0
    }
  ],
  "peak_rss_bytes": null,
  "scope": "genuine unramified Frobenius records; non-native scales and masks; no Lean/geometry proof"
}

*/
function run29(){
const ck=(b,m)=>{if(!b)throw Error(m)},sum=a=>a.reduce((s,v)=>s+v,0n),max0=z=>z>0n?z:0n,ceil=(a,b)=>(a+b-1n)/b;
const S=1n<<48n,b=10000n,X2=2037n,a=X2*b/2n,q=X2/2n+1n,y=40000n,J=7n;
ck(2n*q>X2&&2n*q<=X2+2n&&y>=q,"scale");
function atanh(A,B){ck(A>=0n&&3n*A<=B,"log range");let p=A,d=B,l=0n;for(let i=0;i<24;i++){l+=2n*S*p/(d*BigInt(2*i+1));p*=A*A;d*=B*B}ck(3n*S<3n**49n,"tail");return [l,l+25n]}
const log2=atanh(1n,3n);
function logp(p){const z=BigInt(p),k=BigInt(z.toString(2).length-1),r=1n<<k,[l,u]=atanh(z-r,z+r);return [k*log2[0]+l,k*log2[1]+u]}
const sieve=new Uint8Array(Number(y)+1);sieve.fill(1,2);for(let p=2;p*p<=Number(y);p++)if(sieve[p])for(let j=p*p;j<=Number(y);j+=p)sieve[j]=0;
const primes=Array.from(sieve.keys()).filter(i=>sieve[i]),logs=new Map(primes.map(p=>[p,logp(p)]));
function num(n,A){return A*max0(y-n)-y*max0(A-b*n)+(n*b<=A?J*n*y:0n)}
function type(n){return 2n*n<=X2?0:n===q?2:1}
function weights(A){return [y*(b+J)-A,A,num(q,A)]}
function coeff(n){return type(n)===0?[1n,y]:type(n)===1?[y-n,n*y]:[1n,q*y]}
let checks=0;
for(const n of [1n,q-2n,q-1n,q,q+1n,y-1n,y,y+1n])for(const A of [a,a+1n,b*q-1n,b*q,b*q+1n,a+b]){
 const w=weights(A);if(n<=y){const [v,d]=coeff(n);ck(num(n,A)*d===w[type(n)]*v*n*y,"piecewise exact");}else ck(num(n,A)===0n,"tail");checks++;
}
ck(num(q,b*q)-num(q,b*q-1n)!==weights(b*q)[1]-weights(b*q-1n)[1],"boundary control");
ck(num(q,b*q)!==b*q*(y-q),"boundary cannot use right branch");
function fixture(h){const mod=4*h,lookup=new Map();let v=1;for(let i=0;i<h;i++){ck(!lookup.has(v)&&!lookup.has((mod-v)%mod),"coordinate");lookup.set(v,i);lookup.set((mod-v)%mod,i);v=v*5%mod;}ck(v===1&&lookup.size===2*h,"coordinate coverage");
 const TT=new Map(),T2=new Set(),rows=[];
 for(const p of primes){if([2,3,7].includes(p))continue;const k=lookup.get(p%mod);ck(k!==undefined,"frob");if(TT.size<h/8&&!TT.has(k))TT.set(k,a+BigInt(p*37)% (b+1n));if(p<=10000)T2.add(k);
 if(p%3!==2||![1,2,4].includes(p%7))continue;
 for(let n=p,i=1;n<=Number(y);n*=p,i++){if(i%2===0)continue;const N=BigInt(n),t=type(N),[v,d]=coeff(N),[l,u]=logs.get(p);rows.push({r:k*i%h,n:N,t,l,u,lo:2n*l*v/d,hi:ceil(2n*u*v,d)});}
 }
 ck(rows.some(r=>r.n===q),"active boundary");return {h,TT:[...TT].map(([t,A])=>({t,A,w:weights(A)})),T2:[...T2],rows};
}
function direct(f){const lo=Array(f.h).fill(0n),hi=lo.slice();for(const {t,w} of f.TT)for(const r of f.rows){const j=(t+r.r)%f.h;lo[j]+=w[r.t]*r.lo;hi[j]+=w[r.t]*r.hi;}return {lo,hi}}
function conv(A,B){const h=A.length,cap=sum(A)*sum(B);if(!cap)return Array(h).fill(0n);const w=(cap+1n).toString(16).length;const pack=v=>BigInt("0x"+v.slice().reverse().map(z=>z.toString(16).padStart(w,"0")).join(""));const s=(pack(A)*pack(B)).toString(16).padStart(w*2*h,"0"),out=Array(h).fill(0n);ck(s.length===w*2*h,"overflow");for(let i=0;i<2*h;i++){const e=s.length-i*w;out[i%h]+=BigInt("0x"+s.slice(e-w,e));}ck(sum(out)===cap,"mass");return out}
function shared(f){const H=f.h,mk=()=>Array.from({length:3},()=>Array(H).fill(0n)),L=mk(),U=mk(),W=mk();for(const r of f.rows){L[r.t][r.r]+=r.lo;U[r.t][r.r]+=r.hi;}for(const {t,w} of f.TT)for(let k=0;k<3;k++)W[k][t]=w[k];const lo=Array(H).fill(0n),hi=lo.slice();for(let k=0;k<3;k++){const l=conv(W[k],L[k]),u=conv(W[k],U[k]);for(let j=0;j<H;j++){lo[j]+=l[j];hi[j]+=u[j];}}return {lo,hi}}
function time(fn){let value,ms=[];const now=()=>typeof performance!=="undefined"?performance.now():Date.now();for(let i=0;i<5;i++){let start=now();value=fn();ms.push(now()-start)}return {value,ms,median:ms.slice(1).sort((a,b)=>a-b)[2]}}
const report=[];
for(const h of [128,512,2048]){
 const f=fixture(h),d=time(()=>direct(f)),s=time(()=>shared(f));ck(d.value.lo.every((z,i)=>z===s.value.lo[i]&&d.value.hi[i]===s.value.hi[i]),"convolution equality");checks+=2*h;
 for(const {A,w} of f.TT)for(const r of f.rows){const v=num(r.n,A),den=r.n*y;ck(v>=0n&&w[r.t]*r.lo*den<=2n*r.l*v&&w[r.t]*r.hi*den>=2n*r.u*v,"rational interval");checks+=2;}
 const L=sum(s.value.lo),U=sum(s.value.hi),E=U-L;ck(E>=0n,"mass gap");
 const card=BigInt(f.T2.length);let u=-1,upper=0n;for(let j=0;j<h;j++){upper=sum(f.T2.map(t=>s.value.hi[(t+j)%h]));if(BigInt(h)*upper<=card*U){u=j;break}}
 ck(u>=0&&BigInt(h)*upper<=card*(L+E),"mean interval");checks++;
 report.push({h,TT:f.TT.length,T2:f.T2.length,records:f.rows.length,active_boundary:f.rows.filter(r=>r.n===q).length,direct_pairs:f.TT.length*f.rows.length,shared_input_records:f.rows.length,direct_ms:d.ms,shared_ms:s.ms,direct_warm_ms:d.median,shared_warm_ms:s.median,normalized_interval_width:Number(2n*E)/Number(S*BigInt(f.TT.length)*b),selected:u});
}
return {checks,negative_controls:2,primes:primes.length,report,peak_rss_bytes:typeof process!=="undefined"?process.resourceUsage().maxRSS*1024:null,scope:"genuine unramified Frobenius records; non-native scales and masks; no Lean/geometry proof"};
}
if (typeof console !== 'undefined') console.log(JSON.stringify(run29(),null,2));

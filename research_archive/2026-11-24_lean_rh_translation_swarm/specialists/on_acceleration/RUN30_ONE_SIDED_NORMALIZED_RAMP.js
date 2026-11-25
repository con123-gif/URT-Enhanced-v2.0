/*
RUN30 — one-sided native heights remove the prime-shift norm altogether
25 Nov 2026; lane 14; SOURCE-MATCHED HUMAN REDUCTION, exact finite coefficient certificate executed; RH OPEN.
Pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005. Read current mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc, AGENTS, SWARM, HANDOFF, EXPANSION, manuscript, latest geometry 9e7a5f49, editor 5ea960de, audit db618414, prime 9fab6791, Landau ebe13020, math f7f5779b and prior lane RUN29. This follows up the audit's necessary mean-bias term using an actual stronger native premise, NOT an assumed zero mean.

Proof block: At principal modulus one write F(y)=G(y)+J(y)=sum_n a_n (y/n-1)_+ - y log y + L y, with a_n=Lambda(n) times the signed four-character primitive sum. For prime powers primitive values are inertia-coset averages (primitive_value_pow); the four quotient character sum with signs 1,1,-1,-1 is 4 times the fraction of the projected coset at (1,0) in C2 x C2. Hence a_n>=0 including ramified terms. Divide by y>0:
 F(y)/y + log y = L + sum_n a_n max(1/n-1/y,0).
Each term increases with y. For 0<x<=y<=x+w, w>=0,
 F(y)/y >= F(x)/x - log(y/x) >= (F(x)-w)/x.
Thus if T=|TT|>0 and the original geometry/Fourier inequality gives sum_t F(y_t)<=T B, B>=0,
 F(x)<= x*T*B/(sum_t y_t)+w <= B+w.
Use B=2Err/(Qd)+4/(xd)>=0 and w=1; tighter w=x/(k*x^(Scale.A/2)) if transported. Then G(x)<=B+w-J(x), and native SigALe bounds -J. No derivative or ell bound needed for this height shift; still required wherever other consumers use them. No mean-zero assumption; the audit's negative-height counterexample does not apply to native one-sided heights. This does not prove the geometry, host, auxiliary character bounds or RH.
Source anchors: src/Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean blob 7828c8b1060818fe158e23f87f1ad9e2efcf79eb, Mod.av_facts derives sc.a<=M.av n from aT_win; linkGLOBAL_of defines hab: sc.a=x*sc.b, and winO explicitly proves sc.x<=aT/sc.b before discarding sign. Transport this stronger premise through CoreAtH; not implied by generic SizesA alone. src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean blob 878f5077bc382426c7da988e5a375b85deeaa7de, core consumes hY and sum_Th. src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreGm.lean blob 3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d consumes ch_core, ch_top, gmA_eq and sigA_le. src/Formalism/SizeWindowBrackets/ChainSlopeWindows/StronglyIrreducible.lean blob 94a385f59f3781ae6b1ab4beddc73850708a2bc6 primitive_value_pow/orthogonality_ramified. src/Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean blob 81c8dfd66d910d083d5bc88c664c7917fdbdfe96 ramp/G/Gchi. Four-mode identification as in live manuscript and source-anchored peer results; caller bridge still uncompiled.
Exact acceleration for aggregate hY evaluation: y_t in [x,x+1], q=floor(x)+1, S=sum y_t, Hq=sum max(y_t-q,0). For each positive integer n, sum_t (y_t/n-1)_+ = S/n-T if n<=x, Hq/q if n=q, zero otherwise. At q=x+1 equality contributes zero; n>q cannot contribute. One pass over prime-power coefficients and heights, O(P+T) arithmetic operations vs O(P*T) direct, no claim about prime generation/bit complexity. Fixed linear term needs S; nonlinear centering sum y_t log y_t remains O(T). Cache key pin, actual host, projection/inertia, x,w,TT, heights and boundary hinge. Backtrack to original if sign guard fails. Benchmark genuine primitive quadratic values Q(sqrt(-3),sqrt(-7)), including ramified rows and exact zeros, controlled rational heights not actual native family. Coefficient comparison exact integer numerators, common fixed log(p)/n factors omitted from both paths; timings in-process first/warm excluding sieve/fixture, RSS unavailable. First run failed on incorrectly requiring positive p=7 coefficient; corrected to require the actual zero, reran. Three negative controls. No URT ablation for deterministic factorization; prior controlled comparisons gave no advantage.
Original role graph RUN25 preserved; source-visible proposed overlay core_gm -> core(hY from one-sided normalized ramp) -> original geometry/Fourier; sigA_le retained; new edge from linkGLOBAL_of's stronger height premise. Preserve original structural/type/value/axiom evidence; no globally deleted edges. Same-host conditions and unresolved suppliers retained.
Prepared Lean scalar certificate (not compiled, import ChCore and existing engine modules):
theorem rh30_normalized_hinge (n x y : ℝ) (hn : 0 < n) (hx : 0 < x) (hxy : x ≤ y) :
    max (1/n-1/x) 0 ≤ max (1/n-1/y) 0 := by
  have hy : 0 < y := hx.trans_le hxy
  have h := (div_le_div_iff₀ hy hx).2 (show (1:ℝ)*x ≤ 1*y by simpa using hxy)
  exact max_le_max (by linarith) (le_refl _)
theorem rh30_average_budget (x S T F w B : ℝ) (hx : 0 < x) (hB : 0 ≤ B)
    (hS : x*T ≤ S) (hT : 0 < T) (h : S*(F-w) ≤ x*T*B) : F ≤ B+w := by
  by_contra hneg
  have hs : 0 < S := (mul_pos hx hT).trans_le hS
  have h1 := mul_lt_mul_of_pos_left (show B < F-w by linarith) hs
  have h2 := mul_le_mul_of_nonneg_right hS hB
  nlinarith
theorem rh30_average_replay (x S T F w B : ℝ) (hx : 0 < x) (hB : 0 ≤ B)
    (hS : x*T ≤ S) (hT : 0 < T) (h : S*(F-w) ≤ x*T*B) : F ≤ B+w := by
  first | (rh_reduce 2 using [rh30_average_budget]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 2; done)
        | exact rh30_average_budget x S T F w B hx hB hS hT h
rh_scan Deduction.CharacterBalanceMoves.core limit 2000
rh_prune Deduction.CharacterBalanceMoves.core as RH30CoreCandidate
#print axioms rh30_normalized_hinge
#print axioms rh30_average_budget
No local Lean execution; read actual older status.json outputs: 45577239749 returncode 0 98.87 s conditional strip root axioms propext Classical.choice Quot.sound; 45576756833 returncode 0 77.94 s rh_of_right 2000 visited, 324 pending, no binder deletion. Neither validates this new certificate. No new CI pass.
RESUME HERE: transport the one-sided height sign at linkGLOBAL_of -> CoreAtH -> core_gm and replay hY via normalized four-mode ramp; then focus on unresolved same-host geometric and arithmetic suppliers, not further controlled arithmetic benchmarks. HANDOFF TO integration/editor, audit, prime, kernel.
Executed output:
{
  "checks": 5772136,
  "negative_controls": 3,
  "primes": 4203,
  "prime_power_rows": 4282,
  "boundary": 39971,
  "ramified_rows": 14,
  "reports": [
    {
      "T": 64,
      "rows": 4282,
      "direct_pairs": 274048,
      "reduced_terms": 4346,
      "direct_ms": 46,
      "reduced_ms": 1,
      "direct_warm_ms": 46,
      "reduced_warm_ms": 1,
      "direct_all_ms": [
        46,
        45,
        56,
        46,
        45,
        46,
        48
      ],
      "reduced_all_ms": [
        1,
        0,
        1,
        0,
        1,
        0,
        1
      ]
    },
    {
      "T": 256,
      "rows": 4282,
      "direct_pairs": 1096192,
      "reduced_terms": 4538,
      "direct_ms": 195,
      "reduced_ms": 1,
      "direct_warm_ms": 185,
      "reduced_warm_ms": 1,
      "direct_all_ms": [
        195,
        179,
        186,
        185,
        186,
        184,
        184
      ],
      "reduced_all_ms": [
        1,
        1,
        0,
        1,
        0,
        1,
        0
      ]
    },
    {
      "T": 1024,
      "rows": 4282,
      "direct_pairs": 4384768,
      "reduced_terms": 5306,
      "direct_ms": 739,
      "reduced_ms": 1,
      "direct_warm_ms": 712,
      "reduced_warm_ms": 1,
      "direct_all_ms": [
        739,
        712,
        700,
        698,
        729,
        815,
        696
      ],
      "reduced_all_ms": [
        1,
        1,
        0,
        1,
        1,
        1,
        0
      ]
    }
  ],
  "peak_rss_bytes": null,
  "scope": "exact rational ramp numerators, genuine primes and quadratic primitive values, controlled heights; not native geometry"
}
*/
function run30(){
 const ck=(b,m)=>{if(!b)throw Error(m)},N=40000,B=1024,sieve=new Uint8Array(N+1);sieve.fill(1,2);
 for(let p=2;p*p<=N;p++)if(sieve[p])for(let j=p*p;j<=N;j+=p)sieve[j]=0;
 const primes=Array.from(sieve.keys()).filter(p=>sieve[p]),leg=(p,l)=>p%l===0?0:(l===3?[1]:[1,2,4]).includes(p%l)?1:-1;
 const rows=[];for(const p of primes)for(let n=p,i=1;n<=N;n*=p,i++){const a=leg(p,3)**i,c=leg(p,7)**i;rows.push({n,p,i,c:(1-a)*(1+c)})}
 const q=rows.filter(r=>r.i===1&&r.c===4&&r.n<N).reduce((a,r)=>Math.max(a,r.n),0),X=q*B-B/2,max0=x=>Math.max(x,0),R=rows.filter(r=>r.n<=q);
 ck(q>0&&R.some(r=>r.n===q&&r.c>0),"active prime threshold");
 let checks=0;for(const r of R){ck(r.c>=0&&r.c<=4,"positive projection");checks++}
 const now=()=>typeof performance!=="undefined"?performance.now():Date.now();
 function timed(fn){const ms=[];let v;for(let i=0;i<7;i++){const s=now();v=fn();ms.push(now()-s)}return {v,first_ms:ms[0],warm_ms:ms.slice(1).sort((a,b)=>a-b)[3],all_ms:ms}}
 const reports=[];
 for(const T of [64,256,1024]){
 const A=Array.from({length:T},(_,j)=>X+(primes[j]*37)%(B+1));A[0]=X;A[1]=q*B;A[2]=X+B;
 const direct=()=>R.map(r=>{let z=0;for(const a of A)z+=max0(a-B*r.n);return r.c*z});
 const reduced=()=>{let S=0,J=0;for(const a of A){ck(X<=a&&a<=X+B,"guard");S+=a;J+=max0(a-B*q)}return R.map(r=>r.c*(r.n<q?S-T*B*r.n:r.n===q?J:0))};
 const d=timed(direct),s=timed(reduced);
 ck(d.v.length===s.v.length&&d.v.every((v,i)=>v===s.v[i]&&Number.isSafeInteger(v)),"coefficient equality");checks+=R.length;
 for(const r of R)for(const a of A){const lhs=X*max0(a-B*r.n),rhs=a*max0(X-B*r.n);ck(Number.isSafeInteger(lhs)&&Number.isSafeInteger(rhs)&&lhs>=rhs,"normalized monotonicity");checks++}
 reports.push({T,rows:R.length,direct_pairs:T*R.length,reduced_terms:T+R.length,direct_ms:d.first_ms,reduced_ms:s.first_ms,direct_warm_ms:d.warm_ms,reduced_warm_ms:s.warm_ms,direct_all_ms:d.all_ms,reduced_all_ms:s.all_ms})
 }
 ck(R.some(r=>r.p===3&&r.c>0)&&R.some(r=>r.p===7&&r.c===0),"ramified rows included, including exact zero");
 ck(X*max0(X-B-B*2)<(X-B)*max0(X-B*2),"negative height control");
 ck(-X*max0(X+B-B*2)<-(X+B)*max0(X-B*2),"negative coefficient control");
 ck(R.find(r=>r.n===q).c*max0(X+B-B*q)>0,"boundary omission");
 return {checks,negative_controls:3,primes:primes.length,prime_power_rows:R.length,boundary:q,ramified_rows:R.filter(r=>r.p===3||r.p===7).length,reports,peak_rss_bytes:typeof process!=="undefined"?process.resourceUsage().maxRSS*1024:null,scope:"exact rational ramp numerators, genuine primes and quadratic primitive values, controlled heights; not native geometry"}
}
if(typeof console!== 'undefined') console.log(JSON.stringify(run30(),null,2));

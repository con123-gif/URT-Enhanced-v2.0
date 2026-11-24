# RUN5 — actual generalized arithmetic host and real-balance adapter (2026-11-24)

RESULT: SOURCE-MATCHED conditional reconstruction; actual V8 finite checks and source anchors executed. No kernel replay, proof completion, or URT speed advantage. Prior prime runs 1–4 and peer size, Landau, character, integration, editor, acceleration, theta, Galois, literature and positivity handoffs checked; preflight AGENTS/swarm/queue/expansion/state/continuity/runner/CI read. No physics changes. Physical orchestrator #364 PASS is unrelated. Blueprint not independently re-read this run.

## Source revision
PIN 40e56bab026552e089d7afcfeff08d2defb9c005. Upstream HEAD independently observed cb4dc6e23a6187db392c96664295415c55b6b01e (10:44:28 UTC), changed since run4. At HEAD hostFactsS.lean blob 46405e93677b4a86aaea228896b4ad99106dd74c (190 lines); LipschitzWeightAndMinimum.lean blob 7e4b01f79f02ae2b5071470c00c44e48ae376431 (1078 lines). ChBalance.lean returned 404 at HEAD; no assertion of theorem deletion or equivalence. Keep PIN, not migrated. Every path below relative to https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/.

## 1. Actual host producer, not merely an assumed small prime set
Source PrimitiveCosets/hostFactsS.lean:7–15 inPhi_of_jac; 17–31 jac_of_dvd; 33–38 d_dvd_ordCompl; 40–42 toE_iod'; 44–125 hostFactsS_pf; 127–136 hostFactsS. RecH:10–23 defines toE, recH and arith, reversing the two sign coordinates; first additive bit is the SECOND multiplicative sign, not first. HostFacts:15–28 quadratic reciprocity and congruence; 34–118 prime, congruence, coprimality and support facts. Fix ANY Frame phi and HostAx H. Let Q=H.QS, q=H.q, d=H.d, M=Qq, C=M d (source condN, distinct from truncation N in ASK); S=primeFactors(M). Let r=toE composed with H.art on the units of Z/C. Define D=arith(H.raw) via cftData q d r. The theorem concludes HostFactsS D (insert q H.small), which is S. Premises include all fields of HostAx; this proof does NOT construct HostAx.

H gives q,d prime, q=3 mod 8, d=7 mod 16, Q>0, 2|Q, gcd(Q,qd)=1, and (-d/p)=+1 for odd p|Q and (-d/q)=+1. Hence q,d distinct, gcd(M,d)=1 and C>0. The source identifies the second sign of art(u) with Jacobi(u,d) (H.der.art_ch); d prime, d=3 mod 4. Thus if u has value k modulo d and (k/d)=+1 then r(u) is in Phi. For each prime p|M: if p=2, (2/d)=+1 by d=7 mod 8; otherwise quadratic reciprocity with d=3 mod 4 yields (p/d)=(-d/p)=+1. This includes q. Since p != d, d divides the p-free part ordCompl[p] C. All congruence reductions are thus valid.

Eight fields of HostFactsS (SplitInertia:14–22), discharged separately:
1 d_prime from H; 2 two_mem from 2|Q and M!=0; 3 q1_mem from q|M; 4 d_not_mem from gcd(M,d)=1.
5 unram: for prime p outside S and p!=d, p does not divide C. The source unramified_spec identifies local unit subgroup as trivial. mem_inertia_iff represents any inertia element as image of a local unit, hence zero; conversely zero belongs to any subgroup (hostFactsS_pf:58–70).
6 split_inertia: for EVERY p in S and EVERY x in inertia(p), choose u by mem_inertia_iff. Local units satisfy u=1 mod ordCompl[p] C; reduce modulo d, get (u/d)=1, so x in Phi (71–76). S contains only primes here; the predicate itself quantifies all p in S.
7 split_frob: frobUnit_modEq says chosen Frobenius unit is p mod ordCompl[p] C; reduce modulo d and apply jac_of_dvd; hence Frob_p in Phi (77–82).
8 inertia_d: ordCompl[d] C=M because d occurs exactly once and coprime M. For u local at d, u=1 mod M. H.art_d gives art(u)=1 or phi.iod, whose toE image is respectively 0 or sgc0. Conversely identity realizes zero. CRT supplies a UNIT u=1 mod M and u=-1 mod d (exists_unit_crt with coprime M,d); it lies in local units at d. Since (-1/d)=-1, the identity Artin branch contradicts H.der.art_ch, so art(u)=phi.iod and image is sgc0. Both elements are realized, not just an inclusion (83–125). No condition on Frob_d needed.
Finally primeFactors(M)=insert q primeFactors(Q)=insert q H.small (127–136). The prime powers of Q, including the 2-power tower, are retained in conductor; S is only support, not conductor.

This is the actual generalized theorem used in main branch, NOT narrow HostFacts (FirstPrimeNeSecondPrime:47–59). Narrow facts imply HostFactsS for S={2,q} (given its guards), but not conversely: another p in S can have nontrivial inertia inside Phi. Example abstract D with q=11,d=7,S={2,11,29}, inertia29={0,(0,1,0)}. This is an abstract counterexample to substituting narrow for generalized fields, not a constructed native HostAx.

## 2. Exact arithmetic vs real Fourier adapter
D5.PartnersToFactorsAt:33–69 defines CycHost, GC, vonMangoldtClassSum, askTop, ledTop, balTop, Balance. CR.host in LipschitzWeightAndMinimum:122–159 sets cv=primVal D, ell unchanged, and the three sign characters unchanged; cv_zero follows because each inertia subgroup contains zero and its mean of constant 1 is 1. Thus GC(host D ell,psi,y)=GPsi(D,ell,psi,y) definitionally for ALL real y; no host hypotheses needed. CR.De_re:161–168 replaces filter not InPhi(g+topPl(t)) by not InPhi(g), because topPl has zero first coordinate. For characters of finite additive group, psi(-g)=conj(psi(g)); this is not psi(g) in general. Partner arguments are identical and real part commutes with sums, hence Re De=balTop(host D ell,a,t,w) for arbitrary real a,w (the identity of totalized expressions, not an estimate). MAIN real part equals ledTop directly; a real scalar multiplies ell(chC), so only its real part contributes.

Additional explicit human consequence: under HostFactsS D S, a>0, w positive on Phi and N>=a/w(rho) for all rho in Phi, ASK=askTop(host D ell,a,t,w). Proof: for each g outside Phi, W=w(partner_t(g))>0, and 1<=n<=floor_nat(a/W) iff 1<=n<=N and n<=a/W. Extend by zero: (a/n-W) times that indicator equals max(a/n-W,0). Endpoint equality contributes zero. If a/W<1 the interval is empty. Finite sums commute, and factor 2/|G|=1/|Phi|. Replace psi(-g) by conjugate psi(g); CharacterBalance.askExp:122–196 now identifies the resulting complex sum with real ASK, so taking real parts gives equality. This derived adapter is NOT a separate named Lean theorem. All arbitrary weights outside Phi are irrelevant to these three expressions (partners lie in Phi); positivity outside Phi is required by the separately stated D5.Balance, but can be satisfied by replacing such weights with 1 without changing these expressions. D5.character_sum_balance (Balance:218–296) is independent generic real identity; do not claim it supplies HostFactsS or that it is directly invoked in ch_balance.

## 3. Verified source call graph and geometric interface
ChBalance:18–196 handles generalized S with split primes contributing zero; d contributes one (inertia cardinality 2), outside S and d contributes 2 on the single admissible unramified coset. askExp plus sum_cut, inner_eq and colour_sum gives theorem Deduction.ch_balance:200–260. This uses HostFactsS, a>0, w>0 on Phi and uniform N cutoff. It does not call narrow colour_balance. The latter has actual consumers in LipschitzWeightAndMinimum:656–664 (proposition_at_point and proposition_final), with a separate zeta route. No claim of exhaustive callers.

ChCore:283–338 CharacterBalanceMoves.core uses generalized hD; x>=3,b>0 imply a(t)>0 on TT by |a(t)/b-x|<=1. SizesA supplies positivity, thick/thin windows and cutoff for every u0 in A0, j and t in TT. th_le gives Re Th<=Re De+per-node cost; at 309–311 ch_balance is explicitly applied and real part taken, giving Re De=ASK-Re MAIN. CostWindows bounds per-node cost by 2b/x; summing over t,j and applying hTop gives upper Err+2|TT|mb/x. Average over A0 and use sum_Th with T2 subset A0. Divide by positive |A0|; multiply lower hypothesis hY by nonnegative mb delta2(T2)/2. Hence |TT|mb(delta2/2)Y<=Err+2|TT|mb/x. No division by m or |TT| here; degenerate empty sets are retained. ch_core:343–442 applies size inequality and returns GmA bound (run2/peer math already explain exponent, not repeated).

Geometry joins at ChTop:11–35 and 37–72. IdentU (SplitInertia:67–72) comprises FIVE exact premises: aT transported via eT:Top≃TT; w transported via tr:U0→H and eP:Fin f≃PhiSet; gam=Euler constant; LpL=Re ell(chC); Dd.ASK(u)=sum ASK of the SAME host/cutoff/nodes. eP also ensures f=|Phi|, eT ensures same sums. Thus Dd.Main(u)=sum Re MAIN and gapA(tr u)=Dd.ASK(u)-Dd.Main(u). SizeData₂ (11 premises), ErrWindows, BNBoundsU and LargeX then bound this gap. IdentU is a premise not deduced by rewriting arbitrary ASK. CoreAtH:29–41 requires those same fields and coverage of A0; CoreGm:55–60 passes hostFactsS phi H to ch_core and for EVERY u in A0 chooses v with tr(v)=u via hcov, using ch_top at v. This establishes pointwise geometric gap bound where the arithmetic argument actually needs it. No global HostAx or CoreAtH existence asserted.

## 4. Executed certificate
13 pinned modules and 65 exact declaration/call anchors checked with GitHub-reported blob IDs. V8 execution below: {"reciprocity":175,"crt":75,"localUnit":6794,"adapter":10016,"phaseNegative":1,"splitNegative":1}. Legendre symbol evaluated by exhaustive residue search, CRT constructive by residue scan, local unit checks on finite prime/conductor fixtures; finite adapter uses exact integer Gaussian roots and scaled rational weights, not native HostAx. All assertions succeeded. The negative example is an abstract HostFactsS witness against the narrow assumption, not a native field. Tests do not prove general reciprocity, source elaboration or global geometry. Replay in Node; source-anchor mode in pinned checkout is separately specified by manifest below.

~~~js
function certificate(){
 const c={reciprocity:0,crt:0,localUnit:0,adapter:0,phaseNegative:0,splitNegative:0};
 const check=(v,m)=>{if(!v)throw Error(m)};
 const gcd=(a,b)=>b?gcd(b,a%b):a,mod=(a,n)=>(a%n+n)%n;
 const prime=n=>n>1&&Array.from({length:Math.floor(Math.sqrt(n))-1},(_,i)=>i+2).every(p=>n%p);
 const primes=Array.from({length:150},(_,i)=>i+2).filter(prime);
 const leg=(a,p)=>{a=mod(a,p);if(!a)return 0;for(let j=1;j<p;j++)if(j*j%p===a)return 1;return -1};
 for(const d of primes.filter(p=>p%16===7)){
   check(leg(2,d)===1&&leg(-1,d)===-1,"d residue");
   for(const p of primes.filter(p=>p!==2)){check(leg(-d,p)===leg(p,d),"reciprocity");c.reciprocity++;}
   for(const q of primes.filter(p=>p%8===3&&leg(p,d)===1)){
     for(const r of primes.filter(p=>p!==2&&p!==q&&leg(p,d)===1).slice(0,3)){
       const M=16*q*r,N=M*d;check(gcd(M,d)===1,"coprime");
       const u=Array.from({length:d},(_,k)=>1+k*M).find(v=>v%d===d-1);
       check(u!==undefined&&gcd(u,N)===1&&leg(u,d)===-1,"CRT");c.crt++;
       for(const p of [2,q,r]){
         let comp=N;while(comp%p===0)comp/=p;
         check(comp%d===0,"d divides complement");
         for(let k=0;k<N/comp;k++){const v=1+k*comp;if(gcd(v,N)===1){check(leg(v,d)===1,"local units");c.localUnit++;}}
       }
     }
   }
 }
 // G=C2 x C2 x C4, integer index (first bit, second bit, last coordinate).
 const es=Array.from({length:16},(_,i)=>[i>>3,(i>>2)&1,i&3]);
 const id=x=>8*mod(x[0],2)+4*mod(x[1],2)+mod(x[2],4);
 const add=(a,b)=>id(es[a].map((x,i)=>x+es[b][i])), times=(a,k)=>id(es[a].map(x=>x*k));
 const B=[8,9,10,11,12,13,14,15],P=[0,1,2,3,4,5,6,7],roots=[[1,0],[0,1],[-1,0],[0,-1]];
 const V=(u,g)=>roots[mod(es[u][0]*es[g][0]*2+es[u][1]*es[g][1]*2+es[u][2]*es[g][2],4)];
 const plus=([a,b],[c,d])=>[a+c,b+d],mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c],scale=([a,b],k)=>[a*k,b*k];
 const S=[2,11,29],d=7, ps=[2,3,5,7,11,13,17,19,23,29,31];
 for(let t=0;t<4;t++)for(let z=0;z<8;z++)for(let N=1;N<=32;N++){
   const a=2*N-1, w=g=>P.includes(g)?1+((g+z)%4):(-1-z), partner=g=>add(add(12,g),t);
   for(const p of ps){
     const I=p===d?[0,8]:p===29?[0,4]:[0],F=S.includes(p)?(p+z)%8:(p+3*z)%16;
     for(let k=1,n=p;k<=N&&n<=N;k++,n*=p){
       let lhs=0,rhs=[0,0],clipped=[0,0];const h=times(F,k);
       for(const g of B){
         const W=w(partner(g));check(W>0,"partner");
         const raw=a-2*n*W,clip=Math.max(raw,0);
         // Scale K by 16; denominator M=8 then cleared by factor 8.
         const cv=u=>scale(I.reduce((r,v)=>plus(r,V(u,add(h,v))),[0,0]),16/I.length);
         const kernel=es.reduce((r,_,u)=>plus(r,mul(V(u,times(g,-1)),cv(u))),[0,0]);
         rhs=plus(rhs,scale(kernel,2*n*W<=a?raw:0));clipped=plus(clipped,scale(kernel,clip));
         if(p===d){if(I.some(v=>add(h,v)===g))lhs+=clip;}
         else if(!S.includes(p)&&F>=8&&h===g)lhs+=2*clip;
       }
       check(rhs[0]===128*lhs&&rhs[1]===0&&rhs[0]===clipped[0]&&rhs[1]===clipped[1],"adapter");c.adapter++;
     }
   }
 }
 check(V(1,1)[1]===1&&V(1,times(1,-1))[1]===-1,"phase sign");c.phaseNegative++;
 // Extra split p=29 has nontrivial inertia within Phi: allowed by HostFactsS, not narrow HostFacts.
 check(S.includes(29)&&29!==2&&29!==11&&29!==7&&[0,4].every(x=>P.includes(x)),"strict distinction");c.splitNegative++;
 return c;
}
console.log(certificate());
~~~

Pinned manifest (path, git blob SHA, exact anchor strings; verify with git hash-object and literal text search):
~~~json
[
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/hostFactsS.lean",
    "440a45819936cf0cb7fb8e81156e94b25288459c",
    [
      "private lemma inPhi_of_jac",
      "private lemma jac_of_dvd",
      "private lemma d_dvd_ordCompl",
      "private theorem hostFactsS_pf",
      "exists_unit_crt",
      "H.art_d u hloc",
      "theorem UpperTheory.Comparison₂.hostFactsS",
      "insert H.q H.small"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/RecH.lean",
    "b2712cc402765cea3fd406285e05e32a7ce64ec7",
    [
      "def toE",
      "sgn2 g.1.2",
      "sgn2 g.1.1",
      "def recH",
      "def arith"
    ]
  ],
  [
    "src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/HostFacts.lean",
    "b6a9456ebd641dfd958f66039e3dddbd7b6a02e9",
    [
      "theorem jacobi_neg_recip",
      "theorem d_mod_sixteen",
      "theorem coprime_QSq_d",
      "theorem d_not_dvd_QSq",
      "theorem dvd_QSq_iff",
      "theorem two_dvd_QS"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean",
    "b5662cda1f3523fc53b547ee582a46bd3cd826d4",
    [
      "structure HostFactsS",
      "split_inertia",
      "split_frob",
      "inertia_d",
      "def SizesA",
      "def IdentU",
      "def gapA"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChBalance.lean",
    "37648715bcf507e086374e8cc476ee746fd274f4",
    [
      "lemma askExp",
      "lemma lsplit",
      "lemma ld",
      "theorem ch_balance",
      "colour_sum ψ"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean",
    "878f5077bc382426c7da988e5a375b85deeaa7de",
    [
      "lemma core (A0",
      "congrArg Complex.re (ch_balance",
      "rw [Complex.sub_re, Complex.ofReal_re] at k2",
      "rw [CR.De_re, hTh]",
      "theorem ch_core"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChTop.lean",
    "ce06a34a9e0b1b332e10d3b7efb04a06e9ab77f5",
    [
      "lemma ch_top_main_eq",
      "theorem ch_top",
      "h1 : IdentU",
      "have hgap"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreGm.lean",
    "3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d",
    [
      "(hostFactsS φ H)",
      "obtain ⟨v, rfl⟩ := hcov u hu",
      "Deduction.ch_top Dd tr"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/FirstPrimeNeSecondPrime.lean",
    "18deb7cb85d6f650a69f01fda6e0c789b9f04d89",
    [
      "structure HostFacts",
      "def ASK",
      "def MAIN",
      "def De",
      "def AskMainBalance"
    ]
  ],
  [
    "src/Formalism/SizeWindowBrackets/ChainSlopeWindows/LipschitzWeightAndMinimum.lean",
    "4012be2d32b5475bb420d1cd8da4aa1ebb4c6e6b",
    [
      "def host (D",
      "lemma GC_host",
      "lemma De_re",
      "AddChar.map_neg_eq_conj",
      "theorem proposition_at_point",
      "theorem proposition_final"
    ]
  ],
  [
    "src/Formalism/ThickAverageLoss/PartnersToFactorsAt.lean",
    "d3c1d8a4d1dcd4b282b14960b5a7b6525115e0af",
    [
      "structure CycHost",
      "def GC",
      "def vonMangoldtClassSum",
      "def askTop",
      "def ledTop",
      "def balTop",
      "def Balance"
    ]
  ],
  [
    "src/Formalism/ThickAverageLoss/ThickAverageProofs/Balance.lean",
    "c3acda6e44e220280f69723ae7b876912ac6b3c9",
    [
      "lemma inPhi_add_topPl",
      "theorem character_sum_balance"
    ]
  ],
  [
    "src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreAtH.lean",
    "0ba3621036f19146e7e67fa9c0e8a1c38661a097",
    [
      "def CoreAtH",
      "IdentU Dd tr"
    ]
  ]
]
~~~

Independent audit requested: confirm coordinate reversal toE, order-complement divisibility, exact CRT unit sign, HostFactsS vs HostFacts and actual ch_balance invocation; verify derived askTop equality without incorrectly using D5.Balance's stronger positivity. Validate IdentU coverage independently. No changed premises. No Lean replay.

RESUME HERE: trace actual producer of IdentU's fifth ASK equality from CoreAtH constructors. Find pinned source theorem that identifies geometric Dd.ASK with arithmetic ASK for same t, weights and N; expand arithmetic prime-class counting, including extra split primes and exceptional d, rather than repeat conditional ch_top or size algebra. Ask geometry/math lanes for existing proof of IdentU before duplicating. HANDOFF TO: formal audit, integration, proof editor, math, character boxes, geometry, Landau. Project OPEN.

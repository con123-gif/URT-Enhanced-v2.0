/* RH AUDIT 2026-11-25 — ch_balance final cancellation, SOURCE-MATCHED / PARTIAL.
One contribution: exact human proof of MAIN cancellation and imaginary-part consequence, with independently executable finite arithmetic controls.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005. Source paths/blob IDs below. Latest upstream 4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061; comparison {"balance":"NOT_FOUND: Error code: NOT_FOUND; Error: GitHub API error 404: {\"message\":\"Not Found\",\"documentation_url\":\"https://docs.github.com/rest/repos/contents#get-repos","strong":"b5bf0125c1a73d8adecb2bf9d18b7961eedaaecd","data":"d3b68b896d305c56a951d35a44637dc2a862e0c0","host":"217fcd95d4192ef281114316f00da937abf15910","zeta":"04fc51afb2067e67d157e70df7fe571b098f3b7b","split":"cb31619e10acc3effdeec94e10c89abba559f78d"}. No cross-revision equivalence assumed.
Preflight: SWARM_PROTOCOL first, AGENTS, state (leading current section), actual runner log/protocol, continuity, HANDOFF_QUEUE; latest Cathedral CI #409 PASS (45525152725), not RH kernel replay. Last peer checkpoints audit 1fedf6d, structure 167b33e, math d866eb3, dependencies 32d64e9, integration 4f08b85, editor 742bc96. Root log/protocol 404 corrected to runner paths; external blueprint not reread, no assumptions imported. Local command -v lean/lake/elan returned no executables; git ls-remote failed DNS. No independent Lean replay, #print axioms or global sorry census. Source matching does not establish kernel reachability.

Exact theorem (ChBalance 200–260): for any finite decidable additive commutative group H, D:ArithData H, S0 finite naturals and HostFactsS D S0, arbitrary complex-valued ell on AddChar(G,C), real a>0, t:H, real weights w:G->R positive on Phi, N:natural with a/w(rho)<=N for every rho in Phi, ASK-MAIN=De in C. All premises retained, including host split/inertia requirements (SplitInertia 14–22); no positivity or reality of ell assumed. G=(Z/2)^2 x H, Phi=ker(first coordinate), S=G minus Phi, f=|Phi|=2|H|>0. Distinguish S from host prime set S0. Write chi0=trivial additive character (Lean 0), c=chC with c(g)=+1 on Phi, -1 on S.
1. partner P_t(g)=cconj+g+topPl(t) has first coordinate 1+g1. Inverse rho-topPl(t)-cconj maps Phi to S. Hence |S|=f and sum_S F(P_t(g))=sum_Phi F(rho) for any additive commutative monoid F (StronglyIrreducible 48–75, 395–397; PartnersToFactorsAt 13–29; FirstPrimeNeSecondPrime 19–34). Do not drop dependence on t in the actual weighted residual.
2. Let W=w(P_t(g))>0, y=a/W>0, M=floor(y)<=N. For n>=1, max(a/n-W,0) = a/n-W for n<=M and 0 otherwise. Equality at n=y allowed (zero); M=0 allowed. This is sum_cut 619–653, with arbitrary complex arithmetic coefficient Lambda(n)primVal(D,psi,n). No real-part projection. term_real 612–617: a/n-W=W(y/n-1).
3. From StatementOC 10–13, Sz(y)=sum_{1<=n<=floor(y)} Lambda(n)(y/n-1), Gz=Sz-y log y+(1+gamma)y. FirstPrimeNeSecondPrime 68–71 defines GPsi as Gz for psi=0, else its complex weighted arithmetic sum plus y ell(psi); primitive_value_trivial (StronglyIrreducible 216–224) uses nonempty inertia subgroups and trivial character. Thus the cut sum equals W GPsi(psi,y)+C_psi(W) where C_0(W)=a log a-a log W-(1+gamma)a, C_psi(W)=-a ell(psi) for psi!=0. This is inner_eq 655–688. The log split is valid on positive a,W. Source uses Real.log_div with nonzero arguments, so do NOT claim a>0 is a logically necessary hypothesis in Lean's totalized reals; no extension outside original domain asserted here.
4. For every psi, sum_{g in S} conjugate(psi(g))= f if psi=0, -f if psi=c, 0 otherwise. Proof: indicator_S=(1-c)/2; orthogonality of the two full group sums, since c=c^{-1} is a nontrivial character and |G|=2f. Alternatively translate the subgroup sum: if psi nontrivial on Phi, a translating element with psi(h)!=1 forces sum to zero; if trivial on Phi, it descends to Z/2 and is either 0 or c. Source StronglyIrreducible 171–214 uses AddChar.sum_eq_ite, PB.conj_eq_neg, chC_neg, mul_chC_eq_zero_iff, card_G, chC_ne_zero. Dependencies retained, not silently replaced by the alternate proof.
5. askExp (previous audit 1fedf6d) supplies ASK as (1/f) sum_{g in S,psi} conjugate(psi(g)) times the cut sum. Substituting step 3 gives exactly De plus the normalized corrections. Since psi=0 is excluded from the nontrivial correction, step 4 gives (-f)(-a ell(c))/f=+a ell(c), not minus. The trivial contribution is a(log a-1-gamma)-(a/f)sum_Phi log w by step 1. Thus correction equals the actual MAIN definition (FirstPrimeNeSecondPrime 89–95), with complex ell untouched and normalization by f, not |G|. This proves the desired equality from its cited inputs. In particular Im De = -a Im ell(c) since ASK and other MAIN terms are real. De is NOT in general real. Re-taking the real part later is permissible but not equivalent to this complex identity.
6. Controls: deleting conjugation in the full De fails on an explicit finite H=C4 fixture; sign of ell(c) matters, nonzero ell(0) allowed and unused in GPsi. Missing cutoff: a=10,W=1,N=3,n=5 leaves a positive term outside the range. Missing positivity: a=1,W=-1,N=1,n=2 satisfies a/W<=N yet positive term remains. No counterexample to ha deletion under totalized log claimed. These are abstract arithmetic-host fixtures, not actual number fields. Exact Gaussian-integer complex arithmetic with formal log prime basis, separate gamma/constant coefficients; equality of formal coefficients suffices for equality of corresponding real/complex expressions. Common integer scale 2*q*LCM(1..N); nonuniform positive weights on Phi, negative off Phi, arbitrary ell incl imaginary parts, H=C1,C2,C4, all t, fractional a including floor=0 and boundary. Finite tests are regression, not universal proof or kernel verification.
Executed in V8 against connector-returned pinned blob IDs: {"counts":{"source":61,"colour":28,"partner":7,"cut":15024,"inner":14016,"balance":504,"imag":168,"negative":6},"total":29814,"witnesses":{"signWitness":{"h":1,"t":0,"seed":0,"an":1,"q":1,"N":2},"conjWitness":{"h":4,"t":0,"seed":0,"an":12,"q":1,"N":13},"cutWitness":{"a":10,"w":1,"N":3,"n":5},"weightWitness":{"a":1,"w":-1,"N":1,"n":2},"imagWitness":{"h":1,"t":0,"seed":0,"an":1,"q":1,"N":2},"ell0Witness":{"h":1,"t":0,"seed":0,"an":1,"q":1,"N":2}}}. CLI independently authenticates raw blobs; CLI not locally run because pinned checkout unavailable. No URT advantage claimed.
RESUME HERE: audit ChCore's real-part conversion and exact mapping of GPsi into GmA/SigA for selected characters, including the real vs complex ell(c) premise and weights, and request typed dependency expansion for ch_balance/colour_sum if still missing. HANDOFF TO math, dependencies, integration, editor.
AGREE with exact pinned cancellation; DISAGREE with sign reversal, dropping conjugation, or assuming De real for arbitrary ell; PARTIAL for full proof.
*/
import {readFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {join} from 'node:path';
const spec={
  "balance": [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChBalance.lean",
    "37648715bcf507e086374e8cc476ee746fd274f4"
  ],
  "strong": [
    "src/Formalism/SizeWindowBrackets/ChainSlopeWindows/StronglyIrreducible.lean",
    "94a385f59f3781ae6b1ab4beddc73850708a2bc6"
  ],
  "data": [
    "src/Formalism/SizeWindowBrackets/FirstPrimeNeSecondPrime.lean",
    "18deb7cb85d6f650a69f01fda6e0c789b9f04d89"
  ],
  "host": [
    "src/Formalism/ThickAverageLoss/PartnersToFactorsAt.lean",
    "d3c1d8a4d1dcd4b282b14960b5a7b6525115e0af"
  ],
  "zeta": [
    "src/Formalism/StatementOC.lean",
    "12ab19c0176bd4135c2b23a7ee3ac22888df0122"
  ],
  "split": [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean",
    "b5662cda1f3523fc53b547ee582a46bd3cd826d4"
  ]
};
function audit(src){
 const counts={source:0,colour:0,partner:0,cut:0,inner:0,balance:0,imag:0,negative:0};
 const ck=(b,k,m)=>{if(!b)throw Error(k+": "+m);counts[k]++};
 const anchors={
 balance:["theorem ch_balance","(ha : 0 < a) (hw : ∀ ρ, InPhi ρ → 0 < w ρ)","(N : ℕ) (hN : ∀ ρ, InPhi ρ → a / w ρ ≤ N)","(ASK D N a t w : ℂ) - MAIN ell a w = De D ell a t w","CharacterBalance.askExp D hD a t w hw N hN","sum_cut D ψ N a _ ha hW","inner_eq D ell ψ a _ ha hW","have hDe","unfold De","have hsplit","AddChar.zero_apply","have hcol","colour_sum ψ","PB.chC_ne_zero","have hreal","PB.card_notPhi","PB.sum_partner t","unfold MAIN"],
 strong:["lemma sum_partner","[AddCommMonoid β]","(fun ρ => ρ - topPl t - cconj)","lemma phi_card_ne_zero","theorem colour_sum","(1 - chC g) / 2","AddChar.sum_eq_ite","mul_chC_eq_zero_iff","theorem primitive_value_trivial","lemma sum_cut","⌊a / W⌋₊ ≤ N","lemma inner_eq","Real.log_div ha.ne' hw.ne'"],
 data:["def partner","cconj + g + topPl t","def chC","if g.1.1 = 0 then 1 else -1","def GPsi","if ψ = 0 then ((Gz y : ℝ) : ℂ)","(y : ℂ) * ell ψ","def MAIN","Real.log a - 1 - Real.eulerMascheroniConstant"," + ell chC","def De","starRingEnd ℂ (ψ g)","def ASK","def ColourSum","def primVal"],
 host:["def InPhi (g : E0 × H) : Prop := g.1.1 = 0","def cconj : E0 × H := ((1, 1), 0)","def topPl (t : H) : E0 × H := ((0, 0), t)","def PhiSet"],
 zeta:["def Sz (x : ℝ) : ℝ := ∑ n ∈ Finset.Icc 1 ⌊x⌋₊, Λ n * (x / n - 1)","def Gz (x : ℝ) : ℝ := Sz x - x * Real.log x + (1 + Real.eulerMascheroniConstant) * x"],
 split:["structure HostFactsS","d_prime : D.d.Prime","two_mem : 2 ∈ S","q1_mem : D.q1 ∈ S","d_not_mem : D.d ∉ S","inertia_d : ∀ x, x ∈ D.inertia D.d ↔ x = 0 ∨ x = sgc0","split_frob : ∀ p ∈ S, InPhi (D.frob p)","split_inertia","unram :"]
 };
 for(const [k,arr] of Object.entries(anchors)){const s=src[k].replace(/\s+/g," ");for(const a of arr)ck(s.includes(a),"source",k+" "+a)}
 const phase=[[1n,0n],[0n,1n],[-1n,0n],[0n,-1n]],mod=(a,n)=>(a%n+n)%n;
 const mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c],conj=([a,b])=>[a,-b],plus=([a,b],[c,d])=>[a+c,b+d],scale=(x,[a,b])=>[x*a,x*b];
 const eq=(a,b)=>a[0]===b[0]&&a[1]===b[1],zero=()=>[0n,0n];
 const vec=()=>new Map(),put=(v,k,z)=>v.set(k,plus(v.get(k)||zero(),z)),add=(v,u,z=[1n,0n])=>{for(const [k,x] of u)put(v,k,mul(x,z));return v};
 const same=(u,v)=>[...new Set([...u.keys(),...v.keys()])].every(k=>eq(u.get(k)||zero(),v.get(k)||zero()));
 const gcd=(a,b)=>b===0n?a:gcd(b,a%b);
 function factors(n){const m=[];for(let p=2;p<=n;p++)while(n%p===0){m.push(p);n/=p}return m}
 function log(v,n,z){for(const p of factors(n))put(v,"p"+p,z)}
 function logRatio(v,a,b,z){log(v,a,z);log(v,b,scale(-1n,z))}
 function primePower(n){const a=factors(n);return a.length&&a.every(x=>x===a[0])?[a[0],a.length]:null}
 let signWitness=null,conjWitness=null,cutWitness=null,weightWitness=null,imagWitness=null,ell0Witness=null;
 for(const h of [1,2,4]){
  const G=Array.from({length:4*h},(_,i)=>i), f=2*h, F=BigInt(f),a0=g=>Math.floor(g/(2*h)),b0=g=>Math.floor(g/h)%2,h0=g=>g%h;
  const enc=(a,b,c)=>mod(a,2)*2*h+mod(b,2)*h+mod(c,h),S=G.filter(a0),P=G.filter(g=>!a0(g)),ch=enc(1,0,0);
  const chi=(j,g)=>phase[mod(2*(a0(j)*a0(g)+b0(j)*b0(g))+4/h*h0(j)*h0(g),4)];
  for(const j of G){const z=S.reduce((s,g)=>plus(s,conj(chi(j,g))),zero());ck(eq(z,[j===0?F:j===ch?-F:0n,0n]),"colour","sum")}
  for(let t=0;t<h;t++){
   const partner=g=>enc(1+a0(g),1+b0(g),t+h0(g)),inv=r=>enc(1+a0(r),1+b0(r),h0(r)-t);
   ck(new Set(S.map(partner)).size===f&&S.every(g=>P.includes(partner(g))&&inv(partner(g))===g)&&P.every(r=>S.includes(inv(r))&&partner(inv(r))===r),"partner","bijection");
   for(let seed=0;seed<4;seed++){
    const d=5,q1=3,S0=[2,3,7],frob=p=>S0.includes(p)?enc(0,p+seed,p*seed):enc(1,p+seed,p+seed);
    const sc=g=>enc(1+a0(g),b0(g),h0(g));
    for(const [an,q] of [[1,1],[4,3],[6,2],[12,1],[23,3],[24,2]]){
     const W=r=>a0(r)?-7:1+(r+seed)%4;
     const N=Math.ceil(an/Math.min(...P.map(W)))+1;
     let L=1n;for(let n=1;n<=N;n++)L=L*BigInt(n)/gcd(L,BigInt(n));
     const A=BigInt(an),Q=BigInt(q),unit=2n*L*A;
     // Coefficient scale 2*q*LCM(1..N), primVal numerator over 2.
     const ell=j=>[BigInt(2*j-seed+1),BigInt((j+seed)%5+1)];
     function pn(j,p,i){const x=frob(p),g=enc(i*a0(x),i*b0(x),i*h0(x));return p===d?plus(chi(j,g),chi(j,sc(g))):scale(2n,chi(j,g))}
     const raw=vec(),de=vec(),corr=vec(),ask=vec(),wrongConj=vec(),main=vec();
     for(const g of S){
      const wn=W(partner(g)), B=BigInt(wn),m=Math.floor(an/wn);
      ck(m<=N&&wn>0&&an<=N*wn,"cut","premises");
      for(const j of G){
       const u=vec(),cut=vec(),gp=vec(),c=vec();
       for(let n=1;n<=N;n++){
        const pp=primePower(n);if(!pp)continue;const [p,i]=pp,v=pn(j,p,i);
        const rawnum=A-B*BigInt(n),pos=rawnum>0n?rawnum:0n;
        put(u,"p"+p,scale(pos*(L/BigInt(n)),v));
        if(n<=m)put(cut,"p"+p,scale(rawnum*(L/BigInt(n)),v));
        // W*GPsi's sum, via y=a/W and n<=floor(y), independently scaled.
        if(n<=m){const yn=A-B*BigInt(n);put(gp,"p"+p,scale((L/BigInt(n))*yn,v))}
       }
       ck(same(u,cut),"cut","exact floor cutoff");
       if(j===0){
        logRatio(gp,an,wn,[-unit,0n]);put(gp,"one",[unit,0n]);put(gp,"gamma",[unit,0n]);
        logRatio(c,an,q,[unit,0n]);logRatio(c,wn,q,[-unit,0n]);put(c,"one",[-unit,0n]);put(c,"gamma",[-unit,0n]);
       }else{put(gp,"one",scale(unit,ell(j)));put(c,"one",scale(-unit,ell(j)))}
       const rhs=vec();add(rhs,gp);add(rhs,c);ck(same(u,rhs),"inner","complex inner equation");
       add(raw,u,conj(chi(j,g)));add(de,gp,conj(chi(j,g)));add(corr,c,conj(chi(j,g)));add(wrongConj,gp,chi(j,g));
      }
     }
     for(let n=2;n<=N;n++){const pp=primePower(n);if(!pp)continue;const [p,i]=pp;if(S0.includes(p))continue;const x=frob(p),g=enc(i*a0(x),i*b0(x),i*h0(x));let r=g,k=2n;
      if(p===d){r=a0(g)?g:sc(g);k=1n}else if(!a0(g))continue;
      const z=A-BigInt(W(partner(r)))*BigInt(n);if(z>0n)put(ask,"p"+p,[F*2n*k*z*(L/BigInt(n)),0n]);
     }
     // f*MAIN, using the actual arithmetic mean of logs and arbitrary complex ell.
     logRatio(main,an,q,[F*unit,0n]);for(const r of P)logRatio(main,W(r),q,[-unit,0n]);
     put(main,"one",plus([-F*unit,0n],scale(F*unit,ell(ch))));put(main,"gamma",[-F*unit,0n]);
     ck(same(raw,ask),"balance","ASK Fourier normalization");
     ck(same(corr,main),"balance","MAIN correction");
     const diff=vec();add(diff,ask);add(diff,main,[-1n,0n]);ck(same(diff,de),"balance","ASK-MAIN=De");
     ck([...de].every(([k,z])=>z[1]===(k==="one"?-F*unit*ell(ch)[1]:0n)),"imag","imaginary part");
     const witness={h,t,seed,an,q,N};
     const wrongSign=vec();add(wrongSign,main);put(wrongSign,"one",scale(-2n*F*unit,ell(ch)));if(!same(wrongSign,corr))signWitness??=witness;
     if(!same(wrongConj,de))conjWitness??=witness;
     if([...de.values()].some(z=>z[1]!==0n))imagWitness??=witness;
     if(ell(0)[1]!==0n&&ell(ch)[1]!==0n)ell0Witness??=witness;
    }
   }
  }
 }
 // Explicit controls for a truncated positive sum and a reversed weight inequality.
 cutWitness={a:10,w:1,N:3,n:5};ck(cutWitness.a>cutWitness.w*cutWitness.n&&cutWitness.n>cutWitness.N,"negative","missing hN");
 weightWitness={a:1,w:-1,N:1,n:2};ck(weightWitness.a/weightWitness.w<=weightWitness.N&&weightWitness.a/weightWitness.n-weightWitness.w>0,"negative","missing positivity");
 ck(signWitness!==null,"negative","sign flip detected");ck(conjWitness!==null,"negative","conjugation deletion detected");ck(imagWitness!==null,"negative","real De claim false");
 ck(ell0Witness!==null,"negative","ell(0) not required zero");
 // 0<a is a source premise, not a proven necessary condition: Lean log is total, log_div needs nonzero.
 return {counts,total:Object.values(counts).reduce((a,b)=>a+b,0),witnesses:{signWitness,conjWitness,cutWitness,weightWitness,imagWitness,ell0Witness}};
}
const root=process.argv[2];if(!root)throw Error('usage: node certificate.mjs /path/to/pinned/checkout');const src={};for(const [key,[p,sha]] of Object.entries(spec)){const b=readFileSync(join(root,p));if(createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex')!==sha)throw Error('blob mismatch '+p);src[key]=b.toString('utf8')}console.log(JSON.stringify(audit(src)));

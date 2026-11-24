# RUN4 — arithmetic Fourier balance (2026-11-24)

RESULT: SOURCE-MATCHED conditional human proof of ASK−MAIN=De with executed finite regression. No full RH translation, Lean replay or URT speedup. Read swarm protocol, queue, expansion, AGENTS, continuity, research state, runner log/protocol, prior prime chapters and relevant peer math, integration, Landau, character-box, kernel and acceleration handoffs. This is not geometric Data.key_identity. Physical CI #360 PASS 09:58 UTC is unrelated.

## Immutable sources
All RH paths relative to https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/. Upstream observed HEAD 73958da58a8a4d1f61b789745c5444baf6247cae (09:50:10 UTC, merge #1005), changed since c9883164b0b3d762cee21f889d03d59a53b3ba3b. At HEAD the two principal blobs are d0498cdde8640558c61c6d342dd618e88b89f7a1 and aa851c8306664ea7e17cd99e5b405eaf817d906f, unchanged from run3 observation but not the original pin. At HEAD StronglyIrreducible has 477 rather than 770 lines and no declaration named colour_balance or characterSum_expansion in that file. No assertion of removal from whole repository or transitive equivalence. Continue original pin.

- src/Formalism/SizeWindowBrackets/FirstPrimeNeSecondPrime.lean, blob 18deb7cb85d6f650a69f01fda6e0c789b9f04d89: 15–34 partner/chC; 38–59 ArithData/HostFacts; 61–70 cosetMean/primVal/GPsi; 72–101 ASK/MAIN/De/AskMainBalance; 103–138 predicates.
- src/Formalism/SizeWindowBrackets/ChainSlopeWindows/StronglyIrreducible.lean, blob 94a385f59f3781ae6b1ab4beddc73850708a2bc6: 47–83 partner sum/ortho; 131–211 cardinality, partner_bijection, colour_sum; 213–259 primitive_value_trivial/pow/double_coset_singleton; 266–328 ortho_coset, orthogonality_ramified/unramified; 335–410 sum_vonMangoldt_primePow/cutoff; 412–516 local kernels; 523–605 characterSum_expansion; 612–688 term_real/sum_cut/inner_eq; 695–765 colour_balance.
- src/Formalism/ThickAverageLoss/PartnersToFactorsAt.lean, blob d3c1d8a4d1dcd4b282b14960b5a7b6525115e0af, 13–29 E0/InPhi/cconj/topPl/PhiSet; 47–69 related real Balance (not identical).
- src/Formalism/StatementOC.lean, blob 12ab19c0176bd4135c2b23a7ee3ac22888df0122, 11–13 Sz/Gz.
- lake-manifest.json blob b4d1ec31575a26b2159ec3a262b482bc051f3f6f: locks Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

Mathlib locked sources: Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean blob 3918dfeacbc483dc9304f9dc26e147e5568ee427, card_eq 101–109, doubleDualEmb_injective/bijective 151–161, sum_apply_eq_ite 188–190. Mathlib/Algebra/Group/AddChar.lean blob 0c9bc3c17393f14fd740b8f357d65654dc8da09d, sum_eq_ite 329–336. Mathlib/Analysis/Fourier/FiniteAbelian/Orthogonality.lean blob 619b123068af91959127d951a3074884064b0a16, expect_eq_ite 35–36, wInner_cWeight_eq_boole 60–66. Dual cardinality and separation follow from finite abelian cyclic decomposition; evaluation at a nonzero group element is a nontrivial character of the dual. Translation invariance gives zero character sum by multiplying by a character value unequal to 1 and cancelling; at zero every summand is 1. These are actual source leaves, not extracted kernel edges.

## 1. Exact hypotheses
H any finite additive commutative group with decidable equality. G=(Z/2)^2×H, Phi={g:first bit=0}, B={g:first bit=1}, M=|Phi|=|B|=|G|/2>0. c=((1,1),0), s=((1,0),0), top(t)=((0,0),t), P_t(g)=c+g+top(t). Translation gives bijection B→Phi, inverse rho−top(t)−c. chC(g)=(-1)^firstBit(g); zero AddChar means trivial function 1.

Fix ANY ArithData D satisfying all HostFacts: q1,d distinct primes neither 2; for prime p other than 2,q1,d, I_p={0}; at p=2 or q1, I_p and Frob_p lie in Phi; I_d={0,s}. No condition on Frob_d. Fix arbitrary ell:Ghat→C, real a>0, t∈H, w:G→R positive at every rho∈Phi, and N∈Nat with a/w(rho)≤N for every rho∈Phi. No positivity outside Phi; no property of ell required. Original order: D→HostFacts→ell,a,t,w→positivity→N→uniform cutoff.

## 2. Local Fourier projector and prime expansion
A_I(h,psi)=Σ_{x∈I}psi(h+x)/|I|. Define v_psi(n)=product over p|n of A_{I_p}(v_p(n)Frob_p,psi). Thus for p prime, i≥1, v_psi(p^i)=A_{I_p}(i Frob_p,psi), and v_0(n)=1. Define K(n,g)=M^{-1}Σ_psi conjugate(psi(g)) v_psi(n), F(n,g)=max(a/n−w(P_t(g)),0).
With h=i Frob_p, finite orthogonality gives
K(p^i,g)=(M|I_p|)^{-1}Σ_{x∈I_p}|G| 1_{h+x=g}=(2/|I_p|)1_{g−h∈I_p}.
The subgroup contains 0, so its cardinality is positive. This is ortho_coset and orthogonality_ramified, without HostFacts for this generic formula.

Unramified p distinct from 2,q1,d: K=2 when g=h, 0 otherwise; if Frob_p∈Phi no multiple enters B; if Frob_p∈B precisely odd i enter B. At p=2 or q1 the entire coset lies in Phi, hence K=0 on B. At p=d the coset h+{0,s} has exactly one element in B (opposite first bits), coefficient 1, for EVERY i regardless of Frob_d. This explains local_unram/local_split/local_d and double_coset_singleton.

For n>N, w(P_t(g))>0 and a/w(P_t(g))≤N<n imply F=0. Reindex the finite Mangoldt sum by p prime≤N, 1≤i≤N, only p^i≤N contributes, unique prime-power representation, i<p^i≤N, Lambda(p^i)=log p not i log p. If d>N its separately written ASK term vanishes as well. No infinite sum or limit exchanged.

Exactly source ASK =
2 Σ_{p≤N,IsInert(p)} log p Σ_{1≤i≤N,i Frob_p∈B} F(p^i,i Frob_p)
+ log d Σ_{1≤i≤N}Σ_{g∈B∩(i Frob_d+I_d)}F(d^i,g).
Consequently
ASK = Σ_{n=1}^N Lambda(n)Σ_{g∈B}K(n,g)F(n,g)
= (1/M)Σ_{g∈B}Σ_psi conjugate(psi(g))Σ_{n=1}^N Lambda(n)v_psi(n)F(n,g).
This is characterSum_expansion as complex equality, not merely real parts.

## 3. Inner sum and correction
For g∈B let W=w(P_t(g))>0, y=a/W>0, L=floor_nat(y)≤N. F(n,g)=a/n−W if n≤L, zero otherwise; integral endpoint has zero weight, y<1 gives empty sum. Since a/n−W=W(y/n−1), use GPsi:
GPsi_0(y)=Gz(y)=Sz(y)−y log y+(1+gamma)y, Sz(y)=Σ_{n=1}^{floor_nat(y)}Lambda(n)(y/n−1).
GPsi_psi(y)=Σ Lambda(n)v_psi(n)(y/n−1)+y ell(psi) for psi≠0.
The inner sum is W GPsi + C_psi(W), where
C_0(W)=a log a−a log W−(1+gamma)a,
C_psi(W)=−a ell(psi) for psi≠0.
Use W y=a and log y=log a−log W (positive arguments). This is sum_cut and inner_eq.

The indicator of B is (1−chC)/2. Ordinary character orthogonality for psi and psi*chC gives Σ_{g∈B}conjugate(psi(g))=M if psi=0, −M if psi=chC, 0 otherwise. chC is real, order 2, nontrivial (at s gives −1). This proves colour_sum.

Substitute inner expansion: the GPsi terms give De=(1/M)Σ_{g∈B}Σ_psi conjugate(psi(g)) W GPsi(a/W).
The nontrivial correction is (−a ell(chC))(−M)/M=+a ell(chC). The trivial correction, using partner bijection, is a(log a−1−gamma)−(a/M)Σ_{rho∈Phi}log w(rho). Thus their sum is MAIN=a[log a−1−gamma+ell(chC)−(1/M)Σ_{rho∈Phi}log w(rho)]. Hence ASK=De+MAIN, or ASK−MAIN=De, the exact conditional colour_balance. The normalization M, order-two inertia and colour sum explain respectively factor 2, factor 1 and PLUS sign of ell(chC). No analytic estimate, no global host existence, no RH conclusion.

## 4. Executed finite checks
V8, Gaussian integer roots for H=0,C2,C4,C2×C2; subgroups generated by up to two elements plus whole group (not exhaustive in rank four). Clear subgroup means by |G|, rational weights by 2*lcm(1,...,N). Distinct q1,d, split inertia and Frobenius, shifts, positive weights only on Phi, N=1..16, y<1, equality at cutoff and d>N. Compare each coefficient of log(p) exactly, not numeric logarithms. MAIN checks use independent integer stand-ins for log a/log W/gamma and complex ell; the symbolic proof supplies actual logarithmic identities. All assertions passed; no Lean replay.

~~~json
{
  "groups": 4,
  "subgroups": 99,
  "cosets": 21072,
  "colour": 44,
  "singletons": 44,
  "fixtures": 1128,
  "cutoff": 44328,
  "primeCoefficients": 7896,
  "mainCorrection": 1128,
  "negative": 16
}
~~~

Same function executed; save as JS and run node.
~~~js
function check(){
 const plus=([a,b],[c,d])=>[a+c,b+d], mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c], conj=([a,b])=>[a,-b], eq=([a,b],[c,d])=>a===c&&b===d, scale=([a,b],k)=>[a*k,b*k];
 const roots=[[1,0],[0,1],[-1,0],[0,-1]],mod=(a,n)=>(a%n+n)%n;
 const assert=(v,s)=>{if(!v)throw Error(s)};
 const C={groups:0,subgroups:0,cosets:0,colour:0,singletons:0,fixtures:0,cutoff:0,primeCoefficients:0,mainCorrection:0,negative:0};
 for(const h of [[],[2],[4],[2,2]]){
  const ds=[2,2,...h], es=ds.reduce((a,d)=>a.flatMap(x=>Array.from({length:d},(_,i)=>[...x,i])),[[]]), G=es.length,M=G/2;
  const ids=new Map(es.map((x,i)=>[x.join(),i]));
  const add=(a,b)=>ids.get(es[a].map((x,i)=>(x+es[b][i])%ds[i]).join());
  const times=(a,k)=>ids.get(es[a].map((x,i)=>mod(x*k,ds[i])).join());
  const B=es.map((x,i)=>i).filter(i=>es[i][0]===1), P=es.map((x,i)=>i).filter(i=>es[i][0]===0);
  const s=ids.get([1,0,...h.map(()=>0)].join()),c=ids.get([1,1,...h.map(()=>0)].join());
  const V=es.map(u=>es.map(v=>roots[mod(u.reduce((r,x,i)=>r+x*v[i]*4/ds[i],0),4)]));
  const subs=new Map();
  for(let a=0;a<G;a++)for(let b=0;b<G;b++){
   const set=new Set();for(let i=0;i<4;i++)for(let j=0;j<4;j++)set.add(add(times(a,i),times(b,j)));
   const I=[...set].sort((a,b)=>a-b);subs.set(I.join(),I);
  }
  const full=es.map((_,i)=>i);subs.set(full.join(),full);
  const means=(I,x)=>V.map(row=>scale(I.reduce((r,i)=>plus(r,row[add(x,i)]),[0,0]),G/I.length));
  const kr=(mv,g)=>mv.reduce((r,v,u)=>plus(r,mul(conj(V[u][g]),v)),[0,0]);
  C.groups++;C.subgroups+=subs.size;
  for(const I of subs.values())for(let x=0;x<G;x++){
   const mv=means(I,x), co=new Set(I.map(i=>add(i,x)));
   for(let g=0;g<G;g++){assert(eq(kr(mv,g),[co.has(g)?G*G/I.length:0,0]),"coset");C.cosets++;}
  }
  for(let u=0;u<G;u++){assert(eq(B.reduce((r,g)=>plus(r,conj(V[u][g])),[0,0]),[u===0?M:u===s?-M:0,0]),"colour");C.colour++;}
  for(let x=0;x<G;x++){assert([x,add(x,s)].filter(g=>B.includes(g)).length===1,"singleton");C.singletons++;}
  const split=[...subs.values()].filter(I=>I.every(g=>P.includes(g))),ts=P.filter(t=>es[t][1]===0);
  for(let j=0;j<6;j++){
   const q=j%2?7:3,d=[5,11,17][j%3],t=ts[j%ts.length],partner=g=>add(add(c,g),t),W=es.map((_,g)=>P.includes(g)?1+(g+j)%4:-3);
   const I=p=>p===d?[0,s]:p===2||p===q?split[(p+j)%split.length]:[0];
   const F=p=>p===2||p===q?P[(p+j)%M]:(p+j*3)%G;
   for(let N=1;N<=16;N++){
    const gcd=(a,b)=>b?gcd(b,a%b):a;let L=1;for(let n=1;n<=N;n++)L=L*n/gcd(L,n);
    for(const a of new Set([1,2*N,Math.max(1,2*N-1)])){
     assert(P.every(g=>a<=2*N*W[g]),"hypotheses");C.fixtures++;
     for(const p of [2,3,5,7,11,13,17]){
      let ask=0,ft=[0,0],de=[0,0];
      for(let i=1,n=p;i<=N;i++,n*=p){
       if(n>N){assert(B.every(g=>a<=2*n*W[partner(g)]),"tail");C.cutoff++;break;}
       const x=times(F(p),i),mv=means(I(p),x);
       const weight=g=>a*(L/n)-2*L*W[partner(g)];
       for(const g of B){
        const raw=weight(g),clip=Math.max(raw,0),cut=2*W[partner(g)]*n<=a?raw:0;
        assert(clip===cut&&Number.isSafeInteger(raw),"clip");C.cutoff++;
        ft=plus(ft,scale(kr(mv,g),clip));
        if(2*W[partner(g)]*n<=a)for(let u=0;u<G;u++)de=plus(de,scale(mul(conj(V[u][g]),mv[u]),cut));
       }
       if(p===d){for(const g of [x,add(x,s)])if(B.includes(g))ask+=Math.max(weight(g),0);}
       else if(p!==2&&p!==q&&B.includes(F(p))&&B.includes(x))ask+=2*Math.max(weight(x),0);
      }
      assert(eq(ft,[M*G*ask,0])&&eq(de,ft),"prime coefficient");C.primeCoefficients++;
     }
     const A=3+j,gamma=j-2,T=g=>2*g-j,ell=u=>[u-j,2*u+1];let corr=[0,0];
     for(const g of B)for(let u=0;u<G;u++){
      const v=u===0?[-a*(A-T(partner(g))-1-gamma),0]:scale(ell(u),a);
      corr=plus(corr,mul(conj(V[u][g]),v));
     }
     const main=plus([a*(M*(A-1-gamma)-P.reduce((r,g)=>r+T(g),0)),0],scale(ell(s),a*M));
     assert(eq(plus(corr,main),[0,0]),"main");C.mainCorrection++;
    }
   }
  }
  assert(!eq(kr(means([0],s),s),[M*G,0]),"wrong normalization");C.negative++;
  assert(eq(kr(means([0,s],0),s),[M*G,0]),"special prime coefficient");C.negative++;
  assert(!eq(B.reduce((r,g)=>plus(r,conj(V[s][g])),[0,0]),[0,0]),"missing colour");C.negative++;
  assert(Math.max(5/2-1,0)>0,"bad cutoff");C.negative++;
 }
 return C;
}
console.log(check());
~~~

Independent audit request: verify original HostFacts and quantifier order, i≥1, locked Mathlib duality, d>N, complex equality and chC correction sign. Find actual caller of colour_balance rather than conflating this with the related real Balance.

RESUME HERE: trace concrete callers of characterSumData.colour_balance/AskMainBalance into arithmetic-to-geometric adapter, D5.Balance, CycHost/GC and exact ASK/MAIN/De versus real askTop/ledTop/balTop; preserve real-part conversion and host compatibility. Locate HostFacts producer for actual ch_top host or if claimed elsewhere reconstruct finite-sum adapter. Do not redo local Fourier or geometric Data.key_identity. Preserve source hashes and trust edges.
HANDOFF TO: audit, integration, editor, math, Galois, character boxes and Landau. Project OPEN.

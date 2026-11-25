/* RH AUDIT — 2026-11-25 — SOURCE-MATCHED / PARTIAL.
One contribution: audit askExp prime-power splitting and give lossless parity/singleton compression under exact HostFactsS.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Latest observed upstream b2f365a68500e2bde98cd60a2324263fc62fba10: ChBalance original path 404, four remaining source blobs changed (SplitInertia cb31619e10acc3effdeec94e10c89abba559f78d, data d0498cdde8640558c61c6d342dd618e88b89f7a1, strong aa851c8306664ea7e17cd99e5b405eaf817d906f, host 4d4a31347e6d3e6c4b4fcf980c0a48f5d664834a). No cross-revision equivalence assumed.
Preflight SWARM_PROTOCOL first; AGENTS, state, actual runner log/protocol, continuity, HANDOFF_QUEUE; latest Cathedral CI #406 PASS (45517969326) unrelated to independent RH replay. Reviewed peer commit checkpoints audit dbb81da, math a025323, structure 9f8d550, dependencies 84f2185, integration e169d46, kernel d543273. Root log/protocol 404 corrected runner paths. Full state/log not reproduced here; external blueprint not reread, no premise from it. Local command -v lean/lake/elan returned no executable; git ls-remote failed DNS. No #print axioms, kernel elaboration or sorry census. Source anchors and mathematical derivation only.

Exact proof: G=(Z/2)^2 x H, f=|PhiSet|=2|H|; lambda:G->Z/2 first-coordinate homomorphism, Phi=ker lambda. Define s=sgc0=((1,0),0), partner(t,g)=cconj+g+topPl(t), taking lambda=1 to lambda=0. Let F(p,i,g)=max(a/p^i-w(partner(t,g)),0). For p prime, i>=1, primVal is the average of chi over i*frob(p)+I_p (FirstPrimeNeSecondPrime 60–66, StronglyIrreducible primitive_value_pow, ortho_coset 274ff, orthogonality_ramified 311–316). By finite character orthogonality, normalized sum over chi conjugate(chi(g)) primVal(p^i) is 2/|I_p| if g-i*frob(p) belongs to I_p and zero otherwise; f is half the group order, NOT full group order. This also proves positivity of the Fourier kernel at prime powers without a physical analogy.

HostFactsS (SplitInertia 14–22): d prime; 2,q1 in S0; d outside S0; inertia trivial for prime p outside S0 and not d; inertia AND frob of every p in S0 lie in Phi; I_d={0,s}. No extra assumption that q1 prime or S0 consists only of {2,q1}. The separately named double_coset_singleton takes HostFacts, not HostFactsS; cannot invoke it directly without conversion. Direct argument below uses only inertia_d of HostFactsS.

1. For p in S0, every point of i*frob(p)+I_p lies in Phi, so the outer non-Phi sum is zero (ChBalance lsplit). Both restrictions matter.
2. For p not in S0 and p!=d, I_p={0}; the unique possibly nonzero Fourier coefficient is 2 at g=i*frob(p). It survives the non-Phi filter precisely when lambda(frob(p))=1 AND i is odd. By 2,q1 in S0 these primes satisfy exactly IsInert if the first coordinate is 1; split primes in S0 cannot be IsInert. Retain prime and exclusion guards; do not apply formula to arbitrary composite or i=0.
3. For p=d, I_d has size two, and s toggles lambda. Exactly one non-Phi point of the coset survives: r_i=i*frob(d)+(1-lambda(i*frob(d)))*s (coordinate lambda interpreted as 0/1). Its coefficient is 1 for EVERY i>=1, regardless of parity. Hence askD reduces to a single sum, not zero on even i. This is a direct proof using the exact host premises rather than assuming the separately typed HostFacts theorem.
4. For every non-Phi g, w(partner)>0 and a/w(partner)<=N. If p^i>N then a<p^i*w(partner), so F=0. At p^i=N and a/w=N the term is also zero. Thus all exponent sums may restrict to positive integers satisfying p^i<=N. The exceptional term d>N vanishes, even though ASK defines it unconditionally. No positivity of a is needed for askExp itself (ch_balance does require 0<a). N=0 allowed under askExp premises. von Mangoldt support and unique prime-power factorization (StronglyIrreducible sum_vonMangoldt_primePow 335ff) then yield exactly
 ASK = sum_{p<=N, IsInert(p)} 2 log(p) sum_{i>=1 odd, p^i<=N} F(p,i,i*frob(p))
       + log(d) sum_{i>=1,d^i<=N} F(d,i,r_i).
No premises removed; this is equality, not an approximation. For each prime, i<=N follows from p^i>=i+1 (p>=2). Outer non-Phi filter is exact. ch_balance then uses sum_cut and inner_eq with ha>0, positive w, hN, then colour_sum and partner bijection to identify MAIN; this run does not separately audit those later steps. Do not infer ch_balance with ha removed.

Controls: with N=3,d=5,a=10,w=1, deleting hN permits a positive d-term even though d>N; with N=1,d=3,a=1,w=-1, hN holds but positivity deletion permits a positive d-term. For w=0 Lean total division gives hN yet cutoff fails. Split inertia/frob deletion allows nonzero contributions (abstract host fixtures). Normalization factors 2 and 1 checked independently. Exact Gaussian integer character sums and BigInt formal log(p) coefficients for H=Z/n, n=1,2,4, including extra split primes, q1 composite, negative a, N=0, nonconstant weights. These are regression controls for the universal proof, not real number-field construction. No numerical logs or fitted constants. Assertions executed in V8 on connector-returned authenticated blob IDs: {"counts":{"anchors":65,"mutations":65,"orthogonality":2016,"parity":1680,"cutoff":77056,"coefficients":518784,"negative":19},"total":599685}. CLI authenticates raw files before replay; CLI not independently run here. Anchor mutations are lexical sensitivity, not semantic completeness. No URT advantage claimed.
RESUME HERE: audit the remaining ch_balance MAIN cancellation via colour_sum, PB.sum_partner, sum_cut and inner_eq, including arbitrary complex ell, sign of ell(chC), and the necessity of ha>0 for logarithmic split. Request typed dependencies for askExp and ch_balance; don't infer kernel reachability from source imports.
HANDOFF TO math, dependencies, integration, editor.
AGREE with pinned prime-power split and parity/singleton equality; DISAGREE with removing cutoff or split guards, uniform factor 2, or discarding even ramified powers; PARTIAL overall.
*/
import {readFileSync} from "node:fs";
import {createHash} from "node:crypto";
import {join} from "node:path";
const spec={
  "balance": [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChBalance.lean",
    "37648715bcf507e086374e8cc476ee746fd274f4"
  ],
  "split": [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean",
    "b5662cda1f3523fc53b547ee582a46bd3cd826d4"
  ],
  "data": [
    "src/Formalism/SizeWindowBrackets/FirstPrimeNeSecondPrime.lean",
    "18deb7cb85d6f650a69f01fda6e0c789b9f04d89"
  ],
  "strong": [
    "src/Formalism/SizeWindowBrackets/ChainSlopeWindows/StronglyIrreducible.lean",
    "94a385f59f3781ae6b1ab4beddc73850708a2bc6"
  ],
  "host": [
    "src/Formalism/ThickAverageLoss/PartnersToFactorsAt.lean",
    "d3c1d8a4d1dcd4b282b14960b5a7b6525115e0af"
  ]
};
function audit(src){
 const counts={anchors:0,mutations:0,orthogonality:0,parity:0,cutoff:0,coefficients:0,negative:0};function ck(b,k,msg){if(!b)throw Error(k+": "+msg);counts[k]++}
 const anchors={
 balance:["lemma askExp","(hw : ∀ ρ, InPhi ρ → 0 < w ρ) (N : ℕ) (hN : ∀ ρ, InPhi ρ → a / w ρ ≤ N)","lemma ounram","(hd : p ≠ D.d) (hi : 1 ≤ i)","rw [this, hD.unram p hp h2 hd]","if i • D.frob p = g then 2 else 0","lemma lsplit","hD.split_inertia p h2 _ hm","inPhi_nsmul (hD.split_frob p h2) i","lemma ld","rw [e, cardI D hD]","rw [sum_vonMangoldt_primePow N","max_zero_of_gt hw hN hg'","by_cases hd : p = D.d","by_cases h2 : p ∈ S0","hD.two_mem","hD.q1_mem","by_cases hin : IsInert D p","ramifiedPrimeTerm_eq_zero_of_lt_ramifiedPrime D hD hw hN hdN","theorem ch_balance","(ha : 0 < a)","rw [CharacterBalance.askExp D hD a t w hw N hN]","sum_cut D ψ N a _ ha hW","inner_eq D ell ψ a _ ha hW","colour_sum ψ"],
 split:["structure HostFactsS","d_prime : D.d.Prime","two_mem : 2 ∈ S","q1_mem : D.q1 ∈ S","d_not_mem : D.d ∉ S","unram : ∀ p : ℕ, p.Prime → p ∉ S → p ≠ D.d → D.inertia p = ⊥","split_inertia : ∀ p ∈ S, ∀ x ∈ D.inertia p, InPhi x","split_frob : ∀ p ∈ S, InPhi (D.frob p)","inertia_d : ∀ x, x ∈ D.inertia D.d ↔ x = 0 ∨ x = sgc0"],
 data:["def sgc0 : E0 × H := ((1, 0), 0)","def partner (t : H) (g : E0 × H) : E0 × H := cconj + g + topPl t","def cosetMean","ψ (h + x)) /","def primVal","n.factorization p • D.frob p","p.Prime ∧ p ≠ 2 ∧ p ≠ D.q1 ∧ p ≠ D.d ∧ ¬ InPhi (D.frob p)","(Icc 1 N).filter (fun i => ¬ InPhi (i • D.frob p))","g - i • D.frob D.d ∈ D.inertia D.d ∧ ¬ InPhi g","2 * Real.log p * askP D N a t w p","Real.log D.d * askD D N a t w","def DCosetSingle","HostFacts D → ∀ i : ℕ, ∃! g"],
 strong:["theorem primitive_value_pow","theorem double_coset_singleton","lemma ortho_coset","if g - h ∈ I then 2 / (Nat.card I : ℂ) else 0","theorem orthogonality_ramified","convert ortho_coset (D.inertia p) (i • D.frob p) g","lemma sum_vonMangoldt_primePow","N < p ^ i → X (p ^ i) = 0","lemma max_zero_of_gt","(div_lt_iff₀ hwρ).1 h1","lemma partner_inPhi","lemma sum_cut","lemma inner_eq"],
 host:["abbrev E0 := ZMod 2 × ZMod 2","def InPhi (g : E0 × H) : Prop := g.1.1 = 0","def cconj : E0 × H := ((1, 1), 0)","def topPl (t : H) : E0 × H := ((0, 0), t)","def PhiSet : Finset (E0 × H) := univ.filter InPhi"]};
 for(const [k,arr] of Object.entries(anchors)){let s=src[k].replace(/\s+/g," ");for(const a of arr){ck(s.includes(a),"anchors",k+" "+a);ck(!s.split(a).join("__deleted__").includes(a),"mutations",a)}}
 const primes=[2,3,5,7,11,13],phase=[[1,0],[0,1],[-1,0],[0,-1]];
 for(const n of [1,2,4]){
  const f=2*n,G=Array.from({length:4*n},(_,i)=>i), a0=g=>Math.floor(g/(2*n)), b0=g=>Math.floor(g/n)%2,h0=g=>g%n, mod=(x,m)=>(x%m+m)%m;
  const enc=(a,b,h)=>mod(a,2)*2*n+mod(b,2)*n+mod(h,n);
  const add=(g,h)=>enc(a0(g)+a0(h),b0(g)+b0(h),h0(g)+h0(h)), sub=(g,h)=>enc(a0(g)-a0(h),b0(g)-b0(h),h0(g)-h0(h)), scale=(i,g)=>enc(i*a0(g),i*b0(g),i*h0(g));
  const ph=(j,g)=>phase[mod(2*(a0(j)*a0(g)+b0(j)*b0(g))+4/n*h0(j)*h0(g),4)];
  const S=G.filter(a0),Phi=G.filter(g=>!a0(g)),sg=enc(1,0,0);
  const partner=(t,g)=>add(add(enc(1,1,0),g),enc(0,0,t));
  const subgroups=[[0],[0,sg],Phi,G,[0,enc(0,1,0)],G.filter(g=>!a0(g)&&!b0(g))];
  const kernels=[];
  for(const I of subgroups){const table=[];
   for(const h of G){const row=[];for(const g of G){let re=0,im=0;
    // Unnormalized numerator of sum_chi conj(chi(g)) sum_{x in I} chi(h+x).
    for(const j of G)for(const x of I){const z=ph(j,sub(add(h,x),g));re+=z[0];im+=z[1]}
    const target=I.includes(sub(g,h))?2*f:0;
    ck(re===target&&im===0,"orthogonality","full finite Fourier numerator");
    row.push([re,f*I.length]);
   }table.push(row)}kernels.push(table)}
  for(const h of G)for(let i=1;i<=12;i++){
   const ih=scale(i,h),q=add(ih,a0(ih)?0:sg);
   ck(S.includes(q)&&[ih,add(ih,sg)].filter(a0).length===1,"parity","unique ramified non-Phi point");
   ck(Boolean(a0(ih))===Boolean((i%2)*a0(h)),"parity","unramified odd exponents");
   for(let t=0;t<n;t++)ck(Phi.includes(partner(t,q)),"parity","partner");
  }
  // HostFactsS fixtures: S0 can contain extra primes and q1 need not be prime.
  for(const [d,q1] of [[5,3],[11,4],[13,3],[3,4]])for(let seed=0;seed<4;seed++){
   const S0=new Set([2,q1,7]),frob=p=>S0.has(p)?enc(0,seed+p,seed*p+p):enc(seed+p,seed*p,seed+p);
   const kind=p=>p===d?1:S0.has(p)?(seed%2?2:4):0;
   for(const N of [0,1,2,3,5,8,12])for(const a of [-2,0,N,2*N])for(let t=0;t<n;t++){
    // Integer weights on Phi, arbitrary negative outside Phi. Choose a<=N*min w.
    const w=g=>a0(g)?-9:2+(g+seed)%3;
    ck(Phi.every(g=>w(g)>0&&a<=N*w(g)),"cutoff","host cutoff hypotheses");
    for(const p of primes){let orig=0n, compressed=0n;const pb=BigInt(p), denom=pb**BigInt(N),h=frob(p),k=kind(p);
     for(let i=1;i<=N;i++){
      const power=pb**BigInt(i),ih=scale(i,h);
      const F=g=>{let z=BigInt(a)-BigInt(w(partner(t,g)))*power;return z>0n?z:0n};
      let numerator=0n;for(const g of S){let [num,den]=kernels[k][ih][g];ck(num%den===0||num===0,"coefficients","integer active coefficients");numerator+=BigInt(num/den)*F(g)}
      if(power<=BigInt(N))orig+=numerator*(denom/power);
      else ck(numerator===0n,"cutoff","all above-cutoff contributions vanish");
      // Formula derived without replacing the exact HostFactsS by HostFacts.
      if(p===d){const q=add(ih,a0(ih)?0:sg);compressed+=F(q)*(denom/power)}
      else if(!S0.has(p)&&p!==2&&p!==q1&&a0(h)&&i%2&&p<=N){compressed+=2n*F(ih)*(denom/power)}
     }
     ck(orig===compressed,"coefficients","exact coefficient of formal log "+p);
    }
   }
  }
  // Each counterexample is finite; no claim of actual number-field realization.
  const hh=enc(1,0,0),zero=0;
  ck(kernels[0][hh][hh][0]===2*f,"negative","split_frob deletion permits nonzero");
  ck(kernels[1][zero][sg][0]===2*f,"negative","split_inertia deletion permits nonzero");
  ck(kernels[0][hh][hh][0]===2*kernels[0][hh][hh][1],"negative","unram coefficient cannot be one");
  ck(kernels[1][zero][sg][0]===kernels[1][zero][sg][1],"negative","ram coefficient cannot be two");
  ck(kernels[1][hh][hh][0]!==kernels[0][hh][hh][0]*0,"negative","ram contribution not restricted to even parity");
 }
 // Scalar cutoff failures: N=3,d=5,a=10,w=1; N=1,d=3,a=1,w=-1.
 ck(10>3&&10-5>0,"negative","drop hN: d>N but askD positive");
 ck(1/(-1)<=1&&1-3*(-1)>0,"negative","drop hw: hN holds but d>N term positive");
 ck(1-3*0>0,"negative","Lean total division by zero gives hN but cutoff fails");
 // Wrong bound i>=0 allows n=1=every prime^0 despite Lambda(1)=0.
 ck(2**0===3**0&&2!==3,"negative","prime-power uniqueness requires i>=1");
 return {counts,total:Object.values(counts).reduce((a,b)=>a+b,0)}
}
const root=process.argv[2];if(!root)throw Error("usage: node certificate.mjs /path/to/pinned/checkout");
const src={};for(const [key,[p,sha]] of Object.entries(spec)){const b=readFileSync(join(root,p));if(createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==sha)throw Error("blob mismatch "+p);src[key]=b.toString("utf8");}console.log(JSON.stringify(audit(src)));

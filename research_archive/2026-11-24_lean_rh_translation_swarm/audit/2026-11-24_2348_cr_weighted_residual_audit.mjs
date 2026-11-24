/* RH AUDIT — 2026-11-24 — SOURCE-MATCHED / PARTIAL.
One contribution: authenticate CR norm/host suppliers and derive sharp occupancy-weighted residual bound in CharacterBalanceMoves.th_le.
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; latest observed 67c00ce1025a73f81a39533ac42deb47f15c4a15 (23:45:51 UTC). On latest, ChCore and Balance original paths return 404; CR 3fa2f776174aac31c30ccacf0626afd3d9d31374, host 4d4a31347e6d3e6c4b4fcf980c0a48f5d664834a, data d0498cdde8640558c61c6d342dd618e88b89f7a1, growth c09b82158a535b791e6b77be36385da52d6f3d48, thick d88784b9d8cdf3e6bf98e686b1d4c475fd013382 changed. No equivalence claimed.
Preflight SWARM_PROTOCOL first, AGENTS, research state, runner log/protocol, continuity, HANDOFF_QUEUE and checkpoint #402 PASS (45507587190; unrelated Cathedral CI, not RH validation). Peer latest audit 63fc526, math ac54d32, structure ca5a04d, dependencies 9a967ec, integration 2110dc7; reviewed their handoffs from commit patches. Root log/protocol returned 404, corrected runner locations. External blueprint not reread this run; no blueprint premise used. Direct source supplier located through PChain -> LipschitzWeightAndMinimum; StronglyIrreducible and Balance do not define CR. Lean/lake/elan absent (command -v locally); no elaboration, #print axioms, sorry census, or typed edge claim. Prior checkpoint's unlocated supplier resolved at source level.

Exact proof: write G=E0 x H with E0=Z/2 x Z/2, f=|PhiSet|=2|H|>0 (host 13–29; bal 70–96; growth 39). The character group has size 2f by CR.card_char (CR 170–174 uses AddChar.card_eq and Bal.card_G_eq), and |psi(-g)|=1. CR.norm_avg_le (188–212) assumes |S|<=f, K>=0, and for every g in S and every psi norm(F(g,psi))<=K. It does not require any arithmetic or positivity of individual real parts. Twice triangle inequality gives norm((1/f)sum_g sum_psi psi(-g)F(g,psi))<=2|S|K<=2fK. The exact first bound is sharp for arbitrary residuals: choose F(g,psi)=psi(g)K, so all terms are K. Do not infer sharpness for the specific arithmetic residual. Removing |S|<=f is invalid for the original bound: take S=G and K>0.
CR.host (147–156) sets cv=primVal D, ell=ell; GC_host (158–159) is rfl, because GC and GPsi have the same zero branch Gz and same nonzero finite sum plus y ell(psi). No change of host data. De_re (161–168) is equality of real parts: InPhi(g+topPl t) iff InPhi(g), partner=cconj+g+topPl t, psi(-g)=conj(psi(g)); substitution gives equality with the COMPLEX expression inside balTop, hence its real part. Not De=real balTop as a complex equality. Counterexample to that stronger claim: H trivial, a=1,w=1, ell(chC)=i, other nontrivial ell=0. Nontrivial GPsi at 1 equals ell, since Lambda(1)=0 and y=1; both g outside Phi have chC(g)=-1. De has imaginary part -1, whereas balTop is real. This is a counterexample to a proposed stronger universal identity under arbitrary ell, not to the native ch_balance theorem.

New refinement under EVERY original th_le premise: let S={g: not InPhi(g+topPl t)}, k=|T2|. CR.card_S_le gives |S|<=f; Bal.card_S actually gives equality. ThickAverage.thick_filter (203–210) identifies the thick subset with image of s -> ((1,0),s+u0-t) for s in T2; thick_inj (212–215) is injective. Thus exactly k thick and f-k thin positions, k<=|H|=f/2. Let L=3(x+1)(eta+1), U=(x+1)b theta. The native ChCore 105–139 derives norm(F(g,psi))<=L in thick branch and <=U in thin branch, for ALL characters. Both are nonnegative by original x>=3, b>0, eta,theta>=0. Partition the outer sum, apply the cardinality-sensitive triangle bound separately, and use the exact real difference identity (ChCore 141–151; CR.De_re and GC_host now source-matched). This yields the stronger conditional statement:
    Th.re <= De.re + 2*(k*L+(f-k)*U).
This is <=2f max(L,U) <=2f(L+U), strict against the max bound when both classes occur and L!=U. No cancellations or physical analogies asserted. Under the two original CostWindows atoms 2fL<=b/x and 2fU<=b/x, hence this is <=b/x as in prior audit; no additional final RH improvement claimed. Do not drop either original atom, the pointwise assumptions, signed real part, or normalization. k=0 is permitted here, but downstream positivity of delta2 must not be removed. Bound is sharp only in the relaxed arbitrary-residual class. In source names CR = Formalism.LFunctionChainParameters.ThickSetMeanBounds.CR, Bal = Formalism.D5.Bal. No evidence that this refinement has been kernel checked or is on the complete Main reachable path.

Tests executed in V8 using connector-returned source text with matching blob IDs: {"counts":{"anchors":48,"mutations":48,"geometry":2667,"phase":7186,"weighted":20568,"sharp":6881,"negative":16},"total":37414}. Finite exact Gaussian integer controls for H=Z/n, n=1,2,4 (all their characters explicitly enumerated); arbitrary residuals, not native analytic data. CLI below authenticates raw checkout bytes by git blob SHA before replaying identical assertions; CLI itself not run here. Mutation controls only demonstrate source-anchor sensitivity, not semantic completeness.
RESUME HERE: audit ch_balance's exact arithmetic supplier askExp and its split/unramified/ramified prime cases, especially the factor 2 and exceptional prime d. Coordinate typed extraction of CR declarations with DEP; independent Lean validation remains open.
HANDOFF TO math, dependencies, integration, editor.
AGREE with pinned CR identities and norm bound; AGREE with occupancy-weighted human refinement; DISAGREE with removing cardinality or replacing real-part equality by complex equality; PARTIAL overall.
*/
import {readFileSync} from "node:fs";
import {createHash} from "node:crypto";
import {join} from "node:path";
const spec={
  "cr": [
    "src/Formalism/SizeWindowBrackets/ChainSlopeWindows/LipschitzWeightAndMinimum.lean",
    "4012be2d32b5475bb420d1cd8da4aa1ebb4c6e6b"
  ],
  "core": [
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean",
    "878f5077bc382426c7da988e5a375b85deeaa7de"
  ],
  "host": [
    "src/Formalism/ThickAverageLoss/PartnersToFactorsAt.lean",
    "d3c1d8a4d1dcd4b282b14960b5a7b6525115e0af"
  ],
  "data": [
    "src/Formalism/SizeWindowBrackets/FirstPrimeNeSecondPrime.lean",
    "18deb7cb85d6f650a69f01fda6e0c789b9f04d89"
  ],
  "bal": [
    "src/Formalism/ThickAverageLoss/ThickAverageProofs/Balance.lean",
    "c3acda6e44e220280f69723ae7b876912ac6b3c9"
  ],
  "thick": [
    "src/Formalism/ThickAverageLoss/ThickAverageProofs/ThickAverage.lean",
    "ccf6368d2e9c84e54770204faa3996dd1fe33841"
  ],
  "growth": [
    "src/Formalism/SizeWindowBrackets/GrowthBoundGivesRiemannHypothesis.lean",
    "a3ece4b4aea97a95ba2977fa9e8d437e72677774"
  ]
};
function audit(src){
 const counts={anchors:0,mutations:0,geometry:0,phase:0,weighted:0,sharp:0,negative:0};
 function ck(p,k,msg){if(!p)throw Error(k+": "+msg);counts[k]++}
 const norm=s=>s.replace(/\s+/g," ").trim();
 const anchors={
 cr:["namespace CR","variable {H : Type} [AddCommGroup H] [Fintype H] [DecidableEq H]","cv := primVal D","ell := ell","GC (host D ell) ψ y = GPsi D ell ψ y := rfl","(De D ell a t w).re = balTop (host D ell) a t w","rw [AddChar.map_neg_eq_conj]; rfl","(Fintype.card (AddChar (E0 × H) ℂ) : ℝ) = 2 * fPl H","rw [AddChar.card_eq]","lemma fPl_pos : 0 < fPl H","(S.card : ℝ) ≤ fPl H","(K : ℝ) (hK0 : 0 ≤ K) (hK : ∀ g ∈ S, ∀ ψ, ‖F g ψ‖ ≤ K)","ψ (-g) * F g ψ‖ ≤ 2 * fPl H * K","rw [norm_mul, AddChar.norm_apply, one_mul]; exact hK g hg ψ","_ = 2 * fPl H * K := by field_simp"],
 core:["have hn := CR.norm_avg_le","CR.card_S_le t _ (Finset.Subset.refl _)","by_cases hth : IsThickAt T2 u0 (cconj + g + topPl t)","3 * A / b * (w (cconj + g + topPl t) - b) ≤ 3 * (x + 1) * (η + 1)","_ ≤ (x + 1) * b * θ := mul_le_mul_of_nonneg_right hA2 hθ","rw [CR.De_re, hTh]","rw [CR.GC_host]; ring","have hre := (abs_le.1 (le_trans (Complex.abs_re_le_norm _) hn)).1"],
 host:["abbrev E0 := ZMod 2 × ZMod 2","def InPhi (g : E0 × H) : Prop := g.1.1 = 0","def cconj : E0 × H := ((1, 1), 0)","def topPl (t : H) : E0 × H := ((0, 0), t)","def thickPl (t : H) : E0 × H := ((0, 1), t)","def PhiSet : Finset (E0 × H) := univ.filter InPhi","if ψ = 0 then ((Gz y : ℝ) : ℂ) else","(y : ℂ) * Hs.ell ψ","def balTop","GC Hs ψ (a / w (cconj + g + topPl t))).re","def IsThickAt (T2 : Finset H) (u0 : H) (ρ : E0 × H) : Prop := ρ ∈ T2.image (fun t => thickPl (t + u0))"],
 data:["def partner (t : H) (g : E0 × H) : E0 × H := cconj + g + topPl t","if ψ = 0 then ((Gz y : ℝ) : ℂ) else","(y : ℂ) * ell ψ","def De","starRingEnd ℂ (ψ g) * ((w (partner t g) : ℝ) : ℂ)","GPsi D ell ψ (a / w (partner t g))"],
 bal:["lemma card_S (t : H)","lemma card_G_eq : (Fintype.card (E0 × H) : ℂ) = 2 * ((PhiSet (H := H)).card : ℂ)","lemma phiSet_card_ne_zero : ((PhiSet (H := H)).card : ℂ) ≠ 0"],
 thick:["lemma thick_filter (T2 : Finset H) (u0 t : H)","¬ InPhi (g + topPl t) ∧ IsThickAt T2 u0 (cconj + g + topPl t)","= T2.image (fun s => ((((1 : ZMod 2), (0 : ZMod 2)), s + u0 - t) : E0 × H))","lemma thick_inj (u0 t : H)"],
 growth:["def fPl (H : Type) [AddCommGroup H] [Fintype H] [DecidableEq H] : ℝ := ((PhiSet (H := H)).card : ℝ)"]
 };
 for(const [key,arr] of Object.entries(anchors)){const s=norm(src[key]);for(const a of arr){ck(s.includes(a),"anchors",key+" "+a);ck(!s.split(a).join("__deleted_anchor__").includes(a),"mutations",a)}}
 // Exact Gaussian integer arithmetic. All groups H=Z/n, n=1,2,4 have phases in {1,i,-1,-i}.
 const I=[[1,0],[0,1],[-1,0],[0,-1]];
 const phase=(j,g,n)=>I[((2*(j[0]*g[0]+j[1]*g[1])+4/n*j[2]*g[2])%4+4)%4];
 const add=(a,b)=>[a[0]+b[0],a[1]+b[1]], mul=(a,b)=>[a[0]*b[0]-a[1]*b[1],a[0]*b[1]+a[1]*b[0]], conj=a=>[a[0],-a[1]], eq=(a,b)=>a[0]===b[0]&&a[1]===b[1],sq=a=>a[0]**2+a[1]**2;
 const mod=(a,n)=>(a%n+n)%n;
 for(const n of [1,2,4]){
   const G=[];for(let a=0;a<2;a++)for(let b=0;b<2;b++)for(let h=0;h<n;h++)G.push([a,b,h]);
   const f=2*n,S=G.filter(g=>g[0]===1), Phi=G.filter(g=>g[0]===0);
   ck(S.length===f&&Phi.length===f&&G.length===2*f&&f>0,"geometry","cardinality");
   for(const g of G)for(const j of G){const p=phase(j,g,n),q=phase(j,[-g[0],-g[1],-g[2]],n);ck(eq(q,conj(p))&&sq(p)===1,"phase","character sign/norm")}
   for(let mask=0;mask<1<<n;mask++){
     const T=Array.from({length:n},(_,i)=>i).filter(i=>(mask>>i)&1),k=T.length;
     for(let u=0;u<n;u++)for(let t=0;t<n;t++){
       const thick=g=>g[1]===0&&T.includes(mod(g[2]+t-u,n));
       const image=T.map(s=>`1,0,${mod(s+u-t,n)}`).sort();
       const actual=S.filter(thick).map(g=>g.join(",")).sort();
       ck(JSON.stringify(image)===JSON.stringify(actual),"geometry","thick_filter exact image");
       ck(new Set(image).size===k&&S.length-actual.length===f-k&&k<=f/2,"geometry","injectivity/complement");
       for(const g of S)ck((1+g[0])%2===0,"geometry","partner inPhi");
       for(let L=0;L<=4;L++)for(let U=0;U<=4;U++){
         const B=2*(k*L+(f-k)*U);
         ck(B<=2*f*Math.max(L,U)&&B<=2*f*(L+U),"weighted","implies max and sum");
         ck((L===U||k===0||k===f||B<2*f*Math.max(L,U)),"weighted","strict for nonempty both and unequal");
         let sat=[0,0],mixed=[0,0],direct=[0,0],rng=[0,0];
         for(let gi=0;gi<S.length;gi++){const g=S[gi],K=thick(g)?L:U;
           for(let ji=0;ji<G.length;ji++){const j=G[ji],p=phase(j,g,n),q=conj(p),F=mul(p,[K,0]),F2=mul(I[(gi+2*ji+mask+u+t)%4],[K,0]),F3=mul(I[(gi*ji+mask+t+u)%4],[Math.floor(K/2),Math.ceil(K/2)]);
             sat=add(sat,mul(q,F));mixed=add(mixed,mul(q,F2));rng=add(rng,mul(q,F3));direct=add(direct,mul(phase(j,[-g[0],-g[1],-g[2]],n),F2));
           }
         }
         ck(eq(sat,[f*B,0]),"sharp","sharp bound attained in arbitrary residual class");
         ck(sq(mixed)<=(f*B)**2&&sq(rng)<=(f*B)**2,"weighted","complex norms without floating point");
         ck(eq(mixed,direct),"phase","conjugate equals negative character sum");
       }
     }
   }
   // Any subset of the full group with size <= f: sharp cardinality-sensitive CR bound, K=2.
   for(let m=0;m<=G.length;m++){
     const A=G.slice(0,m);let a=[0,0];for(const g of A)for(const j of G)a=add(a,mul(conj(phase(j,g,n)),mul(phase(j,g,n),[2,0])));
     ck(eq(a,[f*4*m,0]),"sharp","general subset sharpness");
     if(m<=f)ck(a[0]<=f*4*f,"weighted","original card guard");else ck(a[0]>f*4*f,"negative","dropping cardinality fails");
   }
 }
 // De can be non-real: at y=a/w=1, choose ell(chC)=i, other nonzero ell=0.
 // For H trivial, chC(g)=-1 on both g in S; normalized imaginary part is -1.
 const g0=[[1,0,0],[1,1,0]],ch=[1,0,0];let d=[0,0];
 for(const g of g0)d=add(d,mul(conj(phase(ch,g,1)),[0,1]));
 ck(eq(d,[0,-2]),"negative","De not equal to real balTop as complex values");
 ck(2*(1*4+3*1)>2*4*1,"negative","min is not an upper bound");
 ck(2*(1*4+3*1)<2*4*4,"weighted","strict weighted improvement example");
 return {counts,total:Object.values(counts).reduce((a,b)=>a+b,0)};
}
const root=process.argv[2];if(!root)throw Error("usage: node certificate.mjs /path/to/pinned/checkout");
const src={};for(const [key,[p,sha]] of Object.entries(spec)){const b=readFileSync(join(root,p));const h=createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");if(h!==sha)throw Error("blob mismatch "+p);src[key]=b.toString("utf8");}console.log(JSON.stringify(audit(src)));

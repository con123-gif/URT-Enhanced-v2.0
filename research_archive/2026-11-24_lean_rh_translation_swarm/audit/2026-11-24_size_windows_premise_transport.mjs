/* AUDIT 2026-11-24 21:48 UTC — one result: exact premise transport size_windows_split -> ch_core -> proposition_size_bound.
SOURCE-MATCHED / PARTIAL, not an independent Lean kernel replay. Source 40e56bab026552e089d7afcfeff08d2defb9c005.
Read SWARM_PROTOCOL first, AGENTS, state, runner log/protocol, continuity, HANDOFF_QUEUE, CI #396 PASS (not RH evidence), peer commit tails fab1932,1854836,d531fdf,9e04014,8e42a6e,4cbeb4f and previous audit 5cead6e. No blueprint claims used. Root log/protocol 404 corrected to runner paths. Default branch search size_windows_split returned no results; actual import traversal ChCore -> SplitInertia -> PChain -> SChain and ErrorForms located supplier. Local lean/lake/elan absent; no print axioms, sorry census or replay. Current upstream 9282d3a102c4aff0e6026746db2a8990f5d9cddd path comparison {"growth":"changed c09b82158a535b791e6b77be36385da52d6f3d48","s":"changed f81e4ebf75f32583942eab5351cca6d3f8abc341","p":"changed 30e2932bb274be7672608577b9c8d6a3cf48c2a6","err":"changed a5629b4543f3491643a6f17d62e65518f079ca73","bound":"changed 3fa2f776174aac31c30ccacf0626afd3d9d31374","core":"NOT_FOUND: Error code: NOT_FOUND; Error: GitHub API error 404: {\"message\":\"Not Found\",\"documentation_url\":\"https://docs.github.com/rest/repos/contents#get-repository-content\",\"stat","split":"changed cb31619e10acc3effdeec94e10c89abba559f78d"}. No equivalence across revisions claimed.
Human proof: unfold SizeWindows (GrowthBoundGivesRiemannHypothesis 109–117), RestSize (SChain 53–58), errorBracketSizeWindows (ErrorFormsWeakWindowsFalse 133–135). SizeWindowsSplit (SChain 114–119) simply permutes the 16 conjuncts; PChain 23–26 uses tauto. Number conjuncts 1–16 in original order: RHS RestSize=(7,8,9,11,14), Err=(15), large-x=(1,16), remaining=(2,3,4,5,6,10,12,13). No arithmetic implication and no epsilon <= 1. At ChCore 367–370 map hSize, le_refl, hx3/h26, hε,hC, card_pos, hb,ha, card_le_univ T2,hm,hxm exactly. Err is selected as the scaled error envelope; reflexivity only verifies Err<=envelope, not that gapA equals Err. Actual gapA upper bound hTop is distinct. hx3 and h26 originate from a threshold selected before H and all arithmetic data (ChCore 343–370); keep that quantifier ordering and other hS/hThin/hCost/character hypotheses.
ChCore 426–442: G=GmA-SigA is signed, hY uses Y=G-4*x^(1/2+eps). core 283–289 supplies Q*(delta2/2)*Y<=Err+2Q/x. delta2 definition at Growth... 41 gives nT2/n with n=card H. proposition_size_bound (Lipschitz... 507 ff) then accepts the exact GrowthSizeBound inequality (Growth... 119–122) and hW, hence G<=x^(1/2+(C+3)*eps); adding SigA is valid without a sign hypothesis. No need to redo prior four-term algebra. Q>0 and delta>0 are established in that proof, not supplied by tauto. The upper cardinality nT2<=n is a real Finset fact, not an assumption about arbitrary reals.
Exact negative fixtures: deleting lower thickness allows nT2=0 and arbitrary G while the growth inequality becomes vacuous; keeping all window atoms but deleting the growth inequality also permits G above target. Boolean deletion tests are propositional controls, not claims that every conjunct is arithmetically independent. Executed in V8: {"source":22,"truth":65536,"mutations":33,"arithmetic":8}. Source blob metadata verified by connector; replay node hashes actual pinned checkout bytes.
No new authenticated kernel edges inferred. triv ID 856978 remains requested by previous lane, not expanded here. No URT/physical claims. No unrelated records modified.
RESUME HERE: audit exact source of CostWindows in ch_core/core and each of its two inequalities transported into hK (ChCore 296–301), including b>0 and signed cost terms; request outgoing typed references of size_windows_split and triv only if dependency lane has not already extracted them. HANDOFF TO math, editor, dependencies, kernel, integration. AGREE with exact premise transport; DISAGREE with treating reflexive envelope or SizeWindows alone as the growth bound; PARTIAL for full reconstruction.
*/
import {readFileSync} from "node:fs";
import {createHash} from "node:crypto";
import {join} from "node:path";
const paths={
  "growth": "src/Formalism/SizeWindowBrackets/GrowthBoundGivesRiemannHypothesis.lean",
  "s": "src/Formalism/SizeWindowBrackets/SChain.lean",
  "p": "src/Formalism/SizeWindowBrackets/ChainSlopeWindows/PChain.lean",
  "err": "src/Formalism/SizeWindowBrackets/ErrorFormsWeakWindowsFalse.lean",
  "bound": "src/Formalism/SizeWindowBrackets/ChainSlopeWindows/LipschitzWeightAndMinimum.lean",
  "core": "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean",
  "split": "src/Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean"
};
const shas={
  "growth": "a3ece4b4aea97a95ba2977fa9e8d437e72677774",
  "s": "a4bc8cecac40a1f5fd307661e151639aaf6a6efa",
  "p": "57559bc6dedbabbac7365c9f31fbbab09164edca",
  "err": "1d1d179d111b5aa668893327264648558f30fdb6",
  "bound": "4012be2d32b5475bb420d1cd8da4aa1ebb4c6e6b",
  "core": "878f5077bc382426c7da988e5a375b85deeaa7de",
  "split": "b5662cda1f3523fc53b547ee582a46bd3cd826d4"
};
function audit(src){
 let count={source:0,truth:0,mutations:0,arithmetic:0};function ck(v,k){if(!v)throw Error(k+" at "+JSON.stringify(count));count[k]++}
 const norm=s=>s.replace(/\s+/g,"");
 const body=(k,name)=>{const a=src[k].split("\n");const i=a.findIndex(x=>x.startsWith("def "+name+" " )||x.startsWith("def "+name+" :"));if(i<0)throw Error(name);let j=i+1;while(j<a.length&&a[j].trim())j++;return a.slice(i,j).join("\n").split(":=").slice(1).join(":=").trim()};
 const atoms=s=>s.split("∧").map(norm);
 const A=atoms(body("growth","SizeWindows"));
 const R=atoms(body("s","RestSize"));
 const E=norm(body("err","errorBracketSizeWindows"));
 // Independent human translation of source atom order; zero-based permutation.
 const order=[6,7,8,10,13,14,0,15,1,2,3,4,5,9,11,12];
 ck(A.length===16&&R.length===5,"source");
 ck(JSON.stringify(R)===JSON.stringify(order.slice(0,5).map(i=>A[i])),"source");
 ck(A[14]===norm("Err ≤ x ^ (C * ε) * ("+E+")"),"source");
 const rhs=norm(body("s","SizeWindowsSplit").split("↔")[1]);
 ck(rhs===norm("(RestSize ε x n nT nT2 m b k aE ∧ Err ≤ x ^ (C * ε) * errorBracketSizeWindows x ε n nT nT2 m b k aE ∧ (3 ≤ x ∧ 26 ≤ x ^ (3 * ε / 8)) ∧ (0 < ε ∧ 0 ≤ C ∧ 0 < n ∧ 0 < b ∧ 0 ≤ aE ∧ nT2 ≤ n ∧ (m : ℝ) ≤ x ^ ((1 : ℝ) / 2 + ε / 2) ∧ x * m ≤ k))"),"source");
 const anchors={p:["theorem size_windows_split : SizeWindowsSplit := by\n  intro C ε x n nT nT2 m b k aE Err\n  unfold SizeWindows RestSize errorBracketSizeWindows\n  tauto","import Formalism.SizeWindowBrackets.SChain","import Formalism.SizeWindowBrackets.ChainSlopeWindows.LipschitzWeightAndMinimum"],split:["import Formalism.SizeWindowBrackets.ChainSlopeWindows.PChain"],core:["import Development.AutomorphicArithmetic.DedekindLFunctions.SplitInertia","refine ⟨max 3 (max x₁ x₂), fun x hx => ?_⟩","(size_windows_split _ _ _ _ _ _ _ _ _ _ _).2 ⟨hSize, le_refl _, ⟨hx3, h26⟩, hε, hC,\n      Fintype.card_pos, hb, ha, Finset.card_le_univ T2, hm, hxm⟩","set G : ℝ := GmA D ell Kp c x - SigA D ell A0 Kp x with hG","have hY : (TT.card : ℝ) * (G - 4 * x ^ ((1 : ℝ) / 2 + ε))","(TT.card : ℝ) * m * b * (delta2 T2 / 2) * Y ≤ Err + 2 * (TT.card : ℝ) * m * b / x","have hc' := CharacterBalanceMoves.core A0 D S hHost ell N TT T2 a w hx3 hb hS hThin hCost hT2 hTop hY","have hz := proposition_size_bound _ _ _ _ _ _ _ _ _ _ _ G hW hc'\n  linarith"],growth:["def delta2 (T2 : Finset H) : ℝ := (T2.card : ℝ) / (Fintype.card H : ℝ)","(nT : ℝ) * m * b * (((nT2 : ℝ) / n) / 2) * (Gx - 4 * x ^ ((1 : ℝ) / 2 + ε)) ≤ Err + 2 * (nT : ℝ) * m * b / x"],bound:["theorem proposition_size_bound : GrowthSizeBound := by","have hQ : 0 < (nT : ℝ) * m * b := by positivity","have hδ0 : 0 < δ := lt_of_lt_of_le (pos _) hd2"]};
 for(const [k,ss] of Object.entries(anchors))for(const s of ss){ck(norm(src[k]).includes(norm(s)),"source");ck(!norm(src[k].replace(s,"__MUTATED__")).includes(norm(s))||!src[k].includes(s),"mutations")}
 ck(new Set(order).size===16,"source");
 for(let mask=0;mask<65536;mask++){const at=i=>Boolean(mask&(1<<i));ck(A.every((_,i)=>at(i))===order.every(at),"truth")}
 for(let i=0;i<16;i++){const mask=65535^(1<<i),at=j=>Boolean(mask&(1<<j));ck(!order.every(at)&&order.filter(j=>j!==i).every(at),"mutations")}
 // Exact rational fixture: x=2^8, eps=2,C=0,n=1024,nT=256,m=b=1,k=x,aE=0.
 // All numerical exponents here are integral powers of 2. Tests are not a substitute for source proof.
 const x=256n,n=1024n,nt=256n,m=1n,b=1n,k=x,X=2n**20n,Gmax=2n**52n,G=Gmax+1n;
 const err0=2n*n*m*m*b*x*x,den=n*n,err1=err0+k*b*x**4n/den;
 ck(x>=3n&&64n>=26n&&n>0n&&b>0n,"arithmetic");
 ck(nt*8n>=n&&m*4096n>=1n&&m<=4096n&&x*m<=k&&k*4096n<=n*n,"arithmetic");
 ck(x*x>=n&&1n<=n,"arithmetic"); // positive nT2=1 meets lower/upper thickness.
 ck(err1*den===err0*den+k*b*x**4n,"arithmetic");
 ck(G>Gmax&&G>4n*X,"arithmetic");
 // With nT2=0, all window atoms except lower thickness hold, core inequality degenerates to 0<=Err+2Q/x.
 ck(0n< n && 0n<=n && err0+2n*nt*m*b/x>=0n,"arithmetic");
 // With all size atoms present but no core inequality, G is unconstrained; the actual growth inequality fails.
 ck(nt*m*b*(G-4n*X)*x > (err1*x+2n*nt*m*b)*2n*n,"arithmetic");
 // Signed residual is not absolute: G=-1 satisfies the left upper-bound condition even for Err=0.
 ck(nt*m*b*(-1n-4n*X)<=0n,"arithmetic");
 return count;
}
const root=process.argv[2];if(!root)throw Error("usage: node certificate.mjs /path/to/pinned/checkout");
const src={};for(const [key,p] of Object.entries(paths)){const b=readFileSync(join(root,p));const h=createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");if(h!==shas[key])throw Error("blob mismatch "+p);src[key]=b.toString("utf8")}
console.log(JSON.stringify(audit(src)));

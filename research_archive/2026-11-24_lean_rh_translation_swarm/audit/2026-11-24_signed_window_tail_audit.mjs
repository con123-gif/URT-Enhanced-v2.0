/*
AUDIT lane — 2026-11-24 — REVIEW: signed-window inequality and tail quantifiers.
Pinned source 40e56bab026552e089d7afcfeff08d2defb9c005; current upstream observed 5f2c8594adf1f48032d37583118512cd7bbf3afa at 11:41:50 UTC; not substituted.
Peer: math/2026-11-24_analytic_zero_exclusion_chapter.md blob 2c296ac9e55158223fb239104a8a318f0e95f923 section 4; previous audit landau_residue_and_radius; specialist RUN5_CURRENT_HEAD_THETA_GENERALIZATION_AND_MIGRATION. Read SWARM_PROTOCOL, AGENTS, research state excerpt, nested research log/protocol, continuity, handoff, expansion and five lane checkpoints. Prior physical CI #365 PASS at 6285a46 (not RH). Root log/protocol lookup 404, corrected to nested paths; trailing-slash directory fetch incomplete JSON, corrected. First negative-control run failed because replace removed only one occurrence of a repeated anchor; corrected to remove all occurrences. Lean/lake/elan absent in container; no kernel replay or #print axioms. No transitive axiom or sorry claim.
RESULT AGREE with peer section 4, with this reconstruction of retained analytic obligations:
Let w=u^k exp(-sigma*u)/k!, h=u^k exp((2-sigma)*u)/k!, W=[U,V], u>0. For measurable real g with |g|<=C0 exp(2u), sigma>2, w nonnegative, |g|w<=C0 h. Integrability of h follows from kernel_integral with a=sigma-2>0 (or the source's split exponent bound); hence both gw and |g|w integrable. C0>=0 follows at u=0. Complex phase exp(-i gamma u) has modulus 1, uniformly for ALL real gamma. D_k from landau_coeff requires locally equal Laplace functions on Re(s)>2, not point equality; differentiation uses radius (Re(s)-2)/2 and common integrable u^(k+1)exp(-radius*u) majorant (times C0). Then |D_k(sigma+i gamma)|+Re D_k(sigma) <= integral (|g|+g)w. On W, 0<=R and g<=R imply |g|+g=2 max(g,0)<=2R, and w<=exp(-theta*u)/(sigma-theta)^k for theta<sigma. Off W use |g|+g<=2|g|. U>0 ensures W subset of (0,infty); integrability of R exp(-theta*u) is explicit. Splitting integral gives landau_window_ineq, NOT an unsigned transform bound.
Tail proof: s0=sigma-2; for l>=0 with l<s0, outside [U,V] at least one of exp(l*(u-V)), exp(l*(U-u)) >=1. Integrate both tilted kernels over positive half-line to get exp(-l V)/(s0-l)^(k+1)+exp(l U)/(s0+l)^(k+1). For a,sigma>0, log(sigma/a)<= (sigma-a)/a, so x+k*(sigma-a)/a<=c implies exp(x)/a^(k+1)<=exp(c)/(a*sigma^k).
For delta>0 choose l=2+6/delta, M=l*(1+delta), sigma=M*(2+l), a=sigma-2-l>0, b=sigma-2+l>0; k=ceil((1+delta/2)*sigma*U) for U>=1, V=(1+delta)*U. Then k>=U, (sigma-a)/a=1/(M-1), (1+delta/2)*sigma=M*(M-1), (1+delta/2)*(l-2)=l+1. Upper exponent -l V+k/(M-1)<=1 using k<x+1 and M-1>=1. Lower exponent l U-k*(l-2)/b<=0 because l*b<= (l+1)*sigma (sigma>l*(2+l)>l*(l-2)). Thus tails<=C/sigma^k with C=e/a+1/b independent of U. Gives one selected k per U, not every k. In landau_window_key choose sigma,C first; for every eta>0,U0 choose U>=max(U0,1) and R by hW, then k by tails BEFORE introducing gamma. Using 0<theta<1 and exp(eta U)>=1, replace C/sigma^k by |C|exp(eta U)/(sigma-theta)^k. Final constant 2+2*C0*|C|. Uniform gamma is essential because the geometric pole determines a particular gamma.
DISAGREE with hypothetical removal of signed real term: g=-1 everywhere, sigma=3,theta=1/2,U=1/100,V=5,R=0,C0=1,k=0,gamma=0 satisfy local window inequality premises (not claimed PoleData family). D0(3)=-1/3; |D0|+Re D0=0. Unsigned bound would require 1/3<=2*(1-exp(-.01)+exp(-5))<.04, false since exp(-x)>=1-x and exp(5)>100 by Taylor terms through degree 6. Also |g|<=R fails. Exact counterexample, not floating point.
DISAGREE with strengthening tail estimate to all k>=U: fix U>=1,V=(1+delta)U,sigma>2, a=sigma-2. Integral tail on [V,infty) >= exp(-a V)/a^(k+1) by shifting u=V+v and (V+v)^k>=v^k. Therefore sigma^k times tail diverges at least as exp(-a V)/a*(sigma/a)^k. No finite C works for all k. Swapping universal gamma with existential k is not a logic equivalence: P(k,gamma): k>|gamma| has witness k>=U per gamma but none simultaneously for all gamma.
Executed V8 connector source checks (returned blob IDs matched; not independent byte hash) and exact BigInt rational regression: {"total":50517,"source":48,"tails":43776,"tailParameterCases":14400,"signedChecks":3384,"negativeSourceControls":7,"otherAssertions":3309}. Source anchors verify presence, not elaborated dependencies or logical sufficiency. Negative controls remove all occurrences of one premise anchor from each source. Finite tests supplement algebra above, not an RH proof. No URT advantage asserted, no physical gate edits.
Replay: node this_file.mjs /path/to/local/RH-git-checkout. Local Node replay not run; V8 audit function actually executed. Source byte hash checked by replay only.
RESUME HERE: independently audit pinned WindowHypOfRpow -> WindowHypU conversion, especially negative C, Y>=1, logarithmic change of variables, measure and quantifier scope; compare current head only under separate SHA.
HANDOFF TO: integration, math, landau criterion, audit, editor.
Overall PARTIAL, local signed window and tail derivation AGREE.
*/
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
const pin="40e56bab026552e089d7afcfeff08d2defb9c005",prefix="src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/",ledger=[
  [
    "landauTails.lean",
    "0e55797bac5320acf02d9acc832ca53df716e436",
    [
      "(hl : 0 ≤ l) (hs : l < s)",
      "Ioi (0 : ℝ) \\ Icc U V",
      "(h : x + k * ((σ - a) / a) ≤ c)",
      "Real.add_one_le_exp",
      "(hδ : 0 < δ)",
      "∀ U : ℝ, 1 ≤ U → ∃ k : ℕ, U ≤ k",
      "2 + 6 / δ",
      "M = l * (1 + δ)",
      "σ = M * (2 + l)",
      "⌈(1 + δ / 2) * σ * U⌉₊",
      "M * (M - 1)",
      "(1 + δ / 2) * (l - 2) = l + 1"
    ]
  ],
  [
    "landauWindowIneq.lean",
    "cda93b0185260d72395d2ef2c90314e0fa7128ef",
    [
      "(hg : Measurable g)",
      "|g u| ≤ C₀ * Real.exp (2 * u)",
      "(hσ : 2 < σ) (hθ : θ < σ) (hU : 0 < U)",
      "(hR : IntegrableOn",
      "0 ≤ R u ∧ g u ≤ R u",
      "(k : ℕ) (γ : ℝ)",
      "norm_integral_le_integral_norm",
      "integral_inter_add_diff",
      "|g u| + g u ≤ 2 * R u",
      "integral_complex_ofReal",
      "landau_kernel_max",
      "rw [hM]"
    ]
  ],
  [
    "LandauKernelMax.lean",
    "b230a9e40c3710eac205f32ceb8a44f2d003b647",
    [
      "(ha : 0 < a) (hu : 0 ≤ u)",
      "Real.pow_div_factorial_le_exp"
    ]
  ],
  [
    "IteratedDerivLaplace.lean",
    "c1c05ec801b258064f1e14fb9d7e624eb7345382",
    [
      "(hz : 2 + b ≤ z.re)",
      "set δ := (s.re - 2) / 2",
      "∀ z ∈ Metric.ball s δ",
      "hasDerivAt_integral_of_dominated_loc_of_deriv_le",
      "(hg : Measurable g)",
      "(hs : 2 < s.re)",
      "hev.deriv_eq"
    ]
  ],
  [
    "LandauCoeff.lean",
    "dc8287f2dbe7c767dcb77893eaf53d07092ed1f3",
    [
      "(hs : 2 < s.re)",
      "hev.iteratedDeriv_eq k",
      "iteratedDeriv_laplace"
    ]
  ],
  [
    "kernelIntegral.lean",
    "d785c54e03a55b0ef6c0fcb64bc4f8158e803642",
    [
      "(ha : 0 < a)",
      "Real.Gamma_nat_eq_factorial"
    ]
  ],
  [
    "landauWindow.lean",
    "7915058f10b33a52652290cd887cbccdc00e676a",
    [
      "(hθ : 0 < θ) (hθ1 : θ < 1) (hδ : 0 < δ)",
      "∃ k : ℕ, U ≤ k ∧ ∀ γ : ℝ",
      "landau_tails hδ",
      "max U₀ 1",
      "fun γ =>",
      "landau_window_ineq",
      "landau_coeff hP k",
      "have h1 := hb γ",
      "have h1 := hb 0",
      "2 + 2 * C₀ * |C|"
    ]
  ]
];
function audit(ledger,sources){
 let total=0;const ck=(v,m)=>{if(!v)throw Error(m);total++};
 for(const [p,sha,patterns] of ledger)for(const t of patterns)ck(sources[p].includes(t),p+": "+t);
 const source=total;
 const Q=(n,d=1n)=>{if(d<=0n)throw Error("denominator");return [BigInt(n),BigInt(d)]};
 const add=(a,b)=>Q(a[0]*b[1]+b[0]*a[1],a[1]*b[1]),neg=a=>Q(-a[0],a[1]),sub=(a,b)=>add(a,neg(b)),mul=(a,b)=>Q(a[0]*b[0],a[1]*b[1]),div=(a,b)=>b[0]<0n?Q(-a[0]*b[1],-a[1]*b[0]):Q(a[0]*b[1],a[1]*b[0]),le=(a,b)=>a[0]*b[1]<=b[0]*a[1],lt=(a,b)=>!le(b,a),eq=(a,b)=>le(a,b)&&le(b,a);
 const z=Q(0n),one=Q(1n),two=Q(2n),six=Q(6n);
 let cases=0;
 for(let p=1n;p<=12n;p++)for(let q=1n;q<=12n;q++){
  const delta=Q(p,q),l=add(two,div(six,delta)),M=mul(l,add(one,delta)),s=mul(M,add(two,l)),a=sub(sub(s,two),l),b=add(sub(s,two),l),half=add(one,div(delta,two));
  ck(lt(two,l)&&lt(l,M)&&lt(z,a)&&lt(z,b)&&lt(two,s),"positive rates");
  ck(eq(div(sub(s,a),a),div(one,sub(M,one))),"upper tilt identity");
  ck(eq(mul(half,s),mul(M,sub(M,one))),"ceiling scale identity");
  ck(eq(mul(half,sub(l,two)),add(l,one)),"lower tilt identity");
  for(let r=1n;r<=20n;r++)for(let t=1n;t<=5n;t++){
   const U=add(one,Q(r,t)),x=mul(mul(half,s),U),k=Q((x[0]+x[1]-1n)/x[1]),V=mul(add(one,delta),U);
   ck(le(U,k)&&le(x,k)&&lt(k,add(x,one)),"ceil range");
   ck(le(add(neg(mul(l,V)),mul(k,div(sub(s,a),a))),one),"upper exponent <=1");
   ck(le(add(mul(l,U),mul(k,div(sub(s,b),b))),z),"lower exponent <=0");cases++;
  }
 }
 const tails=total-source;
 for(let g=-15;g<=15;g++)for(let R=0;R<=15;R++)if(g<=R)for(let w=0;w<=8;w++)ck((Math.abs(g)+g)*w<=2*R*w,"signed window majorant");
 const signedChecks=total-source-tails;
 let term=one,sum=one;for(let i=1n;i<=6n;i++){term=div(mul(term,Q(5n)),Q(i));sum=add(sum,term)}
 ck(lt(Q(100n),sum),"e^5>100 by positive Taylor terms");
 ck(lt(Q(4n,100n),Q(1n,3n)),"twice tails < .04 < |D0(3)|");
 ck(eq(add(Q(1n,3n),Q(-1n,3n)),z),"signed original holds");
 ck(-1<=0&&Math.abs(-1)>0,"one-sided does not imply absolute");
 for(let j=0n;j<64n;j++)ck(3n**(j+1n)>3n**j,"all-k tail lower bound increasing");
 for(let u=0;u<40;u++)for(let g=-40;g<=40;g++){const k=Math.max(u,Math.abs(g)+1);ck(k>=u&&k>Math.abs(g)&&!(k>Math.abs(k)),"quantifier countermodel")}
 let rejected=0;
 for(const [p,sha,patterns] of ledger){let m={...sources,[p]:sources[p].split(patterns[0]).join("REMOVED_GUARD")};try{for(const [name,_,a] of ledger)for(const t of a)if(!m[name].includes(t))throw Error("missing");}catch{rejected++}}
 ck(rejected===ledger.length,"negative source controls");
 return {total,source,tails,tailParameterCases:cases,signedChecks,negativeSourceControls:rejected,otherAssertions:total-source-tails-signedChecks};
}
const root=process.argv[2];if(!root)throw Error('supply local RH git checkout');
const sources={};for(const [p,sha] of ledger){const b=execFileSync('git',['-C',root,'show',pin+':'+prefix+p]);const h=createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex');if(h!==sha)throw Error('blob mismatch '+p);sources[p]=b.toString('utf8');}console.log(JSON.stringify(audit(ledger,sources),null,2));

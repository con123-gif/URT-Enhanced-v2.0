/*
RH AUDIT run 6 — multiplicative/logarithmic window transport, 2026-11-24.
RESULT: REVIEW / SOURCE-MATCHED, human algebra, finite exact regression. AGREE with pinned
windowHyp_of_rpow and windowHypU_of_windowHyp; DISAGREE with dropping absolute value,
Jacobian, cutoff dependence, or downstream strict hypotheses. PARTIAL full reconstruction.

Preflight: read SWARM_PROTOCOL then AGENTS, research state, runner log/protocol, continuity,
HANDOFF_QUEUE and recent peer checkpoints: audit 3649b82, math 46f0404, structure b6ac393,
integration 0302d91, dependencies 5235658, Landau d22ac89, prime 1073765, theta 4565b3a,
Galois 090ed61, character boxes 6a00797, literature 4b1807f. Blueprint synopsis in queue
read, original PDF not reopened. Latest Cathedral summary #368 PASS (45391033412), not RH
kernel verification. No change to physical records.

Pinned source: 40e56bab026552e089d7afcfeff08d2defb9c005. See ledger for exact paths and blob IDs.
Let theta be any real, delta>0, C any real. Assume for EVERY real cutoff Y0 there exists
a real Y>=Y0 such that Gm F(y)<=C*y^theta for ALL y in [Y,Y^(1+delta)].
For each eta>0 and requested cutoff Y0, K=|C|*delta>=0, a=eta/2>0.
Since Y^a tends to infinity, choose Y1 so every Y>=Y1 has Y>=1 and Y^a>=K/a.
Use original hypothesis at max(Y0,Y1), NOT an arbitrary small Y. For its witness,
K log Y <= (K/a)Y^a <= Y^(2a)=Y^eta. Here log Y <= Y^a/a and positivity
are the actual dependencies, not a fitted cutoff. Choose R(y)=|C| y^theta.
For y in the interval y>0, R>=0 and Gm<=C*y^theta<=R. No lower bound on Gm
or absolute bound on Gm is asserted. R(y)*y^(-theta-1)=|C|/y, continuous on
the closed positive interval, hence integrable. Integral is |C| delta log Y
<=Y^eta, including Y=1 (singleton, zero Lebesgue measure). This proves WindowHyp.
No sign restriction on C or theta here; the later lemmaL requires 0<theta<1.

For any eta>0 and U0 real use WindowHyp at Y0=exp U0. Its witness Y>0;
U=log Y>=U0, R_U(u)=R(exp u). Real.exp is injective, differentiable with
derivative exp u, strictly positive. It maps the entire Icc(U,(1+delta)U)
onto Icc(Y,Y^(1+delta)), including empty intervals when U<0. The derivative
absolute value is exp u. Change of variables for Lebesgue set integrals:
  int R(y)y^(-theta-1) dy = int R(exp u) exp(-theta*u) du.
The integrability equivalence is a separate imported theorem, not deduced from
a finite numerical equality. The pointwise majorant transfers with gm F(u)=Gm F(exp u).
Y^eta=exp(eta U), so this proves WindowHypU. General conversion needs Y>0,
not Y>=1, while the power-bound producer selects Y>=1 and the Landau consumer
chooses max U0 1. Preserve all quantifiers eta>0 -> all cutoffs -> exists witness
and envelope; the hypothesis h on rpow windows itself does not depend on eta.
Retain CharFamily finite index, positive weights, modulus nonzero, admissibility.
lemmaL additionally invokes poleData, landau_window and one_le_re nonvanishing.
No proof of these dependencies is implied by this transport.

Counterexamples to simplifications (generic envelope examples, not claims about actual Gm):
1. C=-1, g(y)=-2*y^theta: choosing C*y^theta fails required nonnegativity.
2. R=y^theta, Y=2, delta=1: correct integral log 2; omitting Jacobian in
original integrand after substitution gives integral exp(-u) du=1/4.
3. g(y)=y^theta, delta=1 and Y>=4: any admissible R has weighted integral
>=log Y>=log 4>1. A SINGLE Y working for all eta>0 would force <=1 by eta->0.
The original quantifier ordering avoids that false strengthening.
4. Y=1 is allowed and endpoints coincide; Y<1 is possible for general WindowHyp
but its interval is empty. delta=0 permits trivial singleton windows, so cannot
replace delta>0 in the zero-free theorem.

Executed in V8 connector runtime: {"source":47,"threshold":45000,"jacobian":5472,"integral":5733,"domain":901,"negative":6,"mutations":6,"total":57165}. Six blob IDs compared
to connector metadata. All finite arithmetic checks exact BigInt rational, using
2/3<log2<=25/36 (positive atanh series bound); no quadrature or floating-point
proof claims. Regression examples sample theta integers only; human derivation
covers arbitrary real theta. Source mutation controls are anchor-level only.
Reproduce: node <this-file> <local upstream checkout with pinned commit>.
Node replay not executed here; actual function above executed in V8. lean/lake
not on local PATH; no #print axioms or elaboration. No hidden axiom absence claim.
Current upstream SHA 26c37b400bc9cfd43c81d798aa5e798af5c55b94: old two window
theorem paths return 404; directory listing confirms absent. Current CharFamily
and LandauZeroFreeCriterion retain WindowHyp/WindowHypU definitions (blobs
cac521ab291c9dab261508613d4d12195cdfb799, f4c5124f8a0188f85b60b2687864d531f9c0a3d8).
Current Main uses Claim.zeta rather than rhOfAll; no equivalence or relocation
assertion. Failed preflight root RESEARCH_LOG/PROTOCOL paths 404, corrected to
runner paths. No other failed tests. No URT advantage or physical analogy.

RESUME HERE: audit pinned CharFamilyLFunctionNeZeroOfOneLeRe.lean and its exact
boundary s.re=1 / principal modulus-one treatment in lemmaL, cross-check the
prior pole regularization certificate and preserve all named Mathlib premises.
HANDOFF TO integration, editor, landau criterion, math, audit. Project OPEN.
*/
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
const pin="40e56bab026552e089d7afcfeff08d2defb9c005", prefix="src/Development/AutomorphicArithmetic/DedekindLFunctions/";
const ledger=[
  [
    "CharFamily.lean",
    "81c8dfd66d910d083d5bc88c664c7917fdbdfe96",
    [
      "def WindowHyp",
      "∀ η : ℝ, 0 < η → ∀ Y₀ : ℝ, ∃ Y : ℝ, Y₀ ≤ Y ∧ ∃ R : ℝ → ℝ",
      "R y * y ^ (-θ - 1)",
      "0 ≤ R y ∧ Gm F y ≤ R y",
      "≤ Y ^ η"
    ]
  ],
  [
    "LandauZeroFreeCriterion.lean",
    "54fd0de979e0dad6ac7709ad8ecbec8a29e21872",
    [
      "def gm (F : CharFamily) (u : ℝ) : ℝ := Gm F (Real.exp u)",
      "def WindowHypU",
      "∀ η : ℝ, 0 < η → ∀ U₀ : ℝ, ∃ U : ℝ, U₀ ≤ U ∧ ∃ R : ℝ → ℝ",
      "R u * Real.exp (-θ * u)",
      "0 ≤ R u ∧ g u ≤ R u",
      "≤ Real.exp (η * U)"
    ]
  ],
  [
    "LandauTheorems/WindowHypOfRpow.lean",
    "dde1c159371538875c28374574ca7e452b0450d9",
    [
      "(hK : 0 ≤ K) (hη : 0 < η)",
      "tendsto_rpow_atTop h2",
      "Real.log_le_rpow_div hY0.le h2",
      "(hδ : 0 < δ)",
      "∀ Y₀ : ℝ, ∃ Y : ℝ, Y₀ ≤ Y",
      "Gm F y ≤ C * y ^ θ",
      "(|C| * δ) η",
      "h (max Y₀ Y₁)",
      "1 ≤ Y",
      "fun y => |C| * y ^ θ",
      "le_abs_self C",
      "Real.rpow_add hy0",
      "integrableOn_congr_fun heq measurableSet_Icc",
      "integral_Icc_eq_integral_Ioc",
      "integral_inv_of_pos",
      "|C| * δ * Real.log Y"
    ]
  ],
  [
    "LandauTheorems/WindowHypUOfWindowHyp.lean",
    "701f0502ae106ab89e390105cd9c98e6cf881e1a",
    [
      "Real.exp '' Icc a b = Icc (Real.exp a) (Real.exp b)",
      "Real.exp_log hy",
      "|Real.exp u| • (R (Real.exp u) * Real.exp u ^ (-θ - 1))",
      "R (Real.exp u) * Real.exp (-θ * u)",
      "h η hη (Real.exp U₀)",
      "have hYpos : 0 < Y",
      "Real.rpow_def_of_pos hYpos",
      "HasDerivWithinAt Real.exp (Real.exp x)",
      "Real.exp_injective.injOn",
      "fun u => R (Real.exp u)",
      "integrableOn_image_iff_integrableOn_abs_deriv_smul",
      "integral_image_eq_integral_abs_deriv_smul",
      "≤ Y ^ η := hbound",
      "Real.exp (η * Real.log Y)"
    ]
  ],
  [
    "LandauTheorems/ZeroFreeOfRpowWindow.lean",
    "2ed00ad3aa862f3e522686557fb8f559b17fc002",
    [
      "(hθ : 0 < θ) (hθ1 : θ < 1) (hδ : 0 < δ)",
      "lemmaL F hθ hθ1 hδ (windowHyp_of_rpow F hδ h)"
    ]
  ],
  [
    "LandauTheorems/lemmaL.lean",
    "6c37aebd05121b6d68e3532d8529f0ce8357386f",
    [
      "(hθ : 0 < θ) (hθ1 : θ < 1) (hδ : 0 < δ)",
      "poleData F",
      "landau_window hP hθ hθ1 hδ (windowHypU_of_windowHyp F hδ h)",
      "by_cases h1 : 1 ≤ s.re"
    ]
  ]
];
function audit(ledger,sources){
 const counts={source:0,threshold:0,jacobian:0,integral:0,domain:0,negative:0,mutations:0};
 function ck(b,k,m){if(!b)throw Error(k+": "+m);counts[k]++}
 for(const [p,sha,anchors] of ledger)for(const a of anchors)ck(sources[p].includes(a),"source",p+" "+a);
 const Q=(n,d=1n)=>{n=BigInt(n);d=BigInt(d);if(d<=0n)throw Error("nonpositive denominator");return [n,d]};
 const add=(a,b)=>Q(a[0]*b[1]+b[0]*a[1],a[1]*b[1]),mul=(a,b)=>Q(a[0]*b[0],a[1]*b[1]),le=(a,b)=>a[0]*b[1]<=b[0]*a[1],eq=(a,b)=>le(a,b)&&le(b,a),lt=(a,b)=>!le(b,a),sub=(a,b)=>add(a,Q(-b[0],b[1]));
 const z=Q(0),one=Q(1),pow2=n=>n>=0?Q(2n**BigInt(n)):Q(1n,2n**BigInt(-n));
 // log 2 = 2 sum_{j>=0} (1/3)^(2j+1)/(2j+1).
 // first term=2/3; remainder <= (2/3)*(1/27)/(1-1/9)=1/36.
 const L=Q(2,3),H=add(L,Q(1,36));
 ck(lt(L,H)&&lt(H,Q(3,4)),"domain","certified log2 bracket");
 for(let c=-12;c<=12;c++)for(let p=1;p<=5;p++)for(let d=1;d<=5;d++)for(let q=1;q<=8;q++){
   const K=Q(Math.abs(c)*p,d);
   let m=2*q*d;
   while(!le(mul(K,Q(2*q)),pow2(m/(2*q))))m+=2*q*d;
   for(let extra=0;extra<3;extra++){
    const n=m+extra*2*q*d;
    ck(n>=1&&n*p%d===0,"threshold","positive Y and integral endpoint exponent");
    ck(le(mul(K,Q(2*q)),pow2(n/(2*q))),"threshold","eventual cutoff witness");
    ck(le(mul(mul(K,Q(n)),H),pow2(n/q)),"threshold","certified upper bound K log Y <= Y^eta");
   }
 }
 for(let theta=-4;theta<=4;theta++)for(let j=-6;j<=12;j++)for(let a=0;a<=3;a++)for(let b=0;b<=3;b++){
   const r=mul(pow2(j*theta),add(Q(a),mul(Q(b),pow2(j))));
   const old=mul(r,pow2(j*(-theta-1))), transformed=mul(r,pow2(-theta*j));
   ck(eq(mul(pow2(j),old),transformed),"jacobian","exact weighted integrand, rational powers");
   ck(eq(transformed,add(Q(a),mul(Q(b),pow2(j)))),"jacobian","independent affine exponential");
 }
 // Symbolic integral represented as A*log2+B, exact on endpoints 2^m,2^(m+d).
 for(let m=0;m<=12;m++)for(let d=0;d<=8;d++)for(let a=0;a<=6;a++)for(let b=0;b<=6;b++){
   const viaY=[Q(a*(m+d)-a*m),sub(mul(Q(b),pow2(m+d)),mul(Q(b),pow2(m)))];
   const viaU=[Q(a*d),mul(mul(Q(b),pow2(m)),sub(pow2(d),one))];
   ck(eq(viaY[0],viaU[0])&&eq(viaY[1],viaU[1]),"integral","independent antiderivative endpoints");
 }
 for(let m=-12;m<=12;m++)for(let p=1;p<=6;p++)for(let d=1;d<=6;d++){
   // exp monotonic; compare exponent numerators before exponentiating.
   ck((m*d<=m*(d+p))===(m>=0),"domain","Icc nonempty iff log Y >=0 for positive delta");
 }
 ck(lt(Q(1,4),L),"negative","missing Jacobian: [2,4], R=y^theta, wrong integral 1/4 vs log2");
 ck(lt(Q(-1),z)&&le(Q(-2),Q(-1)),"negative","C=-1 envelope not nonnegative even if g=-2 <= C");
 ck(lt(Q(1),mul(Q(2),L)),"negative","same Y>=4 for all eta impossible for constant log integrand; limit <=1");
 ck(lt(pow2(-1),one)&&!le(one,pow2(-1)),"negative","Y=1/2 is positive but below 1");
 ck(eq(sub(pow2(0),pow2(0)),z),"negative","Y=1 degenerate window integral zero; strict endpoint invalid");
 ck(!le(Q(1),Q(0)),"negative","delta=0 gives vacuous zero-integral window, cannot replace positive delta");
 for(const [p,_,anchors] of ledger){const mutated=sources[p].split(anchors[0]).join("REMOVED");ck(!mutated.includes(anchors[0]),"mutations","missing source anchor rejected "+p);}
 return {...counts,total:Object.values(counts).reduce((a,b)=>a+b,0)};
}
const root=process.argv[2];if(!root)throw Error('provide pinned upstream git checkout');const sources={};for(const [p,sha] of ledger){const b=execFileSync('git',['-C',root,'show',pin+':'+prefix+p]);if(createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex')!==sha)throw Error('blob mismatch '+p);sources[p]=b.toString('utf8');}console.log(JSON.stringify(audit(ledger,sources),null,2));

# RUN19 — Jacobi theta kernel and weak-to-strong Mellin endpoint construction
2026-11-25. DONE for the following source-matched human derivation, not a Lean replay, not a full RH proof, not an URT performance claim.

## Provenance and continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, state/log/protocol and continuity excerpts, latest physics CI summary #407 at 01:06:19Z (not RH validation), RUN18, recent commit titles and peer handoffs for all fourteen other lanes. No duplicate in inspected handoffs. Linked external blueprint and all peer full files not reopened. No physics gates modified.
RH source P=40e56bab026552e089d7afcfeff08d2defb9c005; H=4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061, upstream head retrieved at this run, commit timestamp 2026-11-25T01:15:19Z, merge PR #1739. Advanced from RUN18 b2f365a68500e2bde98cd60a2324263fc62fba10. lake-manifest.json blobs b4d1ec31575a26b2159ec3a262b482bc051f3f6f / 8a747b58a34565cc6cb5341b86544aa5d3a20a2d. Mathlib pins M=0df444a360eaa60ab8c11dca51a86af692955474, N=31ce06eaadf4a200c0e1407c5f10953cf606b8f8 unchanged.
Four source files retrieved at both pins from leanprover-community/mathlib4 (GitHub blob identifiers, not locally rehashed):
- Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean a7edac6433ba93905d9c00a95aa40bb9d9f3971e / e7ed2963d808e77e1ceb6529914a1bb90bebd6f4
- Mathlib/NumberTheory/ModularForms/JacobiTheta/Bounds.lean da0999ad54bcd20af5504da9a02aa6ea6ece1d02 / 4d476be4787e480afbc812907afbb7c9291b8e6b
- Mathlib/NumberTheory/LSeries/HurwitzZetaEven.lean e24ca61b0261ee1627bdeaeaaac8ef7bcec437ba / a0400d8fa1146d9856caa4f554d940eb30dfa55f
- Mathlib/NumberTheory/LSeries/AbstractFuncEq.lean ada6574d2ed7e3d0b1122376c3bb8581f6385a1d / 26754c1f2894ba79f8fa729dc18e1f0fc0189997
Exact text equality: TwoVariable M420–494 = N421–495; Bounds M75–82,132–148,239–247 identical; Hurwitz M132–153,163–215,223–229,254–276 = N+2; Abstract M217–232,247–315 = N+2. Five inspected blocks differ in tactic/name text only: Bounds 115–122 exp_nat_mul→exp_natCast_mul; 124–130 convert!→convert; 249–264 if_false→ite_false; Hurwitz 232–244 (N+2) if_false→ite_false; Abstract 150–169 (N+2) IsBigO expansion→isBigO_iff and convert!→convert. No changed statements in these blocks; no global equivalence or elaborated reachability claimed.

## 1. The actual theta functional equation
TwoVariable M465–490, jacobiTheta₂_functional_equation. Define theta(z,tau)=sum over integers n of exp(pi i n² tau+2 pi i n z). For Im(tau)>0, Gaussian decay dominates the linear term in n, giving absolute convergence. Native proof uses tsum_exp_neg_quadratic with Re(-i tau)>0, then completes the square and factors the common exponential. This is the Poisson Gaussian identity (import Mathlib/Analysis/SpecialFunctions/Gaussian/PoissonSummation.lean, not yet expanded in this lane).
theta(z,tau)=(-i tau)^(-1/2) exp(-pi i z²/tau) theta(z/tau,-1/tau), with principal complex power. When Im(tau)<=0 the native theta is totalized to zero; Im(-1/tau)<=0 (also at tau=0 with Lean division), so both sides zero. This is not a convergent series assertion in the lower half-plane.
HurwitzZetaEven M132–153 evenKernel_functional_equation, M163–215 summation formulas: for real representative a and t>0,
 E_a(t)=sum_n exp(-pi (n+a)² t)=exp(-pi a²t)theta(ai t,it);
 C_a(t)=sum_n exp(2 pi i n a)exp(-pi n²t)=1+2 sum_{n>=1} cos(2 pi n a)exp(-pi n²t).
Both periodic in a modulo 1 (integer reindexing, or periodic phase). C is real by pairing n,-n; continuity on t>0 follows from locally uniform Gaussian domination or native continuousAt_jacobiTheta₂ (M116–130). Insert tau=it and z=ait: z/tau=a, -1/tau=i/t, -i tau=t>0, -pi i z²/tau=+pi a²t. The exponent cancels exactly with the prefactor of E, yielding E_a(t)=t^(-1/2) C_a(1/t); equivalently E_a(1/t)=sqrt(t) C_a(t). For t<=0 native kernels vanish, including t=0 via totalized inverse; analytic manipulations only for positive t.

## 2. Explicit exponential decay, including the discontinuity at a=0
Bounds M75–82,115–148,239–264; Hurwitz M183–215,223–244. Choose unique a in [0,1). For b>=0, n>=0, (n+b)²>=n+b², since n²>=n and 2nb>=0. With q=exp(-pi t) in (0,1),
 F(b,t)=sum_{n>=0}exp(-pi(n+b)²t)<=exp(-pi b²t)/(1-q).
 For b=0 remove n=0; F(0,t)-1=F(1,t)<=q/(1-q).
 Split integer sum via n>=0 and n=-m-1, m>=0: E_a=F(a,t)+F(1-a,t). Exactly one constant term occurs if a=0, never for 0<a<1. The cosine kernel always has constant 1. Thus c_a=1 if a=0 in R/Z, else 0. Native combines the two positive rates via min, and uses |cos|<=1 for C.
 Additional explicit bounds (human derivation from the native comparisons): set d(a)=1 if a=0, otherwise min(a,1-a)>0. For every t>0,
 exp(-pi d(a)² t) <= E_a(t)-c_a <= 2 exp(-pi d(a)²t)/(1-exp(-pi t)),
 |C_a(t)-1| <= 2 exp(-pi t)/(1-exp(-pi t)).
 Lower bound is a single nearest nonconstant summand (two at a=0 or a=1/2, but one sufficient). Therefore the maximal possible exponential rate for E_a-c_a at fixed a is exactly pi d(a)²: any larger p would imply exp((p-pi d²)t)<=constant for all large t, impossible. At a=0 the rate is pi; arbitrarily small positive a forces the rate to approach 0. No uniform positive rate over the full circle even allowing the big-O constant and threshold to depend on a. Stronger than mere existence of a rate, not a new RH result. Uniform estimates require staying a positive distance from nonzero representatives tending to 0 or 1; the exact a=0 case can be treated separately.
 For t>=1 the denominator is bounded below by 1-exp(-pi)>0. For every fixed real r and fixed p>0, e^(-pt)=O(t^r) since r log(t)+pt→+infinity. Constants and threshold may depend on a and r. This is the exact all-real-power quantifier in Hurwitz M254–276; not uniform in a or r. Continuity provides local integrability on (0,infinity), not integrability at zero. Weak FE pair fields k=1/2>0, eps=1!=0, f=E_a, g=C_a, f0=c_a, g0=1. No zero-free statement used.

## 3. Weak-to-strong construction and endpoint powers
AbstractFuncEq M80–95,107–129,150–169,247–315,217–232. Let E be a complex normed additive group with complex scalar action as native; completeness required for Mellin integrals in RUN18. Weak pair: k>0, eps!=0, f,g locally integrable on positive reals; both errors f-f0,g-g0 are O(x^r) at infinity for each real r; f(1/x)=eps*x^k g(x) for x>0. The symmetric equation g(1/x)=eps^(-1)*x^k f(x) follows by replacing x with 1/x and dividing by the nonzero eps*x^(-k).
Define F(x)=f(x)-f0 for x>1; f(x)-eps*x^(-k)g0 for 0<x<1; zero elsewhere including x=1. Define G(x) symmetrically with f,g and f0,g0 swapped and eps inverted. These are locally integrable: on any positive compact interval x^(-k) is continuous bounded; indicators of open intervals are measurable; subtraction, multiplication by indicator, addition preserve local integrability. No integrability near 0 assumed.
Modified equation F(1/x)=eps*x^k G(x):
- x>1: F(1/x)=f(1/x)-eps*x^k g0=eps*x^k(g(x)-g0).
- 0<x<1: F(1/x)=f(1/x)-f0=eps*x^k(g(x)-eps^(-1)x^(-k)f0).
- x=1: both modified values zero by construction. This value is needed for the exact pointwise identity; modifying on a singleton does not affect Mellin integrals.
At infinity, F=f-f0, G=g-g0 eventually, so all real-power decay inherited. At zero, F(x)=eps*x^(-k)(g(1/x)-g0). For arbitrary real r, apply g's infinity bound with r'=-(r+k); as x→0+,
 ||F(x)||<=|eps| C x^(-k) (1/x)^(-(r+k))=|eps| C x^r.
Similarly G via eps inverse and f bound. This establishes the native strong pair with both constant terms zero; no dependence on a fixed positive r and no arbitrary exchange of limits. For Hurwitz specifically, the sharper bounds also give F(x)=O(x^(-1/2) exp(-pi/x)), G(x)=O(x^(-1/2) exp(-pi d(a)²/x)) at 0, with the respective constants c_a and 1 subtracted. These estimates imply every power bound at 0 as well.
For any complex s, put sigma=Re(s). Choose real r_inf<-sigma and r_0>-sigma. Then the norm of x^(s-1)F(x) is bounded by constants times x^(sigma-1+r_inf) at infinity (exponent<-1) and x^(sigma-1+r_0) at zero (exponent>-1). On compact positive intervals local integrability suffices. These inequalities hold uniformly in a small neighborhood of s by leaving strict margins; a factor |log x| from differentiation is absorbed by a smaller margin. Thus the Mellin transform of F is entire, as required in RUN18. The native Mellin differentiability supplier is still an imported theorem; above is the standard dominated-differentiation argument, not an independent Lean replay.
Dependency direction: Gaussian Poisson -> Jacobi reciprocity + independent Gaussian estimates -> weak FE pair -> strong FE pair -> entire regularized Mellin -> residues -> boundary prerequisites -> conditional Landau theorem. No use of zero-free conclusions in the upstream analytic leaves. Landau's separate 0<theta<1, delta>0, positive real-pole residue, and window hypotheses remain intact; no assertion of absence of exceptional real zeros in the critical strip.

## 4. Executed finite certificate
Run with Node by extracting the JS block. Exact integer exponent checks and finite double-precision actual theta series/analytic tail comparisons. Truncate E to -N..N and C to symmetric range, N chosen from t, omitted distances >=N and squared increments >=1 give each tail bound 2 exp(-pi N²t)/(1-exp(-pi t)). Floating tolerance is explicit and not a rigorous floating-point enclosure. The tests do not establish the Poisson theorem or infinite quantifiers; the derivation above explains the general inequalities.
```js
function certificate(){
 const check=(b,m)=>{if(!b)throw Error(m)};
 let algebra=0,fe=0,bounds=0,negative=0,maxResidual=0,maxTail=0;
 // Exact exponent comparison after clearing denominators: a=j/D, n>=0.
 for(let D=1;D<=24;D++)for(let j=0;j<=D;j++)for(let n=0;n<=32;n++){
  let u=BigInt(n*D+j),v=BigInt(n*D*D+j*j);
  check(u*u>=v,"geometric majorant");algebra++;
  check(BigInt(-((n+1)*D)+j)**2n===BigInt(n*D+D-j)**2n,"negative half-line");algebra++;
 }
 // Exact exponent bookkeeping at x=0: using r'=-(r+k) is necessary.
 for(let k=1;k<=16;k++)for(let r=-20;r<=20;r++){
  const rp=-(r+k);check(-k-rp===r,"endpoint exponent");algebra++;
 }
 function kernels(a,t){
  const N=Math.ceil(Math.sqrt(45/(Math.PI*t)))+3;
  let E=0,C=1;
  for(let n=-N;n<=N;n++)E+=Math.exp(-Math.PI*(n+a)**2*t);
  for(let n=1;n<=N;n++)C+=2*Math.cos(2*Math.PI*n*a)*Math.exp(-Math.PI*n*n*t);
  // Both omitted half-lines have distance >=N; subsequent square increments >=1.
  const tail=2*Math.exp(-Math.PI*N*N*t)/(-Math.expm1(-Math.PI*t));
  return {E,C,tail};
 }
 for(const a of [0,0.001,0.01,0.125,0.25,0.5,0.75,0.99,0.999])for(const t of [0.04,0.1,0.25,0.5,1,2,4,10,25]){
  const A=kernels(a,t),B=kernels(a,1/t);
  const residual=Math.abs(A.E-B.C/Math.sqrt(t));
  const err=A.tail+B.tail/Math.sqrt(t);
  check(residual<=err+2e-13*Math.max(1,A.E),"theta reciprocity");fe++;
  maxResidual=Math.max(maxResidual,residual);maxTail=Math.max(maxTail,err);
  const d=a===0?1:Math.min(a,1-a),c=a===0?1:0;
  const lo=Math.exp(-Math.PI*d*d*t),hi=2*lo/(-Math.expm1(-Math.PI*t));
  check(A.E-c+A.tail+2e-13>=lo&&A.E-c<=hi+2e-13,"even kernel bounds");bounds++;
  check(Math.abs(A.C-1)<=2*Math.exp(-Math.PI*t)/(-Math.expm1(-Math.PI*t))+A.tail+2e-13,"cos kernel bound");bounds++;
 }
 // Mutations: omit constant for a=0; subtract 1 for a=1/2; omit x^-1/2.
 check(kernels(0,10).E>0.99,"missing constant mutation");negative++;
 check(kernels(0.5,10).E-1< -0.99,"wrong constant mutation");negative++;
 check(Math.abs(kernels(0,4).E-kernels(0,0.25).C)>0.9,"missing modular weight");negative++;
 // No common positive exponential rate over all a !=0: a=1/n at t=n^2.
 for(const n of [10,100,1000]){check(kernels(1/n,n*n).E>=Math.exp(-Math.PI)-1e-13,"nonuniform family lower bound");negative++}
 return {exact_exponent_checks:algebra,theta_reciprocity_cases:fe,decay_bound_cases:bounds,negative_and_nonuniform_controls:negative,max_abs_reciprocity_residual:maxResidual,max_analytic_truncation_bound:maxTail};
}
console.log(JSON.stringify(certificate()));
```
Actual executed result: `{"exact_exponent_checks":22040,"theta_reciprocity_cases":81,"decay_bound_cases":162,"negative_and_nonuniform_controls":6,"max_abs_reciprocity_residual":1.7763568394002505e-15,"max_analytic_truncation_bound":6.523726292469893e-26}`.

## RESUME HERE
Expand the actual imported Gaussian Poisson identity tsum_exp_neg_quadratic in Mathlib/Analysis/SpecialFunctions/Gaussian/PoissonSummation.lean at both Mathlib pins, including Re(parameter)>0 and the complex square-root branch; alternatively if peer proof exists, proceed to the actual Mellin differentiability supplier with exact endpoint inequalities. Request authenticated role-labelled root paths for zeroFree_of_rpow_window, Landau analytical suppliers, WeakFEPair and Hurwitz/Jacobi prerequisites: these are source-linked translations, not proof-root reachability. Arithmetic window supplier and independent kernel replay remain OPEN.
HANDOFF TO editor, integration, dependencies, kernel, audit, prime, math.

import Formalism.GL3MeanSquares.GenusMeanAsymptotics.JacobiCharacterSums.PNTFinal
import Development.AutomorphicArithmetic.MeanSquareBounds.twistK
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# RUN30 — project before differencing: eliminate the general SharpenS consumer locally
25 Nov 2026. Lane 6. Source-matched human replacement, independent
arithmetic regression executed; Lean replay PREPARED only. RH OPEN.

Preflight latest mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc,
including unified engine and canonical native ten-page pyramid;
AGENTS, SWARM, HANDOFF, EXPANSION, continuity and research state/log/
protocol, CI summary f6ffd425d19a9590ab26089cd28a5f1bc20c258f;
live HUMAN_PROOF_ONE_EQUATION 75026c85481848e3c615fcec6e25bec2cfae1dbb.
Peer handoffs: prime RUN32 bb29422d (finite anchor), structure RUN30
90ea4293 (cofinal PairGood), theta RUN30 18759700 (signed orbital mass),
Galois RUN30 e70e93e7 (card budget), integration dd7cd00b (height guard).
Those are distinct consumers. Resume RUN29 613a36df, not a new criterion.

## Compact replacement proof (for integration/audit)

Keep the actual positive-U admitted context, same m0,s,a0,eOf and
eta, interval [V,U] of RUN29, and the original Page/jacobi separation.
M=m0*s, h=1/phi(m0), C=clsB(m0,s,a0). On units mod M let w be the
coset indicator, or that indicator times the Jacobi symbol mod s;
extend by zero to nonunits. Use unsigned w for count_a (s=1),
signed w for twistK (s odd squarefree, coprime to m0, >1).
On the CRT product the weight is the indicator at a0 times a single
character of the s-factor (trivial for unsigned). Its Fourier
coefficient a_chi is zero unless the s-component is that character;
on its support it has modulus h. Thus exactly phi(m0) coefficients
are nonzero and sum |a_chi|=1, rather than merely bounding the
absolute sum by h*phi(M). The coefficient of the principal character
is h*j, and the coefficient of the shared exceptional character
is h*k, where j,k are the real coset averages from RUN29.
Orthogonality proves these assertions (the sum of a nontrivial
character over a group vanishes by translating the summation).
No choice of independent exceptional zero for either weight.

Define F_w(y)=sum_{n<=y} Lambda(n) w(n), S_w(y)=sum_{n<=y}
Lambda(n) w(n)(y/n-1). Let H_w(y)=h*(j*y-k*y^beta/beta), with
k=0 if no exception. Let v=(1+d)y, 0<d<=1/2; L_y(f) denotes
yv/(v-y)*[f(v)-f(y)]. The native sharp_schi_div identity gives
exactly
  L_y(S_w(t)/t) = F_w(y) +
    sum_{y<n<=v} Lambda(n) w(n) y(v-n)/(n(v-y)).
The kernel is in [0,1]. Hence the difference from F_w(y) is at
most (d*y+1)*log(2*y), NOT a separate bound for every character.
This identity holds at integer endpoints, including n=y and n=v.

Use the same native ExplicitS at T=M^12, d=M^-5,
t0=y^(-kappa/2), E=C0exp*((M*T)^C0exp*t0+
log(2*y)*log(M*T)^2/T), and native ZeroSum (same kappa and
zero multisets Z,m). Here C0exp is the ExplicitS constant C,
not its unrelated threshold C_0. For u=y,v the error in the
smoothed formula is <=E. Project the formula onto w FIRST,
and difference SECOND. The constant K cancels exactly.
The projected endpoint error is <=3*y*E/d because sum|a|=1
and yv/(v-y)<=1.5*y/d. No need to recover all individual
psiChi values, or to approximate each differenced zero by its
undifferenced zero term.

For clarity L_y(f)=integral_y^v f'(u)du divided by
integral_y^v u^-2 du (since that integral=(v-y)/(yv)).
For f(u)=u^(rho-1)/(rho*(rho-1)) the result is a positive
weighted average of u^rho/rho with density proportional to u^-2.
Since 1/2<=Re rho<1, |rho|>=1/2, its modulus is <=3*y^Re rho.
The principal log term similarly averages u. Subtract the
one selected exceptional zero with its exact coefficient
BEFORE taking the norm; if it is in Z, m>=1 permits the same
nonnegative multiplicity m-excW as native PNTBAsm. If it is
absent, native coverage implies beta<1-kappa/2, so its omitted
differenced contribution is <=3*h*y*t0 (beta>=1/2). In both
cases compare the averaged H_w(u) with H_w(y): |H_w'(u)|<=2h
for u>=y>=2, so the comparison costs <=2*h*d*y.

Write W=sum_chi sum_{rho in Zchi}(m-excW)*y^(Re rho-1).
All weights in W are nonnegative; restricting its sum to
the CRT Fourier support cannot increase it. In the far range
of native PNTBAsm the complete local error budget is
  |F_w(y)-H_w(y)| / h
    <= 3*phi(m0)*y*E/d
       + phi(m0)*(d*y+1)*log(2*y) + 2*d*y
       + 3*y*W + 3*y*t0.                         (P)
This is simultaneous for both projections with the same uniform
constants and same exception, not a sum of unrelated witnesses.

Native num_main already bounds
 M*(4*y*E/d+4*(d*y+1)*log(2*y))+20*d*y+2*y*t0
 by B*y/M^2 in its original far range. Twice this budget
dominates the non-W terms of (P), since phi(m0)<=M.
Using native ZeroSum and inv_le_exp and etaOf_lower(1), the
far error is therefore at most
 h*y*etaOf(M)*(3*|Az|+2*B/c1)*exp(-min(cz,cA^2)*log(y)/log(M)).
This uses the same thresholds and retains all density, repulsion,
Siegel-lower, zero-multiplicity and explicit-formula premises.
Near range: keep psi_relative_near_range and project with
|a_chi|<=h, giving the corresponding h-scaled bound directly.
Take the native min of positive exponents and sum of positive
constant bounds as in glue_ranges. This yields the two specific
projected estimates required by RUN29, not the full PsiRel norm
statement. Its interval partial summation and Page argument now
give twistK and count_a positive-U conclusions with original
quantifiers; nonpositive U branch unchanged.

Net local shortening: no general SharpenS theorem / sharp_zero_term
approximation, no one_char or sum_excI bookkeeping, no all-character
unsmoothing. Exact averaging still proves the required local
unsmoothing; it is not an assumption of the final result.
In particular this is not a proof of ExplicitS or ZeroSum.
Do NOT remove the original suppliers globally: other callers may
still need them. Nor is this a claim that a weaker axiom set has
already been checked in Lean.

## Provenance, graph overlay and native status
Pin 40e56bab026552e089d7afcfeff08d2defb9c005. J prefix:
src/Formalism/GL3MeanSquares/GenusMeanAsymptotics/JacobiCharacterSums/
PNTFinal.lean 616aec99297d346eb1570dc53468c5e9bf79886c
(pnt_progressions_relative_weak_holds);
DeuringHeilbronnM.lean c88517739b211c9cb0da65b0f6bc59611f809901
(ExplicitS, SharpenS, ZeroSum, PsiRel, eOf, mainPsi);
PNTRangeA.lean 91acb9e608ae0b94882fe181ddb0917d86335d99;
PNTGlue.lean 6e6f6f96c860d401ccd24925673095ad549357e3;
PNTBAsm.lean 4ff480d42f552af6a4839a0cdfa65a4b388d2d8b
(psi_relative_far_range);
PNTBAsmA.lean 73eccf9ef5d1942ca6f5bd908e2760f9684ad7fd
(num_main, inv_le_exp);
PNTBAsmB.lean 71b3322363ac160465ac29560f1e86f7b1a3a953
(one_char, excT_sub_le);
PNTSharp.lean 4fa407ec47f5348055b71503b37df41bc7c6efde
(differenced_explicit_formula, sharp_zero_term);
PNTSharpB.lean d1f77ac690fc1ae72999e456ad62a22951fbf989
(sharp_schi_div, sharp_arith);
PNTZSum.lean cdc892744a760f3089f81d17be4df6bbac3024e3.
src/Development/AutomorphicArithmetic/MeanSquareBounds/
twistK.lean 07e569eaf54b3b91fedad4117991838a23b93603;
PrimeSetTwoBounds.lean 45616f33334b6ef360b18a8e64c0eb325f9463b8
(admitted). Retain RUN29 PNTPiA, MSqCount and MSqTwistB anchors.
Current upstream head 8e5cefeeaffe7e4c12153385b7bb33fb7223c41a,
25 Nov 11:57 UTC; PNTFinal blob changed to
1fe9f0eae8d647c9f312b427778b4f2844be3df1, four prior paths
(PNTBAsm, PNTSharpB, DeuringHeilbronnM, PNTZSum) returned 404
at the new head. No inference of mathematical deletion; no mixing.

Original source-visible graph:
twistK -> PNTAPRelW -> prime_count_of_psi, glue_ranges ->
near_range, far_range -> ExplicitS, SharpenS, ZeroSum, num_main,
one_char; SharpenS producer -> sharp_zero_term, sharp_arith, etc.
RUN29 overlay retains PsiRel producer, projects and integrates.
New proposed positive-U overlay:
{twistK,count_a} -> {RUN29 interval transfer, projected near/far};
projected near/far -> {near_range, ExplicitS, ZeroSum, num_main,
etaOf_lower(1), CRT coefficient identity, exact ramp average (P)};
twistK also retains Page and Jacobi separation.
ZeroSum -> LogDensityM, DeuringHeilbronnMB as in PNTFinal.
This is a source-body local graph, NOT new authenticated kernel
Main-root edges; original type/value/constructor and axiom ledgers
remain intact pending caller replay. Context key=(pin,eps,Ahost,B,
Y,U,m0,s,a0,eOf,eta,w,y,T,d,kappa,Z,m). Backtrack to RUN29
and original PsiRel if projected caller cannot be checked.
No local Lean/lake on PATH. Prior actual CI status retrieved:
45577239749 pass (98.87s, blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc);
45576756833 pass (77.94s, blob 7da354941e402b6f8b364ed03d8c5c82d27b7717).
Those logs show only the conditional root and prior engine axioms
(propext, Classical.choice, Quot.sound) and not this local branch.
New axiom and caller audit OPEN. No URT experiment or speed claim.

## Executed regression (Node, exact integer kernel and character exponents)
No simulated zeros, no claim of an asymptotic numerical test.
Actual output:
{"primes":5133,"powers":5217,"kernelChecks":109557,"inner":2742,
"edges":18,"histChecks":6096,"caseCount":296,"negativeControls":[true,true]}
First negative control confirms the upper endpoint has zero ramp
weight, not full weight; second is only a CRT coprimality sanity
check, not a genuine negative control. Reproduce:
const N=50000,is=new Uint8Array(N+1).fill(1);is[0]=is[1]=0;
for(let p=2;p*p<=N;p++)if(is[p])for(let n=p*p;n<=N;n+=p)is[n]=0;
let primes=[],powers=[];for(let p=2;p<=N;p++)if(is[p]){
primes.push(p);for(let n=p;n<=N;n*=p)powers.push(n)}
let checks=0,inner=0,edges=0; const max=x=>x>0n?x:0n;
for(const y of [64,100,121,1024,4096,10000,32768])
for(const v of [y+1,y+Math.floor(y/16),y+Math.floor(y/2)])
for(const n of powers){
 const a=BigInt(y),b=BigInt(v),c=BigInt(n),
 num=a*max(b-c)-b*max(a-c),den=c*(b-a);
 if(num<0n||num>den||(n<=y&&num!==den)||(n>v&&num!==0n)||
 (n>y&&n<=v&&num!==a*(b-c)))throw Error("kernel");
 checks++;if(y<n&&n<=v)inner++;if(n===y||n===v)edges++;
}
const gcd=(a,b)=>b?gcd(b,a%b):a;let histChecks=0,caseCount=0;
for(const p of [3,5,7,11,13,17,19,23,29,31]){
 let g=2,els;for(;g<p;g++){els=[1];for(let i=1;i<p-1;i++)
 els.push(els.at(-1)*g%p);if(new Set(els).size===p-1)break;}
 for(let k=0;k<p-1;k++)for(const sign of [0,1]){
  const e=(k+sign*(p-1)/2)%(p-1),hist=new Array(p-1).fill(0);
  for(let i=0;i<p-1;i++)hist[(e*i)%(p-1)]++;
  if(e===0){if(hist[0]!==p-1)throw Error("support")}else{
  const d=gcd(e,p-1);for(let j=0;j<p-1;j++)
  if(hist[j]!== (j%d===0?d:0))throw Error("hist");}
  histChecks+=p-1;caseCount++;
 }
}
console.log({primes:primes.length,powers:powers.length,kernelChecks:checks,
inner,edges,histChecks,caseCount,negativeControls:[
(100n*max(101n-101n)-101n*max(100n-101n))!==101n*(101n-100n),
gcd(3,8)===1]});

RESUME HERE: derive the retained ZeroSum supplier directly from the
native density + Deuring-Heilbronn bounds, using layer-cake integration
rather than repeated unit-bin summation if valid. Do not rework
PNTSharp or assume uniform zero cancellation. Native kernel lane:
compile below, formalize CRT projection and complex integral average,
then replay actual twistK/count_a callers and audit axioms.
HANDOFF TO audit, kernel, integration/editor. Canonical inequality
G(x)<=x^(1/2+9 eps) still OPEN. Preserve RUN29 and all other work.
-/

namespace RHProjectedZero30
theorem ramp_numerator (n y v : ℝ) (hyv : y ≤ v) :
    y * max (v-n) 0 - v * max (y-n) 0 =
      if n ≤ y then n*(v-y) else if n ≤ v then y*(v-n) else 0 := by
  by_cases hy : n ≤ y
  · rw [if_pos hy, max_eq_left (sub_nonneg.mpr (hy.trans hyv)),
      max_eq_left (sub_nonneg.mpr hy)]
    ring
  · rw [if_neg hy, max_eq_right (by linarith : y-n ≤ 0)]
    by_cases hv : n ≤ v
    · rw [if_pos hv, max_eq_left (sub_nonneg.mpr hv)]
      ring
    · rw [if_neg hv, max_eq_right (by linarith : v-n ≤ 0)]
      ring

theorem ramp_budget (n y v : ℝ) (hn : 0 ≤ n) (hy : 0 ≤ y)
    (hyv : y ≤ v) :
    0 ≤ y * max (v-n) 0 - v * max (y-n) 0 ∧
    y * max (v-n) 0 - v * max (y-n) 0 ≤ n*(v-y) := by
  rw [ramp_numerator n y v hyv]
  by_cases h : n ≤ y
  · simp only [if_pos h]
    exact ⟨mul_nonneg hn (sub_nonneg.mpr hyv), le_rfl⟩
  · rw [if_neg h]
    by_cases hv : n ≤ v
    · rw [if_pos hv]
      exact ⟨mul_nonneg hy (sub_nonneg.mpr hv),
        by nlinarith [mul_nonneg (hy.trans hyv) (show 0 ≤ n-y by linarith)]⟩
    · rw [if_neg hv]
      exact ⟨le_rfl, mul_nonneg hn (sub_nonneg.mpr hyv)⟩

theorem numeric_overlay (e a d t b : ℝ)
    (he : 0 ≤ e) (ha : 0 ≤ a) (hd : 0 ≤ d) (ht : 0 ≤ t)
    (hb : 4*e+4*a+20*d+2*t ≤ b) :
    3*e+a+2*d+3*t ≤ 2*b := by linarith

theorem replay_overlay (e a d t b : ℝ)
    (he : 0 ≤ e) (ha : 0 ≤ a) (hd : 0 ≤ d) (ht : 0 ≤ t)
    (hb : 4*e+4*a+20*d+2*t ≤ b) :
    3*e+a+2*d+3*t ≤ 2*b := by
  first | (rh_reduce 3 using [numeric_overlay]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 3; done)
        | exact numeric_overlay e a d t b he ha hd ht hb
end RHProjectedZero30

rh_scan QH.twistK limit 2000
rh_scan Formalism.HermitianLattices.Ext.PrimesInProgressions.psi_relative_far_range limit 2000
rh_scan Formalism.HermitianLattices.Ext.PrimesInProgressions.differenced_explicit_formula limit 2000
rh_prune Formalism.HermitianLattices.Ext.PrimesInProgressions.psi_relative_far_range as RHProjectedZero30OriginalFarPruned
rh_prune RHProjectedZero30.numeric_overlay as RHProjectedZero30BudgetPruned
#print axioms QH.twistK
#print axioms Formalism.HermitianLattices.Ext.PrimesInProgressions.psi_relative_far_range
#print axioms RHProjectedZero30.ramp_budget
#print axioms RHProjectedZero30.numeric_overlay

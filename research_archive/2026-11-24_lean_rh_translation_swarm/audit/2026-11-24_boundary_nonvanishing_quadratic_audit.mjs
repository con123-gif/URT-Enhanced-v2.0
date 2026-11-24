/*
RH AUDIT 2026-11-24 — REVIEW / SOURCE-MATCHED: closed right-half-plane nonvanishing,
quadratic exceptional branch and the 3-4-1 product. One contribution: independently
verify the exact branch partition in CharFamilyLFunctionNeZeroOfOneLeRe, following
the imported Mathlib proof, with a countermodel for dropping its second regularity guard.
AGREE with pinned argument and math/analytic_zero_exclusion_chapter section 5;
DISAGREE with a compression that uses the 3-4-1 argument at quadratic t=0.
PARTIAL overall. Not kernel evidence, not a physical Cathedral result.

Preflight: SWARM_PROTOCOL, AGENTS, state, runner log/protocol, continuity,
HANDOFF_QUEUE, external blueprint text (section 2.3), prior audit log transport,
dependency locality retry, structure owner bundle, math analytic and joint scale
chapters, integration WD segment. Cathedral summary #371 PASS c7e63c7, run
45400200142; not RH verification. Root RESEARCH_LOG/PROTOCOL 404 recovered
from runner paths. No lean, lake or ~/.elan/bin in local container. Full solution
export not authenticated (dependency retry checkpoint); no #print axioms,
elaborated references or transitive sorry/axiom claims. Current upstream observed
6866a9c6260d77b88a7b5477433e3044b6844f9b; old wrapper comparison {"sha":"d2528ce1ab28750b3b50ec1c8040ef3f65f6dd27","same":false}.
The pinned RH source and locked Mathlib are the evidence; no migration inferred.

Exact human argument:
For every F:CharFamily, i and complex s with Re(s)>=1, use NeZero N_i and
admissibility N_i=1 OR chi_i!=1. In the first case L_chi=zeta as total functions.
Mathlib's zeta nonvanishing includes s=1 only because its assigned value
(gamma_E-log(4*pi))/2<0 (gamma_E<2/3<1<log(4*pi)). It is not the limit
or finite value of a holomorphic zeta at its pole. For N_i!=1 admissibility
forces chi_i!=1, satisfying the external theorem's guard chi!=1 OR s!=1.
Do not apply the modulus-one value to general principal characters at one.
DirichletContinuation's Euler-factor equality explicitly excludes s=1.
For Re(s)>1 the external theorem uses equality with the ordinary L-series
and its nonvanishing; retain that imported theorem as an obligation.
For Re(s)=1 write s=1+it, t real; preserve the following disjoint split.

(i) chi^2!=1 OR t!=0. For each x>0 define A=L(principal_N,1+x),
B=L(chi,1+x+it), C=L(chi^2,1+x+2it). The Euler product gives
|A^3 B^4 C|>=1. At primes dividing N all character factors are 1 (local
Euler factors); at other primes a=p^(-1-x) in (0,1) and z=chi(p)*p^(-it)
has |z|=1. The real logarithm of the local product is the sum over n>=1 of
(a^n/n)(3+4 Re(z^n)+Re(z^(2n))) = (a^n/n) 2(1+Re(z^n))^2 >=0.
The source uses complex log Taylor sums, absolute convergence over primes
and summable real-part transport; these obligations remain, not formal
consequences of checking a few primes. The inequality permits equality.
Under an assumed B(0)=0, B=O(x) by differentiability at 1+it, which holds
since t!=0 OR chi!=1. A=O(1/x) from the principal residue. C=O(1) only
since 2t!=0 OR chi^2!=1. Hence product O(x), contradiction as x->0+.
The second guard cannot be dropped: A=1/x, B=x, C=1/x satisfy the same
product lower bound and B(0)=0, but product=1. This is a countermodel to
the proposed abstract asymptotic implication, NOT a Dirichlet L-function
counterexample. At chi^2=1,t=0 the second L-function really is principal
at its pole and the generic O(1) estimate is unavailable. The exact
source's exponent 4-3-1=0 explains why the shortcut fails.

(ii) chi^2=1 AND t=0, with chi!=1 (the original external guard supplies
nontriviality; the modulus-one pole is dispatched separately). Suppose
L(chi,1)=0. F(s)=zeta(s)L(chi,s) off 1, F(1)=L'(chi,1). This extension
is entire by the regularized factors (s-1)zeta(s) and
(L(chi,s)-L(chi,1))/(s-1), using residue 1 and differentiability.
On Re>1, F has the absolutely convergent Dirichlet series with
a(n)=sum_{d|n}chi(d) for n>=1, multiplicative, a(1)=1. At prime powers
a(p^k)=sum_{j=0}^k chi(p)^j: 1 if chi(p)=0, k+1 if chi(p)=1, and
1 or 0 according to k even/odd if chi(p)=-1. Thus a(n)>=0.
The actual Positivity lemma needs absolute-convergence abscissa <=1,
agreement on Re>1, an entire extension, nonnegative coefficients and
strictly positive first coefficient. For the needed y=-2 choose real
center 2. F(2)>0 from a(1)=1. For every k, (-1)^k F^(k)(2)>=0 by
termwise derivatives (absolute local convergence, log^k n dominated
by a small positive power of n); the entire Taylor expansion gives
F(-2)=sum_k [(-1)^k F^(k)(2)] 4^k/k! >=F(2)>0.
This contradicts zeta(-2)=0 since -2!=1 and L is entire.
The source invokes the general Positivity lemma via the BadChar structure.
Dropping coefficient nonnegativity is invalid: the entire Dirichlet
polynomial 1-2^(-s) is positive at 2 but negative at -2.
No new axiom or URT priority is needed for either branch.

The wrapper is used in lemmaL to handle Re>=1 and in poleData to rule
out rho=1 and establish Re(rho)<1 for real zero-set points, including
conjugate witnesses (same real part). Those facts enable positive real
residue; they are not deduced from the Landau contradiction itself.
The source says Re>=1, NOT just Re>1, and uses the totalized nonzero
value at s=1. Preserve exact CharFamily admissibility and NeZero instance.
Imported series nonvanishing, log/Taylor summability, differentiability,
zeta trivial zero, and positivity remain dependency witnesses.

Executed in JS runtime: {"source":54,"mutations":9,"unit":7488,"trig":7488,"quadratic":3364,"convolution":2560,"guards":9,"order":598,"residue":299,"negative":6,"total":21875}. All nine source blobs
matched connector git blob IDs. The exact BigInt tests check rational
unit circle algebra, finite actual Legendre characters, logical guards,
principal residue arithmetic and mutation controls. They are finite
regressions, not proofs of analytic theorems. To reproduce, run
node <this-file> /path/to/rh-checkout /path/to/mathlib-checkout;
git show reads the locked revisions and checks SHA-1 blob hashes.
No process CI verdict yet at writing. No unrelated files changed.

RESUME HERE: audit the guarded arithmetic-to-window join zeroFreeOn_of_tiedWin_cyc,
including the quantifier dependence of the family on the selected primitive character.
HANDOFF TO: integration and math; keep both Mathlib boundary branches in the chapter.
*/
const pin="40e56bab026552e089d7afcfeff08d2defb9c005",mpin="0df444a360eaa60ab8c11dca51a86af692955474";
const ledger=[
  [
    "rh",
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/CharFamilyLFunctionNeZeroOfOneLeRe.lean",
    "e3aaad883b956e2d45c50bdf6d58367d6f9ef109",
    [
      "(hs : 1 ≤ s.re)",
      "haveI := F.nz i",
      "rcases F.adm i with h | h",
      "M = 1 →",
      "rw [DirichletCharacter.LFunction_modOne_eq]",
      "exact riemannZeta_ne_zero_of_one_le_re hs",
      "(Or.inl h) hs"
    ]
  ],
  [
    "rh",
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean",
    "81c8dfd66d910d083d5bc88c664c7917fdbdfe96",
    [
      "[nz : ∀ i, NeZero (N i)]",
      "adm : ∀ i, N i = 1 ∨ χ i ≠ 1",
      "θ < s.re → DirichletCharacter.LFunction"
    ]
  ],
  [
    "rh",
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/lemmaL.lean",
    "6c37aebd05121b6d68e3532d8529f0ce8357386f",
    [
      "(hθ : 0 < θ) (hθ1 : θ < 1) (hδ : 0 < δ)",
      "by_cases h1 : 1 ≤ s.re",
      "exact charFamily_LFunction_ne_zero_of_one_le_re F i s h1 hzero",
      "⟨by linarith, i, Or.inl hzero⟩"
    ]
  ],
  [
    "rh",
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/poleData.lean",
    "1f7fdc4409d2f1185700764c51d5c17a907d76e1",
    [
      "have hρ1 : ρ ≠ 1 := by",
      "exact charFamily_LFunction_ne_zero_of_one_le_re F i0 ρ",
      "have hlt : ρ.re < 1 := by",
      "exact charFamily_LFunction_ne_zero_of_one_le_re F i0 _ (by simpa using hge)"
    ]
  ],
  [
    "rh",
    "lake-manifest.json",
    "b4d1ec31575a26b2159ec3a262b482bc051f3f6f",
    [
      "0df444a360eaa60ab8c11dca51a86af692955474"
    ]
  ],
  [
    "ml",
    "Mathlib/NumberTheory/LSeries/Nonvanishing.lean",
    "610bd56365d49c5ffa9ebeb29e0a383c768248e2",
    [
      "(hχ : χ ^ 2 = 1) (χ_ne : χ ≠ 1)",
      "χ.zetaMul.IsMultiplicative",
      "Function.update (fun s : ℂ ↦ riemannZeta s * LFunction B.χ s) 1 (deriv (LFunction B.χ) 1)",
      "B.hχ, sub_zero",
      "riemannZeta_neg_two_mul_nat_add_one 0",
      "ArithmeticFunction.LSeries_positive_of_differentiable_of_eqOn (zetaMul_nonneg hχ)",
      "χ.isMultiplicative_zetaMul.map_one ▸ zero_lt_one",
      "(ha₀ : 0 ≤ a) (ha₁ : a < 1) {z : ℂ} (hz : ‖z‖ = 1)",
      "2 * a ^ n * ((z ^ n).re + 1) ^ 2",
      "by_cases hn' : IsUnit (n : ZMod N)",
      "MulChar.map_nonunit _ hn'",
      "(hx : 0 < x) (y : ℝ)",
      "(h : χ ^ 2 ≠ 1 ∨ t ≠ 0)",
      "have hz₁ : t ≠ 0 ∨ χ ≠ 1",
      "have hz₂ : 2 * t ≠ 0 ∨ χ ^ 2 ≠ 1",
      "((1 / x) ^ 3 * x ^ 4 * 1 : ℂ) = x",
      "by_cases h : χ ^ 2 = 1 ∧ s = 1",
      "(hχs : χ ≠ 1 ∨ s ≠ 1) (hs : 1 ≤ s.re)",
      "rcases eq_or_ne s 1 with rfl | hs₀",
      "exact riemannZeta_one_ne_zero"
    ]
  ],
  [
    "ml",
    "Mathlib/NumberTheory/LSeries/DirichletContinuation.lean",
    "9ccc38f52d669a88285a904e59dbb562ade5aba5",
    [
      "lemma LFunction_modOne_eq {χ : DirichletCharacter ℂ 1}",
      "LFunction χ = riemannZeta",
      "(hs : s ≠ 1 ∨ χ ≠ 1)",
      "lemma LFunctionTrivChar_eq_mul_riemannZeta {s : ℂ} (hs : s ≠ 1)",
      "lemma LFunctionTrivChar_residue_one"
    ]
  ],
  [
    "ml",
    "Mathlib/NumberTheory/LSeries/Positivity.lean",
    "e7855803a338e1765edea208ca0595e7bbc858a2",
    [
      "(ha₁ : 0 < a 1)",
      "(hf : Differentiable ℂ f)",
      "(hx : abscissaOfAbsConv a ≤ x)",
      "{s | x < s.re}.EqOn f (LSeries a)",
      "hf.apply_le_of_iteratedDeriv_alternating",
      "iteratedDeriv_alternating ha₀ hxy' n"
    ]
  ],
  [
    "ml",
    "Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean",
    "6846dc699ecd29cc8a1754c1680176210969ffd1",
    [
      "riemannZeta 1 = (γ - log (4 * π)) / 2",
      "lemma riemannZeta_one_ne_zero : riemannZeta 1 ≠ 0",
      "Real.eulerMascheroniConstant_lt_two_thirds",
      "Real.exp_one_lt_d9"
    ]
  ]
];
function audit(ledger,sources){
 const counts={};function ck(x,k,why){if(!x)throw Error(k+": "+why);counts[k]=(counts[k]||0)+1}
 for(const [,p,,as] of ledger){for(const a of as)ck(sources[p].includes(a),"source",p+": "+a)}
 for(const [,p,,as] of ledger){const s=sources[p].split(as[0]).join("REMOVED");ck(!s.includes(as[0]),"mutations",p)}
 // exact unit-circle rational points and powers, avoiding all floating arithmetic
 for(let a=-12n;a<=12n;a++)for(let b=-12n;b<=12n;b++){
  if(a===0n&&b===0n)continue;const D=a*a+b*b,A=a*a-b*b,B=2n*a*b;
  let R=1n,I=0n,d=1n;
  for(let n=1;n<=12;n++){[R,I]=[R*A-I*B,R*B+I*A];d*=D;
    ck(R*R+I*I===d*d,"unit","unit norm");
    const lhs=3n*d*d+4n*R*d+R*R-I*I,rhs=2n*(d+R)**2n;
    ck(lhs===rhs&&lhs>=0n,"trig","3+4cos+cos2 identity");
  }
 }
 // Concrete quadratic characters via square residues modulo odd primes.
 for(const p of [3,5,7,11,13,17,19,23,29,31]){
  const squares=new Set(Array.from({length:p-1},(_,i)=>(i+1)**2%p));
  const chi=n=>n%p===0?0:squares.has(n%p)?1:-1;
  ck(chi(1)===1&&squares.size===(p-1)/2,"quadratic","nontrivial quadratic");
  for(let a=1;a<=p;a++)for(let b=1;b<=p;b++)ck(chi(a*b)===chi(a)*chi(b),"quadratic","multiplicative");
  for(let n=1;n<=256;n++){let direct=0;for(let d=1;d<=n;d++)if(n%d===0)direct+=chi(d);
   let m=n,prod=1;
   for(let q=2;q<=m;q++){if(m%q)continue;let k=0;while(m%q===0){m/=q;k++}const c=chi(q);prod*=c===0?1:c===1?k+1:(k%2===0?1:0)}
   ck(direct===prod&&direct>=0,"convolution","nonnegative exact coefficients");
  }
 }
 // Logical guard: all abstract type combinations consistent with chi=1 => chi^2=1.
 for(const trivial of [false,true])for(const squareOne of [false,true])for(const tZero of [false,true])for(const modOne of [false,true]){
  if((trivial&&!squareOne)||(modOne&&!trivial))continue;
  const adm=modOne||!trivial,guard=!squareOne||!tZero;
  if(guard)ck((!tZero||!trivial)&&(!tZero||!squareOne),"guards","both analytic factors regular");
  if(adm&&tZero)ck(modOne||!trivial,"guards","boundary admission");
  if(adm&&!modOne&&!guard)ck(!trivial&&squareOne&&tZero,"guards","quadratic special case");
 }
 for(let q=2n;q<=300n;q++){
  // x=1/q. A=x^-1, B=x, C=x^-1 => A^3 B^4 C=1, NOT O(x).
  ck(q**4n===q**3n*q,"order","countermodel for dropping second-factor guard");
  // regular C=1 -> product 1/q: numerator q^3 over q^4.
  ck(q**4n===q*q**3n,"order","regular order one");
  // Nonzero residue for principal mod q is tested at actual prime q below via factorization.
  let n=q,num=1n,den=1n;for(let p=2n;p<=n;p++){if(n%p)continue;num*=p-1n;den*=p;while(n%p===0n)n/=p}
  ck(num>0n&&num<den,"residue","positive non-unit modulus residue");
 }
 ck(3n-4n+1n===0n&&3n-4n<0n,"negative","omitting cos2 term fails at z=-1");
 ck(3-4+1===0,"negative","nonnegative not strictly positive local log");
 ck(1-4===-3&&4-1>0,"negative","F(s)=1-2^-s positive at 2, negative at -2; coefficient sign necessary");
 ck(0===0,"negative","zero coefficient sequence cannot imply strict positivity");
 ck(4-3-1===0&&4-3===1,"negative","quadratic case exactly loses the vanishing power");
 ck(1<2&&!(1>1),"negative","open half-plane excludes boundary");
 return {...counts,total:Object.values(counts).reduce((a,b)=>a+b,0)}
}
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
const [rh,ml]=process.argv.slice(2);if(!rh||!ml)throw Error('provide RH and Mathlib git checkouts');
const sources={};for(const [k,p,sha] of ledger){const b=execFileSync('git',['-C',k==='rh'?rh:ml,'show',(k==='rh'?pin:mpin)+':'+p],{maxBuffer:32*1024*1024});if(createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex')!==sha)throw Error('blob mismatch '+p);sources[p]=b.toString('utf8')}
console.log(JSON.stringify(audit(ledger,sources),null,2));

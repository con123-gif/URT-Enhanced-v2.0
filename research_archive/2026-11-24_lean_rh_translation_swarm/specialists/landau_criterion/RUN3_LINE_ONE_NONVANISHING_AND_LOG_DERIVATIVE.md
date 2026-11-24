# RUN3 — nonvanishing on Re(s)=1, logarithmic derivatives and zeta regularization

2026-11-24. RESULT: DONE for this source-linked human reconstruction of the named Mathlib argument; PARTIAL for full transitive library proof and independent kernel validation. No new RH assertion. Continue from RUN2_MELLIN_CONJUGATION_AND_POLE_FIELDS.md. No change to physics queue, other lanes or assumptions.

## Source revision and precise scope
Original RH pin 40e56bab026552e089d7afcfeff08d2defb9c005; locked Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. All line numbers below are from these immutable revisions, not main. Six Mathlib modules read in relevant sections:
- Mathlib/NumberTheory/LSeries/Nonvanishing.lean: 610bd56365d49c5ffa9ebeb29e0a383c768248e2, entire file (main proof).
- Mathlib/NumberTheory/LSeries/Positivity.lean: e7855803a338e1765edea208ca0595e7bbc858a2, entire file (Dirichlet-series positivity).
- Mathlib/Analysis/Complex/Positivity.lean: 84d0dd19081767dc0426eca372d937ade4b56f41, entire file (Taylor positivity).
- Mathlib/NumberTheory/LSeries/Dirichlet.lean: f718ca1edc35ffa92b318b2f74ddcef0e2e754a3, relevant lines 80–264,290–442 (Moebius inverse, convolution, logarithmic derivatives).
- Mathlib/NumberTheory/LSeries/Deriv.lean: 8c6ad6574f8ecc81f7d491143ce104763d1d4a02, lines 35–163 (analytic termwise differentiation).
- Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean: 6846dc699ecd29cc8a1754c1680176210969ffd1, selected lines 30–145,195–260,305–450 (finite sums, asymptotic and totalized value).
Two actual RH source wrappers reread: src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/CharFamilyLFunctionNeZeroOfOneLeRe.lean e3aaad883b956e2d45c50bdf6d58367d6f9ef109 and lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f.

Upstream main observed c9883164b0b3d762cee21f889d03d59a53b3ba3b, commit timestamp 2026-11-24T09:08:06Z. Old ZeroFreeOfRpowWindow path 404; CharFamilyLFunctionNeZeroOfOneLeRe blob now d2528ce1ab28750b3b50ec1c8040ef3f65f6dd27. Manifest now locks Mathlib 31ce06eaadf4a200c0e1407c5f10953cf606b8f8 (manifest blob 8a747b58a34565cc6cb5341b86544aa5d3a20a2d). All six library blobs above also changed, respectively 9ff00d6fd0a8b212d88478cc00c0e0c3718ccb32, 1453d575835e66a01bbfae9f95a2a12cefbbe243, 4daa2fbc36860e73648a7faef9cdbddd03dcf223, 81d22d30291cde186823417dbe69a23a5bf6faf8, b2e325a69fb4ec998d10e20377430f38fc1017db, 30397bfe2272d8400aa42bcbb44bec085b7f23ab. These are observed content changes, not a claim that the mathematical conclusions changed. This chapter applies only to original pin; semantic migration is a separate obligation.

## 1. Exact statement and the two genuinely different cases
Let N>0, chi a Dirichlet character modulo N. Nonvanishing.lean:385–401 asserts L(s,chi)!=0 for Re(s)>=1 under chi!=1 OR s!=1. There is no assumption of primitivity. At s=1 for the nonprincipal quadratic case it uses a different positivity argument, not the familiar 3-4-1 inequality. At a real zero beta strictly between 0 and 1 this theorem says NOTHING; such a zero must be treated in RUN1's conditional window contradiction.

## 2. Re(s)>1: a convolution inverse, not an RH assumption
Use f*g(n)=sum_{d|n} f(d)g(n/d) for n>=1. Complete multiplicativity makes (chi f)*(chi g)=chi(f*g). The Moebius relation 1*mu=delta_1 therefore gives chi*(chi mu)=delta_1 (here the outer star denotes convolution). Both Dirichlet series converge absolutely for sigma>1 because |chi|,|mu|<=1. Convolution corresponds to multiplication by absolute rearrangement over ordered positive pairs (d,e), since (de)^(-s)=d^(-s)e^(-s). Thus L(s,chi) sum_n chi(n)mu(n)n^(-s)=1. The first factor cannot vanish. Exact source Dirichlet.lean:128–153,187–222,229–232. Modulus zero is allowed for the series lemma (chi on positive naturals is delta_1) but not the analytic continuation theorem requiring N>0. Modulus one is the constant-one character on positive integers.

## 3. The 3-4-1 argument on the boundary (except quadratic at s=1)
Fix x>0, t real, sigma=1+x. Write chi_0 for principal character at the SAME modulus N, not zeta if N>1. Define
 P(x)=L(sigma,chi_0)^3 L(sigma+it,chi)^4 L(sigma+2it,chi^2).
For prime p not dividing N let a=p^(-sigma) in (0,1) and z=chi(p)exp(-it log p) with |z|=1. For every k>=1,
 3+4 Re(z^k)+Re(z^(2k)) = 2(1+Re(z^k))^2 >=0.
Indeed Re(w^2)=2Re(w)^2-1 for |w|=1. Taylor expansion -Log(1-v)=sum_{k>=1}v^k/k on |v|<1 (principal analytic logarithm) shows
 3 Re[-Log(1-a)]+4 Re[-Log(1-az)]+Re[-Log(1-az^2)] >=0.
At primes dividing N all three character values, INCLUDING chi_0 and chi^2, vanish, so the three logarithms are zero, not a zeta factor. All prime-log series absolutely converge: |chi(p)p^(-s)|<=p^(-sigma), summable over primes, and -Log(1-v)=O(|v|) uniformly as v->0 (the finitely many remaining factors are valid). Thus using LSeries_eulerProduct_exp_log, summing and exponentiating gives |P(x)|>=1. The explicit positivity lemma applies also t=0 despite the comment mentioning nonzero y. Source Nonvanishing.lean:221–314. The Euler-product exponential identity is a named imported dependency here; its ordinary derivation by expanding finite products and absolute convergence follows uniqueness of factorization, with log sum and exp limit justified by the above bound. The exact transitive imported implementation is not claimed audited.

Suppose L(1+it,chi)=0 and (chi^2!=chi_0 OR t!=0).
- The principal factor is O(x^(-1)) as x->0+, from its residue prod_{p|N}(1-1/p) (empty product=1 at N=1).
- The assumed zero lies at a regular point since t!=0 or chi!=chi_0. Analyticity gives L(1+x+it,chi)=O(x).
- The last factor is O(1): t!=0 or chi^2!=chi_0 prevents the pole at 1.
Hence |P(x)|=O(x^(-3+4))=O(x)->0, contradicting >=1. This does not require assuming the zero is simple; holomorphy and vanishing give at least first order. The formal proof composes IsBigO inequalities into 1=O(x), then uses x=o(1) for contradiction (Nonvanishing.lean:316–381).
The exceptional branch is essential. If t=0 and chi^2=chi_0, the last factor is principal with pole; the resulting exponent for a simple zero is -3+4-1=0, not positive. The source does not try to deduce a contradiction in that case.

## 4. Nonprincipal quadratic at s=1: positivity carried across the entire plane
Assume chi^2=chi_0, chi!=chi_0, and L(1,chi)=0. Set a(n)=sum_{d|n}chi(d), n>=1. This is multiplicative as convolution of multiplicative functions; a(1)=1. On prime powers,
 a(p^k) = 1 (chi(p)=0);
          k+1 (chi(p)=1);
          1 for even k and 0 for odd k (chi(p)=-1).
Therefore a(n)>=0 real for every n, using prime factorization. The arithmetic-function value at n=0 is defined as zero. The L-series of a converges absolutely for Re(s)>1 by absolute convolution, even though the source needs only abscissa<=1.
Define F(s)=zeta(s)L(s,chi) for s!=1, F(1)=L'(1,chi). The hypothesis L(1,chi)=0 and zeta residue one yield
 F(s)=[(s-1)zeta(s)] [ (L(s,chi)-L(1,chi))/(s-1) ].
The bracketed functions continuously extend at 1 to 1 and L'(1,chi), respectively. F is holomorphic off 1 and continuous at 1, hence entire by the removable singularity theorem. On Re(s)>1 it equals the L-series with coefficients a(n). At -2, zeta(-2)=0 and L is entire, hence F(-2)=0. Source Nonvanishing.lean:75–112,126–211, especially F_differentiable and F_neg_two.

The decisive lemma is LSeries.positive_of_differentiable_of_eqOn (LSeries/Positivity.lean:68–82). In its full generality a>=0, a(1)>0, f entire, f agrees with LSeries(a) for Re(s)>b, b real and abscissa(a)<=b. Given real y take c=max(b,y)+1. At c, f(c)>0 by sum positivity (a(1) term). Since equality holds in an open neighborhood of c, every derivative is equal to its L-series derivative:
  (-1)^k f^(k)(c)=sum_{n>=1}a(n)(log n)^k n^(-c) >=0.
This includes k=0; for k>=1 use it in the Taylor expansion at c. Because f is ENTIRE, its Taylor series at c converges at every y, in particular y<=c:
  f(y)=f(c)+sum_{k>=1} [(-1)^k f^(k)(c)](c-y)^k/k! >=f(c)>0.
Each summand is real nonnegative, so the comparison is in ComplexOrder, not an inequality of absolute values. The exact source uses Differentiable.apply_le_of_iteratedDeriv_alternating (Complex/Positivity.lean:75–83), proving it via f(-z) and subtracting the constant term. No termwise continuation of the original Dirichlet series to y is required; Taylor convergence follows from the hypothetical entire extension. Take y=-2, contradict F(-2)=0. This excludes the quadratic zero exactly at 1. It does NOT exclude a possible exceptional real zero beta<1 by itself.

## 5. Joining the cases and formal pole convention
Nonvanishing.lean:385–415 splits chi^2=chi_0 and s=1 from its negation. In the former, admissibility chi!=chi_0 OR s!=1 forces chi nonprincipal, so section 4 applies; otherwise write s=1+i Im(s) and use section 3. The strict half-plane uses section 2.
At modulus one, L=zeta. Away from s=1 the analytic nonvanishing result holds without any convention. At s=1 the formal totalized zeta value is (gamma_E-log(4*pi))/2, nonzero since gamma_E<1<log(4*pi). This finite value is NOT the meromorphic value at a pole, NOT the Laurent constant, and NOT the regularized residue-one value. Source ZetaAsymp.lean:418–449. The RH family wrapper uses this separate formal fact only in the modulus-one branch. A family member is either modulus one or nonprincipal, by F.adm. Consequently every member is nonzero at all formal s with Re(s)>=1; the true analytic treatment of s=1 is the regularization in RUN2. This source wrapper has no extra assumption excluding quadratic real zeros in the critical strip.

## 6. Logarithmic derivatives: follow the actual convolution proof
Dirichlet.lean:372–442. The arithmetic identity sum_{d|n}Lambda(d)=log n follows from prime factorization: a prime p^e contributes e log p. Twisting gives
 (chi Lambda)*chi = chi log.
For Re(s)=sigma>1, sum Lambda(n)n^(-sigma) converges absolutely because 0<=Lambda(n)<=log n, and sum (log n)n^(-sigma) converges. Also |chi(n)|<=1; twisting cannot increase absolute terms. For the formal series at n=0 the term is zero, so no singular log 0 argument enters. By absolute convolution,
 [sum chi(n)Lambda(n)n^(-s)] L(s,chi) = sum chi(n)log(n)n^(-s) = -L'(s,chi).
Deriv.lean:45–100 proves differentiation in the open half-plane beyond absolute convergence: pick x0<y0<Re(s) with summability at x0, use a uniform summable majorant on Re(z)>y0, then apply holomorphic termwise derivative theorem. Higher derivatives follow by induction and the equality of abscissae for logarithm-weighted series (Deriv.lean:102–144). The latter follows from log n>=1 eventually, and forward log-weighted summability in the same open half-plane. Division by L is legal by section 2. Equality between series and continued LFunction, and equality of derivatives, holds on the open domain Re(s)>1. The modulus-zero special case is delta_1 and both log derivative sides vanish. For modulus one use chi=1, then transfer the derivative to zeta by equality on an open neighborhood. No Euler-product nonvanishing on the critical strip needed.

## 7. Complex asymptotic at 1, without assuming more than a simple pole
ZetaAsymp.lean:62–145,196–259,316–378. For real sigma>=1 use
 T_n(sigma)=int_n^(n+1) (u-n)u^(-sigma-1) du, n>=1.
It is nonnegative and bounded by 1/n^2 uniformly on sigma>=1, so T=sum T_n is continuous there by dominated summation (each integrand is continuous in sigma on its finite positive interval). At sigma=1,
 T_n(1)=log(n+1)-log n-1/(n+1),
 sum_{n=1}^M T_n(1)=log(M+1)-H_(M+1)+1 ->1-gamma_E.
For sigma>1 direct integration gives the finite identity
 sum_{n=1}^M T_n(sigma)
 = (1-(M+1)^(1-sigma))/(sigma-1)
   - [sum_{n=1}^M n^(-sigma)-M(M+1)^(-sigma)]/sigma.
All boundary powers vanish in the limit because sigma>1. Thus T(sigma)=1/(sigma-1)-zeta(sigma)/sigma. Rearranging,
 zeta(sigma)-1/(sigma-1)=1-sigma T(sigma) -> gamma_E as sigma->1+.
For complex s put h(s)=zeta(s)-1/(s-1). It is holomorphic off 1; residue-one says (s-1)h(s)->0, i.e. h(s)=o(1/(s-1)). The removable-singularity criterion gives a holomorphic extension at 1; uniqueness of the limit on the real right-hand approach forces h(1) for this extension to be gamma_E. No extrapolation from the real limit alone. This justifies RUN2's regularized f(1)=1, f'(1)=gamma_E using f(s)=1+(s-1)h(s). The formal totalized zeta value uses a different subtraction involving Gamma_R and is irrelevant to this derivative.

## 8. Integration and outstanding boundaries
Read original CharFamilyLFunctionNeZeroOfOneLeRe.lean and lemmaL.lean again: family nonvanishing is used only for Re(s)>=1 in lemmaL, and for excluding 1 in poleData; 0<theta<1 and delta>0 remain explicit hypotheses of lemmaL with WindowHyp. For theta<Re(s)<1 any hypothetical zero has positive real part and is a member of zeroSet, regardless of whether real or complex. RUN1's window theorem yields Re(s)<=theta, contradiction. No circular use of the sought RH or of nonvanishing in Re(s)<1 in these imported lemmas. No assumptions added, no claims of exact kernel dependency graph, full coverage or URT superiority. Deep imported holomorphic Taylor, Euler-product, residue, removable singularity and trivial-zero implementation proofs remain to be independently mapped; classical human derivations above give their role but are not a full transitive expansion. Source classification: SOURCE-MATCHED with cited theorem bodies; finite regression only. Do not use the latest main revision's changed hashes as proof-equivalence evidence.

## 9. Executed reproducible finite regression (Node.js or ES2020)
The checks test the coefficients, exact rational-circle identity (BigInt), twisted convolution, order bookkeeping and finite zeta identity. These are regression examples, not evidence for the universal analytic theorem. Negative control explicitly detects failure to get a positive exponent when the third factor is singular and the assumed zero is simple.

~~~javascript
const counts={primePower:0,quadraticConvolution:0,unitCircle:0,twistedConvolution:0,poleOrder:0,zetaAux:0};let maxErr=0;const ck=(b,m)=>{if(!b)throw Error(m)};
const chars=[{q:3,a:[0,1,-1]},{q:4,a:[0,1,0,-1]},{q:5,a:[0,1,-1,-1,1]},{q:8,a:[0,1,0,-1,0,-1,0,1]}];
const primes=[2,3,5,7,11,13,17,19];
function lam(n){if(n<2)return 0;for(let p=2;p<=n;p++)if(n%p===0){let m=n;while(m%p===0)m/=p;return m===1?Math.log(p):0;}return 0}
for(const {q,a} of chars){const chi=n=>a[n%q];for(const p of primes)for(let k=0;k<=12;k++){let v=0;for(let j=0;j<=k;j++)v+=chi(p)**j;let w=chi(p)===0?1:chi(p)===1?k+1:k%2?0:1;ck(v===w&&v>=0,"prime power");counts.primePower++}
for(let n=1;n<=512;n++){let s=0,t=0;for(let d=1;d<=n;d++)if(n%d===0){s+=chi(d);t+=chi(d)*lam(d)*chi(n/d)}ck(s>=0&&(n!==1||s===1),"coeff");counts.quadraticConvolution++;ck(Math.abs(t-chi(n)*Math.log(n))<1e-12,"twist");counts.twistedConvolution++;}}
for(let u=-25n;u<=25n;u++)for(let v=1n;v<=25n;v++){const D=u*u+v*v,A=v*v-u*u,B=2n*u*v;ck(A*A+B*B===D*D,"circle");ck(3n*D*D+4n*A*D+A*A-B*B===2n*(A+D)**2n,"343");counts.unitCircle++}
for(let m=1;m<=32;m++){ck(-3+4*m>=1,"regular third");counts.poleOrder++;ck(-3+4*m-1>=0,"singular third");counts.poleOrder++}ck(-3+4-1===0,"negative control");
for(const s of [2,3,4,5])for(const N of [1,2,7,13,64,128]){let sum=0,hs=0;for(let n=1;n<=N;n++){sum+=(n**(1-s)-(n+1)**(1-s))/(s-1)-n*(n**(-s)-(n+1)**(-s))/s;hs+=n**(-s)}let target=(1-(N+1)**(1-s))/(s-1)-(hs-N*(N+1)**(-s))/s;let e=Math.abs(sum-target);ck(e<1e-12,"finite zeta integral");maxErr=Math.max(maxErr,e);counts.zetaAux++}
console.log({counts,total:Object.values(counts).reduce((x,y)=>x+y,0),maxErr,negativeControl:"simple zero with third-factor pole gives exponent zero; cannot use 3-4-1 limit proof",status:"PASS"});
~~~

Actual V8 execution output:
~~~json
{"counts":{"primePower":416,"quadraticConvolution":2048,"unitCircle":1275,"twistedConvolution":2048,"poleOrder":64,"zetaAux":24},"total":5875,"maxErr":4.163336342344337e-16,"negativeControl":"simple zero with third-factor pole gives exponent zero; cannot use 3-4-1 limit proof","status":"PASS"}
~~~
Counts 5875 cases (plus the stated negative control); each unit-circle case uses two exact BigInt assertions. Four actual quadratic characters on residue classes modulo 3,4,5,8. Finite floating-point checks not proof of any limit. Six locked library modules and two original RH adapter modules inspected; no Lean execution. Source paths plus hashes preserved, no change of hypotheses.

RESUME HERE: independently audit RUN1's quantitative analytic Cauchy derivative and tail argument against the exact pinned LandauTheorems files, in particular the nearest-pole choice, radius isolation and all residue sign/conjugate branches; produce an explicit lemma-by-lemma audit ledger distinguishing local hypotheses from global window existence. Locate exact producer of LSeries_eulerProduct_exp_log in the locked Mathlib import graph and attach its source body as a leaf; do not redo the two line-one branches above. Check latest upstream path migration without assuming equivalence; coordinate audit/editor. The upstream arithmetic window producers remain the separate prime-window/geometry lanes' task.

HANDOFF TO: integration, proof editor, formal audit, literature, prime-window, character-box lanes. The boundary nonvanishing argument, exceptional-at-one quadratic case, log derivative and complex asymptotic are now human-readable on the original pin. The original window remains a conditional input.

# Landau run 2 — Mellin, conjugation, and pole-data obligations

2026-11-24. RESULT: SOURCE-MATCHED human derivation of the five local analytic leaves left open in RUN1, plus completion of the modulus-one Mellin proof body and explicit Mathlib provenance. No independent Lean kernel run, no proof of upstream arithmetic window, no URT speed claim. The project remains OPEN. Read swarm protocol, queue, expansion, AGENTS and continuity/state/log/protocol; latest physical CI PASS 790adae is unrelated to RH correctness. Read current integration/editor/math, prime-window, character, theta, Galois, positivity, literature, kernel and acceleration handoffs. The prime lane owns the arithmetic producer and is not duplicated here.

## Source anchors

All original project paths below are relative to `src/Development/AutomorphicArithmetic/DedekindLFunctions/` at [40e56bab026552e089d7afcfeff08d2defb9c005](https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005).
- CharFamily.lean 81c8dfd66d910d083d5bc88c664c7917fdbdfe96 (ramp, Gchi, Gm, adm).
- LandauZeroFreeCriterion.lean 54fd0de979e0dad6ac7709ad8ecbec8a29e21872 (seven PoleData fields).
- LandauTheorems/MellinRamp.lean f0a83b2bfc171061bfd86c2e00a0a5b963a3122e (mellin_ramp).
- LandauTheorems/mellinGchiOfNeOne.lean 675a25d278977948c8327f0e1e2e31fb3a990a7d (full body).
- LandauTheorems/mellinGchiModOne.lean 11776c96437e9a4e53fbc3ff06c5e2e8e3c640bc (full body, including previously unread final lines).
- LandauTheorems/GchiGrowth.lean 0adbad2399f91f6cd547c9195d4464ccb5512d45.
- LandauTheorems/measurableGchi.lean 3b014d914efcdcf58e8de1823570aeb3c64babf3.
- LandauTheorems/GchiConj.lean 63cdd6a1ec3e729a5465803a19ebcf5ab9c9577c.
- LandauTheorems/LFunctionConj.lean e43f4fab2a28eb31e20c5815ae6a923fd3d5b3de.
- LandauTheorems/poleData.lean 1f7fdc4409d2f1185700764c51d5c17a907d76e1 (full body).
- LandauTheorems/CharFamilyLFunctionNeZeroOfOneLeRe.lean e3aaad883b956e2d45c50bdf6d58367d6f9ef109.
- LandauTheorems/lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f.
- LandauTheorems/ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002.

Upstream main observed 0e40c084e27c44a3584e271cb14e7dd3bce9aa63 (2026-11-24 08:19:26 UTC, CI merge message). At this revision CharFamily and LandauZeroFreeCriterion still have changed blobs cac521ab291c9dab261508613d4d12195cdfb799 and f4c5124f8a0188f85b60b2687864d531f9c0a3d8, and old mellinGchiModOne and poleData paths return 404. No semantic equivalence established. Original pin only.

## 1. Exact ramp transform, including absolute integrability

Let n>=1, s complex, sigma=Re(s)>1, and r_n(y)=max(y/n-1,0). For y>0 powers use the real logarithm. Since r_n=0 for 1<y<=n, the integral is over y>n. Both y^(-s) and y^(-s-1) are absolutely integrable on (n,infinity). On that interval,
  r_n(y)y^(-s-1)=y^(-s)/n-y^(-s-1).
Integrating gives n^(-s)/(s-1)-n^(-s)/s=n^(-s)/(s(s-1)). Both denominators are nonzero since sigma>1. No branch issue for positive bases. Because r_n is nonnegative,
  integral |r_n(y)y^(-s-1)| dy=n^(-sigma)/(sigma(sigma-1)).
This is the real-argument version of the same formula (mellin_ramp, mellin_Gchi_of_ne_one_norm). At n=0 the original ramp term is zero because von Mangoldt(0)=0, not by substituting n=0 into the positive-n identity. The series convention LSeries.term at n=0 is zero. This is relevant to the modulus-one proof, which explicitly includes n=0.

For arbitrary f:N->C, each y has finite support: n>floor_nat(y) implies r_n(y)=0 (and n>=1); so the pointwise sum equals the original finite ramp. To interchange integral and infinite sum, pointwise finiteness alone is NOT enough. The source adds the assumption of LSeriesSummable for f(n) Lambda(n) at s. Then
  sum_{n>=1} integral |Lambda(n) f(n) r_n(y) y^(-s-1)|dy
  = sum_{n>=1} |Lambda(n) f(n)| n^(-sigma)/(sigma(sigma-1)) < infinity.
Hence absolute-integral summability justifies the interchange. An extra integrable correction g(y) can be inserted as term zero, with all positive-n terms shifted by one. This is precisely mellin_Gchi_of_ne_one_ramp, via hasSum_integral_of_summable_integral_norm; the principal case uses mellin_Gchi_modOne_sum and the ordinary von Mangoldt summability. There is no unproved cancellation hypothesis.

## 2. Two distinct Mellin corrections

Nonprincipal chi (N>0, chi!=1): b=L'(1,chi)/L(1,chi), which exists because L is entire and nonzero at 1. On sigma>1, set D=L'(s,chi)/L(s,chi). The imported twisted von Mangoldt identity supplies sum chi(n)Lambda(n)n^(-s)=-D, with absolute summability. The correction in Gchi is y b; its Mellin integral is b/(s-1). Thus
  M_chi(s)=-D/[s(s-1)]+b/(s-1)=-(D-s b)/[s(s-1)].
The equality between the analytically continued LFunction and the series, and between their derivatives, holds on the open half-plane sigma>1. These are both explicit source rewrites; no assertion about derivative equality on the critical strip is used.

Modulus one chi: chi(n)=1 even at zero modulo 1 (trivial group). Let gamma_E be Euler's constant. Gchi=ramp - y log y+(1+gamma_E)y. The Mellin integrand correction is E(y)=(1+gamma_E)y^(-s)-log(y)y^(-s). Let e=(sigma-1)/2>0. On y>=1,
  log y<=y^e/e,
  |log(y)y^(-s)|<=y^(-sigma+e)/e (exponent <-1),
  |log(y)y^(1-s)|<=y^(1-sigma+e)/e -> 0.
This proves absolute integrability and the missing boundary condition. Differentiate H(y)=log(y)y^(1-s):
  H'=(1-s)log(y)y^(-s)+y^(-s).
Both H(1)=0 and H(infinity)=0. Integrate, use integral y^(-s)dy=1/(s-1), then solve for integral log(y)y^(-s)dy=1/(s-1)^2. This is mellin_Gchi_modOne_log_int and _log. All inequalities use Re(s)>1, not s real.
For the principal summands, the absolute integrals coincide with the real sigma term since Lambda(n)>=0 and r_n>=0. Source hsum uses LSeriesSummable_vonMangoldt at sigma, divides by sigma(sigma-1), then matches the norm integrals. The correction is integrable separately. Thus the final body of mellin_Gchi_modOne rewrites the finite ramp as E+tsum, interchanges integrals, applies the ordinary logarithmic derivative identity D=zeta'/zeta, and simplifies:
  M_1(s)=-D/[s(s-1)]-1/(s-1)^2+(1+gamma_E)/(s-1)
         =-[D+1/(s-1)+1-(1+gamma_E)s]/[s(s-1)].
The previously unread closing proof body is accounted for. This formula is only asserted for Re(s)>1.

## 3. Measurability and growth

For fixed integer k, finite sums of y->max(y/n-1,0) times constants are measurable (n=0 totalized division also measurable). The natural floor k=floor_nat(y) is measurable and countably valued. For a family f_k of measurable functions, y->f_floor(y)(y) is measurable by countable partition, equivalently measurable_from_prod_countable_left and measurable product map. Hence ramp is measurable on all real y; so is Gchi after adding the branch-specific corrections (Real.log is the formal total function).
For y>=1, |chi(n)|<=1, 0<=Lambda(n)<=log n<=n for n>=1, and r_n(y)<=y/n. Every summand has norm <=y (zero n=0), and there are floor_nat(y)+1<=y+1<=2y terms. Thus |ramp|<=2y^2. Nonprincipal |Gchi|<=(2+|b|)y^2, using y<=y^2. Principal |Gchi|<=(3+|1+gamma_E|)y^2, since 0<=log y<=y. This is Gchi_growth_ramp and Gchi_growth, with the original constants, not optimized estimates. Note growth itself holds for all characters; the adm restriction is needed for later pole construction.

For u>0, y=e^u>=1 and sigma>2:
  |Gchi(e^u)e^(-su)|<=max(C,0)e^(-(sigma-2)u).
The right side has finite integral. This justifies poleData_integrable and finite-family integral linearity. Source uses Re(s)>2 here (even though Mellin evaluation is valid on Re(s)>1). For poleData_change, the increasing injective smooth map u->e^u sends (0,infinity) onto (1,infinity). Its Jacobian is e^u; multiplying (e^u)^(-s-1) by e^u gives e^(-su), so the stated Laplace integral follows with no extra factor. No claim that the Laplace integral converges in Re(s)>theta.

## 4. Global conjugation, not just Euler-product conjugation

The local source LFunctionConj proves conjugation for ALL complex s, including totalized exceptional values. For x>=0, the formal complex power satisfies x^(conj s)=conj(x^s) (conj_cpow, arg x!=pi, including the formal x=0 convention). Gamma_R(s)=pi^(-s/2)Gamma(s/2) respects conjugation by Complex.Gamma_conj. For a in [0,1], on Re(s)>1, the absolutely convergent Hurwitz series sum 1/(n+a)^s respects conjugation termwise. At a=0,n=0 use the same formal power/division conventions, not an ordinary divergent term.

To cross the pole, define the specific regularization from the code:
  R_a(s)=HurwitzZeta(a,s)-1/[(s-1)Gamma_R(s)].
This, not unregularized Hurwitz zeta, is entire, using differentiableAt_hurwitzZeta_sub_one_div at 1; elsewhere use holomorphy of Hurwitz zeta and differentiability of reciprocal Gamma_R. The regularizing term respects conjugation, even at the totalized s=1, and F(s)=conj(R_a(conj s)) is entire by conjugate-chain differentiability. F=R_a on Re(s)>1; by the holomorphic identity theorem on C (source eq_of_eventuallyEq at 2), F=R_a everywhere. Undo regularization algebraically to obtain Hurwitz conjugation globally. Every a in R/Z is represented by fractional part in [0,1), so the result applies to all circle classes. Using
  L(s,chi)=N^(-s) sum_{j in Z/NZ} chi(j) HurwitzZeta(j/N,s)
and conj(chi(j))=chi^(-1)(j) (including nonunits where both zero), get
  L(conj s,chi^(-1))=conj(L(s,chi)).
These are the actual source steps LFunctionConjugation.ofReal_cpow_conj through hurwitz_conj and LFunction_conj. In particular the conjugate zero iff inverse-character zero is now explained in the critical strip, not extrapolated from the convergent series without an identity theorem.

For Gchi_conj_ramp use real weights Lambda and r_n, so finite-sum conjugation gives ramp(chi^-1)=conj(ramp(chi)). For the principal correction the added real terms are unchanged. For nonprincipal chi, chi^-1 is nonprincipal and the preceding relation at 1 yields conjugate L values. Differentiating the conjugate-composed function gives conjugate derivatives at conjugate points; the local deriv_conj_comp_conj even treats the formal nondifferentiable branch (both deriv values defined as zero). Thus b_inv=conj(b), and Gchi_inv(y)=conj(Gchi(y)). The averaging identity Re Gchi=(Gchi+Gchi_inv)/2 now holds for every real y. A complex character cannot in general be replaced by its own conjugate: the regression uses the actual order-four character modulo 5 and exhibits a nonreal ramp.

## 5. Zeta regularization and all seven family PoleData fields

Source poleData_char uses the entire f(s)=(s-1)zeta(s) away from 1 and f(1)=1. The residue-one limit gives continuity at 1; removable-singularity theorem makes f entire. The difference quotient at 1 equals zeta(s)-1/(s-1) for s!=1 and tends to gamma_E, so f'(1)=gamma_E. Away from 1, f'=zeta+(s-1)zeta'. Consequently f'/f=D+1/(s-1) for Re(s)>1. The abstract transform with k=1 has numerator f'/f-s gamma_E+1-s, precisely the modulus-one Mellin expression. For nonprincipal f=L and k=0, it is the other expression. The subtraction at s=1 in the abstract numerator is essential; its divided difference removes a spurious pole. At actual zeros rho!=0,1, factoring f=(s-rho)^m h and subtracting m times the divided difference of 1/[s(s-1)] leaves an analytic remainder, as in RUN1. Neither a zero of f at 1 nor a pole of Phi at 1 is introduced. Importantly, the locked Mathlib value zeta(1)=(gamma_E-log(4*pi))/2 is a nonzero totalized convention, not f(1), not the meromorphic zeta value, and not the usual Laurent constant gamma_E.

For finite admissible F and a_i>0, define Z={rho: Re(rho)>0 and some L_chi(rho)=0 or L_chi(conj rho)=0}, Phi=sum_i a_i(P_i+P_inv_i)/2 using admissibility of inverse as well. Seven fields:
- meas: finite real-part composition and weighted sum of measurable Gchi(e^u).
- growth: sum_i a_i C_i times e^(2u) bounds absolute value, by the triangle inequality and positive weights.
- laplace: integrate the exact conjugate-average identity using integrability for each original and inverse term.
- pos: by definition of Z.
- diff: outside Z in Re>0 every original and inverse L-value is nonzero and s!=0, so each P is analytic and finite sum differentiable.
- iso: each entire regularized f is nonzero at 1, hence not identically zero. Its zeros are isolated in punctured neighborhoods of every point, not merely each zero. Intersect finitely many such eventual conditions; any w in that intersection is not in Z. This excludes accumulations in the half-plane.
- pole: at rho in Z choose original/inverse multiplicities m_i,m'_i. At least one positive multiplicity follows from the witness; all others nonnegative. S=sum_i(a_i/2)(m_i+m'_i)>0. rho!=0 and rho!=1 by Re>0 and imported closed Re>=1 nonvanishing. Residue c=-S/[rho(rho-1)]!=0, and when rho real 0<rho<1, c>0 real. Remainder is finite analytic sum; punctured eventual equalities combined via finite intersection. No assumption excluding real exceptional zeros in (0,1); they are exactly covered by positive residue. For complex zeros the residue need not be real but cannot cancel. Empty F is vacuous and Z empty.

The precise dependency join is `poleData F` plus `windowHypU_of_windowHyp F hdelta h` -> `landau_window` with 0<theta<1 and delta>0 -> `lemmaL`. The latter excludes Re>=1 using imported nonvanishing and otherwise uses s in Z if theta<Re(s)<1. Then `zeroFree_of_rpow_window` applies `windowHyp_of_rpow` and `lemmaL`. No converse or proof of existence of the windows is supplied here. RUN1 covers the signed Cauchy/tail argument; these five leaf obligations fill its explicitly listed local gaps.

## 6. Locked external provenance (not a kernel dependency audit)

RH lake-manifest.json blob b4d1ec31575a26b2159ec3a262b482bc051f3f6f locks mathlib4 at [0df444a360eaa60ab8c11dca51a86af692955474](https://github.com/leanprover-community/mathlib4/tree/0df444a360eaa60ab8c11dca51a86af692955474); lean-toolchain blob a8afa7d1b02d96f0671eba854a8dc4b416beb473 specifies v4.33.1. Retrieved locked library files, named statements verified by reading:
- Mathlib/NumberTheory/LSeries/Dirichlet.lean f718ca1edc35ffa92b318b2f74ddcef0e2e754a3 lines 381,402,409,436: von Mangoldt summability and log derivatives, precisely Re(s)>1.
- LSeries/DirichletContinuation.lean 9ccc38f52d669a88285a904e59dbb562ade5aba5 lines 67,75,79,98: modulus-one identity, L-series and derivative equality, nonprincipal differentiability.
- LSeries/Nonvanishing.lean 610bd56365d49c5ffa9ebeb29e0a383c768248e2 lines 398–415: LFunction nonvanishing Re>=1 under chi!=1 or s!=1; at nonprincipal s=1; zeta closed half-plane including its explicit totalized value. This is not RH and does NOT exclude any zero with Re<1.
- LSeries/RiemannZeta.lean 3c92195fce20df7fda41cfd823b3266f83cf3070 lines 139,242: differentiability away from 1, residue-one limit.
- LSeries/HurwitzZeta.lean 1fd05c4f234bb288bc97bd93c02f63e1e5623983 lines 66,72,88: differentiability, convergent series and regularized differentiability at 1.
- LSeries/ZMod.lean 0c6ccbe61ab0645b0b8f713af0f2398de6fcc936 lines 87–93,131–134: finite residue-class representation and continuation consequences.
- LSeries/HurwitzZetaEven.lean e24ca61b0261ee1627bdeaeaaac8ef7bcec437ba lines 613,630: continuation leaves.
- LSeries/HurwitzZetaValues.lean 4bdfedf2cf474a721e0687852a5782f304781eb7 inspected; not a direct named producer in this run.
- Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean 6846dc699ecd29cc8a1754c1680176210969ffd1: right-hand asymptotic at line 316, complex punctured asymptotic in continuity section, exact totalized zeta(1) formula and nonzero proof at lines 417–449.

No extra mathematical hypotheses introduced. These imported named theorem statements and selected bodies are located, not a fully expanded independent proof of the library or exact axiom reachability. In particular the classical nonvanishing-on-line-one proof and the absolute convergence/log-derivative Euler-product prerequisites are next audit targets. A source import of Mathlib is not a kernel graph. No Lean/Lake executable available in local container.

## 7. Executed regression certificate

Copy this code and append `console.log(run())` in Node.js, or run in ES2020. It was executed in V8 this session. Numerical quadrature checks evaluate ramp and Jacobian after the positive exponential substitution, and integration-by-parts log integral at real and genuinely complex s. Exact BigInt checks test the cleared modulus-one denominator algebra. Character modulo 5 tests use actual nontrivial character values, not a substitute proof; finite norm and conjugation checks are independent regression examples. They are not universal proofs or Lean validation.

~~~javascript
// Node.js (or any ES2020 JS engine), no dependencies.
// Finite regression only; not Lean verification or proof of analytic continuation.
function run() {
 const counts={ramp:0,log:0,change:0,algebra:0,character:0,growth:0};
 const maxErr={ramp:0,log:0,change:0};
 const check=(b,m)=>{if(!b)throw Error(m)};
 const add=([a,b],[c,d])=>[a+c,b+d], neg=([a,b])=>[-a,-b];
 const mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c];
 const div=([a,b],[c,d])=>[(a*c+b*d)/(c*c+d*d),(b*c-a*d)/(c*c+d*d)];
 const conj=([a,b])=>[a,-b], norm=([a,b])=>Math.hypot(a,b);
 const exp=([a,b])=>[Math.exp(a)*Math.cos(b),Math.exp(a)*Math.sin(b)];
 const scale=(a,[b,c])=>[a*b,a*c];
 function integrate(f,T,N=65536) {
   let z=[0,0]; const h=T/N;
   for(let i=0;i<=N;i++)z=add(z,scale(i===0||i===N?1:i%2?4:2,f(i*h)));
   return scale(h/3,z);
 }
 function compare(got,want,k) {
   const err=norm(add(got,neg(want)))/Math.max(1,norm(want));
   maxErr[k]=Math.max(maxErr[k],err);
   check(err<2e-7,k+" residual "+err);counts[k]++;
 }
 for(const a of [1.25,2,4])for(const b of [0,.7,3]){
   const s=[a,b], sm=[a-1,b], T=40/(a-1);
   compare(integrate(t=>scale(t,exp(scale(-t,sm))),T),div([1,0],mul(sm,sm)),"log");
   for(const n of [1,2,13]){
     const v=exp(scale(-Math.log(n),s));
     const expected=div(v,mul(s,sm));
     compare(integrate(t=>mul(v,mul(exp(scale(-t,sm)),[-Math.expm1(-t),0])),T),expected,"ramp");
     // Jacobian after y=e^u, with u=log(n)+t: ramp*e^{-su}.
     compare(integrate(t=>scale(Math.expm1(t),exp(scale(-(Math.log(n)+t),s))),T),expected,"change");
   }
 }
 // Exact Gaussian-integer cross-multiplication of the modulus-one correction:
 // -D/(s(s-1)) - 1/(s-1)^2 + (1+g)/(s-1)
 // = -(D+1/(s-1)+1-(1+g)s)/(s(s-1)).
 // Multiply both sides by s(s-1)^2. All operations exact BigInt.
 const A=([a,b],[c,d])=>[a+c,b+d], M=([a,b],[c,d])=>[a*c-b*d,a*d+b*c];
 const N=([a,b])=>[-a,-b], eq=([a,b],[c,d])=>a===c&&b===d, one=[1n,0n];
 for(const x of [2n,3n,5n])for(const y of [-3n,0n,2n])
 for(const d of [-2n,0n,7n])for(const g of [-1n,0n,3n]){
   const s=[x,y], q=A(s,N(one)), D=[d,2n], G=[g,0n];
   const lhs=A(A(N(M(D,q)),N(s)),M(M(A(one,G),s),q));
   const rhs=N(A(A(M(D,q),one),M(A(one,N(M(A(one,G),s))),q)));
   check(eq(lhs,rhs),"mod-one numerator");counts.algebra++;
 }
 // Genuine order-four character modulo 5 (generator 2): chi(0)=0.
 const chi=[[0,0],[1,0],[0,1],[0,-1],[-1,0]];
 function lambda(n){if(n<2)return 0;for(let p=2;p<=n;p++)if(n%p===0){let k=n;while(k%p===0)k/=p;return k===1?Math.log(p):0;}return 0;}
 function ramp(y,inv){let z=[0,0];for(let n=1;n<=Math.floor(y);n++){
   let c=chi[n%5];if(inv)c=conj(c);
   z=add(z,scale(lambda(n)*Math.max(y/n-1,0),c));
 }return z;}
 for(let i=0;i<=160;i++){
   const y=1+i/4, z=ramp(y,false), w=ramp(y,true);
   check(norm(add(conj(z),neg(w)))<1e-12,"character conjugation");counts.character++;
   check(norm(z)<=2*y*y+1e-12,"ramp bound");counts.growth++;
 }
 check(Math.abs(ramp(3,false)[1])>0,"negative control: inverse character needed");
 return {counts,maxErr,negativeControl:"nonreal ramp at y=3",status:"finite regressions PASS"};
}

console.log(run());
~~~

Actual output:
~~~json
{
  "counts": {
    "ramp": 27,
    "log": 9,
    "change": 27,
    "algebra": 81,
    "character": 161,
    "growth": 161
  },
  "maxErr": {
    "ramp": 5.618033235387036e-12,
    "log": 5.366109301309177e-12,
    "change": 5.618010200314365e-12
  },
  "negativeControl": "nonreal ramp at y=3",
  "status": "finite regressions PASS"
}
~~~

Counts are 466 finite regressions plus one nonreal-ramp negative control. Five new analytic source files fully read and translated; previously partial modulus-one final body completed; six additional already-seen analytic files cross-checked for join, plus the definitions and locked Mathlib files. Seven fields preserved, no removed premises. Human proof local analytic construction now source-matched, not kernel-validated. No meaningful full-proof completion percentage; separate arithmetic producer remains outstanding.

RESUME HERE: independently reconstruct the locked Mathlib Nonvanishing.lean proof of LFunction_ne_zero_of_re_eq_one and its real quadratic exceptional-at-1 branch (including why the junk value of zeta is irrelevant away from 1). Trace the positivity/Dirichlet-series contradiction to its actual lemmas, then audit the named Dirichlet.lean log-derivative identities and ZetaAsymp complex asymptotic. Coordinate literature lane; do not redo prime-window or host producer. Request audit lane review both Landau chapters against pinned sources and preserve unresolved exact-kernel dependency boundary.

HANDOFF TO: integration, proof editor, formal audit, literature, prime-window and character-box lanes. The five local Mellin/growth/measurability/conjugation leaves and modulus-one final body now have a human reconstruction. No physics gates touched.

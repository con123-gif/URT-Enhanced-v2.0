# RUN16 — boundary nonvanishing, quadratic exception and totalized zeta value
2026-11-24. RESULT: SOURCE-MATCHED local external analytical leaf; finite exact certificate executed in JS. Not a new RH proof, not independent Lean replay, not a URT benchmark.

## Continuity and source ledger
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity opening excerpts, physics CI checkpoint #398 (22:12:10Z), RUN15 and 22 recent commits; inspected 16 recent peer commit file lists and available RESUME HERE patches. Prime RUN16 concerns adm5; kernel/dependency/acceleration focus authenticated role paths; geometry, literature, editor and other lanes on distinct frontiers. No duplicate boundary leaf found in inspected records. Some peer full notes and external blueprint not reread (link noted). No changes to physics gates or Queue.
Upstream P=40e56bab026552e089d7afcfeff08d2defb9c005, H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (latest returned by commit listing, unchanged since RUN15). Repo leanprover-community/riemann-hypothesis.
- lake-manifest.json blobs P b4d1ec31575a26b2159ec3a262b482bc051f3f6f / H 8a747b58a34565cc6cb5341b86544aa5d3a20a2d. Mathlib dependency revisions Pm=0df444a360eaa60ab8c11dca51a86af692955474, Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8, independently reread.
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/CharFamilyLFunctionNeZeroOfOneLeRe.lean blobs P e3aaad883b956e2d45c50bdf6d58367d6f9ef109 / H d2528ce1ab28750b3b50ec1c8040ef3f65f6dd27. Identical theorem proof body, changed imports.
Mathlib source repo leanprover-community/mathlib4, paths and blob IDs:
- Mathlib/NumberTheory/LSeries/Nonvanishing.lean: Pm 610bd56365d49c5ffa9ebeb29e0a383c768248e2 / Hm 9ff00d6fd0a8b212d88478cc00c0e0c3718ccb32. Both full files inspected. Hm extends file with completed L-function, root number and left half-plane theorems; boundary argument is mathematically unchanged, minor tactic changes (convert! -> convert, exp_nat_mul -> exp_natCast_mul).
- Mathlib/NumberTheory/LSeries/Positivity.lean: Pm e7855803a338e1765edea208ca0595e7bbc858a2 / Hm 1453d575835e66a01bbfae9f95a2a12cefbbe243. Pm lines 40–82, 107–111; Hm wrapper 108–112.
- Mathlib/Analysis/Complex/Positivity.lean: Pm 84d0dd19081767dc0426eca372d937ade4b56f41 / Hm 4daa2fbc36860e73648a7faef9cdbddd03dcf223. Pm full, Hm opening checked. Pm Differentiable.apply_le_of_iteratedDeriv_alternating via reflection.
- Mathlib/NumberTheory/LSeries/Dirichlet.lean: Pm f718ca1edc35ffa92b318b2f74ddcef0e2e754a3 / Hm 81d22d30291cde186823417dbe69a23a5bf6faf8. Pm 218–232; Hm 233–235.
- Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean: Pm 6846dc699ecd29cc8a1754c1680176210969ffd1 / Hm 30397bfe2272d8400aa42bcbb44bec085b7f23ab. Pm 418–450, Hm 443–452.
Blob hashes as returned by GitHub, not independently rehashed. Exact source references here are source-level dependencies, not an authenticated root path.

## 1. Open half-plane
Fix N>0 and a Dirichlet character chi modulo N (zero on nonunits). For Re s>1, both the series of chi and the series of chi times Moebius mu converge absolutely by |chi(n)|<=1, |mu(n)|<=1 and comparison with sum n^(-Re s). Complete multiplicativity and the divisor identity sum_{d|n} mu(d)=1_{n=1} give (chi*(chi mu))(n)=chi(n) sum_{d|n} mu(d)=1_{n=1}, where * denotes Dirichlet convolution. The Cauchy product is justified by absolute convergence. Thus L(chi,s) L(chi mu,s)=1 and L(chi,s) is nonzero. Source LSeries.mul_mu_eq_one and LSeries_ne_zero_of_one_lt_re; LFunction_eq_LSeries transports the result to the continued function. No arithmetic window or RH used.

## 2. Three-factor boundary positivity
For x>0, t real put sigma=1+x. At p not dividing N, set a=p^(-sigma) in (0,1), z=chi(p) exp(-it log p), |z|=1. For every j>=1, write w=z^j and r=Re w. Then Re(w^2)=2r^2-1, and
  3+4 Re(w)+Re(w^2)=2(1+r)^2>=0.
The Taylor series -log(1-v)=sum_{j>=1}v^j/j holds for |v|<1, including all three arguments a,az,az^2. Therefore the real part of -3log(1-a)-4log(1-az)-log(1-az^2) is a convergent sum of nonnegative terms 2a^j(1+Re z^j)^2/j. At p|N all three character values (including principal chi0 mod N) vanish, so all factors equal 1 and logs equal zero. Do not replace chi0 by a constant 1 on nonunits.
Across primes, absolute summability follows from |chi(p)p^(-s)|<=p^(-sigma), sigma>1, and |log(1-v)|<=|v|/(1-|v|), with |v|<=2^(-sigma)<1. Consequently the sums can be combined and real parts taken termwise. The Euler products written as exponentials of the summable logs yield
  |L(chi0,1+x)^3 L(chi,1+x+it)^4 L(chi^2,1+x+2it)| >= 1.
Here chi0 is the principal character of the SAME modulus; t may be zero (despite the docstring saying nonzero). Source Pm Nonvanishing L221–314, Hm L227–320. No hidden RH, zero-free windows, or positivity of complex L-values.
An exact algebraic consequence checked below: for rational a and rational unit-circle z, |(1-a)^3(1-az)^4(1-az^2)|^2<=1. This checks the local log result without approximate logarithms, and does not substitute for convergence.

## 3. Ordinary boundary contradiction
Suppose L(chi,1+it)=0 and (chi^2!=chi0 OR t!=0). The condition implies (chi!=chi0 OR t!=0) and (chi^2!=chi0 OR 2t!=0). Thus the middle factor and third factor are holomorphic at their respective centers, not poles. For x->0+ the first factor is O(x^-1) by its residue prod_{p|N}(1-1/p), the middle factor is O(x) by differentiability and the supposed zero, the third is O(1) by continuity. Product norm is O(x^(-3+4))=O(x), tending to zero, contradicting >=1. Source Pm L316–381, Hm L322–387. If t=0 and chi^2=chi0 the third factor can have a pole and the exponent drops to zero. This is precisely why the separate quadratic case is necessary. The hypothesis excludes the principal character at s=1; it is not an ordinary finite complex zero test.

## 4. Nontrivial quadratic case
Source Pm L75–211, Hm L81–217. Suppose chi!=chi0, chi^2=chi0, L(chi,1)=0. The convolution b(n)=sum_{d|n}chi(d) is multiplicative, b(1)=1, and b(0)=0 under ArithmeticFunction conventions. For p prime its p^k values are sum_{j=0}^k chi(p)^j. Since chi(p) is 0,1,-1, the respective results are 1,k+1,1 if k even or 0 if k odd. Hence every b(n)>=0 and real. The absolutely convergent Dirichlet series for b agrees with zeta(s)L(chi,s) for Re s>1. Nonprincipal L is entire; zeta has simple pole residue 1 at s=1. Under the supposed zero, define F(s)=zeta(s)L(chi,s) away from 1 and F(1)=L'(chi,1). Indeed near 1 this product equals [(s-1)zeta(s)] [ (L(chi,s)-L(chi,1))/(s-1) ], whose limits are 1 and L'(chi,1). This gives continuity plus punctured holomorphy, hence an entire F. The trivial zeta zero at -2 implies F(-2)=0 (L(chi,-2) finite).

Expand the imported positivity argument (Pm Positivity L40–82): take arbitrary real y and c=max(1,y)+1, so c>1 and c>y. Entire F equals the series in an open right half-plane. Differentiation there is legitimate for every k by absolute convergence of sum b(n)(log n)^k n^(-c); for example pick c' strictly between 1 and c, and absorb logarithm powers by n^(c-c'). Thus (-1)^k F^(k)(c)=sum b(n)(log n)^k n^(-c)>=0, and F(c)>=b(1)=1. The entire Taylor expansion at c evaluated at y has all terms real nonnegative:
 F(y)=sum_{k>=0} [(-1)^k F^(k)(c)] (c-y)^k/k! >= F(c)>=1.
Global convergence follows from entireness, not a claim of Dirichlet-series convergence at y. In the Lean source the alternating derivative lemma and reflection z->-z give the same inequality; the general imported lemma uses arbitrary cutoff x and positive a(1). At y=-2 this contradicts F(-2)=0. Hence L(chi,1)!=0. This excludes a zero exactly at one, NOT an exceptional real zero strictly between zero and one. RUN9/15 residue positivity still required.

## 5. Zeta totalization and family adapter
At Re s=1 the native case split (Pm L385–394, Hm L391–400) uses the quadratic proof iff chi^2=chi0 and s=1, and otherwise section 3. At Re s>1 section 1 applies. Thus LFunction_ne_zero_of_one_le_re holds with chi!=chi0 OR s!=1. At modulus one all characters are trivial and LFunction_modOne_eq gives zeta. For s!=1 use the established theorem. At s=1 the mathematical zeta is meromorphic with pole; Mathlib totalizes its value. ZetaAsymp.riemannZeta_one explicitly gives
 zeta_Lean(1)=(EulerGamma-log(4*pi))/2.
This is NOT EulerGamma (the Laurent constant). The source proves EulerGamma<2/3<1, e<2.9<8<=4*pi using pi>=2, hence log(4*pi)>1. Thus zeta_Lean(1)<0 and nonzero. The formula itself comes from the Hurwitz-zeta regularization limit and uniqueness of limits (Pm L418–422); its two asymptotic limit producers remain imported here, not independently reconstructed.
The family adapter uses N_i!=0 and (N_i=1 OR chi_i!=chi0). In first branch use zeta theorem including its totalized value at one; in second branch use nonprincipal theorem. Therefore every family member and its conjugate zero condition has Re rho<1 for rho in the positive-real-part zero set. This is independent prior input to poleData (RUN9/15), not a conclusion of zeroFree_of_rpow_window. The strict strip enables the real-residue positivity. Original level hypotheses 0<theta<1 and delta>0 remain; revised abstract wrapper theta>=0 and delta>0 remain. No parameter changes.

## 6. Reproducible exact finite certificate
Run this JS in Node. Integer calculations, no floating point approximation; enumerate actual quadratic characters (including principal) via unit group homomorphisms for moduli 1..16, verify convolution and Moebius inverse. Unit circle points via rational parametrization and powers. No actual zeta zeros computed; finite cases check algebra not infinite series theorems.
~~~js
const certificate = function(){
 const ck=(x,m)=>{if(!x)throw Error(m)};
 let geom=0,phase=0,factor=0,chars=0,coeff=0,inv=0,split=0,neg=0;
 for(let v=-1n;v<=1n;v++)for(let k=0n;k<=100n;k++){
   let s=0n;for(let j=0n;j<=k;j++)s+=v**j;
   ck(s===(v===0n?1n:v===1n?k+1n:1n-k%2n),"geometric sum");geom++;
 }
 for(let m=-12n;m<=12n;m++)for(let n=1n;n<=12n;n++){
   const a=n*n-m*m,b=2n*m*n,d=n*n+m*m;
   ck(a*a+b*b===d*d,"circle");
   let X=1n,Y=0n,D=1n;
   for(let k=1;k<=12;k++){
     [X,Y,D]=[a*X-b*Y,b*X+a*Y,D*d];
     ck(X*X+Y*Y===D*D,"power norm");
     ck(3n*D*D+4n*X*D+X*X-Y*Y===2n*(D+X)**2n,"log square");phase++;
   }
   for(let q=1n;q<=12n;q++)for(let p=0n;p<q;p++){
     const A=(q-p)**2n;
     const B=(q*q+p*p)*d-2n*p*q*a;
     const C=(q*q+p*p)*d*d-2n*p*q*(a*a-b*b);
     ck(A>0n&&B>0n&&C>0n,"factor nonzero");
     ck(A**3n*B**4n*C<=q**16n*d**6n,"Euler product inequality");factor++;
   }
 }
 const gcd=(a,b)=>b?gcd(b,a%b):a;
 const mu=n=>{let s=1;for(let p=2;p<=n;p++)if(n%p===0){n/=p;s=-s;if(n%p===0)return 0;}return s};
 for(let N=1;N<=16;N++){
   const units=Array.from({length:N},(_,i)=>i).filter(i=>gcd(i,N)===1);
   for(let mask=0;mask<2**units.length;mask++){
     const v=Array(N).fill(0);units.forEach((u,i)=>v[u]=mask&(1<<i)?-1:1);
     if(v[1%N]!==1||!units.every(a=>units.every(b=>v[a*b%N]===v[a]*v[b])))continue;
     chars++;
     const chi=n=>v[n%N];
     for(let n=1;n<=200;n++){
       let c=0,i=0;
       for(let d=1;d<=n;d++)if(n%d===0){c+=chi(d);i+=chi(d)*mu(n/d)*chi(n/d);}
       ck(c>=0&&(n!==1||c===1),"quadratic convolution");coeff++;
       ck(i===(n===1?1:0),"Moebius inverse");inv++;
     }
   }
 }
 for(const trivial of [false,true])for(const quadratic of [false,true])for(const t of [0,1,-1]){
   if(trivial&&!quadratic)continue;
   if(trivial&&t===0)continue;
   const special=quadratic&&t===0;
   ck(special?!trivial:((t!==0||!trivial)&&(2*t!==0||!quadratic)),"case split");split++;
 }
 ck(2n+4n*(-1n)+1n<0n,"reduce principal weight");neg++;
 ck(3n+4n*(-1n)<0n,"drop third factor");neg++;
 ck(4-3-1===0,"quadratic third pole removes decay");neg++;
 ck(3-3===0,"middle exponent three removes decay");neg++;
 return {geom,phase,factor,chars,coeff,inv,split,neg,tests:geom+phase+factor+coeff+inv+split};
};
console.log(certificate());
~~~
Actual JS execution: {"geom":303,"phase":3600,"factor":23400,"chars":38,"coeff":7600,"inv":7600,"split":8,"neg":4,"tests":42511}. 42511 positive finite cases plus 4 negative controls. 38 character instances. The four controls show reduction of the principal log weight, deletion of third term, third-factor pole and reduced middle exponent invalidate the relevant positivity or decay argument; no claim they are counterexamples to RH.

RESUME HERE: trace actual Mathlib HurwitzZeta.tendsto_hurwitzZetaEven_sub_one_div_nhds_one and ZetaAsymptotics.tendsto_riemannZeta_sub_one_div_Gammaℝ at Pm/Hm, preserving difference between pole, Laurent constant, and totalized value. In parallel request authenticated role-labelled root paths for Deduction.charFamily_LFunction_ne_zero_of_one_le_re, poleData, zeroFree_of_rpow_window, Mathlib LFunction_ne_zero_of_one_le_re, and positivity supplier; do not infer reachability solely from imports. The arithmetic window supplier and full kernel replay remain OPEN. HANDOFF TO editor, integration, dependency, kernel, audit, math and prime.

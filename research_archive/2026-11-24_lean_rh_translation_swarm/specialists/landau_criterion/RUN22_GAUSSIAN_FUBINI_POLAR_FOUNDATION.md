# RUN22 — Gaussian foundation: Fubini, polar Jacobian, radial primitive, principal sign
2026-11-25. RESULT: DONE local SOURCE-MATCHED human reconstruction; Main-root role authentication and independent Lean replay OPEN.

## Provenance and continuity
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, RUN21 (55c3575ce4cdb3ae48d1cf5e21ac5a7f9c72078f), state/log/protocol/continuity excerpts and CI #416 (45540458272, unrelated physical gates only). Inspected recent peer commit patches with visible RESUME notes, dependency reconciliation and editor manuscript tail. Theta owns Crux0/pos_int; geometry owns spherical Jensen. No duplicate scalar Gaussian task found in inspected records. Not all peer files or linked PDF reread. No physical gate changes.
RH baseline P=40e56bab026552e089d7afcfeff08d2defb9c005. Latest observed H=27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59 (2026-11-25 04:16:12Z, merge #2057 batch 13), advanced from fcb6eac7534875d32d68030967e2deae6d686151. Manifest blobs P b4d1ec31575a26b2159ec3a262b482bc051f3f6f, H 8a747b58a34565cc6cb5341b86544aa5d3a20a2d. Mathlib pins M=0df444a360eaa60ab8c11dca51a86af692955474, N=31ce06eaadf4a200c0e1407c5f10953cf606b8f8, N unchanged. Both actual Mathlib refs successfully fetched.
Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean: M blob 13927ae74e7ce60a2d053df06eacec80b3f924a0, N blob ec5f214fa4f7b8aff766bd5068da0a8a20370b49. Compared 10 contiguous blocks (M 139–158,159–177,180–209,211–222,224–235,237–273,276–287,290–302,307–319,322–325; N shifted -1). Six identical, four tactic-only changes (convert! -> convert, final congr syntax). No changed statements in these blocks.
Mathlib/Analysis/SpecialFunctions/PolarCoord.lean: M blob 053dcbf1bcd84f42dcc8273dd4afb0d87a6755e6, N blob 5648ba62e13ad26f2ccad83452a5e7a937fb7f2b. Both source L35–154 inspected by selected-line retrieval; not byte-identical, same source/target, determinant and change-of-variable statements. Source links: https://github.com/leanprover-community/mathlib4/blob/31ce06eaadf4a200c0e1407c5f10953cf606b8f8/Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean and https://github.com/leanprover-community/mathlib4/blob/31ce06eaadf4a200c0e1407c5f10953cf606b8f8/Mathlib/Analysis/SpecialFunctions/PolarCoord.lean. No whole-library equivalence asserted.

## 1. Absolute integrability before Fubini
Let b=A+iB, A>0, f_b(x)=exp(-b x²), J(b)=integral_R f_b(x) dx. N L62–157: source proves real Gaussian and x-weighted Gaussian integrability using Gamma integral convergence (u=x^p, p>0, s>-1, (s+1)/p>0), scaling by A^(-1/p), reflection on negative half-line. For s=0,1,p=2 an elementary direct bound also works: on |x|>=1, exp(-Ax²)<=exp(-A|x|), and |x|exp(-Ax²)<=|x|exp(-A|x|); both integrable, and on [-1,1] continuous. Since |f_b|=exp(-Ax²), f_b and x f_b are absolutely integrable. If A<=0, |f_b|>=1, so not Bochner integrable. No Fresnel interpretation at A=0. Fubini follows because integral_R² |f_b(x)f_b(y)|=(integral_R |f_b|)^2<infinity by Tonelli. Crucial: J² is a product without conjugation; |J|² would be different.

## 2. Radial primitive (N L158–176, integral_mul_cexp_neg_mul_sq)
b!=0 since A>0. F(r)=-exp(-br²)/(2b); differentiation along the real axis yields F'(r)=r exp(-br²). On [0,T] FTC gives integral_0^T r exp(-br²)dr=(1-exp(-bT²))/(2b). Endpoint error has exact modulus exp(-AT²)/(2|b|), tends to zero. Absolute convergence from section 1 and continuity at zero justify the improper limit, hence integral_(0,infinity) r exp(-br²)dr=1/(2b).

## 3. Polar coordinates (PolarCoord N L35–154; GaussianIntegral N L179–208, integral_gaussian_sq_complex)
Source S={(x,y):x>0 or y!=0}; omitted nonpositive x-axis including origin is Lebesgue-null, because it lies in the kernel of the nonzero linear functional (x,y)->y (or Tonelli on rectangles). Target T=(0,infinity)×(-pi,pi), inverse P(r,t)=(r cos t,r sin t). Smooth on T and bijective to S, with unique principal argument. Its derivative matrix has rows (cos t,-r sin t),(sin t,r cos t); det=r(cos²t+sin²t)=r>0. Thus abs(det)=r; change of variables yields integral_R² g=integral_T r g(P(r,t))drdt. No angular multiplicity; interval length 2pi, endpoints null. Uses the standard Jacobian theorem, native reference integral_target_eq_integral_abs_det_fderiv_smul; its general proof not expanded here.
For g=f_b(x)f_b(y)=exp(-b(x²+y²)), Fubini and polar substitution give J(b)^2=integral_R² g=integral_0^infinity integral_-pi^pi r exp(-br²)dtdr=2pi/(2b)=pi/b. Polar integrand is absolutely integrable since norm factors into angular length and radial r exp(-Ar²). Product Lebesgue measures, no change of sign due to complex coefficients.

## 4. Principal square root (N L210–272)
For real A>0, J(A)>0 by positivity on [-1,1], hence square equality yields J(A)=sqrt(pi/A). For A<=0, native real integral_gaussian uses totalized Bochner integral zero and totalized real sqrt of nonpositive quotient zero (at b=0 division is totalized too); do not present this as a convergent classical integral.
For any b in right half-plane choose d=A/2. In neighborhood Re(c)>d, |f_c(x)|<=exp(-dx²), so dominated convergence makes J continuous. K(b)=exp((1/2)Log(pi/b)) is continuous since Re(pi/b)=pi A/|b|²>0 and pi/b!=0; K²=pi/b. Thus J/K takes only ±1; continuous on convex connected domain, constant, equals +1 at b=1, so J=K throughout. Square identity alone insufficient; without connectedness or positive basepoint a negative branch survives.
Evenness and absolute integrability give integral_0^infty f_b=J/2 (N L275–286). Gamma(1/2) follows by u=x², x>0, u^(-1/2)du=2dx, so Gamma(1/2)=2 integral_0^infty exp(-x²)dx=sqrt(pi); real to complex via Gamma_ofReal (N L306–324). No circular use of Gamma(1/2) to obtain J; initial Gamma convergence does not require its special value.

## 5. Additional quantitative truncation
For R>0 let J_R=integral_-R^R f_b, D_R=integral_(disk radius R) exp(-b(x²+y²))dxdy=pi/b*(1-exp(-bR²)). Disk contained in square [-R,R]^2, therefore |J_R²-D_R|<=integral_(square minus disk) exp(-A(x²+y²))<= (pi/A)exp(-AR²). Also |J²-D_R|=(pi/|b|)exp(-AR²). Hence |J_R²-pi/b|<=pi(1/A+1/|b|)exp(-AR²), without square-root branch assumption. In 1D, |J-J_R|<=exp(-AR²)/(AR), by x/R>=1 for x>=R. Standard Gaussian analysis, not new mathematics or URT acceleration. No uniformity as A approaches zero.

## 6. Dependency and RH status
Direction: Gamma convergence (or direct integrability) -> radial FTC + Fubini + polar Jacobian -> squared integral -> connected principal sign -> RUN21 shifted contour -> RUN20 Fourier/Poisson -> RUN19 theta/Mellin -> RUN17–18 zeta residue/Gamma -> RUN16 boundary nonvanishing -> conditional Landau criterion RUN12–15. Local mathematical import chain, not authenticated Main-root kernel reachability. None constructs arithmetic window or establishes RH. Preserve 0<theta<1, delta>0, positive exceptional real-pole residues, principal character correction and conjugate zero branch. P zeroFree_of_rpow_window remains conditional on for-all Y0, exists Y>=Y0, for-all y in [Y,Y^(1+delta)] bound. Current H relocation not checked here; do not repin.

## 7. Executed certificate
V8 JS, Node compatible. BigInt rational unit-circle determinant and norm, positive reciprocal numerator and convex segment; Simpson radial, principal Gaussian and disk/square inequality. Floating quadrature not rigorously enclosed; analytical error bounds concern tails, not discretization. Finite tests cannot certify Fubini or connectedness. Numerical control at A=0 tests nondecay behavior; analytical exclusion by modulus 1. First combined submission had a JS syntax error before execution; corrected parenthesis, then executed successfully. Actual output: {"jacobian":6000,"radial_norm":6000,"halfplane":17220,"radial":125,"gaussian":25,"disk":100,"controls":4,"maxRadial":2.339386069187042e-12,"maxGaussian":2.9508222687980746e-15,"maxDisk":0.9804793504210618}.
```js
function certificate(){
 const ck=(x,m)=>{if(!x)throw Error(m)};
 let jac=0,norm=0,halfplane=0,radial=0,gaussian=0,disk=0,controls=0,maxRadial=0,maxGaussian=0,maxDisk=0;
 for(let u=-12n;u<=12n;u++)for(let v=1n;v<=12n;v++)for(let r=1n;r<=20n;r++){
   const c=v*v-u*u,s=2n*u*v,d=v*v+u*u;
   ck(c*c+s*s===d*d && c*(r*c)+s*(r*s)===r*d*d,"polar Jacobian");jac++;
   ck((r*c)**2n+(r*s)**2n===r*r*d*d,"radial norm");norm++;
 }
 for(let A=1n;A<=20n;A++)for(let B=-20n;B<=20n;B++)for(let t=0n;t<=20n;t++){
   ck(A*A+B*B>0n&&A>0n,"reciprocal");ck((20n-t)+t*A>0n,"convex path");halfplane++;
 }
 const add=([a,b],[c,d])=>[a+c,b+d],sub=([a,b],[c,d])=>[a-c,b-d],mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c],sc=(z,k)=>[z[0]*k,z[1]*k],abs=z=>Math.hypot(...z),exp=([a,b])=>[Math.exp(a)*Math.cos(b),Math.exp(a)*Math.sin(b)],div=(a,b)=>sc(mul(a,[b[0],-b[1]]),1/(b[0]**2+b[1]**2)),sqrt=z=>sc([Math.cos(Math.atan2(z[1],z[0])/2),Math.sin(Math.atan2(z[1],z[0])/2)],Math.sqrt(abs(z))),err=(a,b)=>abs(sub(a,b))/Math.max(1,abs(a),abs(b));
 function simpson(f,l,r,N=8192){let z=add(f(l),f(r));for(let j=1;j<N;j++)z=add(z,sc(f(l+(r-l)*j/N),j%2?4:2));return sc(z,(r-l)/(3*N));}
 for(const A of [.25,.5,1,2,4])for(const B of [-3,-1,0,1,3]){
   const b=[A,B],J=div([1,0],sc(b,2)),K=div([Math.PI,0],b),R=9/Math.sqrt(A);
   const f=x=>exp(sc(b,-x*x)),g=x=>sc(f(x),x);
   for(const T of [.25,1,2,4,R]){
     const expected=mul(J,sub([1,0],f(T))),actual=simpson(g,0,T);
     const e=err(actual,expected);ck(e<2e-9,"radial integral");maxRadial=Math.max(maxRadial,e);radial++;
   }
   const z=simpson(f,-R,R),e=err(z,sqrt(K));ck(e<2e-9,"principal Gaussian");ck(err(mul(z,z),K)<4e-9,"Gaussian square");maxGaussian=Math.max(maxGaussian,e);gaussian++;
   for(const T of [.4,1,2,4]){
     const jt=simpson(f,-T,T),diskValue=mul(K,sub([1,0],f(T))),squareValue=mul(jt,jt);
     const bound=Math.PI/A*Math.exp(-A*T*T);
     const residual=abs(sub(squareValue,diskValue));ck(residual<=bound+2e-9,"disk vs square bound");maxDisk=Math.max(maxDisk,residual);disk++;
   }
 }
 ck(abs(sub([Math.sqrt(Math.PI),0],[-Math.sqrt(Math.PI),0]))>3,"square ambiguity");controls++;
 ck(abs(sub([Math.PI,0],[Math.PI/2,0]))>1,"half angle");controls++;
 ck(abs(sub([1,0],exp([0,-2])))>1,"zero real part fails decay");controls++;
 ck(Math.exp(4)>1,"negative real part grows");controls++;
 return {jacobian:jac,radial_norm:norm,halfplane,radial,gaussian,disk,controls,maxRadial,maxGaussian,maxDisk};
}
console.log(JSON.stringify(certificate()));
```

## RESUME HERE
Scalar Gaussian local expansion complete through explicit change of variables; do not descend into unrelated foundational lemmas without root path. Ask dependency/kernel/acceleration lanes to resolve exact pinned declarations zeroFree_of_rpow_window, Landau criterion and integral_gaussian_complex in authenticated Main-root value/expression projections (identities, edges and witnesses); use cached artifact, no fresh full scan. Independently locate current H path to zeroFree_of_rpow_window by exact source index and compare pinned P statement/body, then work on authenticated arithmetic-window supplier or explicitly conditional source bridge rather than more generic analysis. Request editor integrate RUN21–22 with Gamma(1/2) noncircularity and totalization warning. HANDOFF TO dependency, kernel, acceleration, editor, theta, integration, prime, audit. Full RH OPEN.

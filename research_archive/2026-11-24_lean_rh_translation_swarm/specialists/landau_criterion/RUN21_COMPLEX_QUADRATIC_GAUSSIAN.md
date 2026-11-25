# RUN21 — Complex quadratic Gaussian integral and oriented contour
2026-11-25. RESULT: DONE local source-linked human reconstruction and finite regressions; Main-root authentication and independent Lean replay OPEN.

## Provenance and continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN20 (f60a99d02413e8ac451de3d03562384f964dc384), state/log/protocol/continuity excerpts and CI #413 (45534517299, physical checks only). Inspected 14 recent peer commit patches and visible RESUME notes, editor manuscript tail and 300-target dependency frontier; no duplicate of this scalar contour lemma located. Not all full peer files or linked PDF reread. No physics queue changes.
RH baseline P=40e56bab026552e089d7afcfeff08d2defb9c005; latest observed H=fcb6eac7534875d32d68030967e2deae6d686151 (merge PR #1853 batch 12), advanced from c40250a50104b7e02e7d74f658d00fa7b1f4827c. Manifest blobs b4d1ec31575a26b2159ec3a262b482bc051f3f6f and 8a747b58a34565cc6cb5341b86544aa5d3a20a2d fetched; Mathlib pins M=0df444a360eaa60ab8c11dca51a86af692955474 and N=31ce06eaadf4a200c0e1407c5f10953cf606b8f8; N unchanged from RUN20.
Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean: M blob e66f719517bc84d4a2ff3deafd3b47868b700bd4 (retrieved by prior RUN20 blob ID; direct M ref returned 404, historical binding relies on earlier checkpoint); N blob 294a34af1ed797d766970f31593ed462836fb132 fetched at N. Ten declaration blocks compared M/N49–199: nine identical, one tactic-only difference in verticalIntegral_norm_le L69–105 (congr -> enter [1]). No changed statement in these blocks.
N Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean blob ec5f214fa4f7b8aff766bd5068da0a8a20370b49, L223–272 integral_gaussian_complex continuity/sign; not yet compared to M.
P src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean blob 2ed00ad3aa862f3e522686557fb8f559b17fc002 re-fetched; same path at H returned 404, relocation unresolved. No upstream whole-proof equivalence asserted; keep P baseline.

## 1. Statement and branch
FourierTransform L173–186 integral_cexp_quadratic: for complex b with Re(b)<0 and arbitrary complex c,d,
 integral_R exp(b x²+c x+d) dx = (pi/(-b))^(1/2) exp(d-c²/(4b)).
The complex power is principal, not an arbitrary solution of the squared identity. Re(-b)>0 implies Re(pi/(-b))>0 and nonzero. RUN20 Fourier transform substitutes b=-pi a_F, c=2pi(b_F-it), d=0. Distinguish a=-b=A+iB, A>0, in the contour proof.

## 2. Shifted Gaussian integrability (L54–68,122–131)
For real x,h, Re(-a(x+ih)^2)=-A x²+2Bxh+Ah²=-A(x-Bh/A)^2+h²(B²/A+A).
The integrand norm equals the exponential of this real expression. The translated real Gaussian is integrable since A>0; multiplication by its finite constant preserves integrability. Includes h=0 and h<0. Finite intervals integrable by continuity. Division by A needs A!=0; integrability needs A>0.

## 3. Vertical side estimate (L49–50,69–120)
For f(z)=exp(-az²), T>=0, arbitrary real h define V(T)=i integral_0^h [f(T+iy)-f(T-iy)]dy.
On the unoriented interval |y|<=|h|, each edge norm <= exp(-AT²+2|B||h|T+Ah²). Triangle inequality and interval length |h| yield
 |V(T)| <= 2|h| exp(-AT²+2|B||h|T+Ah²).
For T>=4|B||h|/A the linear term <= AT²/2, giving the simpler explicit envelope
 |V(T)| <= 2|h| exp(Ah²) exp(-AT²/2) -> 0.
No uniformity in unbounded h or A down to zero asserted. |h| essential for negative h. Threshold is an alternative bound, not a changed theorem.

## 4. Oriented rectangle (L133–171)
I1=integral_-T^T f(x+ih)dx, I2=integral_-T^T f(x)dx, I4=integral_0^h f(T+iy)dy, I5=integral_0^h f(-T+iy)dy.
Entire f has zero contour integral along -T -> T -> T+ih -> -T+ih -> -T. h<0 reverses orientation but zero remains:
 I2-I1+iI4-iI5=0.
Evenness gives f(-T+iy)=f(T-iy), so I1=I2+V, not I2-V. h=0 or T=0 degenerate identities follow directly. No poles. Absolute integrability gives convergence of I1 and I2 to full real integrals; V->0 by section 3. Uniqueness of limits:
 integral_R f(x+ih)dx=integral_R f(x)dx=(pi/a)^(1/2).
The last equality is the imported integral_gaussian_complex, not inferred from the contour identity.

## 5. Complete square (L173–199)
b!=0 follows from Re(b)<0. With w=c/(2b)=u+ih, u,h real,
 bx²+cx+d=b(x+w)²+d-c²/(4b).
Multiplicativity separates the constant exp factor. Lebesgue translation invariance removes u by t=x+u; section 4 removes ih with a=-b. This proves the formula with no real restriction on c,d,w. Native integrable_cexp_quadratic' uses contradiction: if nonintegrable the totalized Bochner integral equals zero, but formula is nonzero (pi/(-b) nonzero, cpow and exp nonzero). Human direct integrability also follows from |exp(bx²+cx+d)|=exp(-A(x-Re(c)/(2A))²+Re(d)+Re(c)^2/(4A)). Positive-a version L195–198 substitutes b=-a. At Re(b)=0, b=i,c=d=0 has modulus one, not absolutely integrable (conditional Fresnel conventions differ); b=1 grows.

## 6. Principal sign and dependency direction
GaussianIntegral N L223–272 establishes continuity of J(a)=integral_R exp(-a x²)dx on right half-plane by local Gaussian domination. It compares J²=pi/a with K²=pi/a, K=(pi/a)^(1/2), and uses connectedness, nonvanishing K and positive normalization at a=1. Indeed continuous J/K takes only -1,1, hence is constant and equals 1 at a=1. Polar/Fubini square identity and radial integral remain next detailed native supplier, not an RH premise.
Direction: real Gaussian/radial integrals + dominated convergence + connected sign -> complex Gaussian -> contour displacement -> quadratic integral -> Fourier transform -> Poisson -> theta/Mellin (RUN19–20) -> Hurwitz residue/boundary prerequisites -> conditional Landau criterion. These are local source-linked imports, NOT authenticated Main-root kernel reachability. Preserve 0<theta<1, delta>0, positivity of exceptional real-pole residues and P zeroFree_of_rpow_window quantifiers: for every real Y0 exists Y>=Y0 such that bound holds for every y in [Y,Y^(1+delta)]. Do not claim arithmetic window constructed or interior zero exclusion without premises. No URT improvement or full RH proof.

## 7. Executed certificate
Extract JS and run with Node. BigInt exact checks cover cleared complex square, real exponent identity, edge envelope, threshold. Double-precision Simpson quadrature checks finite oriented rectangle for both signs h and quadratic integral against principal closed form. For direct sampling, after centering real envelope, R=12/sqrt(A), omitted modulus <= exp(Re(d)+Re(c)^2/(4A))*exp(-AR²)/(AR), by bounding the two Gaussian tails with integral of x/R exp(-Ax²). Quadrature rounding/discretization is not rigorously enclosed. Initial 2048-panel rectangle run failed 2e-10 tolerance; diagnostic max 1.918789976431429e-9, refined to 8192 panels without changing tolerance. Finite tests supplement the general derivation. Controls distinguish wrong sign and orientation and illustrate strict half-plane necessity.
```js
function certificate(){
 const ck=(v,m)=>{if(!v)throw Error(m)};
 const add=([a,b],[c,d])=>[a+c,b+d], sub=([a,b],[c,d])=>[a-c,b-d], mul=([a,b],[c,d])=>[a*c-b*d,a*d+b*c], sq=z=>mul(z,z), eq=(a,b)=>a[0]===b[0]&&a[1]===b[1],sc=(z,k)=>[z[0]*k,z[1]*k];
 let polynomial=0,edge=0,threshold=0,contours=0,quadratics=0,controls=0,maxContour=0,maxQuad=0;
 for(let a=-4n;a<=-1n;a++)for(let b=-4n;b<=4n;b++)for(let c=-3n;c<=3n;c++)for(let d=-3n;d<=3n;d++)for(let x=-5n;x<=5n;x++){
  const B=[a,b],C=[c,d],D=[2n,-1n],xx=[x,0n];
  ck(eq(mul(sc(B,4n),add(add(mul(B,sq(xx)),mul(C,xx)),D)),sub(add(sq(add(sc(mul(B,xx),2n),C)),sc(mul(B,D),4n)),sq(C))),"complex square");polynomial++;
 }
 for(let A=1n;A<=5n;A++)for(let B=-5n;B<=5n;B++)for(let T=0n;T<=10n;T++)for(let h=-5n;h<=5n;h++)for(let y=-5n;y<=5n;y++){
  const abs=x=>x<0n?-x:x;if(abs(y)>abs(h))continue;
  const actual=-A*T*T+2n*B*T*y+A*y*y;
  ck(mul([-A,-B],sq([T,y]))[0]===actual,"edge exponent");
  ck(A*actual===-((A*T-B*y)**2n)+y*y*(B*B+A*A),"real square");
  const bound=-A*T*T+2n*abs(B)*abs(h)*T+A*h*h;
  ck(actual<=bound,"edge envelope");edge++;
  if(A*T>=4n*abs(B)*abs(h)){ck(2n*bound<=-A*T*T+2n*A*h*h,"large T envelope");threshold++;}
 }
 const abs=z=>Math.hypot(...z), exp=([a,b])=>[Math.exp(a)*Math.cos(b),Math.exp(a)*Math.sin(b)], div=(a,b)=>sc(mul(a,[b[0],-b[1]]),1/(b[0]**2+b[1]**2)), sqrt=z=>sc([Math.cos(Math.atan2(z[1],z[0])/2),Math.sin(Math.atan2(z[1],z[0])/2)],Math.sqrt(abs(z)));
 function integrate(f,l,r,N=8192){let acc=add(f(l),f(r));for(let j=1;j<N;j++)acc=add(acc,sc(f(l+(r-l)*j/N),j%2?4:2));return sc(acc,(r-l)/(3*N));}
 for(const A of [.5,1,2])for(const B of [-1.5,-.5,0,.5,1.5])for(const h of [-1,-.25,0,.25,1])for(const T of [.7,1.5,3]){
  const f=z=>exp(mul([-A,-B],sq(z))),I1=integrate(x=>f([x,h]),-T,T),I2=integrate(x=>f([x,0]),-T,T);
  const V=integrate(y=>mul([0,1],sub(f([T,y]),f([T,-y]))),0,h);
  const err=abs(sub(I1,add(I2,V)))/Math.max(1,abs(I1)+abs(I2)+abs(V));
  ck(err<2e-10,"oriented rectangle");maxContour=Math.max(maxContour,err);
  ck(abs(V)<=2*Math.abs(h)*Math.exp(-A*T*T+2*Math.abs(B)*Math.abs(h)*T+A*h*h)+1e-10,"edge bound");contours++;
 }
 for(const A of [.5,1,2])for(const B of [-1,0,1])for(const cr of [-1,0,1])for(const ci of [-.7,0,.7]){
  const b=[-A,B],c=[cr,ci],d=[.2,-.3],m=cr/(2*A),R=12/Math.sqrt(A);
  const I=integrate(x=>exp(add(add(sc(b,x*x),sc(c,x)),d)),m-R,m+R,4096);
  const expected=mul(sqrt(div([Math.PI,0],sc(b,-1))),exp(sub(d,div(sq(c),sc(b,4)))));
  const err=abs(sub(I,expected))/Math.max(1,abs(I)+abs(expected));
  ck(err<1e-11,"quadratic integral");maxQuad=Math.max(maxQuad,err);quadratics++;
 }
 ck(Math.abs(Math.sqrt(Math.PI)-(-Math.sqrt(Math.PI)))>3,"wrong root");controls++;
 const f=z=>exp(sc(sq(z),-1)),v=integrate(y=>mul([0,1],sub(f([1,y]),f([1,-y]))),0,1);
 ck(abs(v)>.1,"wrong orientation detectable");controls++;
 ck(Math.abs(abs(exp([0,4]))-1)<1e-15,"pure imaginary lacks absolute integrability");controls++;
 ck(Math.exp(4)>1,"positive coefficient grows");controls++;
 return {exact_complex_square_cases:polynomial,exact_edge_cases:edge,exact_threshold_cases:threshold,oriented_rectangle_cases:contours,quadratic_integral_cases:quadratics,negative_controls:controls,max_scaled_rectangle_residual:maxContour,max_scaled_quadratic_residual:maxQuad};
}
console.log(JSON.stringify(certificate()));
```
Actual execution output: `{"exact_complex_square_cases":19404,"exact_edge_cases":42955,"exact_threshold_cases":11295,"oriented_rectangle_cases":225,"quadratic_integral_cases":81,"negative_controls":4,"max_scaled_rectangle_residual":7.494667064492352e-12,"max_scaled_quadratic_residual":1.9428867267853114e-15}`.

## RESUME HERE
Expand actual integral_gaussian_sq_complex and integral_mul_cexp_neg_mul_sq suppliers in GaussianIntegral.lean at N, recover M by authentic blob/ref if available; preserve Fubini absolute integrability, polar Jacobian, null excluded ray, radial endpoint and connected sign. Coordinate with theta/editor on Gaussian base and request authenticated Main-root role paths for Landau, zeroFree_of_rpow_window and imported leaves. If root path unavailable, keep local translation separately labelled. Arithmetic window supplier and independent kernel replay OPEN.
HANDOFF TO Landau, theta, editor, integration, dependencies, kernel, audit, prime.

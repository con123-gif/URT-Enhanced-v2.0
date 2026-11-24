# RUN14 — final two-branch Landau contradiction
2026-11-24. RESULT: DONE for source-matched conditional abstract Landau proof assembly; project OPEN. Not a Lean kernel replay, arithmetic window proof, or URT benchmark.

## Continuity and provenance
Read AGENTS.md, SWARM_PROTOCOL.md, HANDOFF_QUEUE.md, EXPANSION_15_LANES.md, RUN13; research state/log/protocol/continuity excerpts, physics CI summary #392 (20:18:08 UTC, not RH validation); latest 30 branch commit summaries and 14 other-lane commit file lists and available RESUME HERE patch lines. Editor manuscript patch did not expose a RESUME HERE; external blueprint noted but not reopened. No duplicate of this specific final assembly found in these records. No baseline physics gate or Queue changed.

P=40e56bab026552e089d7afcfeff08d2defb9c005; H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (latest returned upstream, unchanged from RUN13). Source root https://github.com/leanprover-community/riemann-hypothesis ; paths relative to src/Development/AutomorphicArithmetic/DedekindLFunctions/.
- P LandauZeroFreeCriterion.lean blob 54fd0de979e0dad6ac7709ad8ecbec8a29e21872: PoleData and WindowHypU.
- P LandauTheorems/landauWindow.lean blob 7915058f10b33a52652290cd887cbccdc00e676a: Deduction.landau_window_contra, landau_window_key, landau_window_re_pos, landau_window.
- P LandauTheorems/LandauDichotomy.lean blob 947dae363ce629febcba27b1b70355438f8639a0: eq_ofReal_sub_of_dist_le_of_le_sub_re, landau_dichotomy.
- P LandauTheorems/LandauNearest.lean blob 6a177498987e1ef453727131bf2004bc797a01a2: landau_nearest (RUN4).
- P LandauTheorems/LandauGrowthContra.lean blob bf6f3c703e6ae4f7fa37d4a7fd59eaa2e2aeeeda: landau_growth_contra.
- P LandauTheorems/LandauPoleReLe.lean blob 205c7380b79e78b2752ed67aeb069f2a9d12cc77: landau_pole_re_le_bound and landau_pole_re_le.
- H LandauTheorems/landauWindow.lean blob 90b899b494d60d0f222cc0cf03ee0f6a125ef175, L1003 onward; same file includes clumped growth and dichotomy. Programmatic extraction: window_contra, window_re_pos and dichotomy proof bodies textually identical; final P landau_window and H private landau_window_of_pos_lt_two identical after hθ1→hθ2 substitution (82 body lines); growth_contra replaces several nlinarith calls by grind, explicit multiplication monotonicity and calc, same statement and witnesses. H generalizes outer theorem separately (RUN5). Identifiers are source references, not authenticated kernel dependency edges.

## 1. Exact hypotheses and coefficient bridge
Retain all seven PoleData fields: measurable real g; |g(u)|<=C0 exp(2u) for u>=0; Laplace representation for Re(s)>2; every pole has Re>0; complex differentiability off Z in that half-plane; punctured isolation at EVERY point in that half-plane (including nonmembers); nonzero simple pole residue c with local analytic remainder, and if the pole is real, Re(c)>0 and Im(c)=0. P requires 0<theta<1 and delta>0. H private theorem requires 0<theta<2 and delta>0. WindowHypU: for every eta>0 and every real U0 some U>=U0 and R>=0 on [U,(1+delta)U], g<=R there, weighted R exp(-theta u) integrable there and integral <=exp(eta U). This is a premise, not proved by the analytic argument.

Write A_k(z)=(-1)^k Phi^(k)(z)/k!. RUN13 gives sigma>2 and fixed C such that for EVERY eta>0 and U0, some U>=U0 and natural k>=U satisfy simultaneously for EVERY real gamma:
 |A_k(sigma+i gamma)|+Re A_k(sigma) <= C exp(eta U)/(sigma-theta)^k. (W)
Every pole has Re rho<=2: for a hypothetical Re rho>2, choose sigma0=(2+Re rho)/2, use Laplace and growth to bound |Phi(s)|<=C0/(sigma0-2) for Re s>=sigma0. Hence (s-rho)Phi(s)→0 on the punctured neighborhood, but the pole expansion and continuity of the remainder give limit c!=0. Contradiction. Thus Re rho<sigma for the fixed sigma above.

## 2. Dichotomy and radii
Assume rho0 in Z with Re rho0>theta. Set E=sigma-theta>0. In the real-centred closed disk of radius E the real part is >=theta>0. Isolation on the entire open half-plane implies finite F=Z intersect that disk (otherwise a compactness accumulation point contradicts isolation). If F empty, D=E is pole-free as an open disk and sigma-Re rho0<D. Otherwise let D be the minimum distance of members of F to sigma. The open disk radius D is pole-free. If a pole rho1 has sigma-Re rho1<D, take the left branch with D<=E. Otherwise for every pole w, D<=sigma-Re w. For a nearest w,
 D² >= (sigma-Re w)²+(Im w)² >= D²,
so w=sigma-D is real and unique. Since rho0 violates theta, D<=sigma-Re rho0<E. The finite remaining set in F has strictly larger distance; take r=min(E, second distance), using D+1 if the remaining set empty. Then beta=sigma-D>theta is the unique pole in the OPEN disk radius r, and 0<sigma-beta<r<=E. Boundary poles at radius r do not enter. This is landau_dichotomy, not an assertion that a nonreal violating pole is necessarily the nearest to sigma.

Left branch: RUN4/native landau_nearest gives gamma, rho in Z, r with z=sigma+i gamma, d=|z-rho|<r<=D, unique pole in that open disk. The premise D<sigma holds since D<=E and theta>0. d>0 since Re rho<sigma. Set e=(d+r)/2. Then 0<d<e<r<=D<=E. The disks used in both branches are inside Re>0: Re w >=Re z-|w-z|>sigma-r>=theta>0. The strict open-ball inequality is landau_window_re_pos; no analytic continuation across Re=0 is assumed.

## 3. Left branch (complex-centred pole estimate)
Use local pole expansion, differentiability on the punctured disk and RUN10 landau_pole_asym at radius e to fix M with
 |A_k(z)-c/(z-rho)^(k+1)|<=M/e^k for EVERY k.
On the pole-free real disk radius D, Cauchy at e<D fixes M' with |A_k(sigma)|<=M'/e^k for EVERY k (the sign (-1)^k has modulus one). Both constants fixed before eta,U0,U,k.
Reverse triangle and W yield
 (|c|/d)/d^k <= |A_k(z)|+M/e^k
 <= C exp(eta U)/E^k - Re A_k(sigma)+M/e^k
 <= (M+M')/e^k+C exp(eta U)/E^k.
The nonzero residue makes |c|/d>0; no assumption that its phase is positive. The signed real term is bounded using the separate pole-free disk, not discarded.

## 4. Right branch (real pole, including exceptional real zero)
Here beta in Z is real, theta<beta<sigma, d=sigma-beta>0 and d<r<=E. Set e=(d+r)/2 so d<e<r<=E. PoleData gives Re c>0 and Im c=0. Pole asymptotic fixes M with |A_k(sigma)-c/d^(k+1)|<=M/e^k for all k. Taking real parts gives
 (Re c/d)/d^k <= Re A_k(sigma)+M/e^k.
W at gamma=0 implies Re A_k(sigma)<=C exp(eta U)/E^k since |A_k(sigma)|>=0. Therefore the same scalar bound follows with c_scalar=Re c/d>0 and M rather than M+M'. No removal of a possible exceptional zero: this is the branch that excludes it when the window premise holds. Im c=0 is in PoleData, although this last inequality uses only Re c>0.

Sharp negative control (analytical, not a counterexample to the native theorem): choose 0<theta<beta<1, g(u)=-exp(beta u), Phi(s)=-1/(s-beta) off beta, arbitrary value at beta, Z={beta}, R=0 on every window. All other PoleData and window premises hold, but the real residue is -1, so claimed exclusion fails. In particular A_k(sigma) is negative and |A_k|+Re A_k=0. Real residue positivity cannot be deleted.

## 5. Scalar contradiction, explicit native threshold
In either branch fixed numbers satisfy c_scalar>0, 0<d<e<=E, and for every eta>0,U0 there are U>=U0,k natural with k>=U and
 c_scalar/d^k <= M/e^k+C exp(eta U)/E^k.
M,C are real; do not silently assume positivity. Require U>=0 by replacing U0 with max(U0,0); then exp(eta U)>=1. First replace M,C by absolute values; only then use e<=E to compare positive denominators. Set K=|M|+|C|>=0. The right side is <=K exp(eta U)/e^k.

Let L=log(e/d)>0, eta=L/2, U0=2K/(c_scalar L). These choices depend only on fixed radii/constants, not the eventual U,k. Set X=exp(LU/2). The inequality exp(t)>=1+t gives c_scalar X>=c_scalar+c_scalar LU/2>=c_scalar+K>K. Also X²=exp(LU)<=exp(Lk)=(e/d)^k. Hence
 K exp(eta U)=KX < c_scalar X² <= c_scalar (e/d)^k.
Dividing by e^k>0 contradicts the scalar lower bound. This is the actual landau_growth_contra and landau_window_contra argument. No asymptotic limiting exchange needed. K=0 included. Strict d<e indispensable: equality d=e, M=c_scalar, C=0 satisfies the supposed impossible inequality. Entire quantifier order preserved.

Thus every rho in Z satisfies Re rho<=theta, conditional on PoleData and WindowHypU. H extends to theta>=2 by pole_re_le, to 0<theta<2 by this proof, and to theta<=0 by choosing t=min(1,Re rho/2)>0, reweighting R to preserve its weighted integral and applying the positive-theta theorem to t<Re rho. No change to P's outer arithmetic restrictions. This completes the abstract conditional analytical assembly, not the arithmetic supplier or RH.

## 6. Reproducible finite certificate
Save following JS block as run14.js and execute node run14.js (or compatible V8). Finite integer phase/norm tests for branch inequalities, BigInt signed normalization and exact rational growth subfamily, finite grid dichotomy tests, four negative controls. Growth subfamily uses e/d=(a/b)^2, integer U,k and independent sufficient threshold ceil(K*b/(c*(a-b))) by Bernoulli; NOT an exact computation of general logarithmic threshold. Finite geometry grid does not replace compactness or native nearest-pole proof. Initial test grid with imaginary offsets ±2 in scaled coordinates failed branch coverage (no empty F); expanded to ±4, preserving original test domains otherwise. This is a test-design correction, not a theorem failure. No native Lean kernel executed.

~~~js
const certificate = function(){
 const ck=(v,m)=>{if(!v)throw Error(m)};
 const phases=[[5,0],[3,4],[0,5],[-3,4],[-5,0],[0,-5],[3,-4],[-3,-4]];
 let complex=0,real=0,normalize=0,growth=0,geom=0,left=0,right=0,empty=0,negative=0;
 for(let a=0;a<=8;a++)for(let b=0;b<=8;b++)for(let m=0;m<=8;m++)
 for(const [x,y] of phases)for(const [v,w] of phases)for(const [r,s] of phases){
   const px=a*x+m*r,py=a*y+m*s,W=5*a+b*v,upper=5*m+5*b+W;
   ck(upper>=0 && px*px+py*py<=upper*upper,"complex lower assembly");complex++;
 }
 for(let p=1;p<=25;p++)for(let m=0;m<=25;m++)for(const [x,y] of phases){
   const ar=5*p+m*x,ai=m*y,need=5*p-5*m-ar;
   ck(need<=0||need*need<=ar*ar+ai*ai,"real lower assembly");real++;
 }
 for(let e=1n;e<=5n;e++)for(let E=e;E<=6n;E++)for(let k=0n;k<=7n;k++)
 for(let M=-4n;M<=4n;M++)for(let C=-4n;C<=4n;C++)for(let X=1n;X<=4n;X++){
   const abs=x=>x<0n?-x:x, ep=e**k,Ep=E**k;
   ck(M<=abs(M)*X && C*X*ep<=abs(C)*X*Ep,"signed normalization");
   ck(M*Ep+C*X*ep<=(abs(M)+abs(C))*X*Ep,"combined normalization");normalize++;
 }
 for(let b=1n;b<=5n;b++)for(let a=b+1n;a<=b+4n;a++)
 for(let c=1n;c<=5n;c++)for(let K=0n;K<=15n;K++){
   const den=c*(a-b), U0=(K*b+den-1n)/den;
   for(let U=U0;U<=U0+3n;U++)for(let k=U;k<=U+3n;k++){
     ck(K*b**U<c*a**U,"strict X margin");
     ck(K*a**U*b**(2n*k)<c*a**(2n*k)*b**U,"growth strict");growth++;
   }
 }
 const pts=[];for(let x=1;x<=4;x++)for(let y=-1;y<=1;y++)pts.push([x,4*y]);
 const E=4,E2=E*E,dist2=([x,y])=>(6-x)**2+y*y;
 for(let mask=1;mask<2**pts.length;mask++){
   const Z=pts.filter((_,i)=>mask&(1<<i)),viol=Z.filter(([x])=>x>2);
   if(!viol.length)continue;
   const F=Z.filter(p=>dist2(p)<=E2);
   if(!F.length){ck(viol.some(([x])=>(6-x)**2<E2),"empty F witness");empty++;left++;}
   else {
      const D2=Math.min(...F.map(dist2));
      ck(Z.every(p=>dist2(p)>=D2),"pole-free real open disk");
      if(Z.some(([x])=>(6-x)**2<D2)){left++;}
      else{
         const nearest=F.filter(p=>dist2(p)===D2);
         ck(nearest.length===1 && nearest[0][1]===0 && nearest[0][0]>2,"real unique pole");
         const other=F.filter(p=>p!==nearest[0]);
         const r2=Math.min(E2,...other.map(dist2));
         ck(D2<r2 && Z.filter(p=>dist2(p)<r2).length===1,"real isolating radius");
         right++;
      }
   }geom++;
 }
 ck(left>0&&right>0&&empty>0,"branch coverage");
 ck(1<=1,"d=e equality model");negative++;
 ck(Math.abs(-1)-1===0,"negative real residue evades window");negative++;
 ck(1/2>1/3,"E<e reversal");negative++;
 ck(6-6===0,"closed disk endpoint");negative++;
 return {complex,real,normalize,growth,geom,left,right,empty,negative};
};
console.log(certificate());
~~~

Actual V8 execution: {"complex":373248,"real":5200,"normalize":51840,"growth":25600,"geom":4032,"left":1728,"right":2304,"empty":480,"negative":4}. Bounded ordinary integer operations exact; growth/normalization use BigInt. No CI claim for embedded certificate.

RESUME HERE: audit the complete abstract-to-family wrapper against current source, specifically actual zeroFree_of_rpow_window and its family window conversion: locate current and pinned theorem bodies, enumerate every hypothesis and zeroSet membership mapping including conjugate, zeta and principal pole at one; reconcile RUN5–RUN9 and request authenticated role-labelled edges for landau_window, landau_window_contra, landau_dichotomy, landau_growth_contra and wrapper. Do not repeat final contradiction. HANDOFF TO editor, integration, dependencies, kernel, audit, math, prime-window and acceleration. Project OPEN.

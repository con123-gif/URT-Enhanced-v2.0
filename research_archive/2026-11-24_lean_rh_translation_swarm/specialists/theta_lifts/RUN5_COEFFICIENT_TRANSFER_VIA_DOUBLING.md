# Theta lifts run 5 — why the same Gram coefficient survives the doubling integral

2026-11-24. RESULT: SOURCE-MATCHED reconstruction of GlobalTheory.ThK.Dbl.coefLine_of, with its analytic continuation and Fubini helpers. Conditional on all 12 inputs and the original matching geometry. Supplies precisely RUN4's CoefLine obligation, not the upstream proofs of those 12 inputs.

## Continuity and pin
Read SWARM_PROTOCOL, HANDOFF_QUEUE (blueprint caveat), EXPANSION_15_LANES, AGENTS, research state, runner log/protocol, continuity, RUN4, current Landau migration/character-box handoffs and integration 1100. Latest physical CI PASS 45379182627 at 11:14:39 UTC is not RH validation. Original pin 40e56bab026552e089d7afcfeff08d2defb9c005. Current upstream head observed ba5e02170fcf8bc19acf4d63110f5eb85f8c0161 at 11:18:50 UTC (PR 367). Both original LatticeBasics/CoefLine.lean and guessed Reductions/TopPolarZero/CoefLine.lean return 404 at current head. No equivalence or current-head closure inferred; keep original pin. No duplicate of RUN4's residual argument or RUN3's Gamma guard.

## 1. Exact theorem and provenance
Paths below relative to src/Development/WeilBound/ThetaLifts/LatticeBasics/ at original pin. Blob IDs from GitHub connector, 7 fetched source files, 44 literal line-anchor checks:
- CoefLine.lean aef065b49dd25f8c44f8a84762661e4c2e1682b5: lines 13–61 entire theorem; rp 29, tr 32, doubling witness 34, SWFull 39, kpair_cont 41, identity 43–46, specialization 50–59, cancellation 60–61.
- ContinuousFlat.lean e07b88f18ae7f1519132c586f98505de4fdffe03: kpair 46–47; kpair_cont 49–95; continuation of rational invariance 66–68; compact-parameter bounds 73–85; right threshold 86–95; I_right 97–99.
- FarRight.lean 39f221e77ec83a896c30bbc55b4b4fb51d089fbd: An.at_value 34–47, An.far_right 49–57, An.ident 59–64.
- PairsStable.lean 15cdb3b0663f439d9ce45052db1299255f4196c9: DblW 33–41; BoxSec 43–49; SWFull 51–58; HgtInt 75–79; PairsStable 103–106; CoefLine 121–129.
- Hypotheses2.lean 803e1ac677566855e89aa7437ea49c0b78db3602: IsEisCont 53–60 (open, preconnected, punctured-neighborhood membership, half-plane summation, holomorphy, joint continuity, local growth).
- Unfold0.lean f7bdb0f6743a8096a4faa8da5b64f6e889471111: Law.hasSum 30–52, Law.eis_inv 54ff, unfold0 72ff.
- FdEqZero.lean 5a71acf351e947b2bef53cba29a0166d2bfce192: compact bounds Cpt.bdd₂ 88ff, rapid 98ff, vol_ne 105ff.

Exact theorem CoefLine (PairsStable 121–129) fixes the original fields F,E, field/number-field/algebra structures, involution sigma, base B, a,a', geometry G, characters X, reps om,om', maps R,Rf, IsMatched h, and p=q=0. For ANY Haar measure mu on the adelic W group and fundamental domain D for the rational subgroup, fix complex s,t,lambda. Write C_y=s I(om,y.1)+t I'(om',y.2), B_y=I'(om',y.2) for matched y (including So membership). Assume for ALL matched y,y' that
  <C_y,C_y'>_W = lambda <B_y,B_y'>_W.
Then for EVERY matched y and EVERY polynomial test Psi in PolData B G.M', letting T_Psi(f)=th om' mu D f Psi,
  <T_Psi C_y,T_Psi C_y>_V' = lambda <T_Psi B_y,T_Psi B_y>_V'.
Inner product linear in first variable, conjugate-linear in second; these are restricted-Haar integrals, not assumed finite-dimensional vector products. The coefficient lambda is the SAME complex scalar, not |lambda| or a newly chosen constant.

The source takes exactly 12 explicit premises: SWFull (continued doubling Eisenstein series and special-value identity); BoxSec (section law/continuity); DblW (doubling representation, embedding and character-corrected theta-product identities); HgtEx (positive continuous height, compact-type factorization and continuous embedding); HgtInt (integrability of height powers in right half-plane); Stab2Cpt (stabilizer compactness); CptAll (compact covers and quotient measure data); PairsStable (matching stable under simultaneous right translation and linear combination); MatchEx (polynomial/Schwartz compatibility of matched pair); ThetaBasic (theta continuity and rational invariance); PositivityTheory.ThKF.ICont (continuity of I); PolSch (polynomial test implies Schwartz). None eliminated. Geometric rank and definiteness guards follow from T=h.triple, T.geo.lt, T.geo.aBig, p=q=0; no extension to indefinite cases claimed.

## 2. Far-right identity: transport all cross terms, not merely norms
Fix y,Psi and keep them throughout. Set H = U(W), H' = U(V'), nu=mu|D, rho=G.M'.mu|G.M'.dom, V=rho(H'). Write f=C_y, b=B_y. CptAll and theta continuity/invariance plus PolSch and MatchEx make both rapid (rp); right translation satisfies f(hg)=C_{g.y}(h), b(hg)=B_{g.y}(h), where g.y=(om(1,g)y.1,om'(1,g)y.2). I_right proves this via representation multiplication; PairsStable ensures g.y is still matched. Thus the all-pairs premise gives for each g
  <f(.g), f>_W = lambda <b(.g), b>_W.
A diagonal norm equality for a single y would NOT suffice.

Use DblW, HgtEx/HgtInt, BoxSec and SWFull with the SAME polynomial Psi in both slots. Let e embed H x H in the doubled group; let E(z,x) be the analytic continuation of the section's Eisenstein series, flat height extension from z0=((a':C)-(a+a':N))/2. Use z for complex spectral parameter (not coefficient s of C_y). Put d(h2)=detInv X.alpha h2, a unit-modulus character correction. Define the quadratic kernel
  Q_z(v)= int_{D x D} E(z,e(h1,h2)) d(h2) v(h2) conj(v(h1)) dmu(h1)dmu(h2).
For Re z sufficiently large, kpair_cont proves
  Q_z(v)= int_H w_z(g) <v(.g),v>_W dmu(g),
  w_z(g)=flat(height, section, z0,z)(e(1,g)) d(g).
Thus Q_z(f)=lambda Q_z(b) throughout a right half-plane, with the same weight w_z for both v. The proof uses integral_const_mul and commutativity in C, not any independent pointwise eigenfunction assumption.

The helper Law.hasSum identifies rational parabolic cosets with the rational group via anisotropy; Law.eis_inv gives rational invariance where the Eisenstein sum converges. unfold0 unfolds the fundamental-domain sum; An.far_right then exchanges integrals. The full group weight is integrable by HgtInt, the compact stabilizer norm estimate Law.bound, and the unit modulus of d. The threshold in ContinuousFlat is max(t1,t0+Re(z_base)-Re(z_law)), where t1 is the continuation half-plane threshold and t0 is the height-power threshold; z_base denotes that helper's s0, z_law its transformation-law exponent. These are not the coefficients s,t in C_y.

## 3. Analytic continuation of the equality, not of lambda
SWFull produces a common open preconnected U containing a full right half-plane and z0, and a single E(z,x) on U. Rational invariance of E(z,e(h1,h2)) extends to U by An.ident for each pair of group elements. The proof of kpair_cont uses compact covers of H in both slots, jointly continuous E on U x doubled group, and this invariance to bound the kernel uniformly on compact spectral subsets. Multiplying by bounded continuous rapid v yields integrable local domination on finite nu.prod nu. An.diffOn_integral gives holomorphy of Q_z(v) on U. These steps use second-countability/local compactness supplied by Cpt, and finite restricted measures, rather than unjustified interchange of derivative and integral.

Both Q_z(f) and lambda Q_z(b) are holomorphic on this SAME U and equal on the right half-plane. An.ident uses Mathlib eqOn_of_preconnected_of_eventuallyEq, taking t+1 as a point of the open half-plane; equality extends to every z in U, especially z0. No need to assume the Eisenstein series converges as a sum at z0. Connectedness, common domain and holomorphy cannot be removed.

## 4. The special value is a backward theta norm with the original factor
SWFull at m=a', n=a+a' states E(z0,x)=(if n<m then 1 else 2) times the average over the primed model domain of the doubled theta sum. Here n>=m, so the factor is exactly 2. Let theta(g,h)=theta om' Psi g h. The DblW product identity for the SAME Psi in each slot gives
  d(h2) E(z0,e(h1,h2)) = (2/V) int_{D'} theta(g,h1) conj(theta(g,h2)) d rho(g).
The conjugations and location of d(h2) are essential. DblW supplies the factorization after evaluating the doubled embedding; the average is setAverage_eq, not an arbitrary normalized measure. By Cpt.vol_ne, V is finite and nonzero (hence positive). The factor 2/V is independent of v.

Both theta and v are bounded continuous (compact covers + rational invariance, as used by An.at_value). Product integrand is absolutely integrable on the finite product of nu,nu,rho. Fubini, complex conjugation of the integral, and product integration give
  Q_z0(v) = (2/V) int_{D'} |int_D v(h) conj(theta(g,h)) dnu(h)|² drho(g)
           = (2/V) <T_Psi(v),T_Psi(v)>_V'.
Apply to f,b and use Q_z0(f)=lambda Q_z0(b). Cancel 2/V != 0 in C (actual Lean mul_left_cancel₀ with two_ne_zero and inv_ne_zero of Cpt.vol_ne). This proves exactly CoefLine with all hypotheses and quantifiers. No division by a possibly zero theta integral. RUN4 can now use this source-matched lemma to force its residual scalar to vanish. The actual production of SWFull, BoxSec, DblW and the other premises remains open; SWFull is a proposition, not an independently verified literature result.

## 5. Reproducibility and negative controls
Executed V8 exact bounded Gaussian-integer finite models, not a numerical simulation of adelic groups or proof of analytic continuation. Weighted product-measure Fubini tests use arbitrary finite complex theta arrays and positive integer weights. Finite cyclic unfolding tests use all 125 vectors and 125 weight vectors. Cross-Gram tests use cyclic translates and scalar multiples to enforce the full premise, then evaluate the same lambda in a translation-invariant theta model. Special-value tests clear the positive denominator V rather than approximate. Separate negative controls reject diagonal-only equality, missing conjugation, and cancellation of a zero prefactor. Actual output: {"weighted_fubini":1500,"unfolding":15625,"uniform_cross_gram":16875,"special_point":3375,"negative_controls":3}.

Source check replay: git show 40e56bab026552e089d7afcfeff08d2defb9c005:<full path>; git hash-object on the exact bytes; compare the seven blob IDs and line anchors listed above. The connector fetch and literal anchors were executed; local git hash recomputation and Lean kernel replay were not. Anchor presence is not proof-term dependency extraction. No URT speedup claimed.

Replay finite algebra (Node or JS):
~~~js
function regression(){
 const assert=(x,m)=>{if(!x)throw Error(m)};
 const Z=[0,0],add=(a,b)=>[a[0]+b[0],a[1]+b[1]],neg=a=>[-a[0],-a[1]],conj=a=>[a[0],-a[1]],mul=(a,b)=>[a[0]*b[0]-a[1]*b[1],a[0]*b[1]+a[1]*b[0]],sc=(n,a)=>[n*a[0],n*a[1]],eq=(a,b)=>a[0]===b[0]&&a[1]===b[1],sum=a=>a.reduce(add,Z);
 const n=3,values=[[0,0],[1,0],[-1,0],[0,1],[1,-1]],vec=[];
 for(const a of values)for(const b of values)for(const c of values)vec.push([a,b,c]);
 const idx=[0,1,2],shift=(v,k)=>idx.map(i=>v[(i+k)%n]),ip=(v,w)=>sum(idx.map(i=>mul(v[i],conj(w[i]))));
 let fubini=0,far=0,uniform=0,special=0;
 for(const phi of vec){
  for(let seed=0;seed<12;seed++){
   const H=idx.map(g=>idx.map(h=>values[(seed+g+2*h+g*h)%5]));
   const rho=[1+(seed%3),2,3],mu=[2,1+(seed%2),3],V=rho.reduce((a,b)=>a+b);
   const kern=(i,j)=>sum(idx.map(g=>sc(rho[g],mul(H[g][i],conj(H[g][j])))));
   const Q=sum(idx.flatMap(i=>idx.map(j=>sc(mu[i]*mu[j],mul(kern(i,j),mul(phi[j],conj(phi[i])))))));
   const T=idx.map(g=>sum(idx.map(h=>sc(mu[h],mul(phi[h],conj(H[g][h]))))));
   const norm=sum(idx.map(g=>sc(rho[g],mul(T[g],conj(T[g])))));
   assert(eq(Q,norm)&&norm[1]===0&&norm[0]>=0,"at_value weighted Fubini");
   // Kspecial = (2/V) kern; store its numerator to avoid roundoff.
   const Qnum=sum(idx.flatMap(i=>idx.map(j=>sc(2*mu[i]*mu[j],mul(kern(i,j),mul(phi[j],conj(phi[i])))))));
   assert(V>0&&eq(Qnum,sc(2,norm)),"special normalization");
   fubini++;special++;
  }
  for(const w of vec){
   const Q=sum(idx.flatMap(i=>idx.map(j=>mul(w[(j-i+n)%n],mul(phi[j],conj(phi[i]))))));
   const R=sum(idx.map(k=>mul(w[k],ip(shift(phi,k),phi))));
   assert(eq(Q,R),"unfolded form");
   far++;
  }
 }
 for(const b of vec)for(let k=0;k<n;k++)for(let r=-2;r<=2;r++){
  const a=shift(b,k).map(v=>sc(r,v)),lambda=r*r;
  for(let i=0;i<n;i++)for(let j=0;j<n;j++){
   assert(eq(ip(shift(a,i),shift(a,j)),sc(lambda,ip(shift(b,i),shift(b,j)))),"all cross terms");
   uniform++;
  }
  // translation-invariant kernel: theta row g is a cyclic translate
  const theta=[values[1],values[3],values[4]];
  const N=x=>sum(idx.map(g=>{const t=ip(x,shift(theta,g));return mul(t,conj(t));}));
  assert(eq(N(a),sc(lambda,N(b))),"same coefficient at special point");
  special++;
 }
 const a=[[1,0],[1,0]],b=[[1,0],[-1,0]];
 const dot2=(u,v)=>sum(u.map((x,i)=>mul(x,conj(v[i]))));
 assert(eq(dot2(a,a),dot2(b,b))&&!eq(dot2([a[1],a[0]],a),dot2([b[1],b[0]],b)),"diagonal-only negative");
 const x=[1,1];assert(!eq(mul(x,x),mul(x,conj(x))),"conjugation negative");
 assert(eq(sc(0,[1,0]),sc(0,[2,0]))&&!eq([1,0],[2,0]),"zero prefactor negative");
 return {weighted_fubini:fubini,unfolding:far,uniform_cross_gram:uniform,special_point:special,negative_controls:3};
}
console.log(regression());
~~~

RESUME HERE: trace the actual supplier of SWFull used by Reductions/TopPolarZero/PolZero.lean, starting at its call to the anisotropic Siegel–Weil construction and following the exact producer of hS (not a theorem-shaped statement). Identify which special-value and analytic-continuation fields of IsEisCont are proved internally or supplied by literature, and preserve the factor 2 versus 1 with its rank guards. Do not repeat the coefficient transfer, orthogonality, or Gamma guard. Coordinate literature lane on the trust boundary and keep lInt2 source unresolved until found.
HANDOFF TO: proof editor, integration, formal audit, theta, literature. Mark CoefLine source-matched conditional; replace its explanatory placeholder with sections 2–4. No physics gate or queue modified.

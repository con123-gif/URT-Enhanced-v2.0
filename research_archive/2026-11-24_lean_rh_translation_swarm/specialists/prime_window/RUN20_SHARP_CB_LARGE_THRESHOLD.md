# RUN20 — Fixed family positivity and sharp CbLarge threshold

2026-11-25. RESULT: SOURCE-MATCHED / independent human derivation; residual admission condition now has an exact necessary and sufficient fixed-constant threshold. Conditional on the existence of a native FamP. No claim that the source constructs such a FamP, that these declarations are root-reachable, or that Lean replay or URT acceleration was achieved.

P = 40e56bab026552e089d7afcfeff08d2defb9c005. H = c40250a50104b7e02e7d74f658d00fa7b1f4827c (observed upstream head, merge PR #1801; differs from RUN19's 4a5b4a2d2a5177a2b6cb876425f0cb4cb6b85061; commit distance not computed).

Preflight: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN19, research state/log/protocol/continuity excerpts and physical CI summary checkpoint 410 (45527764744, 02:03:57 UTC, not RH validation). Reviewed latest 40 working branch commit subjects and available peer handoffs from integration, acceleration, geometry, literature, math, dependency, kernel, audit and structure; no duplicate detected. Some peer full files and linked blueprint PDF not reopened; no claim of exhaustive duplicate search. Native code search for CbLarge and place existence returned no hits; absence not established. No changes to other lanes or physics.

## Source anchors (all P; paths under src/Formalism/)
- SharpRestriction/ParConsts.lean c3a5cddc3af0b027ad62b50a79cdb008712613a6 L31–55 FamP, sizes, GK, GK_nonneg; L62 fills, L79 rho_le.
- SharpRestriction/FamCore.lean 44cd54c38881086724fdf7f10f32b7d8e80e35b3 L74–85 Win_unb, Ix_win, L_x, L_eps; L138–142 FamCore.exists_pt.
- SharpRestriction/ElevenLe.lean 75f2ab1404c69a5d1330671d96d8f6cd35e74e52 L68 SizeLa; L134–138 SizesAt.
- SharpRestriction/GrowthBounds/IsResidueClassZero.lean 9fbb7879d0519f9a136e190551422881ef5d2f0b L14–33 Consts and Nonneg; L37–45 hG, KG, rG, N1, Gp; L58–66 La, rho, rhoB, CbLarge; L401–410 ParametersFill.
- LocalRingCardinality/RhoDetPrimeEqMuTildeMulChiPow.lean 6ab57a7f313a9f8c351005051933a60a22a0da08 L76–87 D7 and what₂, L106 nfLL, L134 plEq.
- LocalRingCardinality/DataParams₂.lean 50914500995df91e2646d91a6c5c99a7e603a51b L9–17 Scale, L27–45 L, b, a, delta1.
- SharpRestriction/GrowthBounds/UnramifiedQuadraticSetting.lean c36e22ceab2885a6ab812f6187bfd1a86472a6ec L239–248 goodU, goodEll, orbitSmallMultiplicity, goodG', orbitWindowCount.
- SharpRestriction/GrowthBounds/LogarithmicSums/StarNum.lean 47c8e4430e4150f61202b8afa77ca2b6369c8043 L34–40 rE, cGE, cNE, L94–134 first_count_le_log (existing sufficient but nonsharp bound).
- RUN19_ARCHIMEDEAN_BAND_SUMS.md sections 3–4: eventual ArchimedeanSignatureMatching iff GK.rho=0 OR GK.La=0 OR eventual CbLarge, assuming FamP.

## 1. GK.La is positive already at FamP level, without admission

Fix eps and Fm:FamP eps. By FamCore.exists_pt with y=x1+1 choose x>x1 and i:Ix x. This is not a claim that every fibre is nonempty. Set D=D x i, L=L x i, s=L.sc, K=Fm.GK. Native D.nfLL makes F=D.what₂.LL a number field; D.plEq identifies the abstract places with HeightOneSpectrum of its ring of integers O_F.

Independent standard algebra proof of a place: the ideal (2) in O_F is nonzero and proper. If 2 were a unit then 1/2 would be an algebraic integer, which is impossible: substituting 1/2 into a monic polynomial of degree d>=1 over Z and multiplying by 2^d gives 1 plus a sum of even integers equal to zero. Since O_F is a domain of characteristic zero, (2) is nonzero. Choose a maximal ideal containing (2); it is a nonzero prime ideal, hence a height-one prime in the Dedekind domain O_F. Apply the inverse of D.plEq to obtain a genuine w. This does not require w in L.supp, a specified residual prime, a nonempty jet index type, or an additional assumption of admission. The exact Mathlib proof-term implementation of the maximal ideal and height-one construction is not yet checked.

Fm.fills x hx i w gives ParametersFill; its final conjunct is La K s=L.LaG. Fm.sizes x hx i gives SizesAt, whose ninth conjunct is SizeLa: x^eps<=L.LaG (using L_x and L_eps). Since x>1, x^eps>0. Thus
  0 < La K s = K.La * (N1 s)^2 * log(s.a).
In particular K.La cannot equal zero. K.Nonneg supplies 0<=K.La, so K.La>0. Alternatively the other two factors are positive because N1=ceil(max(...))+1>=1 and s.a=x exp(x^eps)>1. GK is fixed before x and i, so a single instance suffices. Consequently RUN17–19's positivity premise is derivable from FamP, not an independent admission premise. This does NOT prove FamP exists unconditionally.

## 2. Exact asymptotic slope of N1

Fix 0<eps<1/52 (eps fixed before any x threshold), denote Euler's number by E=exp(1), and use fresh letters to avoid conflation with native Scale.A=26. Set
  h=2+8 eps, r=ceil(8(h+2)/eps)+1, B=6r+1,
  A=(h+3)10^B, C=6 E B A,
  t=log x>0, u=x^(eps/8)>1.
Then delta1=1/u, and the pinned definitions give exactly
  M=ceil(A t), U=ceil(u), Gp=(M+5) B U,
  F=6 E B (M+5) U/u, G=(h+3)t/log 2,
  N1=ceil(max(F,G))+1.
All ceilings are natural ceilings on positive reals. From M>=A t and U>=u, and the added 5,
  F>C t.
Moreover C/(h+3)=6 E B 10^B>2>1/log 2 (log 2=integral_1^2 ds/s>1/2). Thus F>G for every x>1. It follows that the max is redundant on the original scale, and
  N1=ceil(F)+1 > C t.
For an upper bound, M<=A t+1 and U<=u+1 yield
  N1<=C t+6 E B(A t/u+6+6/u)+2.
For t>=1 (and u>=1) divide by t:
  0<N1/t-C<=C/u+(72 E B+2)/t.
Since eps>0 and t,u tend to infinity, this establishes the exact asymptotic slope and strict one-sided approach
  lim_(x->infinity) N1/log x = C, with N1/log x > C for all x>1.
This is not a numerical approximation. It explicitly retains the +5 and +1 offsets. Source first_count_le_log supplies a coarser upper constant; the above is an independent sharpening.

## 3. Sharp eventual threshold; no free choice of an already fixed GK.CN

Let c=K.CN. For any fixed c>C, put m=c-C>0. Choose x large enough to have
  log x>=max(1, 2(72 E B+2)/m), and x^(eps/8)>=max(1,2C/m).
One sufficient threshold is max(exp(max(1,2(72 E B+2)/m)), max(1,2C/m)^(8/eps)). Then both error terms in section 2 are <=m/2; hence N1<=c log x. Threshold depends only on eps and fixed c, not on i, w or p. Conversely if c<=C, strict lower bound makes CbLarge false at every x>1. In the family eventual statement, nonvacuity is guaranteed by FamCore.exists_pt beyond any proposed threshold. Hence
  Eventual(CbLarge GK) iff GK.CN>C(eps).
Equality at the limit is NOT sufficient because of strict positive ceiling/offset error. This sharp criterion is stronger than RUN19's necessary lower bound (h+3)/log 2 and avoids pretending that GK.CN>=cNE was forced by the source.

Combine with RUN19's band theorem and FamP.rho_le, and section 1:
  Eventual(ArchimedeanSignatureMatching) iff GK.rho=0 OR GK.CN>C(eps).
In particular this conjunct of admission is now reducible to an explicit condition on two fixed fields of FamP, not an unspecified eventual analytic premise. This does not authenticate a native constructor imposing that condition. No change to other admission conjuncts.

## 4. Upstream comparison
Exact text matches across P and H: orbit definitions P L239–248 -> H L247–256 (blob 1c9ff6676bad3634a65d75f248b53bb82c03d1ee); ParametersFill P L401–410 -> H L427–436 and hG through Gp P L37–45 -> H L75–83 (blob 0622fc3b6d32afcdece44b5bac2496fd8ab099a6); FamCore.exists_pt P L138–142 -> H L113–117 (blob 9b67d02e58d04ab1e14a73ed572b83e63cd49193); SizesAt P L134–138 -> H L138–142 (blob a4a8c76eb7c3cc38989a0afebe51075070941a63). H also displays same SizeLa L72, FamP sizes L43, GK_nonneg L54, fills L61, rho_le L78 (ParConsts blob 9c325c376642368457542fa7a47cb8488b799b16); D7.nfLL L102 and plEq L130 (blob c2025b4fc6e75beaab5b5b2596f9c9b773de0759). Not a full upstream equivalence claim.

## 5. Executed regression
The following standalone Node/V8 check tests the exact rational ceiling algebra, first branch dominance, strict boundary, upper envelope, ratio estimate and sufficient threshold. Inputs t,u,E,log2 are independent rational proxies in the appropriate ranges (not actual native epsilon and x or actual transcendental constants); the proof above, not this regression, handles the real/native definitions. A and B are deliberately small proxies. The two final negative assertions are basic sign witnesses, not tests of the actual D7 geometry. No Lean replay or CI validation of this new artifact.
```js
const q=(n,d=1n)=>[BigInt(n),BigInt(d)];
const add=(a,b)=>[a[0]*b[1]+b[0]*a[1],a[1]*b[1]], mul=(a,b)=>[a[0]*b[0],a[1]*b[1]], div=(a,b)=>[a[0]*b[1],a[1]*b[0]];
const le=(a,b)=>a[0]*b[1]<=b[0]*a[1],lt=(a,b)=>a[0]*b[1]<b[0]*a[1];
const ceil=a=>q((a[0]+a[1]-1n)/a[1]);
const counts={firstDominates:0,strictSlope:0,upper:0,ratio:0,threshold:0,boundary:0,negative:0};
function ck(b,k){if(!b)throw Error(k);counts[k]++}
for(const A0 of [5,13,100,1000])for(const B0 of [1,7,13])for(let i=4;i<=40;i+=3)for(let j=3;j<=60;j+=4)for(const E of [q(5,2),q(11,4)])for(const log2 of [q(2,3),q(3,4)]){
 const A=q(A0),B=q(B0),t=q(i,4),u=q(j,3),H=q(5),D=mul(q(6),mul(E,B)),C=mul(D,A);
 const F=div(mul(D,mul(add(ceil(mul(A,t)),q(5)),ceil(u))),u),G=div(mul(H,t),log2);
 const N=add(ceil(le(G,F)?F:G),q(1)), base=mul(C,t);
 const err=add(mul(D,add(div(mul(A,t),u),add(q(6),div(q(6),u)))),q(2));
 const ratioErr=add(div(C,u),div(add(mul(q(12),D),q(2)),t));
 ck(lt(G,F),"firstDominates");ck(lt(base,N),"strictSlope");
 ck(le(N,add(base,err)),"upper");ck(le(div(N,t),add(C,ratioErr)),"ratio");
 ck(!le(N,base),"boundary");
 for(const m of [q(1),q(100),q(10000)]){
   if(le(div(mul(q(2),C),m),u)&&le(div(mul(q(2),add(mul(q(12),D),q(2))),m),t))
    ck(le(N,mul(add(C,m),t)),"threshold");
 }
}
ck(lt(q(0),q(1))&&!lt(q(0),q(0)),"negative");
ck(!le(q(2),q(1)),"negative");
console.log(JSON.stringify(counts));
```
Actual execution: {"firstDominates":9360,"strictSlope":9360,"upper":9360,"ratio":9360,"threshold":8424,"boundary":9360,"negative":2}.

## RESUME HERE
Request independent audit of the nonzero prime ideal/height-one place argument, the strict threshold and family quantifier scopes. Locate the actual native FamP/DFamP constructor or trace the first not-yet-reconstructed residual admission predicate in SmallOrderPrimes.lean if no such constructor is authenticated; do not choose GK.CN after x or assert that the fixed coefficient satisfies the new inequality without source evidence. Request role-labelled root paths for FamP, ArchimedeanSignatureMatching and CbLarge from dependency/kernel lanes. HANDOFF TO audit, dependency, kernel, integration, editor, prime_window. Full RH project OPEN.

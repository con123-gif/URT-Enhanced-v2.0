# Geometry RUN9 — arbitrary-level integral frames and Iwasawa reframing
2026-11-24. SOURCE-MATCHED / local derivation; exact rational regression executed. Project OPEN.

## Continuity
Read AGENTS, RESEARCH_STATE head, RESEARCH_LOG head, RESEARCH_PROTOCOL, CONTINUITY_PROTOCOL, CI checkpoint 378 (physical orchestrator unrelated to RH), SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, geometry RUN5–8, and current handoffs of character boxes, Galois, literature, editor, integration, structure, kernel, Landau, acceleration, prime-window and theta. Other dependency/math/audit directories listed, not all latest bodies reread. No overlapping frame reconstruction found in inspected notes. External blueprint not reopened; proof bodies primary. No physics changes.
RH repository leanprover-community/riemann-hypothesis; pin 40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream head 1da818b50f1e18808db2792b9dc735bda8cb84d8 (2026-11-24 15:42:48Z, batch 6 small PRs). Caller NvalLeOfMul.lean head blob 34a1ee4ef1a9a10cd0a5a4ead4515a39f4007bb7 differs from pin, but the trimmed intAll_all body and statement (617 characters) compare identical. No global migration equivalence.
 
## Source ledger
- `src/Development/WeilBound/CoreStatements/MinimalPrimeDimensions/FinSmallGen.lean` blob `4d2546abb6eaa7950fcfeb20dd8adca341631fa2`; anchor lines 102.
- `src/Development/AutomorphicSpectrum/Proofs/DivisibilityProofs/NvalLeOfMul.lean` blob `c6b7783c3c1ad3319333be797ab43aca15bd8bbf`; anchor lines 84, 87, 88, 89, 92.
- `src/Development/AutomorphicSpectrum/Proofs/DivisibilityProofs/ExistsPointOfVal.lean` blob `fd82a60e19a3b136aa30dc3f0803670912ec48b3`; anchor lines 6, 7.
- `src/Development/AbelianVarietyTheory/Proofs/TwistedOperators/ModuliPointIntegralFrameAfterFiniteExtension.lean` blob `298cdd04964790141271458fc6ceba40d55430ad`; anchor lines 300, 310, 334, 342.
- `src/Development/AbelianVarietyTheory/Proofs/TwistedOperators/IntegralFrameExtensionOfRankZeroSignature.lean` blob `4f61dbd79337fcfdb4f87ef060e6a4cf16d8e470`; anchor lines 42, 47, 53.
- `src/Development/AbelianVarietyTheory/Proofs/UnitaryExistence/IntAll.lean` blob `4ce2f8fdf261d60498aa4c67d3b17fa56cc94084`; anchor lines 27, 27.
- `src/Development/AbelianVarietyTheory/Proofs/UnitaryExistence/FrameLawsOfModuli.lean` blob `becdbf32bc9bc13ae29364b153537467657ecced`; anchor lines 27, 33.
- `src/Formalism/LocalToGlobal/ProjectiveLattices/IntAllProof.lean` blob `79ce58f2b234495ed0a560047905fd0f7ec102fa`; anchor lines 65, 73, 220, 234, 251, 253.
- `src/Formalism/LocalToGlobal/ProjectiveLattices/SatLeaves.lean` blob `71878d630587d0804791b91b5632578f8ed7a5b7`; anchor lines 852, 864, 865, 873, 875.
- `src/Formalism/LocalToGlobal/ProjectiveLattices/ExistsOfValILeOne.lean` blob `22e87e13c2d149f494c3dfaac6fd4b829900e7a8`; anchor lines 26, 29, 85, 140, 161, 163.
- `src/Formalism/LocalToGlobal/ProjectiveLattices/IsCombAt.lean` blob `a62154367e2bcd3f268e84669715f9753e326b0f`; anchor lines 79, 87, 89.
- `src/Formalism/LocalToGlobal/ProjectiveLattices/IntAllFree.lean` blob `d76587f73175d29f7ea81d653a3d86ca1af416ed`; anchor lines 14, 17.
- `src/Formalism/LocalToGlobal/ProjectiveLattices/IntAll.lean` blob `64467f9d10006a0fa5cb6520a3fb4a2f422dc380`; anchor lines 12, 15.
- `src/Formalism/LocalToGlobal/ProjectiveLattices/AllTest.lean` blob `e0e5983c72403a6b7743cde2b4527e5a0d2fb70b`; anchor lines 12, 13.
Blob IDs supplied by GitHub and compared against retrieved pinned results; 45 exact text anchors checked. Not a raw-byte hash replay or an elaborated dependency export.

## 1. The actual supplier is NOT the same-named good-level theorem
The exact FinSmallGen line 102 calls intAll_ramified (intAll_all Xo c). The actual supplier is GlobalTheory.CompanionTheory.SmallFin.intAll_all in NvalLeOfMul, lines 84–93, not GlobalTheory.IntegralFrames.intAll in the UnitariyExistence/IntAll module. For any field E with NumberField and IsCMField, host H, datum Dw, level l, moduli Xo and coefficients c, the conclusion is PjFree.IntAll Xo c. The source first obtains AllTest from frame_laws_of_moduli, then constructs IntFrExt by exhaustive Nat.eq_zero_or_pos(Dw.p+Dw.q). Zero invokes RankZeroFrames.intFrExt_of_rank_zero; positive invokes AnyLevelFrame.intFrExt. FrBaseChg follows from FramedBaseChange.exists_frMap using SecBaseChangeSt (lawsFieldsSeparately.2.1). Finally intAll_of_allTest hE hB hA proves the result. The similarly named good-level theorem needs rank >=1 and every prime good; neither is an extra input of the actual arbitrary-level caller. Both Pj.IntAll and PjFree.IntAll definitions have the same displayed quantifier/body; the Lean call uses that conversion. Do not conflate the theorem names.

## 2. Rank dispatch and existence (source-level, named geometric obligations retained)
For each CDVR T with fraction field F, io:c.F→F, finite residue field and a generic point x over c, IntFrExt gives a CDVR T', ring embedding i:F→F', integer r>0, equality v_{T'}(i(a))=r v_T(a) in source vV convention, finite residue, an integral frame y0 with base point spMap i ≫ x. All structure and coefficient embeddings are retained.
- Rank zero (Dw.p+Dw.q=0): exists_model_int constructs the model over Spec Z from isIso_moduli and the zero semiabelian triple; pushInvertible_any uses global section rank and arbitrary section base change. gfp_frPt_gen constructs the identity tangent basis on the original point (empty dimensions allowed). intFr_of_model uses intFrames_of_laws to obtain integral frame y with FrBor to the generated frame. Its base point is preserved; take T'=T, i=id, r=1, original finite-residue evidence. This is not an arbitrary assertion that integral extension is trivial for nonzero rank.
- Positive rank: AnyLevelFrame.intFrExt chooses a good level l2 and raised coefficient c2, a moduli scheme X2, a semiabelian model object and compatible finite field extension L via exists_obj_level; exists_cdvr_finite_extension produces T',i,r,psi, valuation scaling and finite-residue implication. A prime in the maximal ideal of T'.V is obtained from finite residue; its good-level hypothesis enables exists_model_pushInvertible_under_cdvr. The generic point z lifts to the model by extPt. genFibre and thetaCore_of produce the compatible theta sections; sabCancel and three sabComp calls relate the original and model semiabelian maps; the equality psi∘algebraMap=i identifies the base point. exists_intFr supplies the required integral frame. All named moduli existence, proper extension, thetaCore_of and frame-construction suppliers remain obligations; this is a body-level reconstruction of dispatch and assembly, not their independent full proofs.

## 3. Exact Iwasawa step — the frame correction is on the RIGHT
Work over a DVR V, fraction field F, fixed point x and eigenlabel tau. Write the two tangent bases as column lists Y (integral) and Z (transported generic). By their unique eigenbasis properties Z=YA and Y=ZB. Tangent-combination associativity (TanLin) and uniqueness give AB=I, hence det A≠0. For m=Dw.mult tau (possibly zero), the source iwasawa' provides
  A N = k_F,    k in GL_m(V), N in GL_m(F) upper triangular, N_ii≠0.
Here k_F is the entrywise embedding. The orientation matters: the new integral basis is Y k_F=Z N, NOT N A or an arbitrary unit change of the generic basis. The diagonal of N gives the nonzero components t(some(tau,i)); the entries below the diagonal vanish, precisely the FrBor condition.

Proof of the factorization, as in ExistsOfValILeOne. Choose a first-column nonzero pivot with maximal multiplicative valuation (equivalently minimal additive order). All other first-column entries divided by the pivot lie in V by the valuation-ring membership lemma. Swap the pivot into row zero and subtract these integral multiples from lower rows. The combined Q belongs to GL_m(V): permutation determinant ±1 and lower triangular elementary matrix determinant 1. Then B=Q_F A has form [b w; 0 C]; det B=b det C≠0. By induction C=k' U' with k' integral invertible, U' upper triangular with nonzero diagonal; use K=diag(1,k') and U=[b w; 0 U'] to obtain B=K_F U, so A=(Q^{-1}K)_F U. Rank zero uses identity and vacuous triangular conditions. Set N=U^{-1}; triangular inverse has nonzero diagonal and U N=I. This proves A N=k_F for every dimension without assuming every entry of A or N integral.

## 4. Reframe and transport (actual SatLeaves path)
AllTest means every frame over a reduced coefficient algebra comes from a test ring; for a field F' this applies. SatLeaves.intRebase_of uses k with unit determinant to rebase y0, transports determinant to the field, uses integral_reb to preserve the integral frame data, and gen_unit to compare the two generators of the rank-one section module. The latter provides t0 in F'^×; the generator comparison uses the identity map on the common base point. Then reFrame_of combines tangent linearity and this IntRebase to obtain y' with FrBor t z y'.1; t(none)=t0 is the generator factor, not a tangent diagonal. This preserves all components, including the section clause, not just matrix equality.
Given the original la,T,io,e, OverLa, finite residue and arbitrary frame y, intAll_of applies IntFrExt to y.x, then FrBaseChg via i to obtain z, then ReFrame at their common base point. Its output uses io'=i∘io, e'=r e, finite residue and the ring preservation condition. Since r>0 and e>0, OverLa transports (ho.bc); for a∈V, vV(i(a))=r vV(a)≥0 (zero handled by source convention), hence i(a) lies in V' by mem_range_of_vV_nonneg. The result is the complete local existential assembly required by RUN6, including FrMap and FrBor. No equality of actual generic and integral frames before reframing, no finite residue dropped, no added good-level assumption.

## 5. Executed checks
Exact rational DVR examples with V=Z_(p) (not CDVR; tests only the algebraic Iwasawa sublemma) for p=2,3,5: ranks 0–3; exhaustive small 2x2 matrices with varied p-power denominators and deterministic 3x3 samples. Verify A=KU, AN=K, UN=I, integrality and unit determinant of K, triangular/diagonal conditions, singular rejection and noncommuting order negative controls. These do not prove the moduli existence theorems or arbitrary DVR factorization; the proof above is the mathematical argument. Actual JS execution result: {"dimensions":[3,90,4800,900],"negative":834,"entries":27390,"wrongOrder":4922,"total":5793}. Source anchors 45, pinned blob comparisons 14. No Lean kernel execution. No URT benchmark. No original assumptions discarded.
Save this block to run9.mjs and run node run9.mjs:

~~~js
function regression(){
 const ck=(b,m)=>{if(!b)throw Error(m)};
 const gcd=(a,b)=>{a=a<0n?-a:a;while(b){let t=a%b;a=b;b=t;}return a<0n?-a:a;};
 const f=(a,b=1n)=>{a=BigInt(a);b=BigInt(b);ck(b!==0n,"denominator");if(b<0n){a=-a;b=-b}let d=gcd(a,b);return [a/d,b/d]};
 const add=(x,y)=>f(x[0]*y[1]+y[0]*x[1],x[1]*y[1]), neg=x=>f(-x[0],x[1]), mul=(x,y)=>f(x[0]*y[0],x[1]*y[1]), div=(x,y)=>f(x[0]*y[1],x[1]*y[0]);
 const zero=x=>x[0]===0n,eq=(x,y)=>x[0]===y[0]&&x[1]===y[1];
 const vp=(x,p)=>{if(zero(x))return Infinity;let v=a=>{let z=0;while(a%p===0n){a/=p;z++}return z};return v(x[0])-v(x[1])};
 const eye=n=>Array.from({length:n},(_,i)=>Array.from({length:n},(_,j)=>f(i===j?1:0)));
 const mm=(A,B)=>A.map(row=>row.map((_,j)=>row.reduce((s,x,k)=>add(s,mul(x,B[k][j])),f(0))));
 const same=(A,B)=>A.every((r,i)=>r.every((x,j)=>eq(x,B[i][j])));
 function det(A){let n=A.length;if(!n)return f(1);return A[0].reduce((s,x,j)=>add(s,mul(j%2?neg(x):x,det(A.slice(1).map(r=>r.filter((_,k)=>j!==k))))),f(0))}
 function dec(A,p){let n=A.length,U=A.map(r=>r.slice()),K=eye(n);
  for(let j=0;j<n;j++){
   let pivot=j;for(let i=j+1;i<n;i++)if(vp(U[i][j],p)<vp(U[pivot][j],p))pivot=i;
   if(zero(U[pivot][j]))throw Error("singular");
   [U[j],U[pivot]]=[U[pivot],U[j]];
   for(let i=0;i<n;i++) [K[i][j],K[i][pivot]]=[K[i][pivot],K[i][j]];
   for(let i=j+1;i<n;i++){let c=div(U[i][j],U[j][j]);ck(vp(c,p)>=0,"pivot integrality");
    U[i]=U[i].map((x,k)=>add(x,neg(mul(c,U[j][k]))));
    for(let k=0;k<n;k++)K[k][j]=add(K[k][j],mul(c,K[k][i]));
   }
  }
  let N=eye(n);
  for(let col=0;col<n;col++)for(let i=n-1;i>=0;i--){let s=f(i===col?1:0);for(let j=i+1;j<n;j++)s=add(s,neg(mul(U[i][j],N[j][col])));N[i][col]=div(s,U[i][i])}
  return {K,U,N}
 }
 let dimensions=[0,0,0,0],negative=0,entries=0,wrongOrder=0;
 function test(A,p){let d=det(A);if(zero(d)){let failed=false;try{dec(A,p)}catch(e){failed=e.message==="singular"}ck(failed,"singular control");negative++;return}
 let {K,U,N}=dec(A,p),n=A.length;ck(same(mm(K,U),A),"A=KU");ck(same(mm(A,N),K),"AN=K");ck(same(mm(U,N),eye(n)),"inverse");ck(vp(det(K),p)===0,"unit det");
 for(let i=0;i<n;i++)for(let j=0;j<n;j++){ck(vp(K[i][j],p)>=0,"K integral");if(i>j)ck(zero(U[i][j])&&zero(N[i][j]),"upper");if(i===j)ck(!zero(N[i][j]),"nonzero diag");entries++}
 if(!same(mm(N,A),K))wrongOrder++;dimensions[n]++;
 }
 for(const p of [2n,3n,5n]){test([],p);for(let a=-5;a<=5;a++)for(let s=0;s<=2;s++)test([[f(a,p**BigInt(s))]],p);
 for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++)for(let c=-2;c<=2;c++)for(let d=-2;d<=2;d++)for(let s=0;s<=2;s++)test([[f(a,p**BigInt(s)),f(b,p)],[f(c),f(d,p**BigInt(2-s))]],p);
 for(let t=0;t<300;t++){let A=Array.from({length:3},(_,i)=>Array.from({length:3},(_,j)=>f(((t+3)*(i+2)*(j+7)+t*t*(i+1)+i*i+3*j*j+i*j*t)%17-8,p**BigInt((t+i+2*j)%3))));test(A,p)}
 }
 ck(wrongOrder>0,"order negative control");return {dimensions,negative,entries,wrongOrder,total:dimensions.reduce((a,b)=>a+b,0)};
}
console.log(regression());
~~~

RESUME HERE: reconstruct the pinned archimedean supplier local_unit_map_surjective used by WeilHeightArchimedeanContribution (RUN5 source ledger), specifically its exact coefficient-field embedding, local unit surjection and holomorphic cusp-form matching, then norm_small_le with all unfolded-domain hypotheses. Deeper moduli existence/section suppliers from the positive rank branch remain open and can be assigned by the integration/dependency lane; do not repeat Iwasawa. HANDOFF TO literature, integration, editor, audit, geometry. Project OPEN.

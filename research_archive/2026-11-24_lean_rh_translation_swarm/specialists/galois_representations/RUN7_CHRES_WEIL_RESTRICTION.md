# Run 7 — ChRes: restriction of rank-one Weil–Deligne characters

2026-11-24. RESULT: SOURCE-MATCHED human reconstruction of the native ChRes producer and its df_res consumer. This is a conditional exact arithmetic bridge, not independent verification of RH or of all p-adic Hodge dependencies.

## Preflight
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state, continuity, Run 6, latest specialist/editor/integration handoffs and Grok galois_rows Run 6. No overlap with integration's ExtDual or theta's AStep frontier. Root RESEARCH_LOG.md and RESEARCH_PROTOCOL.md returned 404 at this ref; these root files were not read. Latest visible Cathedral CI 45404045471 pending, 45403441156 in progress; not RH verification. No physics queue changes. External blueprint not used as evidence. Upstream head checked e26756e547b281cbf137eb7e0f16cccb738f3f84 (2026-11-24T12:49:24Z); original pin 40e56bab026552e089d7afcfeff08d2defb9c005 remains canonical for this reconstruction.

## 1. Exact hypothesis and quantifier order
Let F ⊂ F' be number fields, Ω a common algebraic closure with both algebra structures forming a scalar tower. Fix prime ℓ, valuation subring A of Ω lying over finite places w,w', ring equivalence ι:Qbar_ℓ→C, and an arbitrary coefficient ring O (commutative, Z_ℓ-algebra, topological space) with local bridge B and Induces B. Write Dec_F for the decomposition group at A and W_w for the Weil subgroup.
WDis(P,ι,h,B,κ,ξ) means IsPstAt(P,B,rk1 κ) AND there exists smoothness evidence hs such that wdAt(P,ι,B,rk1 κ)=WD.lpOfChar(h,ι_*ξ,hs).
ChRes FIRST constructs O', its three structures, a new bridge B' and Induces B'. Only then, FOR ALL monoid characters κ,κ' on Dec_F,Dec_F', continuous κ and agreement whenever the two arguments act identically on Ω, and FOR ALL ξ satisfying WDis at P=PP ℓ, it supplies ξ' on W_w' with WDis for κ' and matching values at EVERY pair of Weil elements with identical action. No Galois extension F'/F requirement; no separate continuity assumption on κ' in this interface. It is not arbitrary change of local embedding. Matching actions are essential.

## 2. Construct the common local realization (ex_bridge)
Retain B.j:Ω→Qbar_ℓ. Let K'=Q_ℓ(j(F')) inside Qbar_ℓ; finiteDimensional_adjoin_range makes it a finite extension, and j(F') is dense in it by adjoin_range_subset_closure. exists_mulEquiv supplies the decomposition group isomorphism e' to G_{K'}, its continuity and inverse continuity and equivariance e'(g)j(x)=j(gx). Choose L' as the normal closure of K'/Q_ℓ; it splits all embeddings of K', with O'=OL(L') and the identity integral-ring equivalence. This gives B' with B'.j=B.j; its inducing valuation condition is unchanged. BridgeInd.kw_eq_adjoin and the scalar tower show K=B.Kw⊂K'=B'.Kw. This is the native ex_bridge from PotRes, not a postulated compatible embedding.

## 3. Weil restriction and normalized Frobenius degree
Common A gives contraction w'∩O_F=w. If f is the residue degree, q'=q^f. Restricting scalars gives resG:Gal(Ω/F')→Gal(Ω/F) acting identically on Ω, preserving decomposition and inertia groups. Weil membership is witnessed by nonnegative a,b with residue action σ'(x^{q'^b})=x^{q'^a}; equivalently signed deg σ'=a−b. Thus the same action with q uses fa,fb and deg(resWeil σ')=f deg σ'. The map resWeil is the codomain restriction of resG. Its inertia restriction is continuous: for an open stabilizer neighborhood of the identity downstairs, choose a finite basis of the corresponding finite field, and intersect the finitely many open upstairs stabilizers of these integral-over-F' elements. Fixing the basis fixes the field. Consequently any smooth Weil character (kernel on inertia open) pulls back to a smooth character: its inertia kernel is the preimage of the original open kernel.
For places over ℓ, q=ℓ^d, q'=ℓ^{d'}, d'=df. The exact source normalization alpha(σ)=resDeg(ℓ,w)·deg σ yields
  alpha(resWeil σ')=d·f·deg σ'=d'·deg σ'=alpha(σ').
The signs are retained for negative degrees; the actual operator is weilD(σ)=actD(weilToGK σ)·phiU^{−alpha(σ)}, with phiU invertible. The raw degrees generally differ. Neither ramification nor unsigned degree is a substitute.

## 4. Restrict the finite model, not just its eigenvalue
From WDis choose a finite model r0 over L0, with IsModel and IsPst. Enlarge to L=supExt L0 B'.LL, so the coefficient field contains the new bridge splitting field. PstExt.isPst_enlarge supplies potential semistability after scalar extension. Define fD:Dec_F'→Dec_F by resG; the matching-actions premise forces κ'=κ∘fD by evaluation. The upstairs finite model is r1∘fD, where r1 is the enlarged downstairs model; its IsModel equality follows by extensionality. B.j=B'.j and equivariance plus injectivity show fD(e'^{-1}g)=e^{-1}(incl g), for g∈G_K'. Hence B'.repE(L,r1∘fD) = resTo(B.repE(L,r1),K⊂K').
PstLaws.isPst_resTo_iff gives IsPst upstairs. Its proof at line 228 identifies the maximal-unramified linear spaces DpstUr by the two directions of Dpst_resTo and the toUr maps; they are mutually inverse linear maps, so equal rank and hence equivalent IsPst. Underlying Dpst_resTo remains a named dependency; its mathematical reason is cofinality of finite extensions inside the common closure: an element fixed over an extension of K is fixed over its compositum with K', and a finite extension of K' is also a finite extension of K. Do not replace potentially semistable by semistable at K. Neither hV' nor the finite-model witness may be omitted. PstExt.isPst_enlarge uses finite coefficient coordinate decomposition and isPst_of_coord, not an assumption that scalar extension is harmless.

## 5. The spectral bridge eig_res and model independence
For ANY finite-dimensional L-representation ρ of G_K with IsPst P ρ, let ρ'=resTo ρ. Dpst_resTo identifies the potential period submodules. The inclusion T:Dpst(ρ')→Dpst(ρ) is linear and is onto by the reverse inclusion. The complex WDSpace is the Letter quotient of the complex scalar extension by the relations mulD(c)−urC(c) (see FiniteDimensionalLetter.letterKer and FiniteDimensionalWdSpace.WDSpace). T respects coefficient action and these relations, so EnlargeCoeff.chg induces Φ on WDSpace. On its distinguished generators Φ(wdMk'(x))=wdMk(Tx); since these generators span and T is onto, Φ is onto. LetterDim.finrank_wdSpace and IsPst on BOTH sides give equal finite dimension, so Φ is an isomorphism. This is the key place where dimension is used; a mere surjective map would not justify equal spectra.
For matching σ,σ', the bridge group action and alpha identity show that T intertwines weilD'(σ') and weilD(σ) (including signed powers of invertible phiU). By linearity on the spanning generators, Φ intertwines the two wdRho actions. The two actions are conjugate. Conjugate linear operators have the same characteristic polynomial; BridgeParam.isFrobSS_wdRep.charpoly_eq ensures Frobenius semisimplification does not change that polynomial. WD.eig_mk then gives equal eigenvalue multisets. This proves eig_res, not equality of all arbitrary higher-rank WD classes from just spectra: monodromy is separate.
wdAt_model compares the selected model defining wdAt to ANY admissible finite model, enlarges both to the common coefficient compositum, identifies the mapped matrices via IsModel, and uses BridgeParam.wdPst_enlarge twice. The latter uses equivariant coefficient inclusion, coordinate projections, spanning and preservation of monodromy, with scalar factor 1. Thus eig_res applies to the actual wdAt classes, not only a convenient chosen representation.
In rank one, lpDim_wdAt=1, so the native ParamAboveModel.eq_lpOfChar criterion identifies the class by its unique scalar eigenvalue at every Weil element. In rank one nilpotent monodromy vanishes. The old WDis equality gives the scalar ι ξ(resWeil σ'); it is exactly the required scalar for ξ'=ξ∘resWeil. Smoothness was proved in section 3, IsPstAt in section 4. For matching actions resWeil σ'=σ by extensionality, so ξ'(σ')=ξ(σ). This completes ChRes at the level of its actual source producer.

## 6. Exact connection to df_res and nonvanishing
In ContinuousRankOneRep.df_res let wt be the original integer embedding weights and d the correction character satisfying Df. ArtNorm (Run 6) gives embedding restriction res and local norm N, with alg(wt)(Ny)=alg(wt∘res)(y) by regrouping finite embedding fibres; keep negative exponents and the sign −wt in IsLocAlg. Restrict a locally algebraic continuous ν to Dec_F' using continuous scalar restriction; its weight becomes wt∘res and its inertia character pulls back. ChRes now supplies ξ' matching ξ on σ,σ'. ChBasic uniqueness identifies ξ' with the upstairs corrected expression from df_ex. The common factor ν(σ)·alg(wt)(aσ), nonzero as a unit, cancels using ArtNorm. This gives d(σ)=δ'(wt∘res)(σ'). df_unit produces s' of degree zero upstairs such that that correction equals alg(wt∘res)(a's'). Restrict s' to inertia downstairs via rI then ineIncl to obtain s, and apply ArtNorm again: d(σ)=alg(wt)(a s). This is exactly the existential conclusion of df_res. ExField (Run 5) selects extensions forcing a(s) into any prescribed neighborhood of 1 while retaining degree −1 σ; df_one derives d(σ)=1 by separation, then for all σ by shifting with frob powers. LocWD follows, with independent inputs GlobalArtinReciprocity, HeckeLAdicCharacterDeRham, DeRhamPotSemistable and chBasic/chCoef/embOrbit/artNorm/exField. Downstream Crys.alg→rank-one inputs→CoreAll→Row0b→recParameter→character windows→nonvanishing remains conditional on other independent arguments (Runs 1–4). No claim of complete reachability or closure.

## 7. Source inventory
All following Git blob SHAs returned by connector at original pin; no local rehash or Lean run. A=src/Development/AutomorphicArithmetic/ThetaCorrespondence/AlgebraicCharacters/; B=src/Development/AbelianVarietyTheory/Proofs/; D=src/Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/.
- A/EmbOrbit.lean f7b21c5d5a970b595c05d7b2226e9c2854b6622b: WDis, ChRes.
- A/WdAtModel.lean 4efff78a337541217cf4fe061e2710aa0f3a4fcb: wdAt_model, alpha_res, eig_res, chRes (entire file read).
- A/ContinuousRankOneRep.lean 028d93377a68710f3e21da03eff798ff7fd103af: df_res, df_one, locWD.
- src/Development/AutomorphicArithmetic/AutomorphicVarieties/GaloisLibrary/CrystallineBaseChange/PotRes.lean 6af88407285c10cc8531c80360a2bdcf2d11f8eb: ex_bridge line 8.
- B/InertiaEigenvalues/WeilGroupRestriction.lean c5877603ddcb45278a90fccfc370b7008e802978: normV_eq_pow_of_isPlaceOver 24, continuous_resG, actsAs_resG 76, resWeil 87, isSmooth_comp_resWeil 102.
- D/FiniteDimensionalLetter.lean 7e14f2d6438a10355be2cf8291c0c51e63e75221: letterKer, alpha 140, weilD 219; D/FiniteDimensionalWdSpace.lean dd7de531043d35481be4a07d58e9c956705662d7: WDSpace, wdMk.
- B/IwasawaDecomposition/WdParameterMonodromyZeroIffPotentiallyCrystallin.lean 6c68db6192193b8e5f5a94a31758fdddd2895555: isPst_resTo_iff 228.
- B/IwasawaDecomposition/IsSstResToOfIsPst.lean 09a6468b118a1fbb809b83e8be8389e0a317ad31: isSst_resTo_of_isPst 116 (distinct from IsPst restriction).
- B/SatakeParameters/IsPotentiallySemistableCoefficientFieldEnlarge.lean b1b70f827f4f946cfdc2faf70666cbc338c86900: isPst_enlarge 86.
- B/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean ffdce791714cb11064760245f465f9ba78449bbc: wdPst_enlarge 330.
Current head: WdAtModel removed as separate file, migrated to A/ContinuousRankOneRep.lean blob fb0bdf5416986c8a291ace6ba2fadc618722623a, wdAt_model 801, alpha_res 819, eig_res 837, chRes 887–957. Text comparison of old nonblank trimmed lines excluding import/open/section/end/set_option found 125/126 present somewhere in new file; missing ex_bridge call replaced by explicit inline hBridge (890–913). This is not ordered semantic equivalence or a full helper migration check. Current A/EmbOrbit.lean blob ab7211e5b4527fe7478c7134ce2c524359988de9, ChRes line 80.

## 8. Reproducible finite regressions (executed V8)
Actual result: {"degree":24336,"wrongDegree":20592,"frobenius":52700,"wrongFrobenius":19800,"conjugacy":113828,"rankOne":76175,"negative":2}. These test degree scaling, finite-field Frobenius inverse/transport, matrix similarity characteristic-polynomial invariance, and cancellation of unit characters in finite cyclic groups; they are finite algebra models, not tests of infinite period rings or proofs of the original theorems. wrongDegree and wrongFrobenius count failures of omitted residue-degree scaling. The matrix test includes arbitrary matrices and invertible upper-triangular conjugators; rank-one finite cancellation is an elementary group law. Run as JavaScript:
~~~js
function regression(){
 const assert=(b,m)=>{if(!b)throw Error(m)};
 const mod=(a,p)=>((a%p)+p)%p;
 let degree=0,wrongDegree=0,frobenius=0,wrongFrobenius=0,conjugacy=0,rankOne=0,negative=0;
 for(let d=1;d<=12;d++)for(let f=1;f<=12;f++)for(let a=0;a<=12;a++)for(let b=0;b<=12;b++){
   const n=a-b, down=f*a-f*b;
   assert(d*down===(d*f)*n,"signed alpha");
   degree++;if(d*n!==(d*f)*n)wrongDegree++;
 }
 // Polynomial-basis finite fields GF(2^m), irreducible polynomials.
 for(const [m,poly] of [[2,7],[3,11],[4,19],[5,37],[6,67]]){
   const mul=(a,b)=>{let z=0;while(b){if(b&1)z^=a;b>>=1;a<<=1;if(a&(1<<m))a^=poly}return z};
   const F=(x,n)=>{for(let i=0;i<mod(n,m);i++)x=mul(x,x);return x};
   for(let x=0;x<(1<<m);x++){
     assert(F(x,m)===x,"Frobenius order");
     if(x) {let y=1;for(let i=0;i<(1<<m)-1;i++)y=mul(y,x);assert(y===1,"field multiplicative order")}
     for(let d=1;d<=5;d++)for(let f=1;f<=5;f++)for(let n=-8;n<=8;n++){
       let y=F(x,d*f*n);
       assert(F(x,(d*f)*n)===F(x,d*(f*n)),"Frobenius transport");
       assert(F(y,-d*f*n)===x,"signed Frobenius inverse");
       frobenius++;if(F(x,d*n)!==y)wrongFrobenius++;
     }
   }
 }
 // Exact matrix conjugacy over F_p: arbitrary A, invertible upper triangular S.
 for(const p of [3,5,7]){
   const mul=(A,B)=>[mod(A[0]*B[0]+A[1]*B[2],p),mod(A[0]*B[1]+A[1]*B[3],p),mod(A[2]*B[0]+A[3]*B[2],p),mod(A[2]*B[1]+A[3]*B[3],p)];
   const tr=A=>mod(A[0]+A[3],p),det=A=>mod(A[0]*A[3]-A[1]*A[2],p);
   const inv=x=>{for(let i=1;i<p;i++)if(mod(x*i,p)===1)return i;throw Error("not invertible")};
   for(let a=0;a<p;a++)for(let b=0;b<p;b++)for(let c=0;c<p;c++)for(let d=0;d<p;d++){
     const A=[a,b,c,d];
     for(let u=1;u<p;u++)for(let v=0;v<p;v++){
       const S=[u,v,0,1],Sinv=[inv(u),mod(-v*inv(u),p),0,1],B=mul(mul(S,A),Sinv);
       assert(tr(A)===tr(B)&&det(A)===det(B),"characteristic polynomial under conjugacy");conjugacy++;
     }
   }
 }
 // Cyclic targets, additive notation: common character/algebraic factor cancels.
 for(let m=2;m<=23;m++)for(let c=0;c<m;c++)for(let w=0;w<m;w++)for(let x=0;x<m;x++){
    const z=mod(c+w+x,m);assert(mod(z-c-w,m)===x,"correction cancellation");rankOne++;
 }
 assert(mod(1,3)!==mod(2,3),"unequal rank-one eigenvalues");negative++;
 assert(mod(0,5)===mod(5,5),"finite residue model not integer equality");negative++;
 return {degree,wrongDegree,frobenius,wrongFrobenius,conjugacy,rankOne,negative};
}
console.log(regression());
~~~

RESUME HERE: reconstruct the remaining native period-space base lemma Dpst_resTo and the actual source of LetterDim.finrank_wdSpace, following the imported period-ring definitions rather than assuming the cofinality explanation is a proof of the Lean implementation. Then examine the rank-one coefficient conjugation ChCoef via letter_lift, keeping its independent monodromy and coefficient-twist obligations; do not duplicate integration's ExtDual or Grok Chevalley work. HANDOFF TO integration, editor, audit, theta and Grok galois_rows. Project OPEN.

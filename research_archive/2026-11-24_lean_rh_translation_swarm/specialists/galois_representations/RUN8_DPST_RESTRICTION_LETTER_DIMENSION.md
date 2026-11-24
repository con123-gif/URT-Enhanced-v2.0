# Run 8 — Dpst restriction and the exact Weil–Deligne dimension

2026-11-24. RESULT: SOURCE-MATCHED reconstruction of Dpst_resTo and LetterDim.finrank_wdSpace, with their native algebraic proofs and explicit dependencies. No Lean replay, no full RH closure, no URT-specific speedup.

## Preflight
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research-state prefix, continuity prefix, research_archive/cathedral_arf_runner/RESEARCH_LOG.md and RESEARCH_PROTOCOL.md opening sections, previous Run 7, relevant specialist and Grok handoffs and other available lane RESUME notes. In particular theta Run 8 is about singular coefficient dilation, literature Run 7 about crystalline/de Rham lifting, kernel Run 8 about cached axiom discrepancies; distinct from this local dimension theorem. Latest Cathedral CI summary at read: run 45410580111, 14:27:38Z, PASS for physical orchestrator, not RH. No changes to baseline physics queue. External blueprint not used as source evidence; full blueprint and full reachable proof graph not read in this run. Canonical source pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream head observed 9477923066c923e6dbf7292da17019f8d08d0db8 on 2026-11-24. Both pins preserved.

## 1. Native period-space restriction (not a dimension assumption)
Let k=Q_l for prime l, Ω=Om l, K and K' finite subextensions of Ω/k with K⊂K', G_K their fixing groups. Let L be a coefficient field over k, V an L- and k-module with the scalar tower, and ρ an L-linear representation of G_K. P is the source LocPrime l, with its period data and laws. The actual source takes Bst(P)=Polynomial P.R.B; phiSt acts on coefficients by P.φB and sends X to lX, and monSt is negative derivative (LocalPrimeGaloisActionPeriodT lines 187,221,227). Its Galois action actSt is a monoid hom at line 208. Do not replace P by an arbitrary ring or assert its realization without checking the producers of LocPrime.

In EqOfPowEqOneOfNormSubLt, the underlying L-module M=V⊗_k Bst(P) does not depend on K. The diagonal action stRep(g)(v⊗b)=ρ(g)v⊗actSt(g)b. Dst is the intersection over all g of ker(stRep(g)-Id). The restriction resTo is composition with the subgroup inclusion G_K'→G_K, not a change of coefficient field or tensor ring. Hence
 x∈Dst(ρ|G_E) iff for every g∈G_K with g∈G_E, stRep(g)x=x, for K⊂E finite.
Dpst is the union of these spaces over E finite containing K. It is a submodule: addition uses the finite compositum supExt(E1,E2), whose fixing group is contained in both fixing groups; scalar multiplication preserves the same witness. No finite-dimensional hypothesis or potential semistability hypothesis is used for Dpst_resTo.
The native mem_Dpst (265) relaxes the witness E: it need not contain K, but the predicate quantifies over g∈G_K with g∈G_E. To turn such a witness into the defining one use supExt(K,E). Finite-dimensionality of the compositum is explicitly provided by supExt at 86, and the antitone inclusion GK_le is applied to each leg. This quantifier distinction explains the exact source proof (277):
 * For x∈Dpst(ρ|G_K'), choose its relaxed witness E. Downstairs choose supExt(K',E). Every g in its fixing group belongs to G_K' and G_E. The upstairs fixed-vector condition applies to the restricted group element, so x∈Dpst(ρ).
 * For x∈Dpst(ρ), choose its relaxed witness E. Use the same E upstairs: every g∈G_K' also lies in G_K, and both actions on M are identical. Thus x∈Dpst(ρ|G_K').
This proves equality of the two submodules, not equality of Dst before extension. It also gives a U-linear isomorphism on DpstUr for U=MaximalUnramifiedExtension l because both U-actions are induced by the same mulV on M; the source isPst_resTo_iff builds the inverse maps through toUr and the two inclusions. IsPst is defined by rank_U(DpstUr)=rank_k(V), so its truth is invariant without first assuming finite dimension.

## 2. The quotient whose dimension is being computed
For L now a finite subextension of Ω/k, V finite-dimensional over L with scalar tower, D=Dpst(P,ρ), U as above, m:U→End_L(D) is mulD, multiplication by U in the ambient period tensor. Fix ι:Ω≃+* C. The source WDSpace is Letter(m,C,τ), where C has L-algebra structure via ι and τ=ι|U:
 W = (C⊗_L D) / Σ_{c∈U} im(m(c)_C - τ(c)Id).
The sum is a supremum of submodules, not an intersection or an arbitrary projection. Write [x] for the class of 1⊗x. These classes span W; they satisfy [a x]=s(a)[x] and [m(c)x]=τ(c)[x], with s=ι|L. The finiteDimensional_wdSpace instance uses the U-basis of DpstUr (finite when IsPst holds) and the two scalar rules to prove W finite-dimensional over C. It does not suppose a finite L-basis of D.

For arbitrary fields L,U,F and m:U→End_L(D), let H(s,τ)=letterHom(m,s,τ) consist of additive f:D→F satisfying
 f(a x)=s(a)f(x) for all a∈L, x∈D;
 f(m(c)x)=τ(c)f(x) for all c∈U, x∈D.
The theorem finrank_dual_letter (27) identifies W* with H(s,τ): precompose a linear functional with [x]. Injectivity follows from the spanning classes. Conversely an f with the two laws extends L-linearly to the scalar tensor, annihilates each relation image, hence factors through the quotient. The annihilation argument checks each c on pure tensors, which span the tensor. This is an actual isomorphism, not just an upper bound.

## 3. Sum of the embedding dimensions
For the dimension proof work temporarily in Ω rather than C. Define d(s)=dim_Ω H(s,incl_U) for every k-embedding s:L→Ω. Here IsPst implies D has finite U-dimension equal to dim_k V. The source sum_finrank_letterHom (135) considers W0=Hom_U(D,Ω). Because the L-action commutes with m and the k-actions agree (the scalar tower), L acts on W0 by precomposition: r(a)f(x)=f(ax). It is a ring hom because L is commutative. The common eigenspace for s is precisely H(s,incl_U), as checked by the explicit linear equivalence in the proof.

The preceding native sum_finrank_eigen (87) proves the spectral decomposition for finite separable L/k and algebraically closed F: choose primitive α of L/k. For any a=q(α), r(a)=q(r(α)); hence the joint s-eigenspace equals the s(α)-eigenspace of r(α). Its minimal annihilator divides the mapped separable minpoly of α, so r(α) is semisimple. Distinct s give distinct roots s(α); every nonzero eigenvector's eigenvalue is a root of the minpoly and thus belongs to an embedding. Therefore the eigenspaces form an internal direct sum (zero spaces are allowed). Taking dimension yields
 Σ_s d(s)=dim_Ω Hom_U(D,Ω)=dim_U D.
All hypotheses matter: finite separability, algebraic closure, the compatible base k action and finite dimension over U. No claim of equal individual d(s) follows from this sum alone.

## 4. Why the summands really are equal
There are two exact invariances:
 (i) finrank_letterHom_comp (50) sends f↦g∘f for a field equivalence g:F≃F'; inverse uses g^{-1}. It is semilinear, so dimensions agree when s and τ are transported by g. In particular, if g∈G_k fixes U, then d(g∘s)=d(s).
 (ii) finrank_letterHom_frob (64) uses an invertible L-linear φ on D satisfying φm(c)=m(σ(c))φ, with σ surjective on U. For τ'=τ∘σ, f↦f∘φ is a linear equivalence H(s,τ)→H(s,τ'); inverse precomposes φ^{-1} and uses surjectivity of σ. Here φ=phiD, σ=frobUr; phiD_mulD supplies the semilinearity. phiD is injective in the ambient period tensor and is bijective on D when DpstUr is finite-dimensional: images of a U-basis under an injective semilinear map with bijective σ are independent, have full cardinality and hence span (phiD_bijective at 394). The earlier native phiB_algebraMap establishes the relevant coefficient Frobenius identity on prime-to-l roots of unity, using the residual norm separation lemma and P's Frobenius-on-K0 laws. This is where P's field-specific laws enter. If g extends frobUr on U, combine (ii) with (i) for that g to obtain d(g∘s)=d(s). In particular, we do not claim that every automorphism of Ω fixes U.

The const_of_invariant theorem (180) turns these two types into transitivity:
 define S={g∈G_k | for every s, d(g∘s)=d(s)}. Identity, composition and inverse preserve the condition. The normal closure N of L/k is finite, and its fixing group is contained in S, since it fixes every s(L). Thus S is open and closed. Any x fixed by S is fixed by the subgroup fixing U (by (i)), hence lies in U by the infinite Galois correspondence. Choose an extension g of frobUr to Ω via FrobLaws.exists_ext (ResEqIff 190). By (ii), g∈S, so x is fixed by frobUr. The invoked MemLoc.frob_laws fixed-field conclusion forces x∈k. Conversely k is fixed by all G_k. Thus Ω^S=k; closedness of S and infinite Galois correspondence give S=G_k. Finally G_k acts transitively on the k-embeddings of finite L into Ω: extend the isomorphism between their images to Ω (IsAlgClosed.surjective_restrictDomain_of_isAlgebraic, then bijectivity). Therefore all d(s) equal d(inclusion).
This uses fixed-field information, not merely cyclic finite-field arithmetic. The source proof of MemLoc.frob_laws and the construction of LocPrime are independent named dependencies not fully reconstructed here. In particular, no generic assertion of surjectivity of Frobenius on an arbitrary ring is sufficient.

## 5. Final dimension cancellation, with the finite coefficient factor
Transport H from Ω to C by ι using (i), then apply the dual identification and finite-dimensional dual equality. We obtain dim_C W=d(inclusion). Since the number of k-embeddings of L into Ω is [L:k], and IsPst yields dim_U D=dim_k V:
 [L:k] d(inclusion) = Σ_s d(s) = dim_U D = dim_k V = [L:k] dim_L V.
The degree [L:k]>0, so cancel in the natural numbers. This is exactly LetterDim.finrank_wdSpace (228–260). No choice of special embedding, no rank-one assumption, no hidden averaging approximation. The hypothesis IsPst cannot be dropped: otherwise D may have smaller rank. The source WDSpace is specifically the quotient above, not the full period tensor.

## 6. Link to the original RH route
Run 7's eig_res now has both of its previously unresolved local algebra ingredients explained: restriction preserves Dpst and IsPst; the induced quotient map from the restricted WDSpace to the old WDSpace is onto and both have dimension dim_L V, hence an isomorphism. Frobenius normalization and matching actions give intertwining. Consequently the equality of characteristic polynomials used in rank-one ChRes is justified under the original hypotheses. The rank-one argument separately uses zero nilpotent monodromy and smoothness, plus admissible finite-model independence. This feeds df_res, df_one, LocWD, Crys.alg, CoreAll and Row0b; the recParameter, character-window and nonvanishing obligations remain separately required. We have not proved that the entire source-import chain is part of the elaborated Main proof graph.

## 7. Source inventory and upstream comparison
All paths below relative to src/Development/AbelianVarietyTheory/. Connector returned these pinned Git blob IDs; not locally rehashed. Old→new anchors checked at the two specified commits; "identical" means literal declaration text through the first blank line (not semantic equivalence of transitive dependencies).
- Definitions/AutomorphicMembership/EqOfPowEqOneOfNormSubLt.lean: 21a02daf0f36829d50c3c4243c10e36a9bd311d9 → dcbcc4dbbf8d4018f934fc09b2da07716608f63f. mem_Dpst 265→310 (8 lines), Dpst_resTo 277→322 (9), IsPst 374→415 (1), phiD_mulD 345→388 (2), phiD_bijective 394→435 (25), identical. Also supExt 86, stRep/Dst/resTo/Dpst 213–264, DpstUr 358, isPst_iff 378.
- Proofs/IwasawaDecomposition/FinrankLetterHomComp.lean: 95525cc673771796f6540b5138344b03afbdffae → 80200d69dcdb2c626391f819ab9129977c296731. finrank_letterHom_frob 64→116 (22 lines), sum_finrank_eigen 87→139 (47), sum_finrank_letterHom 135→187 (38), const_of_invariant 180→232 (45), finrank_wdSpace 228→280 (33): identical. finrank_dual_letter 27→75 adds explicit f argument to map_add rewrite. finrank_letterHom_comp 50→98 replaces inline rank rewrite by an explicit rank equality, with g.map_mul proof of semilinearity. Statements retained; no elaborated equivalence claim.
- Definitions/AutomorphicMembership/FiniteDimensionalLetter.lean: 7e14f2d6438a10355be2cf8291c0c51e63e75221 → eb4c586b2760f181337e3d1c2df3159a4010cf3f. letterKer 19→66 (2 lines), Letter 22→69 (1), identical; finiteDimensional_letter 73→115 body checked separately, blank line inserted in the inspected body.
- Definitions/AutomorphicMembership/FiniteDimensionalWdSpace.lean: dd7de531043d35481be4a07d58e9c956705662d7 → c58b7210b5efa3e01e6d68398a9cd2ddbe83a753. WDSpace 23→67 (2 lines), finiteDimensional_wdSpace 59→100 (6), identical.
- Proofs/IwasawaDecomposition/WdParameterMonodromyZeroIffPotentiallyCrystallin.lean: 6c68db6192193b8e5f5a94a31758fdddd2895555 → 5e9ec0711498b5700463c5f48fb72c454bb63539. isPst_resTo_iff 228→424 (9 lines), identical.
- Proofs/IwasawaDecomposition/ResEqIff.lean: 6210cc354991c3f2ba94bbc1ee42d8c05e019ef7 → e70f0e7abffc8c9f4a422d5331f01c7452dc05a8. exists_ext 190→235 (5 lines), identical.
- Definitions/AutomorphicMembership/LocalPrimeGaloisActionPeriodT.lean: a8ea7e2814d271ced2abef4cf4d3edfb57c61ca6, original Bst 187, actSt 208, phiSt 221, monSt 227 (pinned anchors checked; not compared at head).
- Definitions/AutomorphicMembership/MonodromyZeroOfWeilDeligneRepClassIff.lean: 4c424b486a66ef4a8581a5c16af5a91572d721be, inspected import header only.
- ChRes consumer: src/Development/AutomorphicArithmetic/ThetaCorrespondence/AlgebraicCharacters/WdAtModel.lean at pin 4efff78a337541217cf4fe061e2710aa0f3a4fcb (Run 7); migrated to ContinuousRankOneRep.lean at head fb0bdf5416986c8a291ace6ba2fadc618722623a, eig_res 837.

## 8. Executed finite regressions (V8)
Output: {"restriction":163840,"witnessForward":249556,"witnessBack":134632,"dualChecks":599186,"dimension":127,"nonuniform":98,"frobIntertwine":333956,"frobInvert":83489}.
The first model acts on binary vectors by cyclic shifts, with permitted finite subgroup intersections corresponding to divisors of 12, and checks both directed-witness implications. This is a finite analogy, not a computation in p-adic periods.
The second uses F4 with L=U=F4, k=F2, assigning each coordinate one of the two embeddings for its L-action; enumerate all U-linear functionals. The sum of dimensions is always n; individual dimensions are unequal in 98 of 127 assignments. These are counterexamples to the inference that the dimension sum alone implies constant summands, NOT counterexamples to the native theorem with Frobenius and Galois hypotheses. For balanced assignments construct an involution by swapping the embedding types and squaring coordinates, and check both L-linearity and U-semilinearity plus invertibility. This explains exactly what the missing symmetry supplies. Counts overlap; frobIntertwine counts pairs (x,a) with both conditions, not two independent proof validations. Run this exact code with Node:
~~~js
function regression(){
 const assert=(p,m)=>{if(!p)throw Error(m)};
 const divisors=[1,2,3,4,6,12];
 const gcd=(a,b)=>b?gcd(b,a%b):a, lcm=(a,b)=>a*b/gcd(a,b);
 const fix=(v,d)=>(((v<<d)|(v>>(12-d)))&4095)===v;
 let restriction=0,witnessForward=0,witnessBack=0,dualChecks=0,dimension=0,nonuniform=0,frobIntertwine=0,frobInvert=0;
 for(const m of divisors)for(const b of divisors.filter(d=>m%d===0))for(const bp of divisors.filter(d=>d%b===0&&m%d===0)){
  const ds=divisors.filter(d=>m%d===0);
  for(let v=0;v<4096;v++){
   const lower=ds.some(d=>fix(v,lcm(b,d))),upper=ds.some(d=>fix(v,lcm(bp,d)));
   assert(lower===upper,"directed fixed spaces");restriction++;
   for(const d of ds){
     if(fix(v,lcm(bp,d))){assert(fix(v,lcm(b,lcm(bp,d))),"witness to base");witnessForward++}
     if(fix(v,lcm(b,d))){assert(fix(v,lcm(bp,d)),"witness to extension");witnessBack++}
   }
  }
 }
 const mul=(a,b)=>{let z=0;while(b){if(b&1)z^=a;b>>=1;a<<=1;if(a&4)a^=7}return z};
 const sq=x=>mul(x,x), emb=(a,j)=>j?sq(a):a;
 const vec=(v,n)=>Array.from({length:n},(_,i)=>(v>>(2*i))&3);
 const eq=(a,b)=>a.every((x,i)=>x===b[i]);
 const act=(x,a,mask)=>x.map((u,i)=>mul(emb(a,(mask>>i)&1),u));
 const scalar=(x,c)=>x.map(u=>mul(c,u));
 for(let n=0;n<=6;n++)for(let mask=0;mask<(1<<n);mask++){
  const sets=[[],[]];for(let i=0;i<n;i++)sets[(mask>>i)&1].push(i);
  let counts=[0,0];const total=4**n;
  for(let k=0;k<total;k++){
   const f=vec(k,n);
   for(let s=0;s<2;s++){
    const good=[0,1,2,3].every(a=>f.every((u,i)=>mul(u,emb(a,(mask>>i)&1))===mul(emb(a,s),u)));
    const predicted=f.every((u,i)=>!u||((mask>>i)&1)===s);
    assert(good===predicted,"letterHom weight space");dualChecks++;
    if(good)counts[s]++;
   }
  }
  const dims=counts.map(c=>Math.log(c)/Math.log(4));
  assert(dims.every(Number.isInteger)&&dims[0]+dims[1]===n,"sum dimensions");
  dimension++;
  if(sets[0].length!==sets[1].length){assert(dims[0]!==dims[1],"nonuniform negative");nonuniform++;continue;}
  assert(dims[0]===dims[1]&&dims[0]===n/2,"balanced dimension");
  const perm=[];for(let i=0;i<sets[0].length;i++){perm[sets[0][i]]=sets[1][i];perm[sets[1][i]]=sets[0][i]}
  const phi=x=>x.map((_,i)=>sq(x[perm[i]]));
  for(let k=0;k<total;k++){
   const x=vec(k,n);
   assert(eq(phi(phi(x)),x),"bijective frobenius");frobInvert++;
   for(let a=0;a<4;a++){
    assert(eq(phi(act(x,a,mask)),act(phi(x),a,mask)),"L linear");
    assert(eq(phi(scalar(x,a)),scalar(phi(x),sq(a))),"U semilinear");
    frobIntertwine++;
   }
  }
 }
 return {restriction,witnessForward,witnessBack,dualChecks,dimension,nonuniform,frobIntertwine,frobInvert};
}
console.log(regression());
~~~

RESUME HERE: reconstruct ChCoef, starting with the actual letter_lift producer in the pinned AlgebraicCharacters imports, including semilinear coefficient conjugation, monodromy, and the exact relation of coefficient embeddings to wdAt. Retain independent MemLoc.frob_laws and LocPrime realization obligations in the ledger; do not conflate them with the completed dimension cancellation. Follow the source to df_add and df_gal. No duplicate of Runs 1–8 or theta/geometry lanes. HANDOFF TO integration, editor, audit, theta and Grok galois_rows. Project OPEN.

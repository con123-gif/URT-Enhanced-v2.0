# RUN12 — Finite group identification at prescribed places
2026-11-24. SOURCE-MATCHED human derivation; local finite regression, NOT kernel replay or full RH reconstruction. Status DONE for the conditional identification argument, OPEN for the original arithmetic suppliers and Main reachability.

## Preflight
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, continuity, research state/log excerpts and protocol, CI summary #386 (physics CI, not RH validation), RUN11 and current peer handoffs from integration, dependency, structure, math, audit and all nine other specialist lanes. External blueprint not reread. RUN11 translated PsiPPTie, not the actual group identification producer; this run follows its exact import. No physics queue changes. The current kernel lane asks for role-labelled native edge evidence, which is still pending for these declarations.

## Source theorem and quantifiers
Pinned upstream leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005.
GlobalTheory.T.exists_finiteGroupIdentification_fixedPlaces delegates to GlobalTheory.Mem.R3.exists_grpIdent.
For EVERY stage X, pre-stage px : PreX X.B.toPre, column input I : Col2.ColIn X.B px, set U : Set I.ι and level L : LevCh X.toD7 (TupU I U), assume I.Ok, GrpAt X I and LevOf X I U L. Preserve all the implicit dependent types and instances.
Then there EXIST eG : Gc X.B px ≃* G0 L.Pg X.toD7.R.r, cG : G0 L.Pg X.toD7.R.r ≃* G0g X.toD7.nd, plg : (Σ k : Fin 2, X.toD7.nd.PlG k) ≃ L.Pg, and iso : ∀ kv, ZMod(X.toD7.host.g kv.1) ≃+* kP (plg kv).1, satisfying:
(i) IsPlacewiseIdentity X eG;
(ii) ∀ kv, underlying place of plg kv equals X.toD7.naut.plGw kv.1 kv.2;
(iii) ∀ kv, L.C.P.Div kv.1 (plg kv).1;
(iv) ∀ g kv, eG g (plg kv) = UG.bc (iso kv) ((eG.trans cG) g kv).
All four conclusions refer to the SAME chosen witnesses. In particular, iso is a family of ring equivalences, not merely an equality of cardinalities or arbitrary set bijections.

## Human proof, source matched
1. hG.pl provides plg0 and its place/division equalities. hL.Pg identifies the set of places L.Pg with (X.B.primes px).vGs. Let j be the induced subtype bijection from L.Pg to that latter set. For each tuple of invertible matrices g, define eG(g)(P)=g(j(P)). Its inverse is precomposition by j^-1. Both round trips are identity, and pointwise multiplication is preserved. This is just reindexing; it is not a choice of an arbitrary group isomorphism. The placewise identity follows because j preserves the underlying place.
2. Compose plg0 with j^-1 to obtain plg. The place equality is inherited unchanged from hplg0. By hI.pibar and the second component of hplg0, the underlying place belongs to the selected family vG(k). By hL.C the required L.C.P.Div holds. Thus the two selected-place claims are independent of the later choice of ring isomorphism.
3. From (base_fields_primes_ok X.B px).2.1 extract hPr. For each kv, write p = host.g(kv.1), R = kP(plg kv). Source hPr.g_prime gives p prime; hPr.vG_norm together with the membership in step 2 gives the absolute norm of that place equal to p. residueField_equiv_zmod uses the definition of absolute norm and cardQuot to obtain Nat.card R=p, then finite R because p ≠ 0. Equip R with Fintype and obtain Fintype.card R=p. charP_of_card_eq_prime gives characteristic p. ZMod.ringEquiv therefore gives R ≃+* ZMod p (after reversing the orientation of the standard equivalence). Equivalently, the unital map Z/pZ → R is injective because p is prime and the map is nonzero, and is surjective because both finite cardinalities are p. Reverse the theorem's returned equivalence to obtain iso_kv: Z/pZ ≃+* R. The proof uses Classical.choice on each nonempty type of equivalences. Equal finite cardinalities alone for composite p would not justify this argument: F4 and Z/4Z have different characteristics.
4. A ring equivalence f induces a matrix ring equivalence by entrywise application: f(AB)_ij=Σ_l f(A_il) f(B_lj). It sends the identity to the identity and inverse matrices to inverse matrices, hence restricts to a multiplicative equivalence of GL groups. Lean implements this as Units.mapEquiv (e.mapMatrix).toMulEquiv. Define cG on the product of GL groups by reindexing along plg and then applying (iso kv)^-1 entrywise on each factor. Precisely, cG(h)(kv)=GL(iso_kv^-1)(h(plg kv)). This is the composition of Equiv.piCongrLeft (inverted) and Equiv.piCongrRight in the source. The inverse applies iso_kv and reindexes by plg^-1. Pointwise multiplication preservation follows from the GL equivalence on each factor.
5. For all g and kv, apply iso_kv entrywise to cG(eG(g))(kv). Since iso_kv ∘ iso_kv^-1 = identity, this gives eG(g)(plg kv). This is the final UG.bc equation, with exactly the orientation required by RUN11's PsiPPTie producer. No choice of ring equivalence changes this cancellation. This closes the four conditional conclusions without weakening the initial assumptions.

## Direct source-level dependency identification
GlobalTheory.T.exists_finite_group_goodSet_levels_characters -> GlobalTheory.Mem.R3.Grp.grp_levels_exist -> GlobalTheory.T.exists_finiteGroupIdentification_fixedPlaces -> GlobalTheory.Mem.R3.exists_grpIdent -> {GlobalTheory.Mem.Col2.base_fields_primes_ok, Formalism.L2.Col.residueField_equiv_zmod, Formalism.L2.Col.generalLinearEquivOfRingEquiv}.
These are explicit references in the bodies. The first four are theorem/statement wrappers, not four independent arithmetic proofs. The original supplier of hG.pl (GrpAt X I) and hL.Pg / hL.C (LevOf X I U L), and the caller of the outermost wrapper supplying Keep/Pins, remain untraced. FieldValuesMemFixedField defines Dat.pins and RowsAre.Z : ReadL; that is a consumer structure, NOT a constructor. No claim of Main-root reachability or proof-term completeness. Do not merge with the other R3 records merely because names resemble one another.

## Provenance and executable source checks
P = src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/
D = src/Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/
F = src/Formalism/LocalToGlobal/Columns/
Seven pinned Git blob SHAs and 41 literal anchors were actually checked in connector V8, 48/48 assertions passed. Reproduce using git rev-parse PIN:path for each hash, and git show PIN:path for each anchor (substring, not a Lean dependency extractor).
- P/ExistsFiniteGroupIdentificationFixedPlaces.lean 99b49bd32528a966c0548a287567e119cc66e4c7: theorem exists_grpIdent; I.Ok → GrpAt X I → LevOf X I U L; hG.pl; (base_fields_primes_ok X.B px).2.1; rw [hL.Pg]; left_inv := fun g => rfl; right_inv := fun h => rfl; map_mul' := fun _ _ => rfl; plg0.trans; (hI.pibar kv.1 _).2 (hplg0 kv).2; hPr.g_prime; hPr.vG_norm; residueField_equiv_zmod; Classical.choice (hiso kv); Equiv.piCongrLeft; Equiv.piCongrRight; generalLinearEquivOfRingEquiv; rw [hL.C]; simp [Formalism.UG.bc, Formalism.L2.Col.generalLinearEquivOfRingEquiv].
- P/ExistsFiniteGroupIdentificationFixedPlacesStatement.lean 8ae7985a3d418806f924cc3d6d91bbe45c713b7c: theorem _root_.GlobalTheory.T.exists_finiteGroupIdentification_fixedPlaces; exact @GlobalTheory.Mem.R3.exists_grpIdent.
- P/BaseFieldsPrimesOk.lean 352c685ba0759677354be0a2628666a2fb268dcb: theorem base_fields_primes_ok; (B.primes X).Ok; (GlobalTheory.BasePrimes.primes_ok B X).1.
- F/ExistsUnitOfPowEqOne.lean d02eed11ebd2802292bfcade3281e9c52d9bf87f: theorem residueField_equiv_zmod; [Fact g.Prime]; Ideal.absNorm w.asIdeal = g; Ideal.absNorm_apply; Nat.finite_of_card_ne_zero; charP_of_card_eq_prime hc'; (ZMod.ringEquiv _ hc').symm; def generalLinearEquivOfRingEquiv; Units.mapEquiv (e.mapMatrix.
- P/ExistsFiniteGroupGoodSetLevelsCharacters.lean f6e42ebeed75fceae0c6f0365051c3342cfa9d24: theorem grp_levels_exist; GlobalTheory.T.exists_finiteGroupIdentification_fixedPlaces.
- P/ExistsFiniteGroupGoodSetLevelsCharactersStatement.lean fba3fcc5741a81a7d273415e14ae213be81c1aa6: theorem _root_.GlobalTheory.T.exists_finite_group_goodSet_levels_characters; exact @GlobalTheory.Mem.R3.Grp.grp_levels_exist.
- D/FieldValuesMemFixedField.lean e1d3bb5bbe07b608135f2176a4b123b5e46348e7: structure Dat; pins : Pins; structure RowsAre; Z : ReadL.

Upstream main observed at 9282d3a102c4aff0e6026746db2a8990f5d9cddd versus RUN11 307cef33f046955ee79dba47e0d828d06496d75f. Both original fixed-place implementation and statement paths return HTTP 404 at observed main. No assertion of deletion versus relocation, equivalence or proof failure. Keep pinned source.

## Reproducible exact finite regression
Executed in connector V8: units=534, pairs=232740, products=1602, neg=5. Models GL(2,F_p) for p=2,3,5 with a transported relabelling of field elements and a three-place permutation. These are explanatory models; the operation on the transported field is defined through the inverse labelling, so the pair test is an implementation consistency check, not an independent verification of ring equivalence existence in the native number fields. Product tests check direction of reindexing. No native automorphic input, no Lean execution, no changed hypotheses or URT performance claim. Run in Node:
```js
function regress(){
 const ck=(b,m)=>{if(!b)throw Error(m)};
 let units=0,pairs=0,products=0,neg=0;
 for(const q of [2,3,5]){
  const I=Array.from({length:q},(_,i)=>i),mod=x=>(x%q+q)%q;
  const enc=x=>mod(x+1),dec=x=>mod(x-1);
  const mat=(a,b,c,d)=>[a,b,c,d], mul=(a,b)=>mat(mod(a[0]*b[0]+a[1]*b[2]),mod(a[0]*b[1]+a[1]*b[3]),mod(a[2]*b[0]+a[3]*b[2]),mod(a[2]*b[1]+a[3]*b[3]));
  const eq=(a,b)=>a.every((v,i)=>v===b[i]);
  const A=[];for(const a of I)for(const b of I)for(const c of I)for(const d of I)if(mod(a*d-b*c)!==0)A.push(mat(a,b,c,d));
  ck(A.length===(q*q-1)*(q*q-q),"GL2 count");
  for(const a of A){ck(eq(a,a.map(enc).map(dec)),"round trip");units++}
  for(const a of A)for(const b of A){
   const transported=mul(a.map(enc).map(dec),b.map(enc).map(dec)).map(enc);
   ck(eq(transported,mul(a,b).map(enc)),"transport");pairs++;
  }
  const pl=[2,0,1], inv=[1,2,0];
  for(const a of A)for(let j=0;j<3;j++){
    const g=[a,A[(j+1)%A.length],A[(j+2)%A.length]];
    const c=pl.map(i=>g[i].map(dec));
    const back=inv.map(k=>c[k].map(enc));
    ck(back.every((v,i)=>eq(v,g[i])),"reindex");
    const h=g.map((v,i)=>A[(i+j)%A.length]);
    const d=pl.map(i=>h[i].map(dec));
    const cprod=pl.map(i=>mul(g[i].map(dec),h[i].map(dec)));
    ck(cprod.every((v,k)=>eq(v,mul(c[k],d[k]))),"product");products++;
  }
  ck(!eq([0,0,0,0],[0,0,0,0].map(enc)),"untransported field labels");neg++;
 }
 ck(new Set([0,0,1]).size!==3,"not a bijection");neg++;
 ck((1+1)%4!==0,"composite order guard");neg++;
 return {units,pairs,products,neg}
}
console.log(regress())
```

RESUME HERE: locate the actual pinned caller of GlobalTheory.T.exists_finite_group_goodSet_levels_characters (using reverse import/declaration index; direct wrapper confirmed) and track its witnesses into Keep/Pins. Request authenticated role-labelled edges for that wrapper, grp_levels_exist, exists_finiteGroupIdentification_fixedPlaces, exists_grpIdent and residueField_equiv_zmod, alongside the outstanding RUN11 names. Preserve hG.pl, hL.Pg, hL.C, hI.pibar, base-prime norm/primality and initial ReadL/MjHTie/IdxDefs suppliers as separate open obligations. Do not redo this reindexing or RUN11 character transport. HANDOFF TO dependencies, kernel, integration, editor, Galois, theta, audit. Project OPEN.

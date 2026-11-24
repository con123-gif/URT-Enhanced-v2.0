# RUN8 — Five Good fields, differential trivialization and exact filtration comparison
2026-11-24. SOURCE-MATCHED / PARTIAL (geometric child obligations open). No new premises added to source statement. Not independent Lean kernel checking. No URT speed claim. Pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005. Latest upstream checked 9477923066c923e6dbf7292da17019f8d08d0db8 (2026-11-24 14:18:56 UTC). Preflight read AGENTS, state, continuity, queue and protocol, swarm/expansion/handoff, peer lane handoffs and RUN7. Latest physics CI PASS at 14:27:38, irrelevant to RH validity. No physical queue changes. Prior RUN7 handled RhoBC, not Good. Geometry lane RUN7 handles valuation and quasi-finite suppliers, not this argument.

## The five fields — preserve all
Let R be a commutative Noetherian ring, A an abelian scheme/group object over Spec R with smooth relative dimension g. The theorem GlobalTheory.LiftSys.good_of_isAbelianScheme takes HC:CrystallineSmoothLift and HH:AbelianHodgeDeRham. These are proposition definitions, not proofs of themselves; their actual global suppliers remain open in this lane. Good, in Definitions/Divisors/SurjectiveOfIsPullbackSqZero L188–198, means:
1. const: every compatible affine family of functions (d0=0) is induced by some scalar r in R.
2. par: for every affine U, evaluation of global one-forms is a base-change map to local Kahler differentials.
3. proj: GlobForm is projective over R.
4. surj: every global one-form is the underlying global form of a crystalline Form via cmpForm.
5. inj: Form.cl(f)=0 iff cmpForm(f)=0. This is a kernel equality, NOT injectivity of Form.cl or cmpForm separately.

Proofs/DivisorProofs/GoodForSquareZeroLiftClassificationOfAbelianSche L21–53:
const and par are supplied by internal GlobalTheory.T wrappers; proj is the explicit HH conjunct. HC gives bijectivity of cmp1 for smooth separated quasi-compact structure morphism (properness supplies appropriate instances). HH gives all global forms closed and clForm injective. The remaining two fields follow from the following reusable algebra.

## Exact filtered comparison (local proof, no additional hypotheses)
Write E=FirstDeRham, D=HH1, O=FirstCohomStructureSheaf, O'=HO1; C=cmp1:E→D, Q=toH1O, Q'=toHO1, S=cmpO:O→O'. Let V=Form, W=ClosedForm, a=Form.cl, b=cmpForm, j=clForm. All maps are R-linear. The identities are Q'C=SQ, Ca=jb, im a=ker Q, im j=ker Q'. C bijective, S injective, j injective. HH identifies W with GlobForm (not before closedness).
For w in W, choose c=C^{-1}(j(w)). Since Q'j=0, SQ(c)=0 and hence Q(c)=0 by S injective. Exactness gives f with a(f)=c. Then j(b(f))=C(a(f))=j(w), hence b(f)=w by j injective. This proves surj after forgetting the closedness subtype. Separately Ca=jb and C,j injective give a(f)=0 iff b(f)=0. This proves inj. This reasoning does NOT assert that the crystalline form module itself is equal to global forms; it proves only the stated surjectivity and equality of kernels. Nor is surj of Q needed for this argument. The full HH proposition still has other independent obligations.
Source: L31–46 and L47–53 in Good body, comparison definitions L208–216,249–270 of ComparisonMemCechHodgeFiltration; hodgeFiltration_eq_range used L42 (its deeper proof retained); S supplied by StructureSheafComparisonInjective L17–30. That proof represents a class by a cocycle f, uses comparison-zero to obtain affine coboundary g, glues a section G on each thickening T using compatible pair restrictions, then checks f is the coboundary of G on all thickening morphisms. Child obligations are exact imported statements exists_glue_functions_spec_from_pairs, cocycle_local_sections_restrict_compatibly, cochainValueOnThickeningHom_eq_sub_of_glued and H1 quotient facts. This does not replace these by axioms.

## Par: a duality proof, then an actual geometric supplier
AbelianSchemeDifferentialsFromGlobalForms L12–34: for R→B and f:M→N R-linear, M finite projective over R and N finite projective over B, suppose every R-linear l:M→B extends uniquely to a B-linear δ:N→B with δf=l. Extend f to F:B⊗_R M→N. Tensor universal property identifies Hom_R(M,B) with Hom_B(B⊗M,B); existence and uniqueness mean F* is bijective. Dualize once more and use evaluation isomorphisms for the two finite projective B-modules: ev_N F=F** ev_(B⊗M). Therefore F bijective and f exhibits base change. Do not delete finite projectivity from this particular dual-reflexivity argument. In L44–49 take B=Sec(A,U), M=GlobForm, N=Ω_{B/R}; smoothness of the affine section algebra (L36–42) supplies local differential-module properties; HH supplies M finite projective. The needed dual extension is not merely attributed to invariant differentials: it is constructed by ParPt.exists_unique_of_globForm (wrapper ExistsUniqueVectorFieldOfGlobalOneFormValuesStatement L11–12).

ParPt actual body L105–147: base-change A to B, retaining abelian and relative-dimension conditions via group pullback and smooth base change. For a B-linear functional δ on Ω_{B/R}, the dual-number ring map b↦b+εδ(db) gives a dual-number point ptOf(δ) over B reducing to the constant point c=ptOf(0) (L49–83). Conversely, dual-number points above the chart with the required reduction give such derivations via exists_derHom. Translation y↦yc⁻¹ sends points reducing to c to tangent points at identity, preserving crystalline form evaluation (t6, L28). Tangent evaluation on pulled crystalline forms equals δ evaluated on the original global form restricted to U (L96–99, t4 L24).
Uniqueness: two candidate δ's extending l give two translated tangent points with identical pulled form values. The functional extension t5 is unique (L123–125), because each tangent functional kills ker cmpForm. Injectivity LieInj.tangent_eq_of_tanVal_eq gives equal translated points (L126–127). Cancel right c⁻¹, then eq_of_affPt_eq identifies δ (L128–130).
Existence: t5 gives a functional ψ on crystalline forms of A_B killing ker cmpForm and extending l on pullbacks. LieDual.exists_tangent_of_functional realizes ψ as a tangent point v (L131–132). Translate back vc, recover δ from its reduction (L133–138). Every global w comes from a crystalline f by LieDual.glob_surjective; tangent evaluation compatibility implies δ(w|U)=l(w) (L139–146). Hence uniqueness and existence. Preserve the exact source dependencies t4 tangent_value_pullback_crystalline_form_dual_numbers, t5 existsUnique_forms_functional_abelian_base_change, t6 translate_dual_number_point_inverse_constant_tangent, TanVanish.tanVal_eq_zero_of_cmpForm_eq_zero, LieInj.tangent_eq_of_tanVal_eq, LieDual.exists_tangent_of_functional, LieDual.glob_surjective, exists_derHom and snd_val_derHom. These child bodies still need independent translation; they are not postulated by this run.
The global-functions supplier is also internal: GlobalFunctionsAreConstantAbelianSchemeNoetheria L15–46 uses smooth geometrically connected ⇒ geometrically integral, proper-functions theorem over Noetherian base, and sheaf gluing across the affine basis to turn d0-compatible functions into a global section t; then the proper-functions bijection gives r. Preserve GlobalTheory.geometricallyIntegral_of_smooth, GlobalTheory.ProperFunctions.functions_of_isProper and sheaf gluing as children. No independent historical citation verification here.

## Assumption ledger and reproducibility
Wrapper declarations GoodForSquareZeroLiftClassificationOfAbelianScheStatement, AbelianSchemeDifferentialsFromGlobalFormsStatement, ExistsUniqueVectorFieldOfGlobalOneFormValuesStatement and GlobalFunctionsAreConstantAbelianSchemeNoetheriaStatement all have explicit bodies applying their internal named theorem. HC/HH are premises, not axiom declarations. Mathlib imports supply tensor, dual, smooth and categorical properties; imported dependency bodies not exhausted. No assertion about kernel axioms from name/lexical checks.
In connector JS environment re-fetched 12 pinned blobs and checked 87 exact line anchors (all matched), and exact original L21–53 equals current clump L1443–1475 (33/33 lines). Original Good body and wrapper no longer at same paths on head (404); actual migrated body found by caller import/source, not guessed. Reproduce hashes using git rev-parse and migration with Python in upstream checkout:
```python
import subprocess
pin="40e56bab026552e089d7afcfeff08d2defb9c005"
head="9477923066c923e6dbf7292da17019f8d08d0db8"
base="src/Development/AbelianVarietyTheory/"
P="Proofs/DivisorProofs/"
D="Definitions/Divisors/"
T="PublishedTheorems/Divisors₂/"
rows=[
(P+"GoodForSquareZeroLiftClassificationOfAbelianSche.lean","34ab76ca73351ce089c2dc20b7a0897c3de75275",[(21,"theorem good_of_isAbelianScheme"),(29,"bijective_cechDeRhamComparison_degreeOne"),(33,"globalFunctionsAreConstant"),(39,"cmpO_injective"),(42,"hodgeFiltration_eq_range"),(45,"hinj"),(52,"bij.1")]),
(P+"GoodForSquareZeroLiftClassificationOfAbelianScheStatement.lean","11a955b12884b107a4332afdeea3a6583cb78fb0",[(12,"exact @GlobalTheory.LiftSys.good_of_isAbelianScheme")]),
(D+"SurjectiveOfIsPullbackSqZero.lean","b4324e88eb9b117877d056cb7608693f944b8bbb",[(193,"structure Good"),(194,"const"),(195,"par"),(196,"proj"),(197,"surj"),(198,"inj")]),
(P+"AbelianSchemeDifferentialsFromGlobalForms.lean","a7db5e10df02be19cc408e4a1d21ba1a4edb7f48",[(12,"isBaseChange_of_dual"),(18,"Bijective F.dualMap"),(32,"bijective_dual_eval"),(49,"exists_unique_vectorField")]),
(P+"AbelianSchemeDifferentialsFromGlobalFormsStatement.lean","d2deb9d6350d204b33c37b091183ce0996436a8e",[(12,"GlobalTheory.ParForm.par")]),
(P+"ExistsUniqueVectorFieldOfGlobalOneFormValues.lean","366f5679daac8351fbdc73d7e76ae2281b1b031c",[(105,"theorem key"),(123,".unique"),(126,"tangent_eq_of_tanVal_eq"),(132,"exists_tangent_of_functional"),(138,"exists_derHom"),(141,"hglob"),(147,"uniq")]),
(P+"ExistsUniqueVectorFieldOfGlobalOneFormValuesStatement.lean","6a7f3f0d352c8a5d89483ff07f8281c91ab27d5a",[(12,"GlobalTheory.ParPt.exists_unique_of_globForm")]),
(P+"GlobalFunctionsAreConstantAbelianSchemeNoetheria.lean","ac73f506d791f4e1bcf340a101ce258a60d9ded5",[(21,"GeometricallyIntegral"),(22,"functions_of_isProper"),(29,"existsUnique_gluing'"),(43,"hbij.2")]),
(P+"GlobalFunctionsAreConstantAbelianSchemeNoetheriaStatement.lean","3d2b4ea8bd667271c342c19adf69249f60778815",[(12,"GlobalTheory.LiftSys.const_of_isAbelianScheme")]),
(P+"StructureSheafComparisonInjective.lean","0ff11567c19d8bcbe019fea3b7022d573e36837a",[(17,"cmpO_injective"),(27,"exists_glue_functions_spec_from_pairs"),(30,"cochainValueOnThickeningHom_eq_sub_of_glued")]),
(T+"AbelianHodgeDeRham.lean","80799a38567aba92e73f29eb44b8da65f95f44c2",[(15,"def AbelianHodgeDeRham : Prop"),(20,"Module.Projective"),(24,"ClosedForm A.hom = ⊤")]),
(D+"ComparisonMemCechHodgeFiltration.lean","b3632190bd27a8054a03bd8f64c41ab27f7c6fa8",[(216,"LinearMap.range"),(253,"structureSheaf_comparison_comm"),(270,"comparison_formClass")])]
def git(*a): return subprocess.check_output(["git",*a]).decode("utf8")
def read(ref,p,h):
    spec=ref+":"+base+p
    assert git("rev-parse",spec).strip()==h
    return git("show",spec).splitlines()
for p,h,anchors in rows:
    ls=read(pin,p,h)
    for i,s in anchors: assert s in ls[i-1],(p,i)
old=read(pin,*rows[0][:2])
new=read(head,P+"AbelianSchemeSquareZeroLiftsOfHodgeDeRham.lean","56819493f085ef977c38d4eaaca7c9705a31d84b")
assert old[20:53]==new[1442:1475]
print(len(rows),sum(len(a) for _,_,a in rows),33)
```
This compact replay uses a subset of the 87 anchors actually checked, plus all hashes and migration. Finite illustration actually executed in connector JS, not Lean, enumerating all 2x2 matrices over F2,F3,F5 (722), 12,456 unique dual extensions, 2,556 filtered form lift checks and 2,556 zero-kernel equivalences = 18,290 successful assertions. Two negative controls confirmed: failure of surj without S injectivity (C=id, q=id, q'=0, S=0, a=b:0→F2, j=id); failure of zero-kernel equivalence without j injectivity (C=S=q=q'=id, a=j=0, b=id). Both preserve the two comparison identities; first preserves both range equalities, second also does. Finite tests illustrate algebra only, not geometric child obligations.
```js
const assert=p=>{if(!p)throw Error("failed")};
let matrices=0,dual=0,forms=0,zero=0;
for(const p of [2,3,5]){
 const mod=x=>((x%p)+p)%p,V=Array.from({length:p*p},(_,i)=>[i%p,Math.floor(i/p)]),key=v=>v.join(","),dot=(a,b)=>mod(a[0]*b[0]+a[1]*b[1]),mul=(A,v)=>A.map(a=>dot(a,v));
 for(const a of V)for(const b of V){
  const A=[a,b],T=[[a[0],b[0]],[a[1],b[1]]],bij=M=>new Set(V.map(x=>key(mul(M,x)))).size===V.length;
  assert(bij(A)===bij(T));matrices++;
  if(!bij(A))continue;
  for(const l of V){assert(V.filter(d=>key(mul(T,d))===key(l)).length===1);dual++;}
  for(let w=0;w<p;w++){
   let c=V.find(v=>key(mul(A,v))===key([w,0]));assert(c!==undefined);
   const q=v=>mul(A,v)[1];assert(q(c)===0);const F=V.filter(v=>q(v)===0);
   assert(F.some(v=>key(v)===key(c)));assert(mul(A,c)[0]===w);forms++;
   assert((key(c)==="0,0")===(w===0));zero++;
  }
 }
}
assert(matrices+dual+forms+zero===18290);
console.log({matrices,dual,forms,zero});
const V=[0,1],Z=[0],id=x=>x,z=x=>0,range=(f,S)=>new Set(S.map(f)),ker=(f,S)=>S.filter(x=>f(x)===0),same=(a,b)=>a.size===b.size&&[...a].every(x=>b.has(x));
assert(V.every(x=>z(id(x))===z(id(x))));
assert(same(range(z,Z),new Set(ker(id,V))));
assert(same(range(id,V),new Set(ker(z,V))));
assert(range(z,Z).size<V.length);
assert(V.every(x=>id(z(x))===z(id(x))));
assert(z(1)===0&&id(1)!==0);
```
RESUME HERE: trace the actual t5 and LieDual.glob_surjective producers and LieDual.exists_tangent_of_functional from the pinned ParPt imports, including the precise quotient by ker cmpForm. Then system realization, followed by actual global HC/HH producers. Keep RhoBC separate from Good. HANDOFF TO integration, editor, audit, geometry. Project OPEN.

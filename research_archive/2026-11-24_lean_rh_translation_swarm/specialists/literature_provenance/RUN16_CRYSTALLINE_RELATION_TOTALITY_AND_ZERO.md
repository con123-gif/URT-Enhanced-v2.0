# RUN16 — crystalline relation totality and zero detection
2026-11-24. SOURCE-MATCHED / PARTIAL, project OPEN. Pin 40e56bab026552e089d7afcfeff08d2defb9c005, latest upstream main 9282d3a102c4aff0e6026746db2a8990f5d9cddd (unchanged since RUN15). Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, state/log/protocol/continuity excerpts, CI #399 (22:31:27Z, physics only), RUN15 and 25 latest commit titles, 15 recent peer file lists and available RESUME HERE patches. No duplicate found in that review. Some peer full notes and external blueprint not reopened. No physical gates or Queue edits.

## 1. Exact statement and witnesses
Pinned source: src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/CrystallineCechDeRhamRelationsTotalDetectZero.lean, GlobalTheory.PDForm.rel_total_zero L191–194, packages crystallineCechDeRham_degreeOne_relation_total L105–143 and crystallineCechDeRham_degreeTwo_relation_total L147–187. For EVERY D : Data and EVERY Λ : Lift D, both degrees j=1,2 satisfy (i) every crystalline class c has a related de Rham class h, (ii) every h has a related c, (iii) for every related pair c,h, c=0 iff h=0. Neither this theorem alone nor the definition of Rel asserts linearity or cup compatibility; RUN15 requires separate suppliers for those.

Write K=KK D.κ D.t, A=Cx.single (Coef.ofAlg (O D.κ D.t)), L=K.res Λ.L, W=Čech–de Rham total complex of OAff D.s. Write f=K.fnMap, r=K.resMap Λ.L, and R_j(k,w)=Λ.Resj k w (restricted cochains). The definitions Lift.Rel1/2 require witnesses k in Z^j(K), a categorical cocycle a, and w in Z^j(W), with [a]=c, [w]=h, first component k.1.1=a.1 exactly (not just equal classes), and R_j(r(k),w). Source definitions L429–443: in degree 1 restriction has a function on each arrow and a quotient one-form on each object; degree 2 has a function on each composable pair, a quotient one-form on each arrow, and a quotient two-form on each object. All chart and arrow quantifiers are retained. Λ itself contains a functor, algebra isomorphisms e_U, naturality, ideal-generation, point and affine-open containment conditions (L270ff); no arbitrary cochain correspondence substituted.

## 2. Three explicit suppliers
For j=1 and 2 let hfn mean H^j(f) bijective, hres mean H^j(r) bijective. Let hW/hK give unique related cochains in both directions, and hZ transport cocycle membership and boundary membership both ways. These are respectively the selected projections of three named native theorem wrappers (ledger below). Resj is subtraction-stable by the component algebra/quotient maps (L85–97), including all three components for j=2. L20–77 identifies zero quotient class with being a boundary, and relates categorical cocycles to the single complex by adding or projecting the trivial PUnit components. This justifies using categorical classes rather than confusing them with arbitrary total cochains.

**Zero-detection key (L110–115 and L152–157).** For k a cocycle in K, injectivity of H^j(f) and H^j(r) gives
    [first component of k]=0 iff [f(k)]=0 iff [k]=0 iff [r(k)]=0.
Each quotient class is zero exactly when a primitive exists for its differential (d0/D0 for j=1; d1/D1 for j=2). For a related pair, hZ further identifies [r(k)]=0 iff [w]=0, proving (iii). No assumption that a zero class has a zero representative.

**Left totality (L117–126, L159–168).** Given c=[a], insert a into the single complex. Surjectivity of H^j(f) gives a class in H^j(K) mapping to [a]; choose a cocycle k representing it. Equality of classes says first(k)−a is a categorical boundary. Choose w related to r(k) by hW; hZ ensures w is closed. Set h=[w], and use the exact first(k) cocycle, rather than a itself, as the categorical witness. The boundary just obtained certifies its class is c. This gives all four conjuncts of Relj.

**Right totality (L127–140, L169–184).** Given h=[w], choose k0 in the restricted complex related to w by hK; hZ ensures k0 is closed. Surjectivity of H^j(r) gives [k] with [r(k)]=[k0]. Choose its cocycle representative k. Thus r(k)−k0 is a boundary. Choose w1 related to r(k) by hW; it is closed by hZ. Subtraction stability gives R_j(r(k)−k0,w1−w), so hZ sends that boundary to a boundary and [w1]=[w]. Set c=[first(k)], and use k, first(k), w1 as the actual Relj witnesses. In degree 2 L178–180 explicitly converts the difference of subtype cocycles to the underlying cochain difference; do not omit that identification. L141–143/L185–187 finish with the zero-detection key.

This gives an economical common argument for both degrees without altering hypotheses. The native theorem invokes exactly the two cohomological bijections and the cochain correspondence; no URT theorem is used.

## 3. External assumption ledger delta
| Pinned declaration | Classification / actual supplier / obligations |
|---|---|
| GlobalTheory.T.crystallineCechDeRham_relations_total_detect_zero | theorem wrapper with explicit by/first/exact to PDForm.rel_total_zero; not an independent axiom. |
| PDForm.rel_total_zero | native theorem assembly of two proof bodies above. |
| Lift.Rel1/Rel2, Lift.Res1/Res2, Lift | predicates/structure; existence of inhabitants cannot be inferred from the definitions. |
| T.fnMap_pullbackBijective12_kk_and_res | wrapper of PDForm.crystalline_forget_forms_bijective_site_and_pairs; native body L52–62 supplies both site and affine-pair forgetful maps. Uses exists_diagonal_firstNeighbourhood_retraction_forms (one S, two sections u,v, three retractions with identities), coefficients_acyclic_of_two_sections_retraction, acyc_res_pE, fnMap_pullbackBijective12_of_acyclic (which uses forget-positive H1/H2). These deeper inputs are OPEN, not inferred proved from names. |
| T.lift_restriction_bijective_low_degrees | wrapper of PDForm.Lift.resMap_lift_pullbackBijectiveDegreesOneTwo; L64–69 composes affine-pair comparison (requires D.smooth_mono_inf.2.2), forget-form bijectivity and Lift.resMap_toE_pullbackBijectiveDegreesOneTwo. L50–62 uses hom_spec_points_levels, monotone level filtration, DP-nilpotence exhaustion, finite-level restriction bijectivity for every N≥N0+1, H1 and four-term exhaustion. All remain exact pending obligations. |
| T.compatibleFormsCochains_eq_deRhamCochains_smoothLift | wrapper of PDForm.lift_res_bij; native L270–271 combines LiftRes.part1 and part2. L200–222 uses differential commutation and uniqueness of zero; L223–265 matches four degree-2 cocycle equations (function Čech, mixed one-form, mixed two-form, closed two-form) using e_U/f1/fm injectivity including degree 3, and transports boundaries via degree-1 related primitives. Its component bijectivity and differential naturality suppliers remain OPEN. |
| QuotientAddGroup.eq_zero_iff, mk_surjective, mk_sub, AddMonoidHom.mem_range, map_eq_zero_iff | imported lemmas used at source level; transitive axiom and dependency extraction not independently run. |
| published Divisors₂.BijectiveCechDeRhamComparisonDegreeOne | imported by definitions module; no claim of dependency on that proposition without an elaborated value edge. No external-paper citation verified this run. |

No added independent mathematical assumptions in the translation. Source theorem bodies are not independent kernel replay or proof of axiom-free transitive closure. RUN15 Hodge fields, comparison add/smul, cup, naturality, degree-one compatibility, rigidity and earlier open leaves preserved.

## 4. Source manifest and upstream migration
GitHub connector returned these blob SHA IDs at the pin (paths relative to src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/ unless otherwise stated):
- CrystallineCechDeRhamRelationsTotalDetectZeroStatement.lean 98ad0b6e20a58b9e3155d93731fe76a7ae66027f
- CrystallineCechDeRhamRelationsTotalDetectZero.lean 8388246edf7584dbf623275ec8b9173b9ad12f36
- CrystallineForgetFormsBijectiveSiteAndPairsStatement.lean 2b1f07a5f7d45b46f6e65fc4949784c6dec78011
- CompatibleFormsCochainsEqDeRhamCochainsSmoothLifStatement.lean 534dac2241d1c9d1c9e6add21b886aa25427e583
- LiftRestrictionBijectiveLowDegreesStatement.lean acfd1344cb814182c54af1dba6e490f7ee4bf918
- CrystallineForgetFormsBijectiveSiteAndPairs.lean 88ef6478cd3a53e2a78aa7efb8b019027f591878
- CompatibleFormsCochainsEqDeRhamCochainsSmoothLif.lean 9c9c63005e2422fd6d5f622d8af445ee208ec857
- LiftRestrictionBijectiveLowDegrees.lean cac1924ebfd803d30546677c18964dc26e81836f
- CrystallineSmoothLiftOfRelations.lean b1bf4854a196e421a8c96ad821dd4f1a2957817b
- src/Development/AbelianVarietyTheory/Definitions/Divisors/DivPowerCompatTwoFormDerivativeCompOneForm.lean 25fb1d4b42084f570129c678837d37f622ad253a

Current head same CrystallineCechDeRhamRelationsTotalDetectZero.lean blob aa9a612c16d76e5e3cb7dd3b0b89e2b4657427fc. Exact line-by-line JS comparison: pin L20–98 -> head L1469–1547 (79/79); L105–143 -> L1554–1592 (36/39); L147–187 -> L1596–1636 (38/41); L191–194 -> L1640–1643 (4/4). Total 157/163 exact, six changed lines are the two degrees' three wrapper calls replaced with the same native names (crystalline_forget_forms_bijective_site_and_pairs, Lift.resMap_lift_pullbackBijectiveDegreesOneTwo, lift_res_bij). Preserve the pinned proof separately; no claim of semantic equivalence of full upstream revisions. Head caller CrystallineSmoothLiftOfRelations blob 48fcc1be2509ce2fc8401cff54ddb11335185902, L590ff as in RUN15. Reproduce hashes with git show PIN:PATH | git hash-object --stdin. Connector blob identities observed, not separately locally rehashed.

## 5. Executed finite regression of the abstract quotient argument
Not native geometry or Lean. Model each degree using F_p², all vectors closed and boundaries first axis, maps triangular (a,b;0,d). The two comparison maps f,r need only d nonzero (bijective on quotients), the cochain identification s has a,d nonzero. Enumerate all such diagrams for p=2,3, check both representative lifts, zero detection and subtraction transport. The 2,184 diagrams with non-injective f or r on cochains demonstrate why cochain bijectivity is stronger than needed. Three negative controls per field: failed left and right quotient surjectivity, failed boundary reflection. Actual V8 results: p=2 diagrams32, each check128, noninj24; p=3 diagrams3888, each check34992, noninj2160. 3920 diagrams; 35,120 instances each of left, right, zero and subtraction checks (140,480 total categories); six negative-control assertions. Replay as Node JS:
```js
const assert=(b,m)=>{if(!b)throw Error(m)};
function test(p){
 const v=Array.from({length:p*p},(_,i)=>[i%p,Math.floor(i/p)]);
 const maps=v.flatMap(([a,b])=>Array.from({length:p},(_,d)=>[a,b,d]));
 const apply=([a,b,d],[x,y])=>[(a*x+b*y)%p,d*y%p];
 const sub=(x,y)=>x.map((a,i)=>(a-y[i]+p)%p);
 const eq=(x,y)=>x.every((a,i)=>a===y[i]);
 const boundary=x=>x[1]===0;
 const fmaps=maps.filter(m=>m[2]!==0);
 const smaps=fmaps.filter(m=>m[0]!==0);
 let diagrams=0,left=0,right=0,zero=0,subtraction=0,noninj=0;
 for(const f of fmaps)for(const r of fmaps)for(const s of smaps){
  diagrams++;if(!f[0]||!r[0])noninj++;
  const W=k=>v.find(w=>eq(apply(s,w),apply(r,k)));
  for(const k of v){
   const w=W(k);assert(w,"cochain lift");assert(boundary(apply(f,k))===boundary(w),"zero");zero++;
  }
  for(const rep of v){
   const k=v.find(k=>boundary(sub(apply(f,k),rep)));assert(k,"left");assert(W(k),"left w");left++;
   const k0=apply(s,rep), k1=v.find(k=>boundary(sub(apply(r,k),k0)));assert(k1,"right");const w1=W(k1);
   assert(boundary(sub(w1,rep)),"right difference exact");assert(eq(apply(s,sub(w1,rep)),sub(apply(r,k1),k0)),"subtraction");right++;subtraction++;
  }
 }
 const id=[1,0,1], bad=[1,0,0], t=[0,1];
 assert(!v.some(k=>boundary(sub(apply(bad,k),t))),"bad f");
 assert(!v.some(k=>boundary(sub(apply(bad,k),apply(id,t)))),"bad r");
 assert(boundary(apply(bad,t))&&!boundary(t),"bad exactness");
 return {p,diagrams,left,right,zero,subtraction,noninj,negative:3};
}
console.log([test(2),test(3)]);
```

RESULT: reconstructed all six totality/zero obligations, three wrapper-to-body edges and their immediate supplier frontier. No Lean kernel replay, authenticated downstream expression references or URT-specific performance claim. Project OPEN.
RESUME HERE: expand PDForm.crystalline_forget_forms_bijective_site_and_pairs L52–62, especially fnMap_pullbackBijective12_of_acyclic L16–22 and the two-section retraction acyclicity supplier; retain degree 3, affine-pair restriction, and all remaining RUN16 and RUN15 obligations. Request authenticated role-labelled paths for rel_total_zero, both degree total theorems, crystalline_forget_forms_bijective_site_and_pairs, Lift.resMap_lift_pullbackBijectiveDegreesOneTwo, lift_res_bij, LiftRes.part1/2, and previous DualRT/Hodge supplier frontier rather than infer reachability from imports. HANDOFF TO dependency, kernel, editor, integration, audit, geometry and acceleration.

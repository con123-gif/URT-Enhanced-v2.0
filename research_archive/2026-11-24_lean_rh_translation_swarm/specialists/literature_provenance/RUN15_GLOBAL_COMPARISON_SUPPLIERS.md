# RUN15 — actual global crystalline and Hodge comparison suppliers
2026-11-24. SOURCE-MATCHED / PARTIAL; project OPEN. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; latest observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd (unchanged since RUN14).

Continuity: AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, research state/log/protocol and continuity excerpts, CI #396 (21:33:39 UTC, physical CI only), RUN1 and RUN14, 20 recent peer commit titles and post-RUN14 file/RESUME patches inspected. Dependency RUN15's 71-owner authenticated export is new evidence. Blueprint link noted; PDF not independently reopened. No unrelated physics or protected files edited.

## 1. Actual supplying declarations located
RUN14 left the two global comparison suppliers unknown. The new dependency output compute/rh-literature-theta-frontier-20261124/outputs/solution_literature_theta_frontier.json on cathedral-research-state (blob d823c364f446f5066dbbc61f7e9cf9c891fcbdb2; status pass blob 0fa45dc8015ee5473cf2c573733db9cecf465a38) gives an authenticated export root-frontier edge from UpperTheory.LiteratureTheorems.published_results_arithmetic (11298207) to abelian_de_rham_of_literature (11225739), value witness 891403526. Its encoded roots [887655052,887655054] refer in type to GlobalTheory.Published.AbelianDeRham (def; witness 724118189) and OpenLiteratureStatements (inductive; 12992045), and in value to PositivityTheory.DualRT.abelianDeRham (thm; 887655052) plus the record type. This corroborates pinned adapter L239–240, blob a13ba1f8c38d4dbf2ddd809fbf9610a007936c24, path src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean. This is export evidence, not new kernel replay. No claim of authenticated downstream edges for the new suppliers yet.

Pinned DualRT.abelianDeRham L20–23 constructs five fields: Free, Hodge, BaseChange, rigidity via rigid_of_free_of_crystallineDeRham (and separate FubiniStudyChowHeightFormula₂.Adr.crystallineDeRham), and duality. Its hS comes from abelianDeRhamStructure_of_page applied to MainStatements.Hodge.Free.abelianDeRhamPage. DualRT.duality L16–18 calls CrystallinePoints.Pd.duality_of_surjAll with Free, Hodge, BaseChange and surjAll. Crucially L13–14 supplies the exact two previously unresolved global propositions:
  GlobalTheory.SmoothLift.crystallineSmoothLift_of_relations : Published.CrystallineSmoothLift
  MainStatements.Hodge.Free.abelianHodgeDeRham : Published.AbelianHodgeDeRham.
These are source theorem bodies, not declarations of axioms. Their complete transitive proof and trust audit remains open.

SurjAllOfHodge L80–98: write C=FirstDeRham, T=H1OnPoints, A=H1 on trivial thickenings, and B=HO1. Let a=toH1O:C→A, b=cmpO:A→B, c=toPO.pull1:A→T and d=ofPC.pull1:T→A. Have cd=id_T, ba=toHO1∘cmp1 and ca=toP. For t∈T choose x∈C with ba(x)=bd(t) using surjectivity of cmp1 and toHO1. RUN14's injectivity of b gives a(x)=d(t), hence ca(x)=t. Thus toP is surjective. The global hC supplies cmp1 surjectivity for smooth separated quasi-compact morphisms; hH supplies toHO1 surjectivity for the abelian scheme of relative dimension g. Properness supplies the requisite instances. No arbitrary scheme surjectivity without those premises.

## 2. Crystalline supplier: a relation is the graph of a unique linear equivalence
CrystallineSmoothLiftOfRelations L19–46. Over any commutative ring R and R-modules M,N assume p⊆M×N with both projections surjective, p(x,y) implies (x=0 iff y=0), and closure under addition and scalar multiplication. Choose f(x) with p(x,f(x)). If p(x,y) and p(x,y'), then p(0,y'−y), hence y'=y. The same difference argument on the other coordinate proves injectivity of f. Right totality gives surjectivity. Uniqueness of the second coordinate proves additivity and scalar linearity. Thus p(x,y) iff e(x)=y for a linear isomorphism e. Equivalently p is a submodule of M⊕N with both projections linear isomorphisms. No field or finite projectivity assumption.

L52–72: choose one affine lift ΛD for each smooth-lift datum D via nonempty_smoothLiftAffineThickenings. The relation-totality-and-zero theorem provides both totality directions and zero detection separately in degrees 1 and 2. The add/smul theorem supplies closure in each degree. Apply the graph lemma twice, obtaining e1 and e2 with exact Rel1/Rel2 equivalences. Three remaining fields are supplied separately:
* cup compatibility: apply comparison_relations_respect_cup to Rel1 witnesses then convert Rel2 back to equality;
* degree-one comparison: smoothLift_degreeOne_comparisonRelation on the actual lift morphism, then the Rel1 equivalence;
* naturality in both degrees: crystallineDeRhamRelation_natural_smoothLift_morphism with both chosen lifts, σ, φ, φ₀, compatibility h, morphism m and hc, and the two relation witnesses.
These six imported supplier statements remain proof obligations, not axioms merely because they are used. Do not compress naturality to existence of unrelated linear isomorphisms.

## 3. Hodge supplier: the chapter record is constructed, not assumed
AbelianHodgeDeRham.lean L58–109 assigns all 47 fields of Chapters from named source declarations; Development.lean L13–61 defines the record (Prop). Chapters.print L67–102 consumes that record and five further explicit inputs: scheme models, smooth spreading, proper spreading, trivial locus and KFinite. The global theorem supplies all five via NoethApprox.schemeModels, SmoothSpread.smooth_spreads, SpreadingModels.properSpreads, TrivLoc.trivLocus and KLFinite.kFinite.
The assembly order: dictionary/complex → low, homotopy, qcalc, Fubini, affine acyclicity → descent and system base change → parallel forms, axes, comparison, Hopf, perfect models, vanishing and flat base change. Upper and lower rank bounds give field H1 dimensions, then wedge over fields, no-primitive and small-lift inputs yield global H1 bundle. The O-side gives base-change and wedge results. The group-law bilinear statement and frame yield closedness and lift (degeneration); wedge_alt follows from the exterior-power repeated-vector rule. Finally h.final combines Stein, parallel forms, H1 bundle, degeneration, wedge hypothesis, O-base-change and form base change. Preserve all quantified abelian-scheme and dimension premises, not an unsupported appeal to Hodge theory. Every field supplier still requires independent expansion or trusted import classification. No published-paper attribution was inferred from names.

## 4. Export/assumption ledger delta
| Declaration | Classification / remaining obligation |
|---|---|
| OpenLiteratureStatements.rec id 550025 | generated recursor, not axiom or proof of fields; roots [12992061,-550021,-550022,12992066,-550021], RHS one-based 12992066, zero-based 12992065; no value slot. Four RHS references: RecTExists def, Row def, mk ctor, record inductive. Preserve package and rule RHS. |
| abelian_de_rham_of_literature | exported theorem wrapper, actual native supplier DualRT.abelianDeRham, not citation or independent assumption. |
| crystallineSmoothLift_of_relations | native source theorem; no explicit added parameter; six imported statements, choice and exact graph lemma; transitive axiom audit open. |
| abelianHodgeDeRham, abelianHodgeDeRham' | source theorems; 47 supplied chapter fields and five further producers; not an axiom. |
| Chapters | Prop structure, not proof of its own inhabitants. Chapters.print is conditional on all six explicit arguments. |
| SurjAll_of_hodge (actual name surjAll_of_hodge), toPicard_surjective | conditional source theorems; preserve two comparison hypotheses, or the two surjectivity hypotheses respectively. |
| Published.CrystallineSmoothLift, Published.AbelianHodgeDeRham | proposition definitions; now actual source suppliers identified on pinned path, not established transitive axiom-free. |
| FubiniStudyChowHeightFormula₂.Adr.crystallineDeRham | distinct source theorem (blob efc95dd74b086a96d3de1f13d40c04d4d4796931, src/Development/WeilBound/CoreStatements/AbelianHeightsDuality/DividedPowerAlgebras/CrystallineDeRham.lean), used for rigidity; do not merge with hC. |

## 5. Checks, upstream migration, replay
Actual connector JavaScript checks: 5/5 pinned blob IDs matched and 29/29 exact anchor substrings present. Chapter fields and assignments independently counted 47 each. Exhaustive finite relation check below executed in V8: all 66,064 relations over Z/n × Z/n for n=2,3,4; 5 admissible, all graphs of bijections (counts 1,2,2). This tests the finite algebra motif, not the geometric or cohomological hypotheses or a kernel proof.

Pinned source manifest (relative to src/Development/; Git blob SHA):
- WeilBound/CoreStatements/AutomorphicKernels/DualAbelianScheme/AbelianDeRhamDuality/AbelianDeRhamDuality.lean bf38bb3decc713a4cbbabd8fb847247fcdf3df8c
- WeilBound/CoreStatements/AutomorphicKernels/DualAbelianScheme/AbelianDeRhamDuality/SurjAllOfHodge.lean 12b80cf2ba286f27a411c6590d830c25c40685fd
- WeilBound/CoreStatements/AutomorphicKernels/AbelianDeRham/AbelianHodgeDeRham/AbelianHodgeDeRham.lean 66a696a69d1308faefca6d352e2f4a700bc4501d
- WeilBound/CoreStatements/AutomorphicKernels/AbelianDeRham/AbelianHodgeDeRham/Development.lean 827a0f4d78ae81d6d5bf50640d07af49f42f693c
- AbelianVarietyTheory/Proofs/DivisorProofs/CrystallineSmoothLiftOfRelations.lean b1bf4854a196e421a8c96ad821dd4f1a2957817b

Current upstream same path CrystallineSmoothLiftOfRelations blob 48fcc1be2509ce2fc8401cff54ddb11335185902, L557–584 graph lemma text retained; L590–610 now calls LiftEx.nonempty_lift, PDForm.rel_total_zero, PDForm.rel_add_smul, PDForm.CrysCmp.lift_rel1_pull1_cmp1, PDForm.LiftNat.main directly, with comparison_relations_respect_cup still wrapped. Current AbelianDeRhamDuality blob 6a6dbd77379b3232e537081b8977cf2866d033aa L135–153 retains local surjAll proof; L238ff changes hH supplier to GlobalTheory.T.abelianScheme_deRham_locallyFree_hodgeDegenerates and duality/abelianDeRham to GlobalTheory.abelianDeRham projections/alias. Current AbelianSchemeFirstDeRhamStructure blob 44953e4c2de8cfdf86fe20b6bae02a150c5cbec5 L60 and 77 has the new assembly. Three old separate paths return 404 on head. Do not substitute current dependencies for pinned ones; migration needs independent audit.

Replay finite check (Node or JS runtime):
```js
let examined=0, admissible=0;
for(const n of [2,3,4]){
 let ok=0;
 for(let mask=0;mask<2**(n*n);mask++){
  examined++; const pairs=[];
  for(let a=0;a<n;a++)for(let b=0;b<n;b++)
   if(mask&(1<<(a*n+b)))pairs.push([a,b]);
  const has=(a,b)=>!!(mask&(1<<(a*n+b)));
  if(!Array.from({length:n},(_,a)=>pairs.some(x=>x[0]===a)&&pairs.some(x=>x[1]===a)).every(Boolean))continue;
  if(!pairs.every(([a,b])=>(a===0)===(b===0)))continue;
  if(!pairs.every(([a,b])=>pairs.every(([c,d])=>has((a+c)%n,(b+d)%n))))continue;
  if(!pairs.every(([a,b])=>Array.from({length:n},(_,k)=>has(k*a%n,k*b%n)).every(Boolean)))continue;
  if(pairs.length!==n||new Set(pairs.map(x=>x[0])).size!==n||new Set(pairs.map(x=>x[1])).size!==n)throw Error("bad relation");
  ok++;admissible++;
 }
 console.log(n,ok);
}
if(examined!==66064||admissible!==5)throw Error("census");
console.log(examined,admissible);
```
Source check replay: git show PIN:PATH | git hash-object --stdin for the five manifest entries; inspect cited ranges and count Chapter field/assignment lines matching /^  \\w+ :/ and /^  \\w+ :=/. Connector SHA checks are source identity checks, not local rehash or Lean verification. Reports of 71 and 18 owners inspected; no direct hC/hH target there. Combined 4.2 MB report truncated, so no exhaustive negative reverse-edge claim.

RESULT: both global comparison supplier declarations located and their actual assembly bodies translated. Root export corroborates the literature-to-DualRT bridge; downstream edges await authenticated export. No new premises, no kernel replay, no full proof or URT advantage claimed.
RESUME HERE: expand the crystalline relation totality/zero supplier (CrystallineCechDeRhamRelationsTotalDetectZeroStatement and its native proof), preserving both totality directions in both degrees, then request authenticated edges for DualRT.abelianDeRham, DualRT.surjAll, DualRT.duality, SmoothLift.crystallineSmoothLift_of_relations, SmoothLift.exists_linearEquiv_of_rel, Hodge.Free.abelianHodgeDeRham, Hodge.Free.abelianHodgeDeRham', Hodge.Free.Chapters.print. Keep all 47 chapter fields and five suppliers in the frontier, plus RUN14 SecPullA/local separation leaf. HANDOFF TO dependency, kernel, integration, editor, audit, geometry and acceleration. Project OPEN.

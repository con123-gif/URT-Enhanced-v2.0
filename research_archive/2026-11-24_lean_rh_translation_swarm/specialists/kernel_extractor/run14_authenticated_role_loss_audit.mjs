// 2026-11-24 kernel lane: authenticated 47-owner role-loss audit, PARTIAL.
// Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream observed 9282d3a102c4aff0e6026746db2a8990f5d9cddd (2641 ahead, 0 behind). Main and toolchain differ; RhOfRight old path returns 404 at HEAD. Do not transfer proof identities across revisions.
// Source: https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Formalism/GammaFactorNonvanishing/RhOfRight.lean blob 3604637147a33e72248faddd775ea750e7846ead. Import Mathlib is not a declaration dependency list. The proof uses right-side nonvanishing hz and the functional equation, with nontrivial-zero/pole exclusions unchanged.
// Data: https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-combined-frontier-roles-20261124/outputs/solution_frontier_roles.json ; Git blob d49fbcc22a2382039986b09ff91dd11af2ef2e7b; CI SHA256 9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6.
// Prior native projection run 45457486389; peer path reconciliation 593acf8abadbcca5b53476d01f10477142b6b039; peer delta merge a23fb0d5f87df6b332e3a58e5a2aab1646c3eb8d; previous native masking fixture 5220d42dfe953d9524b9f30c6436e769529458d5. This task quantifies actual projection loss under erasure of role/kind/witness, not reachability or incremental merging.
// Read AGENTS, swarm protocol/queue/expansion, continuity and research state/log/protocol excerpts, general CI #391, recent 15 lane commits and available RESUME HERE excerpts. Blueprint not reopened; no physical gates changed.
// Lemma: for a finite role-labelled multigraph, dropping one edge e preserves the owner target set iff its target has multiplicity >=2. Proof: only membership of that target can change, and membership survives exactly when another edge remains. Full edge signature equality rejects deletion or witness substitution if the original signature was unique. This proves preservation relative to the authenticated report, NOT completeness of the original proof term. Witness is a representative expression index, not all occurrences. Mutual-block metadata is not an edge. No new Lean execution or URT advantage.
// Actual execution in V8 on connector-retrieved blob; no local byte hashing in V8; Node replay below enforces SHA1/SHA256. Complexity expected O(V+E) plus serialization of edge fields; one set materialization per owner-target in this diagnostic makes actual characterization loop O(sum distinct targets^2); do not claim linear implementation. Negative controls are deliberately altered report copies, not changes to Lean.
// RESUME HERE: after dependency lane provides next authenticated 10-root plus specialist projection, run the same audit on its exact report bytes, preserve all roles and distinguish source revision changes; send the resulting per-owner loss ledger to integration and audit. HANDOFF TO kernel, dependency, integration, audit, acceleration, editor. Project OPEN.
import fs from 'node:fs';
import crypto from 'node:crypto';
function audit(a){
const ck=(x,m)=>{if(!x)throw Error(m);checks++};let checks=0;
ck(a.pin==="40e56bab026552e089d7afcfeff08d2defb9c005"&&a.digest==="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e"&&a.n===1065214335&&a.reports.length===47,"pin");
const key=JSON.stringify, results=[], totals={edges:0,ownerTargetPairs:0,maskedDeletions:0,typeValuePairs:0,distinctRoleWitnessPairs:0,sameRoleDifferentKindPairs:0,distinctExpressionRecords:0};let negative=0;const seenOwners=new Set();
const edges=r=>[...["type","value"].flatMap(role=>(r[role]?.references??[]).map(e=>({role,...e}))),...(r.structural??[]).map(e=>({role:"structural",...e}))];
const sig=e=>key([e.role,e.kind,e.target,e.nameParts,e.targetKind??null,e.witnessExpression??null,e.distinctExpressionRecords??null,e.edgeIndex??null,e.encoded??null]);
const same=(a,b)=>a.size===b.size&&[...a].every(x=>b.has(x));
for(const r of a.reports){
 ck(!seenOwners.has(r.id),"duplicate owner");seenOwners.add(r.id);
 const es=edges(r), full=new Set(es.map(sig)), by=new Map();
 ck(full.size===es.length,"duplicate exact edge");
 for(const e of es){const g=by.get(e.target)??[];g.push(e);by.set(e.target,g);if(e.role!=="structural"){ck(e.witnessExpression>=0&&e.witnessExpression<=r[e.role].expressionRoot,"witness range");totals.distinctExpressionRecords+=e.distinctExpressionRecords}}
 const out={id:r.id,name:(r.request??r.source).name,edges:es.length,targets:by.size,maskedDeletions:0,typeValuePairs:0,distinctRoleWitnessPairs:0,sameRoleDifferentKindPairs:0};let sample=null;
 for(const [target,g] of by){
  if(g.length>1){out.maskedDeletions+=g.length;if(!sample)sample={target,nameParts:g[0].nameParts,edges:g.map(e=>({role:e.role,kind:e.kind,witness:e.witnessExpression??null}))}}
  const t=g.filter(e=>e.role==="type"),v=g.filter(e=>e.role==="value");if(t.length&&v.length){out.typeValuePairs++;if(t.some(x=>v.some(y=>x.witnessExpression!==y.witnessExpression)))out.distinctRoleWitnessPairs++}
  if(["type","value"].some(role=>new Set(g.filter(e=>e.role===role).map(e=>e.kind)).size>1))out.sameRoleDifferentKindPairs++;
 }
 const base=new Set(by.keys());for(const [target,g] of by){const expected=g.length>1;const remaining=new Set(base);if(!expected)remaining.delete(target);ck(same(base,remaining)===expected,"single deletion characterization")}
 // Independently materialize one mutation per owner with duplicated target.
 if(sample){const i=es.findIndex(e=>e.target===sample.target),changed=es.filter((_,j)=>j!==i);ck(same(base,new Set(changed.map(e=>e.target))),"target-only omission must be invisible");ck(!same(full,new Set(changed.map(sig))),"exact edge deletion must be detected");negative++}
 // Count-preserving witness mutation also retains name/role/target, but changes full signature.
 const first=es.findIndex(e=>e.role!=="structural");if(first>=0){const changed=es.map((e,i)=>i===first?{...e,witnessExpression:e.witnessExpression===0?1:e.witnessExpression-1}:e);ck(changed.length===es.length&&same(base,new Set(changed.map(e=>e.target))),"count-preserving control");ck(!same(full,new Set(changed.map(sig))),"witness mutation must be detected");negative++}
 totals.edges+=out.edges;totals.ownerTargetPairs+=out.targets;for(const k of ["maskedDeletions","typeValuePairs","distinctRoleWitnessPairs","sameRoleDifferentKindPairs"])totals[k]+=out[k];results.push({...out,sample});
}
ck(totals.edges===a.summary.typeEdges+a.summary.valueEdges+a.summary.structuralEdges,"reported totals");
return {checks,negative,totals,ownersWithMasked:results.filter(x=>x.maskedDeletions).length,ownersWithDistinctRoleWitness:results.filter(x=>x.distinctRoleWitnessPairs).length,top:results.sort((a,b)=>b.maskedDeletions-a.maskedDeletions).slice(0,5),rhOfRight:results.find(x=>x.id===341050),all:results.map(({sample,...x})=>x)};
}
const expected={
  "checks": 23996,
  "negative": 93,
  "totals": {
    "edges": 13203,
    "ownerTargetPairs": 10513,
    "maskedDeletions": 5333,
    "typeValuePairs": 2633,
    "distinctRoleWitnessPairs": 29,
    "sameRoleDifferentKindPairs": 35,
    "distinctExpressionRecords": 13348
  },
  "ownersWithMasked": 46,
  "ownersWithDistinctRoleWitness": 26,
  "top": [
    {
      "id": 9616555,
      "name": "PositivityTheory.Xj7N.norm_small_le",
      "edges": 624,
      "targets": 441,
      "maskedDeletions": 365,
      "typeValuePairs": 182,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1,
      "sample": {
        "target": 9107333,
        "nameParts": [
          "GlobalTheory",
          "AllWt",
          "cuspOn"
        ],
        "edges": [
          {
            "role": "type",
            "kind": "explicit_const",
            "witness": 728655802
          },
          {
            "role": "value",
            "kind": "explicit_const",
            "witness": 728655802
          }
        ]
      }
    },
    {
      "id": 9613757,
      "name": "PositivityTheory.Xj7N.local_unit_map_surjective",
      "edges": 732,
      "targets": 565,
      "maskedDeletions": 331,
      "typeValuePairs": 164,
      "distinctRoleWitnessPairs": 2,
      "sameRoleDifferentKindPairs": 2,
      "sample": {
        "target": 560699,
        "nameParts": [
          "Formalism",
          "BasicNotions",
          "D7",
          "R"
        ],
        "edges": [
          {
            "role": "type",
            "kind": "explicit_const",
            "witness": 13422294
          },
          {
            "role": "value",
            "kind": "explicit_const",
            "witness": 13422294
          }
        ]
      }
    },
    {
      "id": 6078879,
      "name": "GlobalTheory.divTied3_read",
      "edges": 445,
      "targets": 282,
      "maskedDeletions": 324,
      "typeValuePairs": 161,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1,
      "sample": {
        "target": 1568795,
        "nameParts": [
          "GlobalTheory",
          "Mem",
          "R3",
          "idsOf"
        ],
        "edges": [
          {
            "role": "type",
            "kind": "explicit_const",
            "witness": 81771968
          },
          {
            "role": "value",
            "kind": "explicit_const",
            "witness": 81771968
          }
        ]
      }
    },
    {
      "id": 6375493,
      "name": "GlobalTheory.Mem.R3.Grp.grp_levels_exist",
      "edges": 329,
      "targets": 169,
      "maskedDeletions": 318,
      "typeValuePairs": 158,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1,
      "sample": {
        "target": 1559951,
        "nameParts": [
          "GlobalTheory",
          "Mem",
          "Stages",
          "toD7"
        ],
        "edges": [
          {
            "role": "type",
            "kind": "explicit_const",
            "witness": 81128513
          },
          {
            "role": "value",
            "kind": "explicit_const",
            "witness": 81128513
          }
        ]
      }
    },
    {
      "id": 9616232,
      "name": "ModelDimension.cusp_form_extension_vanishing",
      "edges": 361,
      "targets": 217,
      "maskedDeletions": 286,
      "typeValuePairs": 142,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1,
      "sample": {
        "target": 560699,
        "nameParts": [
          "Formalism",
          "BasicNotions",
          "D7",
          "R"
        ],
        "edges": [
          {
            "role": "type",
            "kind": "explicit_const",
            "witness": 13422294
          },
          {
            "role": "value",
            "kind": "explicit_const",
            "witness": 13422294
          }
        ]
      }
    }
  ],
  "rhOfRight": {
    "id": 341050,
    "name": "Formalism.VW.rh_of_right",
    "edges": 365,
    "targets": 339,
    "maskedDeletions": 50,
    "typeValuePairs": 24,
    "distinctRoleWitnessPairs": 1,
    "sameRoleDifferentKindPairs": 1,
    "sample": {
      "target": 326825,
      "nameParts": [
        "RiemannHypothesis"
      ],
      "edges": [
        {
          "role": "type",
          "kind": "explicit_const",
          "witness": 6490658
        },
        {
          "role": "value",
          "kind": "explicit_const",
          "witness": 6490658
        }
      ]
    }
  },
  "all": [
    {
      "id": 9616555,
      "name": "PositivityTheory.Xj7N.norm_small_le",
      "edges": 624,
      "targets": 441,
      "maskedDeletions": 365,
      "typeValuePairs": 182,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 9613757,
      "name": "PositivityTheory.Xj7N.local_unit_map_surjective",
      "edges": 732,
      "targets": 565,
      "maskedDeletions": 331,
      "typeValuePairs": 164,
      "distinctRoleWitnessPairs": 2,
      "sameRoleDifferentKindPairs": 2
    },
    {
      "id": 6078879,
      "name": "GlobalTheory.divTied3_read",
      "edges": 445,
      "targets": 282,
      "maskedDeletions": 324,
      "typeValuePairs": 161,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 6375493,
      "name": "GlobalTheory.Mem.R3.Grp.grp_levels_exist",
      "edges": 329,
      "targets": 169,
      "maskedDeletions": 318,
      "typeValuePairs": 158,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 9616232,
      "name": "ModelDimension.cusp_form_extension_vanishing",
      "edges": 361,
      "targets": 217,
      "maskedDeletions": 286,
      "typeValuePairs": 142,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 9615438,
      "name": "GlobalTheory.CompanionTheory.Ar.ClosedPt.exists_residue_eval",
      "edges": 459,
      "targets": 331,
      "maskedDeletions": 256,
      "typeValuePairs": 128,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 0
    },
    {
      "id": 6375344,
      "name": "GlobalTheory.Mem.PsiTie.psiPPTie_of_levOf",
      "edges": 343,
      "targets": 233,
      "maskedDeletions": 218,
      "typeValuePairs": 108,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 4997285,
      "name": "GlobalTheory.Mem.R3.pins_card_index_ranks",
      "edges": 348,
      "targets": 248,
      "maskedDeletions": 198,
      "typeValuePairs": 98,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 2367057,
      "name": "GlobalTheory.MemLoc.frob_laws",
      "edges": 326,
      "targets": 229,
      "maskedDeletions": 192,
      "typeValuePairs": 95,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 868943,
      "name": "Deduction.iteratedDeriv_laplace_hasDerivAt",
      "edges": 473,
      "targets": 377,
      "maskedDeletions": 190,
      "typeValuePairs": 94,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 3987404,
      "name": "ReciprocityTheory.ChartRestriction.G.Chart.glue_tan",
      "edges": 301,
      "targets": 211,
      "maskedDeletions": 179,
      "typeValuePairs": 89,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 856985,
      "name": "Deduction.CharacterBalanceMoves.one_char",
      "edges": 442,
      "targets": 354,
      "maskedDeletions": 174,
      "typeValuePairs": 86,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 8953455,
      "name": "PositivityTheory.SiegelWeilFormula.Avac.vac_K'",
      "edges": 303,
      "targets": 217,
      "maskedDeletions": 172,
      "typeValuePairs": 85,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 11189127,
      "name": "GlobalTheory.PtVanish.connForm_eq_zero",
      "edges": 309,
      "targets": 225,
      "maskedDeletions": 168,
      "typeValuePairs": 84,
      "distinctRoleWitnessPairs": 3,
      "sameRoleDifferentKindPairs": 0
    },
    {
      "id": 9615598,
      "name": "GlobalTheory.CompanionTheory.VanDescent.vanish_descent",
      "edges": 489,
      "targets": 405,
      "maskedDeletions": 166,
      "typeValuePairs": 82,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 869232,
      "name": "Deduction.landau_pole_asym",
      "edges": 424,
      "targets": 341,
      "maskedDeletions": 164,
      "typeValuePairs": 81,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 858797,
      "name": "Deduction.ch_core",
      "edges": 531,
      "targets": 452,
      "maskedDeletions": 156,
      "typeValuePairs": 77,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 8953593,
      "name": "GlobalTheory.CompanionTheory.UnitFrame.normSq_eq_of_unit_frames",
      "edges": 308,
      "targets": 244,
      "maskedDeletions": 126,
      "typeValuePairs": 62,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 868460,
      "name": "Deduction.poleData_abstract",
      "edges": 410,
      "targets": 348,
      "maskedDeletions": 122,
      "typeValuePairs": 60,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 4832560,
      "name": "PositivityTheory.RgGu.NR.Sig.lim_form",
      "edges": 284,
      "targets": 222,
      "maskedDeletions": 122,
      "typeValuePairs": 60,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 868955,
      "name": "Deduction.landau_coeff",
      "edges": 287,
      "targets": 227,
      "maskedDeletions": 118,
      "typeValuePairs": 58,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 868949,
      "name": "Deduction.iteratedDeriv_laplace",
      "edges": 184,
      "targets": 125,
      "maskedDeletions": 116,
      "typeValuePairs": 57,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 3987187,
      "name": "ReciprocityTheory.ChartRestriction.G.Chart.tan_lift",
      "edges": 217,
      "targets": 163,
      "maskedDeletions": 108,
      "typeValuePairs": 54,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 0
    },
    {
      "id": 3986738,
      "name": "ReciprocityTheory.ChartRestriction.G.Chart.tan_uniq",
      "edges": 224,
      "targets": 170,
      "maskedDeletions": 108,
      "typeValuePairs": 54,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 0
    },
    {
      "id": 1076940,
      "name": "Formalism.L2.GlobalTheoryTheory.Loss.loss_bound_at",
      "edges": 309,
      "targets": 255,
      "maskedDeletions": 107,
      "typeValuePairs": 53,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 869149,
      "name": "Deduction.landau_cauchy",
      "edges": 313,
      "targets": 263,
      "maskedDeletions": 98,
      "typeValuePairs": 48,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 11189057,
      "name": "GlobalTheory.eq_zero_of_forall_residueField_functional",
      "edges": 148,
      "targets": 102,
      "maskedDeletions": 91,
      "typeValuePairs": 45,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 9615504,
      "name": "GlobalTheory.CompanionTheory.Arith.DedekindDescent.linIndep_descent",
      "edges": 239,
      "targets": 200,
      "maskedDeletions": 77,
      "typeValuePairs": 38,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 8953738,
      "name": "PositivityTheory.SiegelWeilFormula.Avac.vac_res'",
      "edges": 156,
      "targets": 118,
      "maskedDeletions": 76,
      "typeValuePairs": 37,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 13125899,
      "name": "UpperTheory.One.vwin_of_row",
      "edges": 56,
      "targets": 30,
      "maskedDeletions": 52,
      "typeValuePairs": 26,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 0
    },
    {
      "id": 341050,
      "name": "Formalism.VW.rh_of_right",
      "edges": 365,
      "targets": 339,
      "maskedDeletions": 50,
      "typeValuePairs": 24,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 341183,
      "name": "DirichletCharacter.LFunction_modOne_eq",
      "edges": 70,
      "targets": 55,
      "maskedDeletions": 28,
      "typeValuePairs": 13,
      "distinctRoleWitnessPairs": 1,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 4833221,
      "name": "PositivityTheory.RgGu.NR.BoundB.bound_main",
      "edges": 498,
      "targets": 490,
      "maskedDeletions": 16,
      "typeValuePairs": 7,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 4833917,
      "name": "PositivityTheory.RgGu.NR.boundB",
      "edges": 16,
      "targets": 9,
      "maskedDeletions": 14,
      "typeValuePairs": 7,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 0
    },
    {
      "id": 869799,
      "name": "Formalism.MainNotions.LinkG_at",
      "edges": 122,
      "targets": 116,
      "maskedDeletions": 12,
      "typeValuePairs": 5,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 8953756,
      "name": "PositivityTheory.SiegelWeilFormula.Avac.vacK_of",
      "edges": 106,
      "targets": 101,
      "maskedDeletions": 10,
      "typeValuePairs": 5,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 0
    },
    {
      "id": 11298208,
      "name": "UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin",
      "edges": 30,
      "targets": 28,
      "maskedDeletions": 4,
      "typeValuePairs": 2,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 0
    },
    {
      "id": 869816,
      "name": "Formalism.MainNotions.LinkG",
      "edges": 31,
      "targets": 29,
      "maskedDeletions": 4,
      "typeValuePairs": 2,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 0
    },
    {
      "id": 550021,
      "name": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements.mk",
      "edges": 5,
      "targets": 3,
      "maskedDeletions": 3,
      "typeValuePairs": 0,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 0
    },
    {
      "id": 11307205,
      "name": "UpperTheory.Zero.LLC.recTExists",
      "edges": 253,
      "targets": 252,
      "maskedDeletions": 2,
      "typeValuePairs": 0,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 8981975,
      "name": "PositivityTheory.SiegelWeilFormula.Avac.iwaQ_of'",
      "edges": 269,
      "targets": 268,
      "maskedDeletions": 2,
      "typeValuePairs": 1,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 0
    },
    {
      "id": 14034132,
      "name": "PositivityTheory.SiegelWeilFormula.Avac.iwaQ_of'_k",
      "edges": 269,
      "targets": 268,
      "maskedDeletions": 2,
      "typeValuePairs": 1,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 0
    },
    {
      "id": 6375353,
      "name": "GlobalTheory.T.psiLevelPairCompatible_of_columnLevels",
      "edges": 111,
      "targets": 110,
      "maskedDeletions": 2,
      "typeValuePairs": 0,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 9615658,
      "name": "GlobalTheory.T.complex_section_finite_combination",
      "edges": 84,
      "targets": 83,
      "maskedDeletions": 2,
      "typeValuePairs": 0,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 6078946,
      "name": "GlobalTheory.T.divisionCompatible_at_readIdentifications",
      "edges": 163,
      "targets": 162,
      "maskedDeletions": 2,
      "typeValuePairs": 0,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 4832698,
      "name": "PositivityTheory.RgGu.NR.signature",
      "edges": 419,
      "targets": 418,
      "maskedDeletions": 2,
      "typeValuePairs": 0,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 1
    },
    {
      "id": 14065050,
      "name": "UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter",
      "edges": 18,
      "targets": 18,
      "maskedDeletions": 0,
      "typeValuePairs": 0,
      "distinctRoleWitnessPairs": 0,
      "sameRoleDifferentKindPairs": 0
    }
  ]
};
const raw=fs.readFileSync(process.argv[2]);
if(crypto.createHash('sha1').update('blob '+raw.length+'\0').update(raw).digest('hex')!=='d49fbcc22a2382039986b09ff91dd11af2ef2e7b'||crypto.createHash('sha256').update(raw).digest('hex')!=='9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6')throw Error('report hash mismatch');
const actual=audit(JSON.parse(raw));if(JSON.stringify(actual)!==JSON.stringify(expected))throw Error('replay mismatch');console.log(JSON.stringify(actual,null,2));

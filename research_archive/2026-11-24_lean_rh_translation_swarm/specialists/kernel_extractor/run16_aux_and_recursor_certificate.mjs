// RUN16 kernel extraction — 2026-11-24, PARTIAL, authenticated exported role evidence; not kernel replay.
// Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream HEAD 9282d3a102c4aff0e6026746db2a8990f5d9cddd unchanged, not adopted.
// Inputs, in order:
// 64b935e4ef309f6c555912a377012c7708eda510 https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-targeted-role-witness-20261124/outputs/solution_direct_roles.json
// d04e0fb24160d3ee1be54cd50082f59526864d4e https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-next-root-roles-20261124/outputs/solution_next_root_roles.json
// d823c364f446f5066dbbc61f7e9cf9c891fcbdb2 https://github.com/con123-gif/URT-Enhanced-v2.0/blob/cathedral-research-state/compute/rh-literature-theta-frontier-20261124/outputs/solution_literature_theta_frontier.json
// 6ac769568b67f85f33565ba3e1eef7b91f53c55f https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/CharacterBoxes/EveryCharacter.lean
// a13ba1f8c38d4dbf2ddd809fbf9610a007936c24 https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean
// CI source projection 45489010764, SHA256 6d2752fde5949c14eb18d61b54d7c5d8a4593fc623efb61ba83853ce0e447964.
// Missing older 47-owner report d49fbcc22a2382039986b09ff91dd11af2ef2e7b: connector returned empty content; no assumption of full root path if null.
// Prior work: RUN15 slot audit 8e42a6e; acceleration 5d2024c already counted RHS edges; this independently compares exact role witnesses, source ordered field multiplicity, auxiliary proof type/value and entire-rule erasure.
// Result: generated proof has direct numeral/typeclass evidence (Nat.AtLeastTwo, instAtLeastTwoHAddOfNat, instNeZeroSucc), no direct L-function references; exact proposition and proof-term syntax not recovered from reference lists. Do not replace with an assumed proof of 1/2 or omit it.
// OpenLiteratureStatements is Prop with three ordered fields, Row, RecTExists, Row. Constructor is named by package but not exported as owner in these reports. Recursor type and RHS have exactly the same four reference signatures (kind,target,witness,count). Deleting whole RHS is invisible to the target-set test. Reference signatures do not encode application structure or proof argument order.
// Lemma: removing all edges in subset S preserves target-set iff every target of S is also targeted outside S; immediate from set difference. Here type contains each RHS target. Role/slot signature multiset equality rejects all five actual report mutations; does not prove original extraction completeness, expression syntax, or Lean validity.
// Read AGENTS, swarm protocol/queue/expansion, recent peer commits/available handoffs, research state/log/protocol/continuity, CI summary #397 (physics only). Blueprint link noted, not reopened. No physics changes. V8 execution of audit on actual connector blobs; Node CLI byte hashing/replay prepared not executed; local Lean and Lake absent. No new #print axioms or URT claim.
// RESUME HERE: request owner 550021 (constructor) and source field projections, plus exact expression sub-DAG (including binder/literal/application nodes) for aux roots 1025073 and 44333, recursor roots 12992060 and 12992065. Retrieve missing 47-owner report via native runner for complete selected paths. HANDOFF TO dependencies, literature, audit, editor, integration, acceleration. Project OPEN.
// Actual V8 result:
/*
{
  "checks": 5235,
  "negative": 5,
  "owners": 95,
  "observedReachable": 134,
  "aux": {
    "id": 326948,
    "sourceLine": "∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (s : ℂ), 1 / 2 < s.re → (χ ≠ 1 ∨ s ≠ 1) → DirichletCharacter.LFunction χ s ≠ 0",
    "incoming": {
      "role": "value",
      "slot": 1,
      "target": 326948,
      "kind": "explicit_const",
      "witness": 6102670,
      "count": 1,
      "name": "UpperTheory.EveryCharacter._proof_1"
    },
    "type": [
      {
        "role": "type",
        "slot": 0,
        "target": 61,
        "kind": "literal_primitive",
        "witness": 1061,
        "count": 1,
        "name": "Nat"
      },
      {
        "role": "type",
        "slot": 0,
        "target": 169,
        "kind": "explicit_const",
        "witness": 927,
        "count": 1,
        "name": "instOfNatNat"
      },
      {
        "role": "type",
        "slot": 0,
        "target": 61,
        "kind": "explicit_const",
        "witness": 316,
        "count": 1,
        "name": "Nat"
      },
      {
        "role": "type",
        "slot": 0,
        "target": 80,
        "kind": "explicit_const",
        "witness": 924,
        "count": 1,
        "name": "OfNat.ofNat"
      },
      {
        "role": "type",
        "slot": 0,
        "target": 824,
        "kind": "explicit_const",
        "witness": 3851,
        "count": 1,
        "name": "instAddNat"
      },
      {
        "role": "type",
        "slot": 0,
        "target": 40,
        "kind": "explicit_const",
        "witness": 3849,
        "count": 1,
        "name": "instHAdd"
      },
      {
        "role": "type",
        "slot": 0,
        "target": 37,
        "kind": "explicit_const",
        "witness": 3845,
        "count": 1,
        "name": "HAdd.hAdd"
      },
      {
        "role": "type",
        "slot": 0,
        "target": 4685,
        "kind": "explicit_const",
        "witness": 36206,
        "count": 1,
        "name": "Nat.AtLeastTwo"
      }
    ],
    "value": [
      {
        "role": "value",
        "slot": 1,
        "target": 61,
        "kind": "literal_primitive",
        "witness": 389,
        "count": 2,
        "name": "Nat"
      },
      {
        "role": "value",
        "slot": 1,
        "target": 169,
        "kind": "explicit_const",
        "witness": 927,
        "count": 1,
        "name": "instOfNatNat"
      },
      {
        "role": "value",
        "slot": 1,
        "target": 61,
        "kind": "explicit_const",
        "witness": 316,
        "count": 1,
        "name": "Nat"
      },
      {
        "role": "value",
        "slot": 1,
        "target": 80,
        "kind": "explicit_const",
        "witness": 924,
        "count": 1,
        "name": "OfNat.ofNat"
      },
      {
        "role": "value",
        "slot": 1,
        "target": 4770,
        "kind": "explicit_const",
        "witness": 44331,
        "count": 1,
        "name": "Nat.instNeZeroSucc"
      },
      {
        "role": "value",
        "slot": 1,
        "target": 4764,
        "kind": "explicit_const",
        "witness": 44329,
        "count": 1,
        "name": "Nat.instAtLeastTwoHAddOfNat"
      }
    ],
    "rootPath": [
      {
        "owner": 14065054,
        "role": "value",
        "slot": 1,
        "target": 14065053,
        "kind": "explicit_const",
        "witness": 1065212062,
        "count": 1,
        "name": "rhOfAll"
      },
      {
        "owner": 14065053,
        "role": "value",
        "slot": 1,
        "target": 14065052,
        "kind": "explicit_const",
        "witness": 1065212060,
        "count": 1,
        "name": "allChi"
      },
      {
        "owner": 14065052,
        "role": "type",
        "slot": 0,
        "target": 326947,
        "kind": "explicit_const",
        "witness": 6497236,
        "count": 1,
        "name": "UpperTheory.EveryCharacter"
      },
      {
        "owner": 326947,
        "role": "value",
        "slot": 1,
        "target": 326948,
        "kind": "explicit_const",
        "witness": 6102670,
        "count": 1,
        "name": "UpperTheory.EveryCharacter._proof_1"
      }
    ]
  },
  "record": {
    "fields": [
      [
        "caraianiLocalGlobalDual",
        "_root_.UpperTheory.One.M.Row"
      ],
      [
        "localLanglandsExists",
        "_root_.UpperTheory.Zero.LLC.RecTExists"
      ],
      [
        "galoisRepOfPolarizedPairLit",
        "_root_.UpperTheory.One.M.Row"
      ]
    ],
    "constructorOwnerAvailable": false,
    "recordPath": null,
    "recursorPath": null,
    "recursorIncoming": [
      {
        "role": "package",
        "slot": 5,
        "target": 550025,
        "kind": "rec",
        "encoded": -550026,
        "name": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements.rec"
      }
    ],
    "rhsExpressionRoot": 12992065,
    "rhs": [
      {
        "role": "rhs",
        "slot": 3,
        "target": 550010,
        "kind": "explicit_const",
        "witness": 12992044,
        "count": 1,
        "name": "UpperTheory.Zero.LLC.RecTExists"
      },
      {
        "role": "rhs",
        "slot": 3,
        "target": 549946,
        "kind": "explicit_const",
        "witness": 12992043,
        "count": 1,
        "name": "UpperTheory.One.M.Row"
      },
      {
        "role": "rhs",
        "slot": 3,
        "target": 550021,
        "kind": "explicit_const",
        "witness": 12992050,
        "count": 1,
        "name": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements.mk"
      },
      {
        "role": "rhs",
        "slot": 3,
        "target": 550020,
        "kind": "explicit_const",
        "witness": 12992045,
        "count": 1,
        "name": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements"
      }
    ],
    "package": [
      {
        "role": "package",
        "slot": 1,
        "target": 550020,
        "kind": "inductive",
        "encoded": -550021,
        "name": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements"
      },
      {
        "role": "package",
        "slot": 2,
        "target": 550021,
        "kind": "ctor",
        "encoded": -550022,
        "name": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements.mk"
      },
      {
        "role": "package",
        "slot": 4,
        "target": 550020,
        "kind": "inductive",
        "encoded": -550021,
        "name": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements"
      }
    ],
    "type": [
      {
        "role": "type",
        "slot": 0,
        "target": 550020,
        "kind": "explicit_const",
        "witness": 12992045,
        "count": 1,
        "name": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements"
      },
      {
        "role": "type",
        "slot": 0,
        "target": 550021,
        "kind": "explicit_const",
        "witness": 12992050,
        "count": 1,
        "name": "UpperTheory.LiteratureTheorems.OpenLiteratureStatements.mk"
      },
      {
        "role": "type",
        "slot": 0,
        "target": 550010,
        "kind": "explicit_const",
        "witness": 12992044,
        "count": 1,
        "name": "UpperTheory.Zero.LLC.RecTExists"
      },
      {
        "role": "type",
        "slot": 0,
        "target": 549946,
        "kind": "explicit_const",
        "witness": 12992043,
        "count": 1,
        "name": "UpperTheory.One.M.Row"
      }
    ],
    "nameOnlyTargets": [
      549946,
      550010,
      550020,
      550021
    ],
    "wholeRhsErasureUndetected": true
  },
  "imports": [
    4,
    208
  ]
}
*/
function audit(docs,src){
 let checks=0,neg=0;const ck=(x,m)=>{if(!x)throw Error(m);checks++},eq=(a,b)=>JSON.stringify(a)===JSON.stringify(b),sort=x=>[...x].sort((a,b)=>a-b),uniq=x=>sort(new Set(x)),owners=new Map(),g=new Map();
 for(const d of docs){ck(d.digest==="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e"&&d.n===1065214335&&d.root===14065054,"archive");for(const r of d.reports){ck(!owners.has(r.id),"duplicate owner");owners.set(r.id,r);let es=[];const add=(role,z,slot)=>{if(!z)return;let n=0;for(const e of z.references){ck(Number.isSafeInteger(e.witnessExpression)&&e.witnessExpression>=0&&e.witnessExpression<=z.expressionRoot&&e.distinctExpressionRecords>0,"expression");n+=e.distinctExpressionRecords;es.push({role,slot,target:e.target,kind:e.kind,witness:e.witnessExpression,count:e.distinctExpressionRecords,name:e.nameParts.join(".")})}ck(n===z.referenceOccurrences,"count")};add("type",r.type,0);add("value",r.value,1);for(const s of r.structural??[]){ck(r.encodedRootsAndStructuralEdges[s.edgeIndex]===s.encoded,"slot");if(s.encoded>0){ck(r.kind==="rec"&&s.kind==="recursor_rule_rhs"&&s.encoded===s.expression.expressionRoot+1,"rhs root");add("rhs",s.expression,s.edgeIndex)}else{ck(s.target===-s.encoded-1,"package target");es.push({role:"package",slot:s.edgeIndex,target:s.target,kind:s.kind,encoded:s.encoded,name:s.nameParts.join(".")})}}g.set(r.id,es)}}
 const every=owners.get(326947),aux=owners.get(326948),record=owners.get(550020),rec=owners.get(550025);
 ck(every.kind==="def"&&aux.kind==="thm"&&record.kind==="inductive"&&rec.kind==="rec","named kinds");
 const auxEdges=g.get(aux.id),recEdges=g.get(rec.id),parent=g.get(every.id).filter(e=>e.target===aux.id);
 ck(parent.length===1&&parent[0].role==="value"&&parent[0].witness===6102670,"aux incoming");
 const t=auxEdges.filter(e=>e.role==="type"),v=auxEdges.filter(e=>e.role==="value");
 ck(eq([t.length,v.length,aux.type.referenceOccurrences,aux.value.referenceOccurrences],[8,6,8,7]),"aux census");
 ck(t.some(e=>e.name==="Nat.AtLeastTwo")&&v.some(e=>e.name==="Nat.instAtLeastTwoHAddOfNat")&&v.some(e=>e.name==="Nat.instNeZeroSucc"),"aux instance evidence");
 ck(!auxEdges.some(e=>e.name.includes("LFunction")||e.name.includes("DirichletCharacter")),"no direct L-function references");
 const line=src[0].split("\n").find(l=>l.includes("∀ (N : ℕ)"));ck(line?.includes("[NeZero N]")&&line.includes("1 / 2 < s.re")&&line.includes("(χ ≠ 1 ∨ s ≠ 1)")&&line.includes("DirichletCharacter.LFunction χ s ≠ 0"),"source guard");
 ck(!src[0].includes("EveryCharacter._proof_1"),"generated name absent");
 const ls=src[1].split("\n"),i=ls.findIndex(l=>l==="structure UpperTheory.LiteratureTheorems.OpenLiteratureStatements : Prop where"),fields=ls.slice(i+1,i+4).map(l=>l.trim().split(" : "));
 ck(eq(fields,[["caraianiLocalGlobalDual","_root_.UpperTheory.One.M.Row"],["localLanglandsExists","_root_.UpperTheory.Zero.LLC.RecTExists"],["galoisRepOfPolarizedPairLit","_root_.UpperTheory.One.M.Row"]]),"three ordered source fields");
 ck(!ls[i+4].startsWith("  "),"field boundary");
 const rhs=recEdges.filter(e=>e.role==="rhs"),rt=recEdges.filter(e=>e.role==="type"),pkg=recEdges.filter(e=>e.role==="package");
 ck(eq([rt.length,rhs.length,pkg.length],[4,4,3]),"rec census");
 ck(eq(rec.encodedRootsAndStructuralEdges,[12992061,-550021,-550022,12992066,-550021]),"rec slots");
 const sig=e=>JSON.stringify([e.kind,e.target,e.witness,e.count]);ck(eq(rt.map(sig).sort(),rhs.map(sig).sort()),"type RHS witnesses identical");
 ck(eq(uniq(rhs.map(e=>e.target)),[549946,550010,550020,550021]),"rhs targets");
 ck(g.get(record.id).some(e=>e.role==="package"&&e.slot===5&&e.target===rec.id),"rec incoming");
 const base=uniq(recEdges.map(e=>e.target)),noRhs=recEdges.filter(e=>e.role!=="rhs");
 ck(eq(base,uniq(noRhs.map(e=>e.target))),"whole RHS masked");
 const roleSig=e=>JSON.stringify([e.role,e.slot,e.target,e.kind,e.witness??null,e.count??null,e.encoded??null]);
 const exact=(a,b)=>eq(a.map(roleSig).sort(),b.map(roleSig).sort());
 for(const mutated of [noRhs,recEdges.filter((e,i)=>i!==recEdges.findIndex(q=>q.role==="rhs")),recEdges.map(e=>e.role==="rhs"?{...e,role:"type",slot:0}:e),recEdges.map(e=>e.role==="rhs"&&e.target===550010?{...e,witness:e.witness-1}:e),recEdges.filter(e=>!(e.role==="package"&&e.slot===4))]){ck(!exact(recEdges,mutated),"reject lossy reconstruction");neg++}
 const predecessor=new Map([[14065054,null]]),q=[14065054];for(let j=0;j<q.length;j++)for(const e of g.get(q[j])??[]){if(!predecessor.has(e.target)){predecessor.set(e.target,{owner:q[j],...e});q.push(e.target)}}
 function path(id){if(!predecessor.has(id))return null;let p=[];while(predecessor.get(id)){const e=predecessor.get(id);p.push(e);id=e.owner}return p.reverse()}
 return {checks,negative:neg,owners:owners.size,observedReachable:q.length,aux:{id:aux.id,sourceLine:line.trim(),incoming:parent[0],type:t,value:v,rootPath:path(aux.id)},record:{fields,constructorOwnerAvailable:owners.has(550021),recordPath:path(record.id),recursorPath:path(rec.id),recursorIncoming:g.get(record.id).filter(e=>e.target===rec.id),rhsExpressionRoot:rec.structural.find(e=>e.kind==="recursor_rule_rhs").expression.expressionRoot,rhs,package:pkg,type:rt,nameOnlyTargets:base,wholeRhsErasureUndetected:true},imports:src.map(s=>s.split("\n").filter(l=>l.startsWith("import ")).length)};
}
import fs from 'node:fs';
import crypto from 'node:crypto';
const hashes=["64b935e4ef309f6c555912a377012c7708eda510","d04e0fb24160d3ee1be54cd50082f59526864d4e","d823c364f446f5066dbbc61f7e9cf9c891fcbdb2","6ac769568b67f85f33565ba3e1eef7b91f53c55f","a13ba1f8c38d4dbf2ddd809fbf9610a007936c24"];
const args=process.argv.slice(2);if(args.length!==5)throw Error('usage: node run16_aux_and_recursor_certificate.mjs direct.json next.json literature.json EveryCharacter.lean EveryCharacterOfLiteratureOfVWin.lean');
const data=args.map((p,i)=>{const b=fs.readFileSync(p);const sha=crypto.createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex');if(sha!==hashes[i])throw Error('blob mismatch '+p);return b.toString('utf8')});
const actual=audit(data.slice(0,3).map(JSON.parse),data.slice(3));const expected={"checks":5235,"negative":5,"owners":95,"observedReachable":134,"aux":{"id":326948,"sourceLine":"∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N) (s : ℂ), 1 / 2 < s.re → (χ ≠ 1 ∨ s ≠ 1) → DirichletCharacter.LFunction χ s ≠ 0","incoming":{"role":"value","slot":1,"target":326948,"kind":"explicit_const","witness":6102670,"count":1,"name":"UpperTheory.EveryCharacter._proof_1"},"type":[{"role":"type","slot":0,"target":61,"kind":"literal_primitive","witness":1061,"count":1,"name":"Nat"},{"role":"type","slot":0,"target":169,"kind":"explicit_const","witness":927,"count":1,"name":"instOfNatNat"},{"role":"type","slot":0,"target":61,"kind":"explicit_const","witness":316,"count":1,"name":"Nat"},{"role":"type","slot":0,"target":80,"kind":"explicit_const","witness":924,"count":1,"name":"OfNat.ofNat"},{"role":"type","slot":0,"target":824,"kind":"explicit_const","witness":3851,"count":1,"name":"instAddNat"},{"role":"type","slot":0,"target":40,"kind":"explicit_const","witness":3849,"count":1,"name":"instHAdd"},{"role":"type","slot":0,"target":37,"kind":"explicit_const","witness":3845,"count":1,"name":"HAdd.hAdd"},{"role":"type","slot":0,"target":4685,"kind":"explicit_const","witness":36206,"count":1,"name":"Nat.AtLeastTwo"}],"value":[{"role":"value","slot":1,"target":61,"kind":"literal_primitive","witness":389,"count":2,"name":"Nat"},{"role":"value","slot":1,"target":169,"kind":"explicit_const","witness":927,"count":1,"name":"instOfNatNat"},{"role":"value","slot":1,"target":61,"kind":"explicit_const","witness":316,"count":1,"name":"Nat"},{"role":"value","slot":1,"target":80,"kind":"explicit_const","witness":924,"count":1,"name":"OfNat.ofNat"},{"role":"value","slot":1,"target":4770,"kind":"explicit_const","witness":44331,"count":1,"name":"Nat.instNeZeroSucc"},{"role":"value","slot":1,"target":4764,"kind":"explicit_const","witness":44329,"count":1,"name":"Nat.instAtLeastTwoHAddOfNat"}],"rootPath":[{"owner":14065054,"role":"value","slot":1,"target":14065053,"kind":"explicit_const","witness":1065212062,"count":1,"name":"rhOfAll"},{"owner":14065053,"role":"value","slot":1,"target":14065052,"kind":"explicit_const","witness":1065212060,"count":1,"name":"allChi"},{"owner":14065052,"role":"type","slot":0,"target":326947,"kind":"explicit_const","witness":6497236,"count":1,"name":"UpperTheory.EveryCharacter"},{"owner":326947,"role":"value","slot":1,"target":326948,"kind":"explicit_const","witness":6102670,"count":1,"name":"UpperTheory.EveryCharacter._proof_1"}]},"record":{"fields":[["caraianiLocalGlobalDual","_root_.UpperTheory.One.M.Row"],["localLanglandsExists","_root_.UpperTheory.Zero.LLC.RecTExists"],["galoisRepOfPolarizedPairLit","_root_.UpperTheory.One.M.Row"]],"constructorOwnerAvailable":false,"recordPath":null,"recursorPath":null,"recursorIncoming":[{"role":"package","slot":5,"target":550025,"kind":"rec","encoded":-550026,"name":"UpperTheory.LiteratureTheorems.OpenLiteratureStatements.rec"}],"rhsExpressionRoot":12992065,"rhs":[{"role":"rhs","slot":3,"target":550010,"kind":"explicit_const","witness":12992044,"count":1,"name":"UpperTheory.Zero.LLC.RecTExists"},{"role":"rhs","slot":3,"target":549946,"kind":"explicit_const","witness":12992043,"count":1,"name":"UpperTheory.One.M.Row"},{"role":"rhs","slot":3,"target":550021,"kind":"explicit_const","witness":12992050,"count":1,"name":"UpperTheory.LiteratureTheorems.OpenLiteratureStatements.mk"},{"role":"rhs","slot":3,"target":550020,"kind":"explicit_const","witness":12992045,"count":1,"name":"UpperTheory.LiteratureTheorems.OpenLiteratureStatements"}],"package":[{"role":"package","slot":1,"target":550020,"kind":"inductive","encoded":-550021,"name":"UpperTheory.LiteratureTheorems.OpenLiteratureStatements"},{"role":"package","slot":2,"target":550021,"kind":"ctor","encoded":-550022,"name":"UpperTheory.LiteratureTheorems.OpenLiteratureStatements.mk"},{"role":"package","slot":4,"target":550020,"kind":"inductive","encoded":-550021,"name":"UpperTheory.LiteratureTheorems.OpenLiteratureStatements"}],"type":[{"role":"type","slot":0,"target":550020,"kind":"explicit_const","witness":12992045,"count":1,"name":"UpperTheory.LiteratureTheorems.OpenLiteratureStatements"},{"role":"type","slot":0,"target":550021,"kind":"explicit_const","witness":12992050,"count":1,"name":"UpperTheory.LiteratureTheorems.OpenLiteratureStatements.mk"},{"role":"type","slot":0,"target":550010,"kind":"explicit_const","witness":12992044,"count":1,"name":"UpperTheory.Zero.LLC.RecTExists"},{"role":"type","slot":0,"target":549946,"kind":"explicit_const","witness":12992043,"count":1,"name":"UpperTheory.One.M.Row"}],"nameOnlyTargets":[549946,550010,550020,550021],"wholeRhsErasureUndetected":true},"imports":[4,208]};if(JSON.stringify(actual)!==JSON.stringify(expected))throw Error('replay mismatch');console.log(JSON.stringify(actual,null,2));

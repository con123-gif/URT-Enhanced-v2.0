# RUN19 — exact generated TLiftK obligations and raw role conservation
2026-11-25. PARTIAL / AUTHENTICATED EXPORTED EXPRESSIONS, independent V8 traversal executed; NOT kernel replay. Pinned source 40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream b2f365a68500e2bde98cd60a2324263fc62fba10 unchanged since RUN18; not adopted. Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, state/log/continuity excerpts, CI #406 and latest 14 peer handoffs (excerpts); blueprint not reopened. Integration 4f08b858 owns geometry-lift Row0; no duplicate. Post34 compute status unavailable (404). No unrelated physics edits.

## Actual archive result
RUN18 native compute job https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45516076429 completed exit 0, wall 2251.17 s, status blob 17c472d2312327601268339c9b1f6f3c81ac2534. It hashed all 61,570,595,788 bytes, stored 10,510,351,673 bytes compressed under 10 GiB cap, reached latest root before cap, no unresolved roots. Output compute/rh-bounded-raw-scope-20261125/outputs/selected_raw_scope.json, blob 63c3592e4b3997433e5e0af910eddf6137cdac69, SHA256 47db485f1c648d3d1a39de78ad69ff62583b433fc2d3793241b7d96532fd95b1. Native report has 969 assertions, all 14 roots, 256 unique expression nodes, 276 independent scoped states. This run independently checks the retrieved genuine output rather than rescanning the archive. Blob IDs verified via connector, raw bytes not rehashed in V8; CLI below verifies Git blob hashes.

## Human obligations recovered
Let E be a type with Field and NumberField instances, F = maximalRealSubfield E, O = RingOfIntegers F, A = Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes.AF F. All four generated declarations quantify exactly E, [Field E], [NumberField E] (no IsCMField binder in these auxiliary terms). They supply:
1. NumberField F, by NumberField.of_subfield E applied to the actual subfield. Type/value roots 9078396 / 9078404, bodies 9078393 / 9078401.
2. IsDedekindDomain O, by NumberField.RingOfIntegers.instIsDedekindDomain F fieldF (NumberField.of_subfield ...). Roots 9838915 / 9838921, bodies 9838912 / 9838918.
3. IsFractionRing O F, by NumberField.RingOfIntegers.instIsFractionRing with the same F and number-field instance. Roots 9838937 / 9838943, bodies 9838934 / 9838940.
4. SMulCommClass F A A, by Algebra.to_smulCommClass with algebra F→A and semiring instances. Roots 997980875 / 997980883, bodies 997980872 / 997980880. Its type explicitly uses all three preceding generated proofs (witnesses 997980830, 997980839, 997980846); its value constructs the corresponding instances via their suppliers rather than those generated theorem names. Exact AF reference 560935, expression 13430270; type-level A expression 997980834 uses proof1, while value-level A 997980876 uses NumberField.of_subfield. Type-level scalar action 997980864 derives from Algebra.toSMul; second action 997980871 from instSMulOfMul / Distrib.toMul / instDistribOfSemiring. Value arguments [9078386,997980876,9838930,9841530,9841535] retained; do not claim definitional equality checked.
Source src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/HalfIndexLattices/TLiftK.lean, pinned blob 4b36fc43e988270944cef2fc1b5e9ee1493fc275, L18–19 contains two distinct ResEtaPow guards (chiX n and chiW d) using exactly Units.map (algebraMap F (AF F)).toMonoidHom. These typeclass obligations explain the ambient algebra; caller expression of TLiftK itself was NOT part of this slice, so exact assignment of each generated proof to each Units.map occurrence remains open. Neither guard may be discarded. This is not the theta-lift theorem or proof of any of its analytic premises.

Additional exact recoveries: EveryCharacter._proof_1 : Nat.AtLeastTwo (1+1), supplied by Nat.instAtLeastTwoHAddOfNat 1 (Nat.instNeZeroSucc 0); explicit typeclass args retained in raw record. OpenLiteratureStatements.mk takes ordered fields Row, RecTExists, Row, with distinct names caraianiLocalGlobalDual, localLanglandsExists, galoisRepOfPolarizedPairLit; recursor motive M: OpenLiteratureStatements→Sort u, method m : ∀ a b c, M(mk a b c), t:OpenLiteratureStatements; returns M(t), computation rhs m a b c, raw application 3107. No field collapsed.

## Executed independent certificate
{"checks":2059,"roles":14,"edges":862,"referenceOccurrences":148,"uniqueNodes":256,"generatedProofs":4,"negatives":5}. Rewalk raw children, compare exact per-role tagged reference groups, witness membership and multiplicities with report, verify selected ordered applications and all four binder spines. Mutation controls: dropped AF record, swapped application order, altered instance binder, removed reference group, changed constructor field. Initial control driver used body ID instead of type root for selecting the report; fixed to 997980875 and reran. Proof of scope-limited reference preservation: structural recursion enumerates all ordered child edges in a finite acyclic expression DAG, visits each expression record once per role; every explicit constant and Nat literal is counted by kind and target; equality of the resulting groups and multiplicities plus witness membership rejects missing groups/records relative to these inputs. This is not a universal equivalence proof of a human paraphrase, occurrence-path multiplicity, or fresh axiom census. No URT improvement claimed. No Lean executable invoked this run.

Reproduce: save following code as run19.mjs; node run19.mjs selected_raw_scope.json TLiftK.lean. Both inputs pinned by Git blob hashes.
```js
import fs from "node:fs";
import crypto from "node:crypto";
function verify(d,source){
 let checks=0;const ck=(x,m)=>{if(!x)throw Error(m+" at "+checks);checks++};const eq=(a,b,m)=>ck(JSON.stringify(a)===JSON.stringify(b),m);
 ck(d.pin==="40e56bab026552e089d7afcfeff08d2defb9c005"&&d.archiveDigest==="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e"&&!d.partial&&d.unresolved.length===0,"identity");
 let a=new Map(d.records.ie.map(([i,s])=>[i,JSON.parse(s)])),names=new Map(d.scope.nameTable);
 ck(a.size===d.records.ie.length&&a.size===256&&d.selected.length===14,"records");
 function kids(e){if(e.app)return [e.app.fn,e.app.arg];if(e.forallE||e.lam){let z=e.forallE||e.lam;return [z.type,z.body]}if("bvar"in e||"sort"in e||e.const||"natVal"in e)return [];throw Error("unknown tag")}
 let roles=0,edges=0,occ=0;
 for(const r of d.selected){let seen=new Set,stack=[r.expressionRoot],refs=new Map,ed=0;
  while(stack.length){let i=stack.pop();if(seen.has(i))continue;seen.add(i);let e=a.get(i);ck(e&&e.ie===i,"node");let ch=kids(e);for(let j of ch){ck(j<i,"ordered child");stack.push(j)}ed+=ch.length;
   let ref=e.const?["explicit_const",e.const.name]:"natVal"in e?["literal_primitive",61]:null;
   if(ref){let k=JSON.stringify(ref);if(!refs.has(k))refs.set(k,[]);refs.get(k).push(i)}
  }
  eq(seen.size,r.expressionsRead,"node count");eq(ed,r.childEdges,"edge count");eq(refs.size,r.references.length,"reference groups");let count=0;
  for(let x of r.references){let k=JSON.stringify([x.kind,x.target]),ids=refs.get(k);ck(ids&&ids.includes(x.witnessExpression),"witness");eq(ids.length,x.distinctExpressionRecords,"multiplicity");eq(names.get(x.target),x.nameParts,"tagged name");count+=ids.length;refs.delete(k)}
  eq(count,r.referenceOccurrences,"occurrence count");ck(refs.size===0,"no omitted group");roles++;edges+=ed;occ+=count;
 }
 function spine(i){let args=[];while(a.get(i).app){let z=a.get(i).app;args.unshift(z.arg);i=z.fn}let e=a.get(i);return {head:e.const?e.const.name:"bvar"in e?"$"+e.bvar:i,args}}
 function shape(i,head,args){eq(spine(i),{head,args},"ordered application "+i)}
 const roots=[[9078396,9078404,9078393,9078401],[9838915,9838921,9838912,9838918],[9838937,9838943,9838934,9838940],[997980875,997980883,997980872,997980880]];
 for(let [t,v,tb,vb] of roots){for(let [id,kind,body] of [[t,"forallE",tb],[v,"lam",vb]]){for(let [type,info] of [[315,"default"],[2200840,"instImplicit"],[8711353,"instImplicit"]]){let z=a.get(id)[kind];ck(z&&z.type===type&&z.binderInfo===info,"binder");id=z.body}eq(id,body,"body")}}
 shape(9078393,341190,[9078386,9078392]);shape(9078401,435583,[13,2,1,9078391]);
 shape(9838912,348070,[9838908,9838911]);shape(9838918,417457,[9078386,9078392,9078401]);
 shape(9838934,360211,[9838908,9838924,9078386,9838930,9838933]);shape(9838940,417477,[9078386,9078392,9078401]);
 shape(997980872,110448,[9078386,997980834,997980834,997980864,997980871]);shape(997980834,560935,[9078386,9078392,997980833]);shape(997980833,13125906,[13,2,1]);shape(997980842,13125937,[13,2,1]);shape(997980849,13125938,[13,2,1]);shape(997980880,164561,[9078386,997980876,9838930,9841530,9841535]);shape(997980876,560935,[9078386,9078392,9078401]);
 shape(1025073,4685,[44372]);shape(44372,37,[316,316,316,3852,1064,1064]);shape(44333,4764,[1064,44332]);
 let t=12992048;for(let x of [12992043,12992044,12992043]){let z=a.get(t).forallE;eq(z.type,x,"constructor field");t=z.body}eq(t,12992045,"constructor result");
 shape(3107,"$3",[13,2,1]);
 ck(source.includes("def TLiftK : Prop :="),"source header");
 eq(source.split("\n").filter(x=>x.includes("ResEtaPow (Units.map (algebraMap (maximalRealSubfield E) (AF (maximalRealSubfield E))).toMonoidHom).range")).length,2,"two source occurrences");
 return {checks,roles,edges,referenceOccurrences:occ,uniqueNodes:a.size,generatedProofs:4};
}
function tests(d,s){const result=verify(d,s);let negatives=0;for(const change of [x=>x.records.ie=x.records.ie.filter(z=>z[0]!==997980834),x=>{let z=x.records.ie.find(z=>z[0]===997980872);let e=JSON.parse(z[1]);[e.app.arg,e.app.fn]=[e.app.fn,e.app.arg];z[1]=JSON.stringify(e)},x=>{let z=x.records.ie.find(z=>z[0]===997980874);let e=JSON.parse(z[1]);e.forallE.binderInfo="default";z[1]=JSON.stringify(e)},x=>{x.selected.find(z=>z.expressionRoot===997980875).references.pop()},x=>{let z=x.records.ie.find(z=>z[0]===12992047);let e=JSON.parse(z[1]);e.forallE.type=12992043;z[1]=JSON.stringify(e)}]){let q=JSON.parse(JSON.stringify(d));change(q);try{verify(q,s)}catch(e){negatives++;continue}throw Error("negative accepted")}return {...result,negatives}}
const [p,s]=process.argv.slice(2);
function read(p,h){const b=fs.readFileSync(p);if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==h)throw Error("blob "+p);return b.toString("utf8")}
console.log(tests(JSON.parse(read(p,"63c3592e4b3997433e5e0af910eddf6137cdac69")),read(s,"4b36fc43e988270944cef2fc1b5e9ee1493fc275")));
```
RESUME HERE: request the actual TLiftK definition type/value roots from authenticated manifest and extract its caller expression with both Units.map witnesses; bind the four auxiliary proofs to exact occurrence paths, rather than inferring from source lines. Reuse existing raw slice or peer offsets; do not repeat all 61.57 GB unnecessarily. HANDOFF TO integration, editor, theta, Galois, dependencies, acceleration, audit. Full RH reconstruction OPEN.

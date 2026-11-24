// RUN13 — independent replay of native two-import fixture, 2026-11-24.
// Run node run13_downstream_replay.mjs PATH_TO_cathedral-research-state_CHECKOUT
// Original RH pin 40e56bab026552e089d7afcfeff08d2defb9c005; Main dbd5db70bc11b35f18fa5751216ab335321e7bfc.
// HEAD 9282d3a102c4aff0e6026746db2a8990f5d9cddd, +134 commits from 307cef33f046955ee79dba47e0d828d06496d75f;
// Main and toolchain blobs unchanged since last observed head (67c65badc15f80a1db65df1c84dc7a4928fc410f, 0e037f58f9a1aa2d5139277bcc4be0061ebeeb05).
// No whole-revision equivalence. Never join cross-revision identities.
// Native run https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45456786809 (driver c251ffa4df2f5995271852c05585554960cc56d0).
// Actual audit executed on connector-retrieved blobs in V8. First attempt failed because local log used namespace-relative guardProp; corrected exact expected spelling.
// Node filesystem/hash wrapper not executed here. Native job itself passed in 23.29 s.
// Output: {"status":"NATIVE_FIXTURE_GRAPH_REPLAY_NOT_NEW_LEAN_RUN","checks":1212,"negative":2,"roots":9,"uniqueDeclarations":19,"combinedOmissions":["CathedralAxiomCycle.Witness.plain"],"alias":{"root":"CathedralAxiomCycleDownstream.aliasPlain","type":[{"name":"CathedralAxiomCycle.Witness","exact":["CathedralAxiomCycle.guardProp"],"reported":["CathedralAxiomCycle.guardProp"]}],"value":[{"name":"CathedralAxiomCycle.Witness.plain","exact":["CathedralAxiomCycle.guardProp"],"reported":[]}],"core":["CathedralAxiomCycle.guardProp"],"reported":["CathedralAxiomCycle.guardProp"]},"viaConsumer":{"root":"CathedralAxiomCycleThird.viaConsumer","type":[{"name":"Nat","exact":[],"reported":null}],"value":[{"name":"CathedralAxiomCycleDownstream.consume","exact":["CathedralAxiomCycle.guardProp"],"reported":["CathedralAxiomCycle.guardProp"]},{"name":"CathedralAxiomCycle.Witness.plain","exact":["CathedralAxiomCycle.guardProp"],"reported":[]}],"core":["CathedralAxiomCycle.guardProp"],"reported":["CathedralAxiomCycle.guardProp"]}}
// For a complete finite role graph, each nontrivial path begins with an outgoing edge;
// union of all successor closures plus the root gives full reachability. Axiom union equality
// does not imply edge equality: deleting plain from either of two actual operand sets leaves axiom union unchanged.
// aliasPlain masks omission across type/value; viaConsumer : Nat masks omission within value (consume and plain).
// No new combined omission among six tested downstream definitions. No claim of Lean kernel unsoundness,
// logical necessity of every reached axiom, full RH recheck, or URT-specific improvement.
// Preflight: AGENTS, swarm/queue/15 lanes, continuity, state/log/protocol excerpts, CI summary, latest peer handoffs,
// RUN12, acceleration RUN13 and combined projection commit identities reviewed; not all peer source code.
// RESUME HERE: audit combined 47-target authenticated role projection after its compute output exists;
// compare each immediate operand and retain exact tagged role edges, never infer them from axiom unions.
// HANDOFF TO dependencies, acceleration, integration, audit, editor, specialists. Project OPEN.
import {readFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {join} from 'node:path';
const pins={
  "status.json": "1cd334edc47eb40fd8babd96ace1baa5f8348860",
  "outputs/Witness.jsonl": "38d4822594b4c229c015cf5b5751d244840a05fc",
  "outputs/plain.jsonl": "e5096a6d88ffc80f98fdc73c75f9f67f73b9f41d",
  "outputs/guarded.jsonl": "b38a6d4a99f22080da02b8f1bf7c060beac4999e",
  "outputs/aliasPlain.jsonl": "64fb835558293088e5a6ac4499042c5a0b7b2a29",
  "outputs/consume.jsonl": "95126d9313a3daa9599dbfac7c2be979643edeb9",
  "outputs/guardTag.jsonl": "6c3c484c3e63697756d01428fc36ee0ddf52d47e",
  "outputs/cleanTag.jsonl": "7f542b4fbba5110ada29faea7c8aeef26e48f2ef",
  "outputs/aliasAgain.jsonl": "82f3565a2dc5c726aef2e4d25ae08ae1a3f645f5",
  "outputs/viaConsumer.jsonl": "30a2206d3f9cc4ec2fa6347da0d9a6a0d38b2bf2",
  "outputs/downstream_result.json": "6030f8bc633ace9ec6c1b220c0b71f6e945c81be",
  "outputs/base.log": "347437e1d611ee083544014154156b546862bef4",
  "outputs/imported.log": "6a6dadd5fea09cfbd3e24c929cb0e5869739acef",
  "outputs/downstream_local.log": "b2697755f95b5aff01c3a78f8862b60c82f48465",
  "outputs/third_local.log": "92efa5e7b9268a07a7bd7dcd7ea362b4d6a8271d",
  "outputs/AxiomCycleBase.lean": "5f35a7222275457208eb8c65ffb7ff304a9dddba",
  "outputs/AxiomCycleDownstream.lean": "d784de522e03f20982c7460a5fbe97301a442b95",
  "outputs/AxiomCycleThird.lean": "57592200731f235a125c58b059075e15b0760a93"
};
function audit(b){
 let checks=0,negative=0;const ok=(x,m)=>{if(!x)throw Error(m);checks++},eq=(a,b,m)=>ok(JSON.stringify(a)===JSON.stringify(b),m),k=JSON.stringify,s=n=>n.map(x=>x[1]).join("."),uniq=a=>[...new Set(a)].sort();
 const roles=["type_constants","type_literals","type_projections","value_constants","value_literals","value_projections","constructors","parent","group","rules","quotient_package","mutual_block"], st=JSON.parse(b["status.json"]), data=JSON.parse(b["outputs/downstream_result.json"]);
 eq(st.status,"pass","status");eq(st.returncode,0,"return");ok(st.tail.includes("0b77e12952ad39077d80d8bd6b66d601f225c321"),"compiler");
 const log=f=>{const m=new Map();for(const l of b["outputs/"+f].trim().split("\n")){const a=l.match(/^'([^']+)' (?:depends on axioms: \[(.*?)\]|does not depend on any axioms)$/);ok(a,"log syntax");ok(!m.has(a[1]),"duplicate report");m.set(a[1],a[2]?a[2].split(", ").sort():[])}return m};
 const imp=log("imported.log"),loc=new Map([...log("downstream_local.log"),...log("third_local.log")]),base=log("base.log"),rows=[],all=new Map(),graphs=new Map();
 for(const f of Object.keys(b).filter(f=>f.endsWith(".jsonl"))){
  const a=b[f].trim().split("\n").map(JSON.parse),h=a[0],foot=a.at(-1),ns=a.slice(1,-1),m=new Map(ns.map(n=>[k(n.id),n]));
  eq(h.schema,"cathedral-kernel-v2","schema");eq(foot.record,"footer","footer");eq(foot.missing,0,"missing");eq(foot.nodes,ns.length,"count");eq(m.size,ns.length,"duplicates");
  const edges=n=>roles.flatMap(role=>n[role].map(k));
  for(const n of ns){eq(n.record,"node","record");eq(n.display,s(n.id),"identity");ok(!n.unsafe&&!n.partial,"unsafe/partial");for(const role of roles)ok(Array.isArray(n[role]),"role missing");for(const e of edges(n))ok(m.has(e),"unresolved edge "+e);if(all.has(k(n.id)))eq(n,all.get(k(n.id)),"cross-export conflict");else all.set(k(n.id),n)}
  const closure=seeds=>{let seen=new Set(),q=[...seeds],ax=[];for(let i=0;i<q.length;i++){const id=q[i];if(seen.has(id))continue;seen.add(id);const n=m.get(id);if(!n)throw Error("missing vertex");if(n.kind==="axiom")ax.push(n.display);q.push(...edges(n))}return {seen,ax:uniq(ax)}};
  const root=m.get(k(h.root));ok(root,"root");const full=closure([k(h.root)]);eq(full.seen.size,m.size,"extraneous nodes");
  const t=root.type_constants,v=root.value_constants,row=data.rows.find(x=>x.root===root.display);ok(row,"native row");eq(t,row.typeDirect,"type direct");eq(v,row.valueDirect,"value direct");eq(closure([...t,...root.type_literals,...root.type_projections].map(k)).ax,row.typeAxioms,"type");eq(closure([...v,...root.value_literals,...root.value_projections].map(k)).ax,row.valueAxioms,"value");eq(full.ax,row.coreAxioms,"core");eq(imp.get(root.display),row.builtinImported,"imported");eq(uniq(h.lean_collect_axioms.map(s)),row.builtinImported,"header");if(loc.has(root.display))eq(loc.get(root.display),row.builtinLocal,"local");
  for(const w of row.coreAxiomPaths){eq(w.path[0],root.display,"path start");eq(w.path.at(-1),w.name,"path end");for(let i=0;i+1<w.path.length;i++){const x=ns.find(n=>n.display===w.path[i]),y=ns.find(n=>n.display===w.path[i+1]);ok(x&&y&&edges(x).includes(k(y.id)),"path hop")}ok(full.ax.includes(w.name),"path axiom")}
  const operands=ids=>ids.map(id=>({name:s(id),exact:closure([k(id)]).ax,reported:imp.has(s(id))?imp.get(s(id)):null}));
  rows.push({root:root.display,type:operands(t),value:operands(v),core:full.ax,reported:row.builtinImported});graphs.set(root.display,{root,closure});
 }
 eq(rows.length,9,"root count");eq(imp.size,9,"report count");
 const W="CathedralAxiomCycle.Witness",P=W+".plain",G="CathedralAxiomCycle.guardProp",A="CathedralAxiomCycleDownstream.aliasPlain",C="CathedralAxiomCycleDownstream.consume",V="CathedralAxiomCycleThird.viaConsumer",find=n=>rows.find(x=>x.root===n);
 // Local #print uses the namespace-relative spelling; exact raw log is retained.
 eq(base.get(P),["guardProp"],"base local plain");eq(find(P).reported,[],"imported plain");eq(find(P).core,[G],"plain exact");
 eq(find(A).type,[{name:W,exact:[G],reported:[G]}],"alias type mask");eq(find(A).value,[{name:P,exact:[G],reported:[]}],"alias value missing");eq(find(A).reported,[G],"alias combined");
 eq(find(V).type,[{name:"Nat",exact:[],reported:null}],"consumer type clean");eq(find(V).value.map(x=>x.name),[C,P],"consumer operands");eq(find(V).value.map(x=>x.exact),[[G],[G]],"both paths");eq(find(V).value.map(x=>x.reported),[[G],[]],"within value mask");eq(find(V).reported,[G],"consumer combined");
 const omissions=rows.filter(x=>k(x.core)!==k(x.reported)).map(x=>x.root);eq(omissions,[P],"only combined omission");
 for(const name of [A,V]){const {root,closure}=graphs.get(name),mut=root.value_constants.filter(id=>s(id)!==P);eq(closure([...root.type_constants,...root.value_constants].map(k)).ax,closure([...root.type_constants,...mut].map(k)).ax,"mutation same axiom union");ok(k(mut)!==k(root.value_constants),"role list rejects mutation");negative++}
 return {status:"NATIVE_FIXTURE_GRAPH_REPLAY_NOT_NEW_LEAN_RUN",checks,negative,roots:rows.length,uniqueDeclarations:all.size,combinedOmissions:omissions,alias:find(A),viaConsumer:find(V)};
}
const root=process.argv[2];if(!root)throw Error('checkout path required');
const b={};for(const [path,sha] of Object.entries(pins)){const raw=readFileSync(join(root,"compute/rh-native-downstream-rc1-20261124/",path));if(createHash('sha1').update('blob '+raw.length+'\0').update(raw).digest('hex')!==sha)throw Error('Git blob mismatch '+path);b[path]=raw.toString('utf8')}
console.log(JSON.stringify(audit(b),null,2));

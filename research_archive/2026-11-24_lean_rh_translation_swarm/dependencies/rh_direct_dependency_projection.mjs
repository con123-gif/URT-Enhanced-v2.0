/*
RH dependencies — direct declaration projection checkpoint, 2026-11-24.
RESULT: PARTIAL / executed graph engineering certificate, no actual RH export projection yet.
Pinned source 40e56bab026552e089d7afcfeff08d2defb9c005; latest upstream observed d27f71347abceb76cd37dc8a5fccbe556ec2be90.
Working branch pre-write SHA ac3d11a452db75086dfa87f209019b0da4ad071c. Read SWARM_PROTOCOL, HANDOFF_QUEUE,
EXPANSION_15_LANES, AGENTS, continuity, prior dependency notes, integration typed root,
kernel RUN2, acceleration RUN2, structure retry and actual compute state.
Existing full source scan succeeded: 175187 import-reachable modules, 753261 local
edges, 348 external names, 132.426827194 s cold, 5.361866118 s warm, peak
892300 KiB (run 45347142308); these are lexical import results, not proof edges.
Existing export challenge failed byte check despite hash match; corrected retry
rh-stream-closure-retry-20261124 and native fixture v2 status were not yet present.
No redundant export job launched. Local git DNS failed; lean/lake/elan unavailable.
Physical CI checkpoint 354 PASS (45350120163) is unrelated.

Problem: mixed reachability closure lists declarations, but does not tell which
owner's TYPE or VALUE directly uses each constant. The existing compact index also
conflates explicit const/projection/literal refs and deletes the expression index.
This module is an independent projection adapter for raw NDJSON 3.1.0 expression
records (format at https://github.com/leanprover/lean4export/blob/v4.33.0/format_ndjson.md).
It can be called from a future export reader that retains raw typed records or an
equivalent lossless index; it cannot recover lost distinctions from signed refs.
For each batch <=32 roots (owner name ID, role, expression ID), traverse only
expression-to-expression edges, then propagate a bit mask in reverse DFS postorder.
A constant is attributed to every owner/role whose mask reaches its occurrence;
never descend into that constant's declaration during direct-edge extraction.
Keep literal implicit dependencies, projection carrier, recursor rule RHS and
structural metadata separate. Caller must validate target declaration existence,
name ID table and quotient/inductive package completeness, preserve all raw levels,
binder metadata, source proof terms and full hypotheses. resolveName accepts tagged
name components (string vs integer); names with unsafe integer IDs fail closed.
No proof term is reconstructed or erased. Group membership is not a logical premise.
No claim of exact kernel graph until run on checksum-pinned export and crosschecked.

Complexity: for fixed <=32 owners, O(V+E+R_occ+K) hash-map operations, K attributed
reference occurrences <=32*R_occ. Memory O(V+E+R_occ+unique output+DFS depth),
including graph objects and order. One DFS per batch, not one per seed. For arbitrary
number of owners total cost is sum over batches; cannot claim O(N) universal direct
projection. Counterexample: D distinct declarations share one term containing M
distinct constants; D*M direct edges despite O(D+M) compact input. A complete
materialized declaration graph has that output lower bound. Use mixed graph for
global reachability and exact on-demand batches for readable proof edges.
Baseline walks each seed independently; both use same expression record decoder,
so decoder coverage is fixture-tested, not independently verified against Lean.
No URT speedup claim. Operation counts, not runtime, establish fixed-batch scaling.

Source-only sanity anchors (exact pinned lines fetched this session; expected direct
VALUE references for later comparison, not observed kernel references):
[
  {
    "path": "src/Main.lean",
    "name": "riemannHypothesis",
    "line": "theorem riemannHypothesis : RiemannHypothesis := rhOfAll",
    "valueNames": [
      "rhOfAll"
    ],
    "blob": "dbd5db70bc11b35f18fa5751216ab335321e7bfc",
    "lineNumber": 4
  },
  {
    "path": "src/Supplements/Kernels/MainTheorems.lean",
    "name": "rhOfAll",
    "line": "theorem rhOfAll : RiemannHypothesis := Formalism.VW.rh_of_every allChi",
    "valueNames": [
      "Formalism.VW.rh_of_every",
      "allChi"
    ],
    "blob": "6a542d7ce969a791fd12ce575f587e6bc29044bf",
    "lineNumber": 9
  },
  {
    "path": "src/Supplements/Kernels/MainTheorems.lean",
    "name": "allChi",
    "line": "theorem allChi : UpperTheory.EveryCharacter := UpperTheory.FinalTheorems.everyCharacter",
    "valueNames": [
      "UpperTheory.FinalTheorems.everyCharacter"
    ],
    "blob": "6a542d7ce969a791fd12ce575f587e6bc29044bf",
    "lineNumber": 7
  }
]
Executed V8 certificate, exact outputs:
{
  "checks": 23,
  "negativeControls": 7,
  "bench": [
    {
      "n": 5000,
      "batchMs": 26,
      "baselineMs": 406,
      "baselineReads": 160000,
      "expressionReads": 5000,
      "childEdges": 9998,
      "referenceOccurrences": 1,
      "maskEdgeUpdates": 9998,
      "attributedOccurrences": 32,
      "peakDfsFrames": 5000,
      "retainedExpressionNodes": 5000,
      "uniqueRoleReferenceRows": 32
    },
    {
      "n": 10000,
      "batchMs": 50,
      "baselineMs": 699,
      "baselineReads": 320000,
      "expressionReads": 10000,
      "childEdges": 19998,
      "referenceOccurrences": 1,
      "maskEdgeUpdates": 19998,
      "attributedOccurrences": 32,
      "peakDfsFrames": 10000,
      "retainedExpressionNodes": 10000,
      "uniqueRoleReferenceRows": 32
    },
    {
      "n": 20000,
      "batchMs": 101,
      "baselineMs": 1561,
      "baselineReads": 640000,
      "expressionReads": 20000,
      "childEdges": 39998,
      "referenceOccurrences": 1,
      "maskEdgeUpdates": 39998,
      "attributedOccurrences": 32,
      "peakDfsFrames": 20000,
      "retainedExpressionNodes": 20000,
      "uniqueRoleReferenceRows": 32
    },
    {
      "n": 40000,
      "batchMs": 200,
      "baselineMs": 3169,
      "baselineReads": 1280000,
      "expressionReads": 40000,
      "childEdges": 79998,
      "referenceOccurrences": 1,
      "maskEdgeUpdates": 79998,
      "attributedOccurrences": 32,
      "peakDfsFrames": 40000,
      "retainedExpressionNodes": 40000,
      "uniqueRoleReferenceRows": 32
    }
  ],
  "fixtureRows": 10,
  "notes": "Synthetic graph fixtures, not real RH export or URT benchmark. Timings are unisolated V8 wall ms; memory measured as retained node/edge counts, not RSS."
}
Replay: node rh_direct_dependency_projection.mjs
RESUME HERE: inspect corrected export retry status; if challenge/solution succeeds,
retain typed raw expression records (or compact lossless kind+edges index) for
these three source anchors, resolve tagged names exactly, run projectBatch on their
type/value roots, compare actual value refs against source anchors and native fixture.
If retry fails, diagnose first actual error instead; do not silently relabel source
matches as elaborated. HANDOFF TO: kernel extractor, integration, audit.
*/
function idCheck(x) {
  if (!Number.isSafeInteger(x) || x < 0) throw Error("invalid ID: "+x);
  return x;
}

function expressionRecord(r, id, primitives) {
  if (!r || r.ie !== id) throw Error("missing or misindexed expression "+id);
  const kinds=["const","app","lam","forallE","letE","proj","mdata","bvar","sort","natVal","strVal"].filter(k=>Object.hasOwn(r,k));
  if(kinds.length!==1) throw Error("unknown/ambiguous expression "+id);
  const k=kinds[0], a=r[k], child=[], refs=[];
  const ref=(kind,target)=>refs.push({kind,target:idCheck(target)});
  switch(k){
    case "const": ref("explicit_const",a.name); break;
    case "app": child.push(a.fn,a.arg); break;
    case "lam": case "forallE": child.push(a.type,a.body); break;
    case "letE": child.push(a.type,a.value,a.body); break;
    case "proj": ref("projection_carrier",a.typeName); child.push(a.struct); break;
    case "mdata": child.push(a.expr); break;
    case "natVal": ref("literal_primitive",primitives.Nat); break;
    case "strVal": ref("literal_primitive",primitives["Char.ofNat"]);ref("literal_primitive",primitives["String.ofList"]);break;
  }
  child.forEach(idCheck);
  return {child,refs,mask:0,state:0};
}

function declarationRoots(kind,m) {
  const owner=idCheck(m.name), roots=[{owner,role:"type",expr:idCheck(m.type)}], structural=[];
  const add=(role,target)=>structural.push({owner,role,target:idCheck(target)});
  if(["def","thm","opaque"].includes(kind)) roots.push({owner,role:"value",expr:idCheck(m.value)});
  else if(!["axiom","quot","inductive","ctor","rec"].includes(kind)) throw Error("unsupported declaration "+kind);
  for(const x of m.all||[])add("mutual_group_metadata",x);
  for(const x of m.ctors||[])add("constructor_member",x);
  if(m.induct!==undefined)add("inductive_owner",m.induct);
  for(const [i,r] of (m.rules||[]).entries()){
    add("recursor_rule_constructor:"+i,r.ctor);
    roots.push({owner,role:"recursor_rule_rhs:"+i,expr:idCheck(r.rhs)});
  }
  return {roots,structural};
}

function projectBatch(seeds,readExpr,primitives,resolveName) {
  if(!Array.isArray(seeds)||!seeds.length||seeds.length>32)throw Error("batch size must be 1..32");
  const keys=new Set(),nodes=new Map(),order=[],out=seeds.map(()=>new Map());
  const stats={expressionReads:0,childEdges:0,referenceOccurrences:0,maskEdgeUpdates:0,attributedOccurrences:0,peakDfsFrames:0,retainedExpressionNodes:0,uniqueRoleReferenceRows:0};
  const get=id=>{
    idCheck(id);
    if(!nodes.has(id)){
      const n=expressionRecord(readExpr(id),id,primitives);
      nodes.set(id,n);stats.expressionReads++;stats.childEdges+=n.child.length;stats.referenceOccurrences+=n.refs.length;
    }
    return nodes.get(id);
  };
  for(const [i,s] of seeds.entries()){
    idCheck(s.owner);idCheck(s.expr);
    if(typeof s.role!=="string"||!s.role)throw Error("missing role");
    const key=JSON.stringify([s.owner,s.role]);if(keys.has(key))throw Error("duplicate owner role");keys.add(key);
    const root=get(s.expr);root.mask|=1<<i;
    if(root.state===2)continue;
    root.state=1;
    const stack=[[s.expr,0]];
    while(stack.length){
      stats.peakDfsFrames=Math.max(stats.peakDfsFrames,stack.length);
      const f=stack[stack.length-1],n=get(f[0]);
      if(f[1]===n.child.length){n.state=2;order.push(f[0]);stack.pop();continue}
      const j=n.child[f[1]++],c=get(j);
      if(c.state===1)throw Error("expression cycle "+j);
      if(c.state===0){c.state=1;stack.push([j,0])}
    }
  }
  for(let z=order.length-1;z>=0;z--){
    const id=order[z],n=nodes.get(id);
    for(const c of n.child){nodes.get(c).mask|=n.mask;stats.maskEdgeUpdates++}
    for(const r of n.refs){
      let bits=n.mask>>>0;
      while(bits!==0){
        const i=31-Math.clz32(bits&-bits);
        bits=(bits&(bits-1))>>>0;stats.attributedOccurrences++;
        const k=r.kind+":"+r.target;
        if(!out[i].has(k))out[i].set(k,{...r,witnessExpr:id});
      }
    }
  }
  const rows=[];
  for(const [i,s] of seeds.entries())for(const r of out[i].values()){
    const row={...s,...r};
    if(resolveName){const name=resolveName(r.target);if(!Array.isArray(name)||name.some(p=>!(typeof p==="string"||Number.isSafeInteger(p)&&p>=0)))throw Error("unresolved tagged name "+r.target);row.targetNameParts=name}
    rows.push(row);
  }
  stats.retainedExpressionNodes=nodes.size;stats.uniqueRoleReferenceRows=rows.length;
  return {rows,stats};
}

function baseline(seeds,read,primitives) {
  const out=[];let reads=0;
  for(const s of seeds){
    const stack=[s.expr],seen=new Set(),refs=new Set();
    while(stack.length){
      const id=stack.pop();if(seen.has(id))continue;seen.add(id);
      const n=expressionRecord(read(id),id,primitives);reads++;
      for(const r of n.refs)refs.add(r.kind+":"+r.target);
      for(const c of n.child)stack.push(c);
    }
    for(const r of refs)out.push(JSON.stringify([s.owner,s.role,r]));
  }
  return {keys:out.sort(),reads};
}

function selftest(){
  const primitive={Nat:90,"Char.ofNat":91,"String.ofList":92};
  const rows=[
    {ie:0,sort:0},{ie:1,const:{name:11,us:[]}},{ie:2,const:{name:12,us:[]}},
    {ie:3,app:{fn:1,arg:2}},{ie:4,proj:{typeName:13,struct:3}},
    {ie:5,natVal:"5"},{ie:6,strVal:"x"},{ie:7,letE:{type:4,value:5,body:6}},
    {ie:8,forallE:{type:1,body:7}},{ie:9,lam:{type:2,body:8}},
    {ie:10,mdata:{expr:9,data:{}}},{ie:11,bvar:0}
  ];
  const check=(ok,msg)=>{if(!ok)throw Error(msg)};
  let checks=0;
  const eq=(a,b,msg)=>{check(JSON.stringify(a)===JSON.stringify(b),msg);checks++};
  const exactKeys=x=>x.rows.map(r=>JSON.stringify([r.owner,r.role,r.kind+":"+r.target])).sort();
  const seed=[{owner:100,role:"type",expr:1},{owner:100,role:"value",expr:10},{owner:101,role:"value",expr:4},{owner:102,role:"value",expr:11}];
  const got=projectBatch(seed,i=>rows[i],primitive,i=>["N",i]);
  eq(exactKeys(got),baseline(seed,i=>rows[i],primitive).keys,"typed fixture versus independent traversal");
  eq(got.rows.filter(r=>r.owner===100&&r.role==="type").map(r=>r.target),[11],"type vs value isolation");
  eq(got.rows.filter(r=>r.kind==="literal_primitive").length,3,"literal attribution");
  eq(got.rows.filter(r=>r.kind==="projection_carrier").length,2,"projection attribution");
  eq(got.rows.every(r=>r.targetNameParts[1]===r.target),true,"tagged names");
  eq(got.rows.some(r=>r.owner===102),false,"bound variable creates no constant");
  const decl=declarationRoots("rec",{name:40,type:0,all:[41],rules:[{ctor:42,rhs:10}]});
  eq(decl.roots,[{owner:40,role:"type",expr:0},{owner:40,role:"recursor_rule_rhs:0",expr:10}],"recursor rule role");
  eq(decl.structural.map(r=>r.target),[41,42],"structural separate");
  eq(declarationRoots("thm",{name:40,type:0,value:1}).roots.length,2,"theorem roles");
  let neg=0;
  for(const f of [
    ()=>projectBatch([{owner:1,role:"x",expr:99}],i=>rows[i],primitive),
    ()=>projectBatch([{owner:1,role:"x",expr:0}],()=>({ie:0,unknown:0}),primitive),
    ()=>projectBatch([{owner:1,role:"x",expr:0}],()=>({ie:0,mdata:{expr:0}}),primitive),
    ()=>projectBatch([seed[0],seed[0]],i=>rows[i],primitive),
    ()=>projectBatch(Array.from({length:33},(_,i)=>({owner:i,role:"x",expr:0})),i=>rows[i],primitive),
    ()=>projectBatch([{owner:1,role:"x",expr:5}],i=>rows[i],{}),
    ()=>projectBatch([{owner:1,role:"x",expr:1}],i=>rows[i],primitive,()=>null)
  ]){try{f()}catch(e){neg++}}
  eq(neg,7,"negative controls");
  // A deterministic irregular shared DAG; baseline does not share visited sets.
  const dag=[{ie:0,const:{name:1,us:[]}}];
  for(let i=1;i<2500;i++)dag.push(i%7===0?{ie:i,const:{name:(i%31)+1,us:[]}}:{ie:i,app:{fn:i-1,arg:(i*37+19)%i}});
  const multi=Array.from({length:32},(_,i)=>({owner:1000+i,role:"value",expr:2499-i*3}));
  eq(exactKeys(projectBatch(multi,i=>dag[i],primitive)),baseline(multi,i=>dag[i],primitive).keys,"32-bit mask including bit 31");
  const bench=[];
  for(const n of [5000,10000,20000,40000]){
    const read=i=>i===0?{ie:0,const:{name:1,us:[]}}:{ie:i,app:{fn:i-1,arg:i-1}};
    const s=Array.from({length:32},(_,i)=>({owner:2000+i,role:"value",expr:n-1}));
    const t=Date.now(),x=projectBatch(s,read,primitive),tm=Date.now()-t;
    const t2=Date.now(),y=baseline(s,read,primitive),tm2=Date.now()-t2;
    eq(exactKeys(x),y.keys,"shared chain "+n);eq(x.stats.expressionReads,n,"one read "+n);eq(y.reads,32*n,"baseline reads "+n);
    bench.push({n,batchMs:tm,baselineMs:tm2,baselineReads:y.reads,...x.stats});
  }
  return {checks,negativeControls:neg,bench,fixtureRows:got.rows.length,notes:"Synthetic graph fixtures, not real RH export or URT benchmark. Timings are unisolated V8 wall ms; memory measured as retained node/edge counts, not RSS."};
}

export { expressionRecord, declarationRoots, projectBatch, selftest };
if (typeof process !== 'undefined' && process.argv[1] && import.meta.url === new URL('file://' + process.argv[1]).href) console.log(JSON.stringify(selftest(),null,2));

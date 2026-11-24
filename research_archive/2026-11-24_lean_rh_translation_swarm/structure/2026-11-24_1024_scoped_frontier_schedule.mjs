/*
STRUCTURE lane 2026-11-24 10:24 UTC. RESULT PARTIAL: occurrence-scoped selected RecT/ParUniq presentation graph and cut-locality scheduling benchmark.
Not kernel graph or proof replay. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; current observed upstream fb990c7fb2d7e01039a22116b38c31457e56a796 has different Main.lean entry point (Claim.zeta vs rhOfAll). Keep separate.
Input peer artifacts (Git blob SHAs): research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-24_0900_RECT_FIELD_PROOF_GRAPH.json c600c38a445fb5f29f197a9091432b8ac74c0bed; research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-24_1000_PARUNIQ_CYCLIC_PROOF.mjs 7644e7529c4e876cdf3ff26516f9e726419d915e. Source src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/CuspEx.lean 3c2550dd844817d87bf5eacae0fb1498df8603b0; ParUniq.lean blob 87d971db5f5faa95d960b55914583b51d6baf31d. Actual CuspEx calls at lines 127 and 161 independently fetched at pin. All peer graph edges are selected presentation relationships, not inferred proof entailments. Source ledger and original peer files remain authoritative; unexpanded same-spelling occurrences are NOT merged without typed witness. Producer pointers are presentation metadata, not a kernel theorem edge. Unused metadata kept in ledger. No new assumptions, no theorem or axiom closure.
New contribution: retain scoped unresolved occurrences and compare immediate frontier-cut score indegree-outdegree against lexical, outdegree, fixed URT and critical depth on the joined actual peer graph. URT score = fan + (pi/e)*cos((lexical rank+1)*2pi/phi^2), fixed before measurement. Ready scan O(V^2+E) worst case; same implementation all policies. Cut area=sum(edge span), peak=max cut, occurrence-count structural readability proxies only. Actual human readability unmeasured. Typed schedule workspace 3 Int32Arrays = 12V bytes; excludes graph, score, runtime, and GC; not process RAM. V8 wall clock 7 x 2000 calls, median; not isolated, timings may vary. Node replay below can report actual process heap/RSS snapshots but not peak. No URT advantage asserted. No universal O(N) Lean optimization.
Read swarm, AGENTS, research state/log/protocol, handoff, continuity, prior structure, dependency codec, integration, math and proof editor checkpoints, audit commit metadata, Green/Galois recent commit records. Blueprint referenced in handoff, not freshly reread here. Local git DNS failed, Lean unavailable. Prior Cathedral CI checkpoint 361 PASS run 45369968953 f3eef65; unrelated to RH kernel. Executed tests in connector V8; Node replay not executed here. Three malformed schedules rejected; exact ledger roundtrip and field/projection retention asserted. Latest RH export not authenticated in this run; no claim about complete graph. 
RESUME HERE: apply occurrence-aware cut metrics to authenticated RH typed kernel export after dependencies lane finishes bounded extraction; preserve typed witness ledger and compare heap-based implementations. HANDOFF TO: dependencies, integration, audit, editor.
Observed (timing environment dependent):
{
  "nodes": 100,
  "edges": 107,
  "unused_metadata_nodes": 3,
  "scoped_frontier_occurrences": 67,
  "distinct_frontier_spellings": 60,
  "fields": 12,
  "projection_witnesses": [
    {
      "line": 127,
      "text": "    have U := (parUniq E Ω A w h a ha g i hi' u' hu'c hu'd (r u') P').1 _ D"
    },
    {
      "line": 161,
      "text": "  have U := (parUniq E Ω A w h a ha g i hi' u hu hud (r u) Pu).2 _ hc' hd' T"
    }
  ],
  "negative_controls": 3,
  "result": {
    "lexical": {
      "area": 3821,
      "peak": 67,
      "edge_fidelity": 107,
      "node_fidelity": 100,
      "median_us": 665,
      "typed_schedule_workspace_bytes": 1200
    },
    "centrality": {
      "area": 3618,
      "peak": 68,
      "edge_fidelity": 107,
      "node_fidelity": 100,
      "median_us": 716,
      "typed_schedule_workspace_bytes": 1200
    },
    "urt": {
      "area": 3626,
      "peak": 59,
      "edge_fidelity": 107,
      "node_fidelity": 100,
      "median_us": 461,
      "typed_schedule_workspace_bytes": 1200
    },
    "critical_depth": {
      "area": 2651,
      "peak": 51,
      "edge_fidelity": 107,
      "node_fidelity": 100,
      "median_us": 658,
      "typed_schedule_workspace_bytes": 1200
    },
    "cut_delta": {
      "area": 1139,
      "peak": 34,
      "edge_fidelity": 107,
      "node_fidelity": 100,
      "median_us": 713,
      "typed_schedule_workspace_bytes": 1200
    }
  }
}
*/
function run(base,ext,cusp){
  const ck=(v,m)=>{if(!v)throw Error(m)},nodes=new Map(),edges=[];
  const add=(id,record)=>{ck(!nodes.has(id),"duplicate "+id);nodes.set(id,record);return id};
  const edge=(consumer,dep,role,witness)=>edges.push({consumer,dep,role,witness});
  const leaf=(owner,label,role,i)=>add("leaf:"+owner+":"+role+":"+i,{status:"UNEXPANDED; no equivalence or axiom assertion",label,owner,role});
  ck(base.upstream_pin===ext.pin,"pin mismatch");
  const calls=cusp.split("\n").map((s,i)=>({line:i+1,text:s})).filter(x=>x.text.includes("(parUniq "));
  ck(calls.length===2&&calls[0].text.includes(").1")&&calls[1].text.includes(").2"),"missing projection witnesses");
  add("root",{source:base.source_nodes.root,scope:base.scope_exact});
  for(const f of base.record_fields)add("field:"+f.name,f);
  for(const [id,record] of Object.entries(base.source_nodes))if(id!=="root")add("producer:"+id,record);
  for(const w of base.obligation_tree.witnesses)add("w:"+w.id,w);
  for(const n of ext.nodes)add("par:"+n.id,n);
  const exIds=new Set(ext.nodes.map(n=>n.id)),front=new Set(ext.unexpanded);
  for(const f of base.record_fields){edge("root","field:"+f.name,"assembly",f.root_application_anchor);edge("field:"+f.name,"producer:"+f.producer,"producer pointer",f.exact);}
  for(const [p,ls] of Object.entries(base.obligation_tree.unresolved_producers))for(const [i,l] of ls.entries())edge("producer:"+p,leaf("producer:"+p,l,"open",i),"open occurrence",l);
  for(const w of base.obligation_tree.witnesses){
    const id="w:"+w.id;edge("root",id,"witness assembly",w.statement);edge(id,"producer:"+w.source,"producer pointer",w.source);
    for(const [i,l] of (w.requires||[]).entries())edge(id,nodes.has("w:"+l)?"w:"+l:leaf(id,l,"requires",i),"requires",l);
    for(const [i,l] of w.open.entries())edge(id,l==="parUniq"&&w.id==="r"?"par:par":leaf(id,l,"open",i),"open occurrence",l==="parUniq"&&w.id==="r"?{original:l,calls}:l);
  }
  for(const n of ext.nodes)for(const [i,d] of n.deps.entries()){ck(exIds.has(d)||front.has(d),"unlisted dependency");edge("par:"+n.id,exIds.has(d)?"par:"+d:leaf("par:"+n.id,d,"selected",i),"selected application",d);}
  // Unused source metadata remains in original ledger; only vertices incident to selected edges are scheduled.
  const used=new Set(edges.flatMap(e=>[e.consumer,e.dep]));used.add("root");
  const ids=[...used].sort(),idx=new Map(ids.map((x,i)=>[x,i])),n=ids.length;
  const es=edges.map(e=>[idx.get(e.dep),idx.get(e.consumer)]);
  ck(es.every(([a,b])=>Number.isInteger(a)&&Number.isInteger(b)),"missing endpoint");
  const incoming=Array.from({length:n},()=>[]),outgoing=Array.from({length:n},()=>[]),degree=new Int32Array(n);
  for(const [a,b] of es){incoming[b].push(a);outgoing[a].push(b);degree[b]++;}
  const fan=outgoing.map(a=>a.length),phi=(1+Math.sqrt(5))/2,theta=2*Math.PI/phi**2;
  const fixed={lexical:ids.map(()=>0),centrality:fan,urt:fan.map((f,i)=>f+Math.PI/Math.E*Math.cos((i+1)*theta))};
  // Same deterministic ready-array scan for all policies, incl. dynamic cut:
  // emitting a ready vertex closes all of its incoming obligations and opens its outgoing obligations.
  // Local net change = outdegree-indegree, so max indegree-outdegree minimizes immediate frontier.
  function schedule(score){
    const deg=degree.slice(),ready=new Int32Array(n),order=new Int32Array(n);let nr=0,k=0;
    for(let i=0;i<n;i++)if(deg[i]===0)ready[nr++]=i;
    while(nr){let j=0;for(let i=1;i<nr;i++)if(score[ready[i]]>score[ready[j]]||(score[ready[i]]===score[ready[j]]&&ready[i]<ready[j]))j=i;
      const a=ready[j];ready[j]=ready[--nr];order[k++]=a;
      for(const b of outgoing[a])if(--deg[b]===0)ready[nr++]=b;
    }
    ck(k===n,"cycle");return order;
  }
  const depth=new Int32Array(n);for(const a of [...schedule(fixed.lexical)].reverse())depth[a]=1+Math.max(0,...outgoing[a].map(b=>depth[b]));
  fixed.critical_depth=depth;fixed.cut_delta=ids.map((_,i)=>incoming[i].length-outgoing[i].length);
  function metrics(order){
    ck(order.length===n&&new Set(order).size===n&&[...order].every(i=>i>=0&&i<n),"bad coverage");
    const p=new Int32Array(n);order.forEach((v,i)=>p[v]=i);
    const delta=new Int32Array(n+1);let area=0;
    for(const [a,b] of es){ck(p[a]<p[b],"bad dependency order");delta[p[a]]++;delta[p[b]]--;area+=p[b]-p[a];}
    let live=0,peak=0,check=0;for(let i=0;i<n;i++){live+=delta[i];peak=Math.max(peak,live);check+=live}
    ck(check===area&&live===0,"bad cut accounting");
    return {area,peak,edge_fidelity:es.length,node_fidelity:n};
  }
  const result={};for(const [name,score] of Object.entries(fixed)){
    const o=schedule(score),m=metrics(o),ts=[];
    for(let j=0;j<7;j++){const t=Date.now();for(let i=0;i<2000;i++)schedule(score);ts.push((Date.now()-t)*1000/2000);}
    ts.sort((a,b)=>a-b);
    result[name]={...m,median_us:ts[3],typed_schedule_workspace_bytes:12*n,order:[...o].map(i=>ids[i])};
  }
  // Roundtrip ledger retains duplicate scoped occurrences and both exact projection witnesses.
  const ledger=JSON.parse(JSON.stringify({nodes:[...nodes],edges}));ck(JSON.stringify(ledger.nodes)===JSON.stringify([...nodes])&&JSON.stringify(ledger.edges)===JSON.stringify(edges),"ledger roundtrip");
  const j=edges.find(e=>e.dep==="par:par");ck(j.witness.calls.length===2,"lost projection");
  const exactFields=base.record_fields.every(f=>JSON.stringify(ledger.nodes.find(([k])=>k==="field:"+f.name)[1])===JSON.stringify(f));
  ck(exactFields,"field loss");
  let rejected=0;const o=[...schedule(fixed.lexical)];
  for(const bad of [o.slice(1),o.slice().reverse(),[o[0],...o.slice(0,-1)]]){try{metrics(bad)}catch{rejected++;}}
  ck(rejected===3,"negative control survived");
  const scoped=ledger.nodes.filter(([k])=>k.startsWith("leaf:")).map(([,v])=>v.label);
  return {nodes:n,edges:es.length,unused_metadata_nodes:nodes.size-n,scoped_frontier_occurrences:scoped.length,distinct_frontier_spellings:new Set(scoped).size,fields:base.record_fields.length,projection_witnesses:calls,negative_controls:rejected,result,ledger};
}
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
const [cat,rh]=process.argv.slice(2);if(!cat||!rh)throw Error('node certificate.mjs /path/to/Cathedral /path/to/pinned-RH');
function read(repo,ref,path,sha){const b=execFileSync('git',['-C',repo,'show',ref+':'+path],{maxBuffer:16*1024*1024});const h=createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex');if(h!==sha)throw Error('blob mismatch '+path);return b.toString('utf8')}
const base=JSON.parse(read(cat,'8298f231fc615a09d5c1e2706de521aa003545b2','research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-24_0900_RECT_FIELD_PROOF_GRAPH.json','c600c38a445fb5f29f197a9091432b8ac74c0bed'));
const ext=JSON.parse(read(cat,'8298f231fc615a09d5c1e2706de521aa003545b2','research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-24_1000_PARUNIQ_CYCLIC_PROOF.mjs','7644e7529c4e876cdf3ff26516f9e726419d915e').split('export const graph=')[1].split(';\nexport const clauses=')[0]);
const cusp=read(rh,'40e56bab026552e089d7afcfeff08d2defb9c005','src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/CuspEx.lean','3c2550dd844817d87bf5eacae0fb1498df8603b0');
console.log(JSON.stringify(run(base,ext,cusp),null,2));

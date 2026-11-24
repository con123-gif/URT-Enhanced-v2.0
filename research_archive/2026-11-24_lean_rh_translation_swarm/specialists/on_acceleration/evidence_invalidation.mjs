// Cache guard + multi-seed reverse invalidation. No proof checking or receipt authentication.
function engine(){
  const need=(x,msg)=>{if(!x)throw Error(msg)};
  const hex=x=>typeof x==="string"&&/^[a-f0-9]{64}$/.test(x);
  // A key is usable only for an externally authenticated, same immutable
  // environment, graph, checker, policy and exact review claim.
  // Reference lists alone do NOT fingerprint expressions or theorem statements.
  function scopeKey(s){
    need(s&&/^[a-f0-9]{40}$/.test(s.pin),"invalid source pin");
    for(const f of ["environment","export","extractor","checker","policy"])need(hex(s[f]),"missing exact "+f+" digest");
    need(s.format==="cathedral-kernel-v2"||s.format==="lean4export-verified-closure-v1","not an eligible kernel format");
    return JSON.stringify([s.format,s.pin,s.environment,s.export,s.extractor,s.checker,s.policy]);
  }
  function reusable(old,request,authenticatedReceipts){
    // This Set is an input supplied by the caller AFTER independently authenticating
    // the environment/export/checker and the actual review artifact. Never derive it
    // from a graph's status field. This module does not authenticate receipts.
    try{
      if(!old||!request||!authenticatedReceipts.has(old.receipt)||!hex(old.receipt))return false;
      if(old.status!=="INDEPENDENTLY_RECHECKED"||old.node!==request.node||!hex(old.claim)||old.claim!==request.claim||!hex(old.evidence)||old.evidence!==request.evidence)return false;
      return scopeKey(old.scope)===scopeKey(request.scope);
    }catch{return false}
  }
  function index(rows){
    const nodes=new Map(),rev=new Map();
    let edges=0,unknown=0;
    for(const r of rows){
      need(r&&typeof r.id==="string"&&r.id.length>0&&!nodes.has(r.id),"duplicate/invalid id");
      need(Array.isArray(r.deps)&&r.deps.every(d=>typeof d==="string"&&d.length>0),"bad deps");
      need(typeof r.boundary==="boolean","explicit boundary flag required");
      const ds=new Set(r.deps);nodes.set(r.id,{deps:ds,boundary:r.boundary});
      for(const d of ds){if(!rev.has(d))rev.set(d,[]);rev.get(d).push(r.id);edges++}
    }
    for(const d of rev.keys())if(!nodes.has(d))unknown++;
    return {nodes,rev,edges,unknown};
  }
  function closure(g,seeds,seen=new Set()){
    const q=[];let edgeVisits=0;
    for(const s of seeds)if(!seen.has(s)){seen.add(s);q.push(s)}
    for(let i=0;i<q.length;i++)for(const parent of g.rev.get(q[i])||[]){edgeVisits++;if(!seen.has(parent)){seen.add(parent);q.push(parent)}}
    return {seen,edgeVisits};
  }
  function separate(g,seeds){
    const union=new Set();let visits=0;
    for(const s of seeds){const r=closure(g,[s]);visits+=r.edgeVisits;for(const n of r.seen)union.add(n)}
    return {seen:union,edgeVisits:visits};
  }
  // Revisions: union old and new reverse edges; deleted dependencies cannot disappear
  // from the invalidation calculation. Propagating on union can overinvalidate; it
  // cannot miss any old- or new-graph ancestor of a seed. Missing endpoints remain IDs.
  function invalidate(old,newGraph,changed){
    const seed=new Set(changed),ids=new Set([...old.nodes.keys(),...newGraph.nodes.keys()]);
    for(const id of ids){
      const a=old.nodes.get(id),b=newGraph.nodes.get(id);
      if(!a||!b||a.boundary!==b.boundary||a.deps.size!==b.deps.size||[...a.deps].some(d=>!b.deps.has(d)))seed.add(id);
    }
    const seen=new Set(seed),q=[...seed];let edgeVisits=0;
    for(let i=0;i<q.length;i++)for(const g of [old,newGraph])for(const p of g.rev.get(q[i])||[]){edgeVisits++;if(!seen.has(p)){seen.add(p);q.push(p)}}
    return {seen,edgeVisits,seeds:seed.size};
  }
  // Phase is only an ordering ablation. Fixed 64 buckets, no sorting or dropped IDs.
  function phaseOrder(seeds,theta){
    const b=Array.from({length:64},()=>[]);
    for(let i=0;i<seeds.length;i++){const t=(i*theta)%1;b[Math.floor(64*t)].push(seeds[i])}
    return b.flat();
  }
  function peerRows(g){
    need(g.schema==="RH selected source application obligation multigraph v1","wrong fixture");
    return Object.entries(g.nodes).map(([id,n])=>({id,deps:n.ports.filter(p=>p.producer!==null&&p.producer!==undefined).map(p=>p.producer),boundary:n.unexpanded.length>0||n.ports.some(p=>p.producer==null)}));
  }
  function check(peerGraph,clock=()=>Date.now()){
    const tests=[];const ok=(name,x)=>{need(x,"FAILED "+name);tests.push(name)};
    const same=(a,b)=>a.size===b.size&&[...a].every(x=>b.has(x));
    const h=c=>c.repeat(64),scope={format:"cathedral-kernel-v2",pin:"40e56bab026552e089d7afcfeff08d2defb9c005",environment:h("a"),export:h("b"),extractor:h("c"),checker:h("d"),policy:h("e")};
    const ev={scope,node:"root",status:"INDEPENDENTLY_RECHECKED",claim:h("f"),evidence:h("1"),receipt:h("2")},trusted=new Set([ev.receipt]);
    ok("exact scope and independently authenticated receipt",reusable(ev,ev,trusted));
    ok("no authentication means no reuse",!reusable(ev,ev,new Set()));
    ok("source-only status rejected",!reusable({...ev,status:"SOURCE_MATCHED"},ev,trusted));
    for(const field of ["environment","export","extractor","checker","policy"])ok(field+" change blocks reuse",!reusable(ev,{...ev,scope:{...scope,[field]:h("3")}},trusted));
    ok("changed exact claim blocked",!reusable(ev,{...ev,claim:h("3")},trusted));
    ok("changed evidence blocked",!reusable(ev,{...ev,evidence:h("3")},trusted));
    ok("wrong declaration blocked",!reusable(ev,{...ev,node:"other"},trusted));
    ok("lexical graph cannot be used as kernel scope",!reusable(ev,{...ev,scope:{...scope,format:"lex-context-v2"}},trusted));
    const row=(id,deps,boundary=false)=>({id,deps,boundary});
    let g=index([row("root",["a"]),row("a",["b","lost"]),row("b",["a"])]);
    ok("cycle terminates and unresolved endpoint retained",same(closure(g,["lost"]).seen,new Set(["lost","a","b","root"]))&&g.unknown===1);
    let g2=index([row("root",[]),row("a",["b"]),row("b",["a"]),row("new",["root"])]);
    ok("old deleted edge still invalidates downstream",same(invalidate(g,g2,["lost"]).seen,new Set(["lost","a","b","root","new"])));
    try{index([row("x",[]),row("x",[])]);throw Error("accepted duplicate")}catch(e){ok("duplicate node rejected",e.message==="duplicate/invalid id")}
    const pg=index(peerRows(peerGraph)),pseeds=[...pg.nodes.keys()].filter(k=>!pg.rev.has(k)||pg.nodes.get(k).boundary);
    // On real source-matched graph test every single node and every pair against separate reverse walks.
    let pairs=0;for(const a of pg.nodes.keys())for(const b of pg.nodes.keys()){need(same(closure(pg,[a,b]).seen,separate(pg,[a,b]).seen),"peer pair mismatch");pairs++}
    ok("all real selected graph seed pairs agree",pairs===pg.nodes.size**2);
    const pr=closure(pg,pseeds),pb=separate(pg,pseeds);
    ok("peer boundary/root union agrees",same(pr.seen,pb.seen));
    // Shared trunk: 100k nodes, 15 edited leaves all feed the same ancestor chain.
    // This is a deliberate stress case, NOT the full RH graph or observed edit pattern.
    const N=100000,K=15,rows=[];const seeds=Array.from({length:K},(_,i)=>"L"+i);
    seeds.forEach(s=>rows.push(row(s,[])));rows.push(row("0",seeds));
    for(let i=1;i<N-K;i++)rows.push(row(String(i),[String(i-1)]));
    const t=clock();const sg=index(rows);const indexMs=clock()-t;
    const phi=(1+Math.sqrt(5))/2,phase=phaseOrder(seeds,1/(phi*phi)),periodic=phaseOrder(seeds,1/24);
    const modes=[["independent",()=>separate(sg,seeds)],["batch",()=>closure(sg,seeds)],["golden",()=>closure(sg,phaseOrder(seeds,1/(phi*phi)))],["periodic",()=>closure(sg,phaseOrder(seeds,1/24))]];
    const baseline=modes[0][1](),runs={};
    for(const [label,f] of modes){let times=[],r;for(let i=0;i<5;i++){const s=clock();r=f();times.push(clock()-s);need(same(r.seen,baseline.seen),"synthetic mismatch "+label)}times.sort((a,b)=>a-b);runs[label]={median_ms:times[2],samples_ms:times,edge_visits:r.edgeVisits,invalidated:r.seen.size}}
    ok("synthetic shared union equality",runs.batch.invalidated===N&&runs.golden.edge_visits===runs.batch.edge_visits&&runs.periodic.edge_visits===runs.batch.edge_visits);
    ok("phase permutation preserves every seed",same(new Set(phase),new Set(seeds))&&same(new Set(periodic),new Set(seeds)));
    return {tests,peer:{nodes:pg.nodes.size,edges:pg.edges,unknown:pg.unknown,seed_count:pseeds.length,pair_checks:pairs,invalidated:pr.seen.size,independent_edge_visits:pb.edgeVisits,batch_edge_visits:pr.edgeVisits},synthetic:{nodes:N,edges:sg.edges,seeds:K,index_ms:indexMs,runs}};
  }
  return {index,closure,separate,invalidate,phaseOrder,scopeKey,reusable,peerRows,check};
}
export const {index,closure,separate,invalidate,phaseOrder,scopeKey,reusable,peerRows,check}=engine();

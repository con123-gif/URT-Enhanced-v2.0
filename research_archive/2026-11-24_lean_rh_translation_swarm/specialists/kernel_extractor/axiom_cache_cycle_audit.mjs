#!/usr/bin/env node
/* RUN6: source-policy cache audit, not a Lean validation. */
import fs from 'node:fs';
import {createHash} from 'node:crypto';
function certificate(source,fixture,upstreamTests){
 let checks=0;const ok=(v,m)=>{if(!v)throw Error(m);checks++};
 const eq=(a,b)=>JSON.stringify(a)===JSON.stringify(b), sorted=s=>[...s].sort();
 const need=(v,m)=>{if(!v)throw Error(m)};
 const anchors=["if let some axs := extFind? env c then","seen := s.seen.insert c #[]","e.getUsedConstants.forM (collect extFind?)","env.checked.get.find? c","some (.axiomInfo v)","collectExpr v.type *> collectExpr v.value","some (.quotInfo _)   => pure ()","some (.inductInfo v) => collectExpr v.type *> v.ctors.forM (collect extFind?)","CollectAxioms.runM privateEnv do","allNames.mapM fun name =>"];
 for(const a of anchors)ok(source.includes(a),"missing source anchor: "+a);
 for(const a of ["_private.CollectAxioms.Left.0.ax, _private.CollectAxioms.Right.0.ax","'chainDef' depends on axioms: [chainAx]","'axOfAx' depends on axioms: [axOfAx, myAxiom]"])ok(upstreamTests.includes(a),"missing upstream test anchor");
 // Graph-only model of the source's shared memo + recursion sentinel.
 // Ordered adjacency is an explicit input; not a claim about Lean hash-map ordering.
 function cached(g,roots){
  const memo=new Map();
  function visit(n){
   if(memo.has(n))return memo.get(n);
   const v=g.get(n);need(v,"unresolved "+n);
   const a=new Set(v.axiom?[n]:[]);memo.set(n,new Set());
   for(const t of v.edges)for(const x of visit(t))a.add(x);
   memo.set(n,a);return a;
  }
  return new Map(roots.map(n=>[n,sorted(visit(n))]));
 }
 // Independent breadth-first reachable axioms, with shortest witnesses.
 function exact(g,root){
  need(g.has(root),"missing root");const p=new Map([[root,null]]),q=[root],out=[];
  for(let i=0;i<q.length;i++){const u=q[i],v=g.get(u);need(v,"unresolved "+u);
   if(v.axiom){const path=[];for(let n=u;n!==null;n=p.get(n))path.push(n);out.push({axiom:u,path:path.reverse()});}
   for(const t of v.edges){need(g.has(t),"unresolved "+t);if(!p.has(t)){p.set(t,u);q.push(t);}}
  }
  out.sort((a,b)=>a.axiom<b.axiom?-1:a.axiom>b.axiom?1:0);
  return {visited:p.size,axioms:out.map(x=>x.axiom),witnesses:out};
 }
 const g=new Map([["I",{edges:["I.plain","I.guarded"]}],["I.plain",{edges:["I"]}],["I.guarded",{edges:["guardProp","I"]}],["guardProp",{axiom:true,edges:[]}]]);
 const truePlain=exact(g,"I.plain"),trueI=exact(g,"I");
 ok(eq(truePlain.axioms,["guardProp"]),"exact cycle reachability");
 ok(eq(truePlain.witnesses[0].path,["I.plain","I","I.guarded","guardProp"]),"shortest witness");
 const orderA=cached(g,["I","I.plain","I.guarded"]),orderB=cached(g,["I.plain","I","I.guarded"]);
 ok(eq(orderA.get("I"),trueI.axioms),"fresh root I");
 ok(eq(orderA.get("I.plain"),[]),"shared sentinel underapprox");
 ok(eq(orderB.get("I.plain"),truePlain.axioms),"different first root");
 ok(eq(cached(g,["I.plain"]).get("I.plain"),truePlain.axioms),"fresh plain");
 const diamond=new Map([["r",{edges:["l","q"]}],["l",{edges:["private.left.ax"]}],["q",{edges:["private.right.ax"]}],["private.left.ax",{axiom:true,edges:[]}],["private.right.ax",{axiom:true,edges:[]}]]);
 ok(eq(exact(diamond,"r").axioms,["private.left.ax","private.right.ax"]),"distinct private names");
 ok(eq(cached(diamond,["l","q","r"]).get("r"),exact(diamond,"r").axioms),"acyclic cache");
 const bad=new Map(g);bad.delete("guardProp");let rejected=false;try{exact(bad,"I.plain")}catch(e){rejected=true}ok(rejected,"missing leaf rejection");
 // Exhaust all directed graphs on four vertices, with vertex 3 the only axiom.
 // Include self edges. Compare single-root sentinel traversal to independent BFS,
 // and measure shared cache underapproximation for the fixed order.
 let sharedMismatchGraphs=0,sharedMismatchRoots=0,freshChecks=0;
 const N=4,roots=[0,1,2,3];
 for(let bits=0;bits<65536;bits++){
  const a=new Map(roots.map(i=>[i,{axiom:i===3,edges:roots.filter(j=>bits&(1<<(4*i+j)))}]));
  const c=cached(a,roots);let mismatch=false;
  for(const i of roots){const e=exact(a,i).axioms;
   need(eq(cached(a,[i]).get(i),e),"fresh cache mismatch");freshChecks++;
   if(!eq(c.get(i),e)){mismatch=true;sharedMismatchRoots++;}
  }
  if(mismatch)sharedMismatchGraphs++;
 }
 ok(freshChecks===262144,"exhaustive fresh comparisons");ok(sharedMismatchGraphs>0,"shared counterexamples");
 // Actual official exporter fixture: construct the source-policy projection
 // from explicit constant references and constructor membership, not package edges.
 // This is a serialized sample, not an actual Lean execution.
 const rows=fixture.trimEnd().split(/\r?\n/).map(JSON.parse), names=new Map([[0,[]]]), expr=new Map(), decl=new Map();
 for(const r of rows.slice(1)){
  if(Object.hasOwn(r,"in")){const a=r.str||r.num;need(names.has(a.pre),"name parent");names.set(r.in,[...names.get(a.pre),r.str?a.str:a.i]);}
  else if(Object.hasOwn(r,"ie"))expr.set(r.ie,r);
  else if(Object.hasOwn(r,"il"))continue;
  else{const k=Object.keys(r)[0],a=r[k],ms=k==="inductive"?[...a.inductiveVals.map(v=>[v,"inductive"]),...a.constructorVals.map(v=>[v,"ctor"]),...a.recursorVals.map(v=>[v,"rec"])]:a.map(v=>[v,k]);for(const [v,kind] of ms){need(!decl.has(v.name),"duplicate declaration");decl.set(v.name,{v,kind});}}
 }
 function constants(root){
  const seen=new Set(),q=[root],refs=new Set();
  for(let i=0;i<q.length;i++){const j=q[i];if(seen.has(j))continue;seen.add(j);const r=expr.get(j);need(r,"missing expression");
   if(r.const)refs.add(r.const.name);else if(r.app)q.push(r.app.fn,r.app.arg);
   else if(r.lam||r.forallE){const a=r.lam||r.forallE;q.push(a.type,a.body);}
   else if(r.letE)q.push(r.letE.type,r.letE.value,r.letE.body);
   else if(r.proj)q.push(r.proj.struct);else if(r.mdata)q.push(r.mdata.expr);
   else need(["bvar","sort","natVal","strVal"].some(k=>Object.hasOwn(r,k)),"unknown expression");
  }return [...refs];
 }
 const ag=new Map();
 for(const [id,{v,kind}] of decl){const e=kind==="quot"?[]:constants(v.type);if(["def","thm","opaque"].includes(kind))e.push(...constants(v.value));if(kind==="inductive")e.push(...v.ctors);ag.set(id,{axiom:kind==="axiom",edges:[...new Set(e)]});}
 const root=[...names].find(([id,p])=>eq(p,["Nat","add_succ"]))[0], actual=exact(ag,root), cache=cached(ag,[...ag.keys()]);
 ok(rows.length===572&&ag.size===32,"actual fixture identity/count");
 ok(actual.axioms.length===0&&[...ag.values()].filter(v=>v.axiom).length===0,"fixture has no declared axioms");
 ok([...ag.keys()].every(i=>eq(cache.get(i),exact(ag,i).axioms)),"fixture all-root agreement");
 return {checks,sourceAnchors:anchors.length,syntheticCycle:{exactPlain:truePlain,sharedOrderIThenPlain:[...orderA],sharedOrderPlainThenI:[...orderB]},exhaustive:{graphs:65536,freshChecks,sharedMismatchGraphs,sharedMismatchRoots},actualFixture:{records:rows.length,declarations:ag.size,policyEdges:[...ag.values()].reduce((a,v)=>a+v.edges.length,0),rootReachable:actual.visited,rootAxioms:actual.axioms,allRootsAgree:true},scope:"Source-policy graph model only; not Lean execution or a claim of an actual kernel bug"};
}
const pins=["dc9897059a4463dfd143a2b3f8fbb4f4a3c3f154","d3cd35f1313b4e78b5fded9886e450112aa75def","06a21df33a9a308678bf5c02d6eccd2b58e7c063"];
const paths=process.argv.slice(2);if(paths.length!==3)throw Error("usage: node axiom_cache_cycle_audit.mjs CollectAxioms.lean Nat.add_succ.ndjson CollectAxiomsTest.lean");
const bytes=paths.map(p=>fs.readFileSync(p));for(let i=0;i<3;i++){const h=createHash("sha1").update("blob "+bytes[i].length+"\0").update(bytes[i]).digest("hex");if(h!==pins[i])throw Error("input blob mismatch "+paths[i]);}
console.log(JSON.stringify(certificate(...bytes.map(b=>b.toString("utf8"))),null,2));

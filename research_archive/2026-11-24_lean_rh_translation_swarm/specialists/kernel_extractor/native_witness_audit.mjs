#!/usr/bin/env node
// Independent breadth-first audit of actual Lean-generated graph; not a kernel replay.
import fs from 'node:fs';
import {createHash} from 'node:crypto';
function audit(graph,local,imported) {
 const insist=(v,m)=>{if(!v)throw Error(m);};
 const ns="CathedralAxiomCycle", names=["Witness","Witness.plain","Witness.guarded"];
 const rows=graph.trimEnd().split(/\r?\n/).map(JSON.parse);
 const key=x=>JSON.stringify(x), nodes=new Map(rows.filter(r=>r.record==="node"||r.record==="missing").map(r=>[key(r.id),r]));
 const header=rows[0],footer=rows.at(-1);
 insist(header.record==="header"&&header.schema==="cathedral-kernel-v2"&&footer.record==="footer"&&footer.nodes===nodes.size&&rows.length===nodes.size+2,"stream coverage");
 const deps=(r,structural)=> {
   if(r.record==="missing")return [];
   const core=r.kind==="quotient"?[]:[...r.type_constants,...(["theorem","definition","opaque"].includes(r.kind)?r.value_constants:[]),...(r.kind==="inductive"?r.constructors:[])];
   return [...new Set((structural?[...core,...r.type_constants,...r.value_constants,...r.type_projections,...r.value_projections,...r.type_literals,...r.value_literals,...r.constructors,...r.group,...r.parent,...r.mutual_block,...r.quotient_package,...r.rules.flatMap(x=>[x.constructor,...x.constants,...x.projections,...x.literals])]:core).map(key))];
 };
 const label=k=>nodes.get(k)?.display??k;
 function walk(root,structural){
   const prev=new Map([[root,null]]),q=[root],axioms=[],missing=[],bodyMissing=[];
   for(let i=0;i<q.length;i++){const k=q[i],r=nodes.get(k);insist(r,"omitted endpoint "+k);if(r.record==="missing")missing.push(label(k));if(["theorem","definition","opaque"].includes(r.kind)&&!r.has_value)bodyMissing.push(label(k));if(r.kind==="axiom"){const p=[];for(let x=k;x!==null;x=prev.get(x))p.push(label(x));axioms.push({name:label(k),path:p.reverse()});}for(const d of deps(r,structural))if(!prev.has(d)){prev.set(d,k);q.push(d);}}
   return {visited:q.length,axioms,missing,bodyMissing};
 }
 const root=key(header.root),core=walk(root,false),full=walk(root,true);
 insist(full.visited===nodes.size,"unreachable rows");
 insist(footer.missing===full.missing.length,"missing count");
 const builtin=header.lean_collect_axioms.map(x=>label(key(x))).sort();
 const compare=x=>x.axioms.map(a=>a.name).sort();
 const result={nodes:nodes.size,coreEdges:[...nodes.values()].reduce((a,r)=>a+deps(r,false).length,0),allEdges:[...nodes.values()].reduce((a,r)=>a+deps(r,true).length,0),builtin,core,full,agreement:key(compare(core))===key(builtin)};
 if(local!==undefined){
   const parse=s=>{const m=new Map();for(const line of s.trim().split(/\r?\n/)){const x=/^'([^']+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)$/.exec(line);insist(x,"unexpected axiom line "+line);insist(!m.has(x[1]),"duplicate line");m.set(x[1],(x[2]??"").split(",").map(x=>x.trim()).filter(Boolean).map(x=>x==="guardProp"?ns+".guardProp":x).sort());}insist(m.size===3,"expected three axiom reports");return m;};
   const a=parse(local),b=parse(imported);const differences=names.map(n=>{const f=ns+"."+n;insist(a.has(f)&&b.has(f),"missing cycle name");return {name:f,local:a.get(f),imported:b.get(f),omitted:a.get(f).filter(x=>!b.get(f).includes(x))};});
   insist(differences[0].omitted.length===0&&differences[1].omitted[0]===ns+".guardProp"&&differences[2].omitted.length===0,"expected observed discrepancy");
   result.cycle=differences;
 }
 return result;
}
const args=process.argv.slice(2);
if(args.length!==1&&args.length!==3)throw Error('usage: node native_witness_audit.mjs GRAPH [LOCAL_LOG IMPORTED_LOG]');
const bytes=args.map(p=>fs.readFileSync(p));
if(args.length===3){
const pins=['3fbc768867c89b7802dae4489de5c080b6716bf540b75afab2d0a680d7c1e19c','5a61a3a86cf257defcdcfd5b7c03e2351993817b3bc1ba579d40875b4c42de37','6d58833bc9d191921baf9743170d3c2f5365279ed9653ad9c8787f45abb2d357'];
for(let i=0;i<3;i++)if(createHash('sha256').update(bytes[i]).digest('hex')!==pins[i])throw Error('input SHA256 mismatch '+args[i]);
}
const r=audit(...bytes.map(b=>b.toString('utf8')));
if(args.length===3&&(r.nodes!==356||r.coreEdges!==1998||r.allEdges!==2342||r.core.visited!==326||!r.agreement||r.full.missing.length||r.full.bodyMissing.length))throw Error('fixture discrepancy');
console.log(JSON.stringify(r,null,2));
// Single graph mode reports (not suppresses) axiom disagreement; fail on incomplete graph.
if(r.full.missing.length||r.full.bodyMissing.length)process.exitCode=1;

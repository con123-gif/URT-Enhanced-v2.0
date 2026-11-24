#!/usr/bin/env node
// Replay the pinned native v4.33.1 fixture. No Lean invocation in this file.
import fs from 'node:fs';
import {createHash} from 'node:crypto';
function auditPolicy(inputs){
 const keys=["plain","inductive","guarded"], ns="CathedralAxiomCycle.", ax=ns+"guardProp";
 let checks=0;const ck=(v,m)=>{if(!v)throw Error(m);checks++};
 const key=x=>JSON.stringify(x), same=(a,b)=>key(a)===key(b);
 function parse(raw,label){
  const rs=raw.trimEnd().split(/\r?\n/).map(JSON.parse), h=rs[0],f=rs.at(-1);
  ck(h.record==="header"&&h.schema==="cathedral-kernel-v2"&&f.record==="footer","schema");
  const m=new Map();for(const row of rs.slice(1,-1)){ck(row.record==="node"&&!m.has(key(row.id)),"unique full row");m.set(key(row.id),row)}
  ck(m.size===4&&f.nodes===m.size&&f.missing===0,"expected complete fixture");
  const root=key(h.root);ck(m.get(root)?.display===ns+"Witness"+(label==="inductive"?"":"."+label),"root");
  const adj=(r,mode)=> {
    const body=["definition","theorem","opaque"].includes(r.kind);
    const core=r.kind==="quotient"?[]:[...r.type_constants,...(body?r.value_constants:[])];
    if(mode!=="expression"&&r.kind==="inductive")core.push(...r.constructors);
    if(mode==="package")core.push(...r.type_projections,...r.value_projections,...r.type_literals,...r.value_literals,...r.group,...r.parent,...r.quotient_package,...r.rules.flatMap(x=>[x.constructor,...x.constants,...x.projections,...x.literals]));
    return [...new Set(core.map(key))];
  };
  function walk(mode){const q=[root],seen=new Set(q);for(let i=0;i<q.length;i++){const row=m.get(q[i]);ck(!!row,"missing hard reference");for(const n of adj(row,mode)){ck(m.has(n),"unresolved endpoint");if(!seen.has(n)){seen.add(n);q.push(n)}}}return {nodes:q.length,axioms:q.map(x=>m.get(x)).filter(x=>x.kind==="axiom").map(x=>x.display).sort()};}
  const expression=walk("expression"),collector=walk("collector"),pkg=walk("package"),cached=h.lean_collect_axioms.map(x=>m.get(key(x))?.display).sort();
  ck(same(collector,{nodes:4,axioms:[ax]})&&same(pkg,collector),"full collector/package closure");
  ck(same(expression,label==="guarded"?{nodes:3,axioms:[ax]}:label==="plain"?{nodes:2,axioms:[]}:{nodes:1,axioms:[]}),"expression-only control");
  ck(same(cached,label==="plain"?[]:[ax]),"actual cache result");
  const manifest=[...m].sort(([a],[b])=>a.localeCompare(b)).map(([id,row])=>[id,row]);
  return {result:{expression,collector,package:pkg,cached},manifest};
 }
 const results=inputs.map((v,i)=>parse(v,keys[i]));
 ck(same(results[0].manifest,results[1].manifest)&&same(results[0].manifest,results[2].manifest),"same declaration records all roots");
 const goodChecks=checks;
 let neg=0;for(const mutate of [
  rows=>rows.splice(rows.findIndex(x=>x.display===ax),1),
  rows=>{const g=rows.find(x=>x.display===ns+"Witness.guarded");g.type_constants=g.type_constants.filter(x=>!x.some(p=>p[1]==="guardProp"))},
  rows=>{const w=rows.find(x=>x.display===ns+"Witness");w.constructors=w.constructors.filter(x=>!x.some(p=>p[1]==="guarded"))}
 ]){const rs=inputs[0].trimEnd().split(/\r?\n/).map(JSON.parse);mutate(rs);try{parse(rs.map(JSON.stringify).join("\n"),"plain")}catch(e){neg++}}
 ck(neg===3,"all deletion controls rejected");
 return {status:"ACTUAL_NATIVE_FIXTURE_ROLE_POLICY_RECHECK_NOT_RH_KERNEL_RECHECK",checks:goodChecks,negativeControls:neg,results:Object.fromEntries(results.map((x,i)=>[keys[i],x.result]))};
}
function sourceDelta(a,b){const count=s=>(s.match(/^private /gm)||[]).length;const normalize=s=>s.replace(/^private /gm,"");if(normalize(a)!==normalize(b))throw Error("collector text changed beyond private visibility");return {oldPrivate:count(a),newPrivate:count(b),removedPrivate:count(a)-count(b),identicalAfterVisibilityNormalization:true}}
const [dir,oldSource,newSource]=process.argv.slice(2);
if(!dir||!oldSource||!newSource)throw Error('usage: node cycle_policy_recheck.mjs OUTPUT_DIR OLD_CollectAxioms.lean NEW_CollectAxioms.lean');
const names=["plain","inductive","guarded"], pins=["18abf8240d610702b09f90799f1caf38c2e27798564c12b0628aad7fc10409a3","00b4214284994aae41d6455c3119ff4c9c6e597b2c434afe8f74b610f69e0867","58adbbfe8c8b371bd9430a8a05ed0899dd9e4b0f3f8694684f5028d1d922a718"];
const data=names.map((n,i)=>{const v=fs.readFileSync(dir+'/'+n+'.jsonl');if(createHash('sha256').update(v).digest('hex')!==pins[i])throw Error('graph SHA256 '+n);return v.toString('utf8')});
const old=fs.readFileSync(oldSource),current=fs.readFileSync(newSource);
const blob=v=>createHash('sha1').update('blob '+v.length+'\0').update(v).digest('hex');
if(blob(old)!=="dc9897059a4463dfd143a2b3f8fbb4f4a3c3f154"||blob(current)!=="e789f33849debe5cc1f1d9bc60aa3e54a56df0d9")throw Error('collector source blob mismatch');
console.log(JSON.stringify({delta:sourceDelta(old.toString('utf8'),current.toString('utf8')),result:auditPolicy(data)},null,2));

// Static role-frontier replay on actual prior native fixture, not a new Lean run.
import fs from "node:fs";
import path from "node:path";
import crypto from "node:crypto";
const specs={
  "graph": [
    "compute/rh-native-cycle-witness-20261124/outputs/plain.jsonl",
    "e5096a6d88ffc80f98fdc73c75f9f67f73b9f41d"
  ],
  "report": [
    "compute/rh-native-cycle-rc1-isolated-20261124/outputs/rc1_result.json",
    "b16d10ce49ce3876b3d287db6ab6c6133f66aa2f"
  ],
  "source": [
    "compute/rh-native-cycle-rc1-isolated-20261124/outputs/CollectAxioms.lean",
    "e789f33849debe5cc1f1d9bc60aa3e54a56df0d9"
  ]
};
function staticAudit(x){
 const root="CathedralAxiomCycle.Witness",plain=root+".plain",guarded=root+".guarded",ax="CathedralAxiomCycle.guardProp";
 const names=[root,plain,guarded],key=JSON.stringify,sort=a=>[...new Set(a)].sort();
 let checks=0,negative=0;
 const ck=(b,m)=>{if(!b)throw Error(m);checks++};
 const eq=(a,b)=>key(a)===key(b);
 const show=n=>{if(!Array.isArray(n)||!n.every(p=>p.length===2&&p[0]==="s"&&typeof p[1]==="string"&&!p[1].includes(".")))throw Error("unexpected fixture name");return n.map(p=>p[1]).join(".")};
 const raw=x.graph.trimEnd().split("\n").map(JSON.parse),h=raw[0],f=raw.at(-1),g=new Map();
 ck(h.schema==="cathedral-kernel-v2"&&show(h.root)===plain&&h.lean_collect_axioms.length===0&&f.nodes===4&&f.missing===0,"native fixture graph");
 for(const r of raw.slice(1,-1)){ck(r.record==="node"&&!g.has(r.display)&&show(r.id)===r.display,"unique native tagged node");
  g.set(r.display,{deps:[...r.type_constants,...r.value_constants,...(r.kind==="inductive"?r.constructors:[])].map(show),axiom:r.kind==="axiom"});}
 ck(g.size===4&&eq(g.get(root).deps,[plain,guarded])&&eq(g.get(plain).deps,[root])&&eq(g.get(guarded).deps,[ax,root])&&g.get(ax).axiom,"native graph topology");
 const report=JSON.parse(x.report);ck(eq(report.rows.map(r=>r.root),names)&&eq(report.rows.map(r=>r.cached),[[ax],[],[ax]])&&report.rows.every(r=>eq(r.fresh,[ax])),"actual rc1 cached/fresh reports");
 ck(x.source.includes("collectExpr v.type *> collectExpr v.value")&&x.source.indexOf("if let some axs := extFind? env c then")<x.source.indexOf("match env.checked.get.find? c with")&&x.source.includes("v.ctors.forM (collect extFind?)"),"pinned collector type/value and cached frontier");
 const cache=new Map(report.rows.map(r=>[r.root,r.cached]));
 function exact(seeds,graph=g){const q=[...seeds],seen=new Set(),out=[];while(q.length){const n=q.pop();if(seen.has(n))continue;seen.add(n);const r=graph.get(n);if(!r)throw Error("missing graph node "+n);if(r.axiom)out.push(n);q.push(...r.deps)}return sort(out)}
 function cached(seeds,table=cache){return sort(seeds.flatMap(n=>{if(!table.has(n))throw Error("unknown boundary "+n);return table.get(n)}))}
 const role=(type,value)=>({type:{exact:exact(type),cached:cached(type)},value:{exact:exact(value),cached:cached(value)},combined:{exact:exact([...type,...value]),cached:cached([...type,...value])}});
 const alias=role([root],[plain]);ck(eq(alias.type.exact,[ax])&&eq(alias.type.cached,[ax])&&eq(alias.value.exact,[ax])&&eq(alias.value.cached,[])&&eq(alias.combined.exact,alias.combined.cached),"alias masks lost value-role reference");
 const empty=role([],[]);ck(eq(empty.combined.exact,[])&&eq(empty.combined.cached,[]),"empty control");
 let cases=0,omissions=0,masked=0;
 for(let i=0;i<8;i++)for(let j=0;j<8;j++){
  const t=names.filter((_,k)=>(i>>k)&1),v=names.filter((_,k)=>(j>>k)&1),r=role(t,v),u=i|j;
  ck(eq(r.combined.exact,u?[ax]:[]),"exact role union");
  ck(eq(r.combined.cached,u&5?[ax]:[]),"cached role union");
  const missing=!eq(r.combined.exact,r.combined.cached);
  ck(missing===(u===2),"boundary masking criterion");
  if(missing)omissions++;
  if(!missing&&(!eq(r.type.exact,r.type.cached)||!eq(r.value.exact,r.value.cached)))masked++;
  cases++;
 }
 ck(cases===64&&omissions===3&&masked===12,"enumeration census");
 function rejects(fn,prefix){let ok=false;try{fn()}catch(e){ok=e.message.startsWith(prefix)}ck(ok,"negative "+prefix);negative++}
 const broken=new Map(g);broken.delete(ax);rejects(()=>exact([plain],broken),"missing graph node");rejects(()=>cached(["not.present"]),"unknown boundary");
 const stripped=role([],[plain]);ck(!eq(stripped.combined.exact,stripped.combined.cached),"dropping type witness creates undercount");negative++;
 const repaired=new Map(cache);repaired.set(plain,[ax]);ck(eq(cached([plain],repaired),exact([plain])),"complete cache control");
 return {status:"STATIC_ROLE_FRONTIER_MODEL_USING_NATIVE_FIXTURE_NOT_NEW_LEAN_EXECUTION",checks,negative,rolePairs:cases,combinedOmissions:omissions,maskedRoleOmissions:masked,aliasPrediction:alias,unmaskedValueOnly:stripped};
}
const dir=process.argv[2];if(!dir)throw Error("provide checkout of cathedral-research-state");
const x={};for(const [k,[p,sha]] of Object.entries(specs)){const b=fs.readFileSync(path.join(dir,p));if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==sha)throw Error("blob "+k);x[k]=b.toString("utf8")}
console.log(JSON.stringify(staticAudit(x),null,2));

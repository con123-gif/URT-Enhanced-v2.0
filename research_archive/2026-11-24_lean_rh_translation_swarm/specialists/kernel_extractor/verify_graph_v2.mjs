import fs from 'node:fs';
import readline from 'node:readline';
function validate(records) {
 const fail=s=>{throw Error(s)};
 const id=a=>{if(!Array.isArray(a)||!a.every(p=>Array.isArray(p)&&p.length===2&&typeof p[1]==="string"&&(p[0]==="s"||(p[0]==="n"&&/^(0|[1-9]\d*)$/.test(p[1])))))fail("invalid Name ID");return JSON.stringify(a)};
 const ids=a=>{if(!Array.isArray(a))fail("expected Name array");return a.map(id)};
 const name=(...parts)=>parts.map(p=>["s",p]);
 const primNat=id(name("Nat")),primChar=id(name("Char","ofNat")),primStr=id(name("String","ofList"));
 const quotExpected=[name("Eq"),name("Quot"),name("Quot","mk"),name("Quot","lift"),name("Quot","ind")].map(id);
 const sameSet=(a,b)=>new Set(a).size===a.length&&a.length===b.length&&a.every(k=>b.includes(k));
 function literalRefs(nat,str,actual){
   if(typeof nat!=="boolean"||typeof str!=="boolean")fail("missing literal flags");
   const expected=[...(nat?[primNat]:[]),...(str?[primChar,primStr]:[])];
   const got=ids(actual);
   if(!sameSet(got,expected))fail("literal implicit dependency mismatch");
   return got;
 }
 const known=new Set(["axiom","definition","theorem","opaque","quotient","inductive","constructor","recursor"]);
 const valueKinds=new Set(["definition","theorem","opaque"]);
 let header=null,footer=null;
 const nodes=new Map();
 for(const r of records){
   if(!r||typeof r!=="object"||footer)fail("bad record or data after footer");
   if(r.record==="header"){if(header||nodes.size||r.schema!=="cathedral-kernel-v2")fail("bad header");header=r;id(r.root);ids(r.lean_collect_axioms);continue;}
   if(!header)fail("missing header");
   if(r.record==="footer"){footer=r;continue;}
   if(r.record!=="node"&&r.record!=="missing")fail("unexpected record");
   const k=id(r.id);if(nodes.has(k))fail("duplicate node "+k);
   if(r.record==="missing"){nodes.set(k,{...r,all:[],collector:[]});continue;}
   if(!known.has(r.kind)||typeof r.has_value!=="boolean"||typeof r.unsafe!=="boolean"||typeof r.partial!=="boolean")fail("bad node fields");
   id(r.module);
   const tc=ids(r.type_constants),vc=ids(r.value_constants),tp=ids(r.type_projections),vp=ids(r.value_projections),ct=ids(r.constructors),gr=ids(r.group),pa=ids(r.parent);
   if(!Array.isArray(r.rules))fail("bad recursor rule list");
   const tl=literalRefs(r.type_nat_literal,r.type_str_literal,r.type_literals);
   const vl=literalRefs(r.value_nat_literal,r.value_str_literal,r.value_literals);
   const mutual=ids(r.mutual_block),quot=ids(r.quotient_package);
   if(!sameSet(quot,r.kind==="quotient"?quotExpected:[]))fail("quotient package mismatch");
   if(!valueKinds.has(r.kind)&&mutual.length)fail("unexpected mutual metadata");
   const rr=r.rules.flatMap(rule=>[id(rule.constructor),...ids(rule.constants),...ids(rule.projections),...literalRefs(rule.nat_literal,rule.str_literal,rule.literals)]);
   if(!r.has_value&&(vc.length||vp.length||vl.length))fail("body refs without body");
   if(!valueKinds.has(r.kind)&&r.has_value)fail("unexpected value field");
   if(r.kind!=="inductive"&&ct.length)fail("unexpected constructors");
   if(r.kind!=="constructor"&&pa.length)fail("unexpected parent");
   if(r.kind!=="recursor"&&rr.length)fail("unexpected rules");
   if(r.kind!=="inductive"&&r.kind!=="recursor"&&gr.length)fail("unexpected group");
   const all=[...new Set([...tc,...vc,...tp,...vp,...ct,...gr,...pa,...rr,...tl,...vl,...mutual,...quot])];
   const collector=r.kind==="quotient"?[]:[...new Set([...tc,...(valueKinds.has(r.kind)?vc:[]),...(r.kind==="inductive"?ct:[])])];
   nodes.set(k,{...r,all,collector});
 }
 if(!header||!footer||!Number.isSafeInteger(footer.nodes)||footer.nodes!==nodes.size)fail("incomplete stream or node count mismatch");
 const root=id(header.root);if(nodes.get(root)?.kind!=="theorem")fail("root theorem absent");
 let missing=0,bodyMissing=0,edges=0,extraEdges=0;
 for(const [k,n] of nodes){
   if(n.record==="missing")missing++;
   if(valueKinds.has(n.kind)&&!n.has_value)bodyMissing++;
   for(const d of n.all)if(!nodes.has(d))fail("omitted referenced node: "+k+" -> "+d);
   edges+=n.all.length;extraEdges+=n.all.length-n.collector.length;
 }
 if(footer.missing!==missing)fail("missing counter mismatch");
 function walk(field){
   const seen=new Set([root]),todo=[root];let ax=[],unresolved=0;
   for(let i=0;i<todo.length;i++){
     const n=nodes.get(todo[i]);if(n.record==="missing")unresolved++;
     if(n.kind==="axiom")ax.push(todo[i]);
     for(const d of n[field])if(!seen.has(d)){seen.add(d);todo.push(d);}
   }
   return {seen,ax:new Set(ax),unresolved};
 }
 const full=walk("all"),core=walk("collector");
 if(full.seen.size!==nodes.size)fail("unreachable extra node records");
 const builtin=new Set(ids(header.lean_collect_axioms));
 const absent=[...builtin].filter(k=>!core.ax.has(k)),unexpected=[...core.ax].filter(k=>!builtin.has(k));
 const standard=new Set([id([["s","Classical"],["s","choice"]]),id([["s","propext"]]),id([["s","Quot"],["s","sound"]])]);
 const unusual=[...builtin].filter(k=>!standard.has(k)).map(k=>JSON.parse(k));
 const sorryId=id([["s","sorryAx"]]);
 const trustComplete=missing===0&&bodyMissing===0&&absent.length===0&&unexpected.length===0;
 return {status:trustComplete?"REFERENCE_CLOSURE_AND_AXIOM_AGREEMENT":"INCOMPLETE_OR_AXIOM_MISMATCH",nodes:nodes.size,edges,extraStructuralEdges:extraEdges,collectorNodes:core.seen.size,missing,bodyMissing,collectorUnresolved:core.unresolved,leanAxiomCount:builtin.size,collectorAxiomCount:core.ax.size,absent:absent.map(k=>JSON.parse(k)),unexpected:unexpected.map(k=>JSON.parse(k)),structuralOnlyAxioms:[...full.ax].filter(k=>!core.ax.has(k)).map(k=>JSON.parse(k)),nonstandardAxioms:unusual,sorryAxInBuiltin:builtin.has(sorryId),sorryAxInStructuralClosure:full.ax.has(sorryId),unsafeOrPartialNodes:[...nodes.values()].filter(n=>n.unsafe||n.partial).map(n=>n.id)};
}
function selfTest(){
 const n=s=>[["s",s]], root=n("root"),leaf=n("leaf"),ax=n("ax"),ind=n("I"),ctor=n("ctor"),pr=n("projectionOnly"),missing=n("missing");
 const node=(id,kind,extra={})=>({record:"node",id,display:id[0][1],module:n("Fixture"),kind,unsafe:false,partial:false,has_value:["theorem","opaque","definition"].includes(kind),type_constants:[],value_constants:[],type_projections:[],value_projections:[],constructors:[],group:[],parent:[],rules:[],type_nat_literal:false,type_str_literal:false,value_nat_literal:false,value_str_literal:false,type_literals:[],value_literals:[],mutual_block:[],quotient_package:[],...extra});
 const rs=[{record:"header",schema:"cathedral-kernel-v2",root,lean_collect_axioms:[ax]},node(root,"theorem",{value_constants:[leaf,ind],value_projections:[pr]}),node(leaf,"theorem",{value_constants:[ax]}),node(ax,"axiom"),node(ind,"inductive",{constructors:[ctor],group:[ind]}),node(ctor,"constructor",{type_constants:[ind],parent:[ind]}),node(pr,"definition"),{record:"footer",nodes:6,missing:0}];
 const tests=[];
 const check=(label,f)=>{if(!f())throw Error("FAILED "+label);tests.push(label)};
 const v=validate(rs);
 check("cyclic closure and axiom equality",()=>v.status==="REFERENCE_CLOSURE_AND_AXIOM_AGREEMENT"&&v.nodes===6&&v.collectorNodes===5);
 check("projection and group edges retained",()=>v.extraStructuralEdges===2);
 check("unusual axiom exposed",()=>v.nonstandardAxioms.length===1);
 const incomplete=rs.map(r=>r.record==="footer"?{...r,missing:1}:r.display==="projectionOnly"?{record:"missing",id:pr,display:"projectionOnly"}:r);
 check("missing boundary",()=>validate(incomplete).status==="INCOMPLETE_OR_AXIOM_MISMATCH");
 const changed=rs.map(r=>r.record==="header"?{...r,lean_collect_axioms:[]}:r);
 check("axiom disagreement",()=>validate(changed).unexpected.length===1);
 const body=rs.map(r=>r.display==="leaf"?{...r,has_value:false,value_constants:[],type_constants:[ax]}:r);
 check("hidden theorem body",()=>validate(body).bodyMissing===1);
 const wrong=rs.map(r=>r.display==="root"?{...r,value_constants:[leaf,ind,missing]}:r);
 check("omitted endpoint",()=>{try{validate(wrong);return false}catch(e){return e.message.includes("omitted referenced node")}});
 check("missing footer",()=>{try{validate(rs.slice(0,-1));return false}catch(e){return e.message.includes("incomplete")}});
 const sorry=n("sorryAx"), rs2=rs.map(r=>r.record==="header"?{...r,lean_collect_axioms:[sorry]}:r.display==="leaf"?{...r,value_constants:[sorry]}:r.display==="ax"?node(sorry,"axiom"):r);
 check("sorryAx exposure",()=>validate(rs2).sorryAxInBuiltin&&validate(rs2).sorryAxInStructuralClosure);
 const prim=n("Nat"), ch=[["s","Char"],["s","ofNat"]], st=[["s","String"],["s","ofList"]];
 const lit=rs.slice(0,-1).map(r=>r.display==="root"?{...r,value_nat_literal:true,value_str_literal:true,value_literals:[prim,ch,st]}:r);
 lit.push(node(prim,"inductive"),node(ch,"definition"),node(st,"definition"),{record:"footer",nodes:9,missing:0});
 check("literal implicit references retained",()=>validate(lit).nodes===9&&validate(lit).collectorNodes===5);
 check("literal omitted despite flag",()=>{try{validate(lit.map(r=>r.display==="root"?{...r,value_literals:[prim]}:r));return false}catch(e){return e.message.includes("literal implicit dependency mismatch")}});
 const qp=[n("Eq"),n("Quot"),[["s","Quot"],["s","mk"]],[["s","Quot"],["s","lift"]],[["s","Quot"],["s","ind"]]];
 const qrs=rs.slice(0,-1).map(r=>r.display==="root"?{...r,value_constants:[...r.value_constants,qp[2]]}:r);
 qrs.push(node(qp[0],"inductive"),...qp.slice(1).map(q=>node(q,"quotient",{quotient_package:qp})),{record:"footer",nodes:11,missing:0});
 check("quotient package retained",()=>validate(qrs).nodes===11);
 check("quotient member omitted",()=>{try{validate(qrs.map(r=>r.kind==="quotient"?{...r,quotient_package:qp.slice(1)}:r));return false}catch(e){return e.message.includes("quotient package mismatch")}});
 return {passed:tests.length,tests};
}
if(process.argv[2]==='--self-test'){console.log(JSON.stringify(selfTest(),null,2));}
else if(process.argv[2]){
 const lines=readline.createInterface({input:fs.createReadStream(process.argv[2]),crlfDelay:Infinity});
 const rows=[];for await(const line of lines){if(line.trim())rows.push(JSON.parse(line));}
 const out=validate(rows);console.log(JSON.stringify(out,null,2));
 if(out.status!=='REFERENCE_CLOSURE_AND_AXIOM_AGREEMENT'||out.sorryAxInBuiltin||out.sorryAxInStructuralClosure||out.nonstandardAxioms.length||out.structuralOnlyAxioms.length||out.unsafeOrPartialNodes.length)process.exitCode=1;
}else{console.error('usage: node verify_graph.mjs --self-test | GRAPH.jsonl');process.exitCode=2;}

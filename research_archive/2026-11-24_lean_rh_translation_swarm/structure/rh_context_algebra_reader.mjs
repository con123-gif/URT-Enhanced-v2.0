function makeReader(records){
 const names=[null],levels=[{zero:true}],terms=[],depth=[],decls=[];
 let edges=0;
 const safeId=(v,n,kind)=>{if(!Number.isSafeInteger(v)||v<0||v>=n)throw Error("bad "+kind+" ref "+v);return v};
 function name(id){
  safeId(id,names.length,"name");
  const a=[];while(id){const n=names[id];a.push(n.str!==undefined?JSON.stringify(n.str):"#"+n.i);id=n.pre}
  return a.reverse().join(".")||"_";
 }
 function simpleName(id){
  safeId(id,names.length,"name");
  const a=[];while(id){const n=names[id];if(n.str!==undefined&&!/^[\p{L}_][\p{L}\p{N}_'₂₃]*$/u.test(n.str))return "name("+name(names.indexOf(n))+")";a.push(n.str??("#"+n.i));id=n.pre}
  return a.reverse().join(".")||"_";
 }
 function U(id){safeId(id,levels.length,"level");return id===0?"0":"U"+id}
 function dep(i){edges++;return depth[safeId(i,terms.length,"expression")]}
 function decl(kind,m){safeId(m.name,names.length,"declaration name");safeId(m.type,terms.length,"type");
  if(depth[m.type]!==0)throw Error("open declaration type");
  if(Object.hasOwn(m,"value")&&depth[safeId(m.value,terms.length,"value")]!==0)throw Error("open declaration value");
  for(const r of m.rules||[])if(depth[safeId(r.rhs,terms.length,"rule rhs")]!==0)throw Error("open rule rhs");
  decls.push({kind,...m});
 }
 for(const r of records){
  if(Object.hasOwn(r,"meta"))continue;
  if(Object.hasOwn(r,"in")){if(r.in!==names.length)throw Error("name order");const a=r.str||r.num;if(!a)throw Error("unknown name");safeId(a.pre,names.length,"prefix");names.push(a);continue}
  if(Object.hasOwn(r,"il")){if(r.il!==levels.length)throw Error("level order");levels.push(r);continue}
  if(Object.hasOwn(r,"ie")){
   if(r.ie!==terms.length)throw Error("expression order");
   const ks=Object.keys(r).filter(x=>x!=="ie");if(ks.length!==1)throw Error("expression fields");
   const k=ks[0],v=r[k];let need;
   switch(k){
    case "bvar":if(!Number.isSafeInteger(v)||v<0||v>=Number.MAX_SAFE_INTEGER)throw Error("invalid bvar");need=v+1;break;
    case "sort":U(v);need=0;break;
    case "const":safeId(v.name,names.length,"constant name");v.us.forEach(U);need=0;break;
    case "app":need=Math.max(dep(v.fn),dep(v.arg));break;
    case "lam":case "forallE":safeId(v.name,names.length,"binder name");need=Math.max(dep(v.type),Math.max(0,dep(v.body)-1));break;
    case "letE":safeId(v.name,names.length,"let name");need=Math.max(dep(v.type),dep(v.value),Math.max(0,dep(v.body)-1));break;
    case "proj":safeId(v.typeName,names.length,"projection name");need=dep(v.struct);break;
    case "mdata":need=dep(v.expr);break;
    case "natVal":case "strVal":need=0;break;
    default:throw Error("unknown "+k)
   }
   terms.push({kind:k,v});depth.push(need);continue
  }
  if(r.inductive){for(const [k,group] of [["inductive",r.inductive.types],["constructor",r.inductive.ctors],["recursor",r.inductive.recs]])for(const d of group)decl(k,d);continue}
  const k=Object.keys(r)[0];if(!["def","thm","axiom","opaque","quot"].includes(k))throw Error("unknown declaration");decl(k,r[k]);
 }
 // Linear-size exact term equations. Context C is a nearest-binder-first stack.
 // e_i is a function of that context, NOT a globally closed expression.
 function equations(){
  const out=[];
  for(let i=0;i<terms.length;i++){
   const {kind:k,v}=terms[i];const E=(n,c="C")=>`E${n}(${c})`;let rhs;
   switch(k){
    case "bvar":rhs=`C[${v}]`;break;
    case "sort":rhs=`Sort(${U(v)})`;break;
    case "const":rhs=`Const(N${v.name},[${v.us.map(U).join(",")}])`;break;
    case "app":rhs=`Apply(${E(v.fn)},${E(v.arg)})`;break;
    case "lam":case "forallE":rhs=`${k==="lam"?"Lambda":"Pi"}(N${v.name},${v.binderInfo},${E(v.type)}, t => ${E(v.body,"push(t,C)")})`;break;
    case "letE":rhs=`Let(N${v.name},${E(v.type)},${E(v.value)},${v.nondep}, t => ${E(v.body,"push(t,C)")})`;break;
    case "proj":rhs=`Project(N${v.typeName},${v.idx},${E(v.struct)})`;break;
    case "mdata":rhs=`Metadata(${JSON.stringify(v.data)},${E(v.expr)})`;break;
    case "natVal":rhs=`NatLiteral(${v})`;break;
    case "strVal":rhs=`StringLiteral(${JSON.stringify(v)})`;break;
   }
   out.push(`E${i}(C) [len(C)>=${depth[i]}] := ${rhs}`);
  }
  return out;
 }
 // Optional readable expansion. A budget failure is explicit, never silently changes the expression.
 function pretty(root,budget=5000,initial=[]){
  safeId(root,terms.length,"root");if(depth[root]>initial.length)throw Error("unbound root "+root);
  let used=0,serial=0;const render=(i,ctx)=>{
   if(++used>budget)throw Error("expansion budget exceeded; use shared equations");
   if(depth[i]>ctx.length)throw Error("unbound subexpression");
   const {kind:k,v}=terms[i];
   switch(k){
    case "bvar":return ctx[v];
    case "sort":return v===0?"Prop":`Sort ${U(v)}`;
    case "const":return simpleName(v.name)+(v.us.length?`.{${v.us.map(U).join(",")}}`:"");
    case "app":return `(${render(v.fn,ctx)} ${render(v.arg,ctx)})`;
    case "lam":case "forallE":{
     const t=`v${serial++}`,type=render(v.type,ctx),body=render(v.body,[t,...ctx]);
     const pair=v.binderInfo==="implicit"?["{","}"]:v.binderInfo==="strictImplicit"?["⦃","⦄"]:v.binderInfo==="instImplicit"?["[","]"]:["(",")"];
     return `${k==="lam"?"λ":"Π"} ${pair[0]}${t} : ${type}${pair[1]}, ${body}`;
    }
    case "letE":{const t=`v${serial++}`;return `let ${t} : ${render(v.type,ctx)} := ${render(v.value,ctx)}; ${render(v.body,[t,...ctx])}`}
    case "proj":return `proj[${simpleName(v.typeName)},${v.idx}](${render(v.struct,ctx)})`;
    case "mdata":return `metadata(${JSON.stringify(v.data)},${render(v.expr,ctx)})`;
    case "natVal":return v;
    case "strVal":return JSON.stringify(v);
   }
  };
  return {text:render(root,initial),visits:used};
 }
 return {names,levels,terms,depth,decls,edges,equations,pretty,simpleName};
}

function selftest(blocks){
 let ex=0,edges=0,decls=0,open=0,rendered=0;const examples=[],failures=[];
 for(let i=0;i<blocks.length;i++){
  const r=makeReader(blocks[i]);const eq=r.equations();
  if(eq.length!==r.terms.length)throw Error("lost equations");
  ex+=r.terms.length;edges+=r.edges;open+=r.depth.filter(x=>x>0).length;decls+=r.decls.length;
  for(const d of r.decls){const t=r.pretty(d.type);rendered++;const val=Object.hasOwn(d,"value")?r.pretty(d.value):null;
   if(val)rendered++;
   for(const u of d.rules||[]){r.pretty(u.rhs);rendered++}
   examples.push({fixture:i,name:r.simpleName(d.name),kind:d.kind,type:t.text,value:val?.text});
  }
  if(i===3){const p=r.pretty(3).text;if(p!=="λ {v0 : Sort U1}, λ (v1 : v0), v1")throw Error("dependent identity wrong "+p)}
  if(i===4){const p=r.pretty(3).text;if(p!=="let v0 : Nat := Nat.zero; v0")throw Error("let scope wrong "+p)}
  if(i===5){try{r.pretty(1);throw Error("accepted free")}catch(e){if(!String(e).includes("unbound root"))throw e} }
 }
 const bad=[()=>makeReader([{ie:0,app:{fn:0,arg:0}}]),()=>makeReader([{in:1,str:{pre:0,str:"bad"}},{ie:0,bvar:0},{thm:{name:1,levelParams:[],type:0,value:0,all:[1]}}]),()=>makeReader(blocks[3]).pretty(3,1)];
 for(const f of bad){try{f()}catch(e){failures.push(String(e))}}
 if(failures.length!==3)throw Error("missing negative control");
 // Deep shared expression: exact equations remain linear while expanded display is explicitly bounded.
 const rec=[{ie:0,bvar:0}];for(let i=1;i<100000;i++)rec.push({ie:i,app:{fn:i-1,arg:i-1}});
 const r=makeReader(rec);
 if(r.edges!==199998||r.depth.at(-1)!==1||r.equations().length!==100000)throw Error("large graph");
 return {fixtures:blocks.length,expressions:ex,childEdges:edges,openExpressions:open,declarations:decls,renderedRoots:rendered,negativeControls:failures,large:{expressions:r.terms.length,edges:r.edges,equations:100000},examples};
}


import fs from 'node:fs';
const [input,out]=process.argv.slice(2);
if(!input)throw Error('provide fixture blocks JSON');
const r=selftest(JSON.parse(fs.readFileSync(input,'utf8')));
const s=JSON.stringify(r,null,2);
if(out)fs.writeFileSync(out,s);else console.log(s);

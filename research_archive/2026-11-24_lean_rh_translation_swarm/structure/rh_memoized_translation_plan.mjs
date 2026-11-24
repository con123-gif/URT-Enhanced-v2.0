function extract(source) {
 const lines=source.split(/\r?\n/),nodes=[],byName=new Map(),prefix="UpperTheory.LiteratureTheorems.";
 const hdr=/^theorem UpperTheory\.LiteratureTheorems\.([\p{L}\p{N}_'’₂₃]+) \(O : _root_\.UpperTheory\.LiteratureTheorems\.OpenLiteratureStatements\) : (.+?)( :=| where)$/u;
 const bare=/^[\p{L}_][\p{L}\p{N}_'’₂₃.]*$/u;
 for(let i=0;i<lines.length;i++){
  const m=lines[i].match(hdr);if(!m)continue;
  let j=i+1;while(j<lines.length&&(!lines[j].trim()||/^\s/.test(lines[j])))j++;
  const body=lines.slice(i+1,j).join("\n").trimEnd(),name=prefix+m[1],str=body.trim();
  if(byName.has(name))throw Error("duplicate "+name);
  const token=str.startsWith("(")&&str.endsWith(")")?str.slice(1,-1).trim():str;
  const n={name,header:lines[i],body,type:m[2],start:i+1,end:j,style:m[3].trim(),alias:m[3]===" :="&&bare.test(token)?token:null,refs:[]};
  nodes.push(n);byName.set(name,n);i=j-1;
 }
 for(const n of nodes){
  for(const m of n.body.matchAll(/(?:_root_\.)?UpperTheory\.LiteratureTheorems\.([\p{L}\p{N}_'’₂₃]+)/gu)){
   const t=prefix+m[1];if(byName.has(t))n.refs.push(t);
  }
  if(n.header!==lines[n.start-1]||n.body!==lines.slice(n.start,n.end).join("\n").trimEnd())throw Error("roundtrip "+n.name);
 }
 return nodes;
}

function plan(nodes,roots){
 const map=new Map(nodes.map(n=>[n.name,n]));if(map.size!==nodes.length)throw Error("duplicate node");
 const reachable=new Set(),stack=roots.slice();
 while(stack.length){const id=stack.pop();if(reachable.has(id))continue;const n=map.get(id);if(!n)throw Error("missing endpoint "+id);reachable.add(id);for(const d of n.refs)stack.push(d)}
 const indeg=new Map([...reachable].map(n=>[n,0]));
 for(const id of reachable)for(const d of map.get(id).refs)indeg.set(d,indeg.get(d)+1);
 const q=[...reachable].filter(id=>indeg.get(id)===0),mult=new Map();
 for(const r of roots)mult.set(r,(mult.get(r)||0n)+1n);
 let naiveVisits=0n,naiveChars=0n,naiveEdges=0n,uniqueChars=0,edges=0,aliases=0;
 const order=[];
 for(let i=0;i<q.length;i++){
  const id=q[i],n=map.get(id),w=mult.get(id)||0n,b=n.header.length+n.body.length;
  naiveVisits+=w;naiveChars+=w*BigInt(b);naiveEdges+=w*BigInt(n.refs.length);
  uniqueChars+=b;edges+=n.refs.length;if(n.alias)aliases++;
  order.push(id);
  for(const d of n.refs){mult.set(d,(mult.get(d)||0n)+w);const k=indeg.get(d)-1;indeg.set(d,k);if(k===0)q.push(d)}
 }
 if(order.length!==reachable.size)throw Error("cycle: use SCC condensation, not DAG path counts");
 return {roots,naiveVisits:naiveVisits.toString(),uniqueVisits:reachable.size,naiveSourceChars:naiveChars.toString(),uniqueSourceChars:uniqueChars,naiveEdgeVisits:naiveEdges.toString(),uniqueOccurrenceEdges:edges,aliasCandidates:aliases,otherDeclarations:reachable.size-aliases,dependencyFirstOrder:order.reverse(),multiplicity:order.map(id=>({id,visits:mult.get(id).toString()}))};
}

function tests(){
 const n=(name,refs=[],alias=null)=>({name,refs,alias,header:name,body:""});
 let g=[n("a",["b","c"]),n("b",["d"]),n("c",["d"]),n("d",[],"outside")];
 const p=plan(g,["a"]);if(p.naiveVisits!=="5"||p.uniqueVisits!==4||p.aliasCandidates!==1)throw Error("diamond");
 const d=plan(g,["a","a"]);if(d.naiveVisits!=="10"||d.uniqueVisits!==4)throw Error("duplicate roots");
 let rejected=0;
 for(const bad of [[n("a",["a"])],[n("a",["x"])]])try{plan(bad,["a"])}catch(e){rejected++}
 if(rejected!==2)throw Error("negative tests");
 const deep=Array.from({length:101},(_,i)=>n(String(i),i?[String(i-1),String(i-1)]:[]));
 const huge=plan(deep,["100"]);
 if(huge.naiveVisits!==((1n<<101n)-1n).toString()||huge.uniqueVisits!==101)throw Error("large multiplicity");
 return {diamond:true,duplicateRoots:true,cycleAndMissingRejected:rejected,largeMultiplicity:true};
}


import fs from 'node:fs';
const [input,output]=process.argv.slice(2);
if(!input||input==='selftest'){console.log(JSON.stringify(tests()));}
else {
 const nodes=extract(fs.readFileSync(input,'utf8'));
 const p=plan(nodes,nodes.filter(n=>n.style==='where').map(n=>n.name));
 const data={status:'SOURCE_REFERENCE_CANDIDATES_NOT_KERNEL_GRAPH',nodes,plan:p,tests:tests()};
 const s=JSON.stringify(data,null,2);
 if(output)fs.writeFileSync(output,s);else console.log(s);
}

function boundAlgebra(){
 // Upper-bound monomials c*x^(a/8 + b*eps/8 + d*C*eps/8).
 // All expressions in this certificate are nonnegative; x>=3, eps>0, C>=0.
 const nodes=[], by=new Map();
 const same=(a,b)=>a.every((v,i)=>v===b[i]);
 const add=(a,b)=>a.map((v,i)=>v+b[i]);
 const ge=(a,b)=>a.every((v,i)=>v>=b[i]);
 function put(id,c,e,rule,parents,reason){
  if(by.has(id)||typeof c!=="bigint"||c<0n||e.length!==3||!e.every(Number.isSafeInteger))throw Error("bad bound");
  const z={id,c,e,rule,parents,reason};by.set(id,z);nodes.push(z);return z;
 }
 const get=id=>{if(!by.has(id))throw Error("unknown premise "+id);return by.get(id)};
 function atom(id,c,e,reason){return put(id,BigInt(c),e,"premise",[],reason)}
 function mul(id,parents){
  let c=1n,e=[0,0,0];for(const p of parents){const a=get(p);c*=a.c;e=add(e,a.e)}
  return put(id,c,e,"multiply",parents,"nonnegative factors");
 }
 function sum(id,parents){
  let c=0n,e=get(parents[0]).e.slice();
  for(const p of parents){const a=get(p);c+=a.c;e=e.map((v,i)=>Math.max(v,a.e[i]))}
  return put(id,c,e,"sum/common upper exponent",parents,"x>=1, eps>0, C>=0");
 }
 function absorb(id,p,k,shift,condition){
  const a=get(p);
  if(condition!=="26<=x^(3eps/8)"||k!==26n||!same(shift,[0,3,0])||a.c>k)throw Error("unproved absorption");
  return put(id,1n,add(a.e,shift),"absorb",[p],condition)
 }
 atom("aE/(xb)",2,[0,0,0],"0<=aE<=2xb");
 atom("x/m",1,[4,8,0],"m>=x^(1/2-eps)>0");
 atom("xm/k",1,[0,0,0],"k>=xm>0");
 atom("n/nT",2,[0,1,0],"nT>=n*x^(-eps/8)/2");
 atom("m",1,[4,4,0],"m<=x^(1/2+eps/2)");
 atom("delta",1,[0,0,0],"nT2/n<=1");
 atom("k/n^2",1,[4,-8,0],"k<=n^2*x^(1/2-eps)");
 atom("1/delta",1,[0,8,0],"delta=nT2/n>=x^(-eps)>0");
 atom("x^eps",1,[0,8,0],"exact");
 atom("x^(2eps)",1,[0,16,0],"exact");
 atom("P",1,[0,0,8],"P=x^(C eps)");
 atom("2",2,[0,0,0],"exact");
 atom("4X",4,[4,8,0],"X=x^(1/2+eps)");
 atom("4/x",2,[0,0,0],"x>=3 implies 4/x<=2");
 mul("B1/Q",["aE/(xb)","x/m"]);
 mul("B2/Q",["aE/(xb)","xm/k"]);
 mul("B3/Q",["2","n/nT","m","x^eps"]);
 mul("B4/Q",["delta","n/nT","k/n^2","x^(2eps)"]);
 sum("B/Q",["B1/Q","B2/Q","B3/Q","B4/Q"]);
 mul("Err/Q",["P","B/Q"]);
 mul("2Err/Q",["2","Err/Q"]);
 sum("2Err/Q+4/x",["2Err/Q","4/x"]);
 mul("correction",["1/delta","2Err/Q+4/x"]);
 sum("Gx",["4X","correction"]);
 absorb("final","Gx",26n,[0,3,0],"26<=x^(3eps/8)");
 const expected=[[2n,[4,8,0]],[2n,[0,0,0]],[4n,[4,13,0]],[2n,[4,9,0]],[10n,[4,13,0]],[26n,[4,21,8]],[1n,[4,24,8]]];
 for(const [i,id] of ["B1/Q","B2/Q","B3/Q","B4/Q","B/Q","Gx","final"].entries()){const a=get(id);if(a.c!==expected[i][0]||!same(a.e,expected[i][1]))throw Error("source algebra mismatch "+id)}
 // Independently replay every generated multiplication and addition rule; reject a changed premise/rule outside fixed whitelist.
 for(const n of nodes){
  if(n.rule==="premise")continue;
  const ps=n.parents.map(get);
  if(n.rule==="multiply"){
   if(n.c!==ps.reduce((a,b)=>a*b.c,1n)||!same(n.e,[0,1,2].map(i=>ps.reduce((a,b)=>a+b.e[i],0))))throw Error("bad multiplication");
  }else if(n.rule==="sum/common upper exponent"){
   if(n.c!==ps.reduce((a,b)=>a+b.c,0n)||ps.some(p=>!ge(n.e,p.e)))throw Error("bad sum");
  }else if(n.rule==="absorb"){
   if(n.c!==1n||ps[0].c>26n||!same(n.e,add(ps[0].e,[0,3,0])))throw Error("bad absorption");
  }else throw Error("unknown rule");
 }
 return {nodes:nodes.map(n=>({...n,c:n.c.toString()})),result:{coefficient:"1",exponentEighths:[4,24,8]},theorem:"Gx <= x^(1/2+(C+3)*eps)",entryInequality:"Q*(delta/2)*(Gx-4X)<=Err+2Q/x, Q>0, delta>0; divide by Q*delta/2 to get Gx<=4X+(2Err/Q+4/x)/delta",source:"proposition_size_bound, original normalized four terms, no assumptions removed"};
}

function urtRead(data){
 // A_v(z)=1+z sum_{v->u} A_u(z), exact path polynomial.
 // Evaluate once per shared DAG node at q=(pi/e)*exp(i*2pi/phi^2).
 const phi=(1+Math.sqrt(5))/2,theta=2*Math.PI/(phi*phi),k=Math.PI/Math.E,q=[k*Math.cos(theta),k*Math.sin(theta)];
 const map=new Map(data.nodes.map(n=>[n.name,n])),memo=new Map(),active=new Set(),exact=new Map();
 const mul=(a,b)=>[a[0]*b[0]-a[1]*b[1],a[0]*b[1]+a[1]*b[0]];
 const plus=(a,b)=>[a[0]+b[0],a[1]+b[1]];
 let visits=0,edges=0,naiveVisits=0;
 function read(id){
  if(memo.has(id))return memo.get(id);
  if(active.has(id))throw Error("cycle needs SCC");const n=map.get(id);if(!n)throw Error("missing node");active.add(id);visits++;
  let a=[1,0],p=[1n];
  for(const d of n.refs){const b=read(d);edges++;a=plus(a,mul(q,b));const s=exact.get(d);for(let i=0;i<s.length;i++){if(i+1===p.length)p.push(0n);p[i+1]+=s[i]}}
  active.delete(id);memo.set(id,a);exact.set(id,p);return a;
 }
 function naive(id){naiveVisits++;let a=[1,0];for(const d of map.get(id).refs)a=plus(a,mul(q,naive(d)));return a}
 let maxError=0,maxPolynomialError=0,counts=0n;const roots=[];
 for(const id of data.plan.roots){
  const a=read(id),b=naive(id),p=exact.get(id);
  maxError=Math.max(maxError,Math.hypot(a[0]-b[0],a[1]-b[1]));
  let z=[0,0];for(let i=p.length-1;i>=0;i--)z=plus(mul(q,z),[Number(p[i]),0]);
  maxPolynomialError=Math.max(maxPolynomialError,Math.hypot(a[0]-z[0],a[1]-z[1]));
  const count=p.reduce((a,b)=>a+b,0n);counts+=count;
  roots.push({id,coefficients:p.map(String),pathOccurrences:count.toString(),urt:a});
 }
 if(counts!==BigInt(naiveVisits)||maxError>1e-10||maxPolynomialError>1e-10)throw Error("URT read mismatch");
 return {q,visits,edges,naiveVisits,exactPathOccurrences:counts.toString(),maxError,maxPolynomialError,roots,limits:"Complex q is a noninjective readout, not proof validity or exact identity. Exact source and all edges remain authoritative. Polynomial replay is for small graph audit; q scalar pass O(V+E); polynomial coefficient propagation has extra depth cost."}
}

import fs from 'node:fs';
const file=process.argv[2];
const r={algebra:boundAlgebra(),urt:file?urtRead(JSON.parse(fs.readFileSync(file,'utf8'))):null};
console.log(JSON.stringify(r,null,2));

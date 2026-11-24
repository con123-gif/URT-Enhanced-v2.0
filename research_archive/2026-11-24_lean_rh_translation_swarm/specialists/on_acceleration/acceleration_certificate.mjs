// Standalone Node >=18 certificate. Run: node acceleration_certificate.mjs /path/to/upstream-checkout
// Fetches the exact pinned files via local git show, verifies Git blob IDs.
// Scope: source scanner and shared-cache simulation; no kernel proof claims.
import {execFileSync} from "node:child_process";
import {createHash} from "node:crypto";
const rev="40e56bab026552e089d7afcfeff08d2defb9c005";
const manifest=[
  {
    "path": "src/Main.lean",
    "sha": "dbd5db70bc11b35f18fa5751216ab335321e7bfc",
    "bytes": 433
  },
  {
    "path": "src/Supplements/Kernels/MainTheorems.lean",
    "sha": "6a542d7ce969a791fd12ce575f587e6bc29044bf",
    "bytes": 740
  },
  {
    "path": "src/Supplements/Kernels/MainTheoremsAll.lean",
    "sha": "dfba1103254494332179b9c893fabe94ac6a45a1",
    "bytes": 136
  },
  {
    "path": "src/Supplements/Kernels/MainTheoremsCritical.lean",
    "sha": "34d133d368c93518bf52927bada45b00ec5fe982",
    "bytes": 319
  },
  {
    "path": "src/Formalism/GammaFactorNonvanishing/CritLine.lean",
    "sha": "95fa4da5c50119db164aa93944d106f22fdb576d",
    "bytes": 1825
  },
  {
    "path": "src/Formalism/GammaFactorNonvanishing/RhOfRight.lean",
    "sha": "3604637147a33e72248faddd775ea750e7846ead",
    "bytes": 2459
  },
  {
    "path": "src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean",
    "sha": "ee340012ab19713a8acfecf8adc6a331cbc2f1a4",
    "bytes": 1213
  },
  {
    "path": "src/Development/AutomorphicArithmetic/CharacterBoxes/EveryCharacter.lean",
    "sha": "6ac769568b67f85f33565ba3e1eef7b91f53c55f",
    "bytes": 1215
  },
  {
    "path": "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/RowSrc.lean",
    "sha": "f769999ac5e49241993e5efbf81e4d2cded18acd",
    "bytes": 433
  },
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/EveryCharacterOfLiteratureOfVWin.lean",
    "sha": "a13ba1f8c38d4dbf2ddd809fbf9610a007936c24",
    "bytes": 97393
  },
  {
    "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/VwinOfRow.lean",
    "sha": "4cba179acd45ac08d3cad21f51c9b9d62715a9a4",
    "bytes": 515
  }
];
function check(ok,msg){if(!ok)throw Error(msg);}

function byteLength(s){let n=0;for(const c of s){const k=c.codePointAt(0);n+=k<128?1:k<2048?2:k<65536?3:4;}return n;}

function mask(s){let out=[],depth=0,quote=false;for(let i=0;i<s.length;i++){let c=s[i],d=s[i+1];if(depth){if(c==="/"&&d==="-"){depth++;out.push("  ");i++;}else if(c==="-"&&d==="/"){depth--;out.push("  ");i++;}else out.push(c==="\n"?"\n":" ");continue;}if(quote){if(c==="\\"&&d!==undefined){out.push("  ");i++;}else{if(c==='"')quote=false;out.push(c==="\n"?"\n":" ");}continue;}if(c==="/"&&d==="-"){depth++;out.push("  ");i++;continue;}if(c==="-"&&d==="-"){while(i<s.length&&s[i]!=="\n"){out.push(" ");i++;}if(i<s.length)out.push("\n");continue;}if(c==='"'){quote=true;out.push(" ");continue;}out.push(c);}return {text:out.join(""),unfinished:!!depth||quote};}

function scan(s){const m=mask(s),imports=[],unparsed=[],decls=[];let ln=0;for(const line of m.text.split("\n")){ln++;const x=line.trim();const a=x.match(/^(?:(?:public|private|meta)\s+)*import\s+(.+)$/u);if(a){for(const name of a[1].split(/\s+/u)){if(/^[\p{L}_][\p{L}\p{N}_'.\p{M}]*$/u.test(name))imports.push(name);else unparsed.push({line:ln,text:x});}}else if(/^(?:(?:public|private|meta)\s+)*import(?:\s|$)/u.test(x))unparsed.push({line:ln,text:x});const b=x.match(/^(?:(?:private|protected|noncomputable|unsafe|partial|public|meta)\s+)*(theorem|lemma|def|abbrev|opaque|axiom|structure|inductive|class)\s+([\p{L}_][\p{L}\p{N}_'.\p{M}]*)/u);if(b)decls.push({kind:b[1],name:b[2],line:ln});}return {imports:[...new Set(imports)],unparsed,decls,unfinished:m.unfinished};}

function moduleName(path){return path.replace(/^src\//,"").replace(/\.lean$/,"").replace(/\//g,".");}

function runCache(files,workers){const cache=new Map();let coldBytes=0,baselineBytes=0,coldMisses=0,warmMisses=0,t=Date.now(),baseline;for(let w=0;w<workers;w++){baseline=files.map(f=>{baselineBytes+=byteLength(f.source);return scan(f.source);});}const baselineMs=Date.now()-t;t=Date.now();let result;for(let w=0;w<workers;w++){result=files.map(f=>{const key="lex-v1:"+f.sha;if(!cache.has(key)){cache.set(key,scan(f.source));coldBytes+=byteLength(f.source);if(w===0)coldMisses++;else warmMisses++;}return cache.get(key);});check(JSON.stringify(result)===JSON.stringify(baseline),"cache changed lexical output");}return {workers,files:files.length,baselineBytes,sharedParseBytes:coldBytes,coldMisses,warmMisses,baselineMs,sharedMs:Date.now()-t,records:files.map((f,i)=>({path:f.path,sha:f.sha,bytes:byteLength(f.source),...result[i]}))};}

function graph(records){const g=new Map(records.map(r=>[moduleName(r.path),r.imports]));let internal=0,boundary=0;const names=new Set(g.keys()),missing=new Set(),reverse=new Map();for(const [a,deps]of g){for(const b of deps){if(names.has(b))internal++;else{boundary++;missing.add(b);}if(!reverse.has(b))reverse.set(b,[]);reverse.get(b).push(a);}}const visited=new Set(["Main"]),stack=["Main"];while(stack.length){const a=stack.pop();for(const b of g.get(a)||[]){if(!visited.has(b)){visited.add(b);if(g.has(b))stack.push(b);}}}const indeg=new Map([...g.keys()].map(a=>[a,0]));for(const [a,deps]of g)for(const b of deps)if(g.has(b))indeg.set(a,indeg.get(a)+1);let q=[...indeg.keys()].filter(a=>indeg.get(a)===0);for(let i=0;i<q.length;i++){for(const a of reverse.get(q[i])||[]){const x=indeg.get(a)-1;indeg.set(a,x);if(x===0)q.push(a);}}check(q.length===g.size,"cycle in scanned subgraph");return {localModules:g.size,internalEdges:internal,boundaryEdges:boundary,boundaryNames:missing.size,reachableLocal:[...visited].filter(v=>g.has(v)).length,unresolvedNames:[...missing],localTopologicalOrder:q};}

function affected(oldRecords,newRecords){const old=new Map(oldRecords.map(r=>[moduleName(r.path),r])),cur=new Map(newRecords.map(r=>[moduleName(r.path),r])),rev=new Map();for(const records of [old,cur])for(const [a,r]of records)for(const b of r.imports){if(!rev.has(b))rev.set(b,new Set());rev.get(b).add(a);}const changed=[...new Set([...old.keys(),...cur.keys()])].filter(a=>old.get(a)?.sha!==cur.get(a)?.sha);const seen=new Set(changed),q=[...changed];for(let i=0;i<q.length;i++)for(const a of rev.get(q[i])||[])if(!seen.has(a)){seen.add(a);q.push(a);}return {changed,invalidated:q};}

function rank2(d,b,phase){const n=d.length,scale=Math.sqrt((Math.PI/Math.E)/n),u=new Float64Array(n),v=new Float64Array(n);for(let i=0;i<n;i++){u[i]=scale*Math.cos(i*phase);v[i]=scale*Math.sin(i*phase);}const dd=Float64Array.from(d),bb=Float64Array.from(b),a=[1,0,1,0,0];let updates=0;function add(i,sign){const w=sign/dd[i],x=u[i],y=v[i],z=bb[i];a[0]+=w*x*x;a[1]+=w*x*y;a[2]+=w*y*y;a[3]+=w*x*z;a[4]+=w*y*z;}for(let i=0;i<n;i++)add(i,1);function update(i,D,B){check(D>0,"nonpositive diagonal");add(i,-1);dd[i]=D;bb[i]=B;add(i,1);updates++;}function coeff(){const det=a[0]*a[2]-a[1]*a[1];check(det>0,"nonpositive rank2 determinant");return [(a[2]*a[3]-a[1]*a[4])/det,(a[0]*a[4]-a[1]*a[3])/det];}function score(i,c=coeff()){return (bb[i]-u[i]*c[0]-v[i]*c[1])/dd[i];}function all(){const c=coeff(),x=Float64Array.from(dd,(_,i)=>score(i,c));let z0=0,z1=0,err=0;for(let i=0;i<n;i++){z0+=u[i]*x[i];z1+=v[i]*x[i];}for(let i=0;i<n;i++)err=Math.max(err,Math.abs(dd[i]*x[i]+u[i]*z0+v[i]*z1-bb[i]));return {x,err};}return {update,score,all,updates:()=>updates};}

function rankTest(d0,b0,phase,m){let d=Float64Array.from(d0),b=Float64Array.from(b0),n=d.length,inc=rank2(d,b,phase),indices=Array.from({length:m},(_,j)=>(j*7919+3)%n),is=[],rs=[];let t=Date.now();for(let j=0;j<m;j++){const i=indices[j];inc.update(i,2+j%7,1+j%11);is.push(inc.score((i+1)%n));}let incrementalMs=Date.now()-t;t=Date.now();for(let j=0;j<m;j++){const i=indices[j];d[i]=2+j%7;b[i]=1+j%11;rs.push(rank2(d,b,phase).score((i+1)%n));}const rebuildMs=Date.now()-t;let max=0;for(let j=0;j<m;j++)max=Math.max(max,Math.abs(is[j]-rs[j]));const a=inc.all(),f=rank2(d,b,phase).all();for(let i=0;i<n;i++)max=Math.max(max,Math.abs(a.x[i]-f.x[i]));check(max<1e-9&&a.err<1e-9&&f.err<1e-9,"rank2 update disagreement");return {n,updates:m,maxScoreDifference:max,incrementalResidual:a.err,rebuildResidual:f.err,incrementalMs,rebuildMs,incrementalContributionTerms:2*m,rebuildContributionTerms:n*m,initialBuildExcluded:true,fullOutputRequiresN:true};}

function certificate(files){check(scan('/- import Fake\n/- inner -/ -/\nimport Real\n-- import Bad\ntheorem x : True := by trivial').imports.join(",")==="Real","comment test");const a=runCache(files,15),g=graph(a.records);check(a.warmMisses===0,"warm misses");check(a.baselineBytes===15*a.sharedParseBytes,"expected distinct sample blobs");check(a.records.every(r=>!r.unfinished&&r.unparsed.length===0),"unsupported syntax in selected sample");const old=a.records.map(r=>r.path.endsWith("/CharacterBoxes/MainConclusion.lean")?{...r,sha:"0c7a305f2f4622443d984efa170faa9378050546",imports:["Development.AutomorphicArithmetic.CharacterBoxes.RiemannHypothesisOfEveryCharacter"]}:r);const invalid=affected(old,a.records);check(invalid.invalidated.includes("Main"),"old/new reverse invalidation missed Main");const d=Array.from({length:a.records.length},()=>1),b=d.slice(),names=new Map(a.records.map((r,i)=>[moduleName(r.path),i]));for(let i=0;i<a.records.length;i++){b[i]+=a.records[i].imports.length;for(const j of a.records[i].imports)if(names.has(j))d[names.get(j)]++;}const phase=2*Math.PI/(((1+Math.sqrt(5))/2)**2),real=rankTest(d,b,phase,20),n=50000,dd=Float64Array.from({length:n},(_,i)=>1+i%7),bb=Float64Array.from({length:n},(_,i)=>1+i%11);const golden=rankTest(dd,bb,phase,60),ablation=rankTest(dd,bb,Math.PI/2,60);return {sourceRevision:rev,cache:{...a,records:undefined},graph:g,invalid,actualModuleRank2:real,syntheticRank2:{golden,periodicAblation:ablation},records:a.records};}
const checkout=process.argv[2];if(!checkout)throw Error("Supply a local Git checkout of "+rev);
const files=manifest.map(r=>{const raw=execFileSync("git",["-C",checkout,"show",rev+":"+r.path],{maxBuffer:16*1024*1024});const h=createHash("sha1").update(Buffer.from("blob "+raw.length+"\0")).update(raw).digest("hex");check(h===r.sha&&raw.length===r.bytes,"wrong source blob "+r.path);return {path:r.path,sha:h,source:raw.toString("utf8")};});
const result=certificate(files);console.log(JSON.stringify({...result,maxRSSKiB:process.resourceUsage().maxRSS},null,2));

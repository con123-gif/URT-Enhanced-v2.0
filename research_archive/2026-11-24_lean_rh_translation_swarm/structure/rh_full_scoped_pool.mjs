function poolFile(source, module) {
 const lines=source.split(/\r?\n/), groups=[],pool=[],index=new Map();
 let active=null,scopeVersion=0,fields=0,skipped=0,fieldSeen=new Set();
 // Deliberately limited to single-line theorem declarations with an explicit binder
 // and record-style where. Stop at the next nonindented command.
 const hdr=/^(?:theorem|lemma)\s+(\S+)\s+(\(.+\))\s*:\s*(.+)\s+where\s*$/u;
 for(let i=0;i<lines.length;i++){
  const l=lines[i],h=l.match(hdr);
  if(h){active={name:h[1],binder:h[2],type:h[3],header:l,line:i+1,scopeVersion,fields:[]};groups.push(active);fieldSeen=new Set();continue;}
  if(l.trim() && !/^\s/.test(l)){active=null; if(/^(namespace|section|end|open|variable|include|omit|set_option|local|attribute)\b/.test(l))scopeVersion++;continue;}
  if(!active||!l.trim())continue;
  const m=l.match(/^  ([^\s]+) := (.+)$/u);
  if(!m){skipped++;active=null;continue;}
  const [,field,rhs]=m;
  if(fieldSeen.has(field)){skipped++;active=null;continue;}fieldSeen.add(field);
  // Exact lexical pool, scoped to a module, binder string and command-context epoch.
  // Neither equality of elaborated proof terms nor equality of field types is inferred.
  const key=JSON.stringify([active.scopeVersion,active.binder,rhs]);
  let id=index.get(key);
  if(id===undefined){id=pool.length;pool.push({id,rhs,binder:active.binder,scopeVersion:active.scopeVersion,uses:0});index.set(key,id);}
  pool[id].uses++;active.fields.push({field,id,line:i+1});fields++;
 }
 for(const g of groups){
  if(g.header!==lines[g.line-1])throw Error("header roundtrip "+module);
  for(const f of g.fields)if("  "+f.field+" := "+pool[f.id].rhs!==lines[f.line-1])throw Error("field roundtrip "+module);
 }
 if(pool.reduce((a,p)=>a+p.uses,0)!==fields)throw Error("use mismatch");
 return {module,groups,pool,fields,skipped};
}

function coverage(pool,n){
 // Linear histogram for the exact best unit-cost coverage; no phase advantage assumed.
 const hist=new Map();let max=0;
 for(const p of pool){hist.set(p.uses,(hist.get(p.uses)||0)+1);max=Math.max(max,p.uses)}
 let left=n,covered=0;
 for(let i=max;i>0&&left>0;i--){const k=Math.min(left,hist.get(i)||0);covered+=k*i;left-=k}
 return covered;
}

function selftest(){
 const s="theorem a (O : H) : A where\n  f := P O\n  g := Q O\ntheorem b (O : H) : B where\n  f := P O\nopen Other\ntheorem c (O : H) : C where\n  f := P O\ntheorem d (O : H2) : D where\n  f := P O\n";
 const x=poolFile(s,"test");
 if(x.fields!==5||x.pool.length!==4||coverage(x.pool,1)!==2)throw Error("scope isolation or coverage");
 const y=poolFile("theorem e (O : H) : A where\n  f := P O\n    extra\n  g := P O\n","unsupported");
 if(y.fields!==1||y.skipped!==1)throw Error("unsupported continuation");
 // First field in this negative case is only an exact line prefix, not a whole expression.
 return {scopeIsolation:true,roundtrip:true,unsupportedContinuationBoundary:true};
}


import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {performance} from 'node:perf_hooks';
const PIN='40e56bab026552e089d7afcfeff08d2defb9c005';
function run(cmd,args,cwd){const p=spawnSync(cmd,args,{cwd,encoding:'utf8',maxBuffer:64*1024*1024});if(p.status!==0)throw Error(cmd+' '+p.stderr);return p.stdout.trim()}
function* files(dir){for(const e of fs.readdirSync(dir,{withFileTypes:true})){const p=path.join(dir,e.name);if(e.isDirectory())yield* files(p);else if(e.isFile()&&e.name.endsWith('.lean'))yield p}}
function scan(root,out,pinned){
 const t=performance.now(),fd=fs.openSync(path.join(out,'record_pool.jsonl'),'w');
 const metrics={status:'SOURCE_TEXT_CANDIDATES_NOT_SEMANTIC_EQUIVALENCE',pin:pinned,modules:0,bytes:0,recordGroups:0,fields:0,distinctScopedProducers:0,duplicates:0,unsupportedBoundaries:0,modulesWithRepeatedProducers:0,roundtrippedFields:0};
 const hist=new Map();
 try{for(const f of files(root)){
  const b=fs.readFileSync(f),mod=path.relative(root,f),r=poolFile(b.toString('utf8'),mod);
  metrics.modules++;metrics.bytes+=b.length;metrics.recordGroups+=r.groups.length;metrics.fields+=r.fields;
  metrics.distinctScopedProducers+=r.pool.length;metrics.duplicates+=r.fields-r.pool.length;metrics.unsupportedBoundaries+=r.skipped;
  metrics.roundtrippedFields+=r.fields;
  for(const p of r.pool)hist.set(p.uses,(hist.get(p.uses)||0)+1);
  if(r.fields>r.pool.length)metrics.modulesWithRepeatedProducers++;
  if(r.fields)fs.writeSync(fd,JSON.stringify({...r,sourceSHA256:crypto.createHash('sha256').update(b).digest('hex')})+'\n');
 }}finally{fs.closeSync(fd)}
 if(pinned&&(metrics.modules!==175187||metrics.bytes!==1030531854))throw Error('source corpus counts differ from verified prior scan');
 if(metrics.fields!==metrics.roundtrippedFields||metrics.fields!==metrics.distinctScopedProducers+metrics.duplicates)throw Error('accounting');
 metrics.frequencyHistogram=Object.fromEntries(hist);metrics.seconds=(performance.now()-t)/1000;metrics.maxRssKiB=process.resourceUsage().maxRSS;
 metrics.limits=['one-line record-field candidates only; unsupported syntax not translated','exact textual pooling within module and binder/command epoch; not elaborated equality','all occurrence locations retained','no URT-specific speedup or actual human translation time measured'];
 fs.writeFileSync(path.join(out,'summary.json'),JSON.stringify(metrics,null,2));console.log(JSON.stringify(metrics,null,2));
 run('zstd',['-q','-f','--rm','-3',path.join(out,'record_pool.jsonl')],out);
}
const args=process.argv.slice(2);
console.log(JSON.stringify(selftest()));
if(args[0]!=='selftest'){
 const i=args.indexOf('--out');if(i<0)throw Error('missing --out');
 const out=path.resolve(args[i+1]);fs.mkdirSync(out,{recursive:true});
 const j=args.indexOf('--source-dir');
 if(j>=0)scan(path.resolve(args[j+1]),out,null);
 else {
  const tmp=fs.mkdtempSync(path.join(os.tmpdir(),'rh-pool-'));
  try{
   run('git',['init','-q',tmp],tmp);
   run('git',['remote','add','origin','https://github.com/leanprover-community/riemann-hypothesis.git'],tmp);
   run('git',['-c','protocol.version=2','fetch','-q','--depth=1','--filter=blob:none','origin',PIN],tmp);
   run('git',['checkout','-q','--detach','FETCH_HEAD'],tmp);
   if(run('git',['rev-parse','HEAD'],tmp)!==PIN)throw Error('pin mismatch');
   scan(path.join(tmp,'src'),out,PIN);
  }finally{fs.rmSync(tmp,{recursive:true,force:true})}
 }
}

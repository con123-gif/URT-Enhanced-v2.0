import fs from 'node:fs';
import {createHash} from 'node:crypto';
import {spawn} from 'node:child_process';
import {createInterface} from 'node:readline';
import {once} from 'node:events';
import {performance} from 'node:perf_hooks';
const PIN='40e56bab026552e089d7afcfeff08d2defb9c005';
const specs={challenge:[1356147,'0cf670099286ae98715f17a659c3db76257ea31373ecbbbca6e3ea2d6fdc2b26',53242,329321,6112241,326835],solution:[38823812,'45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf',1484705,14065150,1065214335,14065054]};
const names=['riemannHypothesis','rhOfAll','allChi','UpperTheory.FinalTheorems.everyCharacter','UpperTheory.FinalTheorems.everyCharacter_of_row','Formalism.VW.rh_of_every','GlobalTheory.divTied3_read','GlobalTheory.T.divisionCompatible_at_readIdentifications','Deduction.poleData_abstract','Deduction.landau_cauchy','Deduction.landau_pole_asym','PositivityTheory.Xj7N.norm_small_le','PositivityTheory.Xj7N.local_unit_map_surjective',"Avac.iwaQ_of'",'ModelDimension.cusp_form_extension_vanishing'];
const witnesses=[[14065054,6490658,1065212062],[14065053,6490658,1065212061],[14065052,6497236,1065212058],[14065051,6497236,1065212057],[13125901,997980690,997980699],[341189,6497237,6497286]];
const need=(x,m)=>{if(!x)throw Error(m)},key=JSON.stringify,tagged=n=>key(n.split('.'));
const int=(x,max)=>Number.isSafeInteger(x)&&x>=0&&x<=max,parts=a=>Array.isArray(a)&&a.length>0&&a.every(x=>typeof x==='string'||int(x,Number.MAX_SAFE_INTEGER));
async function verify(file,s){const h=createHash('sha256');let n=0;for await(const b of fs.createReadStream(file)){n+=b.length;h.update(b)}need(n===s[0]&&h.digest('hex')===s[1],'manifest identity')}
async function scan(file,s,queries,mode){
 const lookup=new Map(),order=queries.map((_,i)=>i),out=queries.map(()=>[]),seen=new Uint8Array(Math.ceil((s[3]+1)/8));
 if(mode!=='shared'){need(['golden','periodic'].includes(mode),'mode');const a=mode==='golden'?2*Math.PI/((1+Math.sqrt(5))/2)**2:2*Math.PI/24;order.sort((i,j)=>Math.cos(a*(j+1))*Math.PI/Math.E-Math.cos(a*(i+1))*Math.PI/Math.E||i-j)}
 for(const i of order){const k=tagged(queries[i]);need(!lookup.has(k),'duplicate query');lookup.set(k,i)}
 let rows=0,refs=0,meta=0,root=false;const p=spawn('zstd',['-dc','--',file],{stdio:['ignore','pipe','inherit']}),done=once(p,'close');done.catch(()=>{});
 try{for await(const line of createInterface({input:p.stdout,crlfDelay:Infinity})){
 const r=JSON.parse(line);need(int(r.id,s[3])&&parts(r.nameParts)&&typeof r.kind==='string'&&r.kind.length>0,'row');const b=1<<(r.id&7),i=r.id>>>3;need(!(seen[i]&b),'duplicate ID');seen[i]|=b;
 need(Array.isArray(r.refs)&&r.refs.every(x=>Number.isSafeInteger(x)&&x!==0&&(x>0?x<=s[4]:-x-1<=s[3])),'hard range');need(Array.isArray(r.mutualBlock)&&r.mutualBlock.every(x=>int(x.id,s[3])&&parts(x.nameParts)&&typeof x.exported==='boolean'),'metadata');
 rows++;refs+=r.refs.length;meta+=r.mutualBlock.length;root||=r.id===s[5];const j=lookup.get(key(r.nameParts));if(j!==undefined){need(!out[j].length,'duplicate exact name');out[j].push(r)}
 }const [code]=await done;need(code===0,'zstd exit');need(rows===s[2]&&root,'census');return {out,rows,refs,meta};}catch(e){p.kill();await done.catch(()=>{});throw e}
}
async function main(){const [kind,file,mode]=process.argv.slice(2),s=specs[kind];need(s&&file&&['baseline','shared','golden','periodic'].includes(mode),'usage: KIND FILE MODE');const t=performance.now();await verify(file,s);const verifyMs=performance.now()-t,start=performance.now();let r;
 if(mode==='baseline'){r={out:[],rows:0,refs:0,meta:0};for(const q of names){const x=await scan(file,s,[q],'shared');r.out.push(x.out[0]);for(const k of ['rows','refs','meta'])r[k]+=x[k]}}else r=await scan(file,s,names,mode);
 const scanMs=performance.now()-start;await verify(file,s);if(kind==='solution'){for(let i=0;i<witnesses.length;i++){const [id,t,v]=witnesses[i],x=r.out[i][0];need(x&&x.id===id&&x.kind==='thm'&&key(x.refs)===key([t+1,v+1]),'typed witness root mismatch '+names[i])}}else{need(r.out[0][0]?.id===s[5],'challenge root');need(r.out.slice(1,6).every(a=>a.length===0),'unexpected challenge anchor')}
 console.log(key({pin:PIN,kind,mode,verifyMs,scanMs,maxRssKiB:process.resourceUsage().maxRSS,rows:r.rows,refs:r.refs,meta:r.meta,resultSha:createHash('sha256').update(key(r.out)).digest('hex'),matches:names.map((name,i)=>({name,id:r.out[i][0]?.id??null,refs:r.out[i][0]?.refs??null}))}));}
await main();

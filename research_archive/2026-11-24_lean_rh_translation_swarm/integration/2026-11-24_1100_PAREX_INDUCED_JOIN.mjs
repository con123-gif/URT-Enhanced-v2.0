// Replay: node 2026-11-24_1100_PAREX_INDUCED_JOIN.mjs /path/to/upstream-checkout
import {readFileSync} from 'node:fs';
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
const graph=JSON.parse(readFileSync(new URL('./2026-11-24_1100_PAREX_INDUCED_JOIN.json',import.meta.url),'utf8'));
const src={};for(const [k,[p,sha]] of Object.entries(graph.source_ledger)){const b=execFileSync('git',['-C',process.argv[2],'show',graph.pin+':'+p]);const hash=createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex');if(hash!==sha)throw Error('blob '+k);src[k]=b.toString('utf8')}
function check(g,s){
function req(x,m){if(!x)throw Error(m)}
const ids=new Map(g.nodes.map(n=>[n.id,n]));req(ids.size===g.nodes.length,"duplicate id");
let anchors=0;
for(const n of g.nodes){for(const a of n.anchors){req(a.line>0&&s[n.source].split("\n")[a.line-1].includes(a.text),n.id+": "+a.text);anchors++}req(n.ports.length>0,n.id+" empty ports");for(const d of n.needs)req(ids.has(d)||g.frontier.includes(d),"unresolved "+d)}
const todo=[g.root],seen=new Set();while(todo.length){let id=todo.pop();if(seen.has(id))continue;seen.add(id);for(const d of ids.get(id).needs)if(ids.has(d))todo.push(d)}
req(seen.size===ids.size,"detached node");req(JSON.stringify(ids.get("parEx").ports)===JSON.stringify(["irr","dim","tame","central","type"]),"Par fields");req(ids.get("indEx").ports[4].includes("→"),"conditional tameness");req(ids.get("wild").needs.includes("ResEx"),"wild proof");req(ids.get("universalType").ports[0].startsWith("∀ admissible"),"universal type");req(ids.get("centralEquality").needs.includes("WDBasic"),"determinant extension");
for(const [k,v] of Object.entries(g.exact_interfaces))req(s.types.includes(v),"signature "+k);
req(g.exact_interfaces.IndEx.includes("deg φ = 1")&&g.exact_interfaces.IndEx.includes("c ≠ 0"),"IndEx degree or scalar");
return {nodes:ids.size,edges:g.nodes.reduce((a,n)=>a+n.needs.length,0),frontier:g.frontier.length,anchors,interfaces:Object.keys(g.exact_interfaces).length}
}
function negative(g,s){let rejected=0;for(const edit of [g=>g.nodes[1].ports.pop(),g=>g.nodes.find(n=>n.id==="indEx").ports[4]="IsTameWD V",g=>g.nodes.find(n=>n.id==="wild").needs.pop(),g=>g.nodes.find(n=>n.id==="universalType").ports[0]="∃ witnesses",g=>g.nodes.find(n=>n.id==="centralEquality").needs=g.nodes.find(n=>n.id==="centralEquality").needs.filter(x=>x!=="WDBasic"),g=>g.nodes[0].anchors[0].text="invented source"]) {let x=JSON.parse(JSON.stringify(g));edit(x);let fail=false;try{check(x,s)}catch(e){fail=true}if(!fail)throw Error("negative control accepted");rejected++}return rejected}
console.log(check(graph,src),{negative_controls_rejected:negative(graph,src)});

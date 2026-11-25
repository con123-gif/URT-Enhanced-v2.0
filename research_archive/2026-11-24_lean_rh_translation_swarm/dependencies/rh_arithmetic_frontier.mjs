// PARTIAL; native projection not yet executed. See 2026-11-25_0512_ARITHMETIC_FRONTIER.md.
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import crypto from "node:crypto";
import {fileURLToPath} from "node:url";
import {spawnSync} from "node:child_process";
const here=path.dirname(fileURLToPath(import.meta.url));
function readPeer(name,sha){const b=fs.readFileSync(path.join(here,name));if(crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex")!==sha)throw Error("blob "+name);return b.toString("utf8")}
const raw=fs.readFileSync(path.join(here,"rh_arithmetic_frontier.tsv"));
if(crypto.createHash("sha256").update(raw).digest("hex")!=="9b98ff91a61fdbf09266761e21f80460e8b85ec7f977d8504618208afffed28e")throw Error("manifest receipt");
const requests=raw.toString("utf8").trimEnd().split("\n").map(line=>{
 const [id,name,kind,roots,mode]=line.split(" ");const [type,value]=roots.split(",").map(Number);
 if(!Number.isSafeInteger(+id)||!["def","thm"].includes(kind)||![type,value].every(x=>Number.isSafeInteger(x)&&x>0)||!["value","mixed","manifest_only"].includes(mode))throw Error("request shape");
 return {id:+id,name,kind,type,value,mode,origin:mode==="manifest_only"?"authenticated_manifest_only":"authenticated_role_frontier"};
});
if(requests.length!==106||new Set(requests.map(x=>x.id)).size!==106||new Set(requests.map(x=>x.name)).size!==106||requests.filter(x=>x.mode==="value").length!==99||requests.filter(x=>x.mode==="mixed").length!==1||requests.filter(x=>x.mode==="manifest_only").length!==6)throw Error("manifest census");
const peer=readPeer("rh_post151_role_frontier.mjs","83f126194a507eec7cb6c52bdc4758fa7aaef8f4");
const a=peer.indexOf("function collectBatch("),b=peer.indexOf("function readPeer(",a);
if(a<0||b<a)throw Error("peer anchors");
const methods=peer.slice(a,b).replaceAll("post151_frontier.json","arithmetic_frontier.json");
const base=readPeer("rh_targeted_role_witness.mjs","9a3e8b56a0df0b37cb693575742080284ebf302f");
const marker="const here=path.dirname(fileURLToPath(import.meta.url));", c=base.indexOf("export function writeProjection("),d=base.indexOf(marker,c);
if(c<0||d<c||base.indexOf("export function writeProjection(",c+1)>=0)throw Error("base anchors");
// Preserve exactly the tested peer collector and writer, changing only request input and output names.
const start=methods.indexOf("function splice(");
if(start<0)throw Error("splice anchor");
const body=methods.slice(0,start).replace("function newWrite(","export function writeProjection(");
const code=base.slice(0,c)+"const requests="+JSON.stringify(requests)+";\n"+body+"\nconst here="+JSON.stringify(here)+";"+base.slice(d+marker.length);
const args=process.argv.slice(2);
if(args[0]==="verify-manifest"){console.log(JSON.stringify({requests:requests.length,value:99,mixed:1,manifestOnly:6}));process.exit(0)}
if(!args.includes("--out"))throw Error("use --out DIR");
const tmp=fs.mkdtempSync(path.join(os.tmpdir(),"rh-arithmetic-driver-"));
try{const p=path.join(tmp,"driver.mjs");fs.writeFileSync(p,code);const syntax=spawnSync(process.execPath,["--check",p],{stdio:"inherit"});if(syntax.error||syntax.status!==0)throw Error("driver syntax");const result=spawnSync(process.execPath,[p,...args],{stdio:"inherit"});if(result.error)throw result.error;if(result.status!==0)throw Error("projection "+result.status+" "+result.signal)}finally{fs.rmSync(tmp,{recursive:true,force:true})}

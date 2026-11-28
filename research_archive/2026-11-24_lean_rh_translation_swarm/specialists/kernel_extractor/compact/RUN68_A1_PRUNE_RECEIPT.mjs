#!/usr/bin/env node
/*
RUN68 — actual A1 root scan/prune acceptance gap, 28 November 2026.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact source
72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679. Old-pin log separate.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION, continuity; peers a8580b49,
77afc792, 1c21daa8, 39e0f825, 3da4db5a. Reuse their work.
Actual RUN58 driver blob e39ff87e5088064c4186fa6bb7a2a88770ff194f
sets prune_executed before executing and checks only process exit. RUN61
then promotes graph_and_prune_complete without inspecting per-root scan
missing/pending counts, explicit prune/no-drop roster or new bridge
axioms. An exit-zero bounded scan is NOT a complete dependency scan.
The existing full union graph audit is independent and unaffected.
This guard is scoped to the four original/four replacement A1 roots.
No changed mathematical premise or source proof; no global deletion.
The exact RUN58 input is checked against authenticated engine blob
f6d3e7f6047a7895ecf183be3fb54c203f4fc46a and exact generated roster.
Prepare appends a native guard: for each actual root either both fresh
declarations are absent or both checked theorem declarations exist;
the bridge has identical statement and universe parameters, directly
uses the reduced theorem, and both fresh axiom sets are subsets of the
original allowed set. Explicit kernel checking before actual commands.
The independent log parser requires all eight actual scan/prune/guard
records, uniqueness, consistent counts, zero missing, and retains pending.
Never accepts an exit code or a log by itself as native proof evidence.
Actual historical run 45576756833 log blob 56a88d10ce02f0183200d48061f5e91529b94bfd parsed:
rh_of_right no-drop, visited 2000, 1642 values, 358 noValue, 3 axioms,
0 missing, 324 pending. This is old-pin, NOT A1 verification.
Executed JS tests: 7/7 mutated historical logs rejected; 3/3 synthetic
guard-marker failures rejected; 3/3 exact input source mutations rejected;
positive synthetic 8-root log and exact source preparation succeeded.
No local lean/lake or retained archive mounted. GitHub artifact
15236761794 still unexpired, outer digest db4b09f2b0bd50c3a49ff99ca915c694f372adc1b1b6424039f25eb21d179007;
not authenticated or executed locally; registry blob fdf81b31ea0159e642bd295f3944b15e61677101
has no new cache replay. RUN65/66 and RUN67 mathematical candidate preserved.
Native guard is PREPARED only. No native rh_scan/prune/reduce/auto/frontier
execution this run, no RH closure. Do not register a duplicate cold build.
RESUME HERE: in the authorized retained compact workspace execute RUN66,
then after a successful A1 leaf and full graph receipt use this file
--prepare <RHProofTermPrune.lean> <A1ScanPrune.lean> <A1ScanPruneGuarded.lean>.
Before the scan command run the guarded file in place of the original
(or reuse original graph/object if already available; do not rebuild).
Use the same LEAN_PATH including the existing MarkedTransportRun57.olean,
lean --tstack=400000 A1ScanPruneGuarded.lean; record actual exit and log.
Then --audit-log <actual log>; inspect native guard axiom records and
bounded pending counts, retain the full old/new graph and original receipts.
If original leaf fails, repair that concrete diagnostic first.
HANDOFF TO integration, theta, acceleration, audit. A1/star/RH OPEN.
*/
import fs from "node:fs";
import crypto from "node:crypto";
const roots=["Columns.hasType_markOperator","Columns.hasType_markOperator_run55","Data.IsMarked.hasType_markOperator","Data.IsMarked.hasType_markOperator_run57","Data.IsMarked.hasType_prod_markOperator_pow","Data.IsMarked.hasType_prod_markOperator_pow_run57","Data.exists_indexDvd_Bmu_divisible","Data.exists_indexDvd_Bmu_divisible_run57"];
function requireOK(ok,msg){if(!ok)throw Error(msg);}

function audit(log,actualRoots,strict=true){
  const p=new Map(),s=new Map(),g=new Map();
  const expectedP=["RHPruneUnused","RHPruneDependent","RHPruneNoDrop",...actualRoots];
  const expectedS=["RHPruneUnusedReduced",...actualRoots];
  function unique(map,k,v){requireOK(!map.has(k),"duplicate marker "+k);map.set(k,v);}
  for(const raw of log.split(/\r?\n/)){
    const line=raw.replace(/^.*?:\d+:\d+: info: /,"").trim();
    if(line.startsWith("PRUNED ")){
      const m=/^PRUNED (\S+): (\d+) -> (\d+) binders; original bridge checked$/.exec(line);
      requireOK(m&&Number(m[2])>Number(m[3]),"invalid reduction: "+line);
      unique(p,m[1],{kind:"pruned",before:Number(m[2]),after:Number(m[3])});
    } else if(line.startsWith("NO_BINDER_REDUCTION ")){
      const m=/^NO_BINDER_REDUCTION (\S+)$/.exec(line);requireOK(m,"malformed no-drop marker");
      unique(p,m[1],{kind:"no-drop"});
    } else if(line.startsWith("ROOT_SCAN ")){
      const m=/^ROOT_SCAN root=(\S+) visited=(\d+) values=(\d+) noValue=(\d+) axioms=(\d+) missing=(\d+) pending=(\d+)$/.exec(line);
      requireOK(m,"malformed scan marker");const [visited,values,noValue,axioms,missing,pending]=m.slice(2).map(Number);
      requireOK([visited,values,noValue,axioms,missing,pending].every(Number.isSafeInteger),"unsafe count");
      const lim=m[1]==="RHPruneUnusedReduced"?100:2000;
      requireOK(visited>0&&visited<=lim&&missing===0&&visited===values+noValue&&axioms<=noValue&&(!pending||visited===lim),"inconsistent/incomplete scan "+m[1]);
      unique(s,m[1],{visited,values,noValue,axioms,missing,pending});
    } else if(line.startsWith("A1_RUN68_GUARD|")){
      const m=/^A1_RUN68_GUARD\|([^|]+)\|(pruned|no-drop)$/.exec(line);
      requireOK(m,"malformed native guard");unique(g,m[1],m[2]);
    }
  }
  const roster=(map,expected)=>map.size===expected.length&&expected.every(n=>map.has(n));
  requireOK(roster(p,expectedP)&&roster(s,expectedS),"wrong/missing root marker roster");
  requireOK(p.get("RHPruneUnused").before===4&&p.get("RHPruneUnused").after===2&&p.get("RHPruneDependent").before===3&&p.get("RHPruneDependent").after===2&&p.get("RHPruneNoDrop").kind==="no-drop","regression changed");
  if(strict){requireOK(roster(g,actualRoots),"missing/unexpected native guard roster");for(const n of actualRoots)requireOK(g.get(n)===p.get(n).kind,"native guard disagrees with prune "+n);}
  else requireOK(g.size===0,"unexpected guard in historical log");
  return {actualRoots:actualRoots.map(n=>({root:n,...p.get(n),scan:s.get(n),nativeGuardMarker:g.get(n)||null})),completeScans:actualRoots.filter(n=>s.get(n).pending===0).length,guardMarkersComplete:strict,logOnly:true,nativeVerified:false,fullRHReplay:false};
}

function generated(engine,actualRoots){
  const anchor="import Lean\n";
  requireOK(engine.split(anchor).length===2,"engine import anchor");
  return engine.replace(anchor,anchor+"import MarkedTransportRun57\n")+"\n"+actualRoots.map((n,i)=>"rh_scan "+n+" limit 2000\nrh_prune "+n+" as A1Run58Pruned"+i).join("\n")+"\n";
}

function prepare(engine,source,actualRoots){
  requireOK(source===generated(engine,actualRoots),"not exact RUN58 generated input");
  const first="rh_scan "+actualRoots[0]+" limit 2000";
  requireOK(source.split(first).length===2,"actual root boundary");
  const guard=`
-- RUN68: audit actual fresh declarations independently of the log text.
private def a1Run68PruneGuard (src dst : Lean.Name) :
    Lean.Elab.Command.CommandElabM Unit := do
  let env ← getEnv
  let br := Lean.Name.str dst "original"
  let .thmInfo oi ← Lean.getConstInfo src |
    Lean.throwError "RUN68 original not a theorem"
  let allowed : Array Lean.Name := #[\`propext, \`Classical.choice, \`Quot.sound]
  let oa ← Lean.collectAxioms src
  unless oa.all (fun x => allowed.contains x) do
    Lean.throwError "RUN68 original axiom outside allowed roster"
  unless env.contains dst == env.contains br do
    Lean.throwError "RUN68 partial fresh theorem/bridge pair"
  if env.contains dst then
    let .thmInfo ri ← Lean.getConstInfo dst |
      Lean.throwError "RUN68 reduced declaration not a theorem"
    let .thmInfo bi ← Lean.getConstInfo br |
      Lean.throwError "RUN68 bridge not a theorem"
    unless ri.levelParams == oi.levelParams &&
        bi.levelParams == oi.levelParams && bi.type == oi.type do
      Lean.throwError "RUN68 changed original bridge statement/universes"
    unless bi.value.getUsedConstants.contains dst do
      Lean.throwError "RUN68 bridge does not use reduced theorem"
    let ra ← Lean.collectAxioms dst
    let ba ← Lean.collectAxioms br
    unless ra.all (fun x => oa.contains x && allowed.contains x) &&
        ba.all (fun x => oa.contains x && allowed.contains x) do
      Lean.throwError "RUN68 new or unexpected axiom"
    Lean.logInfo m!"A1_RUN68_AXIOMS|{src}|{oa}|{ra}|{ba}"
    Lean.logInfo m!"A1_RUN68_GUARD|{src}|pruned"
  else
    Lean.logInfo m!"A1_RUN68_AXIOMS|{src}|{oa}"
    Lean.logInfo m!"A1_RUN68_GUARD|{src}|no-drop"
`;
  return source.replace(first,"set_option debug.skipKernelTC false\nset_option Elab.async false\n"+first)+guard+"\n"+actualRoots.map((n,i)=>"run_cmd a1Run68PruneGuard ``"+n+" (Lean.Name.mkSimple \"A1Run58Pruned"+i+"\")").join("\n")+"\n";
}
const [mode,...args]=process.argv.slice(2);
if(mode==="--prepare"&&args.length===3){
  const engine=fs.readFileSync(args[0]);
  const hash=crypto.createHash("sha1").update("blob "+engine.length+"\0").update(engine).digest("hex");
  requireOK(hash==="f6d3e7f6047a7895ecf183be3fb54c203f4fc46a","wrong engine blob");
  fs.writeFileSync(args[2],prepare(engine.toString("utf8"),fs.readFileSync(args[1],"utf8"),roots),{flag:"wx"});
  console.log(JSON.stringify({prepared:true,nativeVerified:false}));
}else if(mode==="--audit-log"&&args.length===1){
  console.log(JSON.stringify(audit(fs.readFileSync(args[0],"utf8"),roots,true),null,2));
}else if(mode==="--historical-log"&&args.length===1){
  const raw=fs.readFileSync(args[0]);
  const hash=crypto.createHash("sha1").update("blob "+raw.length+"\0").update(raw).digest("hex");
  requireOK(hash==="56a88d10ce02f0183200d48061f5e91529b94bfd","wrong historical log blob");
  console.log(JSON.stringify(audit(raw.toString("utf8"),["Formalism.VW.rh_of_right"],false),null,2));
}else throw Error("use --prepare engine generated output | --audit-log log | --historical-log log");

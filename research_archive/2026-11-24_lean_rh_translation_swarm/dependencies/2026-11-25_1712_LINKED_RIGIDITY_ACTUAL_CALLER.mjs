// 2026-11-25 lane 12. Actual linked rigidity caller; SOURCE-MATCHED / PREPARED.
// Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; mission blob cd0a176134d46b5b624896e56843a24915c14477.
// Prior lane 027167d41f6eff317c86b3bc1e32d5a7c8a95719; observed head 904a3009a5533f88ed10c52c2bff1789d090234c.
// 57 exact substitution/inverse/declaration checks plus 3 pinned blob comparisons executed in connector JS.
// Correction: OneChar calls Th.ptHyp_of in TheoremsMuLinked/GaloisRepresentationTypes/MapReducibleThreeDim.lean,
// not U3.ptHyp_of. Actual linked TypeII consumes CohInp, KatoTwo, RigII; PtHyp also consumes RigI.
// Number.lean blob 144f48ef1e4884898cff6e586931e21209dc68ad defines InpU: extends CohInp,
// with lemM, lemM', lemP, kato, rigI, rigII, number. Four sibling fields are unnecessary
// for this local point-rigidity construction; all uses at other consumers survive.
// Fixed and nonpositive-weight conditions use CohInp; shape dichotomy yields TypeI or TypeII.
// Apply RigI or linked TypeII vanishing, then tanCoc_isBK and coboundary conversion.
// TypeII retains all four native cocycle components pA,pB(+1),pB(-1),pC, inverse 2,
// all original point/host/odd-prime/modularity guards and exact quantified premises.
// Cache key: source pin, Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474,
// Omega,K,l,c,N,e,psi,D,U,g1,S,f,iota, point and modularity context. Source edges only;
// no new kernel or axiom evidence. Prior commit combined status empty; local Lean unavailable.
// Native replay: generate three overlays, compile in listed dependency order using existing
// pinned native environment and engine oleans; audit each original/reduced scan, axiom
// listing, bridge and prune original-statement bridge. No baseline CI pass attributed to these.
// RESUME HERE: native replay of all three caller overlays; trace actual RigI/RigII/KatoTwo
// suppliers to VWinAt same-host assembly; apply rh_reduce/rh_auto/rh_auto_frontier to actual
// leaves with checked rules. Do not collapse the two type cases or assume Selmer vanishing.
// HANDOFF TO integration, Galois, kernel audit, acceleration. RH OPEN. No URT speedup claimed.
import fs from "node:fs";
import path from "node:path";
import {execFileSync} from "node:child_process";
import {createHash} from "node:crypto";
const pin="40e56bab026552e089d7afcfeff08d2defb9c005",base="src/Development/AutomorphicArithmetic/AutomorphicVarieties/TheoremsMuLinked/GaloisRepresentationTypes/",names=["ReducibleThreeDim.lean","MapReducibleThreeDim.lean","OneChar.lean"],hashes=["fb11ab5c619a344b69c3c5543f3c4f78814e5dab","e7ff51139aba09d1a0849d30f559a48ae268d0f8","500557b0d4b61403ac9d7cd94c67efaa8900fb74"];
function generate(src){
let checks=0;
function req(p,m){if(!p)throw Error(m);checks++}
function edit(s,ops){let a=s,undo=[];for(const [old,v,n] of ops){req(a.split(old).length-1===n,"count "+old);let pos=0;for(let i=0;i<n;i++){const j=a.indexOf(old,pos);req(j>=0,"missing edit");a=a.slice(0,j)+v+a.slice(j+old.length);undo.push([j,v,old]);pos=j+v.length}}let b=a;for(const [j,v,old] of undo.reverse()){req(b.slice(j,j+v.length)===v,"inverse mismatch");b=b.slice(0,j)+old+b.slice(j+v.length)}req(b===s,"reverse reconstruction");return a}
const t="UpperTheory.V.Th.blochKatoSelmer_adRep_vanishes_of_typeII_modular",p="UpperTheory.V.Th.ptHyp_of",o="UpperTheory.V.Th.oneChar",a="RHDep35_typeII",b="RHDep35_ptHyp",c="RHDep35_oneChar",prefix="Development.AutomorphicArithmetic.AutomorphicVarieties.TheoremsMuLinked.GaloisRepresentationTypes.";
const fields=s=>[...new Set([...s.matchAll(/\b(?:inp|hI)\.([A-Za-z0-9_']+)/g)].map(m=>m[1]))].sort().join(",");
req(src[0].includes("theorem "+t+" :")&&src[1].includes("theorem "+p+" :"),"declarations missing");
req(fields(src[0].slice(src[0].indexOf("theorem "+t+" :")))==="kato,rigII,toCohInp","typeII fields");
req(fields(src[1].slice(src[1].indexOf("theorem "+p+" :")))==="rigI,toCohInp","pt fields");
const x=edit(src[0],[["theorem "+t+" :","theorem "+a+" :",1],["    Th.InpU → ∀","    CohInp → UpperTheory.V.Z.Kato.KatoTwo → UpperTheory.V.Th.RigII → ∀",1],["  intro inp Ω","  intro hC hK hRigII Ω",1],["  have hC : CohInp := inp.toCohInp\n  have hK : UpperTheory.V.Z.Kato.KatoTwo := inp.kato\n  have h := isPt_push","  have h := isPt_push",1],["inp.rigII D","hRigII D",1]]);
const y=edit(src[1],[["theorem "+p+" :","theorem "+b+" :",1],["    Th.InpU → ∀","    CohInp → UpperTheory.V.Th.RigI → UpperTheory.V.Z.Kato.KatoTwo → UpperTheory.V.Th.RigII → ∀",1],["  intro hI Ω","  intro hC hRigI hK hRigII Ω",1],["hI.toCohInp","hC",5],["hI.rigI D","hRigI D",1],["Th.blochKatoSelmer_adRep_vanishes_of_typeII_modular hI D",a+" hC hK hRigII D",1]]);
const z=edit(src[2],[["theorem "+o+" :","theorem "+c+" :",1],["Th.ptHyp_of hI D",b+" hI.toCohInp hI.rigI hI.kato hI.rigII D",1]]);
req(!/\binp\b/.test(x.slice(x.indexOf("theorem "+a+" :"))),"remaining inp");req(!/\bhI\b/.test(y.slice(y.indexOf("theorem "+b+" :"))),"remaining hI");
function stmt(s,n){const i=s.indexOf("theorem "+n+" :")+"theorem ".length+n.length+2,j=s.indexOf(" := by",i);req(j>i,"statement");return s.slice(i,j)}
const ax=(old,n)=>"\n#print axioms "+old+"\n#print axioms "+n+"\nrh_scan "+old+" limit 2000\nrh_scan "+n+" limit 2000\nrh_prune "+n+" as "+n+"_pruned\n";
const engine="import RHProofTermPrune\nimport RHRecursiveReductionFixed\nimport RHRecursiveReductionAutoV3\n";
const out=[engine+"import "+prefix+"ReducibleThreeDim\n"+x+"\ntheorem RHDep35_typeII_bridge :"+stmt(src[0],t)+" := by\n  intro inp\n  exact "+a+" inp.toCohInp inp.kato inp.rigII\n"+ax(t,a)+"#print axioms RHDep35_typeII_bridge\n",engine+"import RHDep35TypeII\nimport "+prefix+"MapReducibleThreeDim\n"+y+"\ntheorem RHDep35_ptHyp_bridge :"+stmt(src[1],p)+" := by\n  intro inp\n  exact "+b+" inp.toCohInp inp.rigI inp.kato inp.rigII\n"+ax(p,b)+"#print axioms RHDep35_ptHyp_bridge\n",engine+"import RHDep35PtHyp\nimport "+prefix+"OneChar\n"+z+ax(o,c)];
return {checks,out,graph:{original:[[o,"private oneChar_unram"],["private oneChar_unram",p],[p,t],[p,"InpU.rigI"],[p,"InpU.toCohInp"],[t,"InpU.kato"],[t,"InpU.rigII"],[t,"InpU.toCohInp"]],candidate:[[c,"private oneChar_unram (overlay)"],["private oneChar_unram (overlay)",b],[b,a],[b,"CohInp"],[b,"RigI"],[a,"CohInp"],[a,"KatoTwo"],[a,"RigII"]],status:"Selected source-visible edges only. All original kernel, structural, type and pending edges retained. No retirement."}};
}
const [root,out]=process.argv.slice(2);if(!root||!out)throw Error("usage: node script.mjs PINNED_CHECKOUT OUTPUT_DIR");
if(execFileSync("git",["-C",root,"rev-parse","HEAD"],{encoding:"utf8"}).trim()!==pin)throw Error("wrong source pin");
const source=names.map((n,i)=>{const b=fs.readFileSync(path.join(root,base,n));const h=createHash("sha1").update("blob "+b.length+String.fromCharCode(0)).update(b).digest("hex");if(h!==hashes[i])throw Error("source blob mismatch "+n);return b.toString("utf8")});
const result=generate(source);fs.mkdirSync(out,{recursive:true});["RHDep35TypeII.lean","RHDep35PtHyp.lean","RHDep35OneChar.lean"].forEach((n,i)=>fs.writeFileSync(path.join(out,n),result.out[i]));fs.writeFileSync(path.join(out,"RHDep35Graph.json"),JSON.stringify(result.graph,null,2));console.log(JSON.stringify({status:"SOURCE_MATCHED_PREPARED",checks:result.checks,sourceBlobs:hashes,outputBytes:result.out.map(x=>Buffer.byteLength(x))}));

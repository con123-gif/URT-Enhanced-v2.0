/* RUN24 2026-11-25. SOURCE-MATCHED plus authenticated parent export structural audit; no native Lean replay.
Preflight: AGENTS, SWARM 4b77b161d6876915c15cea5a4d4a519beaf5de74, HANDOFF 00fea8c367e3126d2d2f5df8c391d0de0a718879, EXPANSION, research state/log/protocol/continuity excerpts, CI #422, 14 peer commit handoffs, RUN23. Blueprint not reopened or used. No physical gate change. No Lean/lake on local PATH.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; supplier lines 396–415; norm lemma lines 268–281; IsQuad lines 175–178. Six exact import edges verified, not equated to kernel proof edges. Parent guard IDs 997983807 and 997983903, constant name ID 676057; prior RUN23 9c36efc5cc3bb4187c32713272b920b58f1bbb3c preserves all 137 aux occurrences including 17 outside the guards; this audit does not delete any. Parent export receipt is not a new proof of supplier's own dependency closure.
Math: distinguish original CM field E0 from generic E in supplier. F=maximalRealSubfield(E0), R=AF(F), A=R tensor_F E0. i:R^×→A^× from algebraMap; K=image(F^×→R^×), N=image(Norm_R:A^×→R^×), S=K join N (product of subgroups as R^× commutative). For both (chi,r)=(chiX,n),(chiW,d), the exact antecedent says for EVERY a in R^×, chi(i(a)) as a complex number equals 1 on S and (-1)^r outside S. In particular both restrictions kill norm units and K, regardless of parity. They are NOT simply conditions on rational units or a power of chi.
Even r: the restriction is trivial on all R^×, and no index bound on S follows. Odd r: the kernel is exactly S because -1 != 1 in C, and the image is contained in {1,-1}; first isomorphism theorem yields [R^×:S] in {1,2}, with 2 iff S is proper. This is a derived human observation, not an attributed Lean theorem nor a proof of existence of chi. Finite cyclic abstract sanity tests cover both cases including S=whole group and index>2; no artificial mathematical objects substituted for RH source.
Supplier map_conj additionally requires c:R-algebra endomorphism, IsQuad c xi (xi unit, c(xi)=-xi, basis (1,xi)), and Invertible(2:R). For z in A^×, its norm lies in N, hence chi(i(Norm z))=1. IsQuad.algebraMap_norm proves i(Norm z)=z*c(z): writing z=x+y xi and xi²=D in R (fixed-element lemma with invertible 2), multiplication matrix [[x,yD],[y,x]] has determinant x²-y²D, equal to z*c(z). Then chi(z)chi(c(z))=1 by homomorphism, so chi(c(z))=chi(z)^(-1). The proof of the norm identity is source-matched; do not assume IsQuad or invertibility supplied merely by the guard. triv_of_even omits invertibility and follows because both branches equal 1. Neither lemma discharges the other TLiftK premises or the original guard.
Upstream latest inspected a18a350c3e5aad997766cff2670b292313e46574, previous 27b55787485ac2a5b5b3ed2dffc697e0ae6a2f59. Main eb95ca808793dd61984cc853ab5630f54a74490c, TLiftK 35d26e2a7115dd2d4bed12c169866e93de6d3856, supplier 15232568fae592c2bb4cd76b7b9b71c621cf52cd, toolchain 0e037f58f9a1aa2d5139277bcc4be0061ebeeb05 all unchanged between these two upstream revisions. Different from original pin where applicable, not merged.
Executed in V8 using connector-reported Git blob IDs: {"out":{"checks":5519,"importEdges":6,"guards":[{"id":997983807,"heads":["Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes.AF","NumberField.instCommRingAdeleRing","GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.AE","Algebra.TensorProduct.instCommRing","Algebra.TensorProduct.leftAlgebra","MonoidHom.range"],"arguments":[997983714,997983725,997983732,997983744,997983766,997983804,232,3616]},{"id":997983903,"heads":["Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes.AF","NumberField.instCommRingAdeleRing","GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.AE","Algebra.TensorProduct.instCommRing","Algebra.TensorProduct.leftAlgebra","MonoidHom.range"],"arguments":[997983811,997983822,997983829,997983841,997983862,997983900,232,3416]}],"models":504,"admitted":360,"odd":1368,"even":3588},"negatives":6}. Node CLI below repeats checks and hashes raw bytes; CLI itself not executed in this run. No new full corpus scan or axiom extraction.
RESUME HERE: dependency lane add ResEtaPow name ID 676057 and seven cached RUN24 acceleration IDs 6674680,1800736,4403566,4403544,4398915,11224217,11221518 to next shared targeted role projection, not a duplicate full raw scan. Then extract ResEtaPow type/value closure and exact supplier axiom trust boundary; request native #print axioms GlobalTheory.WeilM.ResEtaPow, GlobalTheory.WeilM.ResEtaPow.map_conj and GlobalTheory.WeilM.ResEtaPow.triv_of_even in a pinned environment. These are targets, not claimed reachable paths or executed Lean. HANDOFF TO dependencies, acceleration, theta, integration, editor, audit. Full RH OPEN.
Usage: node run24_res_eta_pow.mjs /path/to/pinned/rh checkout_parent_raw.json
*/
import fs from "node:fs";
import path from "node:path";
import crypto from "node:crypto";
function audit(d,sources,paths){
 let checks=0;const check=(v,m)=>{if(!v)throw Error(m);checks++},eq=(a,b,m)=>check(JSON.stringify(a)===JSON.stringify(b),m);
 for(let j=0;j<paths.length-1;j++){const mod=paths[j+1].slice(4,-5).replaceAll("/",".");check(sources[j].split("\n").includes("import "+mod),"import edge "+j)}
 const s=sources[6], w=sources[5], norm=x=>x.replace(/\s+/g," ").trim();
 check(s.includes("namespace GlobalTheory.WeilM"),"namespace");
 check(s.includes("variable {R : Type} [CommRing R] {E : Type} [CommRing E] [Algebra R E]"),"ambient type");
 const decl=s.slice(s.indexOf("def ResEtaPow "),s.indexOf("\n\nvariable {c} in",s.indexOf("def ResEtaPow ")));
 eq(norm(decl),"def ResEtaPow (K : Subgroup Rˣ) (χ : Eˣ →* Circle) (n : ℕ) : Prop := ∀ a : Rˣ, (χ (Units.map (algebraMap R E : R →* E) a) : ℂ) = if a ∈ K ⊔ (Units.map (Algebra.norm R : E →* R)).range then 1 else (-1) ^ n","predicate exact");
 check(w.includes("abbrev AE : Type := AF F ⊗[F] E"),"tensor algebra");
 check(w.includes("abbrev Chr : Type := (AE F E)ˣ →* Circle"),"character domain");
 check(w.includes("def cA (σ : E →ₐ[F] E) : AE F E →ₐ[AF F] AE F E := Algebra.TensorProduct.map (AlgHom.id (AF F) (AF F)) σ"),"conjugation map");
 const conj=s.slice(s.indexOf("theorem ResEtaPow.map_conj"),s.indexOf("section Top",s.indexOf("theorem ResEtaPow.map_conj")));
 for(const fragment of ["(h : IsQuad c ξ)","(hχ : ResEtaPow K χ n)","(z : Eˣ) : χ (Units.map (c : E →* E) z) = (χ z)⁻¹","hχ (Units.map (Algebra.norm R : E →* R) z)","Subgroup.mem_sup_right","Units.ext (h.algebraMap_norm z), map_mul","eq_inv_of_mul_eq_one_right h1","omit [Invertible (2 : R)] in","(hn : Even n)","hn.neg_one_pow, ite_self"])check(conj.includes(fragment),"supplier "+fragment);
 for(const fragment of ["structure IsQuad (ξ : E) : Prop where","unit : IsUnit ξ","anti : c ξ = -ξ","basis : ∃ b : Module.Basis (Fin 2) R E, b 0 = 1 ∧ b 1 = ξ","variable [Invertible (2 : R)]","theorem algebraMap_norm (z : E) : algebraMap R E (Algebra.norm R z) = z * c z","Algebra.norm_eq_matrix_det b, det_fin_two"])check(s.includes(fragment),"norm prerequisite "+fragment);
 eq(sources[0].split("\n").filter(l=>l.trim().startsWith("ResEtaPow ")).map(l=>l.trim()),["ResEtaPow (Units.map (algebraMap (maximalRealSubfield E) (AF (maximalRealSubfield E))).toMonoidHom).range χX n →","ResEtaPow (Units.map (algebraMap (maximalRealSubfield E) (AF (maximalRealSubfield E))).toMonoidHom).range χW d →"],"source guard arguments");
 check(d.pin==="40e56bab026552e089d7afcfeff08d2defb9c005"&&d.archiveDigest==="5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e"&&!d.partial&&!d.unresolved.length,"export receipt");
 const rows=new Map(d.records.ie.map(([i,x])=>[i,JSON.parse(x)])),names=new Map(d.scope.nameTable);
 function spine(i){let args=[];while(rows.get(i)?.app){const z=rows.get(i).app;args.unshift(z.arg);i=z.fn}const e=rows.get(i);check(!!e,"missing expression");return {i,args,head:e.const?names.get(e.const.name)?.join("."):null,bvar:e.bvar}}
 const expected=["Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes.AF","NumberField.instCommRingAdeleRing","GlobalTheory.IndefiniteRowSideFullHecke.WeilTensorModels.AE","Algebra.TensorProduct.instCommRing","Algebra.TensorProduct.leftAlgebra","MonoidHom.range"];
 const ids=[997983807,997983903],argsExpected=[[997983714,997983725,997983732,997983744,997983766,997983804,232,3616],[997983811,997983822,997983829,997983841,997983862,997983900,232,3416]];
 const guards=ids.map((id,j)=>{const p=spine(id);eq(p.head,"GlobalTheory.WeilM.ResEtaPow","predicate identity");eq(p.args,argsExpected[j],"ordered arguments");const declared=d.guardArguments.find(g=>g.record===id);eq(declared.args.map(x=>x.id),p.args,"receipt argument order");const a=p.args.map(spine);eq(a.slice(0,6).map(x=>x.head),expected,"ring/typeclass/subgroup heads");eq(a.slice(6).map(x=>x.bvar),[5,j?12:17],"binder indices");return {id,heads:a.slice(0,6).map(x=>x.head),arguments:p.args}});
 // Exact finite abstract parity sanity checks. Not RH inputs or a model of adeles.
 let models=0,admitted=0,odd=0,even=0;
 for(let m=1;m<=24;m++)for(let step=1;step<=m;step++)if(m%step===0)for(let n=0;n<=5;n++){
   const val=x=>x%step===0||n%2===0?1:-1;let hom=true;for(let a=0;a<m;a++)for(let b=0;b<m;b++)if(val((a+b)%m)!==val(a)*val(b))hom=false;
   eq(hom,n%2===0||step<=2,"finite cyclic parity criterion");
   if(hom){admitted++;for(let a=0;a<m;a++){if(n%2===0){eq(val(a),1,"even restriction");even++}else{eq(val(a)===1,a%step===0,"odd kernel");odd++}}}models++;
 }
 return {checks,importEdges:paths.length-1,guards,models,admitted,odd,even};
}

const paths=[
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/HalfIndexLattices/TLiftK.lean",
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/SchurStep.lean",
  "src/Development/WeilBound/ThetaLifts/TowerModels/PlaneHerm.lean",
  "src/Development/AbelianVarietyTheory/Definitions/Divisors/CTSmallCone.lean",
  "src/Development/AbelianVarietyTheory/Definitions/Divisors/MatchingOfParts.lean",
  "src/Development/AbelianVarietyTheory/BlockTheory/DivisorBase/WeilTensorModels.lean",
  "src/Development/AbelianVarietyTheory/Definitions/Divisors/HilbertNinetyQuotientHomEqIff.lean"
];
const hashes=[
  "4b36fc43e988270944cef2fc1b5e9ee1493fc275",
  "8941c842b256473c103e2d04ef94e902534ed4b5",
  "94b14f68d5e011ff06b94cf2b04539d87f22007e",
  "59578c7a38cc131fdab95da5541523c42a5b159e",
  "0b28322e9e86af29a20031f44aae399dbf00c8a6",
  "4d0d94fd3fd9368e5428c05402979d6dd5123b4d",
  "a35c253c12eb916b088bd7b5fe8d8066428b5636"
];
const [root,raw]=process.argv.slice(2);
if(!root||!raw)throw Error("usage: node run24_res_eta_pow.mjs RH_ROOT PARENT_RAW_JSON");
const blob=b=>crypto.createHash("sha1").update("blob "+b.length+"\0").update(b).digest("hex");
const sources=paths.map((p,i)=>{const b=fs.readFileSync(path.join(root,p));if(blob(b)!==hashes[i])throw Error("source hash "+p);return b.toString("utf8")});
const rb=fs.readFileSync(raw);if(blob(rb)!=="b2fdc06a9db3a1ea23cbb055f6b148aaf0700dee"||crypto.createHash("sha256").update(rb).digest("hex")!=="2dac695ddf0786e7d42ce9f819ca0b657dcc28290044a340eac54cc0919c6b9a")throw Error("parent hash");
const d=JSON.parse(rb),out=audit(d,sources,paths);let negatives=0;
function reject(f){let failed=false;try{f()}catch(e){failed=true}if(!failed)throw Error("negative accepted");negatives++}
for(const [from,to] of [["K ⊔ (Units.map (Algebra.norm R : E →* R)).range","K"],["else (-1) ^ n","else 1"],["∀ a : Rˣ, (χ","∃ a : Rˣ, (χ"],["χ (Units.map (c : E →* E) z) = (χ z)⁻¹","χ (Units.map (c : E →* E) z) = χ z"]]){let c=[...sources];c[6]=c[6].replace(from,to);reject(()=>audit(d,c,paths))}
let c=JSON.parse(rb);c.guardArguments[0].args.reverse();reject(()=>audit(c,sources,paths));
let q=[...sources];q[3]=q[3].replace("import Development.AbelianVarietyTheory.Definitions.Divisors.MatchingOfParts","-- removed import");reject(()=>audit(d,q,paths));
console.log(JSON.stringify({out,negatives},null,2));

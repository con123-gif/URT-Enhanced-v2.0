// Lane 12, 2026-11-25 18:12 UTC checkpoint. SOURCE-MATCHED / PREPARED ONLY.
// Mission blob cd0a176134d46b5b624896e56843a24915c14477; source pin 40e56bab026552e089d7afcfeff08d2defb9c005.
// Prior lane bb971bc3fdd48895c2f8de9b20d367cb1c4d32c5. Latest observed branch head 0810c534f5b8e5fb367c0a63aa44a90d688c28fd.
// Human derivation: in the actual linked TypeII consumer, let W be the already chosen
// continuous two-dimensional extension and theta the determinant sign D.eta.
// Native typeII_ord plus dat_loc give OrdPoly(e,-e) for the SAME W; attachment is hf.
// Since the auxiliary N is even and coprime to d=|disc K|, d is odd and positive.
// The native quadratic Gauss-sum lemma proves fixing mu_d implies membership in galOf Q K,
// equal to ker eta. Consequently theta kills mu_d; the trivial twist kills mu_1.
// Two applications of the explicitly assumed Lit.KatoUseN give H_f^1(Q,W)=0 and
// H_f^1(Q,W tensor theta)=0 (native BlochKatoSelmerVanishes predicates).
// These are exactly hB1,hB2 consumed by the unchanged pB(+1),pB(-1) projections.
// This avoids the full Kato.Used record at THIS candidate route, including residual-trace,
// flag and irreducibility fields; does not prove those fields irrelevant elsewhere.
// WARNING: KatoUseN is a potentially stronger alternative premise, NOT established from
// KatoTwo. The file named KatoTwoOfUseN contains definitions, not a supplier theorem.
// No accepted dependency deletion or caller replacement until actual upstream producer
// supplies KatoUseN and an independently compiled consumer bridge. RigI/RigII open.
// Cache context: source pin, exact blobs, toolchain Lean 4.33.1 / Mathlib
// 0df444a360eaa60ab8c11dca51a86af692955474, actual Omega,K,l,c,N,e,psi,D,U,g1,S,f0,iota,W,hf.
// Executed in connector JS: 27 source/edit assertions plus 7 pinned blob comparisons.
// No local Lean/lake/network; no new native CI PASS. Baseline runs not evidence for this candidate.
// Latest peer compare exposed separate residual, rank, fiber, and mass work; three direct
// peer file retrievals returned 404, so no claim of full peer-body audit.
// Native replay: run node thisfile.mjs PINNED_CHECKOUT OUTPUT_DIR, compile output with
// native toolchain and previously compiled reduction engines on LEAN_PATH; inspect scans,
// prune, axioms, run rh_reduce/rh_auto/rh_auto_frontier with actual applicable rules.
// Do not report native success until exact matching CI or kernel output is recovered.
// RESUME HERE: locate actual construction of Th.InpU.kato and determine whether Lit.KatoUseN
// is available in the same source context. If not, backtrack to original KatoTwo edge.
// Trace RigI/RigII suppliers; prioritize verifying pending caller certificates.
// HANDOFF TO integration, Galois, literature, kernel audit. No URT gain asserted. RH OPEN.
import fs from "node:fs";
import path from "node:path";
import {execFileSync} from "node:child_process";
import {createHash} from "node:crypto";
const pin="40e56bab026552e089d7afcfeff08d2defb9c005",base="src/Development/AutomorphicArithmetic/AutomorphicVarieties/",sources=[["TheoremsMuLinked/GaloisRepresentationTypes/ReducibleThreeDim.lean","fb11ab5c619a344b69c3c5543f3c4f78814e5dab"],["ModularityArgument/KatoQuadraticCharacters/KatoTwoOfUseN.lean","d975e25df40233cba796658d93392b77b743cb72"],["ModularityArgument/KatoQuadraticCharacters/UsedOf.lean","77c8d303c49f81911a06432d43ec6a24d10aa812"],["LiteratureResults/KatoEulerSystems/KatoNOfKato.lean","826f87e1c472f7448749a63d8877ca47fe522cba"],["UnitaryThreeGroups/ClsEqOne.lean","d4347f15d305c3683c7566eaef862d4aeac1aac1"],["UnitaryThreeGroups/MemGalOfQuadraticOfFixesDiscrRootsOfUnity.lean","bb7d61ac95607d8e02a2469613053d97b402d17c"],["UnitaryThreeGroups/DatFacts.lean","f04c55abe16956e3d4458c410131568df631149f"]];
function generate(data){
 let checks=0;const req=(p,m)=>{if(!p)throw Error(m);checks++};
 const original="UpperTheory.V.Th.blochKatoSelmer_adRep_vanishes_of_typeII_modular",candidate="RHDep36_typeII_useN";
 const src=data[0],head="theorem "+original+" :",start=src.indexOf(head);req(start>=0,"missing theorem");
 const proof=src.slice(start);req(proof.includes("hK l Ω K e N θ _ W"),"actual Kato call");
 req(data[1].includes("def KatoTwo : Prop :=")&&data[1].includes("structure Used"),"KatoTwo interface");
 req(data[2].includes("theorem UpperTheory.V.Z.Kato.used_of :"),"used_of declaration");
 req(data[3].includes("def KatoUseN : Prop :=")&&data[3].includes("OrdPoly (e : ℤ) (-(e : ℤ)) W"),"KatoUseN exact guard");
 req(data[4].includes("theorem UpperTheory.V.U3.typeII_ord :")&&data[4].includes("Nat.coprime_two_right.1 (D.gd.cop.coprime_dvd_right D.gd.N_even.two_dvd)"),"native ord and odd discriminant");
 req(data[5].includes("theorem UpperTheory.mem_galOf_quadratic_of_fixes_discr_roots_of_unity :"),"native quadratic conductor");
 const old="  obtain ⟨hB1, hB2⟩ := hK l Ω K e N θ _ W (UpperTheory.V.Z.Kato.used_of hC D hm h hII W hext hWc hW hWd ι ⟨f, hf⟩) ι f hf";
 const replacement=`  -- The following uses KatoUseN as an EXPLICIT alternative premise.
  have hord := typeII_ord hC D hm h hII W hext hWc hWd
  obtain ⟨A₀, hA₀, -, -, -, -, -, -⟩ := dat_loc D
  have hpoly : UpperTheory.V.Lit.OrdPoly (e : ℤ) (-(e : ℤ)) W :=
    ⟨A₀, N, hA₀, NeZero.pos N, hord.2 A₀ hA₀⟩
  have hodd : Odd (discr K).natAbs :=
    Nat.coprime_two_right.1 (D.gd.cop.coprime_dvd_right D.gd.N_even.two_dvd)
  have hpos : 1 ≤ (discr K).natAbs := by
    obtain ⟨k, hk⟩ := hodd
    omega
  have hkill : Af.KillsMu (discr K).natAbs θ := by
    intro g hg
    have hk : g ∈ D.η.ker := by
      rw [D.η_ker]
      exact UpperTheory.mem_galOf_quadratic_of_fixes_discr_roots_of_unity Ω K D.gd.quad hodd g hg
    change D.η g = 1 at hk
    change Units.map (Int.castRingHom (PadicAlgCl l)).toMonoidHom (D.η g) = 1
    rw [hk, map_one]
  have hone : Af.KillsMu 1 (1 : G ℚ Ω →* (Qbar l)ˣ) := by
    intro g hg
    simp
  have hB1 := hK l D.gd.l_odd Ω ι e D.gd.e_pos f W hWc hf hpoly 1 1 (by decide) hone
  have hB2 := hK l D.gd.l_odd Ω ι e D.gd.e_pos f W hWc hf hpoly (discr K).natAbs θ hpos hkill`;
 const edits=[[head,"theorem "+candidate+" :"],["    Th.InpU → ∀","    CohInp → UpperTheory.V.Lit.KatoUseN → UpperTheory.V.Th.RigII → ∀"],["  intro inp Ω","  intro hC hK hRigII Ω"],["  have hC : CohInp := inp.toCohInp\n  have hK : UpperTheory.V.Z.Kato.KatoTwo := inp.kato\n",""],["  have hR := inp.rigII D","  have hR := hRigII D"],[old,replacement]];
 let s=src;const undo=[];for(const [a,b] of edits){req(s.split(a).length===2,"unique edit: "+a.slice(0,80));const j=s.indexOf(a);s=s.slice(0,j)+b+s.slice(j+a.length);undo.push([j,b,a])}
 let back=s;for(const [j,b,a] of undo.reverse()){req(back.slice(j,j+b.length)===b,"inverse");back=back.slice(0,j)+a+back.slice(j+b.length)}req(back===src,"exact reverse");
 const newProof=s.slice(s.indexOf("theorem "+candidate+" :"));req(!newProof.includes("used_of"),"used_of removed");req(!/\binp\b/.test(newProof),"no old package reference");req(newProof.includes("hRigII D"),"retain RigII");req(newProof.includes("bloch_kato_nonpositive_weight hC"),"retain fourth component");req(newProof.includes("hB1 _ z1 b1")&&newProof.includes("hB2 _ z2 b2"),"retain both twist consumers");req(newProof.includes("hA _ zA bA"),"retain adjoint component");req(newProof.includes("D.η_ker")&&newProof.includes("D.gd.quad")&&newProof.includes("hodd"),"retain same-host conductor");
 const prefix="Development.AutomorphicArithmetic.AutomorphicVarieties.";
 const out="import RHProofTermPrune\nimport RHRecursiveReductionFixed\nimport RHRecursiveReductionAutoV3\nimport "+prefix+"TheoremsMuLinked.GaloisRepresentationTypes.ReducibleThreeDim\nimport "+prefix+"UnitaryThreeGroups.MemGalOfQuadraticOfFixesDiscrRootsOfUnity\n"+s+"\n#print axioms "+original+"\n#print axioms "+candidate+"\nrh_scan "+original+" limit 2000\nrh_scan "+candidate+" limit 2000\nrh_prune "+candidate+" as RHDep36_typeII_useN_pruned\n";
 const graph={status:"SOURCE-MATCHED / PREPARED; no kernel retirement; alternate premise is not proved from KatoTwo",original:[[original,"InpU.kato"],[original,"Kato.used_of"],[original,"InpU.rigII"],[original,"InpU.toCohInp"]],candidate:[[candidate,"KatoUseN"],[candidate,"typeII_ord"],[candidate,"dat_loc"],[candidate,"mem_galOf_quadratic_of_fixes_discr_roots_of_unity"],[candidate,"RigII"],[candidate,"CohInp"]],open:["actual source supplier of KatoUseN or bridge from original available hypotheses","RigI","RigII","native compilation and original consumer bridge","all surviving same-host VWinAt obligations"]};
 return {checks,out,graph}
}
const [root,out]=process.argv.slice(2);if(!root||!out)throw Error("usage: node script.mjs PINNED_CHECKOUT OUTPUT_DIR");
if(execFileSync("git",["-C",root,"rev-parse","HEAD"],{encoding:"utf8"}).trim()!==pin)throw Error("wrong source pin");
const data=sources.map(([n,h])=>{const b=fs.readFileSync(path.join(root,base,n));const sha=createHash("sha1").update("blob "+b.length+String.fromCharCode(0)).update(b).digest("hex");if(sha!==h)throw Error("blob mismatch "+n);return b.toString("utf8")});
const r=generate(data);fs.mkdirSync(out,{recursive:true});fs.writeFileSync(path.join(out,"RHDep36TypeIIUseN.lean"),r.out);fs.writeFileSync(path.join(out,"graph.json"),JSON.stringify(r.graph,null,2));console.log(JSON.stringify({checks:r.checks,pinned_blobs:sources.length,status:"PREPARED, not Lean verified"}));

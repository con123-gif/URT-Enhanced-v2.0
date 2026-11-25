/*
RUN23 — Clozel conjugation and Borel cohomological counting (2026-11-25)
RESULT: DONE for local source-linked human derivation and lexical dependency checks; PARTIAL for deep supplier obligations and authenticated Main-root value paths.
Original source leanprover-community/riemann-hypothesis, pin 40e56bab026552e089d7afcfeff08d2defb9c005. Each receipt below is the exact Git blob ID; declaration anchors in verify(). Additional source files inspected but not in lexical assertions: [{"path":"src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ClozelCohomology/ClozelCohC.lean","sha":"a9018b183d3e089c17cec8b6a4052aad80f9880e"},{"path":"src/Development/AutomorphicArithmetic/AutomorphicVarieties/LiteratureResults/DeRham.lean","sha":"6316213f7bb9617b300d12c7ed71220ab7b6db03"},{"path":"src/Development/AutomorphicArithmetic/AutomorphicVarieties/LiteratureResults/DeRhamInj.lean","sha":"11bd70072f02252c72801b2576409a529b1986ca"},{"path":"src/Development/AutomorphicArithmetic/AutomorphicVarieties/LiteratureResults/BorelHarmonicForms/DerivativeRightTranslateL2.lean","sha":"d9d217330637292da6474c25667327765c5612b9"},{"path":"src/Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/HasCohomology.lean","sha":"ec55ca626b57c37d58f482abeeb1c7f03bcd377a"}].
Observed newer default-head candidate a18a350c3e5aad997766cff2670b292313e46574. At that revision the inspected ClozelConjC, ClozelConjCOfSteps, GelfandKazhdanReal blobs differ: c03cbf6ab126c41bef17b58e9e04984a58cf4cf1, 9293a9179437b39277b9df7d33bddffc47f4570f, d9dce20f03c2295caf8f147a76d2e0bcfc63ff9f. BorelInjC and Imports returned 404 at the same paths; do not infer deletion or semantic change. Other paths not compared. No repinning.
Coordination: read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state/log/protocol/continuity excerpts, CI #420 (physics only), RUN22, and latest peer commit patches (theta 8700f28d, Galois eadfe094, structure 93f6005c, Landau db8c71c8, dependency bd222c67, kernel 9c36efc5, acceleration 7df9865e, integration 18705392, literature 467e2615). Some peer notes only excerpts; external blueprint not reread. No overlap with observed peer frontiers.

1. Supplier identity: patching uses Af.clozelCohC_alt hN for cohC, but Z.Coh.clozelConjC for conjC and Z.Coh.borelInjC for borelC. The conjugation supplier uses a DIFFERENT theorem Z.Coh.clozelCohC with PositivityTheory.Rg.Cz.clozelCohomological as its existence supplier, not literal automorphy hN. Preserve that obligation. The wrapper supplies nine arguments to clozelConjC_of_steps: JacquetShalikaRigidity, ClozelCohC, FinExC, ExAlgRepCusp, ConjAlgRep, CuspSupport, ConjEx, Embed, NoEis. Embed itself has 12 arguments: PartH, RelFacts, PartA, RelOnto, HarmSub, HarmNe, HarmInj, IrrCo, Graph, FrameEx, OneReal, CuspRapid. Borel wrapper is a direct alias of Lit.Geo.borelInjC. These are source references, not independently authenticated Main-root value paths.

2. ClozelConjC: for every totally complex number field E, rank a>=1, regular algebraic cusp representation pi and arbitrary field automorphism sigma:C~=C, there exist pi', finite components tau of pi and tau' of pi', conjugate by sigma, with every embedding phi:E->C and multiset m satisfying HasInfChar(pi,phi,m) giving HasInfChar(pi',sigma o phi,m). The multiset is unchanged; it is the embedding that moves. No continuity assumed for sigma. Fix E, then strong induction on rank a BEFORE introducing pi and sigma; induction is available at every smaller positive rank for all pi and sigma. Rank zero vacuous; rank one excludes positive strictly smaller blocks by the same argument.
Choose algebraic Xi for pi, conjugate Xi', tau, its conjugate tau', and cohomology for pi. Choose m0(t) at every embedding witnessing original and dual algebraic infinitesimal characters. Define m'(t)=m0(sigma^-1 o t). The inverse-composition identities ensure coefficient compatibility and final character transport. Embed supplies nonzero equivariant j into smooth automorphic functions of capacity m'. CuspSupport gives a disjunction: the cuspidal branch returns pi' and finite tau'; uniqueness of the original infinitesimal character yields m0(phi)=m. The other branch gives at least two positive strictly lower rank blocks whose characters sum to m' and whose Satake data match cofinitely. NoEis, using rigidity, induction at each smaller rank, and regular-integral multiset data (cardinality and hpi), excludes that matching. Both branches and all nine premises retained. NoEis and rigidity remain imported obligations; no induction over character subsets substituted.

3. Embed: choose frame e, parameter r, nonzero harmonic omega of degree q, invariant harmonic space P, and injective equivariant Phi:tau.V->P. PartH supplies target M. RelFacts gives linearity, equivariance and exactness equivalence; RelOnto with PartA and cusp rapidity supplies for each Phi(v) a related beta in M. Zero is exact at the same compact open level (q=0 and q+1 separately). If v=0, exactness transfers to beta and M4 forces beta=0; if beta=0, exactness transfers back and HarmInj plus Phi injectivity forces v=0. Graph supplies injective equivariant J:tau'.V->M. Choose v!=0; tensor coordinate decomposition yields X,i with cmp_i(J(v)(X))!=0. Fix X,i, set j(w)=cmp_i(J(w)(X)). Linear, nonzero, equivariant by cmp_trans; M3 supplies automorphic and capacity constraints. Only nonzero, not injectivity, is required for j.

4. BorelInjC: fix E totally complex, a>=1, U compact AND open, coefficient Xi, finite set S of cuspidal subrepresentations. Distinct members nonisomorphic (pi.Iso pi' implies equality for members); each cohomological and has U-fixed finite component. Choose common frame and r. For each pi in S choose degree deg(pi) and nonzero U-harmonic form w(pi) with values in tens Xi.d pi.V. The choice outside S is (0,0) with vacuous membership implication. For each q and injection f:Fin s->S all of degree q, choose omega_i=w(f_i) in degree q. They are closed relative cochains. If sum c_i omega_i is relative exact, HarmLin makes it harmonic, cuspRapid and rapid_sum make it rapid. noExact' forces zero: degree zero exactness IS vanishing; at successor degree exactness provides eta, and pairFacts positivity plus g1 and coclosedness give zero. Compact/open, frame, HasOne and rapidity are retained. Finite-sum rapidity uses additive estimates, zero and scaling. The independence of distinct irreducible cusp spaces (indepAbs) implies all coefficients vanish: evaluate at X, tensor coordinate k, isolate c_i cmp_k(omega_i(X)) by iSupIndep and sum coordinates, contradicting omega_i!=0 if c_i!=0. deRhamInj then yields s <= rank_C H^q(levelRep(top,U,ratC Xi)). Actual deRhamInj is the assembly Dr.deRhamInj_of in DeRhamInj.lean; preserve its full imported list, not re-proved here.
Count applies to each finite fibre S_q={pi in S:deg(pi)=q} via equivalence with Fin |S_q|. Disjoint union equivalence S ~= Sigma_q S_q gives
  |S| = sum_q |S_q| <= sum_q rank_C H^q = cohDim(top,U,ratC Xi).
All cardinal arithmetic, not presumed finite cohomology ranks or global degree cap. The alternate borelInjC_of_steps is not the actual Lit.Geo theorem. No geometric supplier declared closed.

5. Actual V8 execution on seven full pinned connector sources: {"sourceAssertions":134,"negativeControls":8,"primaryFiles":7}. Ordered literal source assertions and deliberate mutation controls only; no Lean elaboration, independent kernel check, nor mathematical verification of imported obligations. Connector-reported blob identities; replay uses native git rev-parse then git show. Node wrapper not run here. Local git DNS unavailable; no lean executable. No hypothesis intentionally removed. No URT speedup claim. Five additional source files were read, not assertion-tested.

RESUME HERE: trace actual NoEis supplier in ClozelConjC's import chain, preserving cofinite Satake comparison and strictly smaller ranks. Request cached signed-root/value paths for Z.Coh.clozelConjC, Z.Coh.borelInjC, Z.Coh.clozelCohC, Cj.clozelConjC_of_steps, Cj.embed_of, Lit.Geo.borelInjC, Lit.deRhamInj, Lit.Bor.count and Lit.Bor.indep from dependency/acceleration; do not duplicate full export. Only assign Main coverage after receipt.
HANDOFF TO dependencies, kernel, acceleration, Galois, literature, geometry, editor, integration, audit. Full RH OPEN.
Replay: node RUN23_CLOZEL_CONJUGATION_BOREL_COUNTING.mjs /path/to/pinned-rh-clone
*/
import {execFileSync} from 'node:child_process';
const pin="40e56bab026552e089d7afcfeff08d2defb9c005", receipts=[
  {
    "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/PublishedHypothesesFromPatching.lean",
    "sha": "8a57b35c343ed717c225b04710c835f102deaa3b"
  },
  {
    "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/PublishedTheorems/GelfandKazhdanReal.lean",
    "sha": "5950874949bd0b4b4f22191c009aff80c520cf5c"
  },
  {
    "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ClozelCohomology/ClozelConjC.lean",
    "sha": "ee87c465349ad0e87d461ead8aa003dbebc88477"
  },
  {
    "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/ConjugateRepresentations/CobordismLinearRelations/ClozelConjCOfSteps.lean",
    "sha": "cb96aae2a4791181a4ac5cfeb1c77f19c0badf13"
  },
  {
    "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/LiteratureResults/LieGeometryGrowth/BorelInjC.lean",
    "sha": "36aac37b6952a97b7b4df8670c15f91f01c14549"
  },
  {
    "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/LiteratureResults/BorelHarmonicForms/Imports.lean",
    "sha": "3701b4667781e1593c42c5d50054c01343a31468"
  },
  {
    "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/LiteratureResults/BorelHarmonicForms/ImportsVariant.lean",
    "sha": "7df28fd810250dde45a7e33d01fe6280748286a1"
  }
], extra=[
  {
    "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ClozelCohomology/ClozelCohC.lean",
    "sha": "a9018b183d3e089c17cec8b6a4052aad80f9880e"
  },
  {
    "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/LiteratureResults/DeRham.lean",
    "sha": "6316213f7bb9617b300d12c7ed71220ab7b6db03"
  },
  {
    "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/LiteratureResults/DeRhamInj.lean",
    "sha": "11bd70072f02252c72801b2576409a529b1986ca"
  },
  {
    "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/LiteratureResults/BorelHarmonicForms/DerivativeRightTranslateL2.lean",
    "sha": "d9d217330637292da6474c25667327765c5612b9"
  },
  {
    "path": "src/Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/HasCohomology.lean",
    "sha": "ec55ca626b57c37d58f482abeeb1c7f03bcd377a"
  }
];
function verify(s){
 let n=0;function cut(t,a,b){let i=t.indexOf(a),j=b?t.indexOf(b,i+a.length):t.length;if(i<0||j<0)throw Error(a);return t.slice(i,j)}
 function seq(t,a){let at=0;for(const v of a){let i=t.indexOf(v,at);if(i<0)throw Error(v);at=i+v.length;n++}}
 seq(s[0],["theorem published_hypotheses_from_patching_alt","cohC := _root_.UpperTheory.V.Af.clozelCohC_alt hN","conjC := Z.Coh.clozelConjC","borelC := Z.Coh.borelInjC"]);
 seq(cut(s[1],"def ClozelConjC","def ClozelConjR"),["[IsTotallyComplex E]","1 ≤ a →","(CG.mk π).IsRegAlg","∀ σ : ℂ ≃+* ℂ","∃ (π' : CuspSub E a)","IsFinComp π τ","IsFinComp π' τ'","IsConjBy σ τ τ'","∀ (φ : E →+* ℂ) (m : Multiset ℂ)","π.HasInfChar φ m → π'.HasInfChar (σ.toRingHom.comp φ) m"]);
 seq(cut(s[1],"def BorelInjC","def BorelInjR"),["[IsTotallyComplex E]","1 ≤ a →","IsOpen","IsCompact","(S : Finset (CuspSub E a))","∀ π ∈ S, ∀ π' ∈ S, π.Iso π' → π = π'","∀ π ∈ S, GlobalTheory.GKCoh.IsCohFor π Ξ ∧ HasFixed π.finPart U","(S.card : Cardinal) ≤ cohDim ⊤ U (ratC Ξ)"]);
 seq(s[2],["theorem clozelConjC","clozelConjC_of_steps PositivityTheory.AdelicQuotientData.jacquetShalikaRigidity clozelCohC finExC R.exAlgRepCusp R.conjAlgRep S.cuspSupport conjEx","(embed_of partH relFacts partA relOnto harmSub harmNe harmInj irrCo graph Lit.Bor.frameEx Lit.Bor.oneReal Lit.Geo.cuspRapid)","noEis","theorem borelInjC : Published.BorelInjC := Lit.Geo.borelInjC"]);
 seq(cut(s[3],"theorem clozelConjC_of_steps",null),["(hJ : GlobalTheory.Published.JacquetShalikaRigidity)","(hC : Published.ClozelCohC)","(hF : FinExC)","(h1 : R.ExAlgRepCusp)","(h2 : R.ConjAlgRep)","(h3 : S.CuspSupport)","(h4 : ConjEx)","(h5 : Embed)","(h6 : NoEis)","change 1 ≤ a → ConjAt E a","induction a using Nat.strong_induction_on","intro ha π hπ σ","h1 E a π hπ","h2 E a Ξ σ","hF E a π","h4 E a σ τ","hC E a ha π Ξ hΞ","choose m₀ m1 m2 using hΞ","σ.apply_symm_apply","σ.symm_apply_apply","h5 E a ha π σ Ξ Ξ' c1 hC' (fun t => m₀ (σ.symm.toRingHom.comp t))","rcases h3 E a ha τ'","⟨π', τ, τ', hτ, p1, hτ'","(m1 φ).unique hm","absurd k6 (h6 hJ E a ha (fun b h hb => ih b hb h)","rw [← h.infChar_eq]","⟨CG.card_infChar _ _, hπ _⟩"]);
 seq(cut(s[3],"def NoEis","theorem clozelConjC_of_steps"),["∀ b, 1 ≤ b → b < a → ConjAt E b","2 ≤ Fintype.card ι","∀ i, 1 ≤ n i","∀ i, n i < a","∀ t, ∑ i, μ i t = m t","¬ ∀ᶠ w","HasSatGL"]);
 seq(cut(s[3],"theorem embed_of","def TwReg"),["(hH : PartH)","(h1 : RelFacts)","(h2 : PartA)","(h3 : RelOnto)","(h4 : HarmSub)","(h5 : HarmNe)","(h6 : HarmInj)","(h7 : IrrCo)","(h8 : Graph)","(h9 : FrameEx)","(h10 : OneReal)","(h11 : CuspRapid)","h5 E a ha π Ξ r n e he hr hC","h7 E a π τ hτ","hH E a ha Ξ' m hm q","h1 E a ha σ Ξ Ξ' h hσ q","h8 _ τ.V τ'.V","h3 h2 E a ha","h11 E a π Ξ q","M4 w hw","h6 E a ha π","have : Nontrivial τ'.V","∃ X i, cmp i (J v X) ≠ 0","toFun := fun v => cmp i (J v X)","rw [J3, transRep_apply, cmp_trans]"]);
 seq(cut(s[4],"private theorem noExact'","theorem UpperTheory.V.Lit.Geo.borelInjC"),["(hUo : IsOpen","(hUc : IsCompact","(hr : HasOne Ξ r)","(hω : IsHarm","(hR : Rapid ω)","(hex : IsRelExact","cases q with","| zero => exact hex","| succ q =>","obtain ⟨η, hη, rfl⟩ := hex","twEx E a ha r","admEx E a Ξ","pairFacts E a ha","g1 E a ha","hω.coclosed"]);
 seq(cut(s[4],"theorem UpperTheory.V.Lit.Geo.borelInjC",null),["intro E _ _ _ a ha U hUo hUc Ξ S hS hC","frameEx E a","oneReal E a Ξ","∀ π : CuspSub E a, ∃ (q : ℕ)","π ∈ S → ω ≠ 0","by_cases h : π ∈ S","harmEx E a ha","⟨0, 0, fun h' => absurd h' h⟩","choose deg w hw using hex","UpperTheory.V.Lit.Bor.count","obtain ⟨hi, rfl⟩ := hq i","choose ω h0 hH hV using hex2","deRhamInj E a ha U hUo hUc Ξ q s ω","(hH i).closed","indep E a Ξ.d q s f","hf (hS _ (hq i).1 _ (hq j).1 h)","noExact' ha he hUo hUc hr","rapid_sum ω c","cuspRapid E a (f i)"]);
 seq(s[5],["theorem UpperTheory.V.Lit.Bor.count","∀ q, Cardinal.mk {x : S // deg x = q} ≤ κ q","Fintype.equivFin","e.symm.injective","Equiv.sigmaFiberEquiv","Cardinal.mk_sigma","Cardinal.sum_le_sum"]);
 seq(s[6],["theorem UpperTheory.V.Lit.Bor.indep","indepAbs","iSupIndep_iff_finset_sum_eq_zero_imp_eq_zero","funext i","by_contra hci","h0 i","sum_cmp"]);return n;
}
const mutations=[[0,"conjC := Z.Coh.clozelConjC","conjC := Z.Coh.borelInjC"],[1,"∀ σ : ℂ ≃+* ℂ","∃ σ : ℂ ≃+* ℂ"],[1,"π.Iso π' → π = π'","π.Iso π'"],[3,"fun b h hb => ih b hb h","fun b h hb => ih a hb h"],[3,"(fun t => m₀ (σ.symm.toRingHom.comp t))","(fun t => m₀ (σ.toRingHom.comp t))"],[4,"(hω : IsHarm","(hω : IsLev"],[4,"(hH i).closed","(hH i).coclosed"],[5,"Cardinal.sum_le_sum","Cardinal.sum_eq_sum"]];
function negatives(s,mut){let n=0;for(const [i,a,b] of mut){let t=s.slice();t[i]=t[i].replace(a,b);if(t[i]===s[i])throw Error("missing mutation "+a);let reject=false;try{verify(t)}catch{reject=true}if(!reject)throw Error("accepted mutation "+a);n++}return n}
const [rh]=process.argv.slice(2);if(!rh)throw Error('supply RH checkout');
const git=(...args)=>execFileSync('git',['-C',rh,...args],{encoding:'utf8',maxBuffer:32*1024*1024});
for(const x of [...receipts,...extra])if(git('rev-parse',pin+':'+x.path).trim()!==x.sha)throw Error('blob mismatch '+x.path);
const s=receipts.map(x=>git('show',pin+':'+x.path));console.log(JSON.stringify({sourceAssertions:verify(s),negativeControls:negatives(s,mutations),primaryFiles:s.length},null,2));

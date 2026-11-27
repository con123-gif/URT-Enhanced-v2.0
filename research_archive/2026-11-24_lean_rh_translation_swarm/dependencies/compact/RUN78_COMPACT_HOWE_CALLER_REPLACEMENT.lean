import Lib.DiscreteSeries.Theta.LocalThetaCorrespondence
import Lean

/-!
# RUN78 — original-statement substitution at the actual Howe caller
27 November 2026. PREPARED, NOT NATIVE-REPLAYED. Dependency lane V1/V2.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Source Lib/DiscreteSeries/Theta/LocalThetaCorrespondence.lean blob
2a5c865a64dcbd1a9c75218fcc4d93ee4b4c6bf8. Prior RUN77 commit
a4fd9895ae4a23502d9415e1ba0a8dc221f4cb3d, blob e0ce40b8cb579d0593d387a182a488adc73bffc0.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
67e542df1b5557b2e1314643931ef1355bbdc50d,
073d86374ebc415e217a2732814dde7b0f3dfb9d. Read current mission,
SWARM_PROTOCOL, HANDOFF_QUEUE, expansion, AGENTS, continuity and latest
peer commit titles (277ee043, 2f04e074, 6eaefd9c, c0a5aa98, 14287e58,
c1dc4f8b); no duplicate C local Howe caller identified there.

## Meaningful new step: not another derivation of the smoothing lemma
RUN77 proved the source-matched mathematical statement M is stable,
where M=G.range.comap iota. This run places that named proof at the
actual exists_bump_integratedRep_eq consumer, rather than compiling a
helper independently. All other actual h0, hc, K, L arguments are
left byte-for-byte unchanged. Same real unitary pair, polynomial
projection, measures, highest vector, and matched parameters; no
extra topology or closure premise. The proof uses precisely the same
witness bumpDeriv Y beta. The local inline proof becomes one call.

Source preflight actually executed through authenticated GitHub reads
and JS: unique inline hG anchor (count 1); reversing the theorem
rename and exact hG replacement restores the complete original caller
text (true). The RUN77 helper declaration is copied verbatim from its
pinned file to make this candidate a standalone Lean input. This is
a source-level substitution test, not elaboration.

Original source-visible graph:
 exists_bump_integratedRep_eq -> howe_argument, inline hG,
 h0 (exists_bump_conv_dsKernel, integratedRep_fix), hc
 (integratedRep_eq_zero_of_notMem_rootCone), K, L and final a bridge.
 inline hG -> isDerivedAction_integratedRep, map_integratedRep,
 bumpDeriv, hasDerivAt_smear, hasDerivAt_expU, real Lie decomposition.
Candidate graph: same outer supplier edges, except inline hG is
replaced by smoothing_preimage_invariant -> same supplier set.
No transitive mathematical premise eliminated merely by naming hG.
No global reachability claim. Actual proof terms and role edges must
be extracted before deciding whether any dependencies disappeared.
Cache key: source pin, declaration/caller, pair T, eta, ranks,
parameters l/l', Phi, iota, G and type/value/constructor role.
Do not reuse an axiom report from a different module or source pin.

Native plan: in the existing shared compact workspace build ONLY
Lib.DiscreteSeries.Theta.LocalThetaCorrespondence, then use lake env
lean on this file. The probes require a checked original-statement
replacement, actual direct helper reference, no direct reference to
the old caller, and no new trust axioms. A failure is a repair target.
Then reuse RHProofTermPrune.lean and KernelGraphExport_v3.lean rather
than reimplementing them: in a disposable combined file put all
imports first (Lean and this exact compact module; NEVER Main),
append this candidate and the existing engine definitions, and
replace the old exporter's run_cmd driver by two exports, rooted at
OscillatorPair.exists_bump_integratedRep_eq and
OscillatorPair.exists_bump_integratedRep_eq_run78, with separate
files and Lean.collectAxioms per root. Run existing verify_graph_v2.mjs
on each JSONL; compare type/value/constructor/projection/rule edges,
retain missing nodes and original graphs. Run rh_scan on both at
limit 2000 and rh_prune on candidate/helper. A no-binder-drop result
is acceptable. rh_reduce/rh_auto/backtracking not invoked locally;
this known exact substitution does not need search to invent a new
premise. If needed for elaboration repair use the existing engine
only in the actual context; do not let an automatic fallback call
the original theorem.

Verification reality: no lean/lake/elan executable in local runtime.
Shared full union graph job 45781154005 returned RESOURCE_BLOCKED
(below publisher build recommendation), status blob
ea44d71556e0d21703e72fcd61bbaf2bee0ec563. Its original/reduced full
graphs are not available; do not infer them. The shared B2 caller
replay is registered; its status.json was absent at this read.
B2 helper run 45986308748 previously verified separately, not this
C branch. No parallel duplicate build or protected workflow edit.
Native graph, axiom and prune evidence for this candidate PENDING.
All prior RUN77/old-pin evidence and unproved root obligations retained.
Neither the star inequality nor RH is established here.

RESUME HERE: have the shared runner replay this exact replacement
and its role/axiom probes in a bounded compact module build, then
export the two constructor-inclusive rooted graphs. Do not mark a
dependency retired until the original actual downstream edge also
consumes the replacement. HANDOFF TO kernel/integration/audit.
-/

namespace RHDependencyRun77

open Finset MeasureTheory Fintype GlModule Matrix.Norms.L2Operator

variable {R C I} [Fintype R] [Fintype C] [Fintype I] {η} {ε ε' l l' Φ}
  {T : @FockDualPair R C ε ε' I} {π π'}
  (hp : OscillatorPair (η := η) T π π') [Nonempty R] [Nonempty C]
  (hΦ : IsJointHarmonic T l l' Φ)

/-- Extract the actual stability premise from the native local theta caller.
Prepared source-context certificate; needs compact native replay. -/
lemma smoothing_preimage_invariant :
    let ι := (integratedRep π l.dsKernel).1 ∘ₗ polyVector η
    let G := .proj 1 ∘ₗ smear _ (hp.column_rep.unitary_rep.1 (ι Φ))
    ∀ Y y, y ∈ G.range.comap ι → T.swap.oscRows Y y ∈ G.range.comap ι := by
  intro ι G Y y hy
  have d := hp.isDerivedAction_integratedRep hΦ
  have v := hp.column_rep.unitary_rep
  have a (α : Bumps ε') : integratedRep π' (α.1.1 ·⁻¹) (ι Φ) = G α :=
    (map_integratedRep v (integrable_bump_inv_smul _ α) 1 (ι Φ)).trans (by aesop)
  rcases hy with ⟨β, e⟩
  exact ⟨bumpDeriv Y β, eq_unitaryLiePart_add_I_smul ε' Y ▸ by
    simp [G, map_add, fun Y ↦
      (d Y y).unique (by simpa [map_integratedRep v (integrable_bump_inv_smul ..) (π' _),
        ← e, ← a] using (hasDerivAt_smear _ β (v.1 _) (hasDerivAt_expU Y 1 0)))]⟩

end RHDependencyRun77

namespace OscillatorPair

variable {R C I} [Fintype R] [Fintype C] [Fintype I] {η} {ε ε' l l' Φ}
  {T : @FockDualPair R C ε ε' I} {π π'}
  (hp : OscillatorPair (η := η) T π π') [Nonempty R]
  (hΦ : IsJointHarmonic T l l' Φ)
open Finset MeasureTheory Fintype GlModule Matrix.Norms.L2Operator
include hp hΦ
variable [Nonempty C]

lemma exists_bump_integratedRep_eq_run78 P : ∃ α : Bumps ε', integratedRep π l.dsKernel (polyVector η P) =
  integratedRep π' (α.1.1 ·⁻¹) (integratedRep π l.dsKernel Φ) := by
  obtain ⟨d, v, ⟨⟩, ⟨⟩⟩ := hp.isDerivedAction_integratedRep hΦ, hp.column_rep.unitary_rep,
    exists_integration_by_parts hΦ.hasLargeGap hp.unitary_rep hp.derives,
    isKHighest_dsGenerator hΦ.gap.neg, hΦ.gap
  set ι := (integratedRep π _).1 ∘ₗ polyVector η
  let G := .proj 1 ∘ₗ smear _ (v.1 (ι Φ))
  have a α : _ = G α :=
    (map_integratedRep v (integrable_bump_inv_smul _ α) 1 (ι Φ)).trans (by aesop)
  refine ((hΦ.howe_argument (G.range.comap ι) (RHDependencyRun77.smoothing_preimage_invariant hp hΦ) ((hΦ.swap.hasLargeGap
    le_rfl).exists_bump_conv_dsKernel.imp (a · ▸ hp.integratedRep_fix hΦ
    (integrable_bump_inv_smul ..) ·)) (fun Q Y h k ↦ eq_unitaryLiePart_add_I_smul ε Y ▸
    by simp [ι, integratedRep_eq_zero_of_notMem_rootCone hΦ.hasLargeGap hp.unitary_rep hp.derives h
    k, ← ((hp.derives ..).map_clm _).deriv]) ?_
    ?_).ge (x := P) ⟨⟩).imp (a · ▸ symm) <;> simp +contextual [ι, *]

end OscillatorPair

open Lean in
run_cmd do
  let env := (← getEnv).setExporting false
  let original := ``OscillatorPair.exists_bump_integratedRep_eq
  let reduced := ``OscillatorPair.exists_bump_integratedRep_eq_run78
  let helper := ``RHDependencyRun77.smoothing_preimage_invariant
  let some (.thmInfo a) := env.find? original | throwError "missing original caller"
  let some (.thmInfo b) := env.find? reduced | throwError "missing replacement caller"
  unless a.levelParams == b.levelParams && a.type == b.type do
    throwError "exact caller statement/universe parameters differ; inspect binder context"
  let refs := b.value.getUsedConstants
  unless refs.contains helper do
    throwError "replacement does not contain the intended named helper"
  if refs.contains original then
    throwError "circular fallback: original caller used"
  let oldAx ← Lean.collectAxioms original
  let newAx ← Lean.collectAxioms reduced
  unless newAx.all (fun n => oldAx.contains n) do
    throwError "replacement introduced an axiom"
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  unless oldAx.all (fun n => allowed.contains n) && newAx.all (fun n => allowed.contains n) do
    throwError "unexpected trust axiom; inspect both reports"
  logInfo m!"original value constants: {a.value.getUsedConstants}"
  logInfo m!"replacement value constants: {refs}"
  logInfo m!"original type constants: {a.type.getUsedConstants}"
  logInfo m!"replacement type constants: {b.type.getUsedConstants}"
  logInfo m!"caller type and direct helper/axiom probes checked (not transitive role graph)"

#print axioms RHDependencyRun77.smoothing_preimage_invariant
#print axioms OscillatorPair.exists_bump_integratedRep_eq
#print axioms OscillatorPair.exists_bump_integratedRep_eq_run78

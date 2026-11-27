import Run88Endpoint
import Run90Adapter
import Lean

/-!
RUN91 — connect the two lightweight modules at the actual principal-class caller.
27 November 2026. SOURCE-MATCHED / PREPARED; no native execution claimed.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Mission/spine/ledger: 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Original New/Main.lean blob 198ed5bf26aa294898931e0649bc2b88f1389f65,
New.grh (principal specialization), exact constructor and two arithmetic
guards retrieved and compared in this run. The original code is not imported.

New actual caller connection: the two separately proposed EndpointGrid
definitions are textually IDENTICAL (checked against blobs
4de55aa0356e64cb780fda3f80dc67d4a9cf362f and ab798deac49f97177fdcf38a9f35f00252b3cedc).
For fixed d in the native class 9239 mod 18480 construct the original P with q=1.
The two arithmetic guards follow from the same P, not an additional analytic
assumption. Require GoodGrid AND TailGrid only on P with modulus 18480 AND d
in class 9239. For each epsilon the adapter uses eta=epsilon/2; take max
of the two thresholds, and use the SAME witness D at each k^4. By definitional
equality transfer the EndpointGrid to RUN88 and use its conditional root.

This removes the unnecessarily broad all-P modulus-only premise in RUN85.
The canonical class restriction is not new arithmetic cancellation and
does not prove GoodGrid, TailGrid, A/B/C or RH. D1 still supplies admissible
data, not good data. The source-level graph is
class GoodGrid + TailGrid -> RUN90 endpoint -> RUN88 PrincipalGrid
-> RUN88 principal right -> reflection. Original Main path and all graphs,
axiom reports and unproved suppliers remain in the evidence archive.
Do not import New.Main, Main or original ShortAndEnough in this isolated
check. Original remainder-definition rfl comparison remains a separate
heavy-source check (RUN90 handoff).

Local lean/lake absent. Actual source checks: identical EndpointGrid
definition, exact original constructor substring, exact two original guards.
No rh_scan/prune/reduce/auto/frontier run; old-pin verification is not
transferred. Queue native replay of the two existing modules plus this
bridge using the shared registry, not another heavy A/B/C build.
The shared C1 job 46055305146 aggregate returned 1 despite green workflow:
C1 replacement fit_budget_split has sorryAx and exit 1; separately
C2 value-family four actual consumers compiled with standard axioms only,
12-root graph 193451 nodes, 7523207 edges, zero missing, all supplier guards
passed. These are separate peer receipts, not new verification of this file.

RESUME HERE: inspect compute/rh-compact-prime-endpoint-replay-20261127/
status.json and outputs/run91_receipt.json on cathedral-research-state;
repair first actual compiler error or send checked bridge to the shared
constructor-inclusive graph auditor. Preserve the pending original-definition
comparison and every arithmetic/PNT premise. HANDOFF TO kernel/integration.
RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

namespace RHPrimeWindow91

def ClassGridInputs : Prop :=
  ∀ (P : Parameters), P.N₀ = 18480 →
    (P.d : ZMod 18480) = (9239 : ZMod 18480) →
    ∀ ε : ℝ, 0 < ε / 6 ∧ ε < 1 / 100 →
      RHPrimeWindow90.GoodGrid P (ε/2) ∧ RHPrimeWindow90.TailGrid P (ε/2)

theorem principal_grid_from_class_inputs (hin : ClassGridInputs) :
    RHPrimeWindow88.PrincipalGrid := by
  intro d hd
  let q : ℕ := 1
  have h : d = (9240 * q - 1 : ZMod (18480 * q)) := by
    simpa [q] using hd
  let P := mk _ d ⟨q, rfl⟩ d.2 (by
    simp [← natCast_eq_zero_iff, h]; norm_cast; simp [↓natCast_eq_zero_iff, ← mul_assoc,
      mul_dvd_mul_iff_right])
  refine ⟨⟨P.instHeegD.2, (P.coprime_N₁_d 0).coprime_mul_right⟩, ?_⟩
  intro ε he
  have hc : (P.d : ZMod 18480) = (9239 : ZMod 18480) := by
    change d = (9239 : ZMod 18480)
    exact hd
  obtain ⟨hg,ht⟩ := hin P (by rfl) hc ε he
  have he' : 0 < (ε/2) / 6 ∧ ε/2 < 1 / 100 := by
    constructor <;> linarith [he.1,he.2]
  exact RHPrimeWindow90.endpoint_from_good_grid P (ε/2) he' hg ht

theorem zeta_line_from_class_inputs (hin : ClassGridInputs) :
    RiemannZetaZerosOnLine :=
  RHPrimeWindow88.zeta_line_from_endpoint_grid (principal_grid_from_class_inputs hin)

end RHPrimeWindow91

#print axioms RHPrimeWindow91.principal_grid_from_class_inputs
#print axioms RHPrimeWindow91.zeta_line_from_class_inputs

run_cmd do
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for (n, required) in #[
      (``RHPrimeWindow91.principal_grid_from_class_inputs,
        #[``RHPrimeWindow90.endpoint_from_good_grid]),
      (``RHPrimeWindow91.zeta_line_from_class_inputs,
        #[``RHPrimeWindow91.principal_grid_from_class_inputs,
          ``RHPrimeWindow88.zeta_line_from_endpoint_grid])] do
    let axioms ← Lean.collectAxioms n
    unless axioms.all (fun a => allowed.contains a) do
      Lean.throwError m!"RUN91 unexpected axiom {n}: {axioms}"
    let info ← Lean.getConstInfo n
    let some value := info.value? (allowOpaque := true) |
      Lean.throwError m!"RUN91 missing proof value {n}"
    let deps := value.getUsedConstants
    for supplier in required do
      unless deps.contains supplier do
        Lean.throwError m!"RUN91 missing edge {n} -> {supplier}"
    Lean.logInfo m!"RUN91_DIRECT|{n}|{deps.map Lean.Name.toString}"
  Lean.logInfo "RUN91_PRINCIPAL_BRIDGE_GUARDS_OK"

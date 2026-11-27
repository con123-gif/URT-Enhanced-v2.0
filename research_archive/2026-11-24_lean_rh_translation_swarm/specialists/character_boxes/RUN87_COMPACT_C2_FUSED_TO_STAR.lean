import C2SingleWitnessToStar
import C2ValueFamilyTransport
import Lean

/-!
RUN87 — combine the two C2 paths by exact elaborated-proof transport.
27 November 2026. PREPARED, NOT compiled. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Compact source pin
72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Native New/Main.lean blob 198ed5bf26aa294898931e0649bc2b88f1389f65; LongForms blob
9eff36cf003ac398fbd24361e80e95a03d0b0e05.
RUN85 source blob 0f4ccdf8f74a7f868b6d1d8403235fd7a84f17ae; RUN86 source blob e81bcf8064bf50effbbccf7f87b565e068bf2304;
C2_VALUE_FAMILY_TRANSPORT.lean blob 7e912b212aa0a365106cca2e7a0c30a17eb65ff6.
Peer fixed-modulus bridge RUN50_FixedModulusStarToRH.lean blob 89da046093cd30305e55ea7e217cf4437821e595.

Stage RUN86_COMPACT_C2_SINGLE_WITNESS_TO_STAR.lean as module
C2SingleWitnessToStar, AFTER the accepted C2SingleWitnessCombined module.
Stage the exact peer C2_VALUE_FAMILY_TRANSPORT as C2ValueFamilyTransport,
AFTER its direct determinant module and all original native dependencies.
Do not import New.Main, Main or New.grh. Neither new caller has a native
receipt in this observation. Shared C1 run 46055305146 was queried twice;
run job 140698522135 remains in_progress. Do not duplicate its cold build.

Mathematics: keep one actual fit family theta from c2_exists_isFitFamily,
one same D, independent y, rank n, index I and conjugate volume bound.
RowVolume supplies z(theta_i) and z(1) both nonzero. With
r_i=z(theta_i)/z(1), a=V+2delta+db, c=d(2L-H), the original two signed
HeightLe estimates give HeightLe(a,r) and HeightLe(2c,r^(-2)).
The accepted single global square-root/product-formula junction gives
0<=a+c, so V+2delta>=d(H-2L-b)>=d(H-3L) since b<=L and d>=0.
The star caller is unchanged except for its lower-bound supplier; it
uses the same A/B family, rank deficit and index budget, so H cancels.
This fuses RUN85's fit-family supplier with RUN86's junction without
reselecting the twists, changing their dependent type or assuming any
additional mathematical premise.

Do not duplicate the independent analytic bridge: integration/compact/
RUN50_FixedModulusStarToRH.lean already defines StarAt 18480. After that
module and this one are both checked, its exact cut can be instantiated
as (fun P _ D => run87_fused_star_inequality (D := D)).
Its eventual bound applies to the admissible modified D' after the
second-scale selection, not just the original D; the universal star
statement here preserves that quantifier. The auxiliary characters
modulo 18480 are retained. This is an interface for the integration lane,
not a full-RH replay or a new proof of its analytic suppliers.

Executed static source checks (connector JS): retrieved all five pinned
source blobs; normalized the two complete RUN85 and RUN86 star bodies
by reversing exactly the declaration rename and one Theorem C supplier
change. BOTH equal the actual native New/Main.lean star declaration
byte-for-byte after trimming outer whitespace. Verified the unique
fit-family caller in each C body and the single-witness call, actual
transport stage and fixed-star premise. Negative control trying the
already-changed supplier in RUN86 rejected. No Lean/lake executable
in local container. No new native scan/prune/reduce/auto, graph or axiom
results. The commands below are executable certificates, NOT receipts.
All unresolved A/B/C and analytic suppliers, old/new graphs, earlier
failed attempts and original statements remain preserved. No global
dependency deletion inferred from the direct-edge checks.

RESUME HERE: when the shared C1 original cache and family transport
are authenticated and RUN86's own kernel replay is accepted, compile
this module as C2FusedToStar and compare both original/replacement
constructor-inclusive closures (C and star) with the separate variants;
retain the shared dependency/axiom evidence and report the first actual
failure, if any. Do not report PASS before actual execution.
HANDOFF TO integration/native runner/audit.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

run_cmd do
  let stages := #[
    (``Data.run86_single_witness_integral_forms_long,
      `Data.run87_fused_integral_forms_long,
      ``exists_isFitFamily, ``c2_exists_isFitFamily),
    (``run86_single_witness_star_inequality,
      `run87_fused_star_inequality,
      ``Data.run86_single_witness_integral_forms_long,
      `Data.run87_fused_integral_forms_long)]
  for (sourceName, newName, oldSupplierName, newSupplierName) in stages do
    let oldSupplier ← Lean.getConstInfo oldSupplierName
    let newSupplier ← Lean.getConstInfo newSupplierName
    unless oldSupplier.levelParams == newSupplier.levelParams do
      Lean.throwError "RUN87 supplier universe parameters changed"
    let sameSupplier ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq oldSupplier.type newSupplier.type
    unless sameSupplier do
      Lean.throwError "RUN87 supplier complete statement changed"
    let source ← Lean.getConstInfo sourceName
    let some value := source.value? (allowOpaque := true) |
      Lean.throwError "RUN87 original proof body missing"
    unless value.getUsedConstants.contains oldSupplierName do
      Lean.throwError "RUN87 original direct supplier missing"
    let replaced := value.replace fun expression ↦
      match expression with
      | .const name levels =>
          if name == oldSupplierName then some (.const newSupplierName levels) else none
      | _ => none
    let dependencies := replaced.getUsedConstants
    unless dependencies.contains newSupplierName do
      Lean.throwError "RUN87 replacement direct supplier missing"
    for forbidden in #[sourceName, oldSupplierName] do
      if dependencies.contains forbidden then
        Lean.throwError "RUN87 retained original direct alias"
    Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
      name := newName
      levelParams := source.levelParams
      type := source.type
      value := replaced
    })
    Lean.logInfo m!"RUN87_FUSED: {newName}: complete statement and exact proof transport"

open DirichletCharacter Real Finset Filter Data Parameters ZMod Module

example {P} {D : Data P} : D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  run87_fused_star_inequality

#print axioms Data.run87_fused_integral_forms_long
#print axioms run87_fused_star_inequality

open Lean in
run_cmd do
  let old ← Lean.getConstInfo ``Data.integral_forms_long
  let candidate ← Lean.getConstInfo ``Data.run87_fused_integral_forms_long
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq old.type candidate.type
  unless old.levelParams == candidate.levelParams && same do
    Lean.throwError "RUN87 original Theorem C complete statement changed"
  let entries : List (Name × List Name × List Name) := [
    (``Data.run87_fused_integral_forms_long,
      [``c2_exists_isFitFamily, ``c2_heightLe_single_witness_budget,
        ``Data.heightLe_volume_rows, ``Data.heightLe_volume_ratio_sq,
        ``Data.volume_iota_eq_prod_liftVolume],
      [``exists_isFitFamily, ``HeightLe.nonneg, ``Data.integral_forms_long,
        ``Data.run86_single_witness_integral_forms_long]),
    (``run87_fused_star_inequality,
      [``Data.run87_fused_integral_forms_long, ``Data.exists_family_covolumeSq_le],
      [``Data.integral_forms_long, ``Data.run86_single_witness_integral_forms_long,
        ``run86_single_witness_star_inequality])]
  for (name, required, forbidden) in entries do
    let info ← Lean.getConstInfo name
    let some value := info.value? (allowOpaque := true) |
      Lean.throwError "RUN87 no proof body: {name}"
    for dep in required do
      unless value.getUsedConstants.contains dep do
        Lean.throwError "RUN87 missing direct dependency {dep} in {name}"
    for dep in forbidden do
      if value.getUsedConstants.contains dep then
        Lean.throwError "RUN87 retained direct dependency {dep} in {name}"
    Lean.logInfo m!"RUN87_DIRECT_GUARDS: {name}: exact suppliers"

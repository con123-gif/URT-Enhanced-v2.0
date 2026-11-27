import C2DirectRealMatching
import C2DeterminantCarrierTransport
import Lean

/-! Retarget only the exact real-matching supplier and its two actual callers.
Every transported declaration is checked by ordinary Lean.addDecl, preserving
complete types and universe parameters. Proposed source, not an acceptance
receipt. The Carrier's separate complement branch is retained.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

run_cmd do
  let stages := #[
    (``c2_empty_matching, `c2_direct_empty_matching,
      ``c2_real_matching_standard, ``c2_direct_real_matching, ``c2_empty_matching,
      #[``c2_direct_real_matching, ``c2_determinant_exchange]),
    (``c2_stdClassSum_det_modKernel_eq, `c2_direct_stdClassSum_det_modKernel_eq,
      ``c2_empty_matching, `c2_direct_empty_matching, ``stdClassSum_det_modKernel_eq,
      #[`c2_direct_empty_matching]),
    (``c2_stdClassSum_carrierXi_eq_carrierForm, `c2_direct_stdClassSum_carrierXi_eq_carrierForm,
      ``c2_stdClassSum_det_modKernel_eq, `c2_direct_stdClassSum_det_modKernel_eq,
      ``stdClassSum_carrierXi_eq_carrierForm,
      #[`c2_direct_stdClassSum_det_modKernel_eq, ``run79_explicit_matching])]
  for (sourceName, newName, oldSupplierName, newSupplierName, originalName, required) in stages do
    let oldSupplier ← Lean.getConstInfo oldSupplierName
    let newSupplier ← Lean.getConstInfo newSupplierName
    unless oldSupplier.levelParams == newSupplier.levelParams do
      Lean.throwError "Direct determinant supplier universe parameters changed"
    let sameSupplier ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq oldSupplier.type newSupplier.type
    unless sameSupplier do Lean.throwError "Direct determinant supplier statement changed"
    let source ← Lean.getConstInfo sourceName
    let original ← Lean.getConstInfo originalName
    let sameOriginal ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq source.type original.type
    unless sameOriginal do Lean.throwError "Direct determinant consumer statement differs from original"
    let some value := source.value? (allowOpaque := true) |
      Lean.throwError "Direct determinant source proof body missing"
    unless value.getUsedConstants.contains oldSupplierName do
      Lean.throwError "Direct determinant consumer does not use the intended supplier"
    let replaced := value.replace fun expression ↦
      match expression with
      | .const name levels =>
          if name == oldSupplierName then some (.const newSupplierName levels) else none
      | _ => none
    let dependencies := replaced.getUsedConstants
    for name in required do
      unless dependencies.contains name do
        Lean.throwError "Direct determinant transport lost a required supplier"
    for name in #[oldSupplierName, sourceName, originalName] do
      if dependencies.contains name then
        Lean.throwError "Direct determinant transport retained a superseded target alias"
    Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
      name := newName
      levelParams := source.levelParams
      type := source.type
      value := replaced
    })
    Lean.logInfo m!"C2_DIRECT_TRANSPORT: {newName}: complete original statement and exact supplier substitution"

#print axioms c2_direct_empty_matching
#print axioms c2_direct_stdClassSum_det_modKernel_eq
#print axioms c2_direct_stdClassSum_carrierXi_eq_carrierForm

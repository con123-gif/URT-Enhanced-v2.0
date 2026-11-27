import C2DeterminantClassSum
import Lean

/-! Exact proof transport into the existing CarrierXi consumer.
Replace only its determinant supplier after checking its complete type and
universe parameters. Keep the nonzero-complement matching branch unchanged.
Prepared source: the determinant module must first have an accepted replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Source pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

run_cmd do
  let oldSupplier ← Lean.getConstInfo ``run79_stdClassSum_det_modKernel_eq
  let newSupplier ← Lean.getConstInfo ``c2_stdClassSum_det_modKernel_eq
  unless oldSupplier.levelParams == newSupplier.levelParams do
    Lean.throwError "Determinant transport universe parameter mismatch"
  let sameSupplier ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq oldSupplier.type newSupplier.type
  unless sameSupplier do Lean.throwError "Determinant supplier statement changed"
  let source ← Lean.getConstInfo ``run79_stdClassSum_carrierXi_eq_carrierForm
  let original ← Lean.getConstInfo ``stdClassSum_carrierXi_eq_carrierForm
  let sameConsumer ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq source.type original.type
  unless sameConsumer do Lean.throwError "Carrier source statement differs from original"
  let some value := source.value? (allowOpaque := true) |
    Lean.throwError "Carrier proof body is not available"
  unless value.getUsedConstants.contains oldSupplier.name do
    Lean.throwError "Carrier does not directly consume the determinant supplier"
  let replaced := value.replace fun expression ↦
    match expression with
    | .const name levels =>
        if name == oldSupplier.name then some (.const newSupplier.name levels) else none
    | _ => none
  let dependencies := replaced.getUsedConstants
  unless dependencies.contains newSupplier.name &&
      dependencies.contains ``run79_explicit_matching do
    Lean.throwError "Carrier transport lost a required determinant or complement supplier"
  for forbidden in #[oldSupplier.name, source.name, original.name,
                       ``stdClassSum_det_modKernel_eq] do
    if dependencies.contains forbidden then
      Lean.throwError "Carrier transport retained an original supplier alias"
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := `c2_stdClassSum_carrierXi_eq_carrierForm
    levelParams := source.levelParams
    type := source.type
    value := replaced
  })
  Lean.logInfo "C2_DETERMINANT_CARRIER: complete original statement; checked determinant supplier replaced; complement matching retained"

#print axioms c2_stdClassSum_carrierXi_eq_carrierForm

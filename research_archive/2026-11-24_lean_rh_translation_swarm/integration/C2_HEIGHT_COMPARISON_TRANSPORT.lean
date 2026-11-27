import C2DirectDeterminantTransport
import New.Rows.LiftVolumeHeight
import Lean

/-! Proposed exact-statement transport from the checked determinant/Carrier
interface through detection and comparison forms to the actual lift height.
This retains the p-adic integral-coordinate estimate and the archimedean
estimate with its two related conjugate automorphisms. No primitive size,
nonvanishing, testedness, fit-family or denominator hypothesis is removed.
Prepared source only until this entire file and its reachable suppliers pass.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

run_cmd do
  let stages : Array (Lean.Name × Lean.Name × Array (Lean.Name × Lean.Name)) := #[
    (``carrierForm_spec, `c2_carrierForm_spec,
      #[( ``stdClassSum_carrierXi_eq_carrierForm,
          ``c2_direct_stdClassSum_carrierXi_eq_carrierForm)]),
    (``Data.exists_fNatural_approx, `Data.c2_exists_fNatural_approx,
      #[( ``carrierForm_spec, `c2_carrierForm_spec)]),
    (``Data.cosetKernelSum_eq_fNatural, `Data.c2_cosetKernelSum_eq_fNatural,
      #[( ``stdClassSum_carrierXi_eq_carrierForm,
          ``c2_direct_stdClassSum_carrierXi_eq_carrierForm)]),
    (``Data.mul_fNatural_mem_rapidOfLevel_and_hol, `Data.c2_mul_fNatural_mem_rapidOfLevel_and_hol,
      #[( ``Data.cosetKernelSum_eq_fNatural, `Data.c2_cosetKernelSum_eq_fNatural)]),
    (``Data.eq_zero_of_integral_fNatural_tableTheta, `Data.c2_eq_zero_of_integral_fNatural_tableTheta,
      #[( ``Data.exists_fNatural_approx, `Data.c2_exists_fNatural_approx),
        ( ``Data.mul_fNatural_mem_rapidOfLevel_and_hol, `Data.c2_mul_fNatural_mem_rapidOfLevel_and_hol)]),
    (``inner_adjoint_comparisonForm, `c2_inner_adjoint_comparisonForm,
      #[( ``Data.mul_fNatural_mem_rapidOfLevel_and_hol, `Data.c2_mul_fNatural_mem_rapidOfLevel_and_hol)]),
    (``exists_comparison_forms, `c2_exists_comparison_forms,
      #[( ``Data.cosetKernelSum_eq_fNatural, `Data.c2_cosetKernelSum_eq_fNatural),
        ( ``Data.eq_zero_of_integral_fNatural_tableTheta, `Data.c2_eq_zero_of_integral_fNatural_tableTheta),
        ( ``inner_adjoint_comparisonForm, `c2_inner_adjoint_comparisonForm)]),
    (``Data.heightLe_liftVolume_ratio, `Data.c2_heightLe_liftVolume_ratio,
      #[( ``exists_comparison_forms, `c2_exists_comparison_forms)])]
  for (sourceName, newName, suppliers) in stages do
    let source ← Lean.getConstInfo sourceName
    let some value := source.value? (allowOpaque := true) |
      Lean.throwError "Height consumer source proof body is unavailable"
    let mut replaced := value
    for (oldName, newSupplierName) in suppliers do
      let old ← Lean.getConstInfo oldName
      let newSupplier ← Lean.getConstInfo newSupplierName
      unless old.levelParams == newSupplier.levelParams do
        Lean.throwError "Height consumer supplier universes changed"
      let same ← Lean.Elab.Command.liftTermElabM do
        Lean.Meta.isDefEq old.type newSupplier.type
      unless same do Lean.throwError "Height consumer supplier statement changed"
      unless replaced.getUsedConstants.contains oldName do
        Lean.throwError m!"Height source {sourceName} does not directly use {oldName}"
      replaced := replaced.replace fun expression ↦
        match expression with
        | .const name levels =>
            if name == oldName then some (.const newSupplierName levels) else none
        | _ => none
    let dependencies := replaced.getUsedConstants
    for (oldName, newSupplierName) in suppliers do
      if dependencies.contains oldName then
        Lean.throwError "Height transport retained a superseded supplier"
      unless dependencies.contains newSupplierName do
        Lean.throwError "Height transport lost the checked supplier"
    if dependencies.contains sourceName then
      Lean.throwError "Height transport retained its original consumer alias"
    Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
      name := newName
      levelParams := source.levelParams
      type := source.type
      value := replaced
    })
    Lean.logInfo m!"C2_HEIGHT_COMPARISON: {newName}: unchanged complete original statement"

#print axioms c2_carrierForm_spec
#print axioms Data.c2_exists_fNatural_approx
#print axioms Data.c2_cosetKernelSum_eq_fNatural
#print axioms Data.c2_mul_fNatural_mem_rapidOfLevel_and_hol
#print axioms Data.c2_eq_zero_of_integral_fNatural_tableTheta
#print axioms c2_inner_adjoint_comparisonForm
#print axioms c2_exists_comparison_forms
#print axioms Data.c2_heightLe_liftVolume_ratio

import C2DirectDeterminantTransport
import New.Selmer.FitTwistsExist
import Lean

/-! Prepared actual-consumer continuation of the determinant line.
Transport the original integral-measure, signed family, common m-fold twist
and fit-family proof bodies through one exact supplier at each stage.
The C1 period-ring, balanced-row, denominator and finite-prime budget proofs
are retained. This is not the separate RUN84 budget replacement.
No acceptance is claimed before the original shared C1 closure is available
and this entire file passes normal-kernel compilation and dependency audit.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

run_cmd do
  let stages := #[
    (``Data.Pair.exists_isIntegralMeasure, `Data.Pair.c2_exists_isIntegralMeasure,
      ``stdClassSum_det_modKernel_eq, ``c2_direct_stdClassSum_det_modKernel_eq),
    (``exists_isFamily, `c2_exists_isFamily,
      ``Data.Pair.exists_isIntegralMeasure, `Data.Pair.c2_exists_isIntegralMeasure),
    (``exists_mFoldTwist_selmerLengthLe, `c2_exists_mFoldTwist_selmerLengthLe,
      ``exists_isFamily, `c2_exists_isFamily),
    (``exists_isFitFamily, `c2_exists_isFitFamily,
      ``exists_mFoldTwist_selmerLengthLe, `c2_exists_mFoldTwist_selmerLengthLe)]
  for (sourceName, newName, oldSupplierName, newSupplierName) in stages do
    let oldSupplier ← Lean.getConstInfo oldSupplierName
    let newSupplier ← Lean.getConstInfo newSupplierName
    unless oldSupplier.levelParams == newSupplier.levelParams do
      Lean.throwError "Value-family supplier universe parameters changed"
    let sameSupplier ← Lean.Elab.Command.liftTermElabM do
      Lean.Meta.isDefEq oldSupplier.type newSupplier.type
    unless sameSupplier do Lean.throwError "Value-family supplier complete statement changed"
    let source ← Lean.getConstInfo sourceName
    let some value := source.value? (allowOpaque := true) |
      Lean.throwError "Value-family original proof body missing"
    unless value.getUsedConstants.contains oldSupplierName do
      Lean.throwError "Value-family original proof does not directly consume the intended supplier"
    let replaced := value.replace fun expression ↦
      match expression with
      | .const name levels =>
          if name == oldSupplierName then some (.const newSupplierName levels) else none
      | _ => none
    let dependencies := replaced.getUsedConstants
    unless dependencies.contains newSupplierName do
      Lean.throwError "Value-family transport lost its replacement supplier"
    for forbidden in #[sourceName, oldSupplierName] do
      if dependencies.contains forbidden then
        Lean.throwError "Value-family transport retained an original direct target alias"
    Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
      name := newName
      levelParams := source.levelParams
      type := source.type
      value := replaced
    })
    Lean.logInfo m!"C2_VALUE_FAMILY: {newName}: complete original statement and exact supplier transport"

#print axioms Data.Pair.c2_exists_isIntegralMeasure
#print axioms c2_exists_isFamily
#print axioms c2_exists_mFoldTwist_selmerLengthLe
#print axioms c2_exists_isFitFamily

import Lean
set_option debug.skipKernelTC false
set_option Elab.async false
theorem retargetSourceSupplier (n : Nat) : n = n := rfl
theorem retargetNewSupplier (n : Nat) : n = n := rfl
theorem retargetSourceCaller (n : Nat) : n = n := retargetSourceSupplier n
run_cmd do
  let .thmInfo info ← Lean.getConstInfo ``retargetSourceCaller |
    Lean.throwError "Not a checked theorem"
  let proof := info.value.replace fun expression =>
    match expression with
    | .const name levels =>
      if name == ``retargetSourceSupplier then some (.const ``retargetNewSupplier levels)
      else none
    | _ => none
  Lean.addDecl (.thmDecl {
    name := `retargetNewCaller
    levelParams := info.levelParams
    type := info.type
    value := proof
  })
  let some value := (← Lean.getConstInfo `retargetNewCaller).value? (allowOpaque := true) |
    Lean.throwError "Missing checked proof"
  let dependencies := value.getUsedConstants
  if dependencies.contains ``retargetSourceSupplier then
    Lean.throwError "Old supplier retained"
  unless dependencies.contains ``retargetNewSupplier do
    Lean.throwError "New supplier absent"
  Lean.logInfo "CHECKED_RETARGET_CORE_PASS"
#print axioms retargetNewCaller

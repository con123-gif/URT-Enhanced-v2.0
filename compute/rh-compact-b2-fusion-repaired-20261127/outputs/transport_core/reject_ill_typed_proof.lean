import Lean
set_option debug.skipKernelTC false
set_option Elab.async false
run_cmd do
  -- The ordinary checker must reject a proof of True offered as False.
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := `retargetInvalidTheorem
    levelParams := []
    type := .const ``False []
    value := .const ``True.intro []
  })

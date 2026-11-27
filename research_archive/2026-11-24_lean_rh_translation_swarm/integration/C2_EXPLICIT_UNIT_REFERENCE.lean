import C2DirectRealMatching
import Lean

/-! Expose the proved unit reference before choosing the rapid exchange datum.
The checked real-matching proof explicitly constructs Exists.intro 1. Extract
its actual proof payload, check that witness definitionally equals the typed
polynomial unit, and submit the stronger explicit-reference declaration to
the normal kernel. This is proof-body extraction, not an inference of P(1)
from an arbitrary statement Exists Q, P(Q).
Prepared source until its complete native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

run_cmd do
  let source ← Lean.getConstInfo ``c2_direct_real_matching
  let some value := source.value? (allowOpaque := true) |
    Lean.throwError "The actual checked matching proof body is required"
  let (type, payload, witnessText) ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.lambdaTelescope value fun parameters body ↦ do
      let body ← Lean.Meta.whnf body
      unless body.isAppOfArity ``Exists.intro 4 do
        Lean.throwError "Matching proof does not expose a constructive reference witness"
      let arguments := body.getAppArgs
      let witness := arguments[2]!
      let payload := arguments[3]!
      let witnessType ← Lean.Meta.inferType witness
      let one ← Lean.Elab.Term.elabTerm (← `(1)) (some witnessType)
      Lean.Elab.Term.synthesizeSyntheticMVarsNoPostponing
      let one ← Lean.instantiateMVars one
      unless ← Lean.Meta.isDefEq witness one do
        Lean.throwError "Matching reference is not the typed polynomial unit"
      let type ← Lean.Meta.mkForallFVars parameters (← Lean.Meta.inferType payload)
      let payload ← Lean.Meta.mkLambdaFVars parameters payload
      let type ← Lean.instantiateMVars type
      let payload ← Lean.instantiateMVars payload
      if type.hasFVar || type.hasMVar || payload.hasFVar || payload.hasMVar then
        Lean.throwError "Explicit reference extraction left an open variable"
      pure (type, payload, (← Lean.Meta.ppExpr witness).pretty)
  for forbidden in #[source.name, `real_matching, `c2_real_matching_standard] do
    if payload.getUsedConstants.contains forbidden then
      Lean.throwError "Explicit reference payload retained the general source theorem alias"
  unless payload.getUsedConstants.contains ``c2_continuous_determinant_line do
    Lean.throwError "Explicit reference payload lost its simultaneous continuous coefficient"
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := `c2_real_matching_unit_reference
    levelParams := source.levelParams
    type := type
    value := payload
  })
  Lean.logInfo m!"C2_UNIT_REFERENCE: checked constructive witness {witnessText}; explicit payload accepted by normal kernel"

#print axioms c2_real_matching_unit_reference

import New.Columns.LocalStatement
import Lean
open Lean
set_option pp.fullNames true
set_option maxHeartbeats 0

private def rh79inspect (n : Name) : Lean.Elab.Command.CommandElabM Unit := do
  let info ← Lean.getConstInfo n
  let some val := info.value? (allowOpaque := true) |
    throwError "RH79 missing theorem body {n}"
  let ty := (Lean.toJson (reprStr info.type)).compress
  logInfo m!"RH79TYPE|{n}|{ty}"
  let levels := (Lean.toJson (reprStr info.levelParams)).compress
  logInfo m!"RH79LEVEL|{n}|{levels}"
  let tdeps := info.type.getUsedConstants
  let vdeps := val.getUsedConstants
  for d in tdeps do
    logInfo m!"RH79EDGE|{n}|type|{d}"
  for d in vdeps do
    logInfo m!"RH79EDGE|{n}|value|{d}"
  for d in vdeps do
    match ← Lean.getConstInfo d with
    | .ctorInfo c =>
      logInfo m!"RH79STRUCT|{d}|constructor_parent|{c.induct}"
    | .inductInfo i =>
      for c in i.ctors do
        logInfo m!"RH79STRUCT|{d}|inductive_constructor|{c}"
      for c in i.all do
        logInfo m!"RH79STRUCT|{d}|inductive_mutual|{c}"
    | .recInfo r =>
      for c in r.all do
        logInfo m!"RH79STRUCT|{d}|recursor_inductive|{c}"
      for rule in r.rules do
        logInfo m!"RH79STRUCT|{d}|recursor_constructor|{rule.ctor}"
        for dep in rule.rhs.getUsedConstants do
          logInfo m!"RH79STRUCT|{d}|recursor_rhs|{dep}"
    | _ => pure ()
  logInfo m!"RH79DONE|{n}"
run_cmd rh79inspect ``Parameters.norm_jetSeries_le
#print axioms Parameters.norm_jetSeries_le
run_cmd rh79inspect ``Parameters.norm_jet_jetSeries_le_one
#print axioms Parameters.norm_jet_jetSeries_le_one
run_cmd rh79inspect ``Data.IsGoodDatum.mem_raises
#print axioms Data.IsGoodDatum.mem_raises

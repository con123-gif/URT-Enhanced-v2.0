import Lean
import AxiomCycleBase
open Lean
run_cmd do
  let env := (← getEnv).setExporting false
  let p : Name := .str (.str .anonymous "CathedralAxiomCycle") "Witness"
  let roots : Array Name := #[p, .str p "plain", .str p "guarded"]
  for root in roots do
    let cached ← Lean.collectAxioms root
    let fresh := Lean.CollectAxioms.runM env
      (Lean.CollectAxioms.collectAndGet (fun _ _ => none) root)
    let j := Json.mkObj [("root", toJson root.toString),
      ("cached", toJson (cached.map Name.toString)),
      ("fresh", toJson (fresh.map Name.toString))]
    IO.println ("CYCLE_RESULT " ++ j.compress)

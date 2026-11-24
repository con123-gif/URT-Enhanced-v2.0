/-
Copyright (c) 2020 Microsoft Corporation. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Leonardo de Moura
-/
import Lean
import AxiomCycleBase

namespace Lean

namespace CathedralFreshCollectAxioms

structure State where
  /-- Cache mapping constants to their (sorted) axiom dependencies. -/
  seen   : NameMap (Array Name) := {}
  /-- Axioms accumulated for the current constant being processed. -/
  axioms : NameSet := {}

abbrev M := ReaderT Environment $ StateM State

def runM (env : Environment) (x : M α) : α :=
  x.run env |>.run' {}

def insertArray (s : NameSet) (axs : Array Name) : NameSet :=
  axs.foldl (init := s) fun acc ax => acc.insert ax

/--
Collect axioms reachable from constant `c`, using `extFind?` to look up pre-computed axioms
for imported declarations. Results are cached in `State.seen`.

When processing a constant not found in `extFind?` or the cache, the function temporarily
clears the axiom accumulator, recurses into the constant's dependencies, caches the result
in `seen`, and merges the collected axioms back.
-/
partial def collect
    (extFind? : Environment → Name → Option (Array Name))
    (c : Name) : M Unit := do
  let env ← read
  -- Check extension for pre-computed axioms (imported declarations)
  if let some axs := extFind? env c then
    modify fun s => { s with axioms := insertArray s.axioms axs, seen := s.seen.insert c axs }
    return
  -- Check local cache
  let s ← get
  if let some axs := s.seen.find? c then
    modify fun s => { s with axioms := insertArray s.axioms axs }
    return
  -- Recurse: temporarily clear axioms to isolate this constant's contribution.
  -- Insert sentinel to prevent infinite recursion (e.g., inductives ↔ constructors).
  let savedAxioms := s.axioms
  modify fun s => { s with axioms := {}, seen := s.seen.insert c #[] }
  let collectExpr (e : Expr) : M Unit := e.getUsedConstants.forM (collect extFind?)
  -- Take constants from the kernel env, which may differ from the elab env for (async) errors.
  match env.checked.get.find? c with
  | some (.axiomInfo v)  =>
      modify fun s => { s with axioms := s.axioms.insert c }
      collectExpr v.type
  | some (.defnInfo v)   => collectExpr v.type *> collectExpr v.value
  | some (.thmInfo v)    => collectExpr v.type *> collectExpr v.value
  | some (.opaqueInfo v) => collectExpr v.type *> collectExpr v.value
  | some (.quotInfo _)   => pure ()
  | some (.ctorInfo v)   => collectExpr v.type
  | some (.recInfo v)    => collectExpr v.type
  | some (.inductInfo v) => collectExpr v.type *> v.ctors.forM (collect extFind?)
  | none                 => pure ()
  -- Cache result (sorted for canonical order) and merge back into saved axioms
  let collected := (← get).axioms
  let result := collected.toArray.qsort Name.lt
  modify fun s => { s with
    seen   := s.seen.insert c result
    axioms := insertArray savedAxioms result
  }

/-- Collect axioms for `c` and return its sorted axiom list from the cache. -/
def collectAndGet
    (extFind? : Environment → Name → Option (Array Name))
    (c : Name) : M (Array Name) := do
  collect extFind? c
  let some axs := (← get).seen.find? c | panic! s!"collectAndGet: '{c}' not in seen after collect"
  return axs

end CathedralFreshCollectAxioms
end Lean
open Lean
run_cmd do
  let env := (← getEnv).setExporting false
  let p : Name := .str (.str .anonymous "CathedralAxiomCycle") "Witness"
  let roots : Array Name := #[p, .str p "plain", .str p "guarded"]
  let noneLookup : Environment → Name → Option (Array Name) := fun _ _ => none
  for root in roots do
    let cached ← Lean.collectAxioms root
    let fresh := Lean.CathedralFreshCollectAxioms.runM env
      (Lean.CathedralFreshCollectAxioms.collectAndGet noneLookup root)
    let j := Json.mkObj [("root", toJson root.toString),
      ("cached", toJson (cached.map Name.toString)),
      ("fresh", toJson (fresh.map Name.toString))]
    IO.println ("CYCLE_RESULT " ++ j.compress)
  let orders : Array (Array Name) := #[roots, #[roots[1]!, roots[0]!, roots[2]!], #[roots[2]!, roots[0]!, roots[1]!]]
  for order in orders do
    let results := Lean.CathedralFreshCollectAxioms.runM env do
      order.mapM fun n => Lean.CathedralFreshCollectAxioms.collectAndGet noneLookup n
    let j := Json.mkObj [("roots", toJson (order.map Name.toString)),
      ("axioms", toJson (results.map (fun xs => xs.map Name.toString)))]
    IO.println ("CYCLE_SHARED " ++ j.compress)

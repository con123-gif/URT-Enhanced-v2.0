/-
Cathedral RH dependency exporter v3. PARSER REPAIR; NATIVE RETRY PENDING.
Adds literal implicit dependencies, quotient package and mutual-block metadata.
Original source pin 40e56bab026552e089d7afcfeff08d2defb9c005,
Lean v4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Deliberately NO module header: use a matching built private environment.
-/
import Lean

open Lean
namespace CathedralKernelGraph

def nameId : Name → Array Json
  | .anonymous => #[]
  | .str p s => (nameId p).push (Json.arr #[Json.str "s", Json.str s])
  | .num p n => (nameId p).push (Json.arr #[Json.str "n", Json.str (toString n)])

def jid (n : Name) : Json := Json.arr (nameId n)
def jnames (xs : Array Name) : Json := Json.arr (xs.map jid)

structure ExprRefs where
  constants : Array Name := #[]
  projections : Array Name := #[]
  hasNatLit : Bool := false
  hasStrLit : Bool := false
  deriving Inhabited

/-- Cross-check constant collector with a separate expression traversal.
Record projection carrier names separately: FoldConsts skips them. -/
def exprRefs (e : Expr) : IO ExprRefs := do
  let cs ← IO.mkRef ({} : NameHashSet)
  let ps ← IO.mkRef ({} : NameHashSet)
  let natLit ← IO.mkRef false
  let strLit ← IO.mkRef false
  e.forEach fun x => do
    match x with
    | .const c _ => cs.modify (·.insert c)
    | .proj n _ _ => ps.modify (·.insert n)
    | .lit (.natVal _) => natLit.set true
    | .lit (.strVal _) => strLit.set true
    | _ => pure ()
  let found ← cs.get
  let builtin := e.getUsedConstants
  unless found.size == builtin.size && builtin.all (fun c => found.contains c) do
    throw (IO.userError "getUsedConstants disagrees with independent traversal")
  let projections ← ps.get
  let hasNat ← natLit.get
  let hasStr ← strLit.get
  return ⟨builtin, projections.toArray, hasNat, hasStr⟩

/-- The implicit primitive references used by lean4export. Separate from .const refs. -/
def ExprRefs.literalNames (r : ExprRefs) : Array Name :=
  (if r.hasNatLit then #[``Nat] else #[]) ++
  (if r.hasStrLit then #[``Char.ofNat, ``String.ofList] else #[])

def kind : ConstantInfo → String
  | .axiomInfo _ => "axiom"
  | .defnInfo _ => "definition"
  | .thmInfo _ => "theorem"
  | .opaqueInfo _ => "opaque"
  | .quotInfo _ => "quotient"
  | .inductInfo _ => "inductive"
  | .ctorInfo _ => "constructor"
  | .recInfo _ => "recursor"

def moduleName (env : Environment) (n : Name) : Name :=
  match env.getModuleIdxFor? n with
  | some i => env.allImportedModuleNames[i.toNat]?.getD .anonymous
  | none => env.mainModule

def record (env : Environment) (c : ConstantInfo) : IO (Json × Array Name) := do
  let tr ← exprRefs c.type
  let vr ← match c.value? (allowOpaque := true) with
    | some v => exprRefs v
    | none => pure {}
  let mut ctors : Array Name := #[]
  let mut group : Array Name := #[]
  let mut parent : Array Name := #[]
  let mut rules : Array Json := #[]
  let mut mutualBlock : Array Name := #[]
  let mut quotPkg : Array Name := #[]
  let mut ruleRefs : Array Name := #[]
  match c with
  | .defnInfo v => mutualBlock := v.all.toArray
  | .thmInfo v => mutualBlock := v.all.toArray
  | .opaqueInfo v => mutualBlock := v.all.toArray
  | .quotInfo _ => quotPkg := #[``Eq, ``Quot, ``Quot.mk, ``Quot.lift, ``Quot.ind]
  | .inductInfo v =>
    ctors := v.ctors.toArray
    group := v.all.toArray
  | .ctorInfo v => parent := #[v.induct]
  | .recInfo v =>
    group := v.all.toArray
    for rule in v.rules do
      let r ← exprRefs rule.rhs
      ruleRefs := ruleRefs.push rule.ctor
      for dep in r.constants do ruleRefs := ruleRefs.push dep
      for dep in r.projections do ruleRefs := ruleRefs.push dep
      for dep in r.literalNames do ruleRefs := ruleRefs.push dep
      rules := rules.push (Json.mkObj [
        ("constructor", jid rule.ctor),
        ("constants", jnames r.constants),
        ("projections", jnames r.projections),
        ("nat_literal", toJson r.hasNatLit), ("str_literal", toJson r.hasStrLit),
        ("literals", jnames r.literalNames)])
  | _ => pure ()
  let allDeps := tr.constants ++ vr.constants ++ tr.projections ++ vr.projections ++
    tr.literalNames ++ vr.literalNames ++ ctors ++ group ++ parent ++ ruleRefs ++ mutualBlock ++ quotPkg
  let j := Json.mkObj [
    ("record", toJson "node"), ("id", jid c.name), ("display", toJson c.name.toString),
    ("module", jid (moduleName env c.name)), ("kind", toJson (kind c)),
    ("unsafe", toJson c.isUnsafe), ("partial", toJson c.isPartial),
    ("has_value", toJson ((c.value? (allowOpaque := true)).isSome)),
    ("type_constants", jnames tr.constants), ("value_constants", jnames vr.constants),
    ("type_projections", jnames tr.projections), ("value_projections", jnames vr.projections),
    ("constructors", jnames ctors), ("group", jnames group), ("parent", jnames parent),
    ("type_nat_literal", toJson tr.hasNatLit), ("type_str_literal", toJson tr.hasStrLit),
    ("value_nat_literal", toJson vr.hasNatLit), ("value_str_literal", toJson vr.hasStrLit),
    ("type_literals", jnames tr.literalNames), ("value_literals", jnames vr.literalNames),
    ("mutual_block", jnames mutualBlock), ("quotient_package", jnames quotPkg),
    ("rules", Json.arr rules)]
  return (j, allDeps)

/-- Stream node records; enqueue each Name once. Preserve unresolved names and cycles. -/
def exportGraph (env : Environment) (roots : Array Name) (axiomRows : Array Json)
    (output : System.FilePath) : IO Unit := do
  let kenv := env.toKernelEnv
  IO.FS.withFile output .write fun h => do
    h.putStrLn (Json.mkObj [
      ("record", toJson "header"),
      ("schema", toJson "compact-kernel-union-v1"),
      ("roots", jnames roots),
      ("root_axioms", Json.arr axiomRows)
    ]).compress
    let mut seen : NameHashSet := {}
    for root in roots do
      seen := seen.insert root
    let mut queue := roots
    let mut cursor := 0
    let mut missing := 0
    while cursor < queue.size do
      let n := queue[cursor]!
      cursor := cursor + 1
      match kenv.find? n with
      | none =>
        missing := missing + 1
        h.putStrLn (Json.mkObj [
          ("record", toJson "missing"), ("id", jid n), ("display", toJson n.toString)
        ]).compress
      | some c =>
        let (j, deps) ← record env c
        h.putStrLn j.compress
        for d in deps do
          unless seen.contains d do
            seen := seen.insert d
            queue := queue.push d
    h.putStrLn (Json.mkObj [
      ("record", toJson "footer"), ("nodes", toJson queue.size),
      ("missing", toJson missing)
    ]).compress

end CathedralKernelGraph

set_option maxHeartbeats 0 in
set_option maxRecDepth 1000000 in
run_cmd do
  let roots : Array Name := #[``Nat.le_refl]
  let env := (← getEnv).setExporting false
  let mut axiomRows : Array Json := #[]
  for root in roots do
    match env.toKernelEnv.find? root with
    | some (.thmInfo _) => pure ()
    | _ => throwError "Root theorem not present as checked theorem"
    let axs ← Lean.collectAxioms root
    axiomRows := axiomRows.push (Json.mkObj [
      ("root", CathedralKernelGraph.jid root),
      ("lean_collect_axioms", CathedralKernelGraph.jnames axs)])
  let output ← IO.getEnv "CATHEDRAL_RH_GRAPH"
  CathedralKernelGraph.exportGraph env roots axiomRows
    (System.FilePath.mk (output.getD "compact_kernel_union.jsonl"))
#print axioms Nat.le_refl

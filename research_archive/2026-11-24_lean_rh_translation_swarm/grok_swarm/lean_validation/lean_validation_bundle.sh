#!/usr/bin/env bash
# Self-extracting text bundle of the Grok lean_validation lane files (the connector allows 4 files per commit).
# Usage: bash lean_validation_bundle.sh [DEST]   (default: directory of this script). Verifies sha256 of every file.
set -euo pipefail
D="${1:-$(cd "$(dirname "$0")" && pwd)}"

mkdir -p "$D/."
cat > "$D/REPRODUCE.sh" <<'GROK_EOF_4556a5280318'
#!/usr/bin/env bash
# Reproduce the Grok lean_validation lane (2026-11-24). Needs: git, curl, python>=3.11, node, sudo (tiers C only),
# squashfs-tools. LANE = this directory. Run steps by hand; they are long.
set -euo pipefail
LANE="$(cd "$(dirname "$0")" && pwd)"
# 0. toolchain (shared ~/.elan)
curl -sSfL https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -o /tmp/elan-init.sh
sh /tmp/elan-init.sh -y --default-toolchain none; export PATH=$HOME/.elan/bin:$PATH
elan toolchain install leanprover/lean4:v4.33.1
# 1. frozen source (blobless clone, full history so the 40e56bab pin can be checked)
git clone --filter=blob:none https://github.com/homeowmorphism/riemann-hypothesis-original /workspace/rh_orig
cd /workspace/rh_orig && test "$(git rev-parse HEAD)" = 4e8bb36faa8c9e3f1bda144ccf5a637f8b96066e
test "$(git rev-parse HEAD:src)" = 24df20b62d9976ccd20da819bc20b16f808f0fdd
# 2. Mathlib oleans only
MATHLIB_CACHE_GET_URL=https://cache.mathlib.org/mathlib4 lake exe mathlib/cache get
curl -sSfL -o /workspace/modules.jsonl.gz https://rh-cache.taucetiproject.org/bootstrap/e50d09817ad81469f737e8f637561e6ccf86c670/modules.jsonl.gz
echo "292caa386a620d935cfc736b56fcceaab9fe7073086693b62e899c1ee4725f04  /workspace/modules.jsonl.gz" | sha256sum -c -
# 3. Tier A (from source, Mathlib only)
LP="$(lake env printenv LEAN_PATH)"; O=$LANE/tierA/olean; mkdir -p $O/Formalism/GammaFactorNonvanishing
export LEAN_ABORT_ON_PANIC=1
LEAN_PATH="$LP:$O" lean --tstack=400000 -o $O/Statements.olean src/Statements.lean
LEAN_PATH="$LP:$O" lean --tstack=400000 -o $O/Formalism/GammaFactorNonvanishing/RhOfRight.olean src/Formalism/GammaFactorNonvanishing/RhOfRight.lean
LEAN_PATH="$LP:$O" lean --tstack=400000 $LANE/tierA/TierA_ReflectionSlice.lean
# 4. Tier B (selective restore of CritLine import closure)
python3 $LANE/tools/import_closure.py src /workspace/modules.jsonl.gz /tmp/closure_critline.json Formalism.GammaFactorNonvanishing.CritLine
python3 $LANE/tools/selective_restore.py /workspace/rh_orig /workspace/modules.jsonl.gz /tmp/closure_critline.json --jobs 4
sudo sysctl -w vm.max_map_count=1048576
mkdir -p /tmp/stmt && cp $O/Statements.olean /tmp/stmt/
LEAN_PATH="/tmp/stmt:$LP" lean --tstack=400000 -o /tmp/CritLine.olean src/Formalism/GammaFactorNonvanishing/CritLine.lean
LEAN_PATH="/tmp/stmt:$LP" lean --tstack=400000 $LANE/tierB/TierB_EveryCharacterJunction.lean
# 5. kernel graphs
EXTRA_LEAN_PATH=$O $LANE/kernel/run_kernel_export.sh /workspace/rh_orig Formalism.GammaFactorNonvanishing.RhOfRight Formalism.VW.rh_of_right /tmp/graph_rh_of_right.jsonl
$LANE/kernel/run_kernel_export.sh /workspace/rh_orig Formalism.GammaFactorNonvanishing.CritLine Formalism.VW.rh_of_every /tmp/graph_rh_of_every.jsonl
# verify with research_archive/.../specialists/kernel_extractor/verify_graph_v2.mjs, summarise with kernel/summarize_graph.py
# 6. Tier C storage: fetch all, squash in batches (~30 GB), kernel loop mounts + symlink farm
python3 $LANE/tools/import_closure.py src /workspace/modules.jsonl.gz /tmp/closure_critline.json Formalism.GammaFactorNonvanishing.CritLine
python3 $LANE/tools/selective_restore.py /workspace/rh_orig /workspace/modules.jsonl.gz <closure_all_manifest.json> --fetch-only
# squash existing .lake/build as batch00 first, then:
python3 $LANE/tools/squash_pipeline.py /workspace/rh_orig /workspace/modules.jsonl.gz /workspace/rh_squash 12000 /tmp/closure_critline.json
for img in /workspace/rh_squash/batch*.sqfs; do m=${img%.sqfs}.kmnt; mkdir -p $m; sudo mount -t squashfs -o loop,ro $img $m; done
python3 $LANE/tools/symlink_farm.py /workspace/rh_full_build/lib/lean /workspace/rh_squash/batch*.kmnt
$LANE/tierC/run_tierC.sh $LANE/tierC/TierC_PrintAxioms.lean
GROK_EOF_4556a5280318
chmod +x "$D/REPRODUCE.sh"
mkdir -p "$D/."
cat > "$D/closure_summary.json" <<'GROK_EOF_4c96de88a6f0'
{
 "closure_Development.AutomorphicArithmetic.CharacterBoxes.EveryCharacter.json": {
  "roots": [
   "Development.AutomorphicArithmetic.CharacterBoxes.EveryCharacter"
  ],
  "local_modules": 14299,
  "external_modules": 60,
  "external_by_package_root": {
   "Mathlib": 60
  },
  "import_edges_scanned": 42788,
  "manifest_modules": 175187,
  "local_not_in_manifest": [],
  "local_count": 14299,
  "local_sha256": "5ef171c24ae96c1349e25597d726789394c55a3770d874a0c0381d63cbe97033"
 },
 "closure_Development.AutomorphicArithmetic.CharacterBoxes.MainConclusion.json": {
  "roots": [
   "Development.AutomorphicArithmetic.CharacterBoxes.MainConclusion"
  ],
  "local_modules": 175174,
  "external_modules": 348,
  "external_by_package_root": {
   "Mathlib": 344,
   "Lean": 3,
   "Batteries": 1
  },
  "import_edges_scanned": 909794,
  "manifest_modules": 175187,
  "local_not_in_manifest": [],
  "local_count": 175174,
  "local_sha256": "e0c6e0df1f7db306f7da11d084565d0cd550708e934c6274744e0b3c18736db9"
 },
 "closure_Formalism.GammaFactorNonvanishing.CritLine.json": {
  "roots": [
   "Formalism.GammaFactorNonvanishing.CritLine"
  ],
  "local_modules": 14301,
  "external_modules": 60,
  "external_by_package_root": {
   "Mathlib": 60
  },
  "import_edges_scanned": 42791,
  "manifest_modules": 175187,
  "local_not_in_manifest": [],
  "local_count": 14301,
  "local_sha256": "bc328434e2611f78869890d2b2169d55abcef3431f6718aa0098f4de1b410428"
 },
 "closure_Formalism.GammaFactorNonvanishing.RhOfRight.json": {
  "roots": [
   "Formalism.GammaFactorNonvanishing.RhOfRight"
  ],
  "local_modules": 1,
  "external_modules": 1,
  "external_by_package_root": {
   "Mathlib": 1
  },
  "import_edges_scanned": 1,
  "manifest_modules": 175187,
  "local_not_in_manifest": [],
  "local_count": 1,
  "local_sha256": "8f8c42a01496568d78905774dba5f73e0ec97a3821946c76871c6f09f09256a0"
 },
 "closure_Statements.json": {
  "roots": [
   "Statements"
  ],
  "local_modules": 1,
  "external_modules": 1,
  "external_by_package_root": {
   "Mathlib": 1
  },
  "import_edges_scanned": 1,
  "manifest_modules": 175187,
  "local_not_in_manifest": [],
  "local_count": 1,
  "local_sha256": "85f86d38c4d60edee28a491acaf150a6786f2f36297f41dd4eb7f834846eca7a"
 },
 "closure_Supplements.Kernels.MainTheorems.json": {
  "roots": [
   "Supplements.Kernels.MainTheorems"
  ],
  "local_modules": 175179,
  "external_modules": 348,
  "external_by_package_root": {
   "Mathlib": 344,
   "Lean": 3,
   "Batteries": 1
  },
  "import_edges_scanned": 909802,
  "manifest_modules": 175187,
  "local_not_in_manifest": [],
  "local_count": 175179,
  "local_sha256": "868da7d308b8cb304dce7466e2802f474e9982149f369fff16192fb8f14c2fe3"
 },
 "closure_all_manifest.json": {
  "local_count": 175187,
  "local_sha256": "f11fdbc778ef9d512d95e892bf0f8067c84c9153a59f812ebdc26689021a2f6d"
 },
 "closure_companionV2.json": {
  "roots": [
   "/workspace/rh_lean/research_archive/2026-11-24_lean_rh_translation_swarm/integration/RH_ProofCarryingThetaV2.lean"
  ],
  "local_modules": 175177,
  "external_modules": 348,
  "external_by_package_root": {
   "Mathlib": 344,
   "Lean": 3,
   "Batteries": 1
  },
  "import_edges_scanned": 909798,
  "manifest_modules": 175187,
  "local_not_in_manifest": [],
  "local_count": 175177,
  "local_sha256": "c47f86725f0de8afae1470e7f775b88220a500583b4ecb7238e6265680791cfc"
 }
}
GROK_EOF_4c96de88a6f0
truncate -s -1 "$D/closure_summary.json"
mkdir -p "$D/kernel"
cat > "$D/kernel/KernelDepExport.lean.in" <<'GROK_EOF_84ad60ccce57'
/-
Grok lean_validation lane: kernel dependency exporter driver.
The `CathedralKernelGraph` namespace below is copied from
specialists/kernel_extractor/KernelGraphExport_v2.lean (previously UNCOMPILED); only the
imports and the `run_cmd` driver differ: the root comes from env CATHEDRAL_ROOT and the import
line IMPORT_PLACEHOLDER is substituted by run_kernel_export.sh.
REPAIRS to v2 needed for it to parse under Lean 4.33.1 (v2 had never been compiled):
`mutual` and `at` are reserved keywords -> renamed `mutualBlk`, `pos`; the multi-line structure
instance returned by `exprRefs` did not parse (fields after the line break were silently
dropped, so literal flags defaulted to false) -> replaced by `ExprRefs.mk` positional call. No semantic change.
Lean v4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474, RH pin 40e56bab / frozen 4e8bb36f.
-/
import Lean
IMPORT_PLACEHOLDER

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
  let nl ← natLit.get
  let sl ← strLit.get
  return ExprRefs.mk builtin projections.toArray nl sl

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
  let mut mutualBlk : Array Name := #[]
  let mut quotPkg : Array Name := #[]
  let mut ruleRefs : Array Name := #[]
  match c with
  | .defnInfo v => mutualBlk := v.all.toArray
  | .thmInfo v => mutualBlk := v.all.toArray
  | .opaqueInfo v => mutualBlk := v.all.toArray
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
    tr.literalNames ++ vr.literalNames ++ ctors ++ group ++ parent ++ ruleRefs ++ mutualBlk ++ quotPkg
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
    ("mutual_block", jnames mutualBlk), ("quotient_package", jnames quotPkg),
    ("rules", Json.arr rules)]
  return (j, allDeps)

/-- Stream node records; enqueue each Name once. Preserve unresolved names and cycles. -/
def exportGraph (env : Environment) (root : Name) (builtinAxioms : Array Name)
    (output : System.FilePath) : IO Unit := do
  let kenv := env.toKernelEnv
  IO.FS.withFile output .write fun h => do
    h.putStrLn (Json.mkObj [
      ("record", toJson "header"),
      ("schema", toJson "cathedral-kernel-v2"),
      ("root", jid root),
      ("lean_collect_axioms", jnames builtinAxioms)
    ]).compress
    let mut seen : NameHashSet := {}
    seen := seen.insert root
    let mut queue := #[root]
    let mut pos := 0
    let mut missing := 0
    while pos < queue.size do
      let n := queue[pos]!
      pos := pos + 1
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
  let some rootStr ← IO.getEnv "CATHEDRAL_ROOT" | throwError "set CATHEDRAL_ROOT"
  let root : Name := rootStr.toName
  let env := (← getEnv).setExporting false
  match env.toKernelEnv.find? root with
  | some (.thmInfo _) => pure ()
  | _ => throwError "root not present as a checked theorem: {root}"
  let axs ← Lean.collectAxioms root
  let output ← IO.getEnv "CATHEDRAL_RH_GRAPH"
  let path := System.FilePath.mk (output.getD "kernel_graph.jsonl")
  CathedralKernelGraph.exportGraph env root axs path
  logInfo m!"root {root}: collectAxioms = {axs}; wrote {path}"
GROK_EOF_84ad60ccce57
mkdir -p "$D/kernel"
cat > "$D/kernel/run_kernel_export.sh" <<'GROK_EOF_0ca22a153589'
#!/usr/bin/env bash
# usage: run_kernel_export.sh FROZEN_REPO IMPORT_MODULE ROOT_CONST OUT_JSONL  (extra LEAN_PATH via EXTRA_LEAN_PATH)
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"; repo="$1"; imp="$2"; root="$3"; out="$4"
work="$(mktemp -d)"; trap 'rm -rf "$work"' EXIT
sed "s/^IMPORT_PLACEHOLDER\$/import $imp/" "$here/KernelDepExport.lean.in" > "$work/Driver.lean"
cd "$repo"
export LEAN_PATH="${EXTRA_LEAN_PATH:+$EXTRA_LEAN_PATH:}$(lake env printenv LEAN_PATH)"
export LEAN_ABORT_ON_PANIC=1 CATHEDRAL_ROOT="$root" CATHEDRAL_RH_GRAPH="$out"
lean --tstack=400000 "$work/Driver.lean"
GROK_EOF_0ca22a153589
chmod +x "$D/kernel/run_kernel_export.sh"
mkdir -p "$D/kernel"
cat > "$D/kernel/summarize_graph.py" <<'GROK_EOF_f17923ef31a4'
#!/usr/bin/env python3
"""Summarise a cathedral-kernel-v2 JSONL graph (streaming). Usage: summarize_graph.py GRAPH SRC_DIR OUT_JSON
Project-local = declaring module has a .lean file under SRC_DIR (frozen RH src tree)."""
import json,sys,hashlib,collections
from pathlib import Path
g,src,outp=sys.argv[1],Path(sys.argv[2]),sys.argv[3]
h=hashlib.sha256(); byroot=collections.Counter(); kinds=collections.Counter(); axioms=[]; proj={}; hdr=foot=None
islocal={}
def name(i): return '.'.join(p[1] for p in i)
with open(g,'rb') as f:
    for line in f:
        h.update(line); r=json.loads(line)
        if r['record']=='header': hdr=r; continue
        if r['record']=='footer': foot=r; continue
        if r['record']!='node': continue
        mod=name(r['module']); kinds[r['kind']]+=1
        if mod not in islocal: islocal[mod]=(src/(mod.replace('.','/')+'.lean')).is_file()
        byroot['PROJECT:'+mod.split('.')[0] if islocal[mod] else mod.split('.')[0]]+=1
        if r['kind']=='axiom': axioms.append(r['display'])
        if islocal[mod]:
            deps=set(name(d) for k in ('type_constants','value_constants') for d in r[k])
            proj[r['display']]={'module':mod,'kind':r['kind'],'deps':sorted(deps)}
pn=set(proj)
for v in proj.values(): v['project_deps']=[d for d in v['deps'] if d in pn]; v['external_dep_count']=len(v['deps'])-len(v['project_deps']); del v['deps']
out={'graph_file':Path(g).name,'graph_sha256':h.hexdigest(),'root':name(hdr['root']),
 'lean_collectAxioms':[name(a) for a in hdr['lean_collect_axioms']],'footer':foot,
 'kinds':dict(kinds),'nodes_by_package_root':dict(byroot.most_common()),'axiom_nodes_in_closure':axioms,
 'project_local_nodes':len(proj),'project_modules':sorted(set(v['module'] for v in proj.values())),
 'project_subgraph':proj if len(proj)<=5000 else 'omitted (>5000 nodes)'}
json.dump(out,open(outp,'w'),indent=1)
print(json.dumps({k:out[k] for k in ('root','graph_sha256','lean_collectAxioms','footer','kinds','axiom_nodes_in_closure','project_local_nodes')}))
GROK_EOF_f17923ef31a4
mkdir -p "$D/kernel"
cat > "$D/kernel/summary_rh_of_every.json" <<'GROK_EOF_c868cfc0a077'
{
 "graph_file": "graph_rh_of_every.jsonl",
 "graph_sha256": "bbcbd35aa018ad0c9131972ac6f9702e15cd0b797e84f218e3da03332c7c03e1",
 "root": "Formalism.VW.rh_of_every",
 "lean_collectAxioms": [
  "propext",
  "Classical.choice",
  "Quot.sound"
 ],
 "footer": {
  "missing": 0,
  "nodes": 54775,
  "record": "footer"
 },
 "kinds": {
  "theorem": 42075,
  "definition": 10337,
  "inductive": 978,
  "constructor": 1068,
  "axiom": 3,
  "recursor": 264,
  "opaque": 46,
  "quotient": 4
 },
 "nodes_by_package_root": {
  "Mathlib": 47591,
  "Init": 7008,
  "Batteries": 168,
  "PROJECT:Formalism": 4,
  "PROJECT:Development": 2,
  "Std": 1,
  "Aesop": 1
 },
 "axiom_nodes_in_closure": [
  "propext",
  "Quot.sound",
  "Classical.choice"
 ],
 "project_local_nodes": 6,
 "project_modules": [
  "Development.AutomorphicArithmetic.CharacterBoxes.EveryCharacter",
  "Formalism.GammaFactorNonvanishing.CritLine",
  "Formalism.GammaFactorNonvanishing.RhOfRight"
 ],
 "project_subgraph": {
  "Formalism.VW.rh_of_every": {
   "module": "Formalism.GammaFactorNonvanishing.CritLine",
   "kind": "theorem",
   "project_deps": [
    "Formalism.VW.rh_of_right",
    "UpperTheory.EveryCharacter"
   ],
   "external_dep_count": 38
  },
  "UpperTheory.EveryCharacter": {
   "module": "Development.AutomorphicArithmetic.CharacterBoxes.EveryCharacter",
   "kind": "definition",
   "project_deps": [
    "UpperTheory.EveryCharacter._proof_1"
   ],
   "external_dep_count": 33
  },
  "Formalism.VW.rh_of_right": {
   "module": "Formalism.GammaFactorNonvanishing.RhOfRight",
   "kind": "theorem",
   "project_deps": [
    "Formalism.VW.rh_of_right._proof_1_1",
    "Formalism.VW.rh_of_right._proof_1_2"
   ],
   "external_dep_count": 337
  },
  "UpperTheory.EveryCharacter._proof_1": {
   "module": "Development.AutomorphicArithmetic.CharacterBoxes.EveryCharacter",
   "kind": "theorem",
   "project_deps": [],
   "external_dep_count": 9
  },
  "Formalism.VW.rh_of_right._proof_1_1": {
   "module": "Formalism.GammaFactorNonvanishing.RhOfRight",
   "kind": "theorem",
   "project_deps": [],
   "external_dep_count": 58
  },
  "Formalism.VW.rh_of_right._proof_1_2": {
   "module": "Formalism.GammaFactorNonvanishing.RhOfRight",
   "kind": "theorem",
   "project_deps": [],
   "external_dep_count": 58
  }
 }
}
GROK_EOF_c868cfc0a077
truncate -s -1 "$D/kernel/summary_rh_of_every.json"
mkdir -p "$D/kernel"
cat > "$D/kernel/summary_rh_of_right.json" <<'GROK_EOF_f6042b36dfeb'
{
 "graph_file": "graph_rh_of_right.jsonl",
 "graph_sha256": "da345fbb7baa5472a5357cd8b412ac0bcc51580a74c7a5a60d8eb31be22b16da",
 "root": "Formalism.VW.rh_of_right",
 "lean_collectAxioms": [
  "propext",
  "Classical.choice",
  "Quot.sound"
 ],
 "footer": {
  "missing": 0,
  "nodes": 54444,
  "record": "footer"
 },
 "kinds": {
  "theorem": 41803,
  "inductive": 975,
  "definition": 10285,
  "constructor": 1065,
  "axiom": 3,
  "recursor": 263,
  "opaque": 46,
  "quotient": 4
 },
 "nodes_by_package_root": {
  "Mathlib": 47268,
  "Init": 7003,
  "Batteries": 168,
  "PROJECT:Formalism": 3,
  "Std": 1,
  "Aesop": 1
 },
 "axiom_nodes_in_closure": [
  "propext",
  "Classical.choice",
  "Quot.sound"
 ],
 "project_local_nodes": 3,
 "project_modules": [
  "Formalism.GammaFactorNonvanishing.RhOfRight"
 ],
 "project_subgraph": {
  "Formalism.VW.rh_of_right": {
   "module": "Formalism.GammaFactorNonvanishing.RhOfRight",
   "kind": "theorem",
   "project_deps": [
    "Formalism.VW.rh_of_right._proof_1_1",
    "Formalism.VW.rh_of_right._proof_1_2"
   ],
   "external_dep_count": 337
  },
  "Formalism.VW.rh_of_right._proof_1_1": {
   "module": "Formalism.GammaFactorNonvanishing.RhOfRight",
   "kind": "theorem",
   "project_deps": [],
   "external_dep_count": 58
  },
  "Formalism.VW.rh_of_right._proof_1_2": {
   "module": "Formalism.GammaFactorNonvanishing.RhOfRight",
   "kind": "theorem",
   "project_deps": [],
   "external_dep_count": 58
  }
 }
}
GROK_EOF_f6042b36dfeb
truncate -s -1 "$D/kernel/summary_rh_of_right.json"
mkdir -p "$D/logs"
cat > "$D/logs/companion_script.log" <<'GROK_EOF_ec27bb6e2733'
Terminated
SCRIPT_EXIT=143
GROK_EOF_ec27bb6e2733
mkdir -p "$D/logs"
cat > "$D/logs/kernel_rh_of_every.log" <<'GROK_EOF_f76ec32f331f'
root Formalism.VW.rh_of_every: collectAxioms = [propext,
 Classical.choice,
 Quot.sound]; wrote /workspace/lean_validation/kernel/graph_rh_of_every.jsonl

real	2m3.939s
user	1m39.597s
sys	0m11.368s
EXIT=0
GROK_EOF_f76ec32f331f
mkdir -p "$D/logs"
cat > "$D/logs/kernel_rh_of_right.log" <<'GROK_EOF_780aefeb9d39'
root Formalism.VW.rh_of_right: collectAxioms = [propext,
 Classical.choice,
 Quot.sound]; wrote /workspace/lean_validation/kernel/graph_rh_of_right.jsonl

real	1m5.318s
user	0m50.999s
sys	0m5.821s
EXIT=0
GROK_EOF_780aefeb9d39
mkdir -p "$D/logs"
cat > "$D/logs/mathlib_cache_tail.log" <<'GROK_EOF_623ed0a02dcf'
info: mathlib: cloning https://github.com/leanprover-community/mathlib4
info: mathlib: checking out revision '0df444a360eaa60ab8c11dca51a86af692955474'
info: plausible: cloning https://github.com/leanprover-community/plausible
info: plausible: checking out revision 'b7eb3304aeae834b12dda98993a37f6a41f6f0bb'
info: LeanSearchClient: cloning https://github.com/leanprover-community/LeanSearchClient
info: LeanSearchClient: checking out revision '5f4d51b81cbd3f6b32b156bfad9056621a040404'
info: importGraph: cloning https://github.com/leanprover-community/import-graph
info: importGraph: checking out revision '16f02aa7642864af59f1ff0e384a015994db9118'
info: proofwidgets: cloning https://github.com/leanprover-community/ProofWidgets4
info: proofwidgets: checking out revision '4be2e3d5087eeb272cf5a8853b8f9dd025ef5957'
info: aesop: cloning https://github.com/leanprover-community/aesop
info: aesop: checking out revision '3448c0bcc5ce01b2d1546e483ec3620e32df3d0e'
info: Qq: cloning https://github.com/leanprover-community/quote4
info: Qq: checking out revision '92c15be17b7caf78c2ad767ec40f89052d908d81'
info: batteries: cloning https://github.com/leanprover-community/batteries
info: batteries: checking out revision '4488d40d070b9700d4d5a6aa342f0d40c31b2a2d'
info: Cli: cloning https://github.com/leanprover/lean4-cli
info: Cli: checking out revision '6130a47896ce867c6a4a55373441e59e565bad0f'
✔ [4/26] Built Cache.Cli (541ms)
✔ [5/26] Built Cache.Lean (518ms)
✔ [6/26] Built Cache.Infra (531ms)
✔ [7/26] Built Cache.Cli:c.o (220ms)
✔ [8/26] Built Cache.Lean:c.o (247ms)
✔ [9/26] Built Cache.Infra:c.o (163ms)
✔ [10/26] Built Batteries.Tactic.OpenPrivate (941ms)
✔ [11/26] Built Batteries.Tactic.OpenPrivate:c.o (934ms)
✔ [12/26] Built Cache.IO (1.2s)
✔ [13/26] Built Cache.Hashing (727ms)
✔ [14/26] Built Cache.Hashing:c.o (370ms)
✔ [15/26] Built Cache.IO:c.o (1.2s)
✔ [16/26] Built Cache.Requests (1.7s)
✔ [17/26] Built Cache.Marker (495ms)
✔ [18/26] Built Cache.Marker:c.o (121ms)
✔ [19/26] Built Cache.Query (632ms)
✔ [20/26] Built Cache.Query:c.o (230ms)
✔ [21/26] Built Cache.Warning (565ms)
✔ [22/26] Built Cache.Warning:c.o (225ms)
✔ [23/26] Built Cache.Requests:c.o (2.2s)
✔ [24/26] Built Cache.Main (970ms)
✔ [25/26] Built Cache.Main:c.o (773ms)
✔ [26/26] Built cache:exe (1.4s)
Current branch: HEAD
Using cache from origin: (some leanprover-community/mathlib4)
Decompressing 8689 already-cached file(s) (1 already decompressed)
No files to download
Decompressed 8689 already-cached file(s)
Completed successfully in 22493 ms!

real	1m19.615s
user	1m43.143s
sys	0m33.256s
EXIT=0
GROK_EOF_623ed0a02dcf
mkdir -p "$D/logs"
cat > "$D/logs/olean_count.txt" <<'GROK_EOF_4d246c8169ad'
175187
GROK_EOF_4d246c8169ad
mkdir -p "$D/logs"
cat > "$D/logs/tierA_compile.log" <<'GROK_EOF_86c663a28630'
++ nice -n 10 lean --tstack=400000 -o /workspace/lean_validation/tierA/olean/Statements.olean src/Statements.lean

real	0m10.947s
user	0m3.585s
sys	0m3.653s
++ echo 'EXIT Statements=0'
EXIT Statements=0
++ nice -n 10 lean --tstack=400000 -o /workspace/lean_validation/tierA/olean/Formalism/GammaFactorNonvanishing/RhOfRight.olean src/Formalism/GammaFactorNonvanishing/RhOfRight.lean

real	0m6.015s
user	0m3.675s
sys	0m2.239s
++ echo 'EXIT RhOfRight=0'
EXIT RhOfRight=0
++ nice -n 10 lean --tstack=400000 /workspace/lean_validation/tierA/TierA_ReflectionSlice.lean
/workspace/lean_validation/tierA/TierA_ReflectionSlice.lean:20:7: error(lean.unknownIdentifier): Unknown identifier `LFunction_modOne_eq`
/workspace/lean_validation/tierA/TierA_ReflectionSlice.lean:17:57: error: unsolved goals
h : DirichletLNonvanishingRightOfHalf
s : ℂ
hs : 1 / 2 < s.re
hs1 : s ≠ 1
hχ : DirichletCharacter.LFunction 1 s ≠ 0
⊢ riemannZeta s ≠ 0
'Formalism.VW.rh_of_right' depends on axioms: [propext, Classical.choice, Quot.sound]
'CathedralRHTierA.zetaRight' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
'CathedralRHTierA.rhOfDirichletRight' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]

real	0m4.688s
user	0m2.645s
sys	0m2.070s
++ echo 'EXIT TierA_slice=1'
EXIT TierA_slice=1
GROK_EOF_86c663a28630
mkdir -p "$D/logs"
cat > "$D/logs/tierA_slice_v2.log" <<'GROK_EOF_7c78dcb1bbe3'
++ nice -n 10 lean --tstack=400000 /workspace/lean_validation/tierA/TierA_ReflectionSlice.lean
'Formalism.VW.rh_of_right' depends on axioms: [propext, Classical.choice, Quot.sound]
'CathedralRHTierA.zetaRight' depends on axioms: [propext, Classical.choice, Quot.sound]
'CathedralRHTierA.rhOfDirichletRight' depends on axioms: [propext, Classical.choice, Quot.sound]

real	0m8.618s
user	0m3.352s
sys	0m3.026s
++ echo 'EXIT TierA_slice=0'
EXIT TierA_slice=0
GROK_EOF_7c78dcb1bbe3
mkdir -p "$D/logs"
cat > "$D/logs/tierB_compile.log" <<'GROK_EOF_e00273df9d12'
++ nice -n 10 lean --tstack=400000 -o /workspace/lean_validation/tierB/olean/Formalism/GammaFactorNonvanishing/CritLine.olean src/Formalism/GammaFactorNonvanishing/CritLine.lean
src/Formalism/GammaFactorNonvanishing/CritLine.lean:1:0: error: failed to read file '/workspace/rh_orig/.lake/build/lib/lean/Development/AbelianVarietyTheory/Proofs/AdelicLatticeProofs/AddNsmulResidueAssoc.olean'

real	0m16.703s
user	0m1.424s
sys	0m2.966s
++ echo 'EXIT CritLine_from_source=1'
EXIT CritLine_from_source=1
++ nice -n 10 lean --tstack=400000 /workspace/lean_validation/tierB/TierB_EveryCharacterJunction.lean
/workspace/lean_validation/tierB/TierB_EveryCharacterJunction.lean:1:0: error: unknown module prefix 'Statements'

No directory 'Statements' or file 'Statements.olean' in the search path entries:
/workspace/rh_orig/.lake/packages/Cli/.lake/build/lib/lean
/workspace/rh_orig/.lake/packages/batteries/.lake/build/lib/lean
/workspace/rh_orig/.lake/packages/Qq/.lake/build/lib/lean
/workspace/rh_orig/.lake/packages/aesop/.lake/build/lib/lean
/workspace/rh_orig/.lake/packages/proofwidgets/.lake/build/lib/lean
/workspace/rh_orig/.lake/packages/importGraph/.lake/build/lib/lean
/workspace/rh_orig/.lake/packages/LeanSearchClient/.lake/build/lib/lean
/workspace/rh_orig/.lake/packages/plausible/.lake/build/lib/lean
/workspace/rh_orig/.lake/packages/mathlib/.lake/build/lib/lean
/workspace/rh_orig/.lake/build/lib/lean
/home/box/.elan/toolchains/leanprover--lean4---v4.33.1/lib/lean
/home/box/.elan/toolchains/leanprover--lean4---v4.33.1/lib/lean

real	0m0.248s
user	0m0.056s
sys	0m0.191s
++ echo 'EXIT TierB_slice=1'
EXIT TierB_slice=1
GROK_EOF_e00273df9d12
mkdir -p "$D/logs"
cat > "$D/logs/tierB_compile3.log" <<'GROK_EOF_e413e444a31e'
++ cat /proc/sys/vm/max_map_count
1048576
++ nice -n 10 lean --tstack=400000 -o /workspace/lean_validation/tierB/olean/Formalism/GammaFactorNonvanishing/CritLine.olean src/Formalism/GammaFactorNonvanishing/CritLine.lean

real	0m32.745s
user	0m8.495s
sys	0m9.480s
++ echo 'EXIT CritLine_from_source=0'
EXIT CritLine_from_source=0
++ nice -n 10 lean --tstack=400000 /workspace/lean_validation/tierB/TierB_EveryCharacterJunction.lean
'Formalism.VW.gammaFactor_ne_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'Formalism.VW.critLine' depends on axioms: [propext, Classical.choice, Quot.sound]
'Formalism.VW.rh_of_every' depends on axioms: [propext, Classical.choice, Quot.sound]
'CathedralRHTierB.everyOfRight' depends on axioms: [propext, Classical.choice, Quot.sound]
'CathedralRHTierB.rhOfDirichletRight_viaEvery' depends on axioms: [propext, Classical.choice, Quot.sound]

real	0m10.551s
user	0m5.386s
sys	0m3.813s
++ echo 'EXIT TierB_slice=0'
EXIT TierB_slice=0
GROK_EOF_e413e444a31e
mkdir -p "$D/logs"
cat > "$D/logs/tierB_restore.log" <<'GROK_EOF_9f78dd3a7e96'
fetched 0/14301 bytes_new=94704 t=0s
fetched 2000/14301 bytes_new=62470696 t=12s
fetched 4000/14301 bytes_new=167008538 t=24s
fetched 6000/14301 bytes_new=265922389 t=36s
fetched 8000/14301 bytes_new=321235972 t=47s
fetched 10000/14301 bytes_new=375196712 t=59s
fetched 12000/14301 bytes_new=474762882 t=70s
fetched 14000/14301 bytes_new=553425055 t=82s
FETCH_DONE modules=14301 new_bytes=564630804 t=83s

thread '<unknown>' (380163) has overflowed its stack
fatal runtime error: stack overflow, aborting
Traceback (most recent call last):
  File "/workspace/lean_validation/selective_restore.py", line 47, in <module>
    subprocess.run([str(lean.with_name("leantar")),"--jobs",str(jobsn),"-f","-x","-j","-"],input=json.dumps(jobs),text=True,cwd=root,check=True)
    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/subprocess.py", line 577, in run
    raise CalledProcessError(retcode, process.args,
                             output=stdout, stderr=stderr)
subprocess.CalledProcessError: Command '['/home/box/.elan/toolchains/leanprover--lean4---v4.33.1/bin/leantar', '--jobs', '6', '-f', '-x', '-j', '-']' died with <Signals.SIGABRT: 6>.
GROK_EOF_9f78dd3a7e96
mkdir -p "$D/logs"
cat > "$D/logs/tierB_restore2.log" <<'GROK_EOF_b6e9da2b8004'
fetched 0/14301 bytes_new=0 t=0s
fetched 2000/14301 bytes_new=0 t=0s
fetched 4000/14301 bytes_new=0 t=1s
fetched 6000/14301 bytes_new=0 t=1s
fetched 8000/14301 bytes_new=0 t=1s
fetched 10000/14301 bytes_new=0 t=1s
fetched 12000/14301 bytes_new=0 t=1s
fetched 14000/14301 bytes_new=0 t=1s
FETCH_DONE modules=14301 new_bytes=0 t=2s
RESTORE_DONE modules=14301 t=28s
GROK_EOF_b6e9da2b8004
mkdir -p "$D/logs"
cat > "$D/logs/tierC_fetch.log" <<'GROK_EOF_46e5103971a1'
fetched 0/175177 bytes_new=1161 t=2s
fetched 2000/175177 bytes_new=49389101 t=9s
fetched 4000/175177 bytes_new=147751103 t=17s
fetched 6000/175177 bytes_new=225830610 t=24s
fetched 8000/175177 bytes_new=277241266 t=30s
fetched 10000/175177 bytes_new=328731197 t=38s
fetched 12000/175177 bytes_new=386347561 t=46s
fetched 14000/175177 bytes_new=443600703 t=53s
fetched 16000/175177 bytes_new=485308771 t=63s
fetched 18000/175177 bytes_new=529998325 t=71s
fetched 20000/175177 bytes_new=577509294 t=78s
fetched 22000/175177 bytes_new=619610234 t=85s
fetched 24000/175177 bytes_new=660934663 t=93s
fetched 26000/175177 bytes_new=703189273 t=101s
fetched 28000/175177 bytes_new=746398985 t=111s
fetched 30000/175177 bytes_new=790656151 t=119s
fetched 32000/175177 bytes_new=830753244 t=126s
fetched 34000/175177 bytes_new=868308521 t=137s
fetched 36000/175177 bytes_new=908642098 t=143s
fetched 38000/175177 bytes_new=949024848 t=155s
fetched 40000/175177 bytes_new=987458618 t=160s
fetched 42000/175177 bytes_new=1032522700 t=167s
fetched 44000/175177 bytes_new=1073154666 t=182s
fetched 46000/175177 bytes_new=1116655081 t=185s
fetched 48000/175177 bytes_new=1154759444 t=192s
fetched 50000/175177 bytes_new=1195918136 t=199s
fetched 52000/175177 bytes_new=1237721710 t=216s
fetched 54000/175177 bytes_new=1282874393 t=216s
fetched 56000/175177 bytes_new=1328301700 t=232s
fetched 58000/175177 bytes_new=1381091629 t=232s
fetched 60000/175177 bytes_new=1436073264 t=239s
fetched 62000/175177 bytes_new=1484466134 t=258s
fetched 64000/175177 bytes_new=1530444763 t=258s
fetched 66000/175177 bytes_new=1578244881 t=261s
fetched 68000/175177 bytes_new=1637039754 t=269s
fetched 70000/175177 bytes_new=1692550569 t=278s
fetched 72000/175177 bytes_new=1741962528 t=285s
fetched 74000/175177 bytes_new=1795488887 t=292s
fetched 76000/175177 bytes_new=1848018926 t=310s
fetched 78000/175177 bytes_new=1907988622 t=310s
fetched 80000/175177 bytes_new=1964987031 t=315s
fetched 82000/175177 bytes_new=2030375033 t=323s
fetched 84000/175177 bytes_new=2092518934 t=330s
fetched 86000/175177 bytes_new=2155459312 t=338s
fetched 88000/175177 bytes_new=2204603750 t=346s
fetched 90000/175177 bytes_new=2248252781 t=353s
fetched 92000/175177 bytes_new=2323284252 t=361s
fetched 94000/175177 bytes_new=2375743987 t=381s
fetched 96000/175177 bytes_new=2428195902 t=381s
fetched 98000/175177 bytes_new=2479617509 t=384s
fetched 100000/175177 bytes_new=2544047421 t=392s
fetched 102000/175177 bytes_new=2598033205 t=400s
fetched 104000/175177 bytes_new=2660590180 t=407s
fetched 106000/175177 bytes_new=2736491080 t=415s
fetched 108000/175177 bytes_new=2819309059 t=423s
fetched 110000/175177 bytes_new=2892379895 t=442s
fetched 112000/175177 bytes_new=2958820469 t=442s
fetched 114000/175177 bytes_new=3012231002 t=447s
fetched 116000/175177 bytes_new=3057149161 t=454s
fetched 118000/175177 bytes_new=3110389664 t=461s
fetched 120000/175177 bytes_new=3164017765 t=469s
fetched 122000/175177 bytes_new=3201316978 t=477s
fetched 124000/175177 bytes_new=3245839451 t=485s
fetched 126000/175177 bytes_new=3288195598 t=492s
fetched 128000/175177 bytes_new=3333197871 t=507s
fetched 130000/175177 bytes_new=3372925269 t=508s
fetched 132000/175177 bytes_new=3415468605 t=516s
fetched 134000/175177 bytes_new=3455339640 t=524s
fetched 136000/175177 bytes_new=3496247034 t=531s
fetched 138000/175177 bytes_new=3550635020 t=539s
fetched 140000/175177 bytes_new=3627433615 t=546s
fetched 142000/175177 bytes_new=3693459931 t=554s
fetched 144000/175177 bytes_new=3771619683 t=561s
fetched 146000/175177 bytes_new=3799026029 t=564s
fetched 148000/175177 bytes_new=3838210129 t=568s
fetched 150000/175177 bytes_new=3875730732 t=572s
fetched 152000/175177 bytes_new=3915303375 t=577s
fetched 154000/175177 bytes_new=3935067950 t=579s
fetched 156000/175177 bytes_new=3952065563 t=582s
fetched 158000/175177 bytes_new=3968110661 t=584s
fetched 160000/175177 bytes_new=3979832596 t=596s
fetched 162000/175177 bytes_new=4036167845 t=598s
fetched 164000/175177 bytes_new=4109411823 t=598s
fetched 166000/175177 bytes_new=4147234416 t=604s
fetched 168000/175177 bytes_new=4189384886 t=612s
fetched 170000/175177 bytes_new=4241549428 t=620s
fetched 172000/175177 bytes_new=4307654702 t=627s
fetched 174000/175177 bytes_new=4360622814 t=633s
FETCH_DONE modules=175177 new_bytes=4373456145 t=635s
GROK_EOF_46e5103971a1
mkdir -p "$D/logs"
cat > "$D/logs/tierC_print_axioms.log" <<'GROK_EOF_564581465cc8'
+ lean --tstack=400000 /workspace/lean_validation/tierC/TierC_PrintAxioms.lean  (2026-11-24T10:22:12+00:00)
Terminated
EXIT=143 elapsed=1018s
GROK_EOF_564581465cc8
mkdir -p "$D/logs"
cat > "$D/logs/tierC_squash.log" <<'GROK_EOF_e441b505ba2b'
batch 1: modules=12000 extract=14s squash=13s img_bytes=2578403328
batch 2: modules=12000 extract=10s squash=7s img_bytes=1702854656
batch 3: modules=12000 extract=9s squash=7s img_bytes=1540988928
batch 4: modules=12000 extract=9s squash=7s img_bytes=1502121984
batch 5: modules=12000 extract=12s squash=10s img_bytes=1808633856
batch 6: modules=12000 extract=11s squash=7s img_bytes=2049486848
batch 7: modules=12000 extract=12s squash=10s img_bytes=2574929920
batch 8: modules=12000 extract=11s squash=7s img_bytes=2042806272
batch 9: modules=12000 extract=14s squash=10s img_bytes=2726850560
batch 10: modules=12000 extract=11s squash=7s img_bytes=2104098816
batch 11: modules=12000 extract=8s squash=7s img_bytes=1544146944
batch 12: modules=12000 extract=12s squash=8s img_bytes=2508058624
batch 13: modules=12000 extract=11s squash=7s img_bytes=2357256192
batch 14: modules=4886 extract=5s squash=2s img_bytes=954982400
PIPELINE_DONE
GROK_EOF_e441b505ba2b
mkdir -p "$D/logs"
cat > "$D/logs/verify_rh_of_every.json" <<'GROK_EOF_d0d582b2310b'
{
  "status": "REFERENCE_CLOSURE_AND_AXIOM_AGREEMENT",
  "nodes": 54775,
  "edges": 1410678,
  "extraStructuralEdges": 63889,
  "collectorNodes": 54775,
  "missing": 0,
  "bodyMissing": 0,
  "collectorUnresolved": 0,
  "leanAxiomCount": 3,
  "collectorAxiomCount": 3,
  "absent": [],
  "unexpected": [],
  "structuralOnlyAxioms": [],
  "nonstandardAxioms": [],
  "sorryAxInBuiltin": false,
  "sorryAxInStructuralClosure": false,
  "unsafeOrPartialNodes": []
}
GROK_EOF_d0d582b2310b
mkdir -p "$D/logs"
cat > "$D/logs/verify_rh_of_right.json" <<'GROK_EOF_8df886f3c72e'
{
  "status": "REFERENCE_CLOSURE_AND_AXIOM_AGREEMENT",
  "nodes": 54444,
  "edges": 1396033,
  "extraStructuralEdges": 63463,
  "collectorNodes": 54444,
  "missing": 0,
  "bodyMissing": 0,
  "collectorUnresolved": 0,
  "leanAxiomCount": 3,
  "collectorAxiomCount": 3,
  "absent": [],
  "unexpected": [],
  "structuralOnlyAxioms": [],
  "nonstandardAxioms": [],
  "sorryAxInBuiltin": false,
  "sorryAxInStructuralClosure": false,
  "unsafeOrPartialNodes": []
}
GROK_EOF_8df886f3c72e
mkdir -p "$D/tierA"
cat > "$D/tierA/TierA_ReflectionSlice.lean" <<'GROK_EOF_3fb7aa3bc482'
import Statements
import Formalism.GammaFactorNonvanishing.RhOfRight

/-!
# Tier A slice of RH_ProofCarryingThetaV2: modulus-one specialisation + functional-equation reflection

`zetaRight` is copied verbatim from
`research_archive/2026-11-24_lean_rh_translation_swarm/integration/RH_ProofCarryingThetaV2.lean`.
`rhOfDirichletRight` is the last line of `reconstructedRH` with its arithmetic input
(`allCharactersFromRow ...`) abstracted to a hypothesis. Nothing is assumed beyond that hypothesis.
Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005 (frozen mirror 4e8bb36f, src tree 24df20b6).
-/

namespace CathedralRHTierA

open Complex DirichletCharacter  -- same `open` as the companion namespace (line 147)

theorem zetaRight (h : DirichletLNonvanishingRightOfHalf) :
    ∀ s : ℂ, 1 / 2 < s.re → s ≠ 1 → riemannZeta s ≠ 0 := by
  intro s hs hs1
  have hχ := h 1 (1 : DirichletCharacter ℂ 1) s hs (Or.inr hs1)
  rwa [LFunction_modOne_eq] at hχ

theorem rhOfDirichletRight (h : DirichletLNonvanishingRightOfHalf) : RiemannHypothesis :=
  Formalism.VW.rh_of_right (zetaRight h)

end CathedralRHTierA

#print axioms Formalism.VW.rh_of_right
#print axioms CathedralRHTierA.zetaRight
#print axioms CathedralRHTierA.rhOfDirichletRight
GROK_EOF_3fb7aa3bc482
mkdir -p "$D/tierB"
cat > "$D/tierB/TierB_EveryCharacterJunction.lean" <<'GROK_EOF_ac8992ccbd86'
import Statements
import Formalism.GammaFactorNonvanishing.CritLine

/-!
# Tier B slice: arithmetic-to-analytic junction `EveryCharacter → RiemannHypothesis`

Loads the sha256-verified published oleans of the 14,301-module import closure of
`Formalism.GammaFactorNonvanishing.CritLine` (frozen mirror 4e8bb36f, src tree 24df20b6,
upstream pin 40e56bab). `CritLine.lean` itself is separately recompiled from source by the
lane runner. The bridge `everyOfRight` shows the companion's interface
`DirichletLNonvanishingRightOfHalf` is definitionally the upstream `UpperTheory.EveryCharacter`.
-/

namespace CathedralRHTierB

theorem everyOfRight (h : DirichletLNonvanishingRightOfHalf) : UpperTheory.EveryCharacter := h
theorem rightOfEvery (h : UpperTheory.EveryCharacter) : DirichletLNonvanishingRightOfHalf := h

theorem rhOfDirichletRight_viaEvery (h : DirichletLNonvanishingRightOfHalf) : RiemannHypothesis :=
  Formalism.VW.rh_of_every (everyOfRight h)

end CathedralRHTierB

#print axioms Formalism.VW.gammaFactor_ne_zero
#print axioms Formalism.VW.critLine
#print axioms Formalism.VW.rh_of_every
#print axioms CathedralRHTierB.everyOfRight
#print axioms CathedralRHTierB.rhOfDirichletRight_viaEvery
GROK_EOF_ac8992ccbd86
mkdir -p "$D/tierC"
cat > "$D/tierC/TierC_PrintAxioms.lean" <<'GROK_EOF_4ea6565bd9e0'
import Main
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.PrimesInProgressionsRelativeError
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.MassRatioAllUnramifiedCmFields

/-! Requested by native_family_existence lane (commit 1cb49a3). Loads the full published
pinned environment (175,187 sha256-verified oleans, frozen mirror 4e8bb36f) from squashfs. -/

#check @riemannHypothesis
#print axioms riemannHypothesis
#print axioms riemannZeta_eq_zero_re
#print axioms LFunction_ne_zero_of_half_lt_re
#print axioms LFunction_eq_zero_re
#print axioms LFunction_eq_zero_re_of_isPrimitive
#check @primesRel_holds
#print axioms primesRel_holds
#check @massRatio_all_unramified_cmFields
#print axioms massRatio_all_unramified_cmFields
GROK_EOF_4ea6565bd9e0
mkdir -p "$D/tierC"
cat > "$D/tierC/run_tierC.sh" <<'GROK_EOF_5aa9573232f6'
#!/usr/bin/env bash
# usage: run_tierC.sh FILE.lean LOG ; full pinned env: kernel loop-mounted squashfs batches merged by symlink farm /workspace/rh_full_build
R=/workspace/rh_orig/.lake/packages
export LEAN_PATH=$R/Cli/.lake/build/lib/lean:$R/batteries/.lake/build/lib/lean:$R/Qq/.lake/build/lib/lean:$R/aesop/.lake/build/lib/lean:$R/proofwidgets/.lake/build/lib/lean:$R/importGraph/.lake/build/lib/lean:$R/LeanSearchClient/.lake/build/lib/lean:$R/plausible/.lake/build/lib/lean:$R/mathlib/.lake/build/lib/lean:/workspace/rh_full_build/lib/lean:$HOME/.elan/toolchains/leanprover--lean4---v4.33.1/lib/lean
export LEAN_ABORT_ON_PANIC=1
cd /workspace/rh_orig
start=$(date +%s)
echo "+ lean --tstack=400000 $1  ($(date -Is))"
nice -n 10 $HOME/.elan/toolchains/leanprover--lean4---v4.33.1/bin/lean --tstack=400000 "$1"
echo "EXIT=$? elapsed=$(( $(date +%s)-start ))s"
GROK_EOF_5aa9573232f6
chmod +x "$D/tierC/run_tierC.sh"
mkdir -p "$D/tools"
cat > "$D/tools/import_closure.py" <<'GROK_EOF_7faf80195c82'
#!/usr/bin/env python3
"""O(V+E) import closure of Lean roots over a pinned source tree + module manifest.
Usage: import_closure.py SRC_DIR MODULES_JSONL_GZ OUT_JSON ROOT_MODULE...
Modules not under SRC_DIR (Mathlib, Init, Lean, Std, Batteries, ...) are recorded as external."""
import gzip, json, re, sys, collections
from pathlib import Path
IMP = re.compile(r"^\s*(?:public\s+|private\s+)?(?:meta\s+)?import\s+(?:all\s+)?([\w'.«»]+)", re.M)
def header(text):
    # imports live in the header; stop at first line that is code (not import/module/prelude/comment/blank)
    out=[]; in_block=0
    for line in text.splitlines():
        s=line.strip()
        if in_block:
            in_block += s.count('/-') - s.count('-/')
            continue
        if not s or s.startswith('--'): continue
        if s.startswith('/-'):
            in_block = s.count('/-') - s.count('-/')
            continue
        m=IMP.match(line)
        if m: out.append(m.group(1)); continue
        if s in ('module','prelude') or s.startswith('module') : continue
        break
    return out
src=Path(sys.argv[1]); man=sys.argv[2]; outp=sys.argv[3]; roots=sys.argv[4:]
rows={}
for i,l in enumerate(gzip.open(man,'rt')):
    if i==0: continue
    r=json.loads(l); rows[r[0]]=r
seen=set(); ext=collections.Counter(); edges=0; q=collections.deque()
local_roots=[]
for r in roots:
    if r.endswith('.lean'):
        for m in header(Path(r).read_text()):
            q.append(m)
    else: q.append(r)
while q:
    m=q.popleft()
    if m in seen: continue
    seen.add(m)
    p=src/(m.replace('.','/')+'.lean')
    if not p.is_file():
        ext[m.split('.')[0]]+=1; continue
    for d in header(p.read_text(errors='replace')):
        edges+=1
        if d not in seen: q.append(d)
local=sorted(m for m in seen if (src/(m.replace('.','/')+'.lean')).is_file())
missing=[m for m in local if m not in rows]
localset=set(local)
externals=sorted(m for m in seen if m not in localset)
json.dump({'roots':roots,'local_modules':len(local),'external_modules':len(externals),
  'external_by_package_root':dict(ext),'import_edges_scanned':edges,'manifest_modules':len(rows),
  'local_not_in_manifest':missing,'local':local,'external':externals},open(outp,'w'),indent=1)
print(json.dumps({'local':len(local),'external':len(externals),'edges':edges,'ext_roots':dict(ext),'missing_from_manifest':len(missing)}))
GROK_EOF_7faf80195c82
mkdir -p "$D/tools"
cat > "$D/tools/memwatch.sh" <<'GROK_EOF_0027d0607735'
#!/usr/bin/env bash
# Protect the shared box: kill lean/lake if MemAvailable < 1.2 GB or free disk < 18 GB.
while true; do
  a=$(awk '/MemAvailable/{print $2}' /proc/meminfo); d=$(df -Pk / | awk 'NR==2{print $4}')
  echo "$(date +%T) MemAvailable_kB=$a disk_free_kB=$d mylean_rss_kB=$(ps -o rss= -p $(pgrep -f "lean --tstack=400000 /workspace/lean_validation" | head -1) 2>/dev/null)" >> /workspace/lean_validation/logs/memwatch.log
  if [ "$a" -lt 1200000 ] || [ "$d" -lt 18000000 ]; then pkill -f "lean --tstack=400000 /workspace/lean_validation"; pkill -f "lake build --no-build"; echo "$(date +%T) KILLED lean/lake: low memory or disk" >> /workspace/lean_validation/logs/memwatch.log; fi
  sleep 3
done
GROK_EOF_0027d0607735
chmod +x "$D/tools/memwatch.sh"
mkdir -p "$D/tools"
cat > "$D/tools/mount_squash_build.sh" <<'GROK_EOF_abea643a6f4c'
#!/usr/bin/env bash
# Mount all batch*.sqfs images read-only (squashfuse) and merge them with fuse-overlayfs at
# FROZEN_REPO/.lake/build (writable upper layer for Lake's .hash/lock files).
# usage: mount_squash_build.sh SQUASH_DIR FROZEN_REPO
set -euo pipefail
sq="$(cd "$1" && pwd)"; repo="$(cd "$2" && pwd)"
lowers=()
for img in "$sq"/batch*.sqfs; do
  m="${img%.sqfs}.mnt"; mkdir -p "$m"
  mountpoint -q "$m" || squashfuse "$img" "$m"
  lowers+=("$m")
done
mkdir -p "$sq/upper" "$sq/work" "$repo/.lake/build"
mountpoint -q "$repo/.lake/build" || fuse-overlayfs -o "lowerdir=$(IFS=:; echo "${lowers[*]}"),upperdir=$sq/upper,workdir=$sq/work" "$repo/.lake/build"
find "$repo/.lake/build/lib/lean" -name '*.olean' | wc -l
GROK_EOF_abea643a6f4c
chmod +x "$D/tools/mount_squash_build.sh"
mkdir -p "$D/tools"
cat > "$D/tools/selective_restore.py" <<'GROK_EOF_7b32772cb6b5'
#!/usr/bin/env python3
"""Selective, sha256-verified restore of the pinned RH cache for an import closure only.
Usage: selective_restore.py PROJECT MODULES_JSONL_GZ CLOSURE_JSON [--jobs N] [--fetch-only]
Mirrors scripts/restore-cache.py (frozen mirror 4e8bb36f) but restores only CLOSURE_JSON['local'].
Same manifest pin, same per-archive sha256 check, same stock leantar job format."""
import gzip, hashlib, json, os, subprocess, sys, time, urllib.request
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
MANIFEST_SHA256 = "292caa386a620d935cfc736b56fcceaab9fe7073086693b62e899c1ee4725f04"
ART = "https://rh-cache.taucetiproject.org/artifacts/leanprover-community/riemann-hypothesis/{}.art"
root=Path(sys.argv[1]).resolve(); man=Path(sys.argv[2]); clo=json.load(open(sys.argv[3]))
jobsn=int(sys.argv[sys.argv.index("--jobs")+1]) if "--jobs" in sys.argv else 8
raw=man.read_bytes(); assert hashlib.sha256(raw).hexdigest()==MANIFEST_SHA256, "manifest sha mismatch"
rows={}
for i,l in enumerate(gzip.decompress(raw).splitlines()):
    if i: r=json.loads(l); rows[r[0]]=r
want=[rows[m] for m in clo['local']]
cache=root/".lake/cache/artifacts"; cache.mkdir(parents=True, exist_ok=True)
def sha(p):
    with open(p,'rb') as f: return hashlib.file_digest(f,'sha256').hexdigest()
def fetch(r):
    name,dep,art,dig=r; p=cache/art
    if p.is_file() and sha(p)==dig: return 0
    for attempt in range(5):
        try:
            req=urllib.request.Request(ART.format(art[:-5]),headers={"User-Agent":"RiemannHypothesisCache/1.0"})
            data=urllib.request.urlopen(req,timeout=120).read()
            if hashlib.sha256(data).hexdigest()!=dig: raise ValueError("sha mismatch "+name)
            tmp=p.with_suffix('.part'); tmp.write_bytes(data); tmp.rename(p); return len(data)
        except Exception as e:
            err=e; time.sleep(2*(attempt+1))
    raise SystemExit(f"FAILED {name}: {err}")
t=time.time(); total=0
with ThreadPoolExecutor(48) as ex:
    for i,n in enumerate(ex.map(fetch,want)):
        total+=n
        if i%2000==0: print(f"fetched {i}/{len(want)} bytes_new={total} t={time.time()-t:.0f}s",flush=True)
print(f"FETCH_DONE modules={len(want)} new_bytes={total} t={time.time()-t:.0f}s",flush=True)
if "--fetch-only" in sys.argv: sys.exit(0)
jobs=[]
for name,dep,art,dig in want:
    mod=Path(*name.split('.'))
    assert sha(cache/art)==dig
    bases=[str(root/".lake/build/lib/lean"/mod.parent), str(root/".lake/build/ir"/mod.parent)]
    for b in bases: Path(b).mkdir(parents=True,exist_ok=True)
    jobs.append({"file":str(cache/art),"hash":dep,"base":bases})
lean=Path(subprocess.check_output(["elan","which","lean"],cwd=root,text=True).strip())
env=os.environ.copy(); env["RUST_MIN_STACK"]=str(max(int(env.get("RUST_MIN_STACK","0")),8388608))  # as restore-cache.py
subprocess.run([str(lean.with_name("leantar")),"--jobs",str(jobsn),"-f","-x","-j","-"],input=json.dumps(jobs),text=True,cwd=root,env=env,check=True)
print(f"RESTORE_DONE modules={len(jobs)} t={time.time()-t:.0f}s",flush=True)
GROK_EOF_7b32772cb6b5
mkdir -p "$D/tools"
cat > "$D/tools/squash_pipeline.py" <<'GROK_EOF_0dce4d8f2b1d'
#!/usr/bin/env python3
"""Fit the 99 GB pinned RH build into ~30 GB: extract sha256-verified archives in batches into a
staging tree with the .lake/build layout, compress each batch into a read-only zstd squashfs
image, delete the staging tree. Images are later merged by fuse-overlayfs (lowerdir=a:b:...).
Usage: squash_pipeline.py PROJECT MODULES_JSONL_GZ OUTDIR BATCH_SIZE [SKIP_LIST_JSON]"""
import gzip,hashlib,json,os,shutil,subprocess,sys,time
from pathlib import Path
root=Path(sys.argv[1]).resolve(); man=Path(sys.argv[2]); out=Path(sys.argv[3]); bs=int(sys.argv[4])
skip=set(json.load(open(sys.argv[5]))['local']) if len(sys.argv)>5 else set()
raw=man.read_bytes(); assert hashlib.sha256(raw).hexdigest()=="292caa386a620d935cfc736b56fcceaab9fe7073086693b62e899c1ee4725f04"
rows=[json.loads(l) for l in gzip.decompress(raw).splitlines()[1:]]
rows=[r for r in rows if r[0] not in skip]
cache=root/".lake/cache/artifacts"; out.mkdir(parents=True,exist_ok=True)
lean=Path(subprocess.check_output(["elan","which","lean"],cwd=root,text=True).strip())
env=os.environ.copy(); env["RUST_MIN_STACK"]="8388608"
def sha(p):
    with open(p,'rb') as f: return hashlib.file_digest(f,'sha256').hexdigest()
for bi in range(0,len(rows),bs):
    b=rows[bi:bi+bs]; n=bi//bs+1; img=out/f"batch{n:02d}.sqfs"
    if img.exists(): print("skip",img,flush=True); continue
    st=out/f"stage{n:02d}"; t=time.time(); jobs=[]
    for name,dep,art,dig in b:
        mod=Path(*name.split('.')); a=cache/art
        if sha(a)!=dig: raise SystemExit("sha mismatch "+name)
        bases=[str(st/"lib/lean"/mod.parent),str(st/"ir"/mod.parent)]
        for x in bases: Path(x).mkdir(parents=True,exist_ok=True)
        jobs.append({"file":str(a),"hash":dep,"base":bases})
    subprocess.run([str(lean.with_name("leantar")),"--jobs","6","-f","-x","-j","-"],input=json.dumps(jobs),text=True,env=env,check=True)
    t1=time.time()
    subprocess.run(["nice","-n","10","mksquashfs",str(st),str(img),"-comp","zstd","-Xcompression-level","3","-quiet","-no-progress","-noappend","-processors","6"],check=True)
    shutil.rmtree(st)
    print(f"batch {n}: modules={len(b)} extract={t1-t:.0f}s squash={time.time()-t1:.0f}s img_bytes={img.stat().st_size}",flush=True)
print("PIPELINE_DONE",flush=True)
GROK_EOF_0dce4d8f2b1d
mkdir -p "$D/tools"
cat > "$D/tools/symlink_farm.py" <<'GROK_EOF_df64b985a5a4'
#!/usr/bin/env python3
"""Merge read-only kernel-mounted squashfs batches into one LEAN_PATH root via per-file symlinks
(.olean only; Lean follows symlinks and mmaps the target). Usage: symlink_farm.py OUT MOUNT..."""
import os,sys
out=sys.argv[1]; n=0
for m in sys.argv[2:]:
    base=os.path.join(m,'lib/lean')
    for d,_,fs in os.walk(base):
        rel=os.path.relpath(d,base); od=os.path.join(out,rel); os.makedirs(od,exist_ok=True)
        for f in fs:
            if f.endswith('.olean'):
                dst=os.path.join(od,f)
                if os.path.lexists(dst): raise SystemExit('duplicate '+dst)
                os.symlink(os.path.join(d,f),dst); n+=1
print('symlinks',n)
GROK_EOF_df64b985a5a4
(cd "$D" && sha256sum -c --quiet <<'GROK_SUMS'
592e2e2dffe229d758696c7bb34f1ab4cb8e722b0d5492050f928e8635249a0c  REPRODUCE.sh
34fd2aca0195421b9ebcd471f55ce6797ee19fe557d449515a9a09c28277af51  closure_summary.json
5dedb1ab264260eda61c1cceb51946223ed7d648a58246ea20a1bf27e7744b23  kernel/KernelDepExport.lean.in
1a264ea8b7a4c153a579a5b128fc889f47e4520ec5ee50b40115525fca923fba  kernel/run_kernel_export.sh
f08afd050d2cc20ea072caf7e0301815930a32e22073ed69c099c616507fd6bc  kernel/summarize_graph.py
aea34c05049a04fde9434203fd4856ff2ca3d0da83a3e428b4134d28bf8d8f74  kernel/summary_rh_of_every.json
7d60608c5240de40d19bf8778abb1b6648054c8a27372d97a937255d0eaca777  kernel/summary_rh_of_right.json
0050bba062892b4a3cab50bd0b444d31b0f2e7bfe6977e227014b33cfce4aa35  logs/companion_script.log
56a7a0a1efadac39f8826c4116f3df05d148de794e9817b16f225cdfae72d817  logs/kernel_rh_of_every.log
a0b49c444f86684f18f9a39e45060d8e3dab2996772dcf56d45000c8acee507a  logs/kernel_rh_of_right.log
2d6bd36f1ab92179b7a546ce8af30ce91c4e857955b79939eeee183c7ad5f73d  logs/mathlib_cache_tail.log
05d03989ec91886747baf14e6393892f931c5166dd271c2b9bfefe7e00972d11  logs/olean_count.txt
5634fc163a33d4d97ba91a4b099e6beb2cc9d7a8649c278dab55e28f7183e657  logs/tierA_compile.log
c54d1f33cfed0a7b95d9e954d81faa12f7585a76e290bbbbedca933358ec04bf  logs/tierA_slice_v2.log
67b04f2fe6e47f752acce44204eaba36f04df23c2e2cc6b9defbdec1f982ab6a  logs/tierB_compile.log
c2867af5ee93babea88cc7842ace47ba302ddf364d50b6dd88e03cf5e3e5d203  logs/tierB_compile3.log
f0555295f0fb565aa0fa2999d6b12fa1c72f2d3dc3e6f8be03ff364c0bdb55cb  logs/tierB_restore.log
71dae252bcb540bee9a372ef52076db33d406691b8bf3e00c277ac3744fefb2e  logs/tierB_restore2.log
af4b09e3f63c31b26b0fb43d2a369bbe6982e99183d26b931db30437df2dbb78  logs/tierC_fetch.log
2b91c335a402425f2c21d19fa853ab200a1e8048505807020e170e1fb8b3ca0e  logs/tierC_print_axioms.log
4722960fb139762b513321e4d72dcff4cec925c0703c9e11c4665084eec253ed  logs/tierC_squash.log
c079c2fd019826141fb9bfc0ebf230b4884bbf58f8e6eaecdc1c4d6ed160387d  logs/verify_rh_of_every.json
261cc5796c3f48bbb2eeedfa11d643c526d5a3525c91ab198d1554df794d574e  logs/verify_rh_of_right.json
b9d813e817c234ced73ad97711b52a2a6161d7fb6cb6b37131005072a014fa97  tierA/TierA_ReflectionSlice.lean
29a22455815d24d2add2960ba62d6af3a57b63a9782b77aad85cffc0dcd737d9  tierB/TierB_EveryCharacterJunction.lean
7f6dee92b350df011870d6b8ee96484cbb5c68c282b8ded30e1115f93828680c  tierC/TierC_PrintAxioms.lean
3b648ad7daa8aaec547159d28dc2f3ecd6d167acdf314dddda126f014f9f55d1  tierC/run_tierC.sh
9aa7c66081ba6a42c5d894ab7e064d79510c2732d7530aaed0d778cb51c7a75e  tools/import_closure.py
cd207e4d81bc4040d3ac9dde195b21e430c7ce7d6156750feee6b74c7e72fbd5  tools/memwatch.sh
7b052a4a341026289c74795a2385e51796d8bee04749da1f41b22e4efe6424a1  tools/mount_squash_build.sh
08a4e6dbaa616524527101aec6328e8149d997315d4038f20150526ad38b9b63  tools/selective_restore.py
a46237769a7933dda821f1205368ea43c4d8c7946f2dea71c4239710195db122  tools/squash_pipeline.py
4df83f14ef0029cef9606445e610f00ca2d8c22709a14d3d44a8373d150ef835  tools/symlink_farm.py
GROK_SUMS
)
echo "extracted 33 files into $D"

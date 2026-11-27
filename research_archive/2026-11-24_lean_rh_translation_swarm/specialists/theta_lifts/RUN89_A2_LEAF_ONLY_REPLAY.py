#!/usr/bin/env python3
"""RUN89 — isolate the actual A2 freeness leaf from LongForms replay.
27 Nov 2026. SOURCE-MATCHED / PREPARED, not native replayed.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin separate.
Current mission/spine/ledger blobs:
3adc76221a978016e3505cdf3e36ad688354d7d7 /
87c621d0d18103ec2eb9be14bf774b8bff2a747d /
2c9e5148a947ff4b28482afd18c4d7c810af97d5.
Read AGENTS, SWARM, HANDOFF, EXPANSION, RUN81/82/84–88 and current
peer commits a0de93be (B3 Minkowski), a2b7ab4b (analytic replay),
796fd65b (B3 graph). Different lanes; no duplication.

Specific unresolved action: RUN88 requires New.Endgame.LongForms
even before checking the 11 actual local freeness helpers. That hides
the first potentially failing mathematical leaf behind a much larger
import closure. All 11 helpers can be checked in a separate module
using precisely the union of their original imports, removing only
the now-inlined local RUN81 import and adding Lean for the exact
original-type/axiom/direct-edge audit. This is the same proof source,
not another theorem proposal. New.Data.ChosenPlaceLevels is sufficient
for the original target's name; the original MassBasic import is
retained for finite stabilizers. Do not remove any mathematical
premise, alter the matrix identity, choose a different D, or conflate
arbitrary adele injectivity with rational point injectivity.

Original supplier (authenticated compact ChosenPlaceLevels blob):
  classAut_eq_bot_of_le_chosenLevel (hK : K <= chosenLevel)
    (h : card n <= 2 * D.n D.m) : forall g, classAut stdRatPoints K g = bot.
The RUN82 adapter has the same statement; rank guard is unused only
in the strengthened human proof. Native checks below must establish
exact universe/definitionally equal type, standard axiom subset, and
the direct adapter -> chosenLevel_free edge. Preserve all original
and reduced direct type/value edges; these are not the complete graph.
Strict constructor-inclusive transitive old-neatness absence and
actual caller integration remain outstanding. All A1–A3/B1–B4/C/D/E/V
remain open. No new proof of spanning, lift norm, star, or RH.

ACTUAL execution during this run: connector returned both exact helper
blobs and pinned original declaration; independently extracted 4+7
ordered theorem names and original import union (8 imports); 11/11
individually renamed declaration controls rejected, no helper body
placeholder found. Actual source interface anchors match. The
source-level roster check is not a Lean compilation. Local shell
command -v lean lake elan node found only node; git ls-remote failed
DNS. Native rh_scan/prune/reduce/auto/frontier not run.
Latest actual A1/A2 shared receipt still ERROR:
46023465491, status blob 07a2b14930c38095e6771ae9ed1a10a3cf1bf678.
Separate C1/C2 workflow 46055305146 has run job in_progress;
no result for this leaf. Registry has separate A1 repair graph job
rh-compact-a1-repair-graph-20261127; no RUN88-specific queued job
found. Do not duplicate a cold build or modify protected workflow.
No fresh kernel PASS and no URT advantage claimed.

RESUME HERE: run this leaf-only driver with --replay in the shared
ORIGINAL compact checkout (e.g. retained A1 repair LocalStatement
cache), BEFORE requesting LongForms. Require actual compiler exit 0,
one THETA89_LEAF_CHECKED, exact type and standard axiom guards. If
failed, repair first diagnostic before RUN88. If accepted, run RUN88
combined caller transport using the same repaired helper source and
export the strict original/reduced dependency graph. No new cold job.
HANDOFF TO kernel / acceleration / integration / audit.
"""
import argparse
import hashlib
import json
import pathlib
import re
import shutil
import subprocess

HERE = pathlib.Path(__file__).resolve().parent
PIN = "72fead102f663d5c7a407964a13dc0cf9d977207"
UPSTREAM = "grh-compact/src/New/Data/ChosenPlaceLevels.lean"
SOURCE_BLOB = "d6b4c62956e3ca1259fd69dd8c882a6fe021e7c3"
SPECS = [
    ("RUN81_COMPACT_GEOMETRIC_SUM_FREE_LEVEL.lean",
     "f34c82d30b5d3cfa3582b14f9ba50bf337ae4f40", "ThetaRun81",
     ["matrix_torsion_eq_one", "finite_group_trivial",
      "chosenLevel_free_of_prime_kill", "smallerLevel_free"]),
    ("RUN82_COMPACT_CHOSEN_LEVEL_LOCAL_BRIDGE.lean",
     "f8f7fbd14a1d8372e71e46dc5438ec886ecd9d25", "ThetaRun82",
     ["cast_prime_ne_zero_of_card_prime", "gl_map_injective",
      "chosen_component_prime_kill", "rational_eq_one_of_component",
      "chosenLevel_prime_kill", "chosenLevel_free", "chosenLevel_free_original"]),
]
IMPORTS = [
    "import New.Data.ChosenPlaceLevels",
    "import Lib.Adelic.Transference.MassBasic",
    "import Mathlib.Algebra.Ring.GeomSum",
    "import Mathlib.GroupTheory.OrderOfElement",
    "import Mathlib.LinearAlgebra.Matrix.NonsingularInverse",
    "import Mathlib.RingTheory.LocalRing.ResidueField.Basic",
    "import Mathlib.Tactic",
    "import Mathlib.FieldTheory.Finite.Basic",
]

TAIL = r"""
run_cmd do
  let old := NAMEOLD
  let fresh := NAMENEW
  let a ← Lean.getConstInfo old
  let b ← Lean.getConstInfo fresh
  unless a.levelParams == b.levelParams do
    Lean.throwError "THETA89 universe mismatch"
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq a.type b.type
  unless same do
    Lean.throwError "THETA89 full statement mismatch"
  let allowed : Array Lean.Name := #[NAMEPROP, NAMECHOICE, NAMEQUOT]
  let oa ← Lean.collectAxioms old
  let na ← Lean.collectAxioms fresh
  unless oa.all (fun n => allowed.contains n) &&
      na.all (fun n => allowed.contains n && oa.contains n) do
    Lean.throwError "THETA89 new/unexpected axiom"
  let some v := b.value? (allowOpaque := true) |
    Lean.throwError "THETA89 no adapter proof"
  unless v.getUsedConstants.contains NAMEFREE &&
      !v.getUsedConstants.contains old do
    Lean.throwError "THETA89 adapter edge mismatch"
  for n in #[old, fresh] do
    let info ← Lean.getConstInfo n
    let some val := info.value? (allowOpaque := true) |
      Lean.throwError "THETA89 missing value"
    Lean.logInfo m!"THETA89_TYPE|{n}|{(Lean.toJson (reprStr info.type)).compress}"
    Lean.logInfo m!"THETA89_LEVEL|{n}|{(Lean.toJson (reprStr info.levelParams)).compress}"
    for dep in info.type.getUsedConstants do
      Lean.logInfo m!"THETA89_EDGE|{n}|type|{dep}"
    for dep in val.getUsedConstants do
      Lean.logInfo m!"THETA89_EDGE|{n}|value|{dep}"
    Lean.logInfo m!"THETA89_AXIOMS|{n}|{← Lean.collectAxioms n}"
  Lean.logInfo "THETA89_LEAF_CHECKED"

#print axioms Data.classAut_eq_bot_of_le_chosenLevel
#print axioms ThetaRun82.chosenLevel_free_original
"""
for token, name in {
    "NAMEOLD": "Data.classAut_eq_bot_of_le_chosenLevel",
    "NAMENEW": "ThetaRun82.chosenLevel_free_original",
    "NAMEPROP": "propext", "NAMECHOICE": "Classical.choice",
    "NAMEQUOT": "Quot.sound", "NAMEFREE": "ThetaRun82.chosenLevel_free",
}.items():
    TAIL = TAIL.replace(token, chr(96) * 2 + name)

def require(ok, message):
    if not ok:
        raise RuntimeError(message)

def blob(data):
    return hashlib.sha1(f"blob {len(data)}\0".encode() + data).hexdigest()

def extract(source, namespace, names):
    start = "namespace " + namespace + "\n"
    end = "\nend " + namespace + "\n"
    require(source.count(start) == 1 and source.count(end) == 1,
            "namespace boundary")
    body = source.split(start)[1].split(end)[0]
    require(re.findall(r"^theorem ([A-Za-z0-9_]+)", body, re.M) == names,
            "declaration roster")
    require(not re.search(r"\b(?:sorry|admit)\b", body), "placeholder")
    return start + body + end

def main():
    p = argparse.ArgumentParser()
    p.add_argument("root", type=pathlib.Path)
    p.add_argument("out", type=pathlib.Path)
    p.add_argument("--replay", action="store_true")
    a = p.parse_args()
    root, out = a.root.resolve(), a.out.resolve()
    require(root != out and root not in out.parents, "external output required")
    require(not out.exists(), "preserve earlier output")
    require(subprocess.check_output(["git", "-C", str(root), "rev-parse", "HEAD"],
                                    text=True).strip() == PIN, "wrong source pin")
    upstream = (root / UPSTREAM).read_bytes()
    require(blob(upstream) == SOURCE_BLOB, "modified original source")
    signature = ("lemma classAut_eq_bot_of_le_chosenLevel (hK : K ≤ chosenLevel) "
                 "(h : Fintype.card n ≤ 2 * D.n D.m) :\n"
                 "  ∀ g, classAut stdRatPoints K g = ⊥ :=")
    require(signature in upstream.decode(), "original target changed")
    bodies, imports, negative = [], [], 0
    for filename, sha, namespace, names in SPECS:
        data = (HERE / filename).read_bytes()
        require(blob(data) == sha, "modified helper: " + filename)
        source = data.decode()
        for line in source.splitlines():
            if line.startswith("import ") and "RUN81" not in line and line not in imports:
                imports.append(line)
        bodies.append(extract(source, namespace, names))
        for name in names:
            damaged = re.sub(r"(?m)^theorem " + name + r"\b",
                             "theorem removed_" + name, source, count=1)
            require(damaged != source, "negative control construction")
            try:
                extract(damaged, namespace, names)
            except RuntimeError:
                negative += 1
            else:
                raise RuntimeError("renamed theorem accepted")
    require(imports == IMPORTS and negative == 11, "preflight mismatch")
    require("(_hn : Fintype.card n ≤ 2 * D.n D.m)" in bodies[1] and
            "∀ g, classAut stdRatPoints K g = ⊥ := chosenLevel_free hK" in bodies[1],
            "adapter statement anchor")
    header = "\n".join(imports + ["import Lean"]) + """
noncomputable section
open NumberField Matrix MonoidHom
set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true
"""
    generated = header + "\n".join(bodies) + TAIL
    require(not re.search(r"^import (?:Main|New\.Main|New\.Endgame\.)", generated, re.M),
            "unneeded root import")
    out.mkdir(parents=True)
    candidate = out / "ThetaFreenessLeafRun89.lean"
    candidate.write_text(generated)
    receipt = {"pin": PIN, "original_blob": SOURCE_BLOB,
               "helper_blobs": {s[0]: s[1] for s in SPECS},
               "generated_blob": blob(candidate.read_bytes()),
               "roster": {s[2]: s[3] for s in SPECS},
               "imports": imports, "negative_controls_rejected": negative,
               "native_verified": False, "strict_graph_verified": False,
               "full_RH_replay": False}
    path = out / "receipt.json"
    def save():
        path.write_text(json.dumps(receipt, indent=2) + "\n")
    save()
    if not a.replay:
        print("RUN89 source generation only; not a native PASS")
        return
    require(shutil.which("lake"), "lake unavailable; source receipt preserved")
    log = out / "theta89.log"
    with log.open("w") as stream:
        proc = subprocess.run(["lake", "env", "lean", "--tstack=400000", str(candidate)],
                              cwd=root / "grh-compact", stdout=stream,
                              stderr=subprocess.STDOUT)
    result = log.read_text(errors="replace")
    marker = result.count("THETA89_LEAF_CHECKED")
    receipt.update(returncode=proc.returncode, marker_count=marker,
                   log_sha256=hashlib.sha256(log.read_bytes()).hexdigest())
    receipt["native_verified"] = (proc.returncode == 0 and marker == 1 and
                                  not re.search(r"\berror(?:\([^)]*\))?:|sorryAx", result))
    save()
    require(receipt["native_verified"], "leaf replay failed: inspect first actual diagnostic")
    print("A2 leaf native guards accepted; callers, strict graph and RH remain OPEN")

if __name__ == "__main__":
    main()

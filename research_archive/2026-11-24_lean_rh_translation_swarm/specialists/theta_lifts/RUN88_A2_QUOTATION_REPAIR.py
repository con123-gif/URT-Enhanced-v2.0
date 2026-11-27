#!/usr/bin/env python3
"""RUN88 — 27 Nov 2026. A2 forward-name elaboration repair, SOURCE-MATCHED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0 /
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin separate.
Mission/spine/ledger read: 3adc76221a978016e3505cdf3e36ad688354d7d7 /
87c621d0d18103ec2eb9be14bf774b8bff2a747d /
600487957c8cff9ab77705c1441d0ef4559138ce.
Read AGENTS, swarm, handoff, expansion, RUN84–87 and peer kernel RUN60
5cb346a2880bd3c785c831103b354d7a2189d769, jet RUN84
8cb17975bfaabbbdd7982bdb6407873936b5aace. The latter two repair other leaves.

Actual new source defect: RUN84 and RUN85 use *resolved* name literals
(two backticks) for fresh declarations that are created only during the
execution of the same run_cmd. The command's entire term is elaborated
before its effects, so those names cannot resolve in the original
environment. Pinned Lean v4.35.0 src/Lean/Parser/Term.lean blob
4779992cb04db01105346e3b8eab5aed8f6ffe6d explicitly documents that a resolved
name literal fails if the constant is not existent in the current context.
The single-backtick Name literal is not a lookup. Use it for the fully
qualified fresh names; theta84Transport / theta87Transport still resolve
and validate each supplier at execution time in topological order.
This is a source-predicted failure, NOT a newly observed compiler diagnostic.
No mathematical premise, theorem statement, proof term, universe, guard,
substitution order or axioms changed. The kernel checks remain mandatory.
RUN86/87 later fresh-name references are normalized as well (not all are
forward references; doing so is safe only because names are exact full names).

Actual connector-source test this run extracted RUN84 literal tail, rebuilt
the exact RUN85 calls from its 9-row spec, and inspected RUN86/87 tails.
Counts 12,23,2,2 resolved fresh-name occurrences, 39 total across 17 names.
All existing resolved original-name references were unchanged after repair.
Reintroducing one resolved fresh reference per stage was detected (4/4).
These are source transformations, not a Lean compilation. Local node 22.16.0;
no lean/lake/elan on PATH. No native reducer execution or URT claim.

Latest checked actual shared CI run 46023465491 status blob
07a2b14930c38095e6771ae9ed1a10a3cf1bf678: ERROR. A1 log
ba683f34264daaa9c633314558cbee36916dba78: IsOpen.matrix mismatch,
CommRing Nat failure, then missing declarations. A2 receipt
566a91c8625dd1f17e13f7722b9286c0bd1b3402: original probe exit 0, splice
exit 0, rebuild exit 1. Actual A2 log 68891bf526f3fc8449e755d78e6cf543ff478f78
reports unsolved goal at ConjugatesOfJets.lean:60:5. Those are different
from the predicted quotation issue here. Reuse peer repairs, do not
duplicate a cold job. No fresh PASS receipt. Original and reduced graphs
and unresolved A1–A3/B1–B4/C/D/E/V preserved. No root closure.

RESUME HERE: from the reused ORIGINAL pinned LongForms workspace, run
  python3 RUN88_A2_QUOTATION_REPAIR.py ROOT OUT --replay
with a fresh external OUT. This invokes the existing authenticated
generators, retains the unrepaired combined candidate, repairs only the
39 fresh-name literals, and attempts one native compile. It requires the
leaf plus 16 THETA84_CHECKED, 2 THETA86_CHECKED and 5 THETA87_CHECKED.
If failed, repair the first actual diagnostic; if accepted, export the
strict constructor-inclusive original/reduced graph before removing any
dependency. No new job or protected workflow edits. HANDOFF kernel /
acceleration / integration / audit. RH/star OPEN.
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
INPUTS = {
    "RUN84_A2_MULTI_EDGE_TRANSPORT.mjs": "f1baabce0ee70e12f7bb859bece258096d4bed4c",
    "RUN85_A2_THEOREM_A_TRANSPORT.mjs": "041fd30be0458a8d34da98ee67cbcfb3754dc179",
    "RUN86_A2_FILLING_DEFINITION_TAIL.lean": "aaa0e1ff9464d80ab0d4397367279cdd12922843",
    "RUN87_A2_COMMON_POINCARE_TAIL.lean": "ba1101caf13444d28a19de3682c83e1c38a92255",
}
FRESH = re.compile(r"``(Data\.[A-Za-z0-9_.]+_run(?:84|85|86|87))\b")
RESOLVED = re.compile(r"``(Data\.[A-Za-z0-9_.]+)\b")

def require(ok, message):
    if not ok:
        raise RuntimeError(message)

def blob(data):
    return hashlib.sha1(f"blob {len(data)}\0".encode() + data).hexdigest()

def repair(source, expected):
    names = FRESH.findall(source)
    require(len(names) == expected, f"unexpected fresh-name roster {len(names)}")
    old = [n for n in RESOLVED.findall(source) if not re.search(r"_run(?:84|85|86|87)$", n)]
    revised = FRESH.sub(lambda m: "`" + m[1], source)
    require(not FRESH.search(revised), "resolved fresh name remains")
    require(RESOLVED.findall(revised) == old, "changed original name resolution")
    require(len(source) - len(revised) == expected, "unexpected edit length")
    return revised, names

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("root", type=pathlib.Path)
    ap.add_argument("out", type=pathlib.Path)
    ap.add_argument("--replay", action="store_true")
    a = ap.parse_args()
    root, out = a.root.resolve(), a.out.resolve()
    require(root != out and root not in out.parents, "external output required")
    require(subprocess.check_output(["git", "-C", str(root), "rev-parse", "HEAD"], text=True).strip() == PIN, "wrong upstream pin")
    require(not out.exists(), "preserve previous output; use new directory")
    for f, h in INPUTS.items():
        require(blob((HERE / f).read_bytes()) == h, "modified input " + f)
    out.mkdir(parents=True)
    names = list(INPUTS)
    subprocess.run(["node", str(HERE / names[0]), str(root), str(out / "run84")], check=True)
    base84 = out / "run84/ThetaTransportRun84.lean"
    subprocess.run(["node", str(HERE / names[1]), str(root), str(base84), str(out / "run85")], check=True)
    base85 = out / "run85/ThetaTransportRun85.lean"
    src84, src85 = base84.read_text(), base85.read_text()
    prefix = src84.replace("import New.Columns.ChainValuation\n", "import New.Endgame.LongForms\n", 1)
    require(src85.startswith(prefix), "unexpected RUN85 prefix")
    parts = [prefix, src85[len(prefix):], (HERE / names[2]).read_text(), (HERE / names[3]).read_text()]
    fixed, roster = [], []
    for source, count in zip(parts, [12, 23, 2, 2]):
        result, found = repair(source, count)
        # Reintroduce one resolved fresh reference and require rejection.
        bad = result.replace("`" + found[0], "``" + found[0], 1)
        require(len(FRESH.findall(bad)) == 1, "negative-control construction")
        try:
            repair(bad, 0)
        except RuntimeError:
            pass
        else:
            raise RuntimeError("negative control accepted")
        fixed.append(result)
        roster.extend(found)
    require(len(set(roster)) == 17, "unexpected distinct fresh names")
    original = out / "ThetaTransportRun88_unrepaired.lean"
    candidate = out / "ThetaTransportRun88.lean"
    original.write_text("\n\n".join(parts))
    candidate.write_text("\n\n".join(fixed))
    result = {"pin": PIN, "input_blobs": INPUTS, "unrepaired_blob": blob(original.read_bytes()),
              "generated_blob": blob(candidate.read_bytes()), "changed_names": roster,
              "negative_controls_rejected": 4, "native_verified": False,
              "full_RH_replay": False, "strict_graph_verified": False}
    receipt = out / "run88_receipt.json"
    def save():
        receipt.write_text(json.dumps(result, indent=2) + "\n")
    save()
    if not a.replay:
        print("RUN88 generation only; no native PASS")
        return
    require(shutil.which("lake"), "no native lake; preserve generation receipt")
    log = out / "theta88.log"
    with log.open("w") as stream:
        proc = subprocess.run(["lake", "env", "lean", "--tstack=400000", str(candidate)],
                              cwd=root / "grh-compact", stdout=stream, stderr=subprocess.STDOUT)
    output = log.read_text(errors="replace")
    expected = {"THETA84_LEAF_CHECKED": 1, "THETA84_CHECKED|": 16,
                "THETA86_CHECKED|": 2, "THETA87_CHECKED|": 5}
    actual = {k: output.count(k) for k in expected}
    result.update(returncode=proc.returncode, expected_markers=expected, actual_markers=actual,
                  log_sha256=hashlib.sha256(log.read_bytes()).hexdigest())
    result["native_verified"] = (proc.returncode == 0 and expected == actual
                                 and not re.search(r"\berror(?:\([^)]*\))?:|sorryAx", output))
    save()
    require(result["native_verified"], "native checks not accepted; inspect exact log")
    print("RUN88 local replacement checks accepted; strict graph and RH still OPEN")

if __name__ == "__main__":
    main()

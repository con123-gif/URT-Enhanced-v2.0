#!/usr/bin/env python3
"""RUN91 — exact GL composition at the actual A2 rational-point bridge.
27 November 2026. SOURCE-MATCHED / PREPARED; no native receipt.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin remains separate.
Current mission/spine/ledger:
3adc76221a978016e3505cdf3e36ad688354d7d7 /
40aaf0afcc897a74d688bd6e9bae708428ffdabd /
579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION and recent peer RUN64 kernel
2c047087e63550b3ab765b5e296865e17d1310a1 and RUN88 acceleration
9e12d55e9367251adfa56cfb7c5fb868d2487430. Their joint star transports
are prepared, not native accepted. No competing cold build.

Exact mathematical reduction of ThetaRun82.rational_eq_one_of_component:
for the SAME rational gamma, write f=evalAt(w) o algebraMap(E,Af).
Native Gf.atPlace (SpaceDefs blob d1a1e309a47cc3184b7a8697544f5ac4b38c50bd, 147-148)
and stdSpace_embFin (RationalPoints blob aebdd974ccdf94b1d9b9ea4ead153261ee1717cd, 190-191)
identify the local GL value with GL(evalAt(w))(GL(algebraMap)(gamma)).
The pinned Mathlib GL map_comp (blob fe21199c119675c394288c9c7f3ccb3542f8eff2, 197-199)
identifies this composite with GL(f)(gamma), exactly, not entrywise
after taking matrix values. As f is a unital field map into LocField w,
f is injective; RUN82.gl_map_injective implies gamma=1. This is the same
human argument, but the candidate uses the native GL composition
directly, avoiding the intermediate Units.ext/Matrix.map_map simp step.
No claim that arbitrary adeles are detected at one place; rationality,
same w, same D, and local integral lift remain required. No new axiom
or theorem premise. Original graph: rational bridge -> stdSpace_embFin,
Gf.atPlace, GL injectivity, matrix-map composition. Candidate: same
bridge -> same source maps and GL injectivity -> GL.map_comp.
No global removal claimed until strict constructor-inclusive replay.

Actual execution in this run: fetched authenticated RUN82, RUN90, three
pinned source blobs; checked all three exact source anchors, unique
old-body substitution and exact reverse roundtrip on real RUN82;
2/2 mutated/duplicated body controls rejected by JS source test.
Local lean/lake/elan absent, git remote DNS fails. Actual A1/A2
status 07a2b14930c38095e6771ae9ed1a10a3cf1bf678, run 46023465491
still ERROR, module_0_build exit 0 but module_0 exit 1
(targeted_results blob 01b71a484e2e8c0236ff7d429d4809a5e687fb7d).
No new native PASS. No rh_scan/prune/reduce/auto/frontier native run.
All A1-A3/B/C/D/E/V and existing graphs preserved.

Integration repair: RUN88 combined generator previously embedded the
old residue helper even if RUN90 leaf-only passed. This driver applies
the identical RUN90 and RUN91 bodies to BOTH authenticated generation
paths. It rejects any discrepancy in the two exact helper namespace
bodies before optional native replay (ignoring standalone #print axioms
and #check commands removed by RUN84; not mathematical declarations); no stale helper acceptance.
Preserves generated originals, complete compiler output, hash receipts
and markers. No modifications to checkout, registry, protected workflows.

RESUME HERE: in the shared original compact cache run
  python3 RUN91_A2_GL_COMPOSITION_REPLAY.py ROOT OUT --replay
with fresh external OUT. Inspect first actual diagnostic, if any. Only
if isolated leaf accepts does it attempt the combined caller module.
Then run existing strict constructor-inclusive dependency/axiom audit.
Do not claim full RH. HANDOFF kernel / acceleration / integration / audit.
"""
import argparse
import hashlib
import json
import pathlib
import re
import shutil
import subprocess
import sys

import RUN90_A2_RESIDUE_CARD_REUSE as residue
import RUN89_A2_LEAF_ONLY_REPLAY as leaf

HERE = pathlib.Path(__file__).resolve().parent
OLD = "  classical\n  rcases hy with ⟨γ, rfl⟩\n  have hγ : γ = 1 := by\n    apply Subtype.ext\n    apply gl_map_injective ((evalAt w).comp (algebraMap E (𝔸f E)))\n      (RingHom.injective _)\n    rw [map_one]\n    apply Units.ext\n    have hm := congrArg Units.val hw\n    simpa [Gf.atPlace, stdSpace_embFin, Matrix.map_map] using hm\n  rw [hγ, map_one]"
NEW = "  classical\n  rcases hy with ⟨γ, rfl⟩\n  let f : E →+* LocField w := (evalAt w).comp (algebraMap E (𝔸f E))\n  have hmap : Matrix.GeneralLinearGroup.map f γ.1 = 1 := by\n    change Matrix.GeneralLinearGroup.map (evalAt w) ((stdEmbFin γ).1) = 1 at hw\n    rw [stdSpace_embFin] at hw\n    change Matrix.GeneralLinearGroup.map ((evalAt w).comp (algebraMap E (𝔸f E))) γ.1 = 1\n    rw [Matrix.GeneralLinearGroup.map_comp, MonoidHom.comp_apply]\n    exact hw\n  have hγ : γ = 1 := by\n    apply Subtype.ext\n    apply gl_map_injective f (RingHom.injective f)\n    simpa only [map_one] using hmap\n  rw [hγ, map_one]"

def require(ok, reason):
    if not ok:
        raise RuntimeError(reason)

def replace_bridge(src):
    require(src.count(OLD) == 1 and NEW not in src, "rational bridge source mismatch")
    out = src.replace(OLD, NEW)
    require(out.replace(NEW, OLD) == src, "bridge reverse substitution mismatch")
    return out

def patch(src):
    return replace_bridge(residue.substitute(src))

def replay(root, path, log, markers):
    with log.open("w") as f:
        r = subprocess.run(["lake", "env", "lean", "--tstack=400000", str(path)],
                           cwd=root / "grh-compact", stdout=f, stderr=subprocess.STDOUT)
    s = log.read_text(errors="replace")
    actual = {k: s.count(k) for k in markers}
    ok = r.returncode == 0 and actual == markers and not re.search(r"\berror(?:\([^)]*\))?:|sorryAx", s)
    return {"exit": r.returncode, "markers": actual, "expected": markers,
            "log_sha256": hashlib.sha256(log.read_bytes()).hexdigest(), "verified": bool(ok)}

def main():
    p = argparse.ArgumentParser()
    p.add_argument("root", type=pathlib.Path)
    p.add_argument("out", type=pathlib.Path)
    p.add_argument("--replay", action="store_true")
    a = p.parse_args()
    root, out = a.root.resolve(), a.out.resolve()
    require(root != out and root not in out.parents and not out.exists(), "fresh external out required")
    require(leaf.blob((HERE / "RUN90_A2_RESIDUE_CARD_REUSE.py").read_bytes()) ==
            "8e1913b0c9a84380d58ad2677add22e187a2c9b3", "changed RUN90")
    out.mkdir(parents=True)
    subprocess.run([sys.executable, str(HERE / "RUN89_A2_LEAF_ONLY_REPLAY.py"),
                    str(root), str(out / "original-leaf")], check=True)
    subprocess.run([sys.executable, str(HERE / "RUN88_A2_QUOTATION_REPAIR.py"),
                    str(root), str(out / "original-callers")], check=True)
    a0 = (out / "original-leaf/ThetaFreenessLeafRun89.lean").read_text()
    b0 = (out / "original-callers/ThetaTransportRun88.lean").read_text()
    a1, b1 = patch(a0), patch(b0)
    for namespace in ("ThetaRun81", "ThetaRun82"):
        # Compare the exact source namespace, ignoring only surrounding whitespace.
        start, end = "namespace " + namespace + "\n", "\nend " + namespace
        def ns(s):
            require(s.count(start) == 1 and s.count(end) == 1, "namespace boundary")
            body = s.split(start)[1].split(end)[0]
            return "\n".join(line for line in body.split("\n")
                             if not re.match(r"^#(?:print axioms|check)\b", line)).strip()
        require(ns(a1) == ns(b1), "helper divergence " + namespace)
    negative = 0
    for bad in (a0.replace(OLD, OLD.replace("apply Units.ext", "skip")), a0 + OLD):
        try:
            replace_bridge(bad)
        except RuntimeError:
            negative += 1
        else:
            raise RuntimeError("bridge negative accepted")
    require(negative == 2, "negative count")
    x, y = out / "ThetaLeafRun91.lean", out / "ThetaCallersRun91.lean"
    x.write_text(a1); y.write_text(b1)
    result = {"pin": leaf.PIN, "helper_identity": True, "negative_rejected": negative,
              "leaf_sha256": hashlib.sha256(x.read_bytes()).hexdigest(),
              "caller_sha256": hashlib.sha256(y.read_bytes()).hexdigest(),
              "native_leaf": False, "native_callers": False,
              "strict_graph_verified": False, "full_RH_replay": False}
    def save():
        (out / "receipt.json").write_text(json.dumps(result, indent=2) + "\n")
    save()
    if not a.replay:
        print("RUN91 generation only; no native PASS")
        return
    require(shutil.which("lake"), "native lake unavailable")
    result["native_leaf"] = replay(root, x, out / "leaf.log", {"THETA89_LEAF_CHECKED": 1})
    save()
    require(result["native_leaf"]["verified"], "leaf failed; inspect leaf.log")
    result["native_callers"] = replay(root, y, out / "callers.log",
        {"THETA84_LEAF_CHECKED": 1, "THETA84_CHECKED|": 16,
         "THETA86_CHECKED|": 2, "THETA87_CHECKED|": 5})
    save()
    require(result["native_callers"]["verified"], "caller replay failed; inspect callers.log")
    print("RUN91 local checks accepted; strict graph and RH remain OPEN")

if __name__ == "__main__":
    main()

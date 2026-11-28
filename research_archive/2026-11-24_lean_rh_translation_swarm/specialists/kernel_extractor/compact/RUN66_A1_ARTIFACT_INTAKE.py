#!/usr/bin/env python3
"""RUN66 — authenticated ZIP-to-A1 native replay handoff, 28 Nov 2026.
SOURCE-MATCHED / PREPARED. Credit Alpöge, Sernau, Anthropic collaborators,
Claude. Compact 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Current mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, continuity, swarm, handoff, expansion; peer RUN92 45df1127e,
integration 1d6a303d (joint B2 star), acceleration 7ab99c38. Reuse all.

NEW ACTUAL RESULT: authenticated GitHub connector downloaded artifact
15236761794 from run 46075703055, named compute-rh-compact-a1-repair-graph-20261127,
listed unexpired, outer artifact size 313526861 bytes. Connector reported
file upload success. Subsequent container and Python access both returned
ClientError; ZIP members and inner bytes could not be inspected in this
session. Do NOT equate download with verified cache or native theorem.
The actual state-branch manifest was independently fetched and agrees
with RUN65's byte count and expected digest. No new native execution.
A1 remains rejected at the original import parser until corrected replay.

This adapter turns the actual Actions artifact ZIP into the input format
of existing RUN87/RUN65 without blindly extracting the archive or repeating
the 2614.65 s original build. Require unique sibling members, exact pinned
manifest bytes, inner archive size and SHA256, then reuse RUN87's tar
member safety/object hash audit and RUN65's fresh-workspace source/kernel
guards. Save intake.json for theta RUN92 to reuse the SAME restored cache.
Only selected members are read; no ZIP extractall. No new proof premises,
no changed proof bodies or graph guards, no global dependency deletion.
No rh_scan/prune/reduce/auto/frontier execution here; existing RUN58
executes scan/prune only after successful native leaf acceptance.

Actual JS static roster controls: 1 positive and 7 rejected (missing,
duplicate, separated siblings, incorrect size, traversal, oversized
manifest, directory); synthetic ZIP metadata, actual manifest fetched.
Python adapter prepared but not executed, because the container became
unavailable after the artifact transfer. No fixture or native PASS claim.

RESUME HERE: on the shared pinned native host obtain the same artifact
15236761794 ZIP via authorized GitHub access, and execute:
  python3 RUN66_A1_ARTIFACT_INTAKE.py --artifact-zip /path/artifact.zip \
    --compact-root /path/grh/grh-compact --out /fresh/external/run66
Inspect run66_result.json and replay/a1_transport.log; if the leaf fails,
repair the first actual Lean diagnostic, otherwise inspect RUN58 graph/prune.
Do not rebuild the original cache or register a duplicate cold-build job.
The --intake-only option validates archive bytes without making proof claims.
HANDOFF TO integration, acceleration, theta, audit. A1/star/RH OPEN.
"""
import argparse
import hashlib
import json
from pathlib import Path, PurePosixPath
import stat
import subprocess
import sys
import zipfile

HERE = Path(__file__).resolve().parent
SWARM = HERE.parents[2]
GATE = SWARM / "specialists/on_acceleration/compact/RUN87_A2_CACHE_GATE.py"
REPLAY = HERE / "RUN65_A1_HEADER_CACHE_REPLAY.py"
GATE_BLOB = "664992a17c8b5cd8e6ac63eaad48490f2c2b0dcc"
REPLAY_BLOB = "a0707b8aa7d62d2966f8b16e20ee43b53dde8c24"
MANIFEST = "native_cache_manifest.json"
MANIFEST_BLOB = "9d4dcc5b17a2168da4b3a2b25144241c1b80b74d"
ARCHIVE = "native_a1_a2_original_oleans.tar.zst"
SIZE = 314621636
DIGEST = "b6f3c3e028582c6d43f415ddfc3fa8ae1e3ba5d1d3ac529020a1606ad601ff03"

def require(ok, why):
    if not ok:
        raise RuntimeError(why)

def blob(raw):
    return hashlib.sha1(b"blob " + str(len(raw)).encode() + b"\0" + raw).hexdigest()

def members(infos):
    pair = []
    for name in (MANIFEST, ARCHIVE):
        found = [x for x in infos if x.filename.split("/")[-1] == name]
        require(len(found) == 1, "missing or duplicate member: " + name)
        x = found[0]
        pp = PurePosixPath(x.filename)
        require(not x.is_dir() and not pp.is_absolute() and
                "\\" not in x.filename and
                not any(y in ("", ".", "..") for y in x.filename.split("/")) and
                stat.S_IFMT(x.external_attr >> 16) in (0, stat.S_IFREG),
                "unsafe selected ZIP member")
        pair.append(x)
    a, b = pair
    require(PurePosixPath(a.filename).parent == PurePosixPath(b.filename).parent
            and 0 < a.file_size <= 65536 and b.file_size == SIZE,
            "wrong selected sibling pair or sizes")
    return a, b

def main():
    p = argparse.ArgumentParser()
    p.add_argument("--artifact-zip", type=Path, required=True)
    p.add_argument("--compact-root", type=Path)
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--intake-only", action="store_true")
    a = p.parse_args()
    out = a.out.resolve()
    require(not out.exists(), "fresh external output required")
    require(a.intake_only or a.compact_root, "need pinned native workspace")
    if a.compact_root:
        root = a.compact_root.resolve()
        require(root.name == "grh-compact" and out != root.parent and
                root.parent not in out.parents, "output must be external")
    out.mkdir(parents=True)
    state = {"artifact_id":15236761794, "source_run":46075703055,
             "archive_verified":False, "tar_intake_verified":False,
             "native_verified":False, "graph_and_prune_complete":False,
             "full_RH_replay":False}
    def save():
        (out / "run66_result.json").write_text(json.dumps(state, indent=2)+"\n")
    save()
    try:
        require(blob(GATE.read_bytes()) == GATE_BLOB and
                blob(REPLAY.read_bytes()) == REPLAY_BLOB, "changed input driver")
        receipt = out / "receipt"
        receipt.mkdir()
        with zipfile.ZipFile(a.artifact_zip) as z:
            manifest, archive = members(z.infolist())
            raw = z.read(manifest)
            require(blob(raw) == MANIFEST_BLOB, "manifest differs from state receipt")
            (receipt / MANIFEST).write_bytes(raw)
            h = hashlib.sha256()
            n = 0
            with z.open(archive) as src, (receipt / ARCHIVE).open("xb") as dst:
                while chunk := src.read(1024*1024):
                    n += len(chunk)
                    require(n <= SIZE, "oversized decoded archive")
                    h.update(chunk)
                    dst.write(chunk)
            require(n == SIZE and h.hexdigest() == DIGEST, "inner archive digest mismatch")
        state["archive_verified"] = True
        save()
        gate = subprocess.run([sys.executable, str(GATE), "--receipt", str(receipt)],
                              capture_output=True, text=True)
        (out / "intake_stderr.log").write_text(gate.stderr)
        (out / "intake.json").write_text(gate.stdout)
        require(gate.returncode == 0, "RUN87 tar/object audit failed")
        intake = json.loads(gate.stdout)
        require(intake["cache_intake_verified"] is True and
                intake["archive_sha256"] == DIGEST and
                intake["native_verified"] is False and
                intake["full_RH_replay"] is False, "invalid RUN87 receipt")
        state["tar_intake_verified"] = True
        save()
        if a.intake_only:
            return
        run = subprocess.run([sys.executable, str(REPLAY), "--compact-root", str(root),
                              "--receipt", str(receipt), "--out", str(out/"replay")])
        state["replay_returncode"] = run.returncode
        result = out / "replay/run65_result.json"
        if result.is_file():
            r = json.loads(result.read_text())
            state["native_verified"] = r.get("native_verified") is True
            state["graph_and_prune_complete"] = r.get("graph_and_prune_complete") is True
        require(run.returncode == 0 and state["native_verified"] and
                state["graph_and_prune_complete"], "A1 replay/audit incomplete")
    except Exception as e:
        state["error"] = str(e)
        raise
    finally:
        save()

if __name__ == "__main__":
    main()

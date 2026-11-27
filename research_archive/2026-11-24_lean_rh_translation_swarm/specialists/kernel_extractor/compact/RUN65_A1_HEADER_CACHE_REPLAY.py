#!/usr/bin/env python3
"""RUN65: repair actual RUN61 A1 parser failure, reuse original cache.
27 November 2026. PREPARED, not native verified. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, swarm, handoff, expansion and continuity; peer RUN87
8025afa5d8b70280627ca6c6a4fe1e1bdabc88ee prepares read-only A2 cache
intake, not A1 proof replay. Use existing shared host; no duplicate build.

Actual RUN61 receipt 46075703055 (2026-11-27 23:03:55 UTC):
status blob 9838f1d1c9d36c9906c2736d5d8d4f08fe98042f ERROR.
Original LocalStatement build exit 0 in 2614.65 s; four original theorem
axiom reports standard three only, log 4803a9937d7c7df141353c484390dce7a548ea68.
A1 generation exit 0; actual replacement compiler exit 1 in 0.87 s,
a1_transport.log blob 98ec276eb450c4d9c835f40673854fb5735e0248:
MarkedTransportRun57.lean:59:0: error: invalid 'import' command, it must
be used in the beginning of the file.
Transport receipt c90e9fbdbef2bd6bd6744cfdbf41d18ddbcf6aa5 has zero
accepted leaf/transport markers and empty axiom roster. No graph/prune
execution. The RUN59 leading module documentation /-! is a command,
not a neutral header comment. Make it /- instead. The only byte removed
is the exclamation mark at offset 2. No changes to imports, definitions,
proofs, premises, type equality, kernel checking, axioms or graph guards.

Actual connector preflight: fetched RUN59 and the exact failed compiler
input, both blob 0b809db534349fdf6b5d179365a6045f28d7dc7c, byte-equivalent
text; exact reverse edit recovered all 338 lines; suffix after pp.fullNames
true matched the RUN57 failed baseline bacc8d571342525149fb6eba8f062568988ce0d2.
Four malformed source controls rejected (leading marker, import sequence,
duplicate import boundary, duplicate audit boundary). These are static
checks executed in JS, not Lean checks. Local lean/lake absent. The Python
driver below was prepared, not executed in native environment.

Original cache retained by RUN61: manifest blob 9d4dcc5b17a2168da4b3a2b25144241c1b80b74d,
archive 314621636 bytes, artifact 15236761794 (listed, not downloaded here).
Use exact authenticated archive, never infer theorem validity from it.
C1 shared job 46055305146 also terminal ERROR, separate owner; leave intact.
No additional mathematical assumption; preserve A1/A2/A3/B/C/D/E/V,
earlier failure receipts and original/reduced graphs. No Main import.
No native rh_scan/prune/reduce/auto/frontier executed this run; RUN58
retains actual eight-root export and bounded scan/prune after leaf acceptance.

RESUME HERE: integration/acceleration restore artifact 15236761794 in a
fresh pinned compact workspace with the exact compiler and Mathlib cache,
then run this file with --compact-root, --receipt (artifact outputs
directory containing archive and manifest) and --out (new directory).
Inspect actual first native error or, on success, RUN58 graph/prune results.
Do not repeat the 2614.65-second original build or change old receipts.
HANDOFF TO integration, acceleration, theta, audit. A1/star/RH OPEN.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
SOURCE = "0b809db534349fdf6b5d179365a6045f28d7dc7c"
RUN61 = "96296c5599c80369487071ee10595fb064c3e4c0"
SHA256 = "b6f3c3e028582c6d43f415ddfc3fa8ae1e3ba5d1d3ac529020a1606ad601ff03"
ARCHIVE = "native_a1_a2_original_oleans.tar.zst"
SIZE = 314621636
PIN = "72fead102f663d5c7a407964a13dc0cf9d977207"
MATHLIB = "56a005855ea17e0b0958f73ec801ae140b0a1679"
RELEASE = "7289597a44543246c9227b8cae501767e095ce17f6d448b95fc4a8dc97268f6d"
SEP = b"-/\n\nimport Lean\nimport New.Columns.LocalStatement\n"
MARKER = b"set_option pp.fullNames true"

def require(ok, message):
    if not ok:
        raise RuntimeError(message)

def blob(raw):
    return hashlib.sha1(b"blob "+str(len(raw)).encode()+b"\0"+raw).hexdigest()

def repair(raw):
    require(raw.startswith(b"/-!\n") and raw.count(SEP)==1
            and raw.count(MARKER)==1, "unexpected header/audit boundary")
    fixed = raw[:2]+raw[3:]
    require(fixed[:2]+b"!"+fixed[2:]==raw and
            fixed.split(MARKER)[1]==raw.split(MARKER)[1],
            "unexpected proof or guard modification")
    return fixed

def controls(raw):
    rejected=0
    for bad in (raw[1:],raw.replace(SEP,b"-/\n\nimport Other\n"),
                raw+SEP,raw+MARKER):
        try:
            repair(bad)
        except RuntimeError:
            rejected+=1
    require(rejected==4,"source controls failed")
    return rejected

def main():
    p=argparse.ArgumentParser()
    p.add_argument("--compact-root",type=Path)
    p.add_argument("--receipt",type=Path)
    p.add_argument("--out",type=Path,required=True)
    p.add_argument("--preflight",action="store_true")
    a=p.parse_args()
    out=a.out.resolve()
    out.mkdir(parents=True,exist_ok=True)
    raw=(HERE/"RUN59_A1_ELAB_REPAIR.lean").read_bytes()
    require(blob(raw)==SOURCE,"RUN59 source changed")
    require(blob((HERE/"RUN61_A1_REPLAY.py").read_bytes())==RUN61,"RUN61 changed")
    fixed=repair(raw)
    target=out/"RUN65_A1_HEADER_REPAIR.lean"
    target.write_bytes(fixed)
    state={"source_blob":SOURCE,"candidate_blob":blob(fixed),
           "static_controls_rejected":controls(raw),"cache_verified":False,
           "native_verified":False,"graph_and_prune_complete":False,
           "full_RH_replay":False}
    def save():
        (out/"run65_result.json").write_text(json.dumps(state,indent=2)+"\n")
    save()
    if a.preflight:
        return
    try:
        require(a.compact_root and a.receipt,"need pinned native workspace and exact RUN61 artifact")
        root=a.compact_root.resolve()
        receipt=a.receipt.resolve()
        m=json.loads((receipt/"native_cache_manifest.json").read_text())
        archive=receipt/ARCHIVE
        require((m.get("compact"),m.get("mathlib"),m.get("lean_release_sha256"))
                ==(PIN,MATHLIB,RELEASE),"cache pins changed")
        require(m.get("source_build_complete") is True and
                m.get("source_is_original_before_A1_A2_overlay") is True and
                m.get("source_build_result",{}).get("returncode")==0 and
                m.get("archive_result",{}).get("returncode")==0 and
                m.get("proof_receipt") is False and m.get("full_RH_replay") is False,
                "not the original complete build cache")
        require(m.get("archive")==ARCHIVE and m.get("bytes")==SIZE
                and m.get("sha256")==SHA256 and archive.stat().st_size==SIZE,
                "unexpected cache archive")
        with archive.open("rb") as stream:
            require(hashlib.file_digest(stream,"sha256").hexdigest()==SHA256,
                    "archive digest differs from actual RUN61 receipt")
        import RUN61_A1_REPLAY as retry
        import RUN57_SHARED_MARKED_TRANSPORT as shared
        shared.check_blob(HERE/"RUN57_SHARED_MARKED_TRANSPORT.py",retry.SHARED_BLOB)
        shared.check_blob(HERE/"RUN58_A1_GRAPH_AND_PRUNE.py",retry.GRAPH_BLOB)
        native=shared.native
        env=os.environ.copy()
        env.update(LEAN_NUM_THREADS="2",LEAN_ABORT_ON_PANIC="1")
        require(native.capture(["git","rev-parse","HEAD"],root)==PIN,"wrong source pin")
        require(native.capture(["git","rev-parse","HEAD"],root/".lake/packages/mathlib")
                ==MATHLIB,"wrong Mathlib pin")
        subprocess.run(["git","diff","--exit-code",PIN,"--","src","lakefile.toml"],
                       cwd=root,check=True)
        version=subprocess.check_output(["lake","env","lean","--version"],
                                        cwd=root,env=env,text=True,timeout=60)
        require("4.35.0" in version,"wrong native toolchain")
        # Exact trusted archive digest pinned above; restore only into a
        # fresh disposable original workspace, never over an overlay.
        lib=root/".lake/build/lib/lean"
        require(not lib.exists() or not any(lib.iterdir()),
                "refusing to overwrite existing original/overlay objects")
        subprocess.run(["tar","--zstd","-xf",str(archive),"-C",str(root)],check=True)
        require((lib/"New/Columns/LocalStatement.olean").is_file(),
                "original LocalStatement object missing")
        state["cache_verified"]=True
        save()
        # Keep all RUN57 generation and guard checks; change only its
        # authenticated candidate path/blob within this process.
        shared.REPAIRED=target
        shared.REPAIRED_BLOB=blob(fixed)
        accepted=retry.replay(shared,native.step,root,env,out)
        state["combined_accepted"]=accepted
        require(accepted,"RUN65 leaf/graph audit not accepted; inspect actual logs")
    except Exception as e:
        state["error"]=str(e)
        raise
    finally:
        summary=out/"retry_summary.json"
        if summary.is_file():
            r=json.loads(summary.read_text())
            state["native_verified"]=r.get("native_verified") is True
            state["graph_and_prune_complete"]=r.get("graph_and_prune_complete") is True
        save()

if __name__=="__main__":
    main()

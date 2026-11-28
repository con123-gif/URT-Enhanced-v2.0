#!/usr/bin/env python3
"""RUN75 — queue exact RUN74 repair, 28 Nov 2026. PREPARED, not native PASS.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact 72fead102f663d5c7a407964a13dc0cf9d977207 / Lean 4.35.0 /
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Live mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION, current registry, peer RUN99
db910fac64cb821c137ac5669087004646a25173 (smaller C crude-row cap,
prepared), editor 8ca68829003007c5efeb604caa6ed37ddac12814 (mainHeight
sign candidate). Neither replaces A1.

Actual old status 646179c86d7e8ac4e7c02914db4693ff40aaee7b is terminal
ERROR, log 7eeabea8b131893ee29b5749f37e251179da01b0. Exact RUN74 source
f41c28d6e82fa8ba2aae8ca4e50f0d1ff6ddbbcf was NOT yet queued: registry
contained only the old A1 job, and terminal jobs are not retried.
This adapter reuses the actual successful RUN71 cache transport and RUN70
single-pass graph/guard pipeline with the immutable RUN74 candidate.
Do not edit or replace any old driver or receipt. RUN65 first executes
its original header repair/controls; then the exact authenticated RUN74
bytes replace the old candidate, preserving audit suffix. Both the leaf
process and separate graph process independently set the new expected
blob. The RUN65 legacy output filename is retained for compatibility;
its candidate_blob denotes RUN74, not the old failed RUN65 candidate.
No new mathematical premises, no Main import or cold build. All four
original and four replacement roots, full graph, bounded scan/prune,
original bridges and axiom guards remain required. The RUN74 proof may
still fail type inference; do not report success from wrapper status.

Actual connector checks: fetched five source blobs; compared original
and RUN74 audit suffix, import roster and leading comment, rejected
4 malformed variants (duplicate/missing marker, changed guard, Main
import); old child/graph dispatch and header repair hook present.
These are source-only tests, not an executed native proof or Python
driver. No new engine execution or axioms asserted.
RESUME HERE: inspect state branch
compute/rh-compact-a1-preimage-repair-20261128/status.json and
outputs/a1/a1_transport.log. If leaf fails, fix first actual diagnostic;
otherwise inspect a1_graph/a1_graph_result.json and guard_audit.json.
Keep old and reduced graphs, all premises and unresolved obligations.
HANDOFF integration/theta/acceleration/audit. A1/star/RH OPEN.
"""
import hashlib
import sys
from pathlib import Path

HERE=Path(__file__).resolve().parent
THIS=Path(__file__).resolve()
CANDIDATE="f41c28d6e82fa8ba2aae8ca4e50f0d1ff6ddbbcf"
OLD="29b7e1d057d721dedf6cde6a7242c2f2b2d5f598"
PINS={
    "RUN71_A1_CACHED_NATIVE_QUEUE.py":"befdf596efb250d6ba66b6962dc557d0b764148e",
    "RUN70_A1_SINGLE_PASS.py":"2babe82e5d67c8f9d0b9b5570e0c8ecfa486c272",
    "RUN65_A1_HEADER_CACHE_REPLAY.py":"a0707b8aa7d62d2966f8b16e20ee43b53dde8c24",
    "RUN74_A1_ACTUAL_PREIMAGE_REPAIR.lean":CANDIDATE,
    "RUN59_A1_ELAB_REPAIR.lean":"0b809db534349fdf6b5d179365a6045f28d7dc7c",
}
MARKER=b"set_option pp.fullNames true"
IMPORTS=b"\nimport Lean\nimport New.Columns.LocalStatement\n"

def require(ok,msg):
    if not ok: raise RuntimeError(msg)

def blob(raw):
    return hashlib.sha1(b"blob "+str(len(raw)).encode()+b"\0"+raw).hexdigest()

def validate(old,new):
    require(old.count(MARKER)==new.count(MARKER)==1 and
            old.split(MARKER,1)[1]==new.split(MARKER,1)[1],
            "changed original transport/audit suffix")
    require(new.startswith(b"/- RUN74") and new.count(IMPORTS)==1,
            "changed import roster/comment")
    require([line for line in new.splitlines() if line.startswith(b"import ")]==
            [b"import Lean",b"import New.Columns.LocalStatement"],
            "unexpected import")

def preflight():
    for f,h in PINS.items():
        require(blob((HERE/f).read_bytes())==h,"changed pinned input "+f)
    old=(HERE/"RUN59_A1_ELAB_REPAIR.lean").read_bytes()
    new=(HERE/"RUN74_A1_ACTUAL_PREIMAGE_REPAIR.lean").read_bytes()
    validate(old,new)
    variants=(new+MARKER,new.replace(MARKER,b"bad"),
        new.replace(b"A1_RUN57_LEAF_CHECKED",b"A1_RUN57_LEAF_OTHER"),
        new.replace(b"import New.Columns.LocalStatement",b"import New.Main"))
    rejected=0
    for bad in variants:
        try: validate(old,bad)
        except RuntimeError: rejected+=1
    require(rejected==4,"source controls failed")
    return new

def main():
    new=preflight()
    if sys.argv[1:]==["--preflight"]:
        print("RUN75 source controls: 4/4 rejected; native verification false")
        return
    if "--compact-root" in sys.argv or "--graph-stage" in sys.argv:
        import RUN70_A1_SINGLE_PASS as single
        import RUN65_A1_HEADER_CACHE_REPLAY as header
        require(single.CANDIDATE==OLD,"unexpected original expected blob")
        single.CANDIDATE=CANDIDATE
        single.THIS=THIS
        original=header.repair
        def repair(raw):
            fixed=original(raw)  # preserve original source guards and negative controls
            require(blob(fixed)==OLD,"original parser-repaired candidate changed")
            validate(fixed,new)
            return new
        header.repair=repair
        single.main()
        return
    import RUN71_A1_CACHED_NATIVE_QUEUE as queue
    require(queue.REPLAY==HERE/"RUN70_A1_SINGLE_PASS.py","unexpected original child")
    # Keep queue.INPUTS unchanged: still authenticates the original RUN70.
    # This adapter independently pins all five inputs in every child process.
    queue.REPLAY=THIS
    queue.main()

if __name__=="__main__":
    main()

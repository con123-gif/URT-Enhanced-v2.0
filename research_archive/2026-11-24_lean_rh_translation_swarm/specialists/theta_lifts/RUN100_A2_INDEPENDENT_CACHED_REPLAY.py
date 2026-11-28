#!/usr/bin/env python3
"""RUN100 — independently replay the two actual A2 branches in one cache.
28 November 2026. SOURCE/PREFLIGHT VERIFIED, native execution PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0 /
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7 /
1c4608f2190154fd4bc4b38fc77db10ec5e60e64 / 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read protocol, AGENTS and latest peer work. Landau RUN97 9884a76f
preserves the same Bessel witness through A2/B3; do not duplicate it.
Actual GitHub run 46112664807 (RUN98 registration 4506328b) cancelled
with no jobs; four state paths for rh-compact-a2-leaf-repair-20261128
returned 404. Current shared run 46120566249 is executing B3, not A2.
No corrected compiler output yet; do not infer PASS or another compiler
failure. Keep RUN98 registered; do not duplicate queue or edit workflows.

The native RUN97 driver aborts before RUN93 if the freeness graph fails,
even though the original freeness theorem is the only freeness dependency
of the RUN93 statement/proof. RUN99 supplies the independent four-root
constructor-inclusive graph. This wrapper reuses the exact original cache
bootstrap and RUN98 leaf repairs but executes the RUN99 graph irrespective
of the leaf exit/receipt; both native receipts must independently pass.
Failure of either branch still fails the aggregate; preserve partial
outputs, all axiom and graph guards, original objects and all premises.
No mathematical theorem changed. No use of the claimed RH theorem.
RUN99 also has a concrete over-escaped diagnostic regex: it misses actual
'error:' and 'error(kernel):' strings. Replace only that guard, not any
axiom or return-code criterion. Preflight executed in connector JS on the
actual immutable sources: two exact reversible edits, four missing or
duplicated-anchor negatives rejected, five diagnostic controls checked;
old regex missed both error fixtures, new regex detected them. These are
source-level tests, not native verification. Local lean/lake unavailable,
GitHub DNS resolution fails in local container. No new native PASS,
engine execution or quantitative estimate claimed.

RESUME HERE: once the registered RUN98 job publishes actual evidence,
inspect it first. In the same authenticated shared workspace execute
  python3 RUN100_A2_INDEPENDENT_CACHED_REPLAY.py --compact-root ROOT --intake INTAKE --out FRESH
for the corrected independent short graph (if not already accepted);
or use --out FRESH for combined cache replay only if no retained workspace.
Do not rerun an already accepted leaf or short graph. Preserve both receipts,
and only then transport accepted results to RUN95 and Landau RUN97.
HANDOFF TO kernel / integration / acceleration / audit. A2 and RH OPEN.
"""
import hashlib
from pathlib import Path
import re
import sys

HERE=Path(__file__).resolve().parent
SELF=Path(__file__).resolve()
PARENT=HERE/"RUN97_A2_CACHED_NATIVE_QUEUE.py"
REPAIR=HERE/"RUN98_A2_ACTUAL_DIAGNOSTIC_REPAIR.py"
SHORT=HERE/"RUN99_A2_SHORT_SPAN_GRAPH.py"
PINS={PARENT:"40b7afeca8fd200abf5dbd662955993f410b0fc4",REPAIR:"0e0d98309e8f99edf23103c82cadd7a578f99b2e",SHORT:"7b4acf9c3224ed2ee18438dc7c1134a75087392a"}
OLD_PARENT="            leaf_result=leaf_out/\"theta92_result.json\"\n            require(leaf_result.is_file(),\"no leaf receipt\")\n            leaf=json.loads(leaf_result.read_text())\n            state[\"native_verified\"]=leaf.get(\"native_verified\") is True\n            state[\"leaf_graph_accepted\"]=(rc==0 and leaf.get(\"graph_audited\") is True\n                and leaf.get(\"local_old_neatness_absent\") is True\n                and leaf.get(\"local_new_path_present\") is True\n                and leaf.get(\"prune_result\",{}).get(\"returncode\")==0)\n            save()\n            require(state[\"leaf_graph_accepted\"],\"RUN92 leaf/graph/prune incomplete\")\n            rc=run(\"short_span\",[\"lake\",\"env\",\"lean\",\"--tstack=400000\",SHORT],root,1800,ok=False)\n            log=(out/\"short_span.log\").read_text(errors=\"replace\")\n            state[\"short_native_verified\"]=(rc==0 and log.count(\"THETA93_SHORT_SPAN_GUARDS_OK\")==1\n                and \"sorryAx\" not in log and \"error:\" not in log)\n            save()\n            require(state[\"short_native_verified\"],\"RUN93 short span not accepted\")\n"
NEW_PARENT="            leaf_result=leaf_out/\"theta92_result.json\"\n            leaf={}\n            try:\n                leaf=json.loads(leaf_result.read_text())\n                require(isinstance(leaf,dict),\"invalid leaf receipt\")\n            except Exception as e:\n                state[\"leaf_receipt_error\"]=str(e)\n                leaf={}\n            state[\"native_verified\"]=leaf.get(\"native_verified\") is True\n            state[\"leaf_graph_accepted\"]=(rc==0 and leaf.get(\"graph_audited\") is True\n                and leaf.get(\"local_old_neatness_absent\") is True\n                and leaf.get(\"local_new_path_present\") is True\n                and leaf.get(\"prune_result\",{}).get(\"returncode\")==0)\n            save()\n            # Shortness uses the ORIGINAL freeness theorem, not the leaf candidate.\n            short_out=out/\"short99\"\n            rc_short=run(\"short_graph\",[sys.executable,SELF,\"--compact-root\",root,\n                \"--intake\",intake,\"--out\",short_out],w,6500,ok=False)\n            short={}\n            try:\n                short=json.loads((short_out/\"run99.json\").read_text())\n                require(isinstance(short,dict),\"invalid short receipt\")\n            except Exception as e:\n                state[\"short_receipt_error\"]=str(e)\n                short={}\n            state[\"short_native_verified\"]=short.get(\"native_verified\") is True\n            state[\"short_graph_accepted\"]=(rc_short==0 and\n                short.get(\"graph_audited\") is True and\n                short.get(\"original_freeness_retained_in_both_spans\") is True and\n                short.get(\"new_short_transitively_reachable\") is True and\n                short.get(\"prune_result\",{}).get(\"returncode\")==0)\n            save()\n            require(state[\"leaf_graph_accepted\"] and state[\"short_graph_accepted\"],\n                    \"one or both independent A2 scopes incomplete; inspect BOTH receipts\")\n"
OLD_REGEX="r\"\\\\berror(?:\\\\([^)]*\\\\))?:|sorryAx\""
NEW_REGEX="r\"\\berror(?:\\([^)]*\\))?:|sorryAx\""

def require(ok, msg):
    if not ok:
        raise RuntimeError(msg)

def blob(p):
    b=p.read_bytes()
    return hashlib.sha1(f"blob {len(b)}\0".encode()+b).hexdigest()

def exact(s,old,new):
    require(s.count(old)==1,"missing or duplicate patch anchor")
    t=s.replace(old,new,1)
    require(t.count(new)==1 and t.replace(new,old,1)==s,"nonreversible patch")
    return t

def main():
    for p,h in PINS.items():
        require(blob(p)==h,"changed pinned input: "+str(p))
    parent=PARENT.read_text()
    short=SHORT.read_text()
    pairs=[(parent,OLD_PARENT,NEW_PARENT),(short,OLD_REGEX,NEW_REGEX)]
    patched=[exact(*pair) for pair in pairs]
    for s,old,new in pairs:
        for damaged in (s.replace(old,"",1),s.replace(old,old+old,1)):
            try:
                exact(damaged,old,new)
            except RuntimeError:
                pass
            else:
                raise RuntimeError("negative anchor control accepted")
    cases=[("Foo.lean:3:2: error: unsolved goals",True),
           ("Foo.lean:3:2: error(kernel): invalid proof",True),
           ("warning: sorryAx",True),("THETA93_SHORT_SPAN_GUARDS_OK",False),
           ("no errors",False)]
    for s,want in cases:
        require(bool(re.search(NEW_REGEX[2:-1],s))==want,"diagnostic control failed")
    require(all(not re.search(OLD_REGEX[2:-1],s) for s,_ in cases[:2]),"old defect no longer reproduced")
    for src,path in zip(patched,(PARENT,SHORT)):
        compile(src,str(path),"exec")
    if "--self-test" in sys.argv:
        require(sys.argv[1:]==["--self-test"],"self-test takes no arguments")
        print("RUN100_PREFLIGHT_OK: 2 reversible edits; 4 negative anchors; 5 diagnostic controls")
        return
    if "--compact-root" in sys.argv:
        ns={"__file__":str(SHORT),"__name__":"theta100_short"}
        exec(compile(patched[1],str(SHORT),"exec"),ns)
        ns["main"]()
    else:
        ns={"__file__":str(PARENT),"__name__":"theta100_parent"}
        exec(compile(patched[0],str(PARENT),"exec"),ns)
        ns["LEAF"]=REPAIR
        ns["SELF"]=SELF
        ns["INPUTS"]={**ns["INPUTS"],REPAIR:PINS[REPAIR],SHORT:PINS[SHORT]}
        ns["main"]()

if __name__=="__main__":
    main()

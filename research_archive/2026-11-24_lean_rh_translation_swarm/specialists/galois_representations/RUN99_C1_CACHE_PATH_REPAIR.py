#!/usr/bin/env python3
"""RUN99: repair RUN95's actual pre-compiler invalid fresh Lean path failure.
28 Nov 2026; compact pin 72fead102f663d5c7a407964a13dc0cf9d977207.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Retain RUN93/RUN95 originals and all theorem/graph/axiom guards. No new math.
Actual receipt: run 46128377765, run95 blob 26c077b555aead9717f3d43e5f901ec6562d8f0c,
run93 blob b37513e7df77d912916cceaab479c0eefb523142, environment
3024f552b7795710f50a8f427b779d690e65ac4c. Archive verified, 13 C2 objects
and original restoration accepted, no Lean execution. Fresh Lake paths
may include absent package build directories (the receipt does not identify
which). Reuse character-boxes RUN97 normalization, with an additional
canonical and manifest-membership guard. Search order is unchanged for
every existing directory. Fail closed on absent required paths, foreign
entries, escaping symlinks or files. Native compiler and graph guards
still decide acceptance. The peer C2 path-repair job targets different roots.
Local Python filesystem tests of this adapter and the extracted exact
peer normalize_path function: 2 positive, 5 negative controls passed.
No new native execution, scan/prune/reduce/auto/frontier or graph PASS.
RESUME HERE: inspect compute/rh-compact-c1-finite-cache-path-repair-20261128/
outputs/run93/run93_receipt.json and path_repair.json; repair first diagnostic
or hand accepted finite_fused_run92 to the existing squared C consumer.
HANDOFF integration/kernel/audit/character boxes. C1 and RH OPEN.
"""
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import sys
import tempfile

HERE = Path(__file__).resolve().parent
OLD = HERE / 'RUN93_C1_FINITE_NATIVE_REPLAY.py'
BOOT = HERE / 'RUN95_C1_AUTHENTICATED_CACHE_QUEUE.py'
PEER = HERE.parent / 'character_boxes/RUN97_C2_SEARCH_PATH_REPAIR.py'
OLD_BLOB = '1a673a86f0310b7934fd5fc4afad4611b0891438'
PEER_BLOB = 'c14cecb4859b97e1397e577494827dc38aab0cce'
ANCHOR = '        need(all(Path(x).exists() for x in native_path.split(os.pathsep) if x),"invalid fresh Lean path")'
REPLACEMENT = '''        native_path, omitted = repair_path(native_path, root, bin)
        env["LEAN_PATH"] = native_path
        (out/"path_repair.json").write_text(json.dumps({"omitted_absent_package_dirs": omitted, "retained": native_path.split(os.pathsep)}, indent=2)+"\\n")'''

def require(ok, msg):
    if not ok:
        raise RuntimeError(msg)

def blob(raw):
    return hashlib.sha1(b'blob '+str(len(raw)).encode()+b'\0'+raw).hexdigest()

def repair_path(raw, root, bin):
    require(blob(PEER.read_bytes())==PEER_BLOB,'changed peer normalizer')
    spec=importlib.util.spec_from_file_location('run99_peer97',PEER)
    peer=importlib.util.module_from_spec(spec); spec.loader.exec_module(peer)
    root, bin = root.resolve(), bin.resolve()
    manifest = json.loads((root/'lake-manifest.json').read_text())
    packages = root/'.lake/packages'
    allowed = {packages/x['name']/'.lake/build/lib/lean' for x in manifest['packages']}
    required = {root/'.lake/build/lib/lean', packages/'mathlib/.lake/build/lib/lean', bin.parent/'lib/lean'}
    for entry in raw.split(os.pathsep):
        p = Path(entry)
        require(bool(entry) and p.is_absolute() and p == p.resolve(), 'noncanonical Lean path: '+entry)
        require(p in allowed or p in required, 'unexpected Lean path: '+entry)
    with tempfile.TemporaryDirectory() as tmp:
        audit=Path(tmp)/'audit.json'
        retained=peer.normalize_path(raw,root,bin.parent,audit)
        return retained,json.loads(audit.read_text())['skipped']

def self_test():
    with tempfile.TemporaryDirectory() as tmp:
        r=Path(tmp)/'root'; b=Path(tmp)/'lean/bin'; b.mkdir(parents=True)
        pk=r/'.lake/packages'; missing=pk/'Cli/.lake/build/lib/lean'
        (pk/'Cli').mkdir(parents=True)
        required=[r/'.lake/build/lib/lean',pk/'mathlib/.lake/build/lib/lean',b.parent/'lib/lean']
        for p in required: p.mkdir(parents=True)
        (r/'lake-manifest.json').write_text(json.dumps({'packages':[{'name':'Cli'},{'name':'mathlib'}]}))
        join=lambda xs:os.pathsep.join(map(str,xs))
        assert repair_path(join([missing,*required]),r,b)==(join(required),[str(missing)])
        missing.mkdir(parents=True)
        assert repair_path(join([missing,*required]),r,b)==(join([missing,*required]),[])
        missing.rmdir(); missing.touch()
        for bad in ([missing,*required],[*required,Path(tmp)/'foreign'],required[:-1],[*required,'']):
            try: repair_path(join(bad),r,b)
            except RuntimeError: pass
            else: raise AssertionError('negative control accepted')
        required[0].rmdir()
        try: repair_path(join(required),r,b)
        except RuntimeError: pass
        else: raise AssertionError('missing original path accepted')
    print('2 positive controls, 5 negative controls; filesystem only, no Lean execution')

def main():
    if sys.argv[1:]==['--self-test']:
        self_test(); return
    raw=OLD.read_bytes()
    require(blob(raw)==OLD_BLOB,'changed RUN93')
    src=raw.decode()
    require(src.count(ANCHOR)==1,'RUN93 replacement anchor not unique')
    if '--compact-root' in sys.argv:
        # Execute the same pinned driver with only the path preflight changed.
        exec(compile(src.replace(ANCHOR,REPLACEMENT),str(OLD),'exec'),{'__name__':'__main__','__file__':str(OLD),'repair_path':repair_path})
    else:
        self_test()
        spec=importlib.util.spec_from_file_location('run99_boot',BOOT)
        boot=importlib.util.module_from_spec(spec); spec.loader.exec_module(boot)
        boot.DRIVER=Path(__file__).resolve()
        # Original INPUTS roster still authenticates RUN93, peer and candidate.
        boot.main()

if __name__=='__main__': main()

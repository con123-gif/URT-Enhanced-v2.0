#!/usr/bin/env python3
"""RUN97 — actual RUN94 diagnostic repair, 28 November 2026.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
RUN94 actual run 46108846902: workflow succeeded but research status ERROR
(status blob 331a41d47b9ce746f010214e0614fee5716845c0). Outer artifact
verified, 158 members extracted, 13 retained module objects authenticated;
restore exit 0, extend_original exit 0 (8895.32 s); RUN92 then rejected
the fresh LEAN_PATH before executing a new Lean proof. Receipt blob
242c577da80d81603acfd82b541a9c5c9118f568; fresh environment
3aa4057814d02fed72de9e3bc2b3dfbd295ab802. The log lists nominal Lake
package paths but does not identify which was absent. Do not guess.
The prior universal existence guard rejects even an unused package's
uncreated build directory. Repair only this infrastructure gate: retain
all existing directories in original order, permit omission of nonexistent
optional declared package build directories with existing package roots,
reject unknown/required/relative/empty paths. Actual missing imports
remain fatal to Lean. Preflight before the expensive extension, then
recheck after. Preserve all original immutable sources and theorem/graph
guards; no new mathematical premise or proof. Local Python filesystem
tests of normalize_path: two positive, six negative cases passed.
No new Lean verification in this run. The exact earlier build did not
retain its extended objects, so this retry must reconstruct the missing
imports unless an authenticated extended archive becomes available.
Save extended original objects when disk permits before candidate replay.
RESUME HERE: read compute/rh-compact-c2-path-repair-20261128/status.json and
outputs/run92/run92_squared_star_results.json, inspect path audit and
first actual compiler diagnostic or six_root_comparison.json. Integrate
only on exact native checks. RH OPEN. HANDOFF integration/kernel/audit.
"""
import json, os, sys, shutil
from pathlib import Path

def normalize_path(raw, root, sysroot, audit):
    root, sysroot = Path(root).resolve(), Path(sysroot).resolve()
    packages = {x['name'] for x in json.loads((root/'lake-manifest.json').read_text())['packages']}
    allowed = {root/'.lake/packages'/n/'.lake/build/lib/lean': root/'.lake/packages'/n for n in packages}
    required = {root/'.lake/build/lib/lean', root/'.lake/packages/mathlib/.lake/build/lib/lean', sysroot/'lib/lean'}
    retained, skipped = [], []
    for s in raw.split(os.pathsep):
        if not s or not Path(s).is_absolute():
            raise RuntimeError('empty or relative Lean search path')
        p = Path(s)
        if p.is_dir():
            retained.append(s)
        elif p in allowed and p not in required and allowed[p].is_dir() and not p.exists():
            skipped.append(s)
        else:
            raise RuntimeError('unexpected missing Lean search path: '+s)
    if not required.issubset({Path(s) for s in retained}):
        raise RuntimeError('required Lean search roots absent')
    audit.write_text(json.dumps({'raw':raw,'retained':retained,'skipped':skipped},indent=2)+'\n')
    return os.pathsep.join(retained)

def preflight(root, env, out):
    import subprocess
    raw = subprocess.check_output(['lake','env','python3','-c',
        "import os,json; print(json.dumps([os.environ['LEAN_PATH'],os.environ['LEAN_SYSROOT']]))"],
        cwd=root, env=env, text=True, timeout=300)
    path, sysroot = json.loads(raw.strip().splitlines()[-1])
    normalize_path(path,root,sysroot,out/'pre_extension_path_audit.json')

def retain_extended(root, env, out, state, native):
    archive=out/'extended_original.tar.zst'
    if shutil.disk_usage(out).free < 6*1024**3:
        state['extended_cache']={'status':'skipped: less than 6 GiB free'}
        return
    try:
        receipt=native.step(['tar','--zstd','-cf',archive,'-C',root,'.lake/build/lib/lean'],
            root,env,out/'extended_cache.log',1200)
        if receipt['returncode'] != 0:
            archive.unlink(missing_ok=True)
            state['extended_cache']={'status':'archive failed','receipt':receipt}
            return
        import hashlib
        with archive.open('rb') as f: h=hashlib.file_digest(f,'sha256').hexdigest()
        state['extended_cache']={'status':'retained','bytes':archive.stat().st_size,
            'sha256':h,'pin':'72fead102f663d5c7a407964a13dc0cf9d977207',
            'receipt':receipt}
    except Exception as exc:
        archive.unlink(missing_ok=True)
        state['extended_cache']={'status':'archive failed','error':str(exc)}

def main():
    import RUN94_C2_AUTHENTICATED_CACHE_QUEUE as queue
    here=Path(__file__).resolve().parent
    old=here/'RUN92_C2_SQUARED_STAR_REPLAY.py'
    assert queue.blob(old)=='d4d34e0e158cff60a2a109f352920e009afd518b'
    assert queue.blob(Path(queue.__file__))=='d5dd37fab09da635ea70b34081416410119d09c8'
    if '--artifact' not in sys.argv:
        queue.DRIVER=Path(__file__).resolve()
        queue.main()
        return
    source=old.read_text()
    replacements=[
      ('        if missing:\n            need(a.extend_original,',
       '        preflight(root, env, out)\n        if missing:\n            need(a.extend_original,'),
      ('        need(all(Path(x).exists() for x in native_path.split(os.pathsep) if x),"invalid fresh Lean path")',
       '        native_path=normalize_path(native_path,root,env["LEAN_SYSROOT"],out/"fresh_path_audit.json")\n        retain_extended(root,env,out,state,native)\n        save()')]
    for a,b in replacements:
        if source.count(a)!=1: raise RuntimeError('immutable replay patch anchor mismatch')
        source=source.replace(a,b,1)
    exec(compile(source,str(old),'exec'),{'__name__':'__main__','__file__':str(old),
        'normalize_path':normalize_path,'preflight':preflight,'retain_extended':retain_extended})

if __name__=='__main__': main()

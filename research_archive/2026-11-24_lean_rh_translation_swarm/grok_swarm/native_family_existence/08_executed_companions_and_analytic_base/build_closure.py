#!/usr/bin/env python3
"""Compile the pinned upstream source modules needed by the run-5/6/7 companions (and run-8 targets)
directly with `lean`, against the Mathlib/deps oleans in /workspace/rh_green_lean/.lake/packages
(read-only; same pins as upstream lake-manifest.json). Options copied from upstream lakefile.toml."""
import os, sys, subprocess, time, concurrent.futures as cf
sys.path.insert(0, os.path.dirname(__file__)); from clos import closure, imps
SRC = '/workspace/rh_orig/src'; OUT = '/workspace/nfe8/build'
LEAN = os.path.expanduser('~/.elan/toolchains/leanprover--lean4---v4.33.1/bin/lean')
PK = '/workspace/rh_green_lean/.lake/packages'
LP = ':'.join([f'{PK}/{p}/.lake/build/lib/lean' for p in sorted(os.listdir(PK)) if os.path.isdir(f'{PK}/{p}/.lake/build/lib/lean')] + [OUT])
OPTS = ['-DautoImplicit=false', '-DrelaxedAutoImplicit=false', '-DmaxSynthPendingDepth=3', '-Dpp.unicode.fun=true', '-DmaxHeartbeats=4000000', '--tstack=400000']
roots = sys.argv[1:]
mods = {k: [x for x in v if not x.startswith('Mathlib')] for k, v in closure(list(roots)).items() if v is not None}
done, failed = set(), {}
env = dict(os.environ, LEAN_PATH=LP, OMP_NUM_THREADS='1')
def build(m):
    rel = m.replace('.', '/'); o = f'{OUT}/{rel}.olean'; os.makedirs(os.path.dirname(o), exist_ok=True)
    t = time.time()
    r = subprocess.run(['nice', LEAN, *OPTS, '-R', SRC, '-o', o, '-i', f'{OUT}/{rel}.ilean', f'{SRC}/{rel}.lean'], env=env, capture_output=True, text=True)
    return m, r.returncode, r.stdout + r.stderr, time.time() - t
print(f'# modules to build: {len(mods)}', flush=True)
with cf.ThreadPoolExecutor(3) as ex:
    pending = {}
    while len(done) + len(failed) < len(mods):
        for m, deps in mods.items():
            if m in done or m in failed or m in pending.values(): continue
            if any(d in failed for d in deps): failed[m] = 'dependency failed'; print(f'SKIP {m}: dependency failed', flush=True); continue
            if all(d in done for d in deps): pending[ex.submit(build, m)] = m
        if not pending: break
        fin, _ = cf.wait(list(pending), return_when=cf.FIRST_COMPLETED)
        for f in fin:
            m, rc, out, dt = f.result(); del pending[f]
            if rc == 0: done.add(m); print(f'ok   {m} ({dt:.0f}s)' + (f'\n{out.strip()}' if out.strip() else ''), flush=True)
            else: failed[m] = out; print(f'FAIL {m} rc={rc} ({dt:.0f}s)\n{out.strip()[:4000]}', flush=True)
print(f'# built={len(done)} failed={len(failed)}')
sys.exit(1 if failed else 0)

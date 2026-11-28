#!/usr/bin/env python3
"""RUN96 — actual cache import-frontier audit, 28 November 2026.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger read: 3adc76221a978016e3505cdf3e36ad688354d7d7 /
1c4608f2190154fd4bc4b38fc77db10ec5e60e64 /
579ecc1cafdb28eae7d1c97565700c571dfa7484. Read AGENTS, SWARM,
HANDOFF and EXPANSION. Reuse kernel RUN69 176ea09a5c2761991d0697044d5e091d16d0994f
(actual archive authentication), not a repeat of its two-object check.
Peer prime d3fcfc01, Landau a51d37f0, acceleration 0f24af4e are separate.

Actual new result: downloaded artifact 15236761794 from run 46075703055,
authenticated outer ZIP, extracted actual inner archive and streamed
all 1958 members, 371 .olean objects, decoder exit 0. The two direct
project imports of RUN89/92 (ChosenPlaceLevels, MassBasic) AND the
RUN93 direct import ChainValuation are present, with hashes below.
The eleven exact missing project objects below include the RUN94
FillingTheorem and RUN95 LongForms imports. Thus this is NOT a complete
caller workspace. It can support the first two stages once a matching
Lean/Mathlib environment is provisioned, but cannot run the joined
caller without additional original objects. This distinguishes native
replay infrastructure from missing mathematical premises.

Exact source anchors read on compact pin:
- RUN93 72aef826d8ed4ba777d272b43c470d726ae77ae8 imports
  New.Columns.ChainValuation and Lean.
- RUN94 e95b401fff71040ada447d8c821428b07c25c448 imports
  New.Filling.FillingTheorem and Lean.
- FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76
  imports Moments, UnfoldingStages, RowDimension (all absent).
- New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05
  imports CrudeRows, New.Endgame.ShortAndEnough, FitTwistsExist,
  LiftVolumeHeight (all absent).
- New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a
  imports LocalStatement (present), RowVolume and SeesawTheorem (absent).

Practical reduction: do not gate RUN92 or RUN93 on LongForms or B4.
Use RUN92's existing graph, original-statement and axiom guards first,
then RUN93 from same restored cache; postpone additional original
caller imports until needed. Shared host may reuse authenticated
C1/C2/B3 artifacts only after checking original source and package
pins, per-object identity for overlaps and actual import compatibility.
C1 artifact 15234434421 exists (900881325 bytes); not downloaded or
merged in this run, no claim it covers the missing objects.
If necessary build only missing target closure, not a fresh A1 build.
Never replace missing source by an assumed theorem.

Actual local Python execution of the body below on real ZIP and inner
archive returned exit 0, all five required hashes matched, all eleven
absences established, 1958 members, 371 objects. Source path checks
were connector reads; no Lean execution, no native rh_scan/prune/
reduce/auto/frontier, no mathematical proof or additional assumption.
Local command -v lean lake elan found none; git ls-remote failed DNS.
No global deletion. Keep original/reduced graphs and A/B/C/D/E/V open.
The shared A1 replacement run remains ERROR; this audit is not a repair
of its compiler result or a new proof of chosen-level freeness.

Reproducer: extract job/outputs/native_a1_a2_original_oleans.tar.zst
from the authenticated ZIP, then python RUN96_A2_ACTUAL_CACHE_FRONTIER.py
ZIP INNER_TAR_ZST. The body below was executed locally without docstring.

RESUME HERE: shared native host restore authenticated original cache
and matching Lean/Mathlib once, execute RUN92 isolated leaf (including
its original-statement, axiom and graph checks); do not wait for the
absent LongForms object. Repair first actual diagnostic. On success
RUN93 can use the same cache. Only then resolve RUN94/95 import frontier.
HANDOFF kernel/integration/acceleration/audit. A2/B4/star/RH OPEN.
"""
import hashlib, json, pathlib, subprocess, tarfile, zipfile, sys
PREFIX = '.lake/build/lib/lean/'
ZIP = 'db4b09f2b0bd50c3a49ff99ca915c694f372adc1b1b6424039f25eb21d179007'
TAR = 'b6f3c3e028582c6d43f415ddfc3fa8ae1e3ba5d1d3ac529020a1606ad601ff03'
PRESENT = {
 'New/Data/ChosenPlaceLevels': 'cdc9ad117ba50190e23733e5a2bf7a30901c2871521d340b1a68c46d2318b426',
 'Lib/Adelic/Transference/MassBasic': '07069be32ee5e11238d0d3cde315352ce6f489bc3ebc66eaf7548115f3247df3',
 'New/Columns/ChainValuation': '8bdd40a17014b265d8751623eadeca347bff5f42ccaaef42a0e42ab42b0720d2',
 'New/Columns/LocalStatement': '63a3b600e88b9b762b1d055267778eb9612af14cf4ded985c862a780168c12d5',
 'New/Curve/ConjugatesOfJets': 'acb50f6d2a1f8c7ed3d96b9f2c2e2d927b916de7c4b223ece0fdddbd17cbaad9',
}
ABSENT = {'New/Filling/FillingTheorem', 'New/Endgame/LongForms', 'New/Endgame/ShortAndEnough', 'New/Filling/Moments', 'New/Seesaw/UnfoldingStages', 'New/Filling/RowDimension', 'New/Exchange/CrudeRows', 'New/Selmer/FitTwistsExist', 'New/Rows/LiftVolumeHeight', 'New/Rows/RowVolume', 'New/Seesaw/SeesawTheorem'}
def require(ok, msg):
    if not ok: raise RuntimeError(msg)
def digest(p):
    with p.open('rb') as f: return hashlib.file_digest(f, 'sha256').hexdigest()
def inspect(archive):
    require(archive.stat().st_size == 314621636 and digest(archive) == TAR, 'inner cache digest')
    seen=set(); found={}; absent_found=set(); oleans=0
    with subprocess.Popen(['zstd','-dc',str(archive)],stdout=subprocess.PIPE) as p:
        with tarfile.open(fileobj=p.stdout,mode='r|') as tf:
            for m in tf:
                n=m.name.rstrip('/'); pp=pathlib.PurePosixPath(n)
                require(not pp.is_absolute() and '..' not in pp.parts and str(pp)==n and (n==PREFIX.rstrip('/') or n.startswith(PREFIX)) and n not in seen and (m.isdir() or m.isreg()), 'unsafe member '+n)
                seen.add(n)
                if not n.endswith('.olean'): continue
                require(m.isreg(), 'nonregular object')
                oleans+=1; mod=n[len(PREFIX):-6]
                if mod in ABSENT: absent_found.add(mod)
                if mod in PRESENT:
                    with tf.extractfile(m) as f: found[mod]=hashlib.file_digest(f,'sha256').hexdigest()
        while p.stdout.read(2**20): pass
        require(p.wait()==0,'decoder failure')
    require(found==PRESENT and not absent_found and len(seen)==1958 and oleans==371,'cache frontier mismatch')
    return dict(present=found,absent=sorted(ABSENT),members=len(seen),oleans=oleans,cache_frontier_verified=True,native_verified=False,full_RH_replay=False)
if __name__=='__main__':
    z,a=map(pathlib.Path,sys.argv[1:]); require(digest(z)==ZIP,'outer ZIP digest')
    with zipfile.ZipFile(z) as f:
        m=json.loads(f.read('job/outputs/native_cache_manifest.json'))
        require((m['compact'],m['mathlib'],m['sha256'])==('72fead102f663d5c7a407964a13dc0cf9d977207','56a005855ea17e0b0958f73ec801ae140b0a1679',TAR) and m['source_is_original_before_A1_A2_overlay'] is True and m['proof_receipt'] is False,'manifest mismatch')
    print(json.dumps(inspect(a),indent=2))

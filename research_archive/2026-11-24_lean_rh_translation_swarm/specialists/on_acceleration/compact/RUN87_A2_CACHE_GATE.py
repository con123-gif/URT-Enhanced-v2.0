#!/usr/bin/env python3
"""Read-only intake of RUN61's retained ORIGINAL compiled cache. No Lean proof claim."""
import argparse, hashlib, json, pathlib, subprocess, tarfile, tempfile, io
PIN='72fead102f663d5c7a407964a13dc0cf9d977207'
MATHLIB='56a005855ea17e0b0958f73ec801ae140b0a1679'
RELEASE='7289597a44543246c9227b8cae501767e095ce17f6d448b95fc4a8dc97268f6d'
ARCHIVE='native_a1_a2_original_oleans.tar.zst'
PREFIX='.lake/build/lib/lean'
OBJECTS={f'{PREFIX}/New/Curve/ConjugatesOfJets.olean',f'{PREFIX}/New/Columns/LocalStatement.olean'}

def require(ok, why):
    if not ok: raise ValueError(why)

def digest(p):
    with p.open('rb') as f: return hashlib.file_digest(f,'sha256').hexdigest()

def check_manifest(m,p):
    require((m.get('compact'),m.get('mathlib'),m.get('lean_release_sha256'))==(PIN,MATHLIB,RELEASE),'pin mismatch')
    require(m.get('source_build_complete') is True and m.get('source_is_original_before_A1_A2_overlay') is True,'not original complete build')
    require(m.get('source_build_result',{}).get('returncode')==0 and m.get('archive_result',{}).get('returncode')==0,'failed build or archive')
    require(m.get('proof_receipt') is False and m.get('full_RH_replay') is False,'cache must not claim proof')
    require(m.get('archive')==ARCHIVE and p.name==ARCHIVE,'unexpected archive name')
    require(p.is_file() and p.stat().st_size==m.get('bytes'),'archive missing or size mismatch')
    require(digest(p)==m.get('sha256'),'archive digest mismatch')

def inspect_tar(stream):
    seen=set(); found={}
    with tarfile.open(fileobj=stream,mode='r|') as tf:
        for x in tf:
            name=x.name.rstrip('/')
            pp=pathlib.PurePosixPath(name)
            require(not pp.is_absolute() and '..' not in pp.parts and str(pp)==name,'unsafe member path')
            require(name==PREFIX or name.startswith(PREFIX+'/'),'outside original object cache')
            require(name not in seen,'duplicate member'); seen.add(name)
            require(x.isdir() or x.isreg(),'nonregular cache member')
            if name in OBJECTS:
                require(x.isreg() and x.size>0,'required object is not a file')
                with tf.extractfile(x) as f: found[name]=hashlib.file_digest(f,'sha256').hexdigest()
    require(set(found)==OBJECTS,'missing required object')
    return {'member_count':len(seen),'required_object_sha256':found}

def audit(receipt):
    m=json.loads((receipt/'native_cache_manifest.json').read_text()); p=receipt/ARCHIVE
    check_manifest(m,p)
    with subprocess.Popen(['zstd','-dc','--',str(p)],stdout=subprocess.PIPE) as proc:
        try:
            result=inspect_tar(proc.stdout)
            # Drain to EOF; check decoder's actual exit, not merely tar end markers.
            while proc.stdout.read(1024*1024): pass
            require(proc.wait()==0,'zstd decode failed')
        except BaseException:
            proc.kill(); proc.wait(); raise
    return dict(result,archive_sha256=m['sha256'],cache_intake_verified=True,native_verified=False,full_RH_replay=False)

def self_test():
    with tempfile.TemporaryDirectory() as td:
        p=pathlib.Path(td)/ARCHIVE; p.write_bytes(b'cache fixture, not Lean objects')
        m=dict(compact=PIN,mathlib=MATHLIB,lean_release_sha256=RELEASE,source_build_complete=True,source_is_original_before_A1_A2_overlay=True,source_build_result={'returncode':0},archive_result={'returncode':0},proof_receipt=False,full_RH_replay=False,archive=ARCHIVE,bytes=p.stat().st_size,sha256=digest(p))
        check_manifest(m,p)
        def tar(entries):
            b=io.BytesIO()
            with tarfile.open(fileobj=b,mode='w') as tf:
                for n,kind in entries:
                    x=tarfile.TarInfo(n); x.type=kind
                    if kind==tarfile.REGTYPE: x.size=1; tf.addfile(x,io.BytesIO(b'x'))
                    else: tf.addfile(x)
            b.seek(0); return b
        good=[(n,tarfile.REGTYPE) for n in sorted(OBJECTS)]
        assert inspect_tar(tar(good))['member_count']==2
        rejected=0
        for k,v in [('compact','bad'),('mathlib','bad'),('lean_release_sha256','bad'),('source_build_complete',False),('source_is_original_before_A1_A2_overlay',False),('source_build_result',{'returncode':1}),('archive_result',{'returncode':1}),('proof_receipt',True),('full_RH_replay',True),('archive','../bad'),('bytes',0),('sha256','bad')]:
            try: check_manifest(dict(m,**{k:v}),p)
            except ValueError: rejected+=1
        for bad in [good[:1],good+[good[0]],good+[('../escape',tarfile.REGTYPE)],good+[('outside',tarfile.REGTYPE)],good+[(PREFIX+'/link',tarfile.SYMTYPE)]]:
            try: inspect_tar(tar(bad))
            except ValueError: rejected+=1
        require(rejected==17,'negative controls not all rejected')
        print(json.dumps({'positive_controls':2,'negative_controls_rejected':rejected,'fixture_only':True,'native_verified':False}))

if __name__=='__main__':
    a=argparse.ArgumentParser(); a.add_argument('--receipt',type=pathlib.Path); a.add_argument('--self-test',action='store_true'); args=a.parse_args()
    if args.self_test: self_test()
    elif args.receipt: print(json.dumps(audit(args.receipt),indent=2))
    else: a.error('provide --receipt or --self-test')

# RUN87 — 27 November 2026. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
# Mission/spine/ledger read at 3adc76221a978016e3505cdf3e36ad688354d7d7,
# 40aaf0afcc897a74d688bd6e9bae708428ffdabd, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
# Source of manifest format: RUN57_SHARED_MARKED_TRANSPORT.py blob
# 9710263e09417d5e4d1e0902f00b554d6fee7ae0, preserve_source_cache; RUN61_A1_REPLAY.py
# blob 96296c5599c80369487071ee10595fb064c3e4c0 calls this before any replacement.
# RUN85 actually requires these two named original objects. Cache intake is
# O(compressed + uncompressed bytes + member names), memory O(member names);
# no proof-search or runtime advantage claimed. No extraction or source mutation.
# The manifest is provenance from the trusted runner, not an independent proof
# of the archive's compiler origin. Mathlib objects and other dependencies still
# need the pinned native environment; this is not a complete cache closure test.
# Actual status read: earlier A1/A2 ERROR blob 07a2b14930c38095e6771ae9ed1a10a3cf1bf678,
# no native_cache_manifest.json on state branch. Registered RUN61 retry status
# and native_cache_manifest.json both returned 404 at inspection. C1 job
# 140698522135 on run 46055305146 in_progress, not A2 evidence. Peer kernel RUN62
# f26dee0f85e553f1cb6f96a3b9e0a81d0a1dfb25 already fuses A1 and theta A2 at A;
# preserve it, do not build another competing joint route. RUN85/86 unchanged.
# Actual local Python --self-test: 2 positive controls; 17/17 negative controls
# rejected. Additional end-to-end zstd fixture audit: 2 members, both SHA256
# ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad;
# cache_intake_verified=true, native_verified=false, full_RH_replay=false.
# Fixtures only, not Lean objects. Tested executable body SHA256 before this
# appended comment: ae1e0874bbb27d4c41959f31aaccdaeed6d3535a7d2523c6e55b2171cc66e97b.
# No local lean/lake available. Native A2 proof still awaits replay; all
# mathematical A/B/C and root obligations retained. No new proof claim.
# RESUME HERE: when the registered RUN61 retry publishes its original cache
# archive and manifest, run this file --receipt /path/to/retry/outputs;
# if accepted, use the authenticated shared original workspace for RUN85
# general as already requested, comparing the two object hashes to the intake.
# Do not repeat the cold build or mistake a successful intake for kernel proof.
# HANDOFF TO kernel/integration/theta/audit.

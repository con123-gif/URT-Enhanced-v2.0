#!/usr/bin/env python3
"""RUN69 — ACTUAL retained artifact authentication, 28 November 2026.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, continuity, research protocol/log, SWARM/HANDOFF/EXPANSION;
latest peers prime 557eeda77, acceleration 0f24af4e, editor e8375454,
theta 174e50d3, integration 3dab1bb4. No duplicate source proof.

NEW ACTUAL RESULT: retrieved both real GitHub artifact ZIPs into local
container through authorized connector and checked their outer SHA256.
A1 15236761794 from run 46075703055: actual 313526861-byte ZIP; exact
manifest blob 9d4dcc5b17a2168da4b3a2b25144241c1b80b74d; exact inner
314621636-byte archive SHA256 b6f3c3e028582c6d43f415ddfc3fa8ae1e3ba5d1d3ac529020a1606ad601ff03.
Streamed entire zstd/tar to EOF with decoder exit 0. 1958 members,
1855 regular files, 371 .olean files, 968260426 uncompressed file bytes.
No unsafe/duplicate/nonregular member. Required actual original objects:
New/Columns/LocalStatement.olean: 11499616 bytes, SHA256
63a3b600e88b9b762b1d055267778eb9612af14cf4ded985c862a780168c12d5.
New/Curve/ConjugatesOfJets.olean: 8598152 bytes, SHA256
acb50f6d2a1f8c7ed3d96b9f2c2e2d927b916de7c4b223ece0fdddbd17cbaad9.
This resolves RUN66 archive-byte and RUN87 intake frontier. The source
cache is ORIGINAL before A1/A2 overlays, not a proof receipt. Actual
failed candidate blob 0b809db534349fdf6b5d179365a6045f28d7dc7c and
log blob 98ec276eb450c4d9c835f40673854fb5735e0248 authenticated.
Actual one-character RUN65 header repair produced blob
29b7e1d057d721dedf6cde6a7242c2f2b2d5f598. Reverse edit exact.

Endpoint 15242835027 from run 46092027436: actual 1836881-byte ZIP.
All three prior native object digests and their exact three source blobs
match; both actual JSON receipt blobs match. Independently read all
four compiler logs: 16 DISTINCT axiom declarations (12 new, 4 originals)
with exactly propext, Classical.choice, Quot.sound. 17 reports in total:
the first audit rejected a duplicate quartic_cover report; source has
two intentional #print axioms invocations for this one theorem, and
both reports agree. Corrected audit requires exactly this multiplicity,
rejecting conflicting reports or other repeats. Actual negative log
contains NoGridPremise.lean:488:2: error: Type mismatch.
This independently authenticates previous conditional endpoint evidence,
not a new native execution. Native original-definition bridge and
constructor-inclusive graph remain outstanding, as does arithmetic star.
The accepted endpoint still requires its explicit grid hypothesis;
do not infer RH from the axiom roster. No changed mathematical premises.
Executed the following equivalent audit body locally (two complete
A1 stream reads, final exit 0); initial overly strict repeat check failed.
Original local audit script SHA256 before this explanatory docstring:
892122dee9e2e8b8e5a053d5896487761830831efc7fa40e7b61ac8d37812e3f.
No new local Lean/lake/elan executable or pinned Mathlib environment.
No native rh_scan/prune/reduce/auto/frontier execution in this run.
No global dependency deletion, all original/reduced evidence preserved.
No new job/duplicate cold source build or protected workflow modification.

RESUME HERE: authorized shared native host: obtain artifact 15236761794
with the above authenticated original hashes; run existing RUN66 (or
RUN65 against its authenticated intake) with a pinned fresh compact
workspace and the actual Lean/Mathlib environment. Inspect first actual
A1 compiler error, or after successful leaf verify RUN58 full graph and
RUN68 guarded scan/prune. Reuse the cache; do not rebuild 371 objects.
HANDOFF TO integration, acceleration, theta, audit. A1/star/RH OPEN.

Reproducer: python RUN69_ACTUAL_ARTIFACT_AUDIT.py A1.zip endpoint.zip fresh_out
"""
import hashlib,json,pathlib,subprocess,tarfile,zipfile,re,sys,stat
PIN='72fead102f663d5c7a407964a13dc0cf9d977207'
MATHLIB='56a005855ea17e0b0958f73ec801ae140b0a1679'
RELEASE='7289597a44543246c9227b8cae501767e095ce17f6d448b95fc4a8dc97268f6d'
ARCHIVE='native_a1_a2_original_oleans.tar.zst'
PREFIX='.lake/build/lib/lean'
OBJECTS={f'{PREFIX}/New/Curve/ConjugatesOfJets.olean',f'{PREFIX}/New/Columns/LocalStatement.olean'}
A1_ZIP='db4b09f2b0bd50c3a49ff99ca915c694f372adc1b1b6424039f25eb21d179007'
A1_TAR='b6f3c3e028582c6d43f415ddfc3fa8ae1e3ba5d1d3ac529020a1606ad601ff03'
END_ZIP='fc62047c5712d985355c508b41081b0052b929a6e4138bc6dba8cc40b5eaf05c'
MODULES={'Run88Endpoint.olean':'cfb59e9ec61bec0158ed1bd62c9f9bd43c6d8692eda418a685bfdd51606e86fa','Run90Adapter.olean':'bf4908300ab47303a49144cf81ff86bbda031a4e7b7774c30e220b94e60e6ed6','Run91PrincipalBridge.olean':'b116de9d8cba6a28dbe0f9fc4947e1a950697403e2cf95b8c0f4318ea4fb7ccc'}
SOURCES={'analytic/Run88Endpoint.lean':'3398702ee71980b05b67dac8747d5a2c40c6e68f','modules/Run90Adapter.lean':'cafaa2442d0889d26f4ccaefd4a2888dfe422c81','modules/Run91PrincipalBridge.lean':'d1f58ba6d8c29b70e5a07e1eb497abd830a7a29b'}
P='job/outputs/'
def require(ok,why):
    if not ok: raise ValueError(why)
def blob(raw):return hashlib.sha1(b'blob '+str(len(raw)).encode()+b'\0'+raw).hexdigest()
def digest(p):
    with p.open('rb') as f:return hashlib.file_digest(f,'sha256').hexdigest()
def byteshash(x):return hashlib.sha256(x).hexdigest()
def member(z,name):
    hits=[x for x in z.infolist() if x.filename.split('/')[-1]==name.split('/')[-1]]
    # Some endpoint objects intentionally occur twice; selected path still unique.
    hits=[x for x in hits if x.filename==name]
    require(len(hits)==1,'missing or duplicate exact ZIP member '+name)
    x=hits[0]; require(not x.is_dir() and stat.S_IFMT(x.external_attr >> 16) in (0,stat.S_IFREG),'nonregular ZIP member')
    return x

def read(z,name):return z.read(member(z,name))
def inspect_tar(stream):
    seen=set();found={};files=0;byte_count=0;oleans=0
    with tarfile.open(fileobj=stream,mode='r|') as tf:
        for x in tf:
            name=x.name.rstrip('/');pp=pathlib.PurePosixPath(name)
            require(not pp.is_absolute() and '..' not in pp.parts and str(pp)==name,'unsafe member path')
            require(name==PREFIX or name.startswith(PREFIX+'/'),'outside original object cache')
            require(name not in seen,'duplicate member');seen.add(name)
            require(x.isdir() or x.isreg(),'nonregular cache member')
            if x.isreg():
                files+=1;byte_count+=x.size;oleans+=name.endswith('.olean')
            if name in OBJECTS:
                require(x.isreg() and x.size>0,'required object is not a file')
                with tf.extractfile(x) as f:found[name]={'bytes':x.size,'sha256':hashlib.file_digest(f,'sha256').hexdigest()}
    require(set(found)==OBJECTS,'missing required object')
    return dict(member_count=len(seen),regular_files=files,uncompressed_file_bytes=byte_count,olean_files=oleans,required_objects=found)

def a1(path,out):
    require(digest(path)==A1_ZIP,'A1 outer archive digest mismatch')
    with zipfile.ZipFile(path) as z:
        raw=read(z,P+'native_cache_manifest.json');require(blob(raw)=='9d4dcc5b17a2168da4b3a2b25144241c1b80b74d','wrong manifest')
        m=json.loads(raw)
        require((m['compact'],m['mathlib'],m['lean_release_sha256'])==(PIN,MATHLIB,RELEASE),'wrong pins')
        require(m['source_build_complete'] is True and m['source_is_original_before_A1_A2_overlay'] is True and m['source_build_result']['returncode']==0 and m['archive_result']['returncode']==0 and m['proof_receipt'] is False and m['full_RH_replay'] is False,'wrong cache classification')
        require(m['archive']==ARCHIVE and m['sha256']==A1_TAR and m['bytes']==314621636,'wrong archive manifest')
        info=member(z,P+ARCHIVE);require(info.file_size==m['bytes'],'wrong ZIP member size')
        require(sum(x.filename.split('/')[-1]==ARCHIVE for x in z.infolist())==1,'ambiguous cache member')
        archive=out/ARCHIVE;h=hashlib.sha256();n=0
        with z.open(info) as src,archive.open('xb') as dst:
            while chunk:=src.read(1024*1024):
                n+=len(chunk);require(n<=m['bytes'],'oversize cache');h.update(chunk);dst.write(chunk)
        require(n==m['bytes'] and h.hexdigest()==A1_TAR,'inner archive digest mismatch')
        (out/'native_cache_manifest.json').write_bytes(raw)
        prior=read(z,P+'a1_transport.log');require(blob(prior)=='98ec276eb450c4d9c835f40673854fb5735e0248','wrong failure log')
        state=json.loads(read(z,P+'a1_transport.json'));require(state['native_verified'] is False,'incorrect original failure state')
        source=read(z,P+'MarkedTransportRun57.lean');require(blob(source)=='0b809db534349fdf6b5d179365a6045f28d7dc7c','wrong failed input')
        require(source.startswith(b'/-!\n'),'wrong header');fixed=source[:2]+source[3:];require(fixed[:2]+b'!'+fixed[2:]==source,'not reversible')
        (out/'RUN65_A1_HEADER_REPAIR.lean').write_bytes(fixed)
    with subprocess.Popen(['zstd','-dc','--',str(archive)],stdout=subprocess.PIPE) as proc:
        try:
            result=inspect_tar(proc.stdout)
            while proc.stdout.read(1024*1024):pass
            require(proc.wait()==0,'zstd decoder failure')
        except BaseException:
            proc.kill();proc.wait();raise
    return dict(result,artifact_id=15236761794,outer_sha256=A1_ZIP,archive_sha256=A1_TAR,cache_intake_verified=True,header_repair_blob=blob(fixed),previous_replacement_failed=True,native_verified=False)

def endpoint(path):
    require(digest(path)==END_ZIP,'endpoint outer ZIP digest mismatch')
    with zipfile.ZipFile(path) as z:
        raw=read(z,P+'run91_receipt.json');require(blob(raw)=='0b2bcdbd7e7988f607b8d4dbbc1c0a27ef2fb58b','wrong endpoint receipt')
        r=json.loads(raw);raw2=read(z,P+'analytic/endpoint_receipt.json');require(blob(raw2)=='ffc02c8cddf713be4b9f7ca19536c6355395c5e4','wrong analytic receipt')
        e=json.loads(raw2)
        require((r['compact'],r['mathlib'],r['release_sha256'])==(PIN,MATHLIB,RELEASE),'wrong endpoint pins')
        require(r['native_module_sha256']==MODULES and r['all_requested_checks_ok'] is True and e['all_requested_checks_ok'] is True,'wrong receipt')
        require(all(r[k] is False for k in ['original_definition_native_bridge_checked','arithmetic_premise_proved','pnt_tail_proved_here','full_RH_replay']),'wrong closure claims')
        modules={}
        for name,h in MODULES.items():
            b=read(z,P+'modules/'+name);require(byteshash(b)==h,'object digest mismatch '+name);modules[name]={'sha256':h,'bytes':len(b)}
        require(byteshash(read(z,P+'analytic/Run88Endpoint.olean'))==MODULES['Run88Endpoint.olean'],'analytic object copy differs')
        for name,h in SOURCES.items():require(blob(read(z,P+name))==h,'source blob mismatch '+name)
        expected={**e['candidate_axioms']['axioms'],**r['adapter_axioms']['axioms'],**r['bridge_axioms']['axioms'],**e['original_axioms']['axioms']}
        logs=['analytic/endpoint.log','adapter.log','principal_bridge.log','analytic/originals.log'];found={}; counts={}
        for name in logs:
            log=read(z,P+name).decode()
            for n,axs in re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]",log):
                ax=[s.strip() for s in axs.split(',') if s.strip()]
                require(n not in found or set(found[n])==set(ax),'conflicting axiom report '+n)
                found[n]=ax;counts[n]=counts.get(n,0)+1
        require(set(found)==set(expected),'wrong log axiom roster '+str(set(found)^set(expected)))
        require(all(c==(2 if n=='RHPrimeWindow87.quartic_cover' else 1) for n,c in counts.items()),'unexpected repeated axiom report')
        for n,axs in found.items():require(set(axs)==set(expected[n])=={'propext','Classical.choice','Quot.sound'},'wrong axioms '+n)
        negative=read(z,P+'analytic/negative.log').decode();require('NoGridPremise.lean:488:' in negative and 'error:' in negative,'negative diagnostic missing')
    return dict(artifact_id=15242835027,outer_sha256=END_ZIP,modules=modules,source_blobs=SOURCES,axiom_log_roots=len(found),negative_control_line=488,prior_native_receipt_verified=True,arithmetic_premise_proved=False,original_definition_native_bridge_checked=False,full_RH_replay=False)

if __name__=='__main__':
    a,b,o=map(pathlib.Path,sys.argv[1:]);o.mkdir(exist_ok=False,parents=True)
    state=dict(compact=PIN,mathlib=MATHLIB,new_Lean_execution=False,full_RH_replay=False)
    try:
        state['a1']=a1(a,o); print(json.dumps(state,indent=2),flush=True)
        state['endpoint']=endpoint(b)
    finally:(o/'run69_result.json').write_text(json.dumps(state,indent=2)+'\n')
    print(json.dumps(state,indent=2))

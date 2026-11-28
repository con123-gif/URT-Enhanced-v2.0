#!/usr/bin/env python3
"""RUN93 — 28 November 2026. Executed cache identity / import frontier audit.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission/spine/ledger: 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS, SWARM, HANDOFF, EXPANSION and continuity. Peers through
5aafbc0a (C1 finite replay), c9603590 (A1 cache audit), a51d37f0 (B3
callers), e8375454 (native remainder junction). No duplicate proof work.

The authenticated download of exact RUN92 archive 15234434421 failed:
InvalidInputException, 900881325 bytes exceeds 536870912-byte connector
limit. This is NOT a Lean diagnostic or a credential failure. Instead
successfully downloaded earlier accepted determinant artifact 15227055296
(run 46050109450, 256853125 bytes) and locally ran the code below.
Outer and inner archives rehashed, seven source blobs and seven objects
matched their OWN receipts; 1389 tar members and 264 original .oleans.
Four of seven objects are byte-identical to later RUN89 expected objects;
three are NOT (C2Combined, C2DeterminantExchange, C2DeterminantClassSum).
This is a concrete negative control against cache substitution by source
hash alone. It does not establish semantic incompatibility: it establishes
failure of the exact RUN92 provenance guard. Never splice the old objects
into the later authenticated family merely because source pins agree.
The earlier run's four-root graph receipt has 119299 nodes, 3865789 edges,
zero missing and all supplier guards; receipt re-read, graph not rerun.

The nine missing project objects below include LongForms, both native
height suppliers' direct import closure and FitTwistsExist; only Carrier
and CommonEigenvectors are present among the inspected needed objects.
LongForms source blob 9eff36cf003ac398fbd24361e80e95a03d0b0e05:
imports CrudeRows, ShortAndEnough, FitTwistsExist, LiftVolumeHeight.
Height definitions blob a18a99e1f76a6e963113cae8f906ddc99814f518.
The existing cancellation uses the SAME D, independent y, n, index and
all-conjugate V and one fit family: square first signed height and multiply
second, r^2 r^-2=1. No mathematical premise is changed. The smaller ZIP
does not suffice for the actual C caller or the star. Its old proof and
graph remain accepted within their original scope. No native Lean/lake
available locally. No new rh_scan/prune/reduce/auto/frontier, graph, axiom
or theorem execution; no root discharged. Actual local Python execution
exit 0 with the exact outputs described here. No new compute job launched,
no protected workflow touched; current prime and B3 jobs remain intact.

RESUME HERE: use an authorized shared native host to retrieve the EXACT
15234434421 archive outside the connector's size cap, verify its outer
SHA256 45b0ae825e3f7c58ee5f78e9178e60d906e20294afff1c6fc04650e5af47cd33,
then execute RUN92_C2_SQUARED_STAR_REPLAY.py in that pinned environment
with --extend-original. Do not substitute 15227055296 or repeat the
accepted determinant build. Inspect the first actual Lean diagnostic or
six-root comparison. HANDOFF integration/kernel/audit. RH remains OPEN.
"""
import hashlib, json, pathlib, subprocess, sys, tarfile, tempfile, zipfile
ZIP = 'c1e0df736fa15116aeb04b7d1a5fed198be941a1f88d2419c934230ef58e1bc8'
TAR = '118cbd6ceac9e4d855a7b20c7378912db38621333e61e84898b2622d37fdbed9'
PIN = '72fead102f663d5c7a407964a13dc0cf9d977207'
MATHLIB = '56a005855ea17e0b0958f73ec801ae140b0a1679'
P = 'job/outputs/'
ORIGINAL = '.lake/build/lib/lean/'
# Objects required by the later RUN89/RUN92 retained-fit manifest.
LATER = dict(C2Combined='4ef847efc76e509f2e1f581b38a73cc76e8c31085a031eabf68d97b09ad6c46a', C2StandardExchange='9f4256154fcef86ce5f586bcfe41b6c23a1ea741f1d75d321062beb7a82108a8', C2DeterminantLift='c01028a6552e518437792dd9b0a6b2778d9cba80bceca79745093f110b2bdd1d', C2DeterminantExchange='d81b5d903e8894c3d357e538efe0b510f5a45d0898e4be698b70bd045655f28a', C2RealMatchingStandard='9876af8036a8b57c3c059e9132b741a5034ebf73bda85def79a66e6886dc77af', C2DeterminantClassSum='15b315021a15c21c085511f70e95da388b1212219a27eac965a99e841770f53c', C2DeterminantCarrierTransport='57f51647df44c31eebb6e9e04a1264e1eeceba15c556657db6e13210b753bf01')
ABSENT = {'New/Endgame/LongForms','New/Endgame/ShortAndEnough','New/Exchange/CrudeRows','New/Selmer/FitTwistsExist','New/Selmer/ValueFamilies','New/Rows/LiftVolumeHeight','New/Heights/Heights','New/Data/DataExist','Statements'}
def sha(b): return hashlib.sha256(b).hexdigest()
def blob(b): return hashlib.sha1(b'blob '+str(len(b)).encode()+b'\0'+b).hexdigest()
def fsha(p):
    with open(p,'rb') as f: return hashlib.file_digest(f,'sha256').hexdigest()
def need(ok,msg):
    if not ok: raise RuntimeError(msg)
def audit(path):
    need(fsha(path)==ZIP,'outer ZIP identity')
    actual={}
    with zipfile.ZipFile(path) as z, tempfile.TemporaryDirectory() as tmp:
        d=json.loads(z.read(P+'determinant_shared_results.json'))
        need((d['compact'],d['mathlib'])==(PIN,MATHLIB),'source pins')
        need(d['all_requested_checks_ok'] and not d['full_RH_replay'],'receipt scope')
        all_receipts=[(d['base_receipt'],d['base_source_blob'],'base')]+[(r,r['source_blob'],r['compiled_module']['name']) for r in d['checked_interfaces']]
        for receipt,source,folder in all_receipts:
            m=receipt['compiled_module']['name']; rec=receipt['compiled_module']['artifacts'][0]
            raw=z.read(P+folder+'/'+m+'.olean'); s=z.read(P+folder+'/'+m+'.lean')
            need(blob(s)==source,'source '+m)
            need(len(raw)==rec['bytes'] and sha(raw)==rec['sha256'],'object '+m)
            actual[m]={'bytes':len(raw),'sha256':sha(raw),'later_identical':sha(raw)==LATER[m]}
        need(set(actual)==set(LATER),'module roster')
        need({m for m,v in actual.items() if not v['later_identical']}=={'C2Combined','C2DeterminantExchange','C2DeterminantClassSum'},'unexpected cross-build identity')
        tar=pathlib.Path(tmp)/'objects.tar.zst'
        with z.open(P+'native_c2_oleans.tar.zst') as f,tar.open('wb') as g:
            while b:=f.read(1024*1024): g.write(b)
        need(fsha(tar)==TAR,'inner TAR identity')
        proc=subprocess.Popen(['zstd','-dc',str(tar)],stdout=subprocess.PIPE)
        members=0; modules=set()
        with tarfile.open(fileobj=proc.stdout,mode='r|') as tf:
            for member in tf:
                members+=1; n=member.name
                if n.startswith(ORIGINAL) and n.endswith('.olean') and member.isfile(): modules.add(n[len(ORIGINAL):-6])
        proc.stdout.close();need(proc.wait()==0,'decoder failed')
        need((members,len(modules))==(1389,264),'archive roster')
        need(ABSENT.isdisjoint(modules),'unexpected present original')
        need({'New/Rows/Carrier','Lib/General/LinearAlgebra/CommonEigenvectors'}<=modules,'expected present original')
        g=d['graph_receipt'];need(g['nodes']==119299 and g['missing']==0 and g['all_supplier_guards_pass'],'retained graph receipt')
    return {'modules':actual,'original_members':members,'original_oleans':len(modules),'missing_original':sorted(ABSENT),'new_Lean_execution':False,'full_RH_replay':False,'old_graph_receipt_rechecked':True}
if __name__=='__main__': print(json.dumps(audit(sys.argv[1]),indent=2,sort_keys=True))

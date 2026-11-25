#!/usr/bin/env python3
"""Pinned manifest-only cache; no inference of outgoing elaborated edges."""
import hashlib,json,math,resource,statistics,subprocess,sys,time,os
from pathlib import Path
from collections import defaultdict
PIN='40e56bab026552e089d7afcfeff08d2defb9c005'
SHA='45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf'
TSV='9b98ff91a61fdbf09266761e21f80460e8b85ec7f977d8504618208afffed28e'
IDS=list(map(int,'''13126693 13126695 13126715 13129109 13129136 13137883 13138225 13140145 13140217 13140390 13172280 13172281 13175057 13172633 11303668 11305707 11306734 11306962 2374959 2374960 2840536 4880927 6231278 13126073 13126088 14009155 1550567 8259763 8260224 8260425 8285241 8285321 8285437 8286881 8286969 8287152 8287984 8295351 8303595 8305730 10486446 10489865 10523387 11496046 13126098 13126140 13126145 13126155 12421135 13126071 13126072 13126154 13181969 13182142 13183137 13184847 13190267 13190325 13205040 13205057 13205875 13208116 13208127 13208146 13208157 13208158 13208159 13208160 13208174 13208175 13208182 13208189 13208196 13208204 13208205 13208214 13208215 13208258 13208599 13209428 13209572 13209681 13209774 13212047 13212158 13212435 13212561 13212599 13212621 13219498 13219499 13219621 13219684 13219820 13219845 13219994 13220102 13220353 13220363 13220639 13173638 13056733 13056965 13173398 13056908 13173967'''.split()))
GROUPS=[IDS,IDS[-6:],['exists_equiv_of_trace_eq','jacobson_density'],['sphere_height_lower_bound','heightLowerBound_of_sj_of_sphereLogIntegrable','gauss_height_additivity'],['crystallineDeRham','rigid_of_free_of_crystallineDeRham']]
KEYS=list(dict.fromkeys(k for group in GROUPS for k in group))
def ck(ok,msg):
    if not ok: raise ValueError(msg)
def enc(x):return json.dumps(x,ensure_ascii=False,sort_keys=True,separators=(',',':')).encode()
def h(b):return hashlib.sha256(b).hexdigest()
def filehash(p):
    with open(p,'rb') as f:return hashlib.file_digest(f,'sha256').hexdigest()
def scan(p,keys):
    ck(filehash(p)==SHA,'manifest hash'); out={k:[] for k in keys}; n=refs=0
    with subprocess.Popen(['zstd','-dc','--',str(p)],stdout=subprocess.PIPE) as proc:
        for n,raw in enumerate(proc.stdout,1):
            d=json.loads(raw); refs+=len(d['refs']); term=d['nameParts'][-1]
            for k in (d['id'],term) if isinstance(term,str) else (d['id'],):
                if k in out:out[k].append([d['id'],d['nameParts'],d['kind'],d['refs'],n,h(raw)])
        ck(proc.wait()==0,'decompression')
    ck((n,refs)==(1484705,3035045) and filehash(p)==SHA,'manifest count/hash');return out

def frontier(out):
    ck(len(IDS)==len(set(IDS))==106,'frontier size'); lines=[]
    for j,i in enumerate(IDS):
        ck(len(out[i])==1,'frontier missing/ambiguous'); a,name,kind,refs,_,_=out[i][0]
        ck(a==i,'frontier ID');mode='manifest_only' if j>=100 else 'mixed' if i==13172633 else 'value'
        lines.append(f'{i} {".".join(map(str,name))} {kind} {",".join(map(str,refs))} {mode}\n')
    ck(h(''.join(lines).encode())==TSV,'peer exact signed-root TSV digest')

def pack(out):return enc(dict(pin=PIN,manifest=SHA,frontier=TSV,records=[[k,out[k]] for k in KEYS]))
def load(raw,expected):
    ck(h(raw)==expected,'trusted cache digest');d=json.loads(raw)
    ck((d['pin'],d['manifest'],d['frontier'])==(PIN,SHA,TSV),'cache provenance')
    ck([k for k,_ in d['records']]==KEYS,'cache query coverage');out=dict(d['records']);frontier(out)
    for k,rows in out.items():
        ck(len({r[0] for r in rows})==len(rows),'duplicate candidate')
        for r in rows:ck((r[0] if type(k) is int else r[1][-1])==k and len(r[5])==64,'candidate key/hash')
    return out

def serve(out,mode):
    if mode=='independent':return [[out[k] for k in g] for g in GROUPS]
    ks=KEYS
    if mode in ('golden','periodic'):
        a=2*math.pi/(((1+math.sqrt(5))/2)**2 if mode=='golden' else 24)
        ks=[k for j,k in sorted(enumerate(ks),key=lambda z:-math.cos(a*(z[0]+1)))]
    shared={k:out[k] for k in ks};return [[shared[k] for k in g] for g in GROUPS]

def main(p,dest):
    t=time.perf_counter();out=scan(p,KEYS);frontier(out);shared_s=time.perf_counter()-t
    t=time.perf_counter();ind=[scan(p,g) for g in GROUPS];ind_s=time.perf_counter()-t
    truth=[[x[k] for k in g] for x,g in zip(ind,GROUPS)];ck(serve(out,'independent')==truth,'independent scan mismatch')
    raw=pack(out);digest=h(raw);ck(not dest.exists(),'cache output exists');stage=dest.with_suffix('.stage')
    with stage.open('xb') as f:f.write(raw);f.flush();os.fsync(f.fileno())
    os.replace(stage,dest)
    neg=0
    for mutate in ('pin','manifest','frontier','query','candidate'):
        d=json.loads(raw)
        if mutate in ('pin','manifest','frontier'):d[mutate]='0'*64
        elif mutate=='query':d['records'].pop()
        else:d['records'][0][1]=[]
        bad=enc(d)
        for expected in (digest,h(bad)):
            try:load(bad,expected)
            except ValueError:neg+=1
            else:raise ValueError('corruption accepted')
    # For terminal-result deletion the trusted external digest is essential.
    d=json.loads(raw);d['records'][-1][1]=[]
    if enc(d)!=raw:
        try:load(enc(d),digest)
        except ValueError:neg+=1
        else:raise ValueError('terminal deletion accepted')
    res={};comparisons=0;cached=load(dest.read_bytes(),digest)
    for mode in ('independent','shared','golden','periodic'):
        cold=[];warm=[]
        for _ in range(15):
            t=time.perf_counter_ns();got=serve(load(dest.read_bytes(),digest),mode);cold.append(time.perf_counter_ns()-t);ck(got==truth,'cold mismatch');comparisons+=1
            t=time.perf_counter_ns();got=serve(cached,mode);warm.append(time.perf_counter_ns()-t);ck(got==truth,'warm mismatch');comparisons+=1
        res[mode]=[statistics.median(cold)/1e6,statistics.median(warm)/1e6]
    print(json.dumps(dict(pin=PIN,manifest=SHA,cache_sha=digest,cache_bytes=len(raw),requests=sum(map(len,GROUPS)),distinct=len(KEYS),shared_scan_s=shared_s,independent_scans_s=ind_s,peak_kib=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,comparisons=comparisons,negative=neg,median_ms=res,terminals={k:out[k] for k in KEYS if isinstance(k,str)}),ensure_ascii=False,indent=2))
if __name__=='__main__':
    if len(sys.argv)==4 and sys.argv[1]=='--read':
        out=load(Path(sys.argv[2]).read_bytes(),sys.argv[3]);print(json.dumps([[k,out[k]] for k in KEYS],ensure_ascii=False))
    else:main(*map(Path,sys.argv[1:]))

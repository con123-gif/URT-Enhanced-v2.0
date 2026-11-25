#!/usr/bin/env python3
"""Authenticated observed role paths, not Lean replay. Run: python run25_paths.py ZIP_DIRECTORY > result.json"""
import collections as C, hashlib, json, math, pathlib, resource, statistics, subprocess, sys, time, zipfile
PIN='40e56bab026552e089d7afcfeff08d2defb9c005'; ROOT=14065054
MSHA='45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf'
SPECS=[
(14937732176,'direct_roles',6,'2b775ec5100e19711b40fa9852607b876524a91283432cfeb12a99c22a2ec3f8'),
(14952948474,'frontier_roles',47,'9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6'),
(14962058506,'next_root_roles',18,'beef81685baec5816525e9fe23974ba1541acc10beec0648140a156f62f83831'),
(14966122558,'literature_theta_frontier',71,'6d2752fde5949c14eb18d61b54d7c5d8a4593fc623efb61ba83853ce0e447964'),
(14973774950,'34_producer_frontier',34,'3bed0b78f4f379e8721e3c9e855d335ddc04cba283f86744c11511e0e1bc0acd'),
(14981552949,'post34_frontier',151,'2cd911a88341ad57d0e85090af4e4f58748046d9e49e2b2cb26945ea526230ff'),
(14991121039,'post151_frontier',300,'80176159514e76b57d402bb716f09fed7a13c3855dfea2eda6ffc54763e110ce'),
(14995746690,'arithmetic_frontier',106,'41950b86cf8aa7138a2849220d433b8afbccf961d24c120f973b9ba0cb488737')]
QUERIES=[6674680,1800736,4403566,4403544,4398915,11224217,11221518,13173638,13056733,13056965,13173398,13056908,13173967,
'UpperTheory.Lit.every_character_of_theta_integrals_local_matching','UpperTheory.Top.every_character_of_green_v_win','UpperTheory.Top.zero_free_all_of_green_v_win','UpperTheory.Top.zeroFreeAll_of_topG','UpperTheory.Comparison₂.formB','Deduction.zeroFree_of_rpow_window','UpperTheory.Top.shape_closed_link_n_of_green','GlobalTheory.Fc.goal_of_shape_of_hyps','GlobalTheory.ClassFin.cf_of_isQGroup','GlobalTheory.ClassFin.cf_of_ss','GlobalTheory.ClassFin.cf_of_cf_blk_image','classFinite_integralLevel','classNumberFinite_holds','TorLoc.exists_locus','exists_locus','stmtF','stmtEF','rest3','prime_sum_facts_along_family','latticeChain_succ_of_partial','numberU3U_of_prints','oneCharU_of_katoTwoW_rig_admI_automorphy']
def ck(x,m):
    if not x: raise ValueError(m)
def h(x):return hashlib.sha256(x).hexdigest()
def enc(x):return json.dumps(x,ensure_ascii=False,separators=(',',':')).encode()
def member(folder,i,label):
    with zipfile.ZipFile(folder/f'github-actions-artifact-{i}.zip') as z:return z.read(f'job/outputs/solution_{label}.json')
def authenticate(b,sha):
    ck(h(b)==sha,'artifact digest');return json.loads(b)
def load(folder):
    ids={}; owners={}; edges=[]; adj=C.defaultdict(list); census=[]
    def ident(i,p,k):
        v=(tuple(p),k);ck(type(i) is int and i>=0 and p and ids.get(i,v)==v,'identity conflict');ids[i]=v
    for i,label,count,sha in SPECS:
        d=authenticate(member(folder,i,label),sha)
        ck((d['digest'],d['bytes'],d['n'],d['root'],d['indexedDeclarations'])==('5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e',61570595788,1065214335,ROOT,1484733),'archive')
        ck(len(d['reports'])==count and d.get('pin',d['reports'][0].get('source',{}).get('pin'))==PIN,'pin/count')
        for r in d['reports']:
            u=r['id'];q=r.get('request',r.get('source'));k=r['kind'];ck(u not in owners and r['status']=='EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK' and q.get('id',u)==u and q.get('kind',k)==k,'owner')
            # Owner spelling checked against manifest below, not reconstructed by splitting names.
            owners[u]=(q['name'],k,r.get('encodedRootsAndStructuralEdges'),r['type']['expressionRoot'],None if r.get('value') is None else r['value']['expressionRoot'])
            def add(role,slot,j,x,root):
                e=(u,x['target'],role,x['kind'],slot,j,root,x.get('witnessExpression'),x.get('distinctExpressionRecords'),i);adj[u].append(e);edges.append(e)
            def role(z,kind,slot):
                root=z['expressionRoot'];seen=set();total=0;ck(0<=root<d['n'],'root')
                for j,x in enumerate(z['references']):
                    ident(x['target'],x['nameParts'],x['targetKind']);key=(x['kind'],x['target']);w=x['distinctExpressionRecords'];ck(key not in seen and key[0] in ('explicit_const','projection_carrier','literal_primitive') and 0<=x['witnessExpression']<=root and type(w) is int and w>0,'reference');seen.add(key);total+=w;add(kind,slot,j,x,root)
                ck(total==z['referenceOccurrences'],'occurrences')
            role(r['type'],'type',0)
            if r.get('value') is not None:role(r['value'],'value',1)
            for x in r.get('structural',[]):
                s=x['edgeIndex'];v=x['encoded'];ck(r['encodedRootsAndStructuralEdges'][s]==v,'slot')
                if v<0:
                    ident(x['target'],x['nameParts'],x['kind']);ck(v==-x['target']-1,'package');add('package',s,0,x,None)
                else:
                    ck(k=='rec' and x['kind']=='recursor_rule_rhs' and x['expression']['expressionRoot']+1==v,'rhs');role(x['expression'],'rhs',s)
        census.append([label,len(owners),len(edges)])
    ck(len({(e[0],e[2],e[4],e[5]) for e in edges})==len(edges),'duplicate evidence slot')
    ck(census[-2][1:]==[627,53140] and census[-1][1:]==[733,63638],'edge census')
    return ids,owners,edges,adj,census

def manifest(folder,ids,owners):
    wanted=set(ids)|set(owners)|{q for q in QUERIES if type(q) is int}; out={q:[] for q in QUERIES}; rows={}; n=refs=0
    with zipfile.ZipFile(folder/'github-actions-artifact-14931267327.zip') as z:
        # zstd needs a seekable input file here; hash exact compressed member first.
        import tempfile
        with tempfile.TemporaryDirectory() as tmp:
            p=pathlib.Path(tmp)/'manifest.zst'
            with z.open('job/outputs/reachable_declarations.jsonl.zst') as f,p.open('wb') as g:
                import shutil;shutil.copyfileobj(f,g,1<<20)
            with p.open('rb') as f:ck(hashlib.file_digest(f,'sha256').hexdigest()==MSHA,'manifest digest')
            with subprocess.Popen(['zstd','-dc',str(p)],stdout=subprocess.PIPE) as proc:
                for n,raw in enumerate(proc.stdout,1):
                    d=json.loads(raw);i=d['id'];parts=d['nameParts'];refs+=len(d['refs']);term=parts[-1];full='.'.join(map(str,parts));keys={i,full,term} & setq
                    if i in wanted or keys:
                        row=[i,parts,d['kind'],d['refs'],n,h(raw)];ck(i not in rows,'duplicate manifest ID');rows[i]=row
                        for q in keys:out[q].append(row)
                ck(proc.wait()==0,'zstd')
            with p.open('rb') as f:ck(hashlib.file_digest(f,'sha256').hexdigest()==MSHA,'manifest digest after')
    ck((n,refs)==(1484705,3035045),'manifest census')
    for i,(p,k) in ids.items():ck(i in rows and (tuple(rows[i][1]),rows[i][2])==(p,k),'target manifest identity')
    for i,(name,k,signed,t,v) in owners.items():
        ck(i in rows,'owner missing');r=rows[i];ck(('.'.join(map(str,r[1])),r[2])==(name,k),'owner identity');ck(signed is None or signed==r[3],'owner signed slots');ck(r[3][0]==t+1 and (v is None or r[3][1]==v+1),'expression roots')
    return out,rows
setq=set(QUERIES)
def allowed(e,scope):return scope=='mixed' or (e[2]=='value' and e[3]=='explicit_const') or (scope=='expression' and e[2]!='package')
def bfs(adj,scope,target=None):
    parents={ROOT:None};todo=[ROOT]
    for u in todo:
        if u==target:break
        for e in adj.get(u,()):
            v=e[1]
            if allowed(e,scope) and v not in parents:parents[v]=e;todo.append(v)
    return parents
def path(par,v):
    if v not in par:return None
    p=[]
    while v!=ROOT:
        e=par[v];p.append(e);v=e[0]
    return p[::-1]
def batch(adj,targets,mode):
    scopes=('value','expression','mixed');result={}
    if mode=='independent':
        for s in scopes:
            for v in targets:result[s,v]=path(bfs(adj,s,v),v)
    else:
        ks=targets
        if mode in ('golden','periodic'):
            a=2*math.pi/(((1+math.sqrt(5))/2)**2 if mode=='golden' else 24);ks=[v for j,v in sorted(enumerate(ks),key=lambda z: -math.cos(a*(z[0]+1)))]
        for s in scopes:
            par=bfs(adj,s)
            for v in ks:result[s,v]=path(par,v)
    return result

def main(folder):
    t=time.perf_counter();ids,owners,edges,adj,census=load(folder);load_s=time.perf_counter()-t
    t=time.perf_counter();queries,rows=manifest(folder,ids,owners);manifest_s=time.perf_counter()-t
    targets=list(dict.fromkeys(r[0] for q in QUERIES for r in queries[q]));truth=batch(adj,targets,'independent');es=set(edges);checks=0
    for (s,v),p in truth.items():
        if p is None:continue
        u=ROOT
        for e in p:ck(e in es and e[0]==u and allowed(e,s),'path evidence');u=e[1];checks+=1
        ck(u==v,'path destination')
    # Incremental evidence delta: append new artifact rows without touching old rows.
    old=[e for e in edges if e[-1]!=SPECS[-1][0]];a=C.defaultdict(list)
    for e in old:a[e[0]].append(e)
    prior={s:bfs(a,s) for s in ('value','expression','mixed')}
    for e in edges[len(old):]:a[e[0]].append(e)
    ck(dict(a)==dict(adj),'incremental graph mismatch')
    after={s:bfs(a,s) for s in prior};ck(all(prior[s].keys()<=after[s].keys() for s in prior),'reachability shrank')
    timing={};comparisons=0
    for mode in ('independent','shared','golden','periodic'):
        t=time.perf_counter();fresh=load(folder)[3];got=batch(fresh,targets,mode);cold=(time.perf_counter()-t)*1000;ck(got==truth,'reopened mismatch');comparisons+=1;del fresh
        runs=[]
        for _ in range(7):
            t=time.perf_counter();got=batch(adj,targets,mode);runs.append((time.perf_counter()-t)*1000);ck(got==truth,'warm mismatch');comparisons+=1
        timing[mode]=[cold,statistics.median(runs)]
    neg=0
    b=member(folder,*SPECS[-1][:2]);bad=b[:-1]+bytes([b[-1]^1])
    try:authenticate(bad,SPECS[-1][-1])
    except ValueError:neg+=1
    else:raise ValueError('corrupt artifact accepted')
    e=next(e for e in edges if e[2]=='type');ck(not allowed(e,'value'),'role leakage');neg+=1
    result=[]
    for q in QUERIES:
        result.append([q,[dict(row=r,expanded=r[0] in owners,paths={s:truth[s,r[0]] for s in prior}) for r in queries[q]]])
    print(json.dumps(dict(pin=PIN,manifest_sha=MSHA,artifacts=SPECS,census=census,identities=len(set(ids)|set(owners)),manifest_checks=len(ids)+len(owners),load_s=load_s,manifest_s=manifest_s,peak_kib=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,reach={s:[len(prior[s]),len(after[s])] for s in prior},targets=len(targets),path_edge_checks=checks,comparisons=comparisons,negative=neg,median_ms=timing,queries=result),ensure_ascii=False,indent=2))
if __name__=='__main__':main(pathlib.Path(sys.argv[1]))

import collections as C, hashlib, json, pathlib, resource, sys, time, zipfile
PIN='40e56bab026552e089d7afcfeff08d2defb9c005'
DIGEST='5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e'
ROOT=14065054; N=1065214335
INPUTS=[
(14937732176,'direct_roles',6,'2b775ec5100e19711b40fa9852607b876524a91283432cfeb12a99c22a2ec3f8'),
(14952948474,'frontier_roles',47,'9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6'),
(14962058506,'next_root_roles',18,'beef81685baec5816525e9fe23974ba1541acc10beec0648140a156f62f83831'),
(14966122558,'literature_theta_frontier',71,'6d2752fde5949c14eb18d61b54d7c5d8a4593fc623efb61ba83853ce0e447964'),
(14973774950,'34_producer_frontier',34,'3bed0b78f4f379e8721e3c9e855d335ddc04cba283f86744c11511e0e1bc0acd'),
(14981552949,'post34_frontier',151,'2cd911a88341ad57d0e85090af4e4f58748046d9e49e2b2cb26945ea526230ff'),
(14991121039,'post151_frontier',300,'80176159514e76b57d402bb716f09fed7a13c3855dfea2eda6ffc54763e110ce')]
checks=0
def ck(x,msg):
    global checks
    if not x: raise ValueError(msg)
    checks+=1

def load(folder, spec):
    i,name,count,sha=spec
    with zipfile.ZipFile(folder/f'github-actions-artifact-{i}.zip') as z:
        b=z.read(f'job/outputs/solution_{name}.json')
    ck(hashlib.sha256(b).hexdigest()==sha,'receipt')
    d=json.loads(b)
    ck((d['digest'],d['bytes'],d['n'],d['root'],d['indexedDeclarations'])==(DIGEST,61570595788,N,ROOT,1484733),'archive')
    ck(len(d['reports'])==count and d.get('pin',d['reports'][0].get('source',{}).get('pin'))==PIN,'pin/count')
    return d

def walk(adj,mode):
    prev={ROOT:None}; q=C.deque([ROOT])
    while q:
        for e in adj.get(q.popleft(),[]):
            if mode=='value' and e[2:4]!=('value','explicit_const'): continue
            if mode=='expression' and e[2]=='package': continue
            if e[1] not in prev: prev[e[1]]=e; q.append(e[1])
    return prev

def build(docs):
    ids={}; names={}; owners={}; adj={}; edges=set(); census=C.Counter()
    def ident(i,p,k):
        p=tuple(p); v=(p,k)
        ck(type(i) is int and i>=0 and bool(p) and all(type(x) in (str,int) for x in p) and isinstance(k,str),'identity shape')
        ck(ids.get(i,v)==v and names.get(p,i)==i,'identity conflict'); ids[i]=v; names[p]=i
    def add(e):
        ck(e not in edges,'duplicate edge'); edges.add(e);adj[e[0]].append(e);census[e[2]]+=1
    for d in docs:
        for r in d['reports']:
            i=r['id']; q=r.get('request',r.get('source')); k=r['kind']
            ck(i not in owners and q.get('id',i)==i and q.get('kind',k)==k and r['status']=='EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK','owner')
            ident(i,q['name'].split('.'),k); owners[i]=r; adj[i]=[]
            def role(z,label,slot=None):
                root=z['expressionRoot']; ck(type(root) is int and 0<=root<N,'root'); seen=set(); total=0
                for x in z['references']:
                    j=x['target']; kind=x['kind']; w=x['witnessExpression']; n=x['distinctExpressionRecords']; key=(kind,j)
                    ident(j,x['nameParts'],x['targetKind']); ck(key not in seen and kind in ('explicit_const','projection_carrier','literal_primitive'),'reference'); seen.add(key)
                    ck(type(w) is int and 0<=w<=root and type(n) is int and n>0,'witness'); total+=n
                    add((i,j,label,kind,w,root,slot,n))
                ck(total==z['referenceOccurrences'],'occurrences')
            role(r['type'],'type')
            if r.get('value') is not None: role(r['value'],'value')
            for x in r.get('structural',[]):
                s=x['edgeIndex']; v=x['encoded']; ck(r['encodedRootsAndStructuralEdges'][s]==v,'slot')
                if v<0:
                    j=x['target']; ck(v==-j-1,'package'); ident(j,x['nameParts'],x['kind']); add((i,j,'package','package_member',None,None,s,v))
                else:
                    ck(k=='rec' and x['kind']=='recursor_rule_rhs' and x['expression']['expressionRoot']+1==v,'rhs'); role(x['expression'],'rhs',s)
    return ids,owners,adj,edges,census

def path(prev,i):
    if i not in prev: return None
    a=[]
    while prev[i] is not None:
        e=prev[i]; a.append(e); i=e[0]
    return a[::-1]

def main(folder,out):
    t=time.perf_counter(); docs=[load(folder,s) for s in INPUTS]; load_s=time.perf_counter()-t
    t=time.perf_counter(); old=build(docs[:-1]); ids,owners,adj,edges,census=build(docs)
    prev={m:walk(adj,m) for m in ('mixed','expression','value')}; before=walk(old[2],'mixed')
    ck(len(old[1])==327 and len(before)==3430 and len(old[3])==26188,'old baseline')
    new_ids={r['id'] for r in docs[-1]['reports']}; ck(new_ids<=before.keys() and not new_ids&old[1].keys(),'new target paths')
    # Independent fixed-point reference, deliberately excluded from linear BFS bound.
    closure={ROOT}
    while True:
        nxt=closure|{e[1] for e in edges if e[0] in closure}
        if nxt==closure: break
        closure=nxt
    ck(closure==prev['mixed'].keys(),'closure oracle')
    frontier=[]
    for i in prev['mixed'].keys()-owners.keys():
        parts,k=ids[i]; p=path(prev['value'],i); mode='value' if p is not None else 'expression'; p=p if p is not None else path(prev['expression'],i)
        if p is None: mode='mixed';p=path(prev['mixed'],i)
        frontier.append(dict(id=i,nameParts=parts,kind=k,mode=mode,path=p))
    frontier.sort(key=lambda x:x['id'])
    def name(i): return '.'.join(map(str,ids[i][0]))
    wanted={'coreAll_of_core','ex_all_of_good','galoisCompat_unlinkedSupport_of_spherical','localGlobalCompatAtIwahoriFixed_of_unlinked','galoisLocalGlobal_of_localGlobalCompatibility','exists_extension_rep_index_two_of_trace_invariant'}
    handoff=[]
    for i,(p,k) in ids.items():
        if p[-1] not in wanted and not (len(p)>1 and p[-2:] in (('CMBasePatch','main'),('SatSysPatch','patch'),('IndexTwoPatch','main'))): continue
        handoff.append(dict(id=i,nameParts=p,kind=k,paths={m:path(v,i) for m,v in prev.items()},report=owners.get(i)))
    handoff.sort(key=lambda x:x['id'])
    # Fail-closed negative controls on real reports, restoring each mutation.
    negative=0
    def reject(fn):
        nonlocal negative
        try: fn()
        except ValueError: negative+=1;return
        raise RuntimeError('negative accepted')
    r=docs[0]['reports'][0]; x=r['value']['references'][0]
    for obj,key,bad in [(x,'witnessExpression',N),(x,'distinctExpressionRecords',0),(x,'kind','source_match'),(r,'status','bogus')]:
        save=obj[key];obj[key]=bad;reject(lambda:build(docs[:1]));obj[key]=save
    reject(lambda:build([docs[0],docs[0]]))
    stats=dict(status='PARTIAL_EXPORTED_REFERENCES_NOT_KERNEL_RECHECK',pin=PIN,archiveDigest=DIGEST,owners=len(owners),identities=len(ids),edges=len(edges),roles=dict(census),reach={m:dict(observed=len(v),expanded=len(v.keys()&owners.keys())) for m,v in prev.items()},latest=docs[-1]['summary'],latestProjectionMs=docs[-1]['projectionMs'],latestMaxRssKiB=docs[-1]['maxRssKiB'],frontier=len(frontier),upperFrontier=dict(C.Counter(x['mode'] for x in frontier if x['nameParts'][0]=='UpperTheory')),namespaceFrontier=dict(C.Counter(str(x['nameParts'][0]) for x in frontier).most_common(20)),handoff=[dict(id=x['id'],name='.'.join(map(str,x['nameParts'])),expanded=x['report'] is not None,paths={m:None if p is None else len(p) for m,p in x['paths'].items()}) for x in handoff],checks=checks,negative=negative,loadSeconds=load_s,analysisSeconds=time.perf_counter()-t,peakRssKiB=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss)
    out.write_text(json.dumps(dict(stats=stats,frontier=frontier,handoff=handoff),separators=(',',':'))+'\n');print(json.dumps(stats,indent=2))
if __name__=='__main__': main(pathlib.Path(sys.argv[1]),pathlib.Path(sys.argv[2]))

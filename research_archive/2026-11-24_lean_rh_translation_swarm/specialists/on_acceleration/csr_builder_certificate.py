"""Native regression/benchmark. Real fixture is a prior package projection, not RH kernel truth."""
from build_csr import *
import random, resource, time

# Original export numeric IDs and typed names, sorted numerically in prepare().
SAMPLE=[[1,['Nat'],[1,2,3,5]],[2,['Nat','zero'],[1]],[3,['Nat','succ'],[1]],[5,['Nat','rec'],[3,2,1,5]],[12,['Eq'],[12,20,21]],[20,['Eq','refl'],[12]],[21,['Eq','rec'],[20,12]],[23,['outParam'],[23]],[24,['HAdd'],[23,24,29,31]],[29,['HAdd','mk'],[24,23]],[31,['HAdd','rec'],[29,24]],[33,['HAdd','hAdd'],[24,23,33]],[35,['Add'],[35,36,38]],[36,['Add','mk'],[35]],[38,['Add','rec'],[36,35]],[39,['Add','add'],[35,39]],[40,['instHAdd'],[24,35,39,29,40]],[50,['PUnit'],[50,51,52]],[51,['PUnit','unit'],[50]],[52,['PUnit','rec'],[51,50]],[54,['PProd'],[54,55,58]],[55,['PProd','mk'],[54]],[58,['PProd','rec'],[55,54]],[59,['Nat','below'],[1,54,50,5,59]],[61,['Nat','brecOn','go'],[59,54,1,3,51,2,55,5,50,61]],[60,['Nat','brecOn'],[59,1,54,61,60]],[64,['Nat','casesOn'],[3,2,1,5,64]],[66,['Nat','add','match_1'],[3,2,1,64,66]],[65,['Nat','add'],[1,54,66,59,60,3,2,65]],[100,['instAddNat'],[35,1,65,36,100]],[101,['rfl'],[12,20,101]],[102,['Nat','add_succ'],[100,40,33,12,3,1,101,102]]]

def put(p, data):
    with open(p,'wb') as f:
        for r in data: f.write((json.dumps(r,separators=(',',':'))+'\n').encode())

def manifest(p,n,e,fixture=False):
    m={'schema':'typed-csr-input-v1','nodes':n,'edges':e,'source_repo':'leanprover/lean4export' if fixture else 'synthetic','source_commit':'15f6055e299ad5b89345e533cc2192f4cc00f659' if fixture else 'none','graph_kind':'export-fixture-package-projection' if fixture else 'synthetic','provenance':'Nat.add_succ.ndjson prior package projection' if fixture else 'deterministic test','sha256':{k:sha(p/k) for k in ('names.ndjson','edges.ndjson')}}
    (p/'manifest.json').write_text(json.dumps(m)+'\n'); return sha(p/'manifest.json')

def make(p,n=None,seed=0):
    p.mkdir(); fixture=n is None
    if fixture:
        s=sorted(SAMPLE); n=len(s); ix={a:i for i,(a,_,_) in enumerate(s)}
        names=({'id':a,'name':t} for a,t,_ in s); edges=((ix[a],ix[b]) for a,_,ds in s for b in ds); e=107
    else:
        rng=random.Random(seed); names=({'id':i*2+1,'name':['N',i]} for i in range(n)); e=4*n
        edges=((rng.randrange(n),rng.randrange(n)) for _ in range(e))
    put(p/'names.ndjson',names); put(p/'edges.ndjson',({'u':u,'v':v,'role':'package_projection' if fixture else 'test','kind':'unclassified_package_edge' if fixture else 'synthetic'} for u,v in edges))
    return manifest(p,n,e,fixture)

def memory_baseline(src,dst,expected):
    # Same accepted schema for valid fixture inputs; reject mismatched digests/counts.
    need(sha(src/'manifest.json')==expected,'manifest'); m=decode((src/'manifest.json').read_bytes()); n=m['nodes']; e=m['edges']
    tags=set(); prev=-1
    for r in rows(src/'names.ndjson',m['sha256']['names.ndjson']):
        need(r['id']>prev,'id order'); prev=r['id']; t=tuple(r['name']); need(t not in tags,'duplicate name'); tags.add(t)
    need(len(tags)==n,'names'); a=[[] for _ in range(n)]; b=[[] for _ in range(n)]; count=0
    for r in rows(src/'edges.ndjson',m['sha256']['edges.ndjson']):
        u,v=edge(r,n); a[u].append(v); b[v].append(u); count+=1
    need(count==e,'edges'); dst.mkdir()
    for k,graph in [('forward',a),('reverse',b)]:
        p=dst/k; p.mkdir(); z=0
        with open(p/'off','wb') as f,open(p/'adj','wb') as g:
            f.write(struct.pack('<Q',0))
            for ds in graph:
                for v in ds: g.write(struct.pack('<I',v)); z+=1
                f.write(struct.pack('<Q',z))
    for k in ('names.ndjson','edges.ndjson','manifest.json'): shutil.copyfile(src/k,dst/('input_manifest.json' if k=='manifest.json' else k))
    return {f'{k}/{p}':sha(dst/k/p) for k in ('forward','reverse') for p in ('off','adj')}

def test():
    checks=0
    with tempfile.TemporaryDirectory() as d:
        root=Path(d)
        for i,n in enumerate([None,0,1,2,3,10,100]+[17]*20):
            src=root/f'in{i}'; a=root/f'a{i}'; b=root/f'b{i}'; h=make(src,n,i); r=build(src,a,h); q=memory_baseline(src,b,h)
            for k,v in q.items(): need(r['sha256'][k]==v,'CSR mismatch'); checks+=1
            for k in ('names.ndjson','edges.ndjson','input_manifest.json'): need((a/k).read_bytes()==(b/k).read_bytes(),'evidence mismatch'); checks+=1
        src=root/'bad'; h=make(src,2); dst=root/'badout'
        def reject(f):
            nonlocal checks
            try: f()
            except (ValueError,FileExistsError): checks+=1
            else: raise RuntimeError('negative control accepted')
            need(not dst.exists(),'partial output published')
        reject(lambda:build(src,dst,'0'*64))
        original=(src/'edges.ndjson').read_bytes(); (src/'edges.ndjson').write_bytes(original+b' '); reject(lambda:build(src,dst,h))
        for edge_data in [[{'u':0,'v':2,'role':'r','kind':'k'}],[{'u':0,'v':1,'kind':'k'}],[{'u':True,'v':1,'role':'r','kind':'k'}]]:
            put(src/'edges.ndjson',edge_data); h=manifest(src,2,1); reject(lambda:build(src,dst,h))
        (src/'edges.ndjson').write_bytes(original)
        for tags in [[{'id':1,'name':['x']},{'id':2,'name':['x']}],[{'id':2,'name':['x']},{'id':1,'name':['y']}]]:
            put(src/'names.ndjson',tags); h=manifest(src,2,8); reject(lambda:build(src,dst,h))
        put(src/'names.ndjson',[{'id':1,'name':['N',1]},{'id':2,'name':['N','1']}]); h=manifest(src,2,8); build(src,dst,h); checks+=1
        try: build(src,dst,h)
        except ValueError: checks+=1
        else: raise RuntimeError('overwrite accepted')
        # Explicit reverse multiplicity/order oracle including cycles and duplicates.
        for k in ('forward','reverse'):
            f=dst/k; o=list(x[0] for x in struct.iter_unpack('<Q',(f/'off').read_bytes())); a=list(x[0] for x in struct.iter_unpack('<I',(f/'adj').read_bytes()))
            want=[[],[]]
            for row in rows(src/'edges.ndjson',sha(src/'edges.ndjson')):
                u,v=edge(row,2)
                if k=='reverse': u,v=v,u
                want[u].append(v)
            need([a[o[i]:o[i+1]] for i in range(2)]==want,'multiplicity'); checks+=1
    return {'checks':checks,'fixture_nodes':32,'fixture_edges':107,'random_cases':26}

if __name__=='__main__':
    if len(sys.argv)==1: print(json.dumps(test()))
    elif sys.argv[1]=='prepare': print(make(Path(sys.argv[2]),int(sys.argv[3]),1124))
    else:
        method,src,dst,h=sys.argv[1:]; t=time.perf_counter(); src,dst=Path(src),Path(dst)
        r=build(src,dst,h) if method=='disk' else memory_baseline(src,dst,h)
        print(json.dumps({'method':method,'seconds':time.perf_counter()-t,'peak_rss_kib':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,'hashes':r.get('sha256',r)}))

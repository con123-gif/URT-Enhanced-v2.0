import json,hashlib,zipfile,collections as C,pathlib,sys,time,resource,subprocess,tempfile
P='40e56bab026552e089d7afcfeff08d2defb9c005'; D='5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e'; R=14065054
INPUTS=[(14937732176,'direct_roles',6,'2b775ec5100e19711b40fa9852607b876524a91283432cfeb12a99c22a2ec3f8'),(14952948474,'frontier_roles',47,'9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6'),(14962058506,'next_root_roles',18,'beef81685baec5816525e9fe23974ba1541acc10beec0648140a156f62f83831'),(14966122558,'literature_theta_frontier',71,'6d2752fde5949c14eb18d61b54d7c5d8a4593fc623efb61ba83853ce0e447964'),(14973774950,'34_producer_frontier',34,'3bed0b78f4f379e8721e3c9e855d335ddc04cba283f86744c11511e0e1bc0acd'),(14981552949,'post34_frontier',151,'2cd911a88341ad57d0e85090af4e4f58748046d9e49e2b2cb26945ea526230ff'),(14991121039,'post151_frontier',300,'80176159514e76b57d402bb716f09fed7a13c3855dfea2eda6ffc54763e110ce')]
PEER={13173967:'UpperTheory.Gal.Int.Inp.ex_all_of_good',13056908:'GlobalTheory.T.exists_extension_rep_index_two_of_trace_invariant',13173638:'GlobalTheory.CMBasePatch.main',13173398:'GlobalTheory.SatSysPatch.patch',13056965:'GlobalTheory.IndexTwoPatch.main'}
PEER_NAMES=set(PEER.values())|{'GlobalTheory.IndexTwoExt.main'}
SUPPLIERS={13175074,13140146,13172409,13129148}
checks=0
def ck(v,msg):
 global checks
 if not v:raise ValueError(msg)
 checks+=1

def load(folder):
 owners={}; ids={}; edges=[]; adj=C.defaultdict(list)
 def ident(i,parts,kind):
  val=(tuple(parts),kind);ck(ids.get(i,val)==val,'identity conflict');ids[i]=val
 def add(i,j,role,kind,w,root,slot):
  e=(i,j,role,kind,w,root,slot);edges.append(e);adj[i].append(e)
 for aid,tag,count,h in INPUTS:
  with zipfile.ZipFile(folder/f'github-actions-artifact-{aid}.zip') as z:b=z.read(f'job/outputs/solution_{tag}.json')
  ck(hashlib.sha256(b).hexdigest()==h,'report receipt');d=json.loads(b)
  ck((d['digest'],d['bytes'],d['n'],d['root'],d['indexedDeclarations'])==(D,61570595788,1065214335,R,1484733),'archive')
  ck(len(d['reports'])==count and d.get('pin',d['reports'][0].get('source',{}).get('pin'))==P,'pin/count')
  for r in d['reports']:
   i=r['id'];q=r.get('request',r.get('source'));k=r['kind'];ck(i not in owners and r['status']=='EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK','owner');owners[i]=r;ident(i,q['name'].split('.'),k)
   def role(z,label,slot=None):
    root=z['expressionRoot'];ck(0<=root<1065214335,'root')
    for x in z['references']:
     j=x['target'];w=x['witnessExpression'];kind=x['kind'];ident(j,x['nameParts'],x['targetKind']);ck(0<=w<=root and kind in ('explicit_const','projection_carrier','literal_primitive'),'expression witness');add(i,j,label,kind,w,root,slot)
   role(r['type'],'type')
   if r.get('value') is not None:role(r['value'],'value')
   for x in r.get('structural',[]):
    s=x['edgeIndex'];v=x['encoded'];ck(r['encodedRootsAndStructuralEdges'][s]==v,'slot')
    if v<0:
     j=x['target'];ck(v==-j-1,'package');ident(j,x['nameParts'],x['kind']);add(i,j,'package','package_member',None,None,s)
    else:
     ck(k=='rec' and x['expression']['expressionRoot']+1==v,'rhs');role(x['expression'],'rhs',s)
 ck((len(owners),len(ids),len(edges),len(set(edges)))==(627,7493,53140,53140),'prior graph census');return owners,ids,adj

def walk(adj,mode):
 prev={R:None};q=C.deque([R]);dist={R:0}
 while q:
  i=q.popleft()
  for e in adj[i]:
   if mode=='value' and e[2:4]!=('value','explicit_const'):continue
   if e[1] not in prev:prev[e[1]]=e;dist[e[1]]=dist[i]+1;q.append(e[1])
 return prev,dist

def path(prev,i):
 a=[]
 while prev[i] is not None:e=prev[i];a.append(e);i=e[0]
 return a[::-1]

def run(folder,out):
 t=time.perf_counter();owners,ids,adj=load(folder);mixed,dm=walk(adj,'mixed');val,dv=walk(adj,'value');ck((len(mixed),len(val))==(5474,5254),'reach')
 # Include every unexpanded arithmetic supplier directly referenced by the four recovered theorems,
 # including GalTw. Expand additional Global/Upper/GalTw arithmetic prefixes, prioritising value paths.
 direct={e[1] for i in SUPPLIERS for e in adj[i] if e[1] not in owners and str(ids[e[1]][0][0]) in ('UpperTheory','GlobalTheory','GalTw')}
 def name(i):return '.'.join(map(str,ids[i][0]))
 prefixes=('UpperTheory.Gal.','GlobalTheory.DeRham','GlobalTheory.Road','GlobalTheory.CM','GlobalTheory.SatSys','GlobalTheory.IndexTwo','GlobalTheory.T.','GalTw.')
 pool={i for i in mixed if i not in owners and (name(i).startswith(prefixes) or i in direct)}
 sel=sorted(pool,key=lambda i:(i not in direct,i not in val,dv.get(i,dm[i]),i))[:100]
 ck(direct<=set(sel),'direct supplier omitted');ck(len(sel)==len(set(sel)) and not set(sel)&owners.keys(),'disjoint')
 graph_s=time.perf_counter()-t
 # Single authenticated manifest scan, exact names and signed roots. No inferred incoming paths.
 t=time.perf_counter();targets=set(sel)|set(PEER); matches={}; peer_matches=C.defaultdict(list);rows=0
 with zipfile.ZipFile(folder/'github-actions-artifact-14931267327.zip') as z, tempfile.TemporaryDirectory() as tmp:
  p=pathlib.Path(tmp)/'manifest.zst';h=hashlib.sha256()
  with z.open('job/outputs/reachable_declarations.jsonl.zst') as a,p.open('wb') as b:
   for chunk in iter(lambda:a.read(1024*1024),b''):h.update(chunk);b.write(chunk)
  ck(h.hexdigest()=='45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf','manifest receipt')
  proc=subprocess.Popen(['zstd','-dc',str(p)],stdout=subprocess.PIPE,text=True,encoding='utf8')
  for line in proc.stdout:
   z=json.loads(line);rows+=1;i=z['id'];n='.'.join(map(str,z['nameParts']))
   if i in targets:ck(i not in matches,'duplicate target ID');matches[i]=z
   if n in PEER_NAMES:peer_matches[n].append(z)
  ck(proc.wait()==0 and rows==1484705,'manifest row count')
 ck(set(matches)==targets,'manifest coverage')
 for i,n in PEER.items():ck(len(peer_matches[n])==1 and peer_matches[n][0]==matches[i] and matches[i]['kind']=='thm','peer exact identity')
 # Verify all selected typed name components and retain signed roots. Peer-only rows cannot be labelled path-authenticated.
 requests=[]
 for i in sel:
  z=matches[i];ck((tuple(z['nameParts']),z['kind'])==ids[i],'graph-manifest identity')
  m='value' if i in val else 'mixed';p=path(val if m=='value' else mixed,i);ck(p[0][0]==R and p[-1][1]==i and all(a[1]==b[0] for a,b in zip(p,p[1:])),'path continuity')
  requests.append(dict(id=i,nameParts=z['nameParts'],kind=z['kind'],refs=z['refs'],mode=m,path=p))
 for n in sorted(PEER_NAMES):
  rr=peer_matches[n];ck(len(rr)==1,'peer missing/ambiguous '+n);z=rr[0];i=z['id']
  if i in sel or i in owners:continue
  m='value' if i in val else 'mixed' if i in mixed else 'manifest_only';p=path(val if m=='value' else mixed,i) if m!='manifest_only' else None
  requests.append(dict(id=i,nameParts=z['nameParts'],kind=z['kind'],refs=z['refs'],mode=m,path=p))
 ck(len({x['id'] for x in requests})==len(requests),'unique requests');ck(all(x['id'] not in owners for x in requests),'no repeated projections')
 # The real input receipts protect the exact data; targeted mutation controls for identity/path/role distinctions.
 def validate(x):
  i=x['id'];p=x['path'];m=x['mode'];ck(m in ('value','mixed','manifest_only'),'mode');ck((p is None)==(m=='manifest_only'),'path/mode');ck(m!='manifest_only' or i not in mixed,'unjustified manifest-only');ck(p is None or (p[0][0]==R and p[-1][1]==i and all(a[1]==b[0] for a,b in zip(p,p[1:])) and all(e in adj[e[0]] for e in p)),'path evidence');ck(m!='value' or all(e[2:4]==('value','explicit_const') for e in p),'value claim')
 for x in requests:validate(x)
 negative=0
 for x in [dict(requests[0],path=None),dict(requests[0],id=-1),dict(requests[-1],mode='value',path=None)]:
  try:validate(x)
  except ValueError:negative+=1
  else:raise ValueError('negative accepted')
 stats=dict(pin=P,archiveDigest=D,owners=len(owners),mixedReach=len(mixed),valueReach=len(val),pool=len(pool),direct=len(direct),requests=len(requests),modes=dict(C.Counter(x['mode'] for x in requests)),namespaces=dict(C.Counter(x['nameParts'][0] for x in requests)),manifestRows=rows,graphSeconds=graph_s,manifestSeconds=time.perf_counter()-t,checks=checks,negative=negative,peakRssKiB=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss)
 out.write_text(json.dumps(dict(stats=stats,requests=requests),separators=(',',':'))+'\n');print(json.dumps(stats,indent=2));print('DIRECT',[(i,name(i)) for i in sorted(direct)]);print('PEERS',[(x['id'],'.'.join(x['nameParts']),x['mode']) for x in requests if '.'.join(x['nameParts']) in PEER_NAMES])
if __name__=='__main__':run(pathlib.Path(sys.argv[1]),pathlib.Path(sys.argv[2]))

#!/usr/bin/env python3
"""Join verified projected explicit value paths to exact manifest identities/roots."""
import hashlib,json,sys
from collections import deque
from pathlib import Path
from manifest_index_run19 import connect,ck,FRONTIER,ROOT
HASHES=['64b935e4ef309f6c555912a377012c7708eda510','d49fbcc22a2382039986b09ff91dd11af2ef2e7b','d04e0fb24160d3ee1be54cd50082f59526864d4e','d823c364f446f5066dbbc61f7e9cf9c891fcbdb2']
DIGEST='5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e'
def main(db,paths):
    ck(len(paths)==4,'four projections'); c=connect(db); adj={}; records={}
    def row(i):
        if i not in records:
            r=c.execute('SELECT raw FROM decl WHERE id=?',(i,)).fetchone(); ck(r is not None,'missing manifest identity'); records[i]=json.loads(r[0])
        return records[i]
    for p,h in zip(paths,HASHES):
        raw=Path(p).read_bytes(); ck(hashlib.sha1(b'blob '+str(len(raw)).encode()+b'\0'+raw).hexdigest()==h,'report blob'); doc=json.loads(raw); ck(doc['digest']==DIGEST and doc['root']==ROOT,'report archive')
        for r in doc['reports']:
            i=r['id']; ck(i not in adj,'duplicate owner'); m=row(i); ck(m['kind']==r['kind'],'owner kind'); ck(m['refs'][0]==r['type']['expressionRoot']+1,'type root'); adj[i]=[]
            v=r['value']
            if v is None: continue
            ck(m['refs'][1]==v['expressionRoot']+1,'value root')
            for a in v['references']:
                if a['kind']!='explicit_const': continue
                j=a['target']; n=row(j); ck(n['nameParts']==a['nameParts'] and n['kind']==a['targetKind'],'target identity')
                adj[i].append(dict(owner=i,target=j,role='value',kind=a['kind'],expressionRoot=v['expressionRoot'],witness=a['witnessExpression'],multiplicity=a['distinctExpressionRecords'],reportBlob=h))
    prev={ROOT:None}; q=deque([ROOT])
    while q:
        for e in adj.get(q.popleft(),[]):
            j=e['target']
            if j not in prev: prev[j]=e; q.append(j)
    out=[]
    for i in FRONTIER:
        ck(i in prev and i not in adj,'frontier coverage'); m=row(i); ck(m['kind']=='thm' and len(m['refs'])==2 and min(m['refs'])>0,'theorem roots'); path=[]; j=i
        while j!=ROOT:
            e=prev[j]; ck(e['target']==j,'path'); path.append(e); j=e['owner']
        path.reverse(); out.append(dict(id=i,nameParts=m['nameParts'],typeRoot=m['refs'][0]-1,valueRoot=m['refs'][1]-1,path=path))
    ck(len(out)==34 and len(adj)==142,'census')
    print(json.dumps(dict(status='PROJECTED_VALUE_PATHS_JOINED_NOT_KERNEL_RECHECK',owners=len(adj),valueReachable=len(prev),manifestIdentities=len(records),frontier=out),indent=2))
if __name__=='__main__': main(sys.argv[1],sys.argv[2:])

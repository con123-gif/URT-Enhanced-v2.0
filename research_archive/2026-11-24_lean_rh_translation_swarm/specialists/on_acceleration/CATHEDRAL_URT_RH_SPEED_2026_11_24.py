#!/usr/bin/env python3
"""URT-assisted, linear-time, source-import graph scheduler for Lean RH.

Status: SOURCE-IMPORT GRAPH ONLY; NOT Lean elaborated dependencies, not a
shortened RH proof. Keeps all graph edges, including unresolved externals.
For source bytes B, reachable modules V, imports E:
  source index O(B), reachable traversal O(V+E),
  fixed-rank harmonic schedule O(V), output size O(V+E).
Ordinary low-rank linear algebra supplies the speed, not proven phi superiority.

Local sample run 2026-11-24: 11 real RH Lean excerpt files, 10879 bytes,
8 reachable local modules, 19 import edges, 12 unresolved imports,
maximum rank-2 equation residual 2.22e-16.
"""
import argparse
from collections import deque, defaultdict
import json, math, pathlib, re, time

KAPPA=math.pi/math.e
PHI=(1+math.sqrt(5))/2
THETA=2*math.pi/(PHI*PHI)
IMP=re.compile(r'^\s*import\s+([^\n-]+)')

def analyze(root):
    root=pathlib.Path(root)
    graph={}
    source_bytes=0
    for p in root.rglob('*.lean'):
        if '.lake' in p.parts: continue
        m=p.relative_to(root).with_suffix('').as_posix().replace('/','.')
        deps=[]
        block=0
        with p.open('r',encoding='utf-8',errors='replace') as f:
            for line in f:
                source_bytes+=len(line.encode('utf-8'))
                out=[]
                i=0
                while i<len(line):
                    if line[i:i+2]=='/-':
                        block+=1;i+=2;continue
                    if block and line[i:i+2]=='-/':
                        block-=1;i+=2;continue
                    if not block and line[i:i+2]=='--':break
                    if not block:out.append(line[i])
                    i+=1
                found=IMP.match(''.join(out))
                if found:deps.extend(found.group(1).strip().split())
        graph[m]=list(dict.fromkeys(deps))
    if 'Main' not in graph:raise ValueError('No Main.lean in source tree')
    order=[]
    q=deque(['Main']);seen={'Main'};edges=[];outside=set()
    while q:
        u=q.popleft();order.append(u)
        for v in graph[u]:
            edges.append([u,v])
            if v not in graph:outside.add(v)
            elif v not in seen:seen.add(v);q.append(v)
    inc=defaultdict(int);out=defaultdict(int)
    for u,v in edges:
        out[u]+=1
        inc[v]+=1
    n=len(order)
    r=math.sqrt(KAPPA/n)
    d=[];b=[];U=[]
    for i,v in enumerate(order):
        d.append(1+inc[v]);b.append(1+out[v])
        U.append((r*math.cos(i*THETA),r*math.sin(i*THETA)))
    # Woodbury for (diag(d) + U U^T) x=b, U has exactly 2 columns.
    A00=A11=1.
    A01=z0=z1=0.
    for i in range(n):
        u,v=U[i];f=1/d[i]
        A00+=u*u*f;A01+=u*v*f;A11+=v*v*f
        z0+=u*b[i]*f;z1+=v*b[i]*f
    det=A00*A11-A01*A01
    if det<=0:raise ArithmeticError('Nonpositive reduced determinant')
    c0=(A11*z0-A01*z1)/det
    c1=(-A01*z0+A00*z1)/det
    x=[(b[i]-U[i][0]*c0-U[i][1]*c1)/d[i] for i in range(n)]
    w0=sum(U[i][0]*x[i] for i in range(n))
    w1=sum(U[i][1]*x[i] for i in range(n))
    residual=max(abs(d[i]*x[i]+U[i][0]*w0+U[i][1]*w1-b[i]) for i in range(n))
    assert residual<1e-10,residual
    return {'status':'SOURCE_IMPORT_DEPENDENCIES_ONLY_NOT_KERNEL_PROOF',
      'source_root':str(root),
      'statistics':{'modules_seen':len(graph),'source_bytes_read':source_bytes,
       'root_reachable':n,'root_import_edges':len(edges),
       'unresolved_imports':len(outside),
       'fixed_rank_urt_max_residual':residual},
      'note':'Fixed pi/e and phi phases schedule review; golden rotation is not shown to outperform conventional ranking',
      'order':order,'edges':edges,'external':sorted(outside),
      'priority':dict(zip(order,x))}

if __name__=='__main__':
    parser=argparse.ArgumentParser()
    parser.add_argument('src')
    parser.add_argument('--out',default='urt_rh_scan.json')
    args=parser.parse_args()
    t=time.perf_counter()
    result=analyze(args.src)
    result['elapsed_seconds']=time.perf_counter()-t
    pathlib.Path(args.out).write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result['statistics'],indent=2))

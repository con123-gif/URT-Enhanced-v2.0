#!/usr/bin/env python3
"""Exact integer certificate for source-sector resolvent poles of the
A5-isotropised URT six-bit chronology. Rational A5 group projectors only;
no source fitting or historical ARF coefficients.
"""
from pathlib import Path
import numpy as np,runpy,contextlib,io
P=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):d=runpy.run_path(str(P/'URT_A5_AVERAGED_CHRONOLOGY_2026-11-09.py'))
proper=d['proper'];perms=d['perms'];Qav=d['Qav'];R3=d['src']['R3'];R5=d['src']['R5']
Qint=np.rint(120*Qav).astype(np.int64)
assert np.max(np.abs(120*Qav-Qint))<1e-11

def order(g):
    arr=list(range(12));curr=arr[:]
    for k in range(1,7):
        curr=[g[i] for i in curr]
        if curr==arr:return k
    raise ValueError('not A5')
chars={1:4,2:0,3:1,5:-1};Z=np.zeros((64,64),dtype=np.int64)
counts={x:0 for x in chars}
for g,perm in zip(proper,perms):
    o=order(g);counts[o]+=1
    U=np.zeros((64,64),dtype=np.int64)
    for h,t in enumerate(perm):U[t,h]=1
    Z+=chars[o]*U
assert counts=={1:1,2:15,3:20,5:24}
assert np.array_equal(Z@Z,15*Z),np.max(abs(Z@Z-15*Z))
assert Z.trace()%15==0
Hd={deg:np.array([[(-1)**((h&m).bit_count()) for m in range(64) if m.bit_count()==deg] for h in range(64)],dtype=np.int64) for deg in range(7)}
print('A5 order classes',counts,'4-irrep projector trace',Z.trace()//15)
for deg in (1,2,3,4,5,6):
    dim=np.linalg.matrix_rank((Z@Hd[deg]).astype(float),tol=1e-7)
    print('Walsh degree',deg,'A5 quartet isotypic dimension',dim)
# Exact conjectured minimal polynomials observed in numeric source Krylov:
# h3 lambda 3/20 and 1/20 => (120Q)^2-24(120Q)+108I=0.
# h5 lambda 1/15 and -1/20 => (120Q)^2-2(120Q)-48I=0.
E3=Qint@Qint-24*Qint+108*np.eye(64,dtype=np.int64)
E5=Qint@Qint-2*Qint-48*np.eye(64,dtype=np.int64)
for deg in [3]:
    res=E3@Z@Hd[deg]
    print('E3 projector deg',deg,'max EXACT integer residual',np.max(abs(res)))
for deg in [2,4]:
    res=E5@Z@Hd[deg]
    print('E5 projector deg',deg,'max EXACT integer residual',np.max(abs(res)))
print('h3 numerical source polynomial residual',np.linalg.norm(E3@R3))
print('h5 numerical source polynomial residual',np.linalg.norm(E5@R5))

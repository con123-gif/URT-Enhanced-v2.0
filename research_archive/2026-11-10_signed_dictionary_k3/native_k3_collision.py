#!/usr/bin/env python3
"""Q14: exact native Q6 K3 test of Q12's non-parity K2 collision.

Uses the archived icosahedral hidden-5 face source, five A4 vacuum lines,
and fixed Q(h,2h)=Q(h,2h+1)=1/2. No fitted or measured inputs.
"""
from contextlib import redirect_stdout
from fractions import Fraction as F
from io import StringIO
from math import comb
from pathlib import Path
import json,runpy

source=Path(__file__).resolve().parents[1]/'2026-11-10_signed_a5_covariance'/'signed_a5_covariance.py'
assert source.is_file()
with redirect_stdout(StringIO()): ns=runpy.run_path(str(source))
vacua=ns['vacua'];Z=ns['Z'];K=ns['K']
assert len(vacua)==5

def q(v):return [(v[2*h%64]+v[(2*h+1)%64])/2 for h in range(64)]
def mean(v):return sum(v,Z)/64
def poisson(rhs):
    assert mean(rhs)==Z
    out=[Z]*64;cur=rhs
    for _ in range(6):
        out=[a+b for a,b in zip(out,cur)];cur=q(cur)
    assert all(x==Z for x in cur)
    assert all(a-b==c for a,b,c in zip(out,q(out),rhs))
    return out

def k123(g):
    assert mean(g)==Z
    r=[[K(1)]*64];lam=[K(1)];gp=[[K(1)]*64]
    for n in range(1,4):
        gp.append([a*b for a,b in zip(gp[-1],g)])
        src=[Z]*64
        for k in range(1,n+1):
            qr=q(r[n-k]);src=[x+comb(n,k)*a*b for x,a,b in zip(src,gp[k],qr)]
        lam.append(mean(src));rhs=src[:]
        for k in range(1,n+1):rhs=[x-comb(n,k)*lam[k]*rv for x,rv in zip(rhs,r[n-k])]
        r.append(poisson(rhs))
    k=[Z]*4
    for n in range(1,4):k[n]=lam[n]-sum((comb(n-1,j-1)*k[j]*lam[n-j] for j in range(1,n)),Z)
    assert k[1]==Z
    return k[1:]

def finite_k3(g,n):
    powers=[[K(1)]*64]
    for _ in range(3):powers.append([a*b for a,b in zip(powers[-1],g)])
    v=[[K(1)]*64]+[[Z]*64 for _ in range(3)]
    for _ in range(n):
        qv=[q(x) for x in v]
        v=[[sum((comb(k,j)*powers[j][h]*qv[k-j][h] for j in range(k+1)),Z) for h in range(64)] for k in range(4)]
    m=[mean(x) for x in v]
    return m[3]-3*m[2]*m[1]+2*m[1]*m[1]*m[1]

def index(h,D):
    out=0
    for i,x in enumerate(D):out|=(((h>>i)&1)^(x&1))<<(x//2)
    return out

D0=(0,2,4,6,8,10);D1=(0,2,5,6,9,11)
results=[]
for D in (D0,D1):
    idx=[index(h,D) for h in range(64)];rows=[]
    for _,r2,line,_ in vacua:
        g=[line[i] for i in idx]
        _,K2,K3=k123(g)
        assert finite_k3(g,25)-finite_k3(g,24)==K3
        assert K2.b==0 and r2.b==0 and r2.a>0
        # K3^2/r2^3 is independent of the A4 line's arbitrary sign/scale.
        rows.append((K2/r2,K3,K3*K3/(r2*r2*r2)))
    assert sorted(x[0].a for x in rows)==sorted([F(5,6),F(25,24),F(67,48),F(33,16),F(33,16)])
    results.append(rows)
S=[{str(x[2]) for x in rows} for rows in results]
assert len(S[0])==len(S[1])==5
assert S[0]!=S[1],('K3 does not distinguish dictionaries',S)
# Unique K2=25/24: the sign-independent K3 invariant is a simple exact witness.
witness=[next(x[2] for x in rows if x[0]==K(F(25,24))) for rows in results]
assert witness[0]!=witness[1]
print(json.dumps({'result':'OBSTRUCTION: these distinct signed dictionaries collide at K2 but separate at K3',
 'D0':list(D0),'D1':list(D1),
 'K2_multisets':[[str(x[0]) for x in rows] for rows in results],
 'K3_raw':[[str(x[1]) for x in rows] for rows in results],
 'K3_squared_over_norm_cubed':[[str(x[2]) for x in rows] for rows in results],
 'unique_K2_25_24_K3_witness':[str(x) for x in witness],
 'finite_time_24_to_25':'exact pass','physical_ARFs':'not derived'},indent=2))

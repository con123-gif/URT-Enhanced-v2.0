#!/usr/bin/env python3
"""Exact dark/4_3/4_5 third cumulant tensor from the native five-solid source.
No ARF targets, fitting, gauge-current identification or third-party YM inputs.
"""
from fractions import Fraction as F
from math import factorial
from pathlib import Path
import runpy, io, contextlib
with contextlib.redirect_stdout(io.StringIO()):
    src=runpy.run_path(str(Path(__file__).parent/'URT_A5_NEUTRAL_SOURCE_EXACT_CUMULANTS_2026_11_10.py'))
K=src['Q5']; Z=K(); n5=src['n']; n3=src['n3']
assert len(n5)==len(n3)==64
# Independent face-geometry reconstruction checksum (not a source input).
low=K(F(56,5),-F(24,5)); high=K(F(56,5),F(24,5))
labels=''.join(str([Z,low,high].index(x)) for x in n5)
assert labels=='2002122002210110120100122010120110210102210010210110122002212002'
mean=lambda x:sum(x,Z)/64
g3=[x-mean(n3) for x in n3]; g5=[x-mean(n5) for x in n5]
d=[K(-(-1)**i.bit_count()) if n5[i]==Z else Z for i in range(64)]
assert mean(d)==mean(g3)==mean(g5)==Z
def Q(v):return [(v[2*i%64]+v[(2*i+1)%64])/2 for i in range(64)]
def Qn(v,n):
    for _ in range(n):v=Q(v)
    return v
def dot(x,y):return mean([a*b for a,b in zip(x,y)])
def add(*vs):return [sum((v[i] for v in vs),Z) for i in range(64)]
def scale(v,s):return [s*x for x in v]
def cubic(v):
    assert mean(v)==Z
    v2=[x*x for x in v];q=[v];q2=[v2]
    for _ in range(6):q.append(Q(q[-1]));q2.append(Q(q2[-1]))
    assert q[6]==[Z]*64
    total=mean([x*x*x for x in v])
    for t in range(1,6):total+=3*(dot(v2,q[t])+dot(v,q2[t]))
    for a in range(1,6):
        for b in range(1,6):
            total+=6*dot(v,Qn([v[i]*q[b][i] for i in range(64)],a))
    return total
def tilted3(v):
    """Independent Perron perturbation of Q diag(exp(t*v))."""
    R=[[K(1)]*64]; lam=[K(1)]
    powers=[[K(1)]*64]+[[x**j/F(factorial(j)) for x in v] for j in range(1,4)]
    for j in range(1,4):
        b=[Z]*64
        for k in range(1,j+1):
            t=Q([powers[k][i]*R[j-k][i] for i in range(64)])
            b=[b[i]+t[i] for i in range(64)]
        for k in range(1,j):b=[b[i]-lam[k]*R[j-k][i] for i in range(64)]
        lj=mean(b);lam.append(lj)
        u=[x-lj for x in b];r=[Z]*64
        for _ in range(6):r=[r[i]+u[i] for i in range(64)];u=Q(u)
        assert all(r[i]-Q(r)[i]==b[i]-lj for i in range(64))
        R.append(r)
    return 6*(lam[3]-lam[1]*lam[2]+lam[1]**3/3)
A=cubic(d);B=cubic(g3);C=cubic(g5)
p3=cubic(add(d,g3));m3=cubic(add(d,scale(g3,-1)))
p5=cubic(add(d,g5));m5=cubic(add(d,scale(g5,-1)))
bp=cubic(add(g3,g5));bm=cubic(add(g3,scale(g5,-1)))
T={
 'ddd':A,
 'dd3':(p3-m3-2*B)/6,
 'dd5':(p5-m5-2*C)/6,
 'd33':(p3+m3-2*A)/6,
 'd55':(p5+m5-2*A)/6,
 '333':B,
 '335':(bp-bm-2*C)/6,
 '355':(bp+bm-2*B)/6,
 '555':C,
}
full=cubic(add(d,g3,g5))
T['d35']=(full-(A+B+C+3*sum(T[k] for k in ['dd3','dd5','d33','d55','335','355'])))/6
# Independent arbitrary-direction polarization check.
other=cubic(add(scale(d,2),scale(g3,-3),g5))
reconstructed=(8*T['ddd']-27*T['333']+T['555']+
 3*(-12*T['dd3']+4*T['dd5']+18*T['d33']+2*T['d55']+9*T['335']-3*T['355'])-36*T['d35'])
assert other==reconstructed
# Independent eigenvalue derivatives for six directions.
for v in (d,g3,g5,add(d,g3),add(d,g5),add(d,g3,g5)):
    assert cubic(v)==tilted3(v)
# Independent ordered-lag enumeration, with no time-cumulant formula.
def ordered(v,horizon):
    s=Z;q=[v]
    for _ in range(6):q.append(Q(q[-1]))
    for u in range(-horizon,horizon+1):
        for w in range(-horizon,horizon+1):
            t=sorted((0,u,w));a=t[1]-t[0];b=t[2]-t[1]
            if a<6 and b<6:s+=dot(v,Qn([v[i]*q[b][i] for i in range(64)],a))
    return s
assert ordered(d,10)==ordered(d,12)==A
assert T['ddd']==K(F(3,128))
assert mean([x**3 for x in d])==Z
assert sum((3*(dot([x*x for x in d],Qn(d,k))+dot(d,Qn([x*x for x in d],k))) for k in range(1,6)),Z)==Z
for key in ('ddd','dd3','dd5','d33','d35','d55','333','335','355','555'):
    print(key, T[key], 'decimal',float(T[key]))
print('PASS native 190-cochain source, exact Q(sqrt5), six-step Q, two cumulant methods, independent lag sum, and off-grid polarization')
print('NOTE: gauge-neutral source statistics only; no 24-clock physical vertex or four ARFs derived')

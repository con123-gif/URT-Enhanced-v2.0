#!/usr/bin/env python3
"""Exact fourth temporal cumulants of the original two neutral hidden source norms.
No fitting or historical ARF targets. Native 190-cochain source pullback, 64-bit
history chronology and 4_3/4_5 are inherited unchanged from the source module.
The 24-clock Ward/Schur action is not identified with this neutral scalar probe.
"""
from fractions import Fraction as F
from math import factorial
from collections import Counter
from pathlib import Path
import contextlib, io, runpy

root=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
    s=runpy.run_path(str(root/'URT_A5_NEUTRAL_SOURCE_EXACT_CUMULANTS_2026_11_10.py'))
K=s['Q5'];Z=K();g=s['g'];g3=s['v3'];N=len(g)
assert N==64 and len(g3)==64

def mean(v):return sum(v,Z)/N
def Q(v):return [(v[2*i%N]+v[(2*i+1)%N])/2 for i in range(N)]
def Qn(v,n):
    for _ in range(n):v=Q(v)
    return v
def dot(x,y):return mean([a*b for a,b in zip(x,y)])
assert mean(g)==mean(g3)==Z
assert Qn(g,6)==[Z]*N and Qn(g3,6)==[Z]*N

def cumulants(v,order=4):
    """Exact derivatives of log Perron eigenvalue of Q diag(exp(t*v)).
    The Poisson inverse on centered functions is I+Q+...+Q^5 exactly.
    """
    R=[[K(1)]*N];lam=[K(1)]
    power=[[K(1)]*N]
    for j in range(1,order+1):
        power.append([x**j/F(factorial(j)) for x in v])
    for j in range(1,order+1):
        b=[Z]*N
        for k in range(1,j+1):
            t=Q([power[k][i]*R[j-k][i] for i in range(N)])
            b=[b[i]+t[i] for i in range(N)]
        for k in range(1,j):
            b=[b[i]-lam[k]*R[j-k][i] for i in range(N)]
        lj=mean(b);lam.append(lj)
        u=[x-lj for x in b];r=[Z]*N
        for _ in range(6):
            r=[r[i]+u[i] for i in range(N)]
            u=Q(u)
        assert mean(r)==Z
        assert all(r[i]-Q(r)[i]==b[i]-lj for i in range(N))
        R.append(r)
    loglam=[Z]
    for j in range(1,order+1):
        loglam.append(lam[j]-sum((k*loglam[k]*lam[j-k] for k in range(1,j)),Z)/j)
    return [factorial(j)*loglam[j] for j in range(1,order+1)]

ks=cumulants(g)
assert ks[0]==Z and ks[1]==K(F(471,5))
assert ks[2]==K(F(152754,125),F(6912,125))
assert ks[3]==K(F(13072602,625),F(1749888,625))

# Independent 216-gap enumeration of the connected four-time function.
C2=[dot(g,Qn(g,k)) for k in range(16)]
assert all(c==Z for c in C2[5:])
K4_check=Z
for a in range(6):
    for b in range(6):
        for c in range(6):
            t=(0,a,a+b,a+b+c)
            mult=factorial(4)
            for count in Counter(t).values():mult//=factorial(count)
            u=Qn(g,c)
            u=Qn([g[i]*u[i] for i in range(N)],b)
            u=Qn([g[i]*u[i] for i in range(N)],a)
            moment=dot(g,u)
            connected=moment-C2[a]*C2[c]-C2[a+b]*C2[b+c]-C2[a+b+c]*C2[b]
            K4_check+=mult*connected
assert K4_check==ks[3]

# Five independent components of the symmetric fourth cumulant tensor.
quart=lambda v:cumulants(v)[3]
A=quart(g3);E=ks[3]
P=quart([x+y for x,y in zip(g3,g)])
M=quart([x-y for x,y in zip(g3,g)])
P2=quart([x+2*y for x,y in zip(g3,g)])
M2=quart([x-2*y for x,y in zip(g3,g)])
B=((P+M)/2-A-E)/6
odd1=(P-M)/2;odd2=(P2-M2)/2
D=(odd2-2*odd1)/24
C=(odd1-4*D)/4
assert (P2+M2)/2==A+24*B+16*E
assert P==A+4*C+6*B+4*D+E
assert M==A-4*C+6*B-4*D+E

# Regression to archived exact native two-sector covariance and cubic.
def cov(x,y):
    return dot(x,y)+sum((dot(x,Qn(y,k))+dot(y,Qn(x,k)) for k in range(1,6)),Z)
assert cov(g3,g3)==K(F(2554416,625),F(1135296,625))
assert cov(g3,g)==K(F(11556,25),F(23112,125))
assert cumulants(g3,3)[2]==K(F(8470303488,15625),F(3786974208,15625))
for name,val in [('3333',A),('3335',C),('3355',B),('3555',D),('5555',E)]:
    print('K4_'+name,val,'decimal',float(val))
print('PASS exact Q(sqrt5): fourth cumulant, independent 216-gap check, polarization, earlier K2/K3 regression')

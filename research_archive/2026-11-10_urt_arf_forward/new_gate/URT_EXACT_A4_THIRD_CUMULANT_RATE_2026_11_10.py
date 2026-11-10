#!/usr/bin/env python3
"""Exact long-run cubic fluctuation rate of the original source and URT binary chronology.

All amplitudes and temporal coefficients are computed in Q(sqrt(5)).
No measured value, ARF coefficient, adjustable parameter or guessed tail is an input.
"""
import io,contextlib,runpy
from pathlib import Path
from fractions import Fraction as F
import sympy as sp

root=Path(__file__).resolve().parent
forward=next((p for p in (root.parent/'forward', root.parent/'URT_ARF_GITHUB_UPLOAD_2026_11_10/forward') if (p/'URT_EXACT_SOURCE_WALSH_CORRELATIONS_2026-11-09.py').exists()),None)
assert forward is not None, 'original archived forward source not found alongside analysis'
with contextlib.redirect_stdout(io.StringIO()):
    s=runpy.run_path(str(forward/'URT_EXACT_SOURCE_WALSH_CORRELATIONS_2026-11-09.py'))
    a=runpy.run_path(str(root/'URT_A4_SCALAR_CUMULANTS_2026_11_10.py'))
Q5=s['Q5'];Z=Q5();E=s['E'];P5=s['P5']
compose=a['compose'];Vs=a['Vs'];proper=a['proper'];faces=a['faces'];faceid=a['faceid'];N=64

def inv(g):return tuple(g.index(i) for i in range(12))
def mean(v):return sum(v,Z)/64
def mapQ(v):return [(v[2*i%64]+v[(2*i+1)%64])/2 for i in range(64)]
def dot(v,w):return mean([x*y for x,y in zip(v,w)])
def qpow(v,n):
    for _ in range(n):v=mapQ(v)
    return v

def calc(g):
    assert mean(g)==Z
    g2=[x*x for x in g]
    g3=[x*x*x for x in g]
    Qg=[qpow(g,k) for k in range(7)]
    Qg2=[qpow(g2,k) for k in range(7)]
    assert all(x==Z for x in Qg[5]), 'g must have no 0,1-Walsh terms'
    sum_repeated=Z
    sum_distinct=Z
    for d in range(1,6):
        sum_repeated+=dot(g2,Qg[d])+dot(g,Qg2[d])
    for aa in range(1,6):
        for bb in range(1,6):
            f=[x*y for x,y in zip(g,Qg[bb])]
            sum_distinct+=dot(g,qpow(f,aa))
    return mean(g3),sum_repeated,sum_distinct,mean(g3)+3*sum_repeated+6*sum_distinct,mean(g2)+2*sum(dot(g,Qg[d]) for d in range(1,6))

res=[]
for V in Vs:
    normalizer=[g for g in proper if frozenset(compose(compose(g,x),inv(g)) for x in V)==V]
    assert len(normalizer)==12
    A=sp.zeros(20,20)
    for g in normalizer:
        M=sp.zeros(20,20)
        for i,face in enumerate(faces):
            M[faceid[frozenset(g[j] for j in face)],i]=1
        A+=M/12
    vac=P5*A*P5
    assert vac.trace()==1 and vac*vac==vac
    t=next(vac[:,i] for i in range(20) if vac[:,i]!=sp.zeros(20,1))
    r2=sum(x*x for x in t)
    tt=[Q5(F(int(v.p),int(v.q))) for v in t]
    g=[sum((tt[j]*e[j] for j in range(20)),Z) for e in E]
    m3,repeated,distinct,cub,second=calc(g)
    m2=mean([x*x for x in g])/Q5(F(r2))
    m3sq=m3*m3/Q5(F(r2**3))
    csq=cub*cub/Q5(F(r2**3))
    assert m2==Q5(F(7,4))
    assert m3sq==Q5(F(27,10))
    res.append((m3,repeated,distinct,cub,csq,r2,second,t))
for i,(m3,rep,dist,cub,csq,r2,second,t) in enumerate(res):
    # a normalized scalar is the unnormalized column dot source / sqrt(r2).
    magnitude=float(cub)/(float(r2)**1.5)
    print('tetrahedron',i,'||t||^2',r2,'one-time cubic',m3,'repeated',rep,'distinct',dist,'total exact raw',cub)
    print('  normalized asymptotic third cumulant',magnitude,'square exactly',csq)
    print('  normalized asymptotic quadratic cumulant',second/Q5(F(r2)),'=',float(second/Q5(F(r2))))
assert len(res)==5
print('PASS exact Q(sqrt5) triple-time cumulants; no parameter fitting')

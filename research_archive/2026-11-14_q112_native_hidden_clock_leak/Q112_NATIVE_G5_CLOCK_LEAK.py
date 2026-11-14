#!/usr/bin/env python3
"""Q112 actual Q77 selected 24-clock and Q82 native A5/U_h/P5 leakage.

Rigorous Fraction witness based on Q77 Krawczyk t_x intervals, with
operator-norm propagation bound. No synthetic history or fitted ARF.
"""
from fractions import Fraction as Fr
from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
from itertools import combinations
import runpy
import numpy as np
import sympy as sp
ARCH=Path(__file__).resolve().parents[1]
with redirect_stdout(StringIO()):
    Q=runpy.run_path(str(ARCH/'2026-11-13_q77_exact_clock_split'/'Q77_EXACT_CLOCK_SPLIT_CERTIFICATE.py'))
T=Q['G']
native=T['G']
perms=native['perms'];index=native['index'];ns=native['ns']
D0=(0,2,4,6,10,9)
assert len(perms)==60 and D0 in Q['RHO']
t=[];err=Fr(0)
for x in range(32):
    lo,hi=Q['Fenc'][(x,Q['RHO'][D0][x])]
    assert 0<lo<=hi<Fr(1,2)
    z=Fr(round((lo+hi)*2**59),2**60)
    t.append(z)
    err=max(err,abs(lo-z),abs(hi-z))
assert err<Fr(1,10**14) and all(0<v<Fr(1,2) for v in t)
pairs,faces=ns.pairs,ns.faces
verts=sorted({v for f in faces for v in f})
C=sp.Matrix([[int(v in f) for v in verts] for f in faces])
assert C.shape==(20,12) and C.rank()==12
Ph=sp.eye(20)-C*(C.T*C).inv()*C.T
L=sp.Matrix(20,20,lambda a,b:3*int(a==b)-int(len(set(faces[a])&set(faces[b]))==2))
P5=Ph*(L-3*sp.eye(20))/2
Mh=sp.Matrix([[int(set(f)<={pairs[k][(h>>k)&1] for k in range(6)}) for f in faces] for h in range(64)])
G5=Mh*P5*Mh.T/2
assert G5.T==G5 and G5*G5==G5 and sp.trace(G5)==4
masks=[(1<<a)|(1<<b) for a,b in combinations(range(6),2)]
Walsh=sp.Matrix([[(-1)**((h&m).bit_count()) for m in masks] for h in range(64)])
assert Walsh*Walsh.T*G5==64*G5
def d(v):
    out=[Fr(0)]*64
    for x,z in enumerate(t):
        a,b=2*x,2*x+1
        out[x]=v[x]-z*v[a]-(1-z)*v[b]
        out[x+32]=v[x+32]-(1-z)*v[a]-z*v[b]
    return out
B=np.zeros((64,64),float)
for x,z in enumerate(t):
    a,b=2*x,2*x+1
    B[x,a]=B[x+32,b]=float(z)
    B[x,b]=B[x+32,a]=1-float(z)
assert np.max(abs(B.sum(0)-1))<1e-12 and np.max(abs(B.sum(1)-1))<1e-12
Ah=(np.eye(64)-B).T@(np.eye(64)-B)
idx=np.array([index(h,D0) for h in range(64)],int)
assert set(idx)==set(range(64))
Y=np.zeros((64,64))
Y[np.ix_(idx,idx)]=Ah
Abar=sum(Y[np.ix_(p,p)] for p in perms)/60.
P=np.array(G5,float)
off=(np.eye(64)-P)@Abar@P
i,j=np.unravel_index(np.argmax(abs(off)),off.shape)
assert abs(off[i,j])>1e-9,(i,j,off[i,j])
def F(q):
    a,b=sp.fraction(sp.Rational(q))
    return Fr(int(a),int(b))
xc=[Fr(int(k==i))-F(G5[k,i]) for k in range(64)]
yc=[F(G5[k,j]) for k in range(64)]
result=Fr(0)
for p in perms:
    xa=[Fr(0)]*64;ya=[Fr(0)]*64
    for k in range(64):
        xa[int(p[k])]=xc[k];ya[int(p[k])]=yc[k]
    xh=[xa[int(idx[h])] for h in range(64)]
    yh=[ya[int(idx[h])] for h in range(64)]
    result+=sum(u*v for u,v in zip(d(xh),d(yh)))
result/=60
assert abs(float(result)-off[i,j])<1e-10
# Q77 enclosures bound every native B entry by err. There are exactly
# 128 nonzeros; true/approx B are doubly stochastic and norm <=1.
# Thus norm(Atrue-Aapprox) <=4 sqrt(128) err <48 err.
# Dictionary and twirl are orthogonal, G5 and I-G5 projectors.
bound=48*err
lower=abs(result)-bound
assert lower>0,(i,j,result,bound)
print('ORIGINAL native hidden G5 rank',int(sp.trace(G5)))
print('Q77 rigorously selected clock dictionary',D0)
print('CERTIFIED A5 offblock entry row/col',i,j)
print('exact rational surrogate witness',str(result))
print('decimal witness',float(result),'worst error',float(bound))
print('rigorous |offblock| lower bound',float(lower))
print('Hence (I-G5)(H_bits+c*Abar)G5 nonzero for EVERY c>0')
print('Q112 ORIGINAL 24-CLOCK A5 QUARTET SOURCE LEAKAGE: PASS')

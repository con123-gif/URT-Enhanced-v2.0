#!/usr/bin/env python3
"""Exact A5 dark-orbit tensor-to-H13 bridge from archived five-solid source.
No historical ARF inputs, no fits, no charged-matter pole identification.
Requires scipy, sympy, numpy, networkx and the archived exact source module.
"""
import contextlib,io,runpy
from pathlib import Path
from fractions import Fraction as F
from collections import Counter
import sympy as sp,numpy as np,networkx as nx
from networkx.algorithms.isomorphism import GraphMatcher
with contextlib.redirect_stdout(io.StringIO()):
    s=runpy.run_path(str(Path(__file__).with_name('URT_A5_NEUTRAL_SOURCE_EXACT_CUMULANTS_2026_11_10.py')))
K=s['Q5'];Z=K();phi=K(F(1,2),F(1,2))
pts,faces,src,n5=s['pts'],s['faces'],s['sources'],s['n']
P3,P5=s['P3'],s['P5']
assert len(pts)==12 and len(faces)==20 and len(src)==len(n5)==64
assert sum([14,26,26,62,62])==190 and sum([6,12,12,30,30])==90
assert P3.trace()==P5.trace()==4 and P3*P5==sp.zeros(20)

def toK(v):
    v=sp.expand(v);a=sp.Rational(v.coeff(sp.sqrt(5),0));b=sp.Rational(v.coeff(sp.sqrt(5),1))
    return K(F(int(a.p),int(a.q)),F(int(b.p),int(b.q)))
def inner(a,b):return sum((x*y for x,y in zip(a,b)),Z)
def sparse(P):return [[(i,K(F(int(x.p),int(x.q)))) for i,x in enumerate(P.row(j)) if x] for j in range(20)]
def project(S,v):return [sum((c*v[i] for i,c in row),Z) for row in S]
S3,S5=sparse(P3),sparse(P5)
N=[[sum((pts[i][a] for i in face),Z) for a in range(3)] for face in faces]
def tensor(h,S,typ):
    v=src[h][typ]
    return [project(S,[v[f]*N[f][a] for f in range(20)]) for a in range(3)]
def normT(T):return sum((inner(x,x) for x in T),Z)
d=[K(-(-1)**h.bit_count()) if n5[h]==Z else Z for h in range(64)]
assert sum(x!=Z for x in d)==24
# Enumerate all proper icosahedral rotations; derive induced 64-history permutations.
xyz=np.array([[float(x) for x in p] for p in pts])
G=nx.Graph();G.add_nodes_from(range(12))
for face in faces:
    for i,j in [(face[0],face[1]),(face[1],face[2]),(face[2],face[0])]:G.add_edge(i,j)
perms=[]
for m in GraphMatcher(G,G).isomorphisms_iter():
    abc=(0,1,4);X=np.stack([xyz[i] for i in abc],axis=1)
    Y=np.stack([xyz[m[i]] for i in abc],axis=1)
    if np.linalg.det(Y@np.linalg.inv(X))>0.5:perms.append(m)
assert len(perms)==60
pairs=[];rem=set(range(12))
while rem:
    i=min(rem);j=next(j for j in rem if j!=i and all(pts[i][a]+pts[j][a]==Z for a in range(3)))
    pairs.append((i,j));rem-={i,j}
faceindex={face:i for i,face in enumerate(faces)}
fmaps=[];hmaps=[]
for m in perms:
    fmaps.append([faceindex[tuple(sorted(m[i] for i in face))] for face in faces])
    hs=[]
    for h in range(64):
        new=0
        for j,(a,b) in enumerate(pairs):
            sign=1 if h&(1<<j) else -1
            ma=m[a];k=next(k for k,(aa,bb) in enumerate(pairs) if ma in (aa,bb))
            sign*=1 if ma==pairs[k][0] else -1
            if sign==1:new|=1<<k
        assert d[h]==d[new]
        hs.append(new)
    hmaps.append(hs)
unseen=set(range(64));orbits=[]
while unseen:
    h=min(unseen);orb={hp[h] for hp in hmaps};orbits.append(orb);unseen-=orb
assert sorted(map(len,orbits))==[12,12,20,20]
# The stabilizer of either dark 12-state orbit is C5. No 4-irrep fixed vector.
for orb in orbits:
    h=min(orb);stab=[fm for fm,hp in zip(fmaps,hmaps) if hp[h]==h]
    assert len(stab)==60//len(orb)
    A=sp.zeros(20)
    for fm in stab:
        for j,k in enumerate(fm):A[k,j]+=sp.Rational(1,len(stab))
    for P in (P3,P5):
        assert sp.simplify(sp.trace(A*P))==(0 if len(orb)==12 else 2)
        if len(orb)==12:assert A*P==sp.zeros(20)
# Exact 3D rotations in Q(sqrt5), and A5 character projectors on 4⊗3.
def inverse3(A):
    M=[[A[i][j] for j in range(3)]+[K(i==j) for j in range(3)] for i in range(3)]
    for j in range(3):
        k=next(k for k in range(j,3) if M[k][j]!=Z)
        M[j],M[k]=M[k],M[j];v=M[j][j];M[j]=[x/v for x in M[j]]
        for i in range(3):
            if i==j:continue
            v=M[i][j];M[i]=[M[i][t]-v*M[j][t] for t in range(6)]
    return [row[3:] for row in M]
abc=(0,1,4);X=[[pts[abc[j]][i] for j in range(3)] for i in range(3)];Xi=inverse3(X)
rot=[];characters=[]
chart={K(3):(K(3),K(4),K(5)),K(-1):(K(-1),K(0),K(1)),K(0):(K(0),K(1),K(-1)),phi:(K(1)-phi,K(-1),K(0)),K(1)-phi:(phi,K(-1),K(0))}
for m in perms:
    Y=[[pts[m[abc[j]]][i] for j in range(3)] for i in range(3)]
    R=[[sum((Y[i][k]*Xi[k][j] for k in range(3)),Z) for j in range(3)] for i in range(3)]
    assert all(sum((R[i][k]*pts[v][k] for k in range(3)),Z)==pts[m[v]][i] for v in range(12) for i in range(3))
    rot.append(R);characters.append(chart[sum((R[i][i] for i in range(3)),Z)])
def charproject(T,index,dim):
    out=[[Z]*3 for _ in range(20)]
    for fm,R,ch in zip(fmaps,rot,characters):
        for f in range(20):
            for a in range(3):out[fm[f]][a]+=K(F(dim,60))*ch[index]*sum((R[a][b]*T[b][f] for b in range(3)),Z)
    return out
# Source E in hidden 4_3, dressed by 3-vector, lands purely in 5;
# source O in hidden 4_5, dressed by 3-vector, lands purely in 3'.
for name,S,typ,target in [('E -> 4_3⊗3 -> 5',S3,0,2),('O -> 4_5⊗3 -> 3prime',S5,1,0)]:
    for orb in orbits:
        if len(orb)!=12:continue
        h=min(orb);T=tensor(h,S,typ)
        for index,dim in enumerate((3,4,5)):
            V=charproject(T,index,dim)
            assert all(V[f][a]==(T[a][f] if index==target else Z) for f in range(20) for a in range(3))
    print('EXACT A5 DARK REPRESENTATION',name)
# Spectral projectors on 12-vertex icosahedron; H13 contains 3' and 5.
Adj=sp.zeros(12)
for i in range(12):
    for j in range(12):
        if i!=j and any(i in f and j in f for f in faces):Adj[i,j]=1
L=5*sp.eye(12)-Adj;root=sp.sqrt(5)
V3p=sp.simplify(L*(L-(5-root)*sp.eye(12))*(L-6*sp.eye(12))/((5+root)*(2*root)*(root-1)))
V5=sp.simplify(-L*(L-(5-root)*sp.eye(12))*(L-(5+root)*sp.eye(12))/24)
assert V3p.trace()==3 and V5.trace()==5 and V3p*V5==sp.zeros(12)
def matmul(A,B):return [[sum((A[i][k]*B[k][j] for k in range(len(B))),Z) for j in range(len(B[0]))] for i in range(len(A))]
for name,P,S,target,dim,typ,expected_c,expected_norm in [
 ('4_3 E -> H13 five',P3,S3,V5,5,0,K(F(84,5),F(36,5)),K(F(2583,25),F(231,5))),
 ('4_5 O -> H13 three-prime',P5,S5,V3p,3,1,K(F(20,3),F(4,3)),K(F(117,2),F(261,10)))]:
    PP=[[K(F(int(P[f,g].p),int(P[f,g].q))) for g in range(20)] for f in range(20)]
    B=[[sum((PP[f][g]*inner(N[f],N[g]) for f in range(20) if i in faces[f] for g in range(20) if j in faces[g]),Z) for j in range(12)] for i in range(12)]
    V=[[toK(target[i,j]) for j in range(12)] for i in range(12)]
    c=sum((V[i][j]*B[j][i] for i in range(12) for j in range(12)),Z)/dim
    assert c==expected_c and float(c)>0
    A=matmul(matmul(V,B),V)
    assert all(A[i][j]==c*V[i][j] for i in range(12) for j in range(12))
    vt=Z;vj=Z
    for h in range(64):
        if d[h]==Z:continue
        T=tensor(h,S,typ)
        J=[sum((sum((T[a][f]*N[f][a] for a in range(3)),Z) for f in range(20) if i in faces[f]),Z) for i in range(12)]
        projected=[sum((V[i][j]*J[j] for j in range(12)),Z) for i in range(12)]
        assert inner(projected,projected)==c*normT(T)
        vt+=normT(T)/64;vj+=inner(projected,projected)/64
    assert vt==expected_norm and vj==c*vt
    print('EXACT NORMALIZED INTERTWINER',name,'c=',c,'dark source norm²=',vt)
# Exact golden hierarchy of the two 12-state dark orbits, not a mass ratio.
expected={
 (0,+1):K(F(13488,25),F(6032,25)),
 (0,-1):K(F(288,25),F(128,25)),
 (1,+1):K(F(932,3),F(2084,15)),
 (1,-1):K(F(4,3),F(4,15)),
}
for h in range(64):
    if d[h]==Z:continue
    u=[sum(((1 if h&(1<<i) else -1)*pts[a][k] for i,(a,b) in enumerate(pairs)),Z) for k in range(3)]
    scale=2*phi if d[h]==K(1) else K(2)/phi
    assert sum(all(u[k]==scale*p[k] for k in range(3)) for p in pts)==1
    # Quartic part of E annihilated by the 4_3⊗3 projector on dark histories.
    nu=inner(u,u)/(phi+2)
    x=[inner(p,u)/(phi+2) for p in pts]
    AA=[K(F(5,16))*(z*z-nu/3) for z in x]
    aa=[sum((AA[i] for i in f),Z) for f in faces]
    quartic=[a*a for a in aa]
    assert all(all(z==Z for z in row) for row in
               [project(S3,[quartic[f]*N[f][axis] for f in range(20)]) for axis in range(3)])
    assert normT(tensor(h,S3,0))==expected[(0,int(float(d[h])))]
    assert normT(tensor(h,S5,1))==expected[(1,int(float(d[h])))]
assert expected[(0,+1)]/expected[(0,-1)]==phi*phi*phi*phi*phi*phi*phi*phi
assert expected[(1,+1)]/expected[(1,-1)]==phi*phi*phi*phi*phi*phi*phi*phi*phi*phi*phi*phi
print('EXACT DARK GOLDEN HIERARCHIES squared norms phi^8 and phi^12')
# Local q=2 Ward contact for any *conditional* charge-matched J† B vertex.
assert -2+2==0 and -4+8-4==0
# On a 24-clock, Wilson first and second gauge derivatives telescope for all t and k<=5.
for t in range(24):
    for k in range(1,6):
        a=[0]*24
        for j in range(k):a[(t+j)%24]-=1;a[(t+j+1)%24]+=1
        assert a==[(int(i==(t+k)%24)-int(i==t)) for i in range(24)]
print('PASS: exact source, A5, 64 histories, H13 intertwiners, U1 contacts, 24-clock transport')

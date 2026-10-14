#!/usr/bin/env python3
"""Independent exact rational Newton–Platonic five-cube spectral-filter theorem.

Reconstructs 20-vertex dodecahedral graph and five embedded cube
vertex/face incidence matrices. Requires SymPy; no URT/Cathedral inputs.
"""
import sympy as S
nb=[
[8,12,16],[9,12,17],[10,13,16],[11,13,17],
[8,14,18],[9,14,19],[10,15,18],[11,15,19],
[0,4,10],[1,5,11],[2,6,8],[3,7,9],
[0,1,14],[2,3,15],[4,5,12],[6,7,13],
[0,2,17],[1,3,16],[4,6,19],[5,7,18]]
faces=[
[(0,1,2,3),(0,1,4,5),(0,2,4,6),(1,3,5,7),(2,3,6,7),(4,5,6,7)],
[(0,9,14,17),(0,10,13,17),(0,10,14,18),(7,9,13,17),(7,9,14,18),(7,10,13,18)],
[(1,8,14,16),(1,11,13,16),(1,11,14,19),(6,8,13,16),(6,8,14,19),(6,11,13,19)],
[(2,8,12,17),(2,8,15,18),(2,11,15,17),(5,8,12,18),(5,11,12,17),(5,11,15,18)],
[(3,9,12,16),(3,9,15,19),(3,10,15,16),(4,9,12,19),(4,10,12,16),(4,10,15,19)]
]
A=S.zeros(20)
for i,neighbors in enumerate(nb):
    assert len(neighbors)==3
    for j in neighbors: A[i,j]=1
assert A==A.T
L=3*S.eye(20)-A
projectors=[];M=S.zeros(20,5)
for j,ff in enumerate(faces):
    verts=sorted({v for face in ff for v in face})
    assert len(verts)==8 and len(ff)==6
    for v in verts:M[v,j]=1
    C=S.zeros(8,6);pos={v:i for i,v in enumerate(verts)}
    for k,face in enumerate(ff):
        for v in face:C[pos[v],k]=1
    H=S.Matrix.hstack(*C.T.nullspace())
    assert H.shape==(8,4)
    plocal=H*(H.T*H).inv()*H.T
    p=S.zeros(20)
    for u,v in enumerate(verts):
        for w,t in enumerate(verts):p[v,t]=plocal[u,w]
    assert p*p==p and p.T==p and p.trace()==4
    projectors.append(p)
Pm=sum(projectors,S.zeros(20))/5
assert M.T*M==6*S.eye(5)+2*S.ones(5)
assert M*S.ones(5,1)==2*S.ones(20,1)
assert A*M==2*(S.ones(20,5)-M)
assert L*M==5*M-2*S.ones(20,5)
x=S.symbols("x")
f=-x*(x*x-7*x+13)*(x*x-6*x+4)/60
pol=S.Poly(f,x);T=S.eye(20);F=S.zeros(20)
for k in range(6):
    F+=pol.nth(k)*T
    T=T*L
assert F==Pm
assert Pm.eigenvals()=={S.Rational(0):7,S.Rational(1,4):8,S.Rational(2,5):5}
assert all((projectors[j]*projectors[k]).trace()==S.Rational(5,8)
           for j in range(5) for k in range(j+1,5))
Lc=16*S.eye(20)-M*M.T  # weighted cube-overlap graph
assert L*Lc==Lc*L
joint=S.factor((L+Lc).charpoly(x).as_expr())
assert joint==x*(x-15)**4*(x-18)**5*(x-19)**4*(x*x-38*x+356)**3
perm=[1,3,0,2,5,7,4,6,10,8,11,9,18,19,16,17,15,14,13,12]
D=S.zeros(20)
for j,i in enumerate(perm):D[i,j]=1
assert D**4==S.eye(20) and D*Pm*D.T==Pm
Q=D*L*D.T-L
assert Q.rank()==6 and S.trace(Q*Q)==120
assert Q==-L*(L-2*S.eye(20))*(L-3*S.eye(20))*(L-5*S.eye(20))/2
print("EXACT PASS: five cube face-incidence kernel spectral-filter theorem")
print("Average projector =",S.factor(f))
print("Spectrum:",Pm.eigenvals())
print("Pair projector overlaps: 5/8")
print("Joint weighted graph polynomial:",joint)
print("Doubling spectral defect: rank 6, norm squared 120")

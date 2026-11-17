#!/usr/bin/env python3
"""Exact source-selected generation localizer from ORIGINAL icosahedral Q101
downstream of the full five-solid 190-cochain 50->8->12 source.
Computes the true native 20-face incidence and hidden 4_3/4_5 projector.
This is NOT an observed physical Yukawa operator.
"""
import sympy as sp
import numpy as np
from itertools import combinations,product
phi=(1+sp.sqrt(5))/2
v=sp.Matrix([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]
 +[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]
 +[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
edges=[(i,j) for i,j in combinations(range(12),2)
 if sp.simplify(sum((v[i,k]-v[j,k])**2 for k in range(3)))==4]
faces=[t for t in combinations(range(12),3) if all(z in edges for z in combinations(t,2))]
assert len(edges)==30 and len(faces)==20
C=sp.Matrix(20,12,lambda i,j:int(j in faces[i]))
L=sp.Matrix(20,20,lambda i,j:3 if i==j else
          (-1 if len(set(faces[i])&set(faces[j]))==2 else 0))
Ph=sp.eye(20)-C*(C.T*C).inv()*C.T
P3=Ph*(5*sp.eye(20)-L)/2
P5=Ph*(L-3*sp.eye(20))/2
assert sp.simplify(P3*P5)==sp.zeros(20)
K=C.T*(P3.multiply_elementwise(P5))*C
assert K==K.T and all(q.is_Rational for q in K)
x=sp.symbols('x')
assert sp.factor(K.charpoly(x).as_expr())==x**6*(45*x*x-30*x+1)**3/sp.Integer(91125)
ground=[]
for mask in range(4096):
    s=[1-2*((mask>>k)&1) for k in range(12)]
    if sum(s)==4 and sum(s[i]*s[j] for i,j in edges)==-6:
        ground.append((mask,s))
assert len(ground)==30
expected=x**2*(90*x*x-51*x+1)*(90*x*x-39*x+1)*(180*x*x-60*x+1)/sp.Integer(1458000)
for mask,s in ground:
    sel=[j for j in range(12) if s[j]==1]
    assert sp.factor(K.extract(sel,sel).charpoly(x).as_expr())==expected,mask
mask,s=ground[0]
N=sp.diag(*[(1+z)//2 for z in s])
lam_lo=(5-2*sp.sqrt(5))/15
lam_hi=(5+2*sp.sqrt(5))/15
Plo=sp.simplify((K*K-lam_hi*K)/(lam_lo*(lam_lo-lam_hi)))
Phi=sp.simplify((K*K-lam_lo*K)/(lam_hi*(lam_hi-lam_lo)))
assert sp.simplify(Plo*Phi)==sp.zeros(12)
Y=sp.simplify(Plo*N*Phi)
YY=sp.simplify(Y.T*Y)
assert (YY*YY-YY/sp.Integer(20)).applyfunc(sp.simplify)==sp.zeros(12)
assert sp.simplify(sp.trace(YY))==sp.Rational(1,10)
assert Y.rank()==2
KL=np.array(K,float); vals,U=np.linalg.eigh(KL)
Ulo=U[:,(vals>1e-8)&(vals<.1)]
Uhi=U[:,vals>.1]
assert Ulo.shape==Uhi.shape==(12,3)
for othermask,spin in ground:
    n=np.diag([(1+z)//2 for z in spin])
    singular=np.linalg.svd(Ulo.T@n@Uhi,compute_uv=False)
    assert np.allclose(singular,[1/np.sqrt(20),1/np.sqrt(20),0],rtol=0,atol=2e-14),(othermask,singular)
print('Q161 exact 30 ground occupancy localizers, common polynomial:',sp.factor(expected),flush=True)
print('Q161 rank-two chiral bridge: singular values (1/sqrt20,1/sqrt20,0), exact; 30/30 checks',flush=True)
print('Q161 no physical Yukawa or nonzero third mass derived from conditional localizer',flush=True)

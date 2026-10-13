"""Exact 13-cell hidden-response calculation using the positive-history semigroup.

Scope: A5-equivariant finite graph transfer. No astrophysical length or stress
coupling is postulated or fitted. This demonstrates a nonzero hidden correlation
response that a static single scalar-field no-go does not test.
"""
from __future__ import annotations
import math
import numpy as np
from numpy.linalg import eigh, norm
from scipy.linalg import expm

phi=(1+math.sqrt(5))/2
Delta=3/20-80*math.pi/(1053*phi)
eta=-math.log(Delta)

verts=[]
for a in (-1,1):
    for b in (-1,1):
        verts.extend([(0,a,b*phi),(a,b*phi,0),(b*phi,0,a)])
v=np.array(verts,float)
v/=norm(v,axis=1)[:,None]
adj=np.zeros((12,12))
for i in range(12):
    for j in range(i+1,12):
        if abs(v[i]@v[j] - 1/math.sqrt(5)) < 1e-12:
            adj[i,j]=adj[j,i]=1
assert np.allclose(adj.sum(axis=1),5)

def L(w:float)->np.ndarray:
    A=np.zeros((13,13)); A[0,1:]=w; A[1:,0]=w; A[1:,1:]=adj
    return np.diag(A.sum(axis=0))-A

L0=L(1)
eigen=np.linalg.eigvalsh(L0)
known=np.array([0]+[6-math.sqrt(5)]*3+[7]*5+[6+math.sqrt(5)]*3+[13])
assert np.allclose(eigen,known,atol=1e-12), (eigen,known)

# Full-shell A5 projector to the residual triplet 3 prime, lifted to 13 sites.
I3=np.eye(3)
Qs=[np.diag([1.,-1.,0.]),np.diag([1.,1.,-2.]),
 np.array([[0,1,0],[1,0,0],[0,0,0]]),
 np.array([[0,0,1],[0,0,0],[1,0,0]]),
 np.array([[0,0,0],[0,0,1],[0,1,0]])]
M=np.column_stack([np.ones(12),v]+[np.einsum('ia,ab,ib->i',v,Q,v) for Q in Qs])
U,S,Vh=np.linalg.svd(M,full_matrices=True)
P3p=np.zeros((13,13)); P3p[1:,1:]=np.eye(12)-U[:,:9]@U[:,:9].T
assert abs(np.trace(P3p)-3)<1e-12
assert norm(P3p@L0-(6+math.sqrt(5))*P3p)<1e-12

# A central perturbation has no 3prime expectation at linear order.
centre=np.zeros(13);centre[0]=1
assert norm(P3p@centre)<1e-12
J=L(1.000001)-L(1)
J/=1e-6
assert norm(P3p@J@P3p-P3p)<1e-8

# Despite no linear 3prime excitation of the mean, the same isotropic
# centre-to-shell edge weight shifts its fluctuation spectrum.
lam3p=6+math.sqrt(5)
chi=3/lam3p**2
cov=3/lam3p
for w in (0.8,1.0,1.2):
    lam=5+w+math.sqrt(5)
    m=np.trace(P3p @ np.linalg.pinv(L(w)))
    assert abs(m-3/lam)<1e-12
    # Positive reversible transfer for every nonnegative t.
    T=expm(-0.25*L(w))
    assert np.linalg.eigvalsh(T).min()>=-1e-12
    assert norm(P3p@T@P3p - math.exp(-.25*lam)*P3p)<1e-12

eps=1e-5
fd=(np.trace(P3p@np.linalg.pinv(L(1+eps)))-np.trace(P3p@np.linalg.pinv(L(1-eps))))/(2*eps)
assert abs(fd+chi)<1e-10

# A5-isotropic quadratic hidden response; Gaussian closure is explicitly
# CONDITIONAL, not a physical identification.
# For 3 independent unit-temperature OU coordinates, E[h^2]=3/lambda.
# d E[h^2]/dw=-3/lambda^2 <0, even with mean h=0.
# Time-memory kernel C_h(t)=3 e^{-lambda*t}/lambda, finite integral 3/lambda^2.
print('13-cell Laplacian eigenvalues:',np.array2string(eigen,precision=10))
print('hidden 3prime mean from central invariant source:',norm(P3p@centre))
print('hidden mode eigenvalue:',f'{lam3p:.12g}')
print('hidden static Gaussian variance 3/lambda:',f'{cov:.12g}')
print('hidden edge susceptibility -3/lambda^2:',f'{-chi:.12g}')
print('finite-difference hidden susceptibility:',f'{fd:.12g}')
print('integrated time-memory covariance:',f'{chi:.12g}')
print('reference fixed Cathedral Delta:',f'{Delta:.15g}')
print('reference eta:',f'{eta:.15g}')
print('PASS: exact A5 graph, positive history transfer and hidden susceptibility')

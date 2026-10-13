"""13-cell stress tensor channel reconstruction and exact spectrum (2026-10-13).

The icosahedral shell 1+3+3'+5 and centre 1 contain ten spatial
SO(3) stress-tensor component channels 1+1+3+5, plus a 3' residual.
No Lorentz boost action, stress conservation, matter coupling or GR
equation is established by this kinematic result.
"""
import numpy as np
from numpy.linalg import norm, matrix_rank
phi=(1+np.sqrt(5))/2
raw=[]
for a in (-1,1):
    for b in (-1,1):
        raw.extend([(0,a,b*phi),(a,b*phi,0),(b*phi,0,a)])
v=np.array(raw,float)
n=v/np.linalg.norm(v,axis=1,keepdims=True)
I=np.eye(3)
assert np.allclose(n.sum(axis=0),0)
assert np.allclose(n.T@n,4*I)
STF=[np.diag([1.,-1.,0.]),np.diag([1.,1.,-2.]),
     np.array([[0,1,0],[1,0,0],[0,0,0]],float),
     np.array([[0,0,1],[0,0,0],[1,0,0]],float),
     np.array([[0,0,0],[0,0,1],[0,1,0]],float)]
M=np.column_stack([np.ones(12),n]+[
    np.einsum("ja,ab,jb->j",n,Q,n) for Q in STF])
assert matrix_rank(M)==9
rng=np.random.default_rng(1729)
for _ in range(50):
    f=rng.standard_normal(12)
    scalar=f.mean()
    vector=n.T@f/4
    raw2=np.einsum("j,ja,jb->ab",f,n,n)
    Q=5/8*(raw2-np.trace(raw2)/3*I)
    rebuilt=scalar+n@vector+np.einsum("ja,ab,jb->j",n,Q,n)
    residual=f-rebuilt
    assert abs(residual.sum())<1e-12
    assert norm(n.T@residual)<1e-12
    assert all(abs(np.einsum("j,ja,ab,jb->",residual,n,S,n))<1e-12
               for S in STF)
    assert np.allclose(rebuilt,M@np.linalg.lstsq(M,f,rcond=None)[0])
# The same projection blocks diagonalize the centred 13-site graph.
A=np.zeros((12,12))
for i in range(12):
    for j in range(i+1,12):
        if np.isclose(v[i]@v[j],phi):
            A[i,j]=A[j,i]=1
assert np.allclose(A.sum(axis=0),5)
Lshell=6*np.eye(12)-A
assert norm(Lshell@n-(6-np.sqrt(5))*n)<1e-10
for S in STF:
    f=np.einsum("ja,ab,jb->j",n,S,n)
    assert norm(Lshell@f-7*f)<1e-10
U,_,_=np.linalg.svd(M,full_matrices=True)
P3prime=np.eye(12)-U[:,:9]@U[:,:9].T
assert matrix_rank(P3prime,tol=1e-10)==3
assert norm(Lshell@P3prime-(6+np.sqrt(5))*P3prime)<1e-10
print("PASS: 13=2 scalar + 3 vector + 5 STF + 3prime")
print("Shell reconstruction rank",matrix_rank(M))
print("Spectrum: scalar 0,13; vector",6-np.sqrt(5),
      "STF 7; 3prime",6+np.sqrt(5))

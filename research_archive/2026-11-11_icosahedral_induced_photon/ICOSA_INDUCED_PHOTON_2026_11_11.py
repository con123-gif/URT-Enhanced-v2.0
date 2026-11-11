#!/usr/bin/env python3
"""Induced photon kernel of charged hopping matter on the icosahedron (no inserted parameters).

Tree level (archived, exact): the Maxwell form on the icosahedron's 30 links is M = d1^T d1; its nonzero
spectrum is that of the dual-dodecahedron Laplacian, so 15 Tr M^+ = 15 Tr L_dual^+ = 137.
Matter: unit-charge fermions hopping on the 12 vertices, H(theta) = adjacency with Peierls phases.
Induced action Gamma = -log|det H(theta)| (scale-free). Pi = Hessian at theta = 0.
Question: on the 19 physical flux modes, how does Pi compare with M, sector by sector (A5 irreps)?
"""
import itertools, json, math, sys
import numpy as np
phi=(1+5**.5)/2
V=np.array([(0,a,b*phi) for a in(-1,1) for b in(-1,1)]+[(a,b*phi,0) for a in(-1,1) for b in(-1,1)]+[(a*phi,0,b) for a in(-1,1) for b in(-1,1)],float)
n=12; dist=np.linalg.norm(V[:,None]-V[None],axis=2)
E=[(i,j) for i in range(n) for j in range(i+1,n) if abs(dist[i,j]-2)<1e-9]; assert len(E)==30
F=[f for f in itertools.combinations(range(n),3) if all(abs(dist[a,b]-2)<1e-9 for a,b in itertools.combinations(f,2))]; assert len(F)==20
eidx={e:k for k,e in enumerate(E)}
d0=np.zeros((30,12)); 
for k,(i,j) in enumerate(E): d0[k,i],d0[k,j]=-1,1
d1=np.zeros((20,30))
for r,f in enumerate(F):
    P=V[list(f)]; c=P.mean(0)
    if np.dot(np.cross(P[1]-P[0],P[2]-P[0]),c)<0: f=(f[0],f[2],f[1])
    for a,b in zip(f,f[1:]+f[:1]): d1[r,eidx[(min(a,b),max(a,b))]]=1 if a<b else -1
assert np.allclose(d1@d0,0)
M=d1.T@d1
def H(th):
    h=np.zeros((n,n),complex)
    for k,(i,j) in enumerate(E): h[i,j]=np.exp(1j*th[k]); h[j,i]=np.exp(-1j*th[k])
    return h
def gamma(th): return -np.linalg.slogdet(H(th))[1]
def hess(f,m=30,h=1e-4):
    Hs=np.zeros((m,m)); z=np.zeros(m); f0=f(z)
    for a in range(m):
        for b in range(a,m):
            ea=np.zeros(m); eb=np.zeros(m); ea[a]=h; eb[b]=h
            Hs[a,b]=Hs[b,a]=(f(ea+eb)-f(ea-eb)-f(-ea+eb)+f(-ea-eb))/(4*h*h)
    return Hs
# analytic Hessian: Pi_lm = -d_lm Re Tr[G W_l] + Re Tr[G J_l G J_m]
G=np.linalg.inv(H(np.zeros(30))); J=[]; Wd=[]
for k,(i,j) in enumerate(E):
    Jk=np.zeros((n,n),complex); Jk[i,j]=1j; Jk[j,i]=-1j; J.append(Jk)
    Wk=np.zeros((n,n),complex); Wk[i,j]=-1; Wk[j,i]=-1; Wd.append(Wk)
Pi=np.array([[np.trace(G@J[a]@G@J[b]).real for b in range(30)] for a in range(30)])-np.diag([np.trace(G@Wd[a]).real for a in range(30)])
fd=hess(gamma); out={"hessian_fd_error":float(np.abs(fd-Pi).max())}
out["ward_norm"]=float(np.linalg.norm(Pi@d0))
w,U=np.linalg.eigh(M); B=U[:,w>1e-9]; assert B.shape[1]==19
mM=w[w>1e-9]; out["15_Tr_Mplus"]=float(15*np.sum(1/mM))
A=B.T@Pi@B; Mp=np.diag(mM)
T=B/np.sqrt(mM); kap=np.linalg.eigvalsh(T.T@Pi@T)
def levels(x): 
    r=np.round(x,9); return sorted((float(v),int((r==v).sum())) for v in set(r))
out["maxwell_levels(M)"]=levels(mM)
out["kappa_levels"]=levels(kap)
out["Pi_levels_physical"]=levels(np.linalg.eigvalsh(A))
out["commutator_Pi_M"]=float(np.linalg.norm(Pi@M-M@Pi))
# sea energy (half filling) Hessian for comparison
def sea(th): e=np.linalg.eigvalsh(H(th)); return e[e<0].sum()
Ps=hess(sea,h=1e-3); out["kappa_levels_sea_energy"]=levels(np.round(np.linalg.eigvalsh(T.T@Ps@T),6))
out["det_H0"]=float(np.linalg.det(H(np.zeros(30))).real)
print(json.dumps(out,indent=1))
assert out["hessian_fd_error"]<1e-5 and out["ward_norm"]<1e-10 and abs(out["15_Tr_Mplus"]-137)<1e-9

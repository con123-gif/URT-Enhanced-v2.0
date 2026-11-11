"""Shared construction: icosahedron and centred 13-cell complexes with U(1) link phases."""
import itertools, numpy as np
phi=(1+5**.5)/2
V12=np.array([(0,a,b*phi) for a in(-1,1) for b in(-1,1)]+[(a,b*phi,0) for a in(-1,1) for b in(-1,1)]+[(a*phi,0,b) for a in(-1,1) for b in(-1,1)],float)
def build(centre):
    V=np.vstack([V12,[[0,0,0]]]) if centre else V12.copy(); n=len(V)
    dist=np.linalg.norm(V12[:,None]-V12[None],axis=2)
    E=[(i,j) for i in range(12) for j in range(i+1,12) if abs(dist[i,j]-2)<1e-9]
    F=[f for f in itertools.combinations(range(12),3) if all(abs(dist[a,b]-2)<1e-9 for a,b in itertools.combinations(f,2))]
    if centre:
        F=F+[(i,j,12) for (i,j) in E]; E=E+[(i,12) for i in range(12)]
    eidx={e:k for k,e in enumerate(E)}
    d0=np.zeros((len(E),n))
    for k,(i,j) in enumerate(E): d0[k,i],d0[k,j]=-1,1
    d1=np.zeros((len(F),len(E)))
    for r,f in enumerate(F):
        for a,b in zip(f,f[1:]+f[:1]): d1[r,eidx[(min(a,b),max(a,b))]]=1 if a<b else -1
    assert np.allclose(d1@d0,0)
    return n,E,F,d0,d1
def Hadj(E,n,th):
    h=np.zeros((n,n),complex)
    for k,(i,j) in enumerate(E): h[i,j]=np.exp(1j*th[k]); h[j,i]=np.exp(-1j*th[k])
    return h
def Pi_logdet(E,n,th=None):
    m=len(E); th=np.zeros(m) if th is None else th
    H=Hadj(E,n,th); G=np.linalg.inv(H); P=np.zeros((m,m)); g=np.zeros(m)
    # J_k: (i,j)= i e^{i th}, (j,i) = -i e^{-i th};  W_k: (i,j) = -e^{i th}, (j,i) = -e^{-i th}
    GJ=[]
    for k,(i,j) in enumerate(E):
        u=np.exp(1j*th[k]); X=np.zeros((n,n),complex); X[:,j]+=G[:,i]*(1j*u); X[:,i]+=G[:,j]*(-1j*np.conj(u)); GJ.append(X)
        g[k]=-(np.trace(X)).real
        P[k,k]-=(G[j,i]*(-u)+G[i,j]*(-np.conj(u))).real
    for a in range(m):
        for b in range(a,m):
            v=np.sum(GJ[a]*GJ[b].T).real; P[a,b]+=v
            if b!=a: P[b,a]+=v
    return P,g,H
def levels(x,d=8):
    r=np.round(np.asarray(x,float),d)+0.0; return sorted((float(v),int((r==v).sum())) for v in set(r))

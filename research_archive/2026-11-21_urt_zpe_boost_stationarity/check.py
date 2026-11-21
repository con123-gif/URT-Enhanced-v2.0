import numpy as np
from scipy.linalg import eigh, expm
from math import pi,sqrt
THETA=2*pi/((1+sqrt(5))/2)**2

def graph(n,f):
    xyz=np.array([(x,y,z) for z in range(n) for y in range(n) for x in range(n)])
    L=np.zeros((len(xyz),len(xyz)),complex)
    def ix(x,y,z):return x+n*(y+n*z)
    for i,(x,y,z) in enumerate(xyz):
        for xx,yy,zz,power in ((x+1,y,z,z),(x,y+1,z,x),(x,y,z+1,y)):
            if max(xx,yy,zz)>=n:continue
            j=ix(xx,yy,zz); u=np.exp(1j*f*power)
            L[i,i]+=1;L[j,j]+=1;L[i,j]-=u;L[j,i]-=u.conjugate()
    return L,xyz

def run(n,eps):
    f=np.angle(eps*np.exp(-1j*THETA));L,xyz=graph(n,f)
    d=n/2-.5-xyz[:,0]; a=np.flatnonzero(d>0);da=d[a]
    M=L[np.ix_(a,a)].copy();np.fill_diagonal(M,0);M*=.5*(da[:,None]+da[None,:]);np.fill_diagonal(M,np.sum(abs(M),axis=1))
    ev,U=eigh(L); W=(U*np.sqrt(ev))@U.conj().T; V=(U/np.sqrt(ev))@U.conj().T
    P=W[np.ix_(a,a)];Q=V[np.ix_(a,a)]; D=np.diag(da)
    R=Q@M-D@P
    Mf=.5*(d[:,None]+d[None,:])*L
    C=W@(W*d[None,:]-d[:,None]*W)-(W*d[None,:]-d[:,None]*W)@W
    assert np.max(abs(V@Mf-d[:,None]*W-.5*V@C))<2e-10
    corr=M-Mf[np.ix_(a,a)]; assert np.max(abs(corr-np.diag(np.diag(corr))))<1e-10
    assert np.max(abs(R-(.5*(V@C)[np.ix_(a,a)]+Q@corr)))<2e-10
    CL=L@(L*d[None,:]-d[:,None]*L)-(L*d[None,:]-d[:,None]*L)@L
    x=n//2-2;y=n//2-1;z=n//2-1
    i=x+n*(y+n*z);j=i+1+n
    assert abs(abs(CL[i,j])-2*abs(np.sin(f/2)))<1e-10
    ids=np.flatnonzero((xyz[a,0]>=n//2-2)&(xyz[a,1]>=n//2-1)&(xyz[a,1]<=n//2)&(xyz[a,2]==n//2-1))
    Rloc=R[np.ix_(ids,ids)]; k=-Rloc.conj().T/np.linalg.norm(Rloc)
    def energy(t):
        A=np.eye(len(a),dtype=complex); A[np.ix_(ids,ids)]=expm(t*k)
        Ai=np.eye(len(a),dtype=complex); Ai[np.ix_(ids,ids)]=expm(-t*k.conj().T)
        return .5*np.trace(D@Ai@P@Ai.conj().T+M@A@Q@A.conj().T).real
    h=1e-5; slope=(energy(h)-energy(-h))/(2*h); pred=-np.linalg.norm(Rloc)
    assert abs(slope-pred)<2e-7,(slope,pred)
    assert energy(h)<energy(0)
    print(f'n={n:2d} eps={eps:+d} plaquette={abs(CL[i,j]):.12f} local_residual={-pred:.12f} slope={slope:.12f} energy_change={energy(h)-energy(0):.12g}',flush=True)
    return abs(CL[i,j]),-pred
if __name__=='__main__':
    for n in (4,6,8,10):
        for eps in (1,-1):run(n,eps)
    print('PASS native magnetic graph, exact double commutator, stationarity residual and entropy-preserving local energy derivative')

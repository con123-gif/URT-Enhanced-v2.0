import numpy as np
from itertools import product
from scipy.integrate import quad
from math import sqrt, pi

def lattice(n,f):
    L=np.zeros((3,n**3,n**3),complex)
    for x,y,z in product(range(n),repeat=3):
        i=x+n*(y+n*z)
        for k,(X,Y,Z,p) in enumerate(((x+1,y,z,z),(x,y+1,z,x),(x,y,z+1,y))):
            if max(X,Y,Z)>=n:continue
            j=X+n*(Y+n*Z);u=np.exp(1j*f*p)
            L[k,i,i]+=1;L[k,j,j]+=1;L[k,i,j]-=u;L[k,j,i]-=u.conjugate()
    return L

def test(n,f):
    L=lattice(n,f);lam,U=np.linalg.eigh(L.sum(axis=0));w=np.sqrt(lam);E=w.sum();M=len(w)
    assert lam.min()>0
    W=np.array([U.conj().T@l@U for l in L]); diag=np.real(np.diagonal(W,axis1=1,axis2=2))
    assert np.max(abs(diag@(1/w)-E/3))<1e-10
    v=np.array([[1,-1,0],[1,1,-2]],float);v/=np.linalg.norm(v,axis=1)[:,None]
    B=np.einsum('ai,ijk->ajk',v,W);s=w[:,None]+w[None,:];p=w[:,None]*w[None,:]
    def kern(nu):
        C=E/3*np.eye(2)-np.einsum('aij,bij,ij->ab',B.conj(),B,s/(p*(s*s+nu*nu))).real
        cross=np.einsum('ai,i->a',np.diagonal(B,axis1=1,axis2=2),1/(w*(nu*nu+4*w*w)))
        assert np.max(abs(cross))<1e-10
        assert np.linalg.norm(C-np.eye(2)*C[0,0])<1e-10
        return C
    C=kern(0);mass=C[0,0];k=np.sum(abs(B[0])**2/(p*s**3));kv=np.sum(1/w)/2
    assert E/6-1e-10<=mass<=E/3+1e-10 and k>0
    for nu in (.3,1.,3.):assert kern(nu)[0,0]>mass
    d=1e-4
    def energy(b):return np.sqrt(np.linalg.eigvalsh(np.einsum('i,ijk->jk',np.exp(-2*b),L))).sum()
    for row in v:
        ep,em=energy(d*row),energy(-d*row)
        assert abs((ep+em-2*E)/(2*d*d)-mass)<2e-5*max(1,mass)
        assert energy(.3*row)>=E/3*np.exp(-.3*row).sum()-1e-10
    if n<=4:
        # Independent direct frequency-domain propagator integral.
        for nu in (.4,2.):
            def integrand(t):
                return np.sum(abs(B[0])**2/((t*t+lam[:,None])*((t+nu)**2+lam[None,:])))/pi
            val,err=quad(integrand,-np.inf,np.inf,epsabs=1e-9,epsrel=1e-10)
            assert abs(E/3-val-kern(nu)[0,0])<1e-8
    print(f'N={n} f={f:+.8f} E/M={E/M:.12f} shear static/M={mass/M:.12f} shear kinetic/M={k/M:.12f} volume kinetic/M={kv/M:.12f} ratio={kv/k:.9f}',flush=True)
if __name__=='__main__':
    theta=2*pi/((1+sqrt(5))/2)**2
    for n in (2,4,6,8):
        for f in (-theta,pi-theta):test(n,f)
    print('PASS: native shear stability, cyclic degeneracy, finite differences and independent frequency integrals')

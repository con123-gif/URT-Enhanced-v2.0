"""Native URT vacuum connected energy-density covariance and scalar Poisson exchange.
Instantaneous scalar gravitational model only; NOT relativistic graviton exchange.
Natural units hbar=c=ell=1 in the dimensionless matrices.
"""
import numpy as np
from itertools import product
from math import pi,sqrt


def incidence(n,f):
    m=n**3; src=[]; dst=[]; phases=[]
    for x,y,z in product(range(n),repeat=3):
        i=x+n*(y+n*z)
        for X,Y,Z,k in ((x+1,y,z,z),(x,y+1,z,x),(x,y,z+1,y)):
            if max(X,Y,Z)>=n: continue
            src.append(i);dst.append(X+n*(Y+n*Z));phases.append(np.exp(1j*f*k))
    R=np.arange(len(src));D=np.zeros((len(R),m),complex)
    D[R,src]=1;D[R,dst]=-np.array(phases)
    A=abs(D).T**2
    D0=np.zeros_like(D.real);D0[R,src]=1;D0[R,dst]=-1
    return D,A,D0


def run(n,f):
    D,A,D0=incidence(n,f);m=n**3;L=D.conj().T@D
    lam,U=np.linalg.eigh(L);w=np.sqrt(lam);assert lam.min()>0
    W=(U*w)@U.conj().T;V=(U/w)@U.conj().T
    # h_i = (p_i^2 + q^T K_i q)/2 with each edge assigned by halves.
    X=abs(D@V@D.conj().T)**2
    C=(abs(W)**2+.25*A@X@A.T-A@A.T)/4
    C=(C+C.T)/2
    assert np.max(abs(C.sum(axis=1)))<2e-10
    assert np.linalg.eigvalsh(C)[0]>-2e-10
    if n==2:
        # independent realified 4M canonical Wightman Wick contraction
        def real(H): return np.block([[H.real,-H.imag],[H.imag,H.real]])
        Z=np.eye(2*m); O=np.block([[real(V),1j*Z],[-1j*Z,real(W)]])/2
        B=[]
        for i in range(m):
            ki=(D.conj().T*(A[i]/2))@D; p=np.diag(np.eye(m)[i]); z=np.zeros((2*m,2*m))
            B.append(np.block([[real(ki),z],[z,real(p)]]))
        C2=np.array([[.5*np.trace(bi@O@bj@O.T).real for bj in B]for bi in B])
        assert np.max(abs(C-C2))<1e-11
    l0=D0.T@D0; ev,R=np.linalg.eigh(l0);assert abs(ev[0])<1e-10 and ev[1]>0
    inv=(R[:,1:]/ev[1:])@R[:,1:].T
    b=2*pi*np.trace(inv@C)/m;u=w.mean();assert b>0
    # Connected covariance contribution from r>0 Laplacian eigenmodes.
    mode=np.diag(R.T@C@R);assert abs(mode[0])<1e-10
    assert abs(b-2*pi*np.sum(mode[1:]/ev[1:])/m)<1e-10
    # rho/canonical unit = u/x^4-b/x^6; extremum is maximum at x²=3b/(2u)
    x=sqrt(3*b/(2*u));rho=u/x**4-b/x**6;d2=20*u/x**6-42*b/x**8
    assert rho>0 and d2<0
    print(f'N={n} f={f:+.9f} u={u:.10f} cov_trace/M={np.trace(C)/m:.10f} b={b:.10f} b/u={b/u:.10f} ell_ext/ellP={x:.10f} rho_ext={rho:.10f} curvature={d2:.10f}',flush=True)
    return b


if __name__=='__main__':
    theta=2*pi/((1+sqrt(5))/2)**2
    for n in (2,4,6,8):
        for f in (-theta,pi-theta): run(n,f)
    print('PASS: energy covariance total-energy sum rule, positivity, direct realified Wick test, spectral Poisson exchange, stationary maximum')


# Exact spatially inhomogeneous lapse response in the specified canonical action.
def lapse_response(n,f):
    D,A,D0=incidence(n,f);L=D.conj().T@D;m=n**3
    lam,U=np.linalg.eigh(L);w=np.sqrt(lam);sp=w[:,None]+w[None,:]
    assert lam.min()>0
    # Deterministic nonuniform clock perturbation: lowest nonconstant
    # eigenvector of the neutral spatial Poisson operator along x.
    v=np.array([np.cos(pi*(x+.5)/n) for z,y,x in product(range(n),repeat=3)])
    v/=np.linalg.norm(v);assert abs(v.sum())<1e-12
    P=np.diag(v);K=(D.conj().T*(A.T@v/2))@D
    T=(U.conj().T@K@U)/np.sqrt(w[:,None]*w[None,:])-(U.conj().T@P@U)*np.sqrt(w[:,None]*w[None,:])
    cov=np.sum(abs(T)**2)/4
    r0=np.sum(abs(T)**2/sp)/4
    assert cov>0 and r0>0
    def E(s):
        l=1+s*v;assert l.min()>0
        H=((D.conj().T*(A.T@l/2))@D)*np.sqrt(l[:,None]*l[None,:])
        return np.sqrt(np.linalg.eigvalsh(H)).sum()
    d=.001;fd=(2*E(0)-E(d)-E(-d))/(2*d*d)
    err=abs(fd-r0);assert err<3e-6*max(1.,r0)
    # Static response is maximal; spectral suppression for nonzero Euclidean freq.
    r1=np.sum(abs(T)**2*sp/(sp**2+1.))/4
    assert 0<r1<r0
    print(f'LAPSE N={n} f={f:+.9f} connected_variance={cov:.10f} response_0={r0:.10f} response_1={r1:.10f} FD={fd:.10f} abs_err={err:.3e}',flush=True)


if __name__=='__main__':
    for n in (2,4,6,8):
        for f in (-theta,pi-theta):lapse_response(n,f)
    print('PASS: eight independent spatial lapse spectral response versus ground-energy Hessian checks')

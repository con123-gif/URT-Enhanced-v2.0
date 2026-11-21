"""Exact modular covariance construction on the same physical-site vacuum.
Numerical check restricted to small faithful cuts; no clipping of occupations.
"""
import numpy as np
from scipy.linalg import eigh
from check import graph,THETA

def test(n,eps):
    f=np.angle(eps*np.exp(-1j*THETA)); L,xyz=graph(n,f)
    ev,U=eigh(L); a=np.flatnonzero(xyz[:,0]<n//2); Ua=U[a,:]
    Q=(Ua/np.sqrt(ev))@Ua.conj().T;P=(Ua*np.sqrt(ev))@Ua.conj().T
    l,V=eigh(Q); sq=(V*np.sqrt(l))@V.conj().T; inv=(V/np.sqrt(l))@V.conj().T
    r,T=eigh(sq@P@sq); w=np.sqrt(r); occ=(w-1)/2
    assert min(occ)>0, (n,eps,min(occ))
    gap=np.log1p(1/occ)
    Aq=inv@((T*(gap*w))@T.conj().T)@inv
    Ap=sq@((T*(gap/w))@T.conj().T)@sq
    assert np.linalg.norm(Q@Aq-Ap@P)<1e-8
    assert np.max(abs(1/np.tanh(gap/2)-w))<1e-12
    S=2*np.sum((1+occ)*np.log1p(occ)-occ*np.log(occ)); E=2*np.dot(gap,occ); Z=2*np.log1p(occ).sum()
    assert abs(S-E-Z)<1e-11
    assert abs(.5*np.trace(Ap@P+Aq@Q).real-gap.sum()-E)<1e-9
    d=n/2-.5-xyz[a,0]; M=L[np.ix_(a,a)].copy(); np.fill_diagonal(M,0); M*=.5*(d[:,None]+d[None,:]); np.fill_diagonal(M,np.sum(abs(M),axis=1))
    D=np.diag(d)
    kin_off=Ap-np.diag(np.diag(Ap)); rel=np.linalg.norm(kin_off)/np.linalg.norm(Ap)
    assert np.linalg.norm(kin_off)>1e-6
    print(f'n={n} eps={eps:+d} S={S:.12f} E_mod_exc={E:.12f} logZ_mod={Z:.12f} E_mod_exc/S={E/S:.12f} kinetic_offdiag_fraction={rel:.12f} min_n={min(occ):.6g} stationarity={np.linalg.norm(Q@Aq-Ap@P):.3g}')
if __name__=='__main__':
    for n in (4,6):
        for e in (1,-1):test(n,e)
    print('PASS exact reduced Gaussian modular Gibbs reconstruction, entropy identity, non-diagonal kinetic term')

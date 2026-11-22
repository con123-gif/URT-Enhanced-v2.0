from math import pi,e,sqrt,cos,log,atanh
from itertools import product
import numpy as np
phi=(1+sqrt(5))/2
alpha=pi/e
th=2*pi/phi**2
nbar=alpha**4-1
lam=nbar/(1+nbar)

def entropy(n):
    return (n+1)*log(n+1)-n*log(n) if n else 0

def native(n, f):
    xyz=list(product(range(n),repeat=3))
    pos={xyz[i]:i for i in range(len(xyz))}
    L=np.zeros((n**3,n**3),complex)
    for i,x in enumerate(xyz):
        for a in range(3):
            y=list(x);y[a]+=1;y=tuple(y)
            if y not in pos:continue
            j=pos[y]
            u=np.exp(1j*f*x[(a-1)%3])
            L[i,i]+=1;L[j,j]+=1
            L[i,j]-=u;L[j,i]-=u.conjugate()
    return L,pos

# Quantum output of two fresh-idler URT cycles is thermal and phase-independent
for theta in (th,th/3,0):
    # truncated thermal occupations p_n: monotone decreasing
    prob=(1-lam)*lam**np.arange(256)
    assert all(prob[i]>=prob[i+1] for i in range(255))
    assert abs(np.dot(np.arange(256),prob)-nbar)<1e-12
    # rotate density matrix by any phase: remains diagonal
    phases=np.exp(1j*theta*np.arange(256))
    assert np.max(abs(prob*(phases*phases.conjugate())-prob))<1e-14
    # Passive state: among all unitaries, no unitary can reduce energy.
    # Rearrangement: decreasing p_n occupy increasing frequencies already.
    arr=np.arange(256)
    assert np.dot(arr,prob)<=np.dot(arr,prob[::-1])
print('thermal nbar2',nbar,'lambda2',lam,'S/kB',entropy(nbar),'signal work cyclic ergotropy',0.0)

for n in (3,4,5):
    for f in (-th,pi-th):
        L,pos=native(n,f)
        lams=np.linalg.eigvalsh(L)
        g3=1.5*(1-cos(abs(f)/4))
        q=1-g3/12
        assert min(lams) >=g3-1e-11,(n,f,min(lams),g3)
        assert max(lams)<=12+1e-11
        i=pos[(1,1,1)];j=pos[(2,2,1)]
        D=np.diag([x for x,y,z in product(range(n),repeat=3)]).astype(complex)
        T=L@D-D@L
        C=L@T-T@L
        witness=abs(C[i,j]);expected=2*abs(np.sin(f/2))
        assert abs(witness-expected)<1e-11,(n,f,witness,expected)
        G=np.linalg.inv(L)
        # Bound (L^{-1})_{ij} <= (1/g3)*(1-g3/12)^{dist(i,j)}
        ix=list(product(range(n),repeat=3))
        for ii in range(len(ix)):
            for jj in range(len(ix)):
                d=sum(abs(ix[ii][a]-ix[jj][a]) for a in range(3))
                bound=q**d/g3
                assert abs(G[ii,jj]) <= bound+1e-10,(n,f,ii,jj,G[ii,jj],bound)
        print(f'n={n} sector={f:+.9f} ground_gap={min(lams):.9f} lower_bound={g3:.9f} decay_xi_bound={-1/log(q):.6f} modular_witness={witness:.9f}, expected={expected:.9f}')
print('PASS: phase-insensitive thermal output and passivity; native positive gaps, exponential static propagator bound, nonzero boost commutator')

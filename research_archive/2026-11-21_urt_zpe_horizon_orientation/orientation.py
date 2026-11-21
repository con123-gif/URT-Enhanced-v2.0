import math, numpy as np
from scipy.linalg import eigh
THETA=2*math.pi/((1+math.sqrt(5))/2)**2

def graph(n,f):
    xyz=np.array([(x,y,z) for z in range(n) for y in range(n) for x in range(n)])
    L=np.zeros((len(xyz),len(xyz)),complex)
    for i,(x,y,z) in enumerate(xyz):
        for xx,yy,zz,power in ((x+1,y,z,z),(x,y+1,z,x),(x,y,z+1,y)):
            if max(xx,yy,zz)>=n:continue
            j=xx+n*(yy+n*zz);u=np.exp(1j*f*power)
            L[i,i]+=1;L[j,j]+=1;L[i,j]-=u;L[j,i]-=u.conjugate()
    return L,xyz

def test(n,eps):
    f=np.angle(eps*np.exp(-1j*THETA));L,xyz=graph(n,f)
    ev,U=eigh(L);W=(U*np.sqrt(ev))@U.conj().T;V=(U/np.sqrt(ev))@U.conj().T
    k=n//2; i=k+n*(k+n*k)
    for name,b in [('axis',np.array([1.,0,0])),('flux',np.ones(3)/np.sqrt(3))]:
        d=(xyz-(n-1)/2)@b; a=np.flatnonzero(d>0); da=d[a]; D=np.diag(da); ix=np.ix_(a,a)
        P=W[ix];Q=V[ix]; M=L[ix].copy();np.fill_diagonal(M,0);M*=.5*(da[:,None]+da[None,:]);np.fill_diagonal(M,np.sum(abs(M),axis=1)); sd=np.sqrt(da)
        qe,qu=eigh(Q);sq=(qu*np.sqrt(qe))@qu.conj().T
        occ=(np.sqrt(np.maximum(eigh(sq@P@sq,eigvals_only=True),1))-1)/2
        S=2*np.sum((1+occ)*np.log1p(occ)-occ*np.log(np.maximum(occ,1e-300)))
        freq=np.sqrt(eigh(sd[:,None]*M*sd[None,:],eigvals_only=True)); X=.5*np.trace(D@P+M@Q).real-freq.sum(); Z=-2*np.log(-np.expm1(-2*math.pi*freq)).sum(); rel=2*math.pi*X+Z-S
        assert X>=0 and rel>=-1e-9
        C=L@(L*d[None,:]-d[:,None]*L)-(L*d[None,:]-d[:,None]*L)@L
        diags=np.sum(abs(xyz-xyz[i]),axis=1)==2; diags&=np.count_nonzero(xyz-xyz[i],axis=1)==2; row=np.linalg.norm(C[i,diags])**2
        target=8*abs(1-np.exp(1j*f))**2
        assert abs(row-target)<1e-9,(row,target)
        # finite cube Gibbs reference: stationary covariance condition
        R=Q@M-D@P
        # The cross-cut midpoint equals zero for axis and (1,1,1) cuts.
        assert np.max(np.abs((.5*(d[:,None]+d[None,:])*L)[np.ix_(a,np.flatnonzero(d<0))]))<1e-10
        print(f'{n} {eps:+d} {name} S={S:.12f} X={X:.12f} ratio={2*math.pi*X/S:.12f} D/S={rel/S:.12f} Z/S={Z/S:.12f} row2={row:.12f} resid={np.linalg.norm(R)/np.sqrt(len(a)):.12f}',flush=True)
if __name__=='__main__':
    import sys
    for n in ((4,6,8,10,12) if '--full' in sys.argv else (4,6,8)):
        for e in (1,-1):test(n,e)
    print('PASS native orientation test and exact interior double commutator norm identity')

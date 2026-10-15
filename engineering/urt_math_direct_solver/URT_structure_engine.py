"""URT Structure Engine: trustworthy direct solvers for identifiable operator classes.

Works for structured *mathematics*, oscillator networks, nearest-neighbour
physics discretizations, and separable nonlinear energies. Original URT's
(pi/e, golden-angle) phase scheduling is optional input, not an assertion of
universal optimization or a new complexity theorem.

No arbitrary dense-matrix structure guessing. Supply a structure certificate
through one of the constructors below; verify with independent matrix-free
residuals. Algorithms are standard Woodbury/block elimination/secular reduction
unified under a common interface.

Dependencies: NumPy, SciPy (nonlinear root only).
"""
from __future__ import annotations
from dataclasses import dataclass
from typing import Any
import numpy as np

PHI=(1+np.sqrt(5))/2
URT_ANGLE=2*np.pi/PHI**2
URT_SCALE=np.pi/np.e


def _rhs(b: Any, n: int):
    a=np.asarray(b)
    if a.ndim not in (1,2) or a.shape[0]!=n:
        raise ValueError(f'RHS must have leading dimension {n}')
    return a


@dataclass(frozen=True)
class SolveCertificate:
    method: str
    dimension: int
    reduced_dimension: int
    relative_residual: float
    operation_class: str
    stable: bool
    comment: str


class DiagonalLowRank:
    """K = diag(d) + U C U^H, with C optionally indefinite or singular.

    Complexity for fixed number of columns r and right hand sides m:
    O(N*r*r+r**3 + N*r*m), memory O(N*r).
    Use d!=0 and nonsingular reduced Schur matrix.
    """
    def __init__(self, diagonal, factors, core=None):
        d=np.asarray(diagonal)
        U=np.asarray(factors)
        if d.ndim!=1 or U.ndim!=2 or U.shape[0]!=len(d):
            raise ValueError('Diagonal vector and N×r feature matrix required')
        if np.any(d==0): raise ValueError('Zero diagonal: use a different factorization')
        r=U.shape[1]
        C=np.eye(r,dtype=np.result_type(d,U)) if core is None else np.asarray(core)
        if C.shape!=(r,r): raise ValueError('core must be r×r')
        self.d,self.U,self.C=d,U,C
        self.DU=U/d[:,None]
        self.reduced=np.eye(r,dtype=np.result_type(d,U,C))+C@(U.conj().T@self.DU)
        if np.linalg.cond(self.reduced)>1e12:
            self._well_conditioned=False
        else:
            self._well_conditioned=True

    @property
    def size(self): return len(self.d)
    @property
    def rank(self): return self.U.shape[1]

    def apply(self,x):
        x=_rhs(x,self.size)
        return self.d.reshape((-1,)+(1,)*(x.ndim-1))*x+self.U@(self.C@(self.U.conj().T@x))

    def solve(self,b):
        b=_rhs(b,self.size)
        Dinv_b=b/self.d.reshape((-1,)+(1,)*(b.ndim-1))
        inner=self.C@(self.U.conj().T@Dinv_b)
        corrected=np.linalg.solve(self.reduced,inner)
        x=Dinv_b-self.DU@corrected
        rel=np.linalg.norm(self.apply(x)-b)/max(np.linalg.norm(b),1e-300)
        return x,SolveCertificate('diagonal + low rank / Woodbury',self.size,self.rank,
            float(rel),'O(N r²+r³) preprocessing; O(N r m) solve',
            self._well_conditioned and rel<1e-9,
            'Exact algebraic elimination for specified low-rank input; verify residual.')


def phase_features(phases,harmonics=1,weights=None):
    """Cos-sin separable interaction kernel with *arbitrary* phase samples.

    K_ij = sum_h (weight_h/N)*cos[h*(phase_i-phase_j)].
    The factorization is exact regardless of using the URT golden angle.
    """
    theta=np.asarray(phases,float)
    if theta.ndim!=1 or len(theta)==0: raise ValueError('phases 1D nonempty')
    h=int(harmonics)
    if h<1: raise ValueError('harmonics >=1')
    weights=np.ones(h) if weights is None else np.asarray(weights,float)
    if weights.shape!=(h,) or np.any(weights<0): raise ValueError('nonnegative h weights')
    U=np.empty((len(theta),2*h))
    for j in range(h):
        factor=np.sqrt(weights[j]/len(theta))
        U[:,2*j]=factor*np.cos((j+1)*theta)
        U[:,2*j+1]=factor*np.sin((j+1)*theta)
    return U


def urt_features(n,harmonics=1,weights=None):
    return phase_features(np.arange(n)*URT_ANGLE,harmonics,weights)


def harmonic_solver(n,harmonics=1,weights=None,diagonal=1.):
    d=np.full(n,diagonal) if np.isscalar(diagonal) else np.asarray(diagonal)
    return DiagonalLowRank(d,urt_features(n,harmonics,weights))


def urt_boundary(n,x0=1.,target=0.,gain=0.5):
    """Original 2-step analytical recurrence boundary calculation, O(n).

    x_{k+1}=a_k*x_k - gain*x_{k-1}.  x0 supplied, x_minus_one
    solved using two independent fundamental solutions. Report sensitivity.
    """
    if n<1: raise ValueError('n>=1')
    u_prev,u_current=0.,1.
    v_prev,v_current=1.,0.
    for k in range(n):
        a=(1+np.e/(np.pi*np.sqrt(k+1)))*np.cos(k*URT_ANGLE)
        u_prev,u_current=u_current,a*u_current-gain*u_prev
        v_prev,v_current=v_current,a*v_current-gain*v_prev
    if abs(v_current)<1e-30:
        raise ArithmeticError('Boundary coefficient nearly singular')
    xminus=(target-x0*u_current)/v_current
    result=x0*u_current+xminus*v_current
    return xminus,result,abs(1/v_current)


class BlockTridiagonal:
    """Hermitian block tridiagonal K, fixed block width d, arbitrary lengths.

    diagonal[k] = d×d, lower[k] = d×d at (k+1,k), upper its adjoint.
    Block Gaussian elimination costs O(stages*d³), fixed d -> O(stages).
    """
    def __init__(self,diagonal,lower):
        D=np.asarray(diagonal)
        L=np.asarray(lower)
        if D.ndim!=3 or D.shape[1]!=D.shape[2]:
            raise ValueError('diag must be (stages,d,d)')
        t,d,_=D.shape
        if L.shape!=(t-1,d,d): raise ValueError('lower shape mismatch')
        self.D,self.L,self.t,self.d=D,L,t,d
        self.schur=[]
        self.mult=[]
        for k in range(t):
            pivot=D[k].copy() if k==0 else D[k]-L[k-1]@self.mult[-1]
            self.schur.append(pivot)
            if k<t-1:
                self.mult.append(np.linalg.solve(pivot,L[k].conj().T))

    def apply(self,x):
        x=_rhs(x,self.t*self.d)
        X=x.reshape((self.t,self.d)+x.shape[1:])
        out=np.einsum('kij,kj...->ki...',self.D,X)
        out[1:]+=np.einsum('kij,kj...->ki...',self.L,X[:-1])
        out[:-1]+=np.einsum('kji,kj...->ki...',self.L.conj(),X[1:])
        return out.reshape(x.shape)

    def solve(self,b):
        b=_rhs(b,self.t*self.d)
        y=b.reshape((self.t,self.d)+b.shape[1:]).copy()
        for k in range(1,self.t):
            y[k]-=self.L[k-1]@np.linalg.solve(self.schur[k-1],y[k-1])
        x=np.empty_like(y)
        x[-1]=np.linalg.solve(self.schur[-1],y[-1])
        for k in range(self.t-2,-1,-1):
            x[k]=np.linalg.solve(self.schur[k],y[k]-self.L[k].conj().T@x[k+1])
        out=x.reshape(b.shape)
        rel=np.linalg.norm(self.apply(out)-b)/max(np.linalg.norm(b),1e-300)
        return out,SolveCertificate('block tridiagonal elimination',self.t*self.d,self.d,
             float(rel),'O(stages d³), fixed d -> O(stages)',rel<1e-9,
             'Requires nearest-stage interactions and nonsingular pivots.')


def radial_quartic_solve(operator,b,g=1.,rtol=1e-11):
    """Unique minimizer 0.5 x^H K x + g/4 ||x||^4 - Re b^H x,
    assuming K positive-definite, g>0. Bracketed ONE-SCALAR solve.
    """
    from scipy.optimize import brentq
    if g<=0: raise ValueError('g must be positive')
    b=_rhs(b,operator.size)
    if b.ndim!=1: raise ValueError('one RHS only')
    def at(t):
        mod=DiagonalLowRank(operator.d+t,operator.U,operator.C)
        return mod.solve(b)[0]
    def f(t):
        x=at(t)
        return g*np.vdot(x,x).real-t
    high=max(f(0),1e-10)
    low=0
    while f(high)>0: high*=2
    root=brentq(f,low,high,rtol=rtol)
    x=at(root)
    r=operator.apply(x)+g*np.vdot(x,x).real*x-b
    rel=np.linalg.norm(r)/max(np.linalg.norm(b),1e-300)
    return x,root,SolveCertificate('rank-r plus scalar nonlinear secular',operator.size,
        operator.rank+1,float(rel),'1D scalar root times O(N r²+r³)',rel<1e-8,
        'A strictly convex radial quartic, not arbitrary nonlinear optimization.')


def oscillator_response(n,drive,omega,stiffness=5.,mass=1.,damping=0.1,
                        harmonics=2,weights=None):
    """Linear steady-state oscillator lattice with fixed-harmonic dense coupling.
    (k-m*w²+i*c*w) x + U U.T x = drive,  pure model parameters.
    """
    def arr(x):
        q=np.asarray(x,dtype=float)
        return np.full(n,float(q)) if q.ndim==0 else q
    d=arr(stiffness)-omega**2*arr(mass)+1j*omega*arr(damping)
    if np.min(np.abs(d))==0:raise ValueError('singular uncoupled oscillator')
    U=urt_features(n,harmonics,weights)
    return DiagonalLowRank(d,U).solve(np.asarray(drive,complex))


if __name__=='__main__':
    N=8192
    op=harmonic_solver(N,3,weights=[5.,1.,.2])
    b=np.sin(np.arange(N)*URT_ANGLE)
    x,report=op.solve(b)
    print(report)


def solve_problem(spec: dict):
    """Transparent dispatcher for common mathematical problem descriptions.

    Each call chooses a mathematically certified formula from the supplied
    structural *description*, or falls back to a standard dense solve.
    It does not infer hidden structure from arbitrary source code, nor claim
    a fast solution to an unstructured computational problem.

    Kinds: harmonic, lowrank, block-chain, oscillator, radial-quartic,
    urt-boundary, dense. All except urt-boundary return (x,certificate),
    with radial-quartic returning (x,tau,certificate).
    """
    kind=spec.get('kind')
    if kind=='harmonic':
        b=np.asarray(spec['b']);n=len(b)
        phases=spec.get('phases')
        U=urt_features(n,spec.get('harmonics',1),spec.get('weights')) if phases is None else phase_features(phases,spec.get('harmonics',1),spec.get('weights'))
        diag=spec.get('diagonal',1.)
        d=np.full(n,diag) if np.isscalar(diag) else np.asarray(diag)
        return DiagonalLowRank(d,U).solve(b)
    if kind=='lowrank':
        return DiagonalLowRank(spec['diagonal'],spec['features'],spec.get('core')).solve(spec['b'])
    if kind=='block-chain':
        return BlockTridiagonal(spec['diagonal_blocks'],spec['lower_blocks']).solve(spec['b'])
    if kind=='oscillator':
        return oscillator_response(len(spec['b']),spec['b'],spec['omega'],
            spec.get('stiffness',5),spec.get('mass',1),spec.get('damping',.1),
            spec.get('harmonics',2),spec.get('weights'))
    if kind=='radial-quartic':
        op=spec.get('operator')
        if not isinstance(op,DiagonalLowRank):
            raise ValueError('radial quartic requires a certified positive diagonal+low-rank operator')
        return radial_quartic_solve(op,spec['b'],spec.get('g',1.))
    if kind=='urt-boundary':
        return urt_boundary(spec['n'],spec.get('x0',1.),spec.get('target',0.),spec.get('gain',.5))
    if kind=='dense':
        A=np.asarray(spec['matrix'])
        b=np.asarray(spec['b'])
        if A.ndim!=2 or A.shape[0]!=A.shape[1]:
            raise ValueError('square matrix required')
        x=np.linalg.solve(A,b)
        rel=float(np.linalg.norm(A@x-b)/max(np.linalg.norm(b),1e-300))
        return x,SolveCertificate('dense numerical fallback',len(A),len(A),rel,
            'O(N³) factorization / O(N²) memory',rel<1e-9,
            'General linear fallback; no URT-related speedup asserted.')
    raise ValueError(f'unsupported problem kind: {kind}; no universal exact method claimed')


class LocalPlusGlobalResonance:
    """Combined nearest-neighbour physics and all-to-all harmonic coupling.

    Given any nonsingular block-tridiagonal B and a fixed-rank U C U^H,
    eliminate B by the local direct solver, then apply an r×r Woodbury
    correction. For fixed block size and harmonic rank, total work O(N).
    This is an explicit cross-domain synthesis, not a universal N-body solver.
    """
    def __init__(self, base: BlockTridiagonal, features, core=None):
        U=np.asarray(features)
        if U.ndim!=2 or len(U)!=base.t*base.d:
            raise ValueError('feature shape must be (N,r)')
        r=U.shape[1]
        C=np.eye(r,dtype=np.result_type(U,base.D)) if core is None else np.asarray(core)
        if C.shape!=(r,r): raise ValueError('core must be r×r')
        self.base,self.U,self.C=base,U,C
        self.baseU=base.solve(U)[0]
        self.reduced=np.eye(r,dtype=np.result_type(self.baseU,U,C))+C@(U.conj().T@self.baseU)
        self.cond=np.linalg.cond(self.reduced)

    @property
    def size(self):return self.U.shape[0]
    @property
    def rank(self):return self.U.shape[1]
    def apply(self,x):
        return self.base.apply(x)+self.U@(self.C@(self.U.conj().T@x))
    def solve(self,b):
        b=_rhs(b,self.size)
        x0=self.base.solve(b)[0]
        core=np.linalg.solve(self.reduced,self.C@(self.U.conj().T@x0))
        x=x0-self.baseU@core
        rel=np.linalg.norm(self.apply(x)-b)/max(np.linalg.norm(b),1e-300)
        return x,SolveCertificate('local blocks + fixed-rank global resonances',self.size,
             self.rank,float(rel),'O(N d³+N r²+r³), fixed d,r -> O(N)',
             bool(self.cond<1e12 and rel<1e-9),
             'Exact Schur/Woodbury composition; valid for structured, invertible base.')

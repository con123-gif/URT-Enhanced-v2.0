#!/usr/bin/env python3
"""Constructive Cathedral/forest-gauge bridge: exact compact SU(2) entropy
plaquette + a scale-uniform averaged-block theorem for the distinct Gaussian
cochain reference model.  The second model is NOT Wilson SU(2) and is NOT the
D(n,alpha) result sought for non-Abelian Yang--Mills.

Only Cathedral's frozen delta and exact hidden multiplicities are used to
calculate the entropy Wilson coefficient. The SU(2) action, balanced bridge,
and one-nat/plaquette Gibbs weighting are explicitly NEW MODEL PREMISES.
"""
import math
import json
from pathlib import Path
import numpy as np
from scipy.sparse.linalg import LinearOperator, cg

PHI=(1+math.sqrt(5))/2
DELTA=3/20-80*math.pi/(1053*PHI)
ETA=-math.log(DELTA)
LAMBDA=3-math.sqrt(5)
MASS=math.sqrt(LAMBDA)
P3=1/(4*(1+DELTA**2))
P5=DELTA**2/(4*(1+DELTA**2))
KAPPA=ETA*(1-DELTA**2)/(1+DELTA**2)
I4=np.eye(4)
ZERO=np.zeros((4,4))
S=(1/math.sqrt(2))*np.block([[I4,I4],[-I4,I4]])
RHO=np.diag([P3]*4+[P5]*4)
LOGRHO=np.diag([math.log(P3)]*4+[math.log(P5)]*4)

def quaternion_l(q):
    a,b,c,d=map(float,q)
    return np.array([[a,-b,-c,-d],
                     [b,a,-d,c],
                     [c,d,a,-b],
                     [d,-c,b,a]],dtype=float)

def quaternion_mul(p,q):
    a,b,c,d=p
    e,f,g,h=q
    return np.array([a*e-b*f-c*g-d*h,
                     a*f+b*e+c*h-d*g,
                     a*g-b*h+c*e+d*f,
                     a*h+b*g-c*f+d*e])

def entropy_plaquette(q):
    q=np.asarray(q,dtype=float)
    assert abs(np.linalg.norm(q)-1)<1e-12
    L=quaternion_l(q)
    R=S @ np.block([[L,ZERO],[ZERO,I4]]) @ S.T
    D=np.trace(RHO @ (LOGRHO -R@LOGRHO@R.T))
    D_from_wilson=KAPPA*(1-q[0])
    return D, D_from_wilson, R

def screen_f0(h):
    t=MASS*h
    tau=2*math.asinh(t/2)  # cosh(tau)=1+t^2/2
    return math.exp(-tau/2)/t

def bound_gaussian(n,h):
    # The exact analytic cube parity bound: 4*(n/2)^3 f0/(n/2)^4.
    return 8*screen_f0(h)/n

def gaussian_cube(n,h):
    mu2h2=(MASS*h)**2
    shape=(n,n,n,n)
    N=n**4
    def lap_action(v):
        u=np.asarray(v).reshape(shape)
        z=(8+mu2h2)*u.copy()
        for axis in range(4):
            slices_left=[slice(None)]*4
            slices_right=[slice(None)]*4
            slices_left[axis]=slice(None,-1)
            slices_right[axis]=slice(1,None)
            z[tuple(slices_left)]-=u[tuple(slices_right)]
            z[tuple(slices_right)]-=u[tuple(slices_left)]
        return z.ravel()
    op=LinearOperator((N,N),matvec=lap_action, dtype=float)
    u,info=cg(op,np.ones(N),rtol=2e-12,atol=1e-12)
    assert info==0,(n, info)
    residual=np.max(np.abs(lap_action(u)-1))
    assert residual <2e-9,residual
    ua=u.reshape(shape)
    idx=np.indices(shape,dtype=np.int32)
    kc=np.zeros(16,dtype=float)
    for axis in range(4):
        for boundary in (0,n-1):
            s=[slice(None)]*4
            s[axis]=boundary
            face_vals=ua[tuple(s)]
            face_indices=[idx[d][tuple(s)] for d in range(4)]
            face_indices[axis]=face_indices[axis]+(-1 if boundary==0 else 1)
            codes=np.zeros(face_vals.shape,dtype=np.int32)
            for d in range(4):
                codes |= ((face_indices[d]&1)<<d)
            kc+=np.bincount(codes.ravel(),weights=face_vals.ravel(),minlength=16)
    m=n//2
    alpha=float(max(kc)/m**4)
    b=bound_gaussian(n,h)
    assert alpha <= b*(1+1e-9)
    return {'n':n, 'h':h, 'physical_side':n*h,
            'actual_parity_max':alpha, 'proved_parity_upper':b,
            'residual':float(residual),
            'parity_spread':float((max(kc)-min(kc))/m**4)}

def main():
    rng=np.random.default_rng(20261028)
    max_hom=0
    max_entropy=0
    max_orth=0
    for _ in range(250):
        q=rng.normal(size=4); q/=np.linalg.norm(q)
        p=rng.normal(size=4); p/=np.linalg.norm(p)
        d,expected,R=entropy_plaquette(q)
        dp,_,Rp=entropy_plaquette(p)
        _,_,Rqp=entropy_plaquette(quaternion_mul(q,p))
        max_hom=max(max_hom,float(np.linalg.norm(R@Rp-Rqp)))
        max_entropy=max(max_entropy,abs(d-expected))
        max_orth=max(max_orth,float(np.linalg.norm(R@R.T-np.eye(8))))
        assert d >= -1e-12
    assert max_hom <1e-13
    assert max_entropy <1e-12
    assert max_orth <1e-13
    # Conjugacy invariance of the SU(2) plaquette entropy:
    for _ in range(20):
        q=rng.normal(size=4);q/=np.linalg.norm(q)
        g=rng.normal(size=4);g/=np.linalg.norm(g)
        g_inv=g*np.array([1,-1,-1,-1])
        conj=quaternion_mul(quaternion_mul(g,q),g_inv)
        assert abs(entropy_plaquette(q)[0]-entropy_plaquette(conj)[0])<1e-12
    # The Gaussian block theorem's physical cube size is fixed;
    # alpha <=1/2 uniformly for n*h=16/mass, independent of n.
    ell=16/MASS
    cube_data=[]
    for n in (2,4,6,8,10,12,16):
        h=ell/n
        cube_data.append(gaussian_cube(n,h))
    out={'delta':DELTA,'eta':ETA,'lambda':LAMBDA,'mass':MASS,
         'beta_W_entropy':KAPPA,'rho_block_eigenvalues':[P3,P5],
         'homomorphism_err':max_hom,'entropy_identity_err':max_entropy,
         'orthogonal_err':max_orth,
         'gaussian_fixed_physical_cube_side':ell,'gaussian_alpha_upper':0.5,
         'gaussian_cubes':cube_data,
         'scope':'BKM-Wilson SU2 is an explicitly chosen balanced bridge; '
                 'the proved physical-cube averaged contraction is for a '
                 'different MASSIVE GAUSSIAN scalar model, not Wilson.'}
    with open(Path(__file__).with_suffix('.json'),'w') as f:
        json.dump(out,f,indent=2)
    print(json.dumps(out,indent=2))

if __name__=='__main__':
    main()

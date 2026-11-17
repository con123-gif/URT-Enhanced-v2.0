#!/usr/bin/env python3
"""Original-source Q101/Q124/Q125/v61 full 48-sector GRADED gauge-response audit.
Source operators are imported UNMODIFIED. Finite conditional action only.
"""
import sys, json, math, runpy
from itertools import product
from pathlib import Path
import numpy as np
from scipy.linalg import eigh
root=Path(__file__).resolve().parents[2]
src=root/"research_archive/2026-11-15_q125_native_hidden_charged_join/Q125_NATIVE_WEDGE_CHARGED_COUPLING.py"
data=runpy.run_path(str(src))
v=data["v61"]
S=np.asarray(data["S"],complex); axis=np.asarray(data["axis"],float)
links=data["links"]; jfield=data["jfield"]
Q=np.asarray(data["Q"][0],complex)
assert abs(6*np.trace(Q[:8,:8]@Q[:8,:8]).real-16)<1e-9
assert abs(6*np.trace(Q[8:,8:]@Q[8:,8:]).real-16)<1e-9
n=444; assert len(data["masks"])==n and len(links)==1032
eigline=np.array([np.linalg.eigh(s)[1][:,1] for s in S])
HR=np.zeros((n,n),complex); HL=np.zeros((n,n),complex)
count=0
for i,j,bit in links:
    a,b=jfield[i,j]; cur=float(a)+math.sqrt(5)*float(b)
    if abs(cur)<1e-12: continue
    count+=1
    u=(np.eye(2)+S[i]@S[j])/math.sqrt(2*(1+axis[i]@axis[j]))
    z=np.vdot(eigline[i],u@eigline[j])
    assert abs(abs(z)-1)<1e-10
    HR[i,j]=1j*cur; HR[j,i]=HR[i,j].conjugate()
    HL[i,j]=1j*cur*z; HL[j,i]=HL[i,j].conjugate()
assert count==720
er=eigh(HR,eigvals_only=True,check_finite=False)
el=eigh(HL,eigvals_only=True,check_finite=False)
assert sum(abs(er)<1e-8)==112 and sum(abs(el)<1e-8)==84
print("Q125 original 444-sector charged spectra",len(er),len(el),flush=True)
D=np.array(v.DIRECTIONS,int); sites=list(v.SITES); ind=dict(v.SITE_INDEX)
shape=np.array(v.LATTICE_SHAPE)
assert D.tolist()==[list(x) for x in ([(0,1,0,0),(0,0,1,0),(0,0,0,1)]+[(1,*bits) for bits in product((0,-1),repeat=3)])]
I4=np.eye(4,dtype=complex)
gams,g5=v.gamma_matrices()
r=float(v.R_EXACT)
F=[];B=[]
for a in range(11):
    if a<3:
        F.append((gams[a+1]-r*I4)/2)
        B.append((-gams[a+1]-r*I4)/2)
    else:
        F.append((gams[0]-I4)/16)
        B.append((-gams[0]-I4)/16)
F=np.array(F);B=np.array(B)
G5=np.kron(np.eye(48),g5)

# Q161 new physical frontier: solve the GRADED ORIGINAL Q125 action at nonzero
# triangular flux. This extends the source-native Q125/v61 code above, not Q109.
from collections import Counter
Q16=np.asarray(data["Q"][0],complex)
def charge_mult(a):
    vals=eigh(Q16[:8,:8] if a=="L" else Q16[8:,8:],eigvals_only=True)
    counts=Counter()
    for q in vals:
        n=int(round(3*q))
        assert abs(3*q-n)<1e-10
        counts[n]+=3;counts[-n]+=3  # 3 generations and conjugates
    return counts
cl,cr=charge_mult("L"),charge_mult("R")
assert cl==cr==Counter({0:6,3:3,-3:3,2:9,-2:9,1:9,-1:9})
charges={j/3:c for j,c in cl.items() if j}
assert abs(sum(c*q*q for q,c in charges.items())-16)<1e-10
# Fix: source-native KMS transfer scale, NOT a free/unbound k symbol.
k_KMS=float(v.DELTA)/(1.0+float(v.DELTA)**2)
assert 0.0 < k_KMS < 0.01
mu2=(k_KMS*np.r_[er,el])**2
M=float(v.M_EXACT)


# 384-site dynamically selected flux branch. Original native Q125/v61 are unchanged.
from scipy.optimize import minimize
shape=np.array((6,4,4,4))
ferm=np.array([(np.pi*(2*t+1)/6,*[np.pi*x/2 for x in xyz]) for t in range(6) for xyz in product(range(4),repeat=3)])
V=len(ferm)
assert V==384
original=np.r_[np.full(3,3*np.pi/4),[-np.pi/4,np.pi/2,np.pi/2,5*np.pi/4,np.pi/2,5*np.pi/4,5*np.pi/4,2*np.pi]]
Astar=original.copy()

def dispersion(q,A):
    theta=ferm@D.T+q*A[None,:]
    cs,ss=np.cos(theta),np.sin(theta)
    s=3*r+1-M-r*cs[:,:3].sum(axis=1)-cs[:,3:].sum(axis=1)/8
    t=ss[:,3:].sum(axis=1)/8
    e2=s*s+(ss[:,:3]**2).sum(axis=1)+t*t
    de2=2*q*np.column_stack((r*s[:,None]*ss[:,:3]+ss[:,:3]*cs[:,:3],
                        (s[:,None]*ss[:,3:]+t[:,None]*cs[:,3:])/8))
    return e2,de2
def spectral_action_grad(A):
    total=0.;grad=np.zeros(11)
    for q,mult in charges.items():
        e,d=dispersion(q,A)
        denominators=e[:,None]+mu2[None,:]
        total+=-2*mult*np.log(denominators).sum()
        grad-=2*mult*(d*np.reciprocal(denominators).sum(axis=1)[:,None]).sum(axis=0)
    return float(total),grad

def hp(p,q):
    u=D@p+q*Astar
    x=np.einsum("jab,j->ab",F,np.exp(1j*u))
    y=np.einsum("jab,j->ab",B,np.exp(-1j*u))
    z=g5@((3*r+1-M)*I4+x+y)
    assert np.linalg.norm(z-z.conj().T)<1e-11
    return z
def mode_hessian(mode):
    """Exact native 4x4 Q125/v61 current-seagull response, vectorized over p.

    Same contractions as earlier original source but P momenta processed at once.
    No hand-set eigenvalues or regulator. Returns H, eigenvalues, Ward residual.
    """
    omega=2*np.pi*np.array(mode)/shape
    P=len(ferm)
    H=np.zeros((11,11),complex)
    for q,mult in charges.items():
        uu=ferm@D.T+q*Astar[None,:]
        vv=uu+(D@omega)[None,:]
        eu=np.exp(1j*uu);em=eu.conj()
        ev=np.exp(1j*vv);evm=ev.conj()
        x=(3*r+1-M)*np.broadcast_to(I4,(P,4,4)).copy()
        x+=np.einsum("jab,pj->pab",F,eu)+np.einsum("jab,pj->pab",B,em)
        y=(3*r+1-M)*np.broadcast_to(I4,(P,4,4)).copy()
        y+=np.einsum("jab,pj->pab",F,ev)+np.einsum("jab,pj->pab",B,evm)
        x=np.einsum("ab,pbc->pac",g5,x)
        y=np.einsum("ab,pbc->pac",g5,y)
        ex=np.einsum("pab,pba->p",x,x).real/4
        ey=np.einsum("pab,pba->p",y,y).real/4
        denx=ex[:,None]+mu2[None,:]
        deny=ey[:,None]+mu2[None,:]
        weights=1/(denx*deny)
        alpha=weights.sum(axis=1)
        beta=weights@mu2
        gamma=(1/denx).sum(axis=1)
        J=1j*q*np.einsum("ab,pjbc->pjac",g5,
             F[None,:,:,:]*eu[:,:,None,None]-B[None,:,:,:]*evm[:,:,None,None])
        W=-q*q*np.einsum("ab,pjbc->pjac",g5,
             F[None,:,:,:]*eu[:,:,None,None]+B[None,:,:,:]*em[:,:,None,None])
        temp=np.einsum("pab,pjbc,pcd->pjad",y,J,x,optimize=True)
        H+=mult*(np.einsum("p,pjab,pkab->jk",alpha,temp,J.conj(),optimize=True)
               -np.einsum("p,pjab,pkab->jk",beta,J,J.conj(),optimize=True))
        H[np.diag_indices(11)]-=mult*np.einsum("p,pab,pjba->j",gamma,x,W,optimize=True)
    H/=P
    anti=np.linalg.norm(H-H.conj().T)/max(1,np.linalg.norm(H))
    assert anti<5e-10,(mode,anti)
    H=(H+H.conj().T)/2
    gauge=1-np.exp(-1j*D@omega)
    ward=np.linalg.norm(H@gauge)/max(1,np.linalg.norm(H)*np.linalg.norm(gauge))
    assert ward<5e-10,(mode,ward)
    return H,np.linalg.eigvalsh(H),float(ward)


def normalized_action(a):
    z,grad=spectral_action_grad(a)
    return z/V,grad/V

def flux_distances(a):
    dist=[]
    for i in range(3):
        for bits in product((0,-1),repeat=2):
            down=list(bits);down.insert(i,-1)
            up=down.copy();up[i]=0
            j=next(k for k in range(3,11) if list(D[k,1:])==down)
            l=next(k for k in range(3,11) if list(D[k,1:])==up)
            flux=a[j]+a[i]-a[l]
            dist.append(2*abs(np.sin(flux/6)))
    return np.asarray(dist)

# Derive candidate branches by descending the actual unstable old Astar mode.
base=normalized_action(original)[0]
Hseed,evals,_=mode_hessian((0,0,0,0))
lam,VEC=eigh(Hseed)
assert lam[0]<-1000
v=VEC[:,0].real
v/=np.linalg.norm(v)
branches=[]
for sign in (-1,1):
    fit=minimize(normalized_action, original+sign*.02*v, method="L-BFGS-B", jac=True,
                 options={"maxiter":240,"ftol":2e-13,"gtol":1e-8,"maxls":45})
    point=fit.x.copy()
    for iteration in range(6):
        Astar=point.copy()
        action,grad=normalized_action(point)
        if np.linalg.norm(grad)<1e-7:break
        H,_,_=mode_hessian((0,0,0,0))
        direction=np.linalg.solve(H.real,grad)
        step=1.
        while step>=1e-7 and normalized_action(point-step*direction)[0]>action+1e-9:
            step/=2
        assert step>=1e-7,("no Newton descent",sign)
        point-=step*direction
    Astar=point.copy()
    action,grad=normalized_action(point)
    h,ev,ward=mode_hessian((0,0,0,0))
    if np.linalg.norm(grad)>1e-6:raise AssertionError(("stationary gradient",sign,grad))
    if ev[0]<0:raise AssertionError(("uniform branch not stable",sign,ev[0]))
    flux=flux_distances(point)
    branches.append((point,{"sign":sign,"action_per_site":float(action),
       "action_drop_per_site":float(action-base),
       "gradient_norm":float(np.linalg.norm(grad)),
       "uniform_min":float(ev[0]),"min_flux":float(flux.min()),
       "max_flux":float(flux.max()),
       "angles_pi":[float(x/np.pi) for x in point]}))
    print("NS4 optimized branch",branches[-1][1],flush=True)

curved=[x for x in branches if x[1]["min_flux"]>1]
flat=[x for x in branches if x[1]["max_flux"]<1e-4]
assert len(curved)==len(flat)==1,(branches,)
assert curved[0][1]["action_per_site"]>flat[0][1]["action_per_site"]+1000
Astar=curved[0][0].copy()
# Full 4224-variable Hessian through all 384 11x11 native Fourier blocks.
mode_results={};Npos=Nneg=Nzero=0;minimum=float("inf");max_ward=0.
for mode in product(range(6),range(4),range(4),range(4)):
    mat,eigen,ward=mode_hessian(mode)
    p=int(sum(eigen>1e-7));n=int(sum(eigen<-1e-7));z=int(sum(abs(eigen)<=1e-7))
    Npos+=p;Nneg+=n;Nzero+=z
    mini=float(min(t for t in eigen if t>1e-7))
    minimum=min(minimum,mini);max_ward=max(max_ward,ward)
    mode_results[",".join(map(str,mode))]={"positive":p,"negative":n,"zero":z,"min_pos":mini,"ward":float(ward)}
assert (Npos,Nneg,Nzero)==(3841,0,383),(Npos,Nneg,Nzero)
assert minimum>0.1 and max_ward<1e-10
print("NS4 CURVED FULL INERTIA",Npos,Nneg,Nzero,"minimum",minimum,"Ward",max_ward,flush=True)
# Independently finite-difference the analytically derived uniform gauge gradient.
eps=1e-4
mu0,axis=eigh(mode_hessian((0,0,0,0))[0])
test_axis=axis[:,0].real
test_axis/=np.linalg.norm(test_axis)
grad_plus=normalized_action(Astar+eps*test_axis)[1]
grad_minus=normalized_action(Astar-eps*test_axis)[1]
fd=(grad_plus-grad_minus)/(2*eps)
H0=mode_hessian((0,0,0,0))[0]
err=float(np.linalg.norm(fd-H0@test_axis)/max(1,np.linalg.norm(H0@test_axis)))
assert err<2e-5,err
summary={"source":"ORIGINAL Q101/Q124/Q125 and original 11-direction v61",
 "volume":[6,4,4,4],"sites":384,"links":4224,"curved":curved[0][1],
 "flat":flat[0][1],"full_curved_inertia":[Npos,Nneg,Nzero],
 "smallest_positive":minimum,"max_ward":max_ward,
 "independent_uniform_gradient_FD_relative":err,
 "status":"conditional finite graded action, not continuum physical law",
 "modes":mode_results}
if len(sys.argv)>1:
    output=Path(sys.argv[1]);output.parent.mkdir(parents=True,exist_ok=True)
    output.write_text(json.dumps(summary,indent=2))
print("SOURCE-NATIVE 384-SITE CURVED Q125 GRADED GAUGE CERTIFICATE PASS",flush=True)

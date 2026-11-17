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
mu2=(k*np.r_[er,el])**2
M=float(v.M_EXACT)
ferm=np.array([(np.pi*(2*t+1)/6,*[np.pi*a for a in b])
               for t in range(6) for b in product((0,1),repeat=3)])
Astar=np.r_[np.full(3,3*np.pi/4),
            [-np.pi/4,np.pi/2,np.pi/2,5*np.pi/4,
             np.pi/2,5*np.pi/4,5*np.pi/4,2*np.pi]]
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
base,_=spectral_action_grad(np.zeros(11))
sstar,gstar=spectral_action_grad(Astar)
assert sstar<base-1e5
assert np.linalg.norm(gstar)<1e-6
# Per-energy group cancellation of 3×q=1 and 9×q=1/3 derivatives;
# q=2/3 group derivatives vanish, independently of internal mu spectra.
a,da=dispersion(1.,Astar);b,db=dispersion(1/3,Astar)
c,dc=dispersion(2/3,Astar)
assert np.max(abs(np.sort(a)-np.sort(b)))<1e-12
maxcancel=0.
for energy in np.unique(np.round(a,10)):
    i=np.isclose(a,energy,atol=1e-10,rtol=0)
    j=np.isclose(b,energy,atol=1e-10,rtol=0)
    assert sum(i)==sum(j)
    maxcancel=max(maxcancel,np.linalg.norm(3*da[i].sum(axis=0)+9*db[j].sum(axis=0)))
for energy in np.unique(np.round(c,10)):
    j=np.isclose(c,energy,atol=1e-10,rtol=0)
    maxcancel=max(maxcancel,np.linalg.norm(dc[j].sum(axis=0)))
assert maxcancel<1e-11,maxcancel
tri=[]
for axis in range(3):
    for rest in product((0,-1),repeat=2):
        down=list(rest);down.insert(axis,-1)
        up=down.copy();up[axis]=0
        j=next(t for t in range(3,11) if list(D[t,1:])==down)
        l=next(t for t in range(3,11) if list(D[t,1:])==up)
        tri.append(Astar[j]+Astar[axis]-Astar[l])
assert np.allclose(tri,3*np.pi/2,atol=1e-12)
flux=float(np.sqrt(np.mean((2*np.abs(np.sin(np.array(tri)/6)))**2)))
assert abs(flux-np.sqrt(2))<1e-12
print("Q161 native new stationary background action change",sstar-base,
      "grad",np.linalg.norm(gstar),"band cancellation",maxcancel,"triangle Wilson",flux,flush=True)
# Original 4×4 Bloch current and seagull for uniform background; full charge
# and 444-state graded mass spectra, not hand-written Hessian eigenvalues.
def hp(p,q):
    u=D@p+q*Astar
    x=np.einsum("jab,j->ab",F,np.exp(1j*u))
    y=np.einsum("jab,j->ab",B,np.exp(-1j*u))
    z=g5@((3*r+1-M)*I4+x+y)
    assert np.linalg.norm(z-z.conj().T)<1e-11
    return z
def mode_hessian(mode):
    omega=2*np.pi*np.array(mode)/shape
    H=np.zeros((11,11),complex)
    for q,mult in charges.items():
        for p in ferm:
            x=hp(p,q);y=hp(p+omega,q)
            ex=np.trace(x@x).real/4;ey=np.trace(y@y).real/4
            dd=(ex+mu2)*(ey+mu2)
            alpha=np.sum(1/dd);beta=np.sum(mu2/dd);gamma=np.sum(1/(ex+mu2))
            u=D@p+q*Astar;vv=D@(p+omega)+q*Astar
            J=1j*q*np.einsum("ab,jbc->jac",g5,
               F*np.exp(1j*u)[:,None,None]-B*np.exp(-1j*vv)[:,None,None])
            W=-q*q*np.einsum("ab,jbc->jac",g5,
               F*np.exp(1j*u)[:,None,None]+B*np.exp(-1j*u)[:,None,None])
            a=np.einsum("ab,jbc,cd->jad",y,J,x)
            H+=mult*(alpha*np.einsum("jab,kab->jk",a,J.conj())
                    -beta*np.einsum("jab,kab->jk",J,J.conj()))
            H[np.diag_indices(11)]-=mult*gamma*np.einsum("ab,jba->j",x,W)
    H/=48
    assert np.linalg.norm(H-H.conj().T)/max(1,np.linalg.norm(H))<1e-10
    H=(H+H.conj().T)/2
    gauge=1-np.exp(-1j*D@omega)
    ward=np.linalg.norm(H@gauge)/max(1,np.linalg.norm(H)*np.linalg.norm(gauge))
    assert ward<1e-10,(mode,ward)
    return H,np.linalg.eigvalsh(H),float(ward)
results={}
for mode in product(range(6),range(2),range(2),range(2)):
    H,ev,w=mode_hessian(mode)
    results[",".join(map(str,mode))]={
      "positive":int(sum(ev>1e-7)),"negative":int(sum(ev<-1e-7)),
      "zero":int(sum(abs(ev)<=1e-7)),
      "minimum_positive":float(min(x for x in ev if x>1e-7)),
      "ward":w}
inertia={n:sum(row[n] for row in results.values()) for n in ("positive","negative","zero")}
assert inertia=={"positive":481,"negative":0,"zero":47},inertia
minphys=min(x["minimum_positive"] for x in results.values())
maxward=max(x["ward"] for x in results.values())
assert minphys>.03 and maxward<1e-10
print("Q161 NEW graded vacuum 528 inertia",inertia,"minpos",minphys,"maxward",maxward,flush=True)
# Independently differentiate ORIGINAL real-space v61 192×192 nonlinear determinant.
for mode in [(0,0,0,0),(0,1,0,0),(1,0,0,0),(0,1,1,1)]:
    H,_,w=mode_hessian(mode)
    vec=eigh(H)[1][:,-1].real;vec/=np.linalg.norm(vec)
    omega=2*np.pi*np.array(mode)/shape
    field=np.array([np.cos(omega@x)*vec for x in sites])
    def true_action(eps):
        total=0.
        for q,mult in charges.items():
            links=np.exp(1j*q*(Astar[None,:]+eps*field))
            h=G5@(v.wilson_operator_from_links(links)-M*np.eye(192))
            assert np.linalg.norm(h-h.conj().T)<1e-9
            spectrum=eigh(h,eigvals_only=True,check_finite=False)
            total+=-.5*mult*np.log(spectrum[:,None]**2+mu2[None,:]).sum()
        return total
    eps=4e-4
    measured=(true_action(eps)+true_action(-eps)-2*true_action(0))/(eps*eps)
    is_selfconj=np.allclose(np.mod(2*omega,2*np.pi),0,atol=1e-10)
    expected=(48 if is_selfconj else 24)*np.vdot(vec,H@vec).real
    err=abs(measured-expected)/max(1,abs(expected))
    print("Q161 GRADED nonzero flux direct determinant FD",mode,"relative_error",err,flush=True)
    assert err<2e-5,(mode,err)
if len(sys.argv)>1:
    outpath=Path(sys.argv[1]);outpath.parent.mkdir(parents=True,exist_ok=True)
    outpath.write_text(json.dumps({"Astar":Astar.tolist(),"delta_action":sstar-base,
         "gradient_norm":float(np.linalg.norm(gstar)),"band_cancellation":maxcancel,
         "triangle_qmin_Wilson":flux,"inertia":inertia,"minimum_positive":minphys,
         "max_ward":maxward,"modes":results,"status":"CONDITIONAL FINITE THEORY; continuum OPEN"},indent=2))
print("Q161 SOURCE NATIVE NONZERO TRIANGLE FLUX STABLE 481+ 0- 47 GAUGE, 4 DIRECT FD PASS",flush=True)

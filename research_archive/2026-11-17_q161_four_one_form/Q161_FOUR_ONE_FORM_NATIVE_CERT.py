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




# Exact first-order original v61 Dirac coframe from all eleven links:
# -M I + i gamma^0 (p_t - (p_x+p_y+p_z)/2) + i sum_i gamma^i p_i + O(p^2).
from fractions import Fraction
from scipy.linalg import null_space
tetrad=np.array([[1.,-.5,-.5,-.5],[0,1.,0,0],[0,0,1.,0],[0,0,0,1.]])
assert len(D)==11 and np.linalg.det(tetrad)==1.
assert np.array_equal(np.mean(D[3:],axis=0),tetrad[0])
assert np.linalg.norm((3*r+1-M)*I4+np.sum(F+B,axis=0)+M*I4)<1e-12
for mu in range(4):
    derivative=np.einsum("j,jab->ab",D[:,mu],F-B)
    expected=np.einsum("a,abc->bc",tetrad[:,mu],np.asarray(gams))
    assert np.linalg.norm(derivative-expected)<1e-12
metric=tetrad.T@tetrad
assert np.allclose(metric,[[1,-.5,-.5,-.5],[-.5,1.25,.25,.25],[-.5,.25,1.25,.25],[-.5,.25,.25,1.25]],atol=0,rtol=0)
print("ORIGINAL ELEVEN-LINK UNIMODULAR DIRAC COFRAME PASSES",metric.tolist(),flush=True)

def link_embedding(k):
    """Four continuum 1-form components -> original eleven straight-link integrals.

    E(k) (i k) = 1 - exp(-i D k) exactly: gauge-gradient embedding.
    """
    z=D@k
    f=np.ones(11,dtype=complex)
    nz=np.abs(z)>1.e-13
    f[nz]=(1-np.exp(-1j*z[nz]))/(1j*z[nz])
    E=f[:,None]*D
    assert np.linalg.matrix_rank(E)==4
    assert np.linalg.norm(E@(1j*k)-(1-np.exp(-1j*z)))<1e-11
    return E

def photon_four_kernel(H,k):
    """Integrate native seven edge-only directions via exact Schur complement."""
    E=link_embedding(k)
    N=null_space(E.conj().T)
    assert N.shape==(11,7)
    M7=N.conj().T@H@N
    eigen7=np.linalg.eigvalsh(M7)
    assert eigen7[0]>1e-6,eigen7
    Q=N.conj().T@H@E
    K4=E.conj().T@H@E - Q.conj().T@np.linalg.solve(M7,Q)
    K4=(K4+K4.conj().T)/2
    residual=np.linalg.norm(K4@(1j*k))/max(1.,np.linalg.norm(K4)*np.linalg.norm(k))
    assert residual<1e-10,residual
    val=np.linalg.eigvalsh(K4)
    assert val[0]>-1e-8
    if np.linalg.norm(k)>1e-12:
        assert abs(val[0])<1e-8 and val[1]>0,(k,val)
    else:assert val[0]>0
    return K4,val,float(eigen7[0]),float(residual)

# These are NUMERICAL STATIONARY OUTPUTS from the prior original-formula
# deterministic optimizer, not experimentally fitted parameters.
# Every seed is rechecked directly against the ORIGINAL Q125/v61 action.
seeds=json.loads(Path(__file__).with_name("Q161_SAVED_NS4_NS6_BRANCHES.json").read_text())
outputs={}
for label in ("4_curved","4_flat","6_curved"):
    item=seeds[label]
    ns=int(item["ns"])
    shape=np.array([6,ns,ns,ns])
    ferm=np.array([(np.pi*(2*t+1)/6,*[2*np.pi*n/ns for n in xyz])
                   for t in range(6) for xyz in product(range(ns),repeat=3)])
    Astar=np.array(item["angles"],float)
    assert len(Astar)==11 and len(ferm)==6*ns**3
    base,grad=spectral_action_grad(Astar)
    measured=float(base/len(ferm))
    gr=float(np.linalg.norm(grad/len(ferm)))
    assert abs(measured-item["action_per_site"])<3e-4,(label,measured,item)
    assert gr<2e-6,(label,gr)
    block={}
    for mode in ((0,0,0,0),(1,0,0,0),(0,1,0,0),(0,2,0,0)):
        H,ev,w=mode_hessian(mode)
        k=2*np.pi*np.array(mode)/shape
        K4,values,extra,check=photon_four_kernel(H,k)
        assert w<1e-10
        block[",".join(map(str,mode))]={
          "momentum":k.tolist(),
          "four_K_diag":[float(a) for a in np.diag(K4).real],
          "four_K_eigenvalues":[float(a) for a in values],
          "embedded_longitudinal_Ward":float(check),
          "eliminated_seven_minimum":float(extra),
          "native_link_Ward":float(w)}
    outputs[label]={"original_action_per_site":measured,"gradient_norm":gr,"mode_response":block}
    print("Q161 FOUR PHOTON COMPONENT RESPONSE",label,
          "k0",block["0,0,0,0"]["four_K_diag"],
          "t1",block["1,0,0,0"]["four_K_diag"],
          "x1",block["0,1,0,0"]["four_K_diag"],flush=True)
# The temporal A_y finite-momentum response is insensitive (0.53% drift)
# over the independently optimized Ns4 and Ns6 curved branches, without a fit.
zt4=outputs["4_curved"]["mode_response"]["1,0,0,0"]["four_K_diag"][2]
zt6=outputs["6_curved"]["mode_response"]["1,0,0,0"]["four_K_diag"][2]
drift=abs(zt6-zt4)/zt6
assert drift<.01,(zt4,zt6,drift)
report={"source":"Original Q101 all-five source, Q125 444/Q96, v61 11 links",
        "result_class":"conditional finite geometric four-one-form embedding",
        "unimodular_tetrad":tetrad.tolist(),"gram_metric":metric.tolist(),
        "temporal_response_Q161_NS4_NS6":[float(zt4),float(zt6)],
        "temporal_relative_drift":float(drift),
        "continuum_Lorentz_or_physical_photon_proved":False,
        "numerical_branches":outputs}
if len(sys.argv)>1:
    path=Path(sys.argv[1]);path.parent.mkdir(parents=True,exist_ok=True)
    path.write_text(json.dumps(report,indent=2))
print("Q161 NATIVE DIRAC COFRAME + FOUR GAUGE COMPONENTS + SEVEN-MODE SCHUR PASS",flush=True)

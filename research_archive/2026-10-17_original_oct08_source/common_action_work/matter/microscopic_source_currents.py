#!/usr/bin/env python3
"""Actual archived Wilson source entries; later physical charge/Higgs registry.

No response-law Yukawa outputs, mass anchors, or new history completion are used.
The reflected v61 kernel is an archived structural restriction, not a claimed
replacement for the full A4 selected Hamiltonian. Its filled-sea response is the
specified finite Hermitian-kernel/Fock response, not a selected photon residue.
"""
from pathlib import Path
import importlib.util
import sys
import hashlib
import json
import os
import tempfile
import numpy as np
from scipy.linalg import expm

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent
SOURCE = ROOT / "canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py"
GAUGE = ROOT / "combined_source_work/gauge/charged_gauge_join_operators.npz"
HISTORY = ROOT / "combined_source_work/species/combined_signed_source_operators.npz"
SPEC = ROOT / "common_action_work/recovery/theory_input_v5.md"
spec = importlib.util.spec_from_file_location("actual_v61_matter_source", SOURCE)
v61 = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = v61
spec.loader.exec_module(v61)

def norm(a):
    return float(np.linalg.norm(a))

def comm(a,b):
    return a@b-b@a

def sea(h):
    e,V = np.linalg.eigh(h)
    if min(abs(e)) < 1.e-9:
        raise ValueError("A source-zero spectral gap is required for this sea derivative")
    Vm,Vp = V[:,e<0],V[:,e>0]
    return e,V,Vm,Vp

def curvature(h,j,w):
    e,V,Vm,Vp=sea(h)
    d=e[e>0][None,:]-e[e<0][:,None]
    tr=Vm.conj().T@j@Vp
    contact=float(np.trace(Vm.conj().T@w@Vm).real)
    para=float(-2*np.sum(abs(tr)**2/d))
    return contact,para,contact+para

def atomic_npz(path, arrays):
    fd,tmp = tempfile.mkstemp(prefix=path.stem+"_",suffix=".npz",dir=path.parent)
    try:
        with os.fdopen(fd,"wb") as f:
            np.savez_compressed(f,**arrays)
            f.flush()
            os.fsync(f.fileno())
        with np.load(tmp,allow_pickle=False) as archive:
            if set(archive.files)!=set(arrays):
                raise AssertionError("archive keys")
            for key in archive.files:
                if not np.all(np.isfinite(archive[key])):
                    raise AssertionError("nonfinite archive "+key)
        os.replace(tmp,path)
        with np.load(path,allow_pickle=False) as archive:
            return len(archive.files)
    finally:
        if os.path.exists(tmp):
            os.unlink(tmp)

def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()

gammas,g5=v61.gamma_matrices()
nsite=len(v61.SITES)
ndir=len(v61.DIRECTIONS)
nlink=nsite*ndir
G5=np.kron(np.eye(nsite),g5)
I=np.eye(4*nsite)
flat=np.ones((nsite,ndir),complex)
def h_of_phase(theta):
    return G5@(v61.wilson_operator_from_links(np.exp(1j*theta.reshape(nsite,ndir)))
               -float(v61.M_EXACT)*I)
h0=h_of_phase(np.zeros(nlink))
e,V,Vm,Vp=sea(h0)
em,ep=e[e<0],e[e>0]
gap=ep[None,:]-em[:,None]

# Sparse hoppings are read from precisely the branches of the archived source.
# Every independent forward link includes its uniquely supplied backward term.
edges=np.empty((nlink,2),int)
hops=np.empty((nlink,4,4),complex)
incidence=np.zeros((nlink,nsite))
transition=np.empty((nlink,len(em),len(ep)),complex)
contact=np.empty(nlink)
mean_current=np.empty(nlink)
def vertex(l,second=False):
    x,y=edges[l]
    t=hops[l]
    out=np.zeros_like(h0)
    xy=slice(4*x,4*x+4)
    yy=slice(4*y,4*y+4)
    out[xy,yy]+=(-t if second else 1j*t)
    out[yy,xy]+=(-t.conj().T if second else -1j*t.conj().T)
    return out
for x,site in enumerate(v61.SITES):
    for d,displacement in enumerate(v61.DIRECTIONS):
        l=x*ndir+d
        y=v61.SITE_INDEX[v61.periodic_shift(site,displacement)]
        forward=(.5*(gammas[d+1]-float(v61.R_EXACT)*np.eye(4))
                 if d<3 else (gammas[0]-np.eye(4))/16)
        t=g5@forward*v61.antiperiodic_sign(site,displacement)
        edges[l]=x,y
        hops[l]=t
        incidence[l,x]+=1
        incidence[l,y]-=1
        Xm,Ym=Vm[4*x:4*x+4],Vm[4*y:4*y+4]
        Xp,Yp=Vp[4*x:4*x+4],Vp[4*y:4*y+4]
        transition[l]=1j*(Xm.conj().T@t@Yp-Ym.conj().T@t.conj().T@Xp)
        contact[l]=-2*np.trace(Xm.conj().T@t@Ym).real
        mean_current[l]=float((1j*np.trace(Xm.conj().T@t@Ym)
                              -1j*np.trace(Ym.conj().T@t.conj().T@Xm)).real)

weighted=(transition/np.sqrt(gap)[None,:,:]).reshape(nlink,-1)
paramagnetic=-2*(weighted@weighted.conj().T).real
Pi=paramagnetic+np.diag(contact)
Pi=.5*(Pi+Pi.T)
ward=Pi@incidence
pi_eigs=np.linalg.eigvalsh(Pi)
Uinc,sinc,Vinc=np.linalg.svd(incidence,full_matrices=False)
rank_inc=int(sum(sinc>1e-9))
gaugebasis=Uinc[:,:rank_inc]
transverse=np.eye(nlink)-gaugebasis@gaugebasis.T

# Independent source-entry differences and nonlinear local gauge-orbit contacts.
rng=np.random.default_rng(16413)
omega=rng.normal(size=nsite)
omega-=omega.mean()
omega/=np.linalg.norm(omega)
theta_g=incidence@omega
Omega=np.kron(np.diag(omega),np.eye(4))
jg=sum(theta_g[l]*vertex(l) for l in range(nlink))
wg=sum(theta_g[l]**2*vertex(l,True) for l in range(nlink))
gaugeJ=1j*comm(Omega,h0)
gaugeW=-comm(Omega,comm(Omega,h0))
theta_t=rng.normal(size=nlink)
theta_t=transverse@theta_t
theta_t/=np.linalg.norm(theta_t)
probe_j=sum(theta_t[l]*vertex(l) for l in range(nlink))
probe_w=sum(theta_t[l]**2*vertex(l,True) for l in range(nlink))
source_hess=float(theta_t@Pi@theta_t)
fd_step=2e-4
E0=float(sum(em))
fd=(sum(np.linalg.eigvalsh(h_of_phase(fd_step*theta_t))[:len(em)])
    +sum(np.linalg.eigvalsh(h_of_phase(-fd_step*theta_t))[:len(em)])-2*E0)/fd_step**2
entry_step=2e-5
ell=83
basis=np.zeros(nlink);basis[ell]=1
entry_first=(h_of_phase(entry_step*basis)-h_of_phase(-entry_step*basis))/(2*entry_step)
entry_second=(h_of_phase(entry_step*basis)+h_of_phase(-entry_step*basis)-2*h0)/entry_step**2
gauge_angle=.27
Ug=np.diag(np.exp(1j*np.repeat(gauge_angle*omega,4)))
gauge_exact=h_of_phase(gauge_angle*theta_g)-Ug@h0@Ug.conj().T

# Uniform source transition weights and absorption f-sum are computed rather
# than identifying the one-particle eigenvalues with ordinary-current poles.
jp=Vm.conj().T@probe_j@Vp
absorption=abs(jp)**2
delta=gap
positive_weight=float(absorption.sum())
f_sum=float(np.sum(delta*absorption))
Pminus=Vm@Vm.conj().T
doublecomm=.5*float(np.trace(Pminus@comm(probe_j,comm(h0,probe_j))).real)
z=.8+.11j # declared dimensionless verification argument; no physical frequency fit
chi=sum((absorption/(z-delta)-absorption/(z+delta)).ravel())
static_chi=-2*float(np.sum(absorption/delta))
probe_contact=float(np.trace(Pminus@probe_w).real)

# Actual physical charge registry, preserved with electron charge -1. It is
# noncentral in the weak algebra; no arbitrary normalization of this source.
with np.load(GAUGE,allow_pickle=False) as ar:
    generators=ar["generators96"].copy()
    Q16=ar["Qem_particle16"].copy()
Q=generators[0]+generators[3]
qindex=float(np.trace(Q@Q).real)
weak_noncentral=norm(comm(Q,generators[1]))
thA,thB=Q,generators[1]
source_contact_ab=-.5*(thA@thB+thB@thA)
# Difference of mixed exponential sources verifies anticommutator seagull.
s=2e-4
mixed=(expm(1j*s*(thA+thB))-expm(1j*s*(thA-thB))
       -expm(1j*s*(-thA+thB))+expm(-1j*s*(thA+thB)))/(4*s*s)

# Gauge-covariant Higgs/Yukawa expression, using existing history-loaded
# amplitudes as a declared coefficient sample, never archived response masses.
with np.load(HISTORY,allow_pickle=False) as ar:
    Ys=ar["loaded_amplitudes"][:,0].copy()
pauli=[
    np.array([[0,1],[1,0]],complex),
    np.array([[0,-1j],[1j,0]],complex),
    np.diag([1.,-1.]).astype(complex)]
Q48=np.kron(np.eye(3),Q16)
QH=np.diag([1.,0.])
def D48(H):
    tilde=1j*pauli[1]@H.conj()
    out=np.zeros((48,48),complex)
    slots=[(0,slice(8,11),tilde,slice(0,6)),
           (1,slice(11,14),H,slice(0,6)),
           (2,slice(14,15),H,slice(6,8)),
           (3,slice(15,16),tilde,slice(6,8))]
    for gi in range(3):
        for gj in range(3):
            for f,right,vec,left in slots:
                entry=Ys[f,gi,gj]*(np.kron(np.eye(3),vec[:,None]) if f<2 else vec[:,None])
                out[16*gi+left.start:16*gi+left.stop,
                    16*gj+right.start:16*gj+right.stop]+=entry
    return out+out.conj().T
def D96(H):
    d=D48(H)
    return np.block([[d,np.zeros_like(d)],[np.zeros_like(d),d.conj()]])
phi=(1+np.sqrt(5))/2
alpha=phi**-2
Hneutral=np.array([0,alpha],complex) # verification chart; h remains symbolic in theorem
Hcharged=np.array([alpha/3+1j*alpha/5,alpha],complex)
DH=D96(np.array([1.,0.],complex))
Dn=D96(Hneutral)
Dc=D96(Hcharged)
mixed_H=1j*comm(Q,DH)
Jc=1j*comm(Q,Dc)
Wc=-comm(Q,comm(Q,Dc))
gtheta=.31
Uq=expm(1j*gtheta*Q)
Hrot=expm(1j*gtheta*QH)@Hcharged
covariance=norm(D96(Hrot)-Uq@Dc@Uq.conj().T)
hs=2e-5
Hpm=np.array([hs,alpha],complex)
Hmm=np.array([-hs,alpha],complex)
mixed_fd=(D96(expm(1j*hs*QH)@Hpm)-D96(expm(-1j*hs*QH)@Hpm)
          -D96(expm(1j*hs*QH)@Hmm)+D96(expm(-1j*hs*QH)@Hmm))/(4*hs*hs)
cY,pY,kY=curvature(Dc,Jc,Wc)
# This spectral table is only the explicitly typed tensor-sum restriction.
# It does not identify the microscopic Lorentz/Yukawa/wall insertion with it.
eY=np.linalg.eigvalsh(Dn)
tensor_energies=e[:,None]+eY[None,:]
tensor_gap=float(np.min(abs(tensor_energies)))
tensor_occupation_preserved=bool(np.all((tensor_energies<0)==(e[:,None]<0)))
neutral_y_norm=float(max(abs(eY)))
neutral_h_chart_boundary=alpha*float(min(abs(e)))/neutral_y_norm

# A source probe in this same literal operator, with a fixed geometric site
# projection. This is a Schur/source identity test, never a generation filter.
keep=np.arange(4)
hidden=np.arange(4,4*nsite)
def blocks(a):
    return a[np.ix_(keep,keep)],a[np.ix_(keep,hidden)],a[np.ix_(hidden,keep)],a[np.ix_(hidden,hidden)]
A,B,C,D=blocks(h0)
jA,jB,jC,jD=blocks(probe_j)
wA,wB,wC,wD=blocks(probe_w)
sz=.8+.11j # same declared dimensionless complex check, not a particle pole
Rh=np.linalg.inv(sz*np.eye(len(hidden))-D)
Re=np.linalg.inv(sz*I-h0)
Ke=sz*np.eye(len(keep))-A-B@Rh@C
Ge=np.linalg.inv(Ke)
R1=Rh@jD@Rh
R2=Rh@wD@Rh+2*Rh@jD@Rh@jD@Rh
Jeff=jA+jB@Rh@C+B@Rh@jC+B@R1@C
Weff=wA+wB@Rh@C+B@Rh@wC+2*jB@Rh@jC+2*jB@R1@C+2*B@R1@jC+B@R2@C
def schur_at(s):
    aa,bb,cc,dd=blocks(h_of_phase(s*theta_t))
    return sz*np.eye(len(keep))-aa-bb@np.linalg.solve(sz*np.eye(len(hidden))-dd,cc)
schur_step=2e-4
Kp,Km=schur_at(schur_step),schur_at(-schur_step)
Jeff_fd=-(Kp-Km)/(2*schur_step)
Weff_fd=-(Kp+Km-2*Ke)/schur_step**2
# -log det(z-h) first and second source derivatives. Its Schur and hidden
# pieces retain all contacts, independently of any physical mass interpretation.
full_log_first=np.trace(Re@probe_j)
full_log_second=np.trace(Re@probe_w+Re@probe_j@Re@probe_j)
hidden_log_first=np.trace(Rh@jD)
hidden_log_second=np.trace(Rh@wD+Rh@jD@Rh@jD)
ke_log_first=np.trace(Ge@Jeff)
ke_log_second=np.trace(Ge@Weff+Ge@Jeff@Ge@Jeff)

checks={
 "literal_v61_h_is_selfadjoint":norm(h0-h0.conj().T),
 "gap_from_zero":float(min(abs(e))),
 "negative_and_positive_counts":[len(em),len(ep)],
 "link_first_entry_fd_error":norm(entry_first-vertex(ell)),
 "link_second_entry_fd_error":norm(entry_second-vertex(ell,True)),
 "flat_mean_link_current_max":float(max(abs(mean_current))),
 "local_incidence_rank":rank_inc,
 "local_gauge_vertex_error":norm(jg-gaugeJ),
 "local_gauge_seagull_error":norm(wg-gaugeW),
 "local_gauge_finite_orbit_error":norm(gauge_exact),
 "full_hessian_incidence_Ward_error":norm(ward),
 "relative_hessian_incidence_Ward_error":norm(ward)/(norm(Pi)*norm(incidence)),
 "paramagnetic_alone_incidence_error":norm(paramagnetic@incidence),
 "ground_transverse_source_hessian":source_hess,
 "ground_transverse_fd_hessian":float(fd),
 "ground_transverse_fd_error":float(abs(fd-source_hess)),
 "hessian_eigen_min":float(pi_eigs[0]),
 "hessian_eigen_max":float(pi_eigs[-1]),
 "hessian_rank_at_1e-9":int(sum(abs(pi_eigs)>1e-9)),
 "negative_hessian_modes_at_1e-9":int(sum(pi_eigs < -1e-9)),
 "positive_hessian_modes_at_1e-9":int(sum(pi_eigs > 1e-9)),
 "current_transition_min_gap":float(delta.min()),
 "current_transition_max_gap":float(delta.max()),
 "current_transition_total_positive_weight":positive_weight,
 "current_f_sum":f_sum,
 "current_double_commutator_half":doublecomm,
 "current_f_sum_error":float(abs(f_sum-doublecomm)),
 "current_static_retarded":static_chi,
 "current_contact":probe_contact,
 "current_contact_plus_retarded_equals_hessian_error":abs(probe_contact+static_chi-source_hess),
 "chi_dimensionless_verification_z":[float(chi.real),float(chi.imag)],
 "electron_charge_Q16":float(Q16[14,14].real),
 "physical_Q96_index":qindex,
 "Q_W1_commutator_norm":weak_noncentral,
 "mixed_nonabelian_exponential_contact_error":norm(mixed-source_contact_ab),
 "mixed_Q_weak_seagull_norm":norm(source_contact_ab),
 "neutral_Higgs_Q_commutator_norm":norm(comm(Q,Dn)),
 "charged_Higgs_covariance_error":covariance,
 "mixed_Higgs_gauge_vertex_norm":norm(mixed_H),
 "mixed_Higgs_gauge_vertex_fd_error":norm(mixed_fd-mixed_H),
 "charged_Higgs_orbit_contact":cY,
 "charged_Higgs_orbit_paramagnetic":pY,
 "charged_Higgs_orbit_total_hessian":kY,
 "history_amplitude_sample_norms":[float(norm(y)) for y in Ys],
 "neutral_Yukawa_spectral_norm":neutral_y_norm,
 "conditional_tensor_sum_gap":tensor_gap,
 "conditional_tensor_sum_negative_count":int(np.sum(tensor_energies<0)),
 "conditional_tensor_sum_occupation_preserved":tensor_occupation_preserved,
 "neutral_Higgs_gap_preserving_chart_boundary":neutral_h_chart_boundary,
 "geometric_site_Schur_inverse_error":norm(Ge-Re[np.ix_(keep,keep)]),
 "geometric_site_effective_current_fd_error":norm(Jeff-Jeff_fd),
 "geometric_site_effective_contact_fd_error":norm(Weff-Weff_fd),
 "geometric_site_logdet_first_split_error":float(abs(full_log_first-hidden_log_first-ke_log_first)),
 "geometric_site_logdet_second_split_error":float(abs(full_log_second-hidden_log_second-ke_log_second)),
 "geometric_site_hidden_current_contribution_norm":norm(B@R1@C),
 "geometric_site_effective_current_norm":norm(Jeff),
 "geometric_site_effective_contact_norm":norm(Weff),
 "geometric_site_full_logdet_second":[float(full_log_second.real),float(full_log_second.imag)],
 "geometric_site_hidden_logdet_second":[float(hidden_log_second.real),float(hidden_log_second.imag)],
 "geometric_site_retained_logdet_second":[float(ke_log_second.real),float(ke_log_second.imag)],
}
limits={
 "literal_v61_h_is_selfadjoint":1e-12,"link_first_entry_fd_error":2e-9,
 "link_second_entry_fd_error":3e-6,"flat_mean_link_current_max":1e-12,
 "local_gauge_vertex_error":1e-12,"local_gauge_seagull_error":1e-12,
 "local_gauge_finite_orbit_error":1e-12,"full_hessian_incidence_Ward_error":2e-10,
 "ground_transverse_fd_error":3e-5,"current_f_sum_error":1e-11,
 "current_contact_plus_retarded_equals_hessian_error":1e-11,
 "mixed_nonabelian_exponential_contact_error":1e-6,
 "neutral_Higgs_Q_commutator_norm":1e-12,"charged_Higgs_covariance_error":1e-12,
 "mixed_Higgs_gauge_vertex_fd_error":5e-6,
 "charged_Higgs_orbit_total_hessian":1e-10,
 "geometric_site_Schur_inverse_error":1e-12,
 "geometric_site_effective_current_fd_error":1e-8,
 "geometric_site_effective_contact_fd_error":1e-5,
 "geometric_site_logdet_first_split_error":1e-11,
 "geometric_site_logdet_second_split_error":1e-11,
}
for key,tolerance in limits.items():
    assert abs(checks[key])<tolerance,(key,checks[key],tolerance)
assert checks["gap_from_zero"]>.8
assert checks["local_incidence_rank"]==nsite-1
assert abs(qindex-32)<1e-10 and Q16[14,14]==-1
assert weak_noncentral>1 and checks["mixed_Higgs_gauge_vertex_norm"]>1
arrays={
 "wilson_h0":h0,"wilson_eigenvalues":e,"wilson_eigenvectors":V,
 "link_edges":edges,"link_hops":hops,"site_link_incidence":incidence,
 "mean_link_current":mean_current,"seagull_diagonal":contact,
 "paramagnetic_hessian":paramagnetic,"sea_link_hessian":Pi,
 "sea_link_hessian_eigenvalues":pi_eigs,"local_gauge_phase":omega,
 "local_gauge_vertex":jg,"local_gauge_seagull":wg,
 "transverse_probe":theta_t,"transverse_vertex":probe_j,
 "transverse_seagull":probe_w,"current_transition_gaps":delta,
 "current_transition_positive_weights":absorption,
 "Q96":Q,"Q16":Q16,"physical_generators96":generators,
 "mixed_nonabelian_seagull":source_contact_ab,
 "source_amplitude_sample":Ys,"neutral_Higgs_sample":Hneutral,
 "charged_Higgs_sample":Hcharged,"neutral_Yukawa_D96":Dn,
 "charged_Yukawa_D96":Dc,"charged_Yukawa_current":Jc,
 "charged_Yukawa_contact":Wc,"charged_Higgs_direction_D96":DH,
 "mixed_Higgs_gauge_vertex":mixed_H,
 "site_projection_indices":keep,"site_Schur_kernel":Ke,
 "site_effective_current":Jeff,"site_effective_contact":Weff,
 "site_hidden_resolvent":Rh,"conditional_neutral_tensor_sum_energies":tensor_energies}
archive=OUT/"microscopic_source_currents_operators.npz"
checks["validated_archive_arrays"]=atomic_npz(archive,arrays)
checks["provenance"]={
 "v61_source":str(SOURCE.relative_to(ROOT)),"v61_sha256":sha(SOURCE),
 "physical_registry_sha256":sha(GAUGE),"history_sample_sha256":sha(HISTORY),
 "current_spec_snapshot_sha256":sha(SPEC),"script_sha256":sha(__file__),
 "npz_sha256":sha(archive),
 "scope":"actual reflected v61 Wilson source restriction and gauge-covariant Higgs formula; NOT a new canonical H64 action or full selected photon residue",
 "physical_clock":"symbolic a; h/a, transition gap/a, polarization/a",
 "samples":"alpha=phi^-2 for Higgs verification chart only; no physical vacuum/amplitude fit",
}
named={key:abs(checks[key])<tol for key,tol in limits.items()}
named.update({
 "Wilson_spectral_gap":checks["gap_from_zero"]>.8,
 "Wilson_equal_sea_dimensions":checks["negative_and_positive_counts"]==[96,96],
 "local_incidence_rank_47":checks["local_incidence_rank"]==47,
 "sea_hessian_rank_481":checks["hessian_rank_at_1e-9"]==481,
 "sea_hessian_gauge_nullity_47":528-checks["hessian_rank_at_1e-9"]==47,
 "sea_hessian_has_both_transverse_signs":checks["negative_hessian_modes_at_1e-9"]==72 and checks["positive_hessian_modes_at_1e-9"]==409,
 "physical_Q96_index_32":abs(qindex-32)<1e-10,
 "electron_charge_minus_one":Q16[14,14]==-1,
 "Q_is_noncentral_in_weak_algebra":weak_noncentral>1,
 "mixed_Q_weak_seagull_is_nonzero":checks["mixed_Q_weak_seagull_norm"]>.5,
 "charged_Higgs_mixed_current_is_nonzero":checks["mixed_Higgs_gauge_vertex_norm"]>1,
 "kinetic_sea_response_has_positive_absorption_weights":positive_weight>0 and float(absorption.min())>=0,
 "gap_preserving_conditional_tensor_occupation":tensor_occupation_preserved and tensor_gap>0,
 "atomic_npz_reloaded_all_38_arrays":checks["validated_archive_arrays"]==38,
})
checks["checks"]={key:bool(value) for key,value in named.items()}
checks["passed"]=all(checks["checks"].values())
checks["source_sha256"]={str(p.relative_to(ROOT)):sha(p) for p in [SOURCE,GAUGE,HISTORY,SPEC]}
checks["script_sha256"]=sha(__file__)
checks["archive_sha256"]=sha(archive)
assert checks["passed"]
(OUT/"microscopic_source_currents_checks.json").write_text(json.dumps(checks,indent=2)+"\n")
print(json.dumps(checks,indent=2))

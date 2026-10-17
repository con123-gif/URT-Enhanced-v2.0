#!/usr/bin/env python3
"""Reproducible, source-grounded 6x6 C3 sector plus Gaussian photon cumulant.

Physics scope: explicitly conditioned native 20-face Peierls model, not the
full selected H64 lepton mass operator. NumPy; source scripts in this folder.
No measured lepton masses used.
"""
from __future__ import annotations
import contextlib, io, json, pathlib
import numpy as np
from numpy.linalg import norm, eigvalsh, inv, pinv, svd

HERE=pathlib.Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
    import native_chiral_selected_history as source
s=source; g=s.g
_,_,_,U=g.c.bases(g.v,g.vc,g.faces,g.ds[1],g.ds[2])
face=tuple(g.faces[0]); axis=np.sum(g.v[list(face)],axis=0); axis/=norm(axis)
Z=np.array([[0,-axis[2],axis[1]],[axis[2],0,-axis[0]],[-axis[1],axis[0],0]])
Rxyz=np.eye(3)+np.sin(2*np.pi/3)*Z+(1-np.cos(2*np.pi/3))*(Z@Z)
rotF=g.Fcent@Rxyz.T
per=np.array([np.argmin(norm(g.Fcent-x,axis=1)) for x in rotF])
assert max(norm(rotF-g.Fcent[per],axis=1))<1e-11
R20=np.eye(20)[per].T
R6=U.T@R20@U
assert norm(R6@R6@R6-np.eye(6))<1e-11
assert norm(R6[:3,3:])<1e-11

# The twelve vertices define a complete POVM on the full 20-face carrier:
# E_i=diag(c_inc[:,i])/3, sum_i E_i=I. Mix exactly the three vertex
# outcomes of one oriented icosahedral face, and use its Luede rs square root.
E=[np.diag(g.cinc[:,i])/3 for i in range(12)]
assert norm(sum(E)-np.eye(20))<1e-12
Eface=sum(E[i] for i in face)/3
S=np.diag(np.sqrt(np.diag(Eface)))
assert norm(R20@S@R20.T-S)<1e-11

for_triplets=[]
R3=R6[:3,:3]; R3p=R6[3:,3:]
L3=1j*(R3-R3.T)/np.sqrt(3)
L3p=1j*(R3p-R3p.T)/np.sqrt(3)

def properties(M):
    result=[]
    for i,L in [(0,L3),(3,L3p)]:
        t=M[i:i+3,i:i+3]
        Q=2*np.eye(3)-3*L@L
        a=float((np.trace(t)/3).real)
        b=float((np.trace(t@Q)/6).real)
        c=float((np.trace(t@L)/2).real)
        error=float(norm(t-(a*np.eye(3)+b*Q+c*L)))
        root_s=np.sqrt(b*b+c*c/3)
        eig=eigvalsh(t)
        mQ=float(np.sum(eig*eig)/sum(eig)**2) if min(eig)>0 else None
        result.append({'a':a,'b':b,'c':c,'abs_s_over_v':float(root_s/abs(a)) if a else None,
                       'Koide_Q_if_positive_roots':mQ,'eigenvalues':list(map(float,eig)),
                       'C3_reconstruction_residual':error})
    B=M[:3,3:]
    sing=svd(B,compute_uv=False)
    return {'T1':result[0],'T2':result[1],
            'intertriplet_Frobenius_norm':float(norm(B)),
            'chiral_B_singular_values':list(map(float,sing)),
            'Koide_Q_if_B_singulars_are_sqrt_masses':float(np.sum(sing**2)/np.sum(sing)**2),
            'C3_commutation_error':float(norm(R6.T@M@R6-M)),
            'full6_eigenvalues':list(map(float,eigvalsh(M)))}

# Native 3D dual-polyhedral-cone Maxwell edge covariance.
Cov=pinv(g.Kd,hermitian=True)[:30,:30]
q=np.stack([g.path_vector(a,b) for a,b in g.Wedges]); pairs=g.Wedges
variances=np.einsum('pi,ij,pj->p',q,Cov,q)
assert np.ptp(variances)<1e-11
vpath=float(np.mean(variances))

def make_H(phases=None, damping=1.):
    H=np.zeros((20,20),complex)
    if phases is None: phases=np.zeros(len(pairs))
    for (a,b),phi in zip(pairs,phases):
        H[a,b]=damping*np.exp(1j*phi)
        H[b,a]=damping*np.exp(-1j*phi)
    return H

base=U.T@S@make_H()@S@U
mean_A_unit=s.Aface/g.g2
mean_phases=q@mean_A_unit
src=U.T@S@make_H(mean_phases)@S@U
alpha=float(g.g2)
source_alpha=U.T@S@make_H(alpha*mean_phases)@S@U
Gaussian_alpha=U.T@S@make_H(alpha*mean_phases,np.exp(-alpha*vpath/2))@S@U

# Full 20x20 current-current one-loop resolvent self energy (no classical current),
# INCLUDING contact/seagull from the second Peierls derivative.
# H(A)=sum_p t_p(exp(i q_p.A)|a><b| + h.c.).
# Sigma_2(z)=(g²/2) C_ef H_ef + g² C_ef H_e(z-H0)^-1 H_f.
# This is a Gaussian static-photon model. z is a probe, NOT a mass fit.
H0=S@make_H()@S
V=np.zeros((30,20,20),complex)
Hsecond=np.zeros((20,20),complex)
for (a,b),qp,var in zip(pairs,q,variances):
    h=float(S[a,a]*S[b,b]); coeff=1j*h*qp
    V[:,a,b]+=coeff
    V[:,b,a]+=-coeff
    Hsecond[a,b]-=h*var
    Hsecond[b,a]-=h*var
R0=inv(8*np.eye(20)-H0)
seagull=Hsecond/2
currentcurrent=np.einsum('ef,eij,jk,fkl->il',Cov,V,R0,V,optimize=True)
Sig=seagull+currentcurrent
assert norm(Sig-Sig.conj().T)<1e-11

# Exact energy-dependent 6x6 -> 3x3 Schur and all six pole checks.
X=src; A=X[:3,:3]; B=X[:3,3:]; D=X[3:,3:]
poles=eigvalsh(X)
res=[]
for z in poles:
    if min(abs(eigvalsh(D)-z))>1e-7:
        F=z*np.eye(3)-A-B@inv(z*np.eye(3)-D)@B.conj().T
        res.append(abs(np.linalg.det(F)))
assert max(res)<1e-11
static=A-B@inv(D)@B.conj().T

summary={
 'source':'native conditional 20-face chiral Peierls model; not canonical H64 mass action',
 'conditioning':'equal mixture of three genuine vertex-POVM effects; full 20-face Lueder s sandwich',
 'face':list(map(int,face)),
 'face_rotation_R6_cube_error':float(norm(R6@R6@R6-np.eye(6))),
 'undressed_conditioned':properties(base),
 'unit_coupling_source_conditioned':properties(src),
 'alpha_candidate_source_conditioned':properties(source_alpha),
 'alpha_candidate_Gaussian_and_source':properties(Gaussian_alpha),
 'exact_shell_path_variance':vpath,
 'shell_path_variance_spread':float(np.ptp(variances)),
 'Gaussian_common_amplitude_at_alpha_candidate':float(np.exp(-alpha*vpath/2)),
 'one_loop_z8_full20_seagull_norm_per_g2':float(norm(seagull)),
 'one_loop_z8_full20_current_current_norm_per_g2':float(norm(currentcurrent)),
 'one_loop_z8_full20_cross_current_nonzero':bool(norm(currentcurrent)>1e-12),
 'one_loop_z8_6x6_projected_spectrum_per_g2':list(map(float,eigvalsh(U.T@Sig@U))),
 'one_loop_z8_currentcurrent_6x6':properties(U.T@currentcurrent@U),
 'one_loop_z8_seagull_6x6':properties(U.T@seagull@U),
 'one_loop_z8_full_sigma_6x6':properties(U.T@Sig@U),
 'six_to_three_Schur_pole_det_max_error':float(max(res)),
 'six_to_three_static_z0_eigenvalues':list(map(float,eigvalsh(static))),
 'no_physical_mass_assignment':'T1/T2 are geometric A5 irreps not established chiral fermion L/R; negative eigenvalues and Q mismatch',
}
assert summary['unit_coupling_source_conditioned']['C3_commutation_error']<1e-10
assert summary['undressed_conditioned']['C3_commutation_error']<1e-10
assert summary['undressed_conditioned']['intertriplet_Frobenius_norm']>0.02
assert summary['undressed_conditioned']['T1']['b']>0.1
assert abs(summary['undressed_conditioned']['T1']['c'])<1e-10
(HERE/'six_triplet_results.json').write_text(json.dumps(summary,indent=2))
print(json.dumps(summary,indent=2))

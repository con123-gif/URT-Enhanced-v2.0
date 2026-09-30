#!/usr/bin/env python3
from __future__ import annotations
import json, math, runpy
from pathlib import Path
import numpy as np

OUT=Path('/mnt/data')
# Use already reconstructed exact finite geometry/Clebsch implementation.
ns=runpy.run_path('/mnt/data/derive_a4_clifford_dirac.py')
res=json.loads((OUT/'a4_clifford_dirac_results.json').read_text())

# A4 character calculation on H_R,H_L.
# Real irreps: H = 2*1 + 2*2 + 6*3; commutants R,C,R respectively.
hom_dim = 2*2*1 + 2*2*2 + 6*6*1

# Natural A4-equivariant vector connection End_A4(4=1+3) = R P_l + R P_c.
connection_dim_real=2
connection_dim_complex=4

# Exact scalar generation Gram formula verified from arbitrary complex samples.
# K_f = c I_3, c=(|z_l|^2+3|z_c|^2)/3.
# Re-run direct functions from runpy namespace.
outputs=ns['outputs']
rng=np.random.default_rng(20260806)
scalar_errors=[]; pair_errors=[]
for _ in range(20):
    zl=rng.normal()+1j*rng.normal(); zc=rng.normal()+1j*rng.normal()
    Ks,eigs,V,L=outputs(zl,zc)
    c=(abs(zl)**2+3*abs(zc)**2)/3
    scalar_errors.append(max(np.linalg.norm(K-c*np.eye(3)) for K in Ks.values()))
    vals=list(Ks.values()); pair_errors.append(max(np.linalg.norm(vals[i]-vals[j]) for i in range(4) for j in range(i)))

# Charge-plane complex Gram.
words={
 'u':np.array([1.,3.,-4.]),
 'd':np.array([1.,-3.,2.]),
 'e':np.array([-3.,-3.,6.]),
 'nu':np.array([-3.,3.,0.])}
names=['u','d','e','nu']; nhat=np.ones(3)/math.sqrt(3)
G=np.array([[words[a]@words[b] for b in names] for a in names])
Omega=np.array([[nhat@np.cross(words[a],words[b]) for b in names] for a in names])
H=G+1j*Omega
he=np.linalg.eigvalsh(H)
# canonical complex coordinates using an oriented orthonormal basis of sum-zero plane
b1=np.array([1.,-1.,0.]); b1/=np.linalg.norm(b1)
b2=np.cross(nhat,b1); b2/=np.linalg.norm(b2)
z=np.array([b1@words[a]+1j*b2@words[a] for a in names])
# Depending orientation, H = conjugate(z) outer z or its transpose; choose matching residual.
err1=np.linalg.norm(H-np.outer(np.conj(z),z)); err2=np.linalg.norm(H-np.outer(z,np.conj(z)))
complex_gram_error=min(err1,err2)
weighted_anomaly=3*words['u']+3*words['d']+words['e']+words['nu']
weighted_complex=3*z[0]+3*z[1]+z[2]+z[3]

# Spectral-action orientation invariance: four non-degenerate Hermitian generation Grams.
# A function of individual spectra has a 16-dimensional relative flag space:
# 4 flag orbits *6 dimensions - common PU(3) conjugation 8 = 16.
relative_flag_dim=4*6-8

# Numeric invariance audit under independent rotations.
def random_unitary():
    X=rng.normal(size=(3,3))+1j*rng.normal(size=(3,3)); Q,R=np.linalg.qr(X)
    ph=np.diag(R); return Q@np.diag(np.exp(-1j*np.angle(ph)))
lam={k:np.diag(np.sort(rng.uniform(.1,3,3))) for k in names}
eta=2.1
def density(K):
    w,U=np.linalg.eigh(K); e=np.exp(-eta*w); return U@np.diag(e/e.sum())@U.conj().T
def spectral_value(K):
    r=density(K); w=np.linalg.eigvalsh(r); return float(np.sum(w*np.log(w+1e-300)))
base=sum(spectral_value(lam[k]) for k in names)
rot={k:random_unitary()@lam[k]@random_unitary().conj().T for k in []}
# correct independent conjugations
rot={}
for k in names:
    U=random_unitary(); rot[k]=U@lam[k]@U.conj().T
rotval=sum(spectral_value(rot[k]) for k in names)
spectral_invariance_error=abs(base-rotval)

# Minimal orientation invariants.
# Tr(Kf Kg) is the first CP-even cross invariant.  (1/3i)Tr([Kf,Kg]^3)
# is the first CP-odd invariant and is proportional to Jarlskog times discriminants.
# Verify identity numerically for a random pair.
a=np.array([.2,1.1,2.7]); b=np.array([.4,1.6,3.2]); U=random_unitary()
A=np.diag(a); B=U@np.diag(b)@U.conj().T
C=A@B-B@A
cp=float(np.real(np.trace(C@C@C)/(3j)))
J=float(np.imag(U[0,0]*U[1,1]*np.conj(U[0,1])*np.conj(U[1,0])))
da=np.prod([a[i]-a[j] for i in range(3) for j in range(i+1,3)])
db=np.prod([b[i]-b[j] for i in range(3) for j in range(i+1,3)])
# sign convention can differ; compare absolute and both signs.
jarl_res=min(abs(cp-2*J*da*db),abs(cp+2*J*da*db))

out={
 'A4_equivariant_Dirac_space_real_dimension':hom_dim,
 'A4_vector_connection':{'real_dimension':connection_dim_real,'complex_real_dimension':connection_dim_complex},
 'clifford_linear_no_go':{
   'formula':'K_u=K_d=K_e=K_nu=((|z_l|^2+3|z_c|^2)/3) I_3',
   'max_scalar_error':float(max(scalar_errors)),
   'max_species_pair_error':float(max(pair_errors)),
   'consequence':'A4 grading plus the natural first-order Clifford connection cannot split generations or define flavour mixing.'},
 'charge_plane':{
   'names':names,'symmetric_gram':G.tolist(),'oriented_area':Omega.tolist(),
   'oriented_area_over_sqrt3':np.rint(Omega/math.sqrt(3)).astype(int).tolist(),
   'complex_gram_eigenvalues':he.tolist(),'complex_gram_rank':int(np.linalg.matrix_rank(H,tol=1e-10)),
   'complex_gram_outer_product_error':float(complex_gram_error),
   'complex_coordinates':[[float(x.real),float(x.imag)] for x in z],
   'weighted_anomaly_vector':weighted_anomaly.tolist(),
   'weighted_complex_closure':[float(weighted_complex.real),float(weighted_complex.imag)]},
 'spectral_action_no_go':{
   'relative_flag_dimension':relative_flag_dim,
   'numerical_spectral_invariance_error':float(spectral_invariance_error),
   'consequence':'Any action built only from separate functions of K_f=Y_f Y_f^dagger spectra leaves physical relative orientations undetermined.'},
 'minimal_cross_invariants':{
   'CP_even':'Tr(K_f K_g)',
   'CP_odd':'(1/(3i)) Tr([K_f,K_g]^3)',
   'jarlskog_identity_residual':float(jarl_res),
   'consequence':'Nonzero CP requires an orientation-sensitive history/curvature term or an equivalent holonomy; endpoint heat entropy alone cannot generate it.'}
}
(OUT/'urt_dirac_selection_audit_results.json').write_text(json.dumps(out,indent=2))
report=f'''URT FINITE-DIRAC SELECTION AUDIT
=================================

1. A4 COVARIANCE ALONE
----------------------
H_L and H_R each restrict as 2*1 + 2*2 + 6*3 over the real A4 irreducibles.
Therefore

  dim_R Hom_A4(H_R,H_L) = 2*2 + 2*(2*2) + 6*6 = {hom_dim}.

A4 covariance alone does not select a finite Dirac operator.

2. NATURAL FIRST-ORDER / CLIFFORD-LINEAR CONNECTION
---------------------------------------------------
Because V|A4 = 1 + 3,

  End_A4(V) = R P_lepton + R P_colour.

Thus the natural vector connection has only two real channel weights (or two
complex weights before KO reality).  For arbitrary complex z_l,z_c, direct
calculation gives exactly

  K_u = K_d = K_e = K_nu
      = (|z_l|^2 + 3 |z_c|^2)/3 * I_3.

Maximum scalar residual over 20 random complex tests: {max(scalar_errors):.3e}
Maximum inter-species residual:                         {max(pair_errors):.3e}

This is a theorem-level no-go: the canonical A4-graded Clifford connection is
generation-degenerate.  The fiveplet order parameter is necessary.

3. SPECTRAL RELATIVE-INFORMATION NO-GO
--------------------------------------
For four nondegenerate species Grams K_f, independent flag orbits have 4*6
real dimensions.  Quotienting common PU(3) conjugation removes 8, leaving

  4*6 - 8 = {relative_flag_dim}

physical relative-orientation dimensions.  Any action that is only a sum of
functions of the individual spectra of K_f is exactly invariant on this
16-dimensional space.  Numerical heat-entropy invariance error:

  {spectral_invariance_error:.3e}.

Therefore rho_D proportional to exp(-eta D_F^2), used only spectrally, can fix
mass spectra but cannot select CKM or PMNS orientation.

4. THE OMITTED ORIENTED CHARGE STRUCTURE
----------------------------------------
The four charge words lie in the oriented plane q1+q2+q3=0.  They possess both

  g_fg     = q_f dot q_g,
  omega_fg = n dot (q_f cross q_g),  n=(1,1,1)/sqrt(3).

The Hermitian pairing

  h_fg = g_fg + i omega_fg

has rank {np.linalg.matrix_rank(H,tol=1e-10)} and spectrum {np.array2string(he,precision=12)}.
It is the outer product of one complex species vector, with residual
{complex_gram_error:.3e}.  It also obeys the anomaly-weighted closure

  3 z_u + 3 z_d + z_e + z_nu = 0

to residual {abs(weighted_complex):.3e}.

Previous real/spectral constructions used g_fg but discarded omega_fg.  That
removed the only canonical species orientation.

5. MINIMAL REQUIRED FLAVOUR CURVATURE
-------------------------------------
The first CP-even cross-species invariant is

  Tr(K_f K_g).

The first CP-odd simultaneous-conjugation invariant for two 3x3 Hermitian
Grams is

  J_fg^geom = (1/(3 i)) Tr([K_f,K_g]^3),

which equals, up to orientation convention,

  2 J_fg prod_(i<j)(k_fi-k_fj) prod_(a<b)(k_ga-k_gb).

Numerical identity residual: {jarl_res:.3e}.

FINAL RESULT
------------
The missing finite-Dirac ingredient is not another scalar correction.  It is
an oriented, noncommuting recursive curvature/holonomy term.  Endpoint KL or
heat-spectrum minimisation cannot determine flavour.  The URT action must act
on ordered three-return histories and retain the antisymmetric charge-plane
form omega as well as the symmetric metric g.
'''
(OUT/'urt_dirac_selection_audit_report.txt').write_text(report)
print(report)
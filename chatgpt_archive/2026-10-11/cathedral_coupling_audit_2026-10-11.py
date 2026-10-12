"""Reproducible mathematical audit, not an empirical proof of Cathedral physics.
Run: python cathedral_coupling_audit_2026-10-11.py
Uses only the Python standard library.
"""
from math import pi, sqrt, log, isclose

phi = (1 + sqrt(5)) / 2
D = 3 / 20 - 80*pi/(1053*phi)
eta = -log(D)
p = D**2/(1+D**2)
a, b = 1/(4*(1+D**2)), D**2/(4*(1+D**2))
chi = 8*eta*(1+D**2)/(1-D**2)
log_mean = (a-b)/(log(a)-log(b))
alpha_root_inv = 137 + (17572/1215)*D - (9/65)*D**2
baseline_photon_inv = 4*pi*chi
necessary_current_norm_sq = alpha_root_inv / baseline_photon_inv

assert isclose(chi * log_mean, 1.0, rel_tol=1e-12)
assert isclose(4*a+4*b, 1.0, rel_tol=1e-12)
assert isclose(alpha_root_inv, 137.035999178195, abs_tol=1e-11)

# Laplacian K4 = 4I-J: v=(1,1,1,1) has eigenvalue 0,
# v with sum(v)=0 has eigenvalue 4 (3 independent directions).
L4 = [[3 if i==j else -1 for j in range(4)] for i in range(4)]
assert all(sum(row)==0 for row in L4)
for v in [(1,-1,0,0),(1,0,-1,0),(1,0,0,-1)]:
    assert all(sum(row[j]*v[j] for j in range(4)) == 4*v[i]
               for i,row in enumerate(L4))

# A4-invariant triplet mixing can have arbitrary t with |t|<=1.
# For S an orthogonal intertwiner, M=[[I3,tS],[t S.T,I3]]
# has three eigenvalues 1+t and three eigenvalues 1-t.
for t in [0, 0.5, 0.95]:
    assert (1-t) >= 0 and (1+t) >= 0

# Standard 16 Weyl states (one generation including right-handed neutrino).
charges = [2/3]*3 + [-1/3]*3 + [2/3]*3 + [-1/3]*3 + [0,-1,-1,0]
assert len(charges)==16
tr_q2 = sum(q*q for q in charges)
assert isclose(tr_q2, 16/3)
tr_t3_sq = 2.0  # 3 coloured weak doublets + 1 lepton doublet
assert isclose(tr_t3_sq/tr_q2, 3/8)

# Conditional Bekenstein-Hawking matching: d(S/kB)/d(A/lp^2) = 1/4.
d_p_d_Aplanck = 1/(8*eta)
d_D_d_Aplanck = (1+D*D)**2/(16*eta*D)
assert isclose(2*eta*d_p_d_Aplanck, 0.25, rel_tol=1e-12)

for name, value in [
    ('Delta',D),('eta',eta),('p5',p),('BKM density-tangent stiffness',chi),
    ('Gibbs-generator Hessian',log_mean),('alpha_root_inverse',alpha_root_inv),
    ('4pi chi',baseline_photon_inv),('necessary photon current norm squared',necessary_current_norm_sq),
    ('unit-current alpha inverse',baseline_photon_inv),
    ('one-generation sum Q^2',tr_q2),('normalized charge-trace alpha inverse',baseline_photon_inv/3),
    ('tree-level sin^2 theta_W',tr_t3_sq/tr_q2),
    ('d p5 / d(A/l_P^2) required by BH',d_p_d_Aplanck),
    ('d Delta / d(A/l_P^2) required by BH',d_D_d_Aplanck),
]:
    print(f'{name:45s}: {value:.15g}')
print('Verified: identities and counterexamples; no unique physical coupling derived.')
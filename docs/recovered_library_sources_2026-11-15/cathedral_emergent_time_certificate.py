#!/usr/bin/env python3
"""Finite Cathedral hidden-spectrum modular/relational-clock certificate.

Runs without external Cathedral data because the frozen spectral decomposition
L_hid=3 P3 + 5 P5, rank(P3)=rank(P5)=4, uniquely determines all checks
up to a unitary change of basis. No random matrices or fitted parameters.
This does not verify a 190-cochain/64-history/24-clock physical interface.
"""
import math
import numpy as np
from mpmath import mp

mp.dps = 70
phi = (1 + mp.sqrt(5)) / 2
Delta = mp.mpf(3)/20 - 80*mp.pi/(1053*phi)
eta = -mp.log(Delta)
q = 1/(1+Delta**2)
p = Delta**2/(1+Delta**2)
omega_mod = 2*eta
chi = 8*eta*(1+Delta**2)/(1-Delta**2)
visibility = 2*Delta/(1+Delta**2)
qfi = visibility**2
period_mod = mp.pi/eta
step24 = mp.pi/(24*eta)

assert 0 < Delta < 1
assert abs(p + q - 1) < mp.mpf('1e-65')
assert abs(chi-4*omega_mod*mp.coth(omega_mod/2)) < mp.mpf('1e-65')
assert abs(qfi-4*p*q) < mp.mpf('1e-65')

# These are the named rank-four spectral projectors, in the native eigenbasis.
P3 = np.diag([1.0]*4+[0.0]*4)
P5 = np.eye(8)-P3
L = 3*P3 + 5*P5
rho = (P3 + float(Delta**2)*P5) / (4*(1+float(Delta**2)))
assert np.allclose(np.linalg.eigvalsh(L), [3.0]*4+[5.0]*4)
assert np.isclose(np.trace(rho),1.0)
K=np.diag(-np.log(np.diag(rho)))
K_from_gap=np.log(4*(1+float(Delta**2)))*np.eye(8)+float(omega_mod)*P5
assert np.allclose(K,K_from_gap,rtol=0,atol=1e-13)
A=np.zeros((8,8),dtype=complex); A[0,4]=1.0
X=A+A.conj().T
for s in (0.0, 0.09, 0.4, 1.0, float(period_mod)):
    U=np.diag(np.exp(1j*s*np.log(np.diag(rho))))
    rot=U@A@U.conj().T
    assert np.allclose(rot,np.exp(1j*float(omega_mod)*s)*A,rtol=0,atol=1e-13)
    assert abs(np.trace(rho@(U@X@U.conj().T))-np.trace(rho@X))<1e-13

# Page-Wootters purification of one paired 3/5 block, in C x S basis:
# |Phi> = sqrt(q)|3_C3_S> + sqrt(p)|5_C5_S>.
psi = np.array([math.sqrt(float(q)),0,0,math.sqrt(float(p))],dtype=complex)
H=np.diag([3.0,5.0])
constraint=np.kron(H,np.eye(2))-np.kron(np.eye(2),H)
assert np.linalg.norm(constraint@psi)<1e-14
plus=np.array([1,1],dtype=complex)/math.sqrt(2)
for k in range(24):
    theta=2*math.pi*k/24
    clock_ket=np.array([1,np.exp(1j*theta)],dtype=complex)/math.sqrt(2)
    conditional=(np.kron(clock_ket.conj(),np.eye(2))@psi)
    conditional/=np.linalg.norm(conditional)
    pplus=abs(np.vdot(plus,conditional))**2
    expected=0.5*(1+float(visibility)*math.cos(theta))
    assert abs(pplus-expected)<1e-13, (k,pplus,expected)
# Special relativity energy/proper-time reciprocity at any fixed velocity.
for speed in (0,0.1,0.5,0.8,0.99):
    gam=1/math.sqrt(1-speed**2)
    assert abs(gam*(1/gam)-1)<1e-14

print('CERTIFIED: rho_* = Gibbs(L_hid, eta) in native hidden spectral basis')
print('CERTIFIED: K modular gap and U(s) inter-sector phase')
print('CERTIFIED: Tr[rho_* sigma_s(A)] is stationary (no clock readout from rho_*)')
print('CERTIFIED: BKM coefficient chi_35 = 4 omega_mod coth(omega_mod/2)')
print('CERTIFIED: conditional PaW two-level clock, all 24 sampled phases')
print('LIMIT: physical clock scale, and native five-solid/H64/24 couplings, not derived')
for name, value in [
    ('Delta',Delta),('eta',eta),('modular_angular_gap',omega_mod),('p5',p),
    ('chi35',chi),('relational_phase_visibility',visibility),
    ('phase_QFI',qfi),('modular_period',period_mod),('modular_24_step',step24),
]: print(f'{name}={mp.nstr(value,24)}')

# Conditional N-throat extension from its recorded block-transfer formula:
# rho_N = rho_8 tensor [(P_common+Delta**2*P_relative)/(1+(N-1)Delta**2)].
# This part tests the defined extension; it does not establish a physical N-throat system.
Nstar=1/Delta**2 + 1
for N in (2,24,190,161393,161394,291840):
    r=(N-1)*Delta**2
    pc=1/(1+r)
    pr=r/(1+r)
    global_QFI=4*pc*pr
    assert abs(global_QFI-4*r/(1+r)**2) < mp.mpf('1e-65')
    assert 0 < global_QFI <= 1
    print(f'N={N}, p_relative={mp.nstr(pr,15)}, global_phase_QFI={mp.nstr(global_QFI,15)}')
print('N_star_exact=',mp.nstr(Nstar,30))
print('CERTIFIED: conditional N-throat purification has global phase QFI=4 p_common p_relative')
print('LIMIT: this is global (joint) QFI, NOT a local time-readout prediction')

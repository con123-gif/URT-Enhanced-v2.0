#!/usr/bin/env python3
"""Reproducible audit: four synchronized 13-site icosahedral layers.

Requires numpy and networkx. This is a conditional mathematical model,
not a demonstration of a physical unification or of a unique coupling law.
"""
import math
import numpy as np
import networkx as nx

phi = (1 + math.sqrt(5)) / 2
Delta = 3/20 - 80*math.pi/(1053*phi)
eta = -math.log(Delta)
L4 = 4*np.eye(4) - np.ones((4,4))
P0 = np.ones((4,4))/4
Pperp = np.eye(4) - P0
assert np.allclose(L4,4*Pperp)
assert np.allclose(np.linalg.eigvalsh(L4), [0,4,4,4])

# Center + the twelve vertices and thirty edges of an icosahedron.
shell = nx.icosahedral_graph()
L13 = np.zeros((13,13))
L13[:12,:12] = nx.laplacian_matrix(shell).toarray() + np.eye(12)
L13[:12,12] = -1
L13[12,:12] = -1
L13[12,12] = 12
lambda13_expected = np.array([0] + [6-math.sqrt(5)]*3 + [7]*5
                             + [6+math.sqrt(5)]*3 + [13])
lambda13 = np.linalg.eigvalsh(L13)
assert np.allclose(lambda13,lambda13_expected,atol=2e-13)

# Continuous-time consensus on four layers. No internal decay required.
t_star = eta/(4*Delta)
A = P0 + math.exp(-4*Delta*t_star)*Pperp
T = A.T@A
assert np.allclose(A,P0+Delta*Pperp,atol=1e-14)
assert np.allclose(np.linalg.eigvalsh(T), [Delta**2]*3+[1],atol=1e-14)

# For any Hermitian L13, exp(-it L13) is unitary. The full transfer
# is A \otimes U13; its 13 collective channels remain unit-modulus,
# while 39 relative channels carry amplitude Delta at t_star.
assert np.allclose(np.linalg.eigvalsh(np.kron(T,np.eye(13))),
                   np.array([Delta**2]*39+[1]*13),atol=1e-14)

# Distinct branch: heat graph spectrum if an extra internal Laplacian
# term is explicitly added (this is NOT necessary for 13-site preservation).
combined = np.kron(Delta*L4,np.eye(13))+np.kron(np.eye(4),L13)
expected = np.sort(np.concatenate([lambda13,*(lambda13+4*Delta for _ in range(3))]))
assert np.allclose(np.linalg.eigvalsh(combined),expected,atol=2e-13)

# Four-layer state after conditioning on the no-jump operator A.
rho4 = T/np.trace(T)
plow = 3*Delta**2/(1+3*Delta**2)
assert np.allclose(np.linalg.eigvalsh(rho4),
                   [Delta**2/(1+3*Delta**2)]*3 + [1/(1+3*Delta**2)])
S4 = -(1-plow)*math.log(1-plow)-plow*math.log(plow/3)
slope4 = math.log(3*(1-plow)/plow)
assert math.isclose(slope4,2*eta,rel_tol=1e-14)

# Cathedral existing hidden state: four high and four low eigenvalues.
p5 = Delta**2/(1+Delta**2)
slope_hidden = math.log((1-p5)/p5)
assert math.isclose(slope_hidden,2*eta,rel_tol=1e-14)
chi44 = 8*eta*(1+Delta**2)/(1-Delta**2)
chi13 = 2*eta*(1+3*Delta**2)/(1-Delta**2)

# Kraus-complete deterministic channel converting 4 layer indices to
# one coherent symmetric layer, with relative excitation dumped to bath.
# Its no-jump Kraus operator is A; jumps must ALSO be included.
from numpy.linalg import eigh
_, eigv = eigh(Pperp)  # first basis vector (by eigenvalue) is symmetric
s = np.ones(4)/2
# Choose a standard orthonormal basis for the relative subspace.
rels = eigv[:,1:]
assert np.allclose(rels.T@rels,np.eye(3))
assert np.allclose(rels.T@s,0)
E0 = A
Es = [math.sqrt(1-Delta**2)*np.outer(s,rels[:,i]) for i in range(3)]
completeness = E0.T@E0 + sum(E.T@E for E in Es)
assert np.allclose(completeness,np.eye(4),atol=5e-15)
rho_initial = np.eye(4)/4
rho_unconditional = E0@rho_initial@E0.T + sum(E@rho_initial@E.T for E in Es)
rho_expected = (1-3*Delta**2/4)*P0 + Delta**2/4*Pperp
assert np.allclose(rho_unconditional,rho_expected)

kappa = math.pi/math.e
naive_relative_gain = kappa*math.exp(-4*Delta)
print(f'Delta                    = {Delta:.17g}')
print(f'4 Delta                  = {4*Delta:.17g}')
print(f'eta                      = {eta:.16g}')
print(f'relative amplitude/step  = {math.exp(-4*Delta):.16g}')
print(f'e-fold consensus time    = {1/(4*Delta):.12g}')
print(f't_star, A_relative=Delta = {t_star:.12g}')
print(f'13-cell eigenvalues      = {np.round(lambda13,10)}')
print(f'layer transfer modes     = 13 common, 39 relative')
print(f'low-population p_rel     = {plow:.16g}')
print(f'low-population p5        = {p5:.16g}')
print(f'entropy slopes (both)    = {slope4:.14g}, {slope_hidden:.14g}')
print(f'BKM metric chi(1+3)      = {chi13:.13g}')
print(f'BKM metric chi(4+4)      = {chi44:.13g}')
print(f'naive q-times-consensus relative amplitude growth = {naive_relative_gain:.13g}')
print(f'no-jump probability for mixed layers at t* = {np.trace(E0@rho_initial@E0.T):.13g}')
print('ALL ASSERTIONS PASSED')
"""Newton's Cathedral: exact chirality bridge from icosahedral spin-2 to BKM.

Requires NumPy and SymPy, plus cathedral_operator_audit.py in same directory.
The identities concern finite A5 geometry, not Einstein or RT equations.
Run: python cathedral_entanglement_spin2_exact.py
"""
import numpy as np
import sympy as sp
from cathedral_operator_audit import geometry, DELTA, ETA, CHI

v, edges, faces, (d0,d1,d2,d3), Cf = geometry()
L_v = sp.Matrix((d1 @ d1.T).astype(int))
L_f = sp.Matrix((d2.T @ d2).astype(int))
C = sp.Matrix(Cf.astype(int))
I_v, I_f = sp.eye(12), sp.eye(20)
Z = L_f - 3*I_f
# Rational spectral projectors; the face quartet eigenvalues are 3 and 5.
P_v5 = -(L_v*(L_v*L_v - 10*L_v + 20*I_v))/24
P_odd = (L_f*(L_f-2*I_f)*(L_f-5*I_f)*(Z*Z-5*I_f))/30
P_even = -(L_f*(L_f-2*I_f)*(L_f-3*I_f)*(Z*Z-5*I_f))/30
assert P_v5*P_v5 == P_v5 and sp.trace(P_v5) == 5
assert P_odd*P_odd == P_odd and sp.trace(P_odd) == 4
assert P_even*P_even == P_even and sp.trace(P_even) == 4
assert P_even*P_odd == sp.zeros(20)

# Each f_a is a sum of three vertex vectors (outward centroid direction).
# W_ab = sign(sum_{k shared} v_k dot (f_a cross f_b)).
# Signs are dictated by oriented geometry, not an adjustable coupling.
F = [v[list(face)].sum(axis=0) for face in faces]
W_entries=[]
for a, fa in enumerate(faces):
    row=[]
    for b, fb in enumerate(faces):
        orient = sum(float(v[k] @ np.cross(F[a], F[b]))
                     for k in set(fa).intersection(fb))
        row.append(0 if abs(orient) < 1e-9 else (1 if orient > 0 else -1))
    W_entries.append(row)
W = sp.Matrix(W_entries)
assert set(W) == {-1,0,1}
assert W.T == -W
assert W*W == -15*(P_odd+P_even)
assert W.rank() == 8
assert P_even*W*P_odd == P_even*W

# Rational incidence Gram identity for x,y in the vertex quintuplet.
G = C.T * P_even.multiply_elementwise(P_even) * C
assert P_v5*G*P_v5 == sp.Rational(1,3)*P_v5

# Map (20x20 restricted to the 4_odd -> 4_even blocks):
# R=W/sqrt(15), B(x)=sqrt(3) Pe diag(C x) R Po.
# Equivalently B(x)=Pe diag(C x) W Po /sqrt(5).
# Tr[B(x)^T B(y)] = x^T y for x,y in im Pv5.
B_unscaled=[]
for i in range(12):
    x=P_v5[:,i]
    B_unscaled.append(P_even*sp.diag(*(C*x))*W*P_odd)
for i in range(12):
    for j in range(12):
        assert sp.trace(B_unscaled[i].T*B_unscaled[j]) == 5*P_v5[i,j]

# Direct parity obstruction: even quadrupole scalar alone cannot mix quartets.
for i in range(12):
    x=P_v5[:,i]
    assert P_even*sp.diag(*(C*x))*P_odd == sp.zeros(20)

# Explicit canonical unitary-orbit relative entropy identity.
a = 1/(4*(1+DELTA**2))
b = DELTA**2/(4*(1+DELTA**2))
sigma=np.diag([a]*4+[b]*4)
def relative_entropy(rho, reference):
    vals=np.linalg.eigvalsh(rho)
    assert np.min(vals)>0
    return float(np.sum(vals*np.log(vals)) -
                 np.dot(np.diag(rho),np.log(np.diag(reference))))
for theta in (0.05,0.2,0.5):
    co,si=np.cos(theta),np.sin(theta)
    U=np.block([[co*np.eye(4),si*np.eye(4)],
                [-si*np.eye(4),co*np.eye(4)]])
    rho=U@sigma@U.T
    D=relative_entropy(rho,sigma)
    exact=2*ETA*np.tanh(ETA)*np.sin(theta)**2
    assert abs(D-exact)<1e-12
assert abs(CHI-8*ETA*(1+DELTA**2)/(1-DELTA**2))<1e-12

print('PASS: integer face chirality W^2=-15(P_odd+P_even), rank=8')
print('PASS: geometric 5 -> hidden quartet Hom isometry (exact rational)')
print('PASS: antipodal parity obstruction without chirality (exact rational)')
print('PASS: exact unitary orbit D=2 eta tanh(eta) sin^2(theta)')
print('Delta:',DELTA,'chi_BKM:',CHI,'unitary-angle Hessian:',4*ETA*np.tanh(ETA))
print('Finite geometry/BKM link only: no derived 4D Einstein action or physical G.')

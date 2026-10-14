"""Revisit a 2026-09-04 single-four A5-equivariant Dirac no-go on 4+4.

Existence witness: equivariant for diag(R,R) for every orthogonal 4x4 R.
This does not establish the full KO-6 axioms or the physical SM spectral triple.
"""
import numpy as np
from math import pi, sqrt
I=np.eye(4);Z=np.zeros((4,4))
D=np.block([[Z,I],[I,Z]])
G=np.block([[-I,Z],[Z,I]])
a=np.block([[I,Z],[Z,Z]])
K=np.block([[3*I,Z],[Z,5*I]])
Delta=3/20-80*pi/(1053*(1+sqrt(5))*0.5)
rho=np.block([[I,Z],[Z,Delta**2*I]])/(4*(1+Delta**2))
comm=D@a-a@D
assert np.allclose(D@D,np.eye(8))
assert np.allclose(D,D.T)
assert np.allclose(G@D+D@G,0)
assert np.linalg.matrix_rank(comm)==8
assert np.allclose(rho@G-G@rho,0)
assert np.trace(rho)==1 or abs(np.trace(rho)-1)<1e-12
# Because the two copies are equivalent, diag(R,R) commutes with D for any R.
for t in (.1,.3,1.1):
 R=np.eye(4);R[:2,:2]=[[np.cos(t),-np.sin(t)],[np.sin(t),np.cos(t)]]
 Q=np.block([[R,Z],[Z,R]])
 assert np.linalg.norm(Q@D-D@Q)<1e-12
print("PASS: doubled hidden quartet has non-scalar A5-equivariant graded Dirac")
print("one-form commutator rank",np.linalg.matrix_rank(comm),"norm",np.linalg.norm(comm))

#!/usr/bin/env python3
"""Full 13+51 dimensional charged Schur/Ward stress test.

This checks general algebra for the native carrier *dimensions*, not the
physical H13+H51 Hamiltonian. Charge words are input, no ARF targets.
"""
import numpy as np,json
rng=np.random.default_rng(20261110)
n,m=13,51; N=n+m
# Fixed rational-valued entries make the synthetic test reproducible.
A=rng.integers(-3,4,size=(n,n));A=(A+A.T)/2+30*np.eye(n)
D=rng.integers(-3,4,size=(m,m));D=(D+D.T)/2+80*np.eye(m)
B=rng.integers(-2,3,size=(n,m))/10
H=np.block([[A,B],[B.T,D]]).astype(complex)
# Diagonal charges: neutral and charged entries, fixed integer words.
charges=np.array(([-3,1,3,-4,6,0,2]*10)[:N],dtype=float)
Q=np.diag(charges)
theta=.173
U=np.diag(np.exp(1j*theta*charges))
Ht=U@H@U.conj().T
J=1j*(Q@H-H@Q)
W=-(Q@Q@H-2*Q@H@Q+H@Q@Q)
z=125+.5j
def schur(h):
 r=z*np.eye(N)-h
 aa,bb,cc,dd=r[:n,:n],r[:n,n:],r[n:,:n],r[n:,n:]
 return aa-bb@np.linalg.solve(dd,cc)
r=z*np.eye(N)-H;inv=np.linalg.inv(r)
S=schur(H)
# Schur determinant: numerical stable log determinants.
ld_full=np.linalg.slogdet(r)[1]
ld_hid=np.linalg.slogdet(r[n:,n:])[1]
ld_s=np.linalg.slogdet(S)[1]
assert abs(ld_full-ld_hid-ld_s)<1e-9
assert np.linalg.norm(schur(Ht)-U[:n,:n]@S@U[:n,:n].conj().T)<1e-8
# Trace identities include all Wilson/Schur contact contributions.
first=np.trace(inv@J)
second=np.trace(inv@W+inv@J@inv@J)
assert abs(first)<1e-8 and abs(second)<1e-8
eps=1e-4
def orbit(t):
 u=np.diag(np.exp(1j*t*charges))
 return u@H@u.conj().T
fdj=(orbit(eps)-orbit(-eps))/(2*eps)
fdw=(orbit(eps)+orbit(-eps)-2*H)/eps**2
assert np.linalg.norm(fdj-J)<1e-4
assert np.linalg.norm(fdw-W)<1e-4
# Independent finite difference of the effective action, not only H.
def effective(t):return schur(orbit(t))
fd_s1=(effective(eps)-effective(-eps))/(2*eps)
fd_s2=(effective(eps)+effective(-eps)-2*S)/eps**2
assert np.linalg.norm(fd_s1-1j*(Q[:n,:n]@S-S@Q[:n,:n]))<1e-4
assert np.linalg.norm(fd_s2+(Q[:n,:n]@Q[:n,:n]@S-2*Q[:n,:n]@S@Q[:n,:n]+S@Q[:n,:n]@Q[:n,:n]))<1e-3
print(json.dumps({"status":"passed","dimensions":[n,m],"full_ward_first_abs":abs(first),"full_ward_second_abs":abs(second),"schur_logdet_residual":abs(ld_full-ld_hid-ld_s),"scope":"generic synthetic charged carrier with 13+51 dimensions, not selected URT physical action","physical_ARFs":"not derived"},indent=2))

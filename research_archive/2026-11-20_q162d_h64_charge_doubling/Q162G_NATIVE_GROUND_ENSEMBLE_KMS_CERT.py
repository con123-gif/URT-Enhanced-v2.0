#!/usr/bin/env python3
"""Q162g: actual original 60 native ground histories induce a definite H64
density matrix, not identical to the previously frozen eight-state KMS ansatz.

Exact coefficients follow by native orbit + Schur/inversion and source norms.
Numerically re-enumerates every original Q101 ground history/covariance.
No fit, no identification with physical quantum vacuum/temperature.
"""
from pathlib import Path
import math,runpy
import numpy as np

d=runpy.run_path(str(Path(__file__).resolve().with_name(
 'Q162D_NATIVE_Q4_H64_CLOCK_CERT.py')))
P3,P5,Ph,Uh=d['P3'],d['P5'],d['Ph'],d['Uh']
C,Pl,Delta=d['C'],d['Pl'],d['Delta']
ground=d['ground']
a=[];b=[];c=[];e=[]
for mask,s in ground:
 f=(C@(Pl@s))**2
 h3=P3@f;h5=P5@f
 q=Ph@((h3+Delta*h5)**2)
 a.append(h3);b.append(h5);c.append(P3@q);e.append(P5@q)
A=np.array(a).T;B=np.array(b).T
Q3=np.array(c).T;Q5=np.array(e).T
assert A.shape==B.shape==Q3.shape==Q5.shape==(20,60)
assert np.linalg.norm(A@A.T-96*P3)<1e-10
assert np.linalg.norm(B@B.T-32*P5)<1e-10
assert np.linalg.norm(A@B.T)<1e-10
t=Delta**2/3
assert np.linalg.norm(Q3@Q3.T-(512/25)*t*P3)<1e-10
assert np.linalg.norm(Q5@Q5.T-(128/25)*(1-t)**2*P5)<1e-10
assert np.linalg.norm(Q3@Q5.T)<1e-10

# True H64 sources and positive normalized density, without declaring
# the prior rho_star to be the output of the 60-source ensemble.
Hsrc=Uh@(A+Delta*B)
cov=Hsrc@Hsrc.T
expected=Uh@(96*P3+32*Delta**2*P5)@Uh.T
assert np.linalg.norm(cov-expected)<1e-10
rho=cov/np.trace(cov)
eig=np.linalg.eigvalsh(rho)
assert min(eig)>-1e-12 and abs(sum(eig)-1)<1e-12
assert sum(eig>1e-10)==8 and sum(abs(eig)<1e-10)==56
p5=Delta*Delta/(3+Delta*Delta)
pstar=Delta*Delta/(1+Delta*Delta)
assert abs(np.trace(rho@(Uh@P5@Uh.T))-p5)<1e-12
assert abs(np.trace(rho@(Uh@P3@Uh.T))-(1-p5))<1e-12
assert p5<pstar
# The reversed-cost Hamiltonian is H_cost=18I-H8 on the hidden eight,
# with eigenvalues 0 on P3 and 2 on P5.
eta=-math.log(Delta)
beta=eta+math.log(3)/2
assert abs(math.exp(-2*beta)-Delta*Delta/3)<1e-14
print('Q162g all original 60 sources P3 frame 96, P5 frame 32, mixed 0')
print('Q162g Q4 source frame',512/25*t,128/25*(1-t)**2)
print('Q162g true H64 density rank8, sector probability p5',p5)
print('Q162g separate frozen master p5',pstar)
print('Q162g effective source Gibbs inverse beta',beta,'vs eta Delta',eta)
print('Q162g PASS native ensemble; no physical-vacuum/clock claim')

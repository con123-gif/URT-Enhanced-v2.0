"""Kissing-network friction vs icosahedral entropy production, 2026-10-15.
Run next to cathedral_operator_audit.py: python cathedral_kissing_entropy.py

The full entropy-production identity holds for the CHOSEN symmetric graph
diffusion; an interaction rate and constitutive friction law are physical
inputs, not consequences of the kissing-number geometry alone.
"""
import numpy as np
from cathedral_operator_audit import geometry, PHI

v, edges, faces, (d0,d1,d2,d3), C = geometry()
r0 = np.linalg.norm(v[0])
# Twelve outer spheres tangent to an equal central sphere:
# nearest-neighbour gap for the ideal regular icosahedral arrangement.
dmin=min(np.linalg.norm(v[i]-v[j]) for i in range(12) for j in range(i+1,12))
assert abs(dmin/r0-np.sqrt(2-2/np.sqrt(5)))<1e-12
assert dmin>r0                   # shell spheres do not physically touch

# Genuine contact-only graph: a 12-spoke star, NOT the 30-edge ico graph.
Lstar=np.zeros((13,13))
Lstar[0,0]=12
Lstar[1:,1:]=np.eye(12)
Lstar[0,1:]=Lstar[1:,0]=-1
assert np.linalg.norm(np.sort(np.linalg.eigvalsh(Lstar))
 -np.sort(np.array([0]+[1]*11+[13])))<1e-12
Lcontact=Lstar[1:,1:]-np.outer(Lstar[1:,0],Lstar[0,1:])/12
assert np.linalg.norm(Lcontact-(np.eye(12)-np.ones((12,12))/12))<1e-12
# Thus 12 spokes provide no golden decomposition of outer perturbations.

L=d1@d1.T             # 30-edge shell interaction Laplacian
P5=-(L@(L@L-10*L+20*np.eye(12)))/24
assert np.linalg.norm(P5@P5-P5)<1e-12
assert abs(np.trace(P5)-5)<1e-12
q=P5[:,0]/np.linalg.norm(P5[:,0]); amp=0.01
u=np.ones(12)/12
p=u+amp*q
assert np.min(p)>0
def H(p): return -np.dot(p,np.log(p))
gamma=1.0             # convention: one dimensionless unit of interaction time
pdot=-gamma*L@p
h_rate=-np.dot(pdot,np.log(p))
edge_h_rate=gamma*sum((p[i]-p[j])*(np.log(p[i])-np.log(p[j]))
                      for i,j in edges)
assert abs(h_rate-edge_h_rate)<1e-12 and h_rate>0
# To leading order near uniform p, dH/dt=45 gamma ||Q||_F^2.
Q2=8*amp**2/5
assert abs(12*gamma*6*amp**2-45*gamma*Q2)<1e-12

# Earlier normalized 12-vertex positive-transfer operator is instead a
# stochastic lazy walk on the COMPLEMENT of the 30-edge shell graph.
M=(L+np.ones((12,12)))/12
assert np.min(M)>-1e-13 and np.linalg.norm(M@np.ones(12)-np.ones(12))<1e-12
for i,j in edges: assert abs(M[i,j])<1e-12
assert np.linalg.norm(P5@M@p-0.5*(p-u))<1e-12
h_step=H(M@p)-H(p)
assert h_step>0

# Vertex-face paired fiveplets and exact complex structure.
J5=C@P5/np.sqrt(3)
Pf=J5@J5.T
Lf=d2.T@d2
assert np.linalg.norm(J5.T@J5-P5)<1e-12
assert np.linalg.norm((Lf-2*np.eye(20))@J5)<1e-12
Omega=np.block([[np.zeros((12,12)),-J5.T],
                [J5,np.zeros((20,20))]])
Proj=np.block([[P5,np.zeros((12,20))],
               [np.zeros((20,12)),Pf]])
assert abs(np.trace(Proj)-10)<1e-12
assert np.linalg.norm(Omega.T+Omega)<1e-12
assert np.linalg.norm(Omega@Omega+Proj)<1e-12
Diss=np.block([[L,np.zeros((12,20))],
               [np.zeros((20,12)),Lf]])
omega=2*np.pi/PHI**2  # proposed URT golden-angle rate, dimensionless
e=q; b=J5@q/3
psi=np.r_[e,b]
dpsi=omega*Omega@psi-gamma*Diss@psi
norm2_deriv=2*psi@dpsi
assert abs(norm2_deriv+2*gamma*(6*np.linalg.norm(e)**2
                              +2*np.linalg.norm(b)**2))<1e-11

print('Kissing contacts: 12 spokes; ico interaction edges:',len(edges))
print('Shell neighbour distance relative to central distance:',dmin/r0)
print('Central contact Schur: I-11^T/12; no golden splitting.')
print('Exact shell-graph Shannon entropy rate (gamma=1):',h_rate)
print('Entropy rate computed independently by 30-edge sum:',edge_h_rate)
print('Small-deformation predicted rate:',45*gamma*Q2)
print('Normalized complement-graph entropy gain per step:',h_step)
print('Paired 5+5 Omega is skew; Omega^2=-P10; rank(P10)=10.')
print('Reversible+Laplacian squared-norm derivative:',norm2_deriv)
print('PASS — finite conditional entropy-production and contact audit')

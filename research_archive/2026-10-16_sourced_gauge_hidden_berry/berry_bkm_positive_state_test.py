"""Independent numerical Umegaki-relative-entropy validation of Berry/BKM identity.

The orbit uses exact unitary conjugations of a POSITIVE 8x8 rho_star.
It therefore does not introduce nonphysical unbounded Gaussian noise.
Dependencies NumPy, SciPy; no tracked files written.
"""
import itertools,json
from math import sqrt,pi,log
import numpy as np
from scipy.linalg import expm
phi=(1+sqrt(5))/2
verts=[]
for a in (-1,1):
 for b in (-phi,phi):
  verts.extend(((0,a,b),(a,b,0),(b,0,a)))
v=np.array(verts,float)
edge={(i,j) for i,j in itertools.combinations(range(12),2)
      if abs(np.linalg.norm(v[i]-v[j])-2)<1e-9}
faces=[f for f in itertools.combinations(range(12),3)
       if all(e in edge for e in itertools.combinations(f,2))]
C=np.zeros((20,12))
for i,f in enumerate(faces):C[i,list(f)]=1.
L=3*np.eye(20)-(C@C.T==2).astype(float)
e,U=np.linalg.eigh(L)
H=np.column_stack([U[:,abs(e-z)<1e-9] for z in (3,5)])
E=[H.T@np.diag(C[:,i])@H/3 for i in range(12)]
F=[-9*(E[i]@E[j]-E[j]@E[i])
   for i,j in itertools.combinations(range(12),2)]
mix=float(sum(np.linalg.norm(M[:4,4:])**2 for M in F))
assert abs(mix-4/5)<1e-12
delta=3/20-80*pi/(1053*phi)
eta=-log(delta)
a=1/(4*(1+delta**2))
b=a*delta**2
rho=np.diag([a]*4+[b]*4)
K=np.diag([-log(a)]*4+[-log(b)]*4)
chi=8*eta*(1+delta**2)/(1-delta**2)
value=mix*chi*(a-b)**2
target=(2/5)*eta*np.tanh(eta)
assert abs(value-target)<1e-12
history=[]
for s in (.08,.04,.02,.01):
    D=0.
    for M in F:
        U=expm(s*M)
        new=U@rho@U.T
        assert np.linalg.eigvalsh(new).min()>0
        # Eigenvalues of rho are unaltered under exact unitary conjugation.
        D+=np.trace((new-rho)@K).real
    history.append({'angle':s,'D_over_angle_squared':float(D/s**2),
                    'difference_from_theorem':float(abs(D/s**2-target))})
assert history[-1]['difference_from_theorem']<1e-6
assert all(history[k+1]['difference_from_theorem']<
           history[k]['difference_from_theorem']
           for k in range(len(history)-1))
print(json.dumps({
    'BKM_density_tangent_chi35':chi,
    'Berry_interquartet_curvature_norm_squared':mix,
    'unitary_orbit_entropy_Hessian':value,
    'formula':'(2/5)*eta_Delta*tanh(eta_Delta)',
    'full_positive_density_orbit_checks':history,
    'physical_gauge_kinetic_term_unique':False
},indent=2))

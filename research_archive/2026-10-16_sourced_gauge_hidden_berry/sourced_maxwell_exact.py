"""Sourced finite Maxwell field on genuine Cathedral icosahedral DEC complex.

Independent NumPy test, no files written. No measured input or fitted coupling.
Verifies field gauge invariance, Gauss/continuity, neutral Coulomb Green
function, quartet-solenoidal response, wave and energy conservation.
"""
import itertools,json
import numpy as np
from numpy.linalg import norm
from math import sqrt,cos,sin
phi=(1+sqrt(5))/2
v=[]
for a,b in itertools.product((-1,1),repeat=2):
 v.extend(((0,a,b*phi),(a,b*phi,0),(b*phi,0,a)))
v=np.asarray(v,float)
edges=[(i,j) for i,j in itertools.combinations(range(12),2)
       if abs(norm(v[i]-v[j])-2)<1e-9]
elist=set(edges)
faces=[f for f in itertools.combinations(range(12),3)
       if all(x in elist for x in itertools.combinations(f,2))]
assert (len(v),len(edges),len(faces))==(12,30,20)
d0=np.zeros((30,12));d1=np.zeros((20,30))
eid={e:i for i,e in enumerate(edges)}
for k,(i,j) in enumerate(edges):d0[k,i]=-1;d0[k,j]=1
for fi,(i,j,k) in enumerate(faces):
 for a,b in ((i,j),(j,k),(k,i)):
  d1[fi,eid[tuple(sorted((a,b)))]]=1 if a<b else -1
assert norm(d1@d0)==0
L0=d0.T@d0;L2=d1@d1.T
w,H=np.linalg.eigh(L2)
U3=H[:,abs(w-3)<1e-9];U5=H[:,abs(w-5)<1e-9]
assert (U3.shape,U5.shape)==((20,4),(20,4))
K3=d1.T@U3/sqrt(3);K5=d1.T@U5/sqrt(5)
assert norm(d0.T@K3)<1e-12 and norm(d0.T@K5)<1e-12
assert norm(K3.T@K3-np.eye(4))<1e-12
assert norm(K5.T@K5-np.eye(4))<1e-12
assert norm(K3.T@K5)<1e-12
# All source coefficients below are arbitrary tests; response 1/3 and
# 1/5 are fixed exact eigenvalue inverses, not chosen fits.
c3=np.array([.8,-.4,.1,.7]);c5=np.array([-.2,.3,.5,-.1])
j=K3@c3+K5@c5
A=K3@c3/3+K5@c5/5
source_res=norm(d1.T@d1@A-j)/norm(j)
assert source_res<1e-12
assert norm(d0.T@j)<1e-12 and norm(d0.T@A)<1e-12
energy_ratio=((K3[:,0]@K3[:,0])/3)/((K5[:,0]@K5[:,0])/5)
assert abs(energy_ratio-5/3)<1e-12
# Source-free Maxwell wave: E=-dA/dt, B=d1 A.
for freq,vec in ((sqrt(3),K3[:,0]),(sqrt(5),K5[:,0])):
 for t in np.linspace(0,2,25):
  Aval=vec*cos(freq*t)
  Eval=freq*vec*sin(freq*t)
  Bval=d1@Aval
  assert abs((Eval@Eval+Bval@Bval)/2-freq**2/2)<1e-12
  assert norm(d0.T@Eval)<1e-12

# Closed 12-site shell permits only charge-neutral net vertex source.
Lplus=np.linalg.inv(L0+np.ones((12,12))/12)-np.ones((12,12))/12
resistors={}
for i,j in itertools.combinations(range(12),2):
 q=np.eye(12)[i]-np.eye(12)[j]
 r=q@Lplus@q
 if abs(r-11/30)<1e-12:key="adjacent"
 elif abs(r-7/15)<1e-12:key="distance2"
 elif abs(r-1/2)<1e-12:key="antipodal"
 else:raise ArithmeticError(r)
 resistors[key]=resistors.get(key,0)+1
assert resistors=={"adjacent":30,"distance2":30,"antipodal":6}
q=np.eye(12)[0]-np.eye(12)[1]
t=.41;omega=sqrt(3)
rho=cos(omega*t)*q;drho=-omega*sin(omega*t)*q
charged_current=-d0@Lplus@drho
ward=norm(drho+d0.T@charged_current)
assert ward<1e-12
E=d0@Lplus@rho
gauss=norm(d0.T@E-rho)
assert gauss<1e-12
assert abs(E@E-rho@Lplus@rho)<1e-12
# Continuum principal Maxwell symbol from icosahedral 12 directions.
u=v/norm(v,axis=1)[:,None]
assert norm(u.T@u-4*np.eye(3))<1e-12
rng=np.random.default_rng(20261016)
err=0.
for _ in range(200):
 k=rng.normal(size=3);x=rng.normal(size=3)
 q=u@k;y=u@x
 F=np.outer(q,y)-np.outer(y,q)
 val=np.sum(F*F)/32
 want=(k@k)*(x@x)-(k@x)**2
 err=max(err,abs(val-want))
assert err<1e-12
k=np.array([1.,2.,3.])
M=(k@k)*np.eye(3)-np.outer(k,k)
assert norm(np.sort(np.linalg.eigvalsh(M))-[0,14,14])<1e-12
# Finite-shift gauge transformations are exact on all twelve links:
# D_a=(T_{ell*u_a}-I)/ell and F_ab=D_a A_b-D_b A_a.
gauge_error=0.
for _ in range(30):
 k=rng.normal(size=3);amp=rng.normal(size=12)
 D=np.expm1(1j*1e-4*(u@k))/1e-4
 z=complex(rng.normal(),rng.normal())
 F=np.outer(D,amp)-np.outer(amp,D)
 shifted=amp+D*z
 Fg=np.outer(D,shifted)-np.outer(shifted,D)
 gauge_error=max(gauge_error,norm(Fg-F))
assert gauge_error<1e-10
print(json.dumps({
 "chain_composition_zero":True,
 "hidden_current_static_residual":float(source_res),
 "hidden_equal_norm_energy_ratio":float(energy_ratio),
 "current_continuity_Ward_residual":float(ward),
 "Gauss_law_residual":float(gauss),
 "pair_resistance":{"adjacent":"11/30","distance2":"7/15","antipodal":"1/2"},
 "pair_counts":resistors,
 "continuum_icosahedral_Maxwell_symbol_error":float(err),
 "finite_shift_gauge_error":float(gauge_error),
 "vector_Maxwell_principal_eigenvalues":[0,14,14],
 "finite_eigenfrequencies":[sqrt(3),sqrt(5)],
 "physical_charge_and_time_normalized":False,
 "physical_SI_force_claimed":False
},indent=2))

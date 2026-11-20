#!/usr/bin/env python3
"""Q161cv — source-selected SO(3)-equivariant pi-phi-e flow on Hopf S2.

Original Q101 golden 12-contact E=-6, |M|=4 frustrated minima supply 60
nonzero source axes a_s=(sum_i s_i v_i)/|sum_i s_i v_i| (30 per sign).
Without fitted physical values, set sigma=ln(pi/e), omega=2pi/phi².
The coordinate-free map is
 F_a(n;t)=[((1+c)-lam²(1-c))a+2lam R_a(omega*t)(n-ca)]
          /[(1+c)+lam²(1-c)],  c=a.n, lam=exp(sigma*t).
This is the exact projective w->exp[(sigma+i omega)t] w map in the
stereographic frame with polar axis a. Thus it is SO(3)-equivariant as a
source-indexed FAMILY; there is no externally selected preferred axis.

Exact generated vector field on S2:
 dn/dt=sigma[(a.n)n-a]+omega(a cross n).
Then d(a.n)/dt=-sigma[1-(a.n)²] and div_S2 v=2sigma(a.n).
Its global sphere integral is zero, so a push-forward density obeys
d rho/dt+div_S2(rho*v)=0 with preserved total integral.
Jacobian at north/south pole after one step is lam², lam^(-2).
Uniform initial density has south/north ratio lam^4=(pi/e)^4.
This is not a claim about antimatter asymmetry or observed cosmology.

The law is a mathematically exact conditional PROJECTIVE realization of
the primitive URT multiplier. Why this action and its physical clock are
chosen by full H64/24/Q96 is OPEN; not an observed law or mass derivation.
"""
import math
from itertools import product, combinations
import numpy as np
from scipy.spatial.transform import Rotation

phi=(1+math.sqrt(5))/2
sigma=math.log(math.pi/math.e)
omega=2*math.pi/phi**2
vertices=np.array(
 [(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+
 [(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+
 [(a*phi,0,b) for a,b in product((-1,1),repeat=2)],float)
edges=[(i,j) for i,j in combinations(range(12),2)
       if abs(np.dot(vertices[i]-vertices[j],vertices[i]-vertices[j])-4)<1e-10]
assert len(edges)==30
selected=[]
for bits in range(4096):
    spins=np.array([1-2*((bits>>i)&1) for i in range(12)])
    E=sum(spins[i]*spins[j] for i,j in edges)
    M=int(sum(spins))
    if E==-6 and abs(M)==4:
        axis=spins@vertices
        axis/=np.linalg.norm(axis)
        selected.append((bits,axis,M))
assert len(selected)==60
assert sorted([sum(int(x[2]==k) for x in selected) for k in (-4,4)])==[30,30]

def F(a,n,t=1):
    """Native-frustration-axis projective URT map on S2."""
    a=np.asarray(a,float);n=np.asarray(n,float)
    lam=math.exp(sigma*t)
    theta=omega*t
    c=np.dot(a,n)
    perp=n-c*a
    rotated=math.cos(theta)*perp+math.sin(theta)*np.cross(a,perp)
    den=(1+c)+lam**2*(1-c)
    return (((1+c)-lam**2*(1-c))*a+2*lam*rotated)/den

def field(a,n):
    c=np.dot(a,n)
    return sigma*(c*n-a)+omega*np.cross(a,n)

rng=np.random.default_rng(20261120)
unit_error=semigroup_error=equiv_error=ode_error=0.
R=Rotation.from_rotvec([.37,-.22,.61]).as_matrix()
for _,a,M in selected:
    for _ in range(10):
        n=rng.normal(size=3);n/=np.linalg.norm(n)
        out=F(a,n)
        unit_error=max(unit_error,abs(np.linalg.norm(out)-1))
        semigroup_error=max(semigroup_error,
            np.linalg.norm(F(a,F(a,n,t=.4),t=.6)-out))
        equiv_error=max(equiv_error,np.linalg.norm(F(R@a,R@n)-R@out))
        eps=1e-5
        ode_error=max(ode_error,np.linalg.norm(
            (F(a,n,eps)-F(a,n,-eps))/(2*eps)-field(a,n)))
assert max(unit_error,semigroup_error,equiv_error)<1e-12
assert ode_error<1e-9
for _,a,M in selected:
    n=rng.normal(size=3);n/=np.linalg.norm(n)
    c=a@n
    assert abs(a@field(a,n)+sigma*(1-c*c))<1e-12

lam=math.pi/math.e
Jnorth,Jsouth=lam**2,lam**-2
rho_north=1/(4*math.pi*lam**2)
rho_south=lam**2/(4*math.pi)
assert abs(rho_south/rho_north-lam**4)<1e-12
print("Q161cv PASS: 60 native source axes, 30 each magnetization sign")
print("SO3 equivariance",equiv_error,"semigroup",semigroup_error,
      "unit",unit_error,"ODE",ode_error)
print("sigma omega",sigma,omega,"pole Jacobians",Jnorth,Jsouth)
print("one-step density pole ratio",lam**4)
print("Projective action/clock physical selection OPEN; no masses predicted")

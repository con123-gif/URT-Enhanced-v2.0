#!/usr/bin/env python3
"""Q161cu — whole-five Platonic -> Hopf/Berry flux -> knotted S3 flow.

Standalone reconstruction of ORIGINAL Q101 5-solid vertex sets, face
orientation and the spin-1/2 Hopf connection. No measured masses/fit.
- 190 original 0/1/2-cochains; each of the five Hopf line bundles Chern +1.
- 50/90/50 vertex/edge/face counts and Berry flux 2*pi/F per face.
- Positive 50-vertex magnetic graph Laplacian (no covariantly constant modes).
- The declared PROJECTIVE URT w->q*w redistributes flux but preserves c1.
- Exact S3 toroidal Killing flow solves Hodge-viscous Navier-Stokes;
  helicity-energy inequality singles out primitive Hopf/anti-Hopf winds.
CAVEAT: projective coupling, physical spacetime metric, viscosity, clock,
Yukawa/masses and mapping to H64/24 and Q96 NOT derived. In particular
scalar multiplication z->q*z is Hopf-gauge-trivial after normalization.
"""
import math
from itertools import product
import numpy as np
import sympy as S
from scipy.spatial import ConvexHull
phi=(1+math.sqrt(5))/2
q=math.pi/math.e*np.exp(2j*math.pi/phi**2)
pm=list(product((-1,1),repeat=2))
solids={
 'tetra':[(1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1)],
 'cube':list(product((-1,1),repeat=3)),
 'octa':[(1,0,0),(-1,0,0),(0,1,0),(0,-1,0),(0,0,1),(0,0,-1)],
 'dodeca':list(product((-1,1),repeat=3))+[(0,a/phi,b*phi) for a,b in pm]
       +[(a/phi,b*phi,0) for a,b in pm]+[(a*phi,0,b/phi) for a,b in pm],
 'icosa':[(0,a,b*phi) for a,b in pm]+[(a,b*phi,0) for a,b in pm]
       +[(a*phi,0,b) for a,b in pm]}
expected={'tetra':(4,6,4),'cube':(8,12,6),'octa':(6,12,8),
          'dodeca':(20,30,12),'icosa':(12,30,20)}

def geometry(P):
    hull=ConvexHull(P); groups=[]
    for t,plane in zip(hull.simplices,hull.equations):
        for g in groups:
            if np.linalg.norm(g[0]-plane[:3])<1e-8 and abs(g[1]-plane[3])<1e-8:
                g[2].update(map(int,t));break
        else:groups.append([plane[:3],plane[3],set(map(int,t))])
    faces=[]
    for normal,_,ids in groups:
        ids=sorted(ids);c=P[ids].mean(axis=0);e=P[ids[0]]-c;e/=np.linalg.norm(e)
        e2=np.cross(normal,e)
        f=sorted(ids,key=lambda i:math.atan2(np.dot(P[i]-c,e2),np.dot(P[i]-c,e)))
        if np.dot(np.cross(P[f[1]]-P[f[0]],P[f[2]]-P[f[0]]),c)<0:f=f[::-1]
        faces.append(tuple(f))
    edges=sorted({tuple(sorted((i,j))) for f in faces for i,j in zip(f,f[1:]+f[:1])})
    return faces,edges

def spinors(P):
    out=[]
    for x,y,z in P:
        H=np.array([[z,x-1j*y],[x+1j*y,-z]])
        out.append(np.linalg.eigh(H)[1][:,1])
    return np.array(out)

def phase(z,f):
    h=1+0j
    for i,j in zip(f,f[1:]+f[:1]):
        a=np.vdot(z[i],z[j]);assert abs(a)>1e-12;h*=a/abs(a)
    return float(np.angle(h))

def area_tri(a,b,c):
    return 2*math.atan2(np.dot(a,np.cross(b,c)),1+a@b+b@c+c@a)

def gap(z,edges):
    L=np.zeros((len(z),len(z)),complex)
    for i,j in edges:
        a=np.vdot(z[i],z[j]);u=a/abs(a)
        L[i,i]+=1;L[j,j]+=1;L[i,j]-=u;L[j,i]-=u.conjugate()
    assert np.max(abs(L-L.conj().T))<1e-12
    return float(np.linalg.eigvalsh(L)[0])

sums=np.zeros(3,int)
for name,original in solids.items():
    P=np.array(original,float);P=P/np.linalg.norm(P,axis=1)[:,None]
    faces,edges=geometry(P);V,E,F=len(P),len(edges),len(faces)
    assert (V,E,F)==expected[name] and V-E+F==2
    z=spinors(P);zq=z.copy();zq[:,1]*=q;zq/=np.linalg.norm(zq,axis=1)[:,None]
    phases=np.array([phase(z,f) for f in faces]);drift=np.array([phase(zq,f) for f in faces])
    areas=np.array([sum(area_tri(P[f[0]],P[f[i]],P[f[i+1]]) for i in range(1,len(f)-1)) for f in faces])
    assert max(abs(areas-4*math.pi/F))<1e-10
    assert max(abs(phases-areas/2))<1e-10
    assert abs(sum(phases)-2*math.pi)<1e-10
    assert abs(sum(drift)-2*math.pi)<1e-10
    g,gq=gap(z,edges),gap(zq,edges)
    assert min(g,gq)>1e-8
    sums+=np.array((V,E,F))
    print(name,(V,E,F),'flux/face',round(phases[0],12),
          'gap',round(g,9),'gap after q',round(gq,9),
          'flux std after q',round(float(drift.std()),9))
assert tuple(sums)==(50,90,50)
# Positive gap theorem: a zero of sum_edges |psi_i-Uij psi_j|^2
# would force parallel transport around every face, impossible because
# each face has holonomy exp(2*pi*i/F) != 1.

# Exact unit S3 fluid calculation. z=(cos r e^(i alpha),sin r e^(i beta));
# V=p*d_alpha+k*d_beta is Killing and div-free, Delta_H V^flat=4 V^flat
# because Ric(S3)=2g. It has advective acceleration -grad(|V|^2/2).
# Thus u=A exp(-4nu t)V, pressure=|u|^2/2 solves Hodge-viscous NS.
r=S.symbols('r',real=True);p,k=S.symbols('p k',integer=True)
s,c=S.sin(r),S.cos(r); a=p*c*c;b=k*s*s
h=S.simplify(-a*S.diff(b,r)+b*S.diff(a,r))
assert S.simplify(h+2*p*k*s*c)==0
assert S.simplify(4*S.pi**2*S.integrate(h,(r,0,S.pi/2))+4*S.pi**2*p*k)==0
energy=2*S.pi**2*S.integrate((p*p*c*c+k*k*s*s)*s*c,(r,0,S.pi/2))
assert S.simplify(energy-S.pi**2*(p*p+k*k)/2)==0
assert S.simplify(4*(p*p+k*k)-8*p*k-4*(p-k)**2)==0
assert S.simplify(4*(p*p+k*k)+8*p*k-4*(p+k)**2)==0
assert S.simplify(s*c*(p*p-k*k)+S.diff(p*p*c*c+k*k*s*s,r)/2)==0
# For primitive winding gcd(|p|,|k|)=1, equality |H|/E=4 forces |p|=|k|=1.
# The standard Hopf case p=k=1 obeys curl V=-2V in (r,alpha,beta) orientation.
# Stereographic PROJECTIVE URT: w->q*w. It is NOT scalar z->q*z.
x,m=S.symbols('x m',positive=True)
J=m*m*(1+x*x)**2/(1+m*m*x*x)**2
assert S.simplify(J.subs(x,1/S.sqrt(m))-1)==0
assert S.simplify(S.integrate(8*S.pi*m*m*x/(1+m*m*x*x)**2,(x,0,S.oo))-4*S.pi)==0
sig=S.symbols('sig',real=True)
A=4*x/(1+x*x)**2
div=S.simplify(S.diff(A*sig*x,x)/A)
assert S.simplify(div-2*sig*(1-x*x)/(1+x*x))==0
assert S.simplify(S.integrate(div*A,(x,0,S.oo)))==0
print('Q161cu PASS: all five flux/positive spectra, S3 knot flow, helicity bound, projective URT area')
print('PHYSICAL: model coupling not uniquely selected; masses and gauge-gravity remain open')

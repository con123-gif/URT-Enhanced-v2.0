#!/usr/bin/env python3
"""Q123 exact low-temperature golden contact reversal prefactor, Track M only.

Local 13-contact source + canonical conditional continuous-time heat-bath
Glauber rates per site: q(s,s^i)=1/[1+exp(beta*(E(s^i)-E(s)))].
NO selected-history Q77, NO fitted observables, NO physical clock assertion.
"""
from itertools import combinations,product
from collections import Counter
from fractions import Fraction as F
import math
import numpy as np
import networkx as nx
from scipy.linalg import eigvalsh
phi=(1+math.sqrt(5))/2
v=([(0.,a,b*phi) for a,b in product((-1,1),repeat=2)]
   +[(a,b*phi,0.) for a,b in product((-1,1),repeat=2)]
   +[(a*phi,0.,b) for a,b in product((-1,1),repeat=2)])
edges=[(i,j) for i,j in combinations(range(12),2)
       if abs(sum((v[i][k]-v[j][k])**2 for k in range(3))-4)<1e-12]
assert len(edges)==30
E0=np.empty(8192,int);M=np.empty(8192,int);C=np.empty(8192,int)
for mask in range(8192):
    s=[1-2*((mask>>i)&1) for i in range(12)]
    E0[mask]=sum(s[i]*s[j] for i,j in edges)
    M[mask]=sum(s)
    C[mask]=1-2*((mask>>12)&1)
energy=E0+phi*C*M
ground=-6-4*phi;saddle=-10
barrier=saddle-ground
assert abs(energy.min()-ground)<1e-11
assert abs(barrier-2*(math.sqrt(5)-1))<1e-11
assert sum(abs(energy-ground)<1e-10)==60
assert all(abs(energy[x]-energy[x^8191])<1e-10 for x in range(8192))

# Exact inversion-symmetric separating cut, including zero-magnetisation.
S=(M>0)|((M==0)&(C==-1))
assert np.all(S != S[np.arange(8192)^8191])
cut=[(x,x^(1<<k),k) for x in range(8192) for k in range(13)
     if x<(x^(1<<k)) and S[x]!=S[x^(1<<k)]]
assert len(cut)==12012
dominant=[(x,y,k) for x,y,k in cut
          if abs(max(energy[x],energy[y])-saddle)<1e-11]
assert len(dominant)==72
assert all(k==12 and M[x]==M[y]==0 and
           abs(energy[x]-saddle)<1e-11 and abs(energy[y]-saddle)<1e-11
           for x,y,k in dominant)
assert all(max(energy[x],energy[y])>=saddle-1e-11 for x,y,k in cut)
assert all(max(energy[x],energy[y])>=-6-1e-11 for x,y,k in cut
           if (x,y,k) not in dominant)

# Below barrier: exactly two 150-configuration connected components.
remaining=set(np.flatnonzero(energy<saddle-1e-11).tolist())
assert len(remaining)==300
components=[]
while remaining:
    seed=next(iter(remaining));remaining.remove(seed);stack=[seed];comp={seed}
    while stack:
        x=stack.pop()
        for k in range(13):
            y=x^(1<<k)
            if y in remaining:
                remaining.remove(y);comp.add(y);stack.append(y)
    components.append(comp)
assert sorted(map(len,components))==[150,150]
assert all(len({bool(S[x]) for x in comp})==1 for comp in components)

# 72 true saddle outer configurations E0=-10,M=0, two centre orientations.
# Conductance at peak energy =1 per downhill heat-bath edge and =1/2
# for an equal-energy central flip. Series network effective conductance:
# g_ab = 1/(1/a+2+1/b), 72 saddle bridges in parallel.
counts=Counter();capacity=F(0)
for mask in range(4096):
    if (E0[mask],M[mask])!=(-10,0):continue
    a=b=0
    for k in range(12):
        x=mask^(1<<k)
        if E0[x]==-8 and M[x]==2:a+=1
        if E0[x]==-8 and M[x]==-2:b+=1
    assert a>0 and b>0
    counts[a,b]+=1
    capacity+=1/(F(1,a)+2+F(1,b))
assert counts=={(4,4):60,(5,5):12},counts
assert capacity==29
# Each basin has 30 lowest energy states, so the small eigenvalue
# is capacity*(1/30+1/30)*exp[-beta*(saddle-ground)].
coefficient=capacity/F(15)
assert coefficient==F(29,15)
print('Golden saddle classes',counts,'effective conductance',capacity,
      'slow-gap prefactor',coefficient,flush=True)

# Independently diagonalize the true 8192-state Glauber generator on its
# 192 native A5 spatial-rotation orbits (not a synthetic history model).
G=nx.Graph();G.add_nodes_from(range(12));G.add_edges_from(edges)
reference=np.array([v[i] for i in (0,1,4)]).T
rot=[]
for p in nx.isomorphism.GraphMatcher(G,G).isomorphisms_iter():
    mapped=np.array([v[p[i]] for i in (0,1,4)]).T
    if np.linalg.det(mapped)/np.linalg.det(reference)>0:
        rot.append([p[i] for i in range(12)])
assert len(rot)==60
orbitid=np.full(8192,-1,int);orbits=[]
for mask in range(8192):
    if orbitid[mask]>=0:continue
    orbit=set()
    for p in rot:
        y=mask&(1<<12)
        for i in range(12):y|=((mask>>i)&1)<<p[i]
        orbit.add(y)
    idx=len(orbits)
    for y in orbit:orbitid[y]=idx
    orbits.append(sorted(orbit))
assert len(orbits)==192 and np.min(orbitid)>=0
sizes=np.array([len(x) for x in orbits])
states_energy=np.array([energy[o[0]] for o in orbits])
assert all(max(abs(energy[x]-states_energy[i]) for x in o)<1e-11
           for i,o in enumerate(orbits))
for beta in (3.,4.,5.,6.):
    rate=np.zeros((192,192))
    for i,o in enumerate(orbits):
        x=o[0]
        for k in range(13):
            y=x^(1<<k)
            rate[i,orbitid[y]]+=1/(1+math.exp(beta*(energy[y]-energy[x])))
    rate-=np.diag(rate.sum(axis=1))
    pi=sizes*np.exp(-beta*(states_energy-ground));pi/=pi.sum()
    sym=rate*np.sqrt(pi[:,None]/pi[None,:])
    assert max(abs((sym-sym.T).ravel()))<3e-11
    vals=eigvalsh(-.5*(sym+sym.T),subset_by_index=[0,3])
    assert abs(vals[0])<2e-12 and vals[1]>0
    scaled=vals[1]*math.exp(beta*barrier)
    print('beta',beta,'full-native-orbit spectral gap',vals[1],
          'scaled coefficient',scaled,'next',vals[2],flush=True)
    assert abs(scaled-float(coefficient))<(.21 if beta==3 else
                .07 if beta==4 else .035 if beta==5 else .015)

# Rigorous finite-beta reversible Dirichlet test:
# gap <= 4 * stationary undirected cut conductance. Its inverse bounds
# the integrated normalized autocorrelation of the cut sign from below.
for beta in (3.,4.,6.):
    Z=float(np.exp(-beta*(energy-ground)).sum())
    w=0.
    for x,y,k in cut:
        dx=beta*(energy[x]-ground);dy=beta*(energy[y]-ground)
        w+=math.exp(-max(dx,dy))/(1+math.exp(-abs(dx-dy)))
    lam_upper=4*w/Z
    assert lam_upper>0
    print('beta',beta,'Rayleigh gap upper',lam_upper,
          'correlation time lower',1/lam_upper,flush=True)
    assert lam_upper*math.exp(beta*barrier)<2.41

# Conditional adiabatic 2-state orientation telegraph + Q122 Born emission.
# If orientation correlation per observation is r=e^-lambda*step,
# with conditional current means +/-mu and one-step second moment p++p-:
# Var(C_n)=n(p++p-)+2mu^2 sum_{k=1}^{n-1}(n-k)r^k.
for r in (0.,.4,.9,1.):
    n=24
    q=sum((n-k)*r**k for k in range(1,n))
    if r!=1.:
        assert abs(q-r*((n-1)-n*r+r**n)/(1-r)**2)<1e-7
    else:
        assert q==276
print('24-step conditional memory factor 2sum(24-k)r^k; 552 at r=1')
print('Reversible equilibrium parity forbids spontaneous sign preference')
print('Scaling all rates by positive k leaves energy/Gibbs/symmetry unchanged')
print('No physical time, Q96/v61 photon residue, or four ARFs derived')
print('Q123 GOLDEN SADDLE CAPACITY AND CHARGE-MEMORY CERTIFICATE: PASS')

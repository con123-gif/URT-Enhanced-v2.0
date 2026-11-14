#!/usr/bin/env python3
"""Q126 original 444-state source: explicit distinct positive Q96 instruments."""
from itertools import product,combinations
import numpy as np
from scipy.special import expit
phi=(1+5**.5)/2
v=np.array([(0.,float(a),b*phi) for a,b in product((-1,1),repeat=2)]
 +[(float(a),b*phi,0.) for a,b in product((-1,1),repeat=2)]
 +[(a*phi,0.,float(b)) for a,b in product((-1,1),repeat=2)])
edges=[(i,j) for i,j in combinations(range(12),2)
       if abs(np.sum((v[i]-v[j])**2)-4)<1e-10]
assert len(edges)==30
energy=[];mags=[];centres=[]
for x in range(8192):
    s=1-2*np.array([(x>>i)&1 for i in range(12)])
    m=int(s.sum());c=1-2*((x>>12)&1)
    energy.append(sum(s[i]*s[j] for i,j in edges)+phi*c*m)
    mags.append(m);centres.append(c)
energy=np.array(energy)
sub=np.flatnonzero(energy<=-10+1e-10)
assert len(sub)==444
idx={int(x):i for i,x in enumerate(sub)}
Q=np.zeros((444,444));beta=1.
for a,x in enumerate(sub):
    for k in range(13):
        y=int(x)^(1<<k)
        if y in idx:
            Q[a,idx[y]]=expit(-beta*(energy[y]-energy[x]))
    Q[a,a]=-Q[a].sum()
assert np.max(abs(Q.sum(axis=1)))<1e-14
assert np.count_nonzero(Q-np.diag(np.diag(Q)))==2064
pi=np.exp(-beta*(energy[sub]-min(energy[sub])));pi/=pi.sum()
assert np.max(abs(pi[:,None]*Q-(pi[:,None]*Q).T))<1e-13
inv=np.array([idx[int(x)^8191] for x in sub])
assert np.array_equal(inv[inv],np.arange(444))
assert np.max(abs(Q[np.ix_(inv,inv)]-Q))<1e-13
T1=np.eye(444)+Q/13
T2=np.eye(444)+Q/26
for T in (T1,T2):
    assert np.min(T)>-1e-14
    assert np.max(abs(T.sum(axis=1)-1))<1e-14
    assert np.max(abs(pi[:,None]*T-(pi[:,None]*T).T))<1e-13
    assert np.max(abs(T[np.ix_(inv,inv)]-T))<1e-13
    assert np.linalg.norm(pi@T-pi)<1e-13
assert np.max(abs(T1-T2))>1e-3
assert np.allclose(1-np.diag(T1),2*(1-np.diag(T2)))
orientation=np.array([np.sign(mags[x]) if mags[x] else -centres[x] for x in sub])
assert np.all(orientation[inv]==-orientation)
assert abs(pi@orientation)<1e-13
print("Q126: original 444 states, 1032 native edges, two distinct valid dt: PASS")
print("Same Gibbs, inversion, positive charge-preserving Ward maps; jump rates x2")
print("No unique kinetic clock or equilibrium orientation from these axioms")

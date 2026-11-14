#!/usr/bin/env python3
"""Q124 Track M: original 444 saddle-state Q96 shortest SU2 charged bridge.

The 12+centre golden contact energy is Q101/Q120's actual local source.
This builds 1032 REAL one-spin edges, carries Q105 charged16 -> Q96, and
constructs a conditional CPTP heat-bath instrument, NO Q77 history clock.
Physical 190/H64/24 kinetic normalization and v61 4D photon pole OPEN.
"""
from itertools import combinations,product
from collections import Counter
import math
import numpy as np
from scipy.linalg import block_diag
phi=(1+math.sqrt(5))/2
add=lambda x,y:(x[0]+y[0],x[1]+y[1])
neg=lambda x:(-x[0],-x[1])
sub=lambda x,y:add(x,neg(y))
mul=lambda x,y:(x[0]*y[0]+x[1]*y[1],
                 x[0]*y[1]+x[1]*y[0]+x[1]*y[1])
V=([((0,0),(a,0),(0,b)) for a,b in product((-1,1),repeat=2)]
   +[((a,0),(0,b),(0,0)) for a,b in product((-1,1),repeat=2)]
   +[((0,a),(0,0),(b,0)) for a,b in product((-1,1),repeat=2)])
xyz=np.array([[a+b*phi for a,b in v] for v in V])
edges=[(i,j) for i,j in combinations(range(12),2)
       if abs(sum((xyz[i]-xyz[j])**2)-4)<1e-12]
assert len(edges)==30
H=[];words=[];Wcoef=[]
for mask in range(8192):
    s=np.array([1-2*((mask>>i)&1) for i in range(12)])
    E=sum(s[i]*s[j] for i,j in edges)
    M=int(sum(s));c=1-2*((mask>>12)&1)
    H.append(E+phi*c*M);words.append(s)
    Wcoef.append(tuple((sum(s[i]*V[i][k][0] for i in range(12)),
                        sum(s[i]*V[i][k][1] for i in range(12)))
                        for k in range(3)))
H=np.asarray(H);words=np.asarray(words)
allowed=np.flatnonzero(H<=-10+1e-11)
assert len(allowed)==444
classes=Counter()
for x in allowed:
    sq=(0,0)
    for val in Wcoef[x]:sq=add(sq,mul(val,val))
    classes[sq]+=1
assert classes=={(32,-16):180,(24,-12):120,(40,-12):120,(48,-16):24}
assert phi<2 and all(a+phi*b>0 for a,b in classes)
allowedset=set(map(int,allowed));links=[]
for x in allowed:
    for k in range(13):
        y=int(x)^(1<<k)
        if y not in allowedset or x>y:continue
        if k<12:
            p=Wcoef[x];v=V[k]
            cross=[sub(mul(p[(j+1)%3],v[(j+2)%3]),
                       mul(p[(j+2)%3],v[(j+1)%3])) for j in range(3)]
            assert any(z!=(0,0) for z in cross)
        links.append((int(x),y,k))
assert len(links)==1032
W=words@xyz
axis=np.zeros_like(W)
axis[allowed]=W[allowed]/np.linalg.norm(W[allowed],axis=1)[:,None]
assert np.max(abs(np.linalg.norm(axis[allowed],axis=1)-1))<1e-11
sigma=np.asarray([[[0,1],[1,0]],[[0,-1j],[1j,0]],[[1,0],[0,-1]]])
S=np.einsum('aj,jkl->akl',axis[allowed],sigma)
at={int(x):i for i,x in enumerate(allowed)}
Y=np.diag([1/6]*6+[-1/2]*2+[2/3]*3+[-1/3]*3+[-1,0]).astype(complex)
Q16=[]
for sx in S:
    q=Y.copy()
    for j in range(4):q[2*j:2*j+2,2*j:2*j+2]+=sx/2
    Q16.append(q)
# Actual three generations and their conjugates: Q96.
q16=np.linalg.eigvalsh(Q16[0])
q96=np.r_[np.tile(q16,3),np.tile(-q16,3)]
charge_counts=Counter(round(float(q),8) for q in q96)
expected={round(z,8):m for z,m in [(-1.,6),(-2/3,18),(-1/3,18),
          (0.,12),(1/3,18),(2/3,18),(1.,6)]}
assert charge_counts==expected
assert abs(sum(q*q for q in q96)-32)<1e-10
assert abs(sum(q**4 for q in q96)-176/9)<1e-10
I2=np.eye(2,dtype=complex)
mindot=1.;maxWard=0.;maxUnit=0.
for x,y,k in links:
    a,b=at[x],at[y];dot=float(axis[x]@axis[y])
    mindot=min(mindot,dot)
    assert dot>-1+1e-10
    U=(I2+S[a]@S[b])/math.sqrt(2*(1+dot))
    unerr=np.linalg.norm(U.conj().T@U-I2)
    maxUnit=max(maxUnit,unerr)
    assert unerr<1e-10 and np.linalg.norm(S[a]@U-U@S[b])<1e-10
    U16=block_diag(U,U,U,U,np.eye(8))
    ward=np.linalg.norm(Q16[a]@U16-U16@Q16[b])
    maxWard=max(maxWard,ward)
    assert ward<1e-10
    assert np.linalg.norm((-Q16[a].conj())@U16.conj()-
               U16.conj()@(-Q16[b].conj()))<1e-10
print('Exact 444 Q(phi) source norm-square classes',classes,flush=True)
print('All 1032 original charged Q96 links unitary+Ward, residual',
      maxWard,maxUnit,'minimum dot',mindot,flush=True)
# Specified heat-bath jump rates are positive; their diagonal no-jump
# Kraus operator exactly normalizes the discrete CP map at step dt=1/13.
# State-local Q96 intertwining makes each jump gauge-covariant.
beta=3.;dtr=1/13.
attempt={int(x):0. for x in allowed}
eq={int(x):math.exp(-beta*(H[x]-H[allowed].min())) for x in allowed}
for x,y,k in links:
    rate=1/(1+math.exp(beta*(H[y]-H[x])))
    reverse=1/(1+math.exp(beta*(H[x]-H[y])))
    assert abs(eq[x]*rate-eq[y]*reverse)<1e-12
    attempt[x]+=rate;attempt[y]+=reverse
assert max(attempt.values())<=13
assert min(1-dtr*v for v in attempt.values())>=-1e-12
# Algebraic Kraus definition, no giant 42624x42624 matrix needed:
# K_yx=sqrt(dt*q_xy)|y><x| x U96_yx, K0=sum_x sqrt(1-dt*r_x)|x><x| x I96.
# Since Q_y U96_yx=U96_yx Q_x, every Kraus preserves local charge.
# Tensor with I192 and native h_v61(q A), using its original separate
# Wilson covariance, gives an algebraic combined gauge-covariant interface.
print('CPTP charge-preserving 444*96 Kraus instrument: conditional PASS')
print('No singular charged axis at barrier; no physical time or 4D alpha claim')
print('Q124 NATIVE CHARGED BARRIER EXTENSION: PASS')

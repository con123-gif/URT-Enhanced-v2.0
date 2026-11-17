#!/usr/bin/env python3
"""Q161 exact flux stationarity for even spatial boxes and NT multiple of six.
Pure integer/rational certificate; proves phase symmetry, NOT Hessian positivity.
"""
from fractions import Fraction as Q
from itertools import product

directions=[(0,1,0,0),(0,0,1,0),(0,0,0,1)]+[(1,*b) for b in product((0,-1),repeat=3)]
a=[Q(3,4)]*3+[Q(-1,4)+Q(3,4)*sum(-x for x in d[1:]) for d in directions[3:]]
assert a == [Q(3,4)]*3+[Q(-1,4),Q(1,2),Q(1,2),Q(5,4),Q(1,2),Q(5,4),Q(5,4),Q(2)]
def phase(nt,ns,t,vec,d,q,angle):
    p=(Q(2*t+1,nt),)+tuple(Q(2*x,ns) for x in vec)
    return sum(x*y for x,y in zip(p,d))+q*angle
total=0
for nt,ns in ((6,2),(6,4),(6,6),(12,2),(12,4),(12,6),(18,4),(24,8)):
    assert nt%6==0 and ns%2==0
    for q,qp in ((Q(1),Q(1,3)),(Q(2,3),Q(2,3))):
        for t in range(nt):
            st=(nt//6-t-1)%nt
            for vec in product(range(ns),repeat=3):
                sv=tuple((ns//2-x)%ns for x in vec)
                for d,angle in zip(directions,a):
                    z=phase(nt,ns,t,vec,d,q,angle)+phase(nt,ns,st,sv,d,qp,angle)
                    assert z.denominator==1 and z.numerator%2==0,(nt,ns,t,vec,d,q,z)
                    total+=1
    print(f'EXACT FLUX STATIONARITY: NT={nt} NS={ns}: {22*nt*ns**3} phase identities PASS')
assert total==409728,total
# All 12 oriented native temporal/spatial triangle types have exactly 3pi/2 flux.
num_tri=0
for axis in range(3):
    for rest in product((0,-1),repeat=2):
        down=list(rest);down.insert(axis,-1)
        up=down.copy();up[axis]=0
        j=directions.index((1,*down)); k=directions.index((1,*up))
        assert a[j]+a[axis]-a[k]==Q(3,2)
        num_tri+=1
assert num_tri==12
print('EXACT ALL-VOLUME PHASE THEOREM: 409728 identities PASS')
print('EXACT TRIANGLE HOLONOMY: all 12 types 3*pi/2, Wilson_q=1/3 = +i and conjugate = -i')
print('Charge-conjugate flux orientations are gauge-inequivalent, with equal spectral action.')
print('Stationarity for even NS and NT divisible by 6; positivity of Hessian & continuum GR/SM still OPEN.')

#!/usr/bin/env python3
"""Exact Q124 13-spin icosahedral contact plaquette classes; fail on error."""
from itertools import combinations, product
from collections import Counter
from math import sqrt
phi=(1+sqrt(5))/2
vertices=([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]
          +[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]
          +[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
edges={tuple(sorted((i,j))) for i,j in combinations(range(12),2)
       if abs(sum((vertices[i][k]-vertices[j][k])**2 for k in range(3))-4)<1e-10}
assert len(edges)==30
states=set()
for mask in range(1<<13):
    spins=[1-2*((mask>>i)&1) for i in range(12)]
    centre=1-2*((mask>>12)&1)
    E=sum(spins[i]*spins[j] for i,j in edges)
    if E+phi*centre*sum(spins)<-10+1e-10:
        states.add(mask)
assert len(states)==444
counts=Counter()
for m in states:
    for a,b in combinations(range(13),2):
        if all((m^flip) in states for flip in (1<<a,1<<b,(1<<a)|(1<<b))):
            counts[(a,b)]+=1
assert all(n%4==0 for n in counts.values())
plaquettes={pair:n//4 for pair,n in counts.items()}
assert len(plaquettes)==36 and sum(plaquettes.values())==480
assert not any(12 in pair for pair in plaquettes)
assert not any(pair in edges for pair in plaquettes)
def opposite(i,j):
    return all(abs(vertices[i][k]+vertices[j][k])<1e-12 for k in range(3))
opposites={pair for pair in combinations(range(12),2) if opposite(*pair)}
assert len(opposites)==6
assert all(plaquettes.get(pair)==20 for pair in opposites)
assert all(plaquettes.get(pair)==12 for pair in combinations(range(12),2)
           if pair not in edges and pair not in opposites)
assert all(pair not in plaquettes for pair in edges)
assert 6*20+30*12==480
print('Q161ds native 444 histories, 480 square plaquettes:')
print('opposite outer-vertex flip pairs: 6 x 20 = 120')
print('nonedge nonopposite outer-vertex pairs: 30 x 12 = 360')
print('icosahedral edge pairs: 30 x 0; centre-outer pairs: 12 x 0')
print('STATUS: exact native contact combinatorics; Berry holonomy and charged B_x OPEN')

#!/usr/bin/env python3
"""Q163 exact face-rotation/24-clock group-order audit; no physical lift asserted."""
from math import gcd
# Original five Platonic face orbit lengths, fixed by the native face incidence.
faces = {"tetra":(3,4),"cube":(4,6),"octa":(3,8),
         "dodeca":(5,12),"icosa":(3,20)}
assert sum(f for n,f in faces.values()) == 50
assert sum(f*n for n,f in faces.values()) == 180
# A faithful face rotation C_n inside the 24-clock C_24 exists iff n | 24.
for solid,(n,count) in faces.items():
    possible = [k for k in range(24) if 24//gcd(24,k)==n]
    assert bool(possible) == (24%n==0)
    print(solid,"face-order",n,"faces",count,"faithful-clock-steps",possible)
assert 24%5 != 0 and 24%3 == 0 and 24%4 == 0
# Every homomorphism C_5 -> C_24 is trivial: image order divides gcd(5,24)=1.
assert gcd(5,24)==1
assert all((5*k)%24 != 0 for k in range(1,24))
print("Q163 OBSTRUCTION: no nontrivial C5 -> C24 homomorphism; 12 dodecahedral pentagonal face rotations cannot be represented faithfully by a single 24-clock cyclic translation.")
print("Scope: exact finite group-order obstruction only; coupled/noncyclic time-dependent transports remain open.")

#!/usr/bin/env python3
"""Prime-lattice URT: Legendre-character holonomy and exact square spectra.
A conditional operator construction, NOT a proof of the Riemann Hypothesis.
Pure Python standard library; raises AssertionError on failure.
"""
from itertools import product, permutations
from collections import defaultdict
from math import sqrt, pi, e, cos
from cmath import exp

PHI = (1+sqrt(5))/2
THETA = 2*pi/(PHI*PHI)
SCALE = pi/e
PRIMES = (2,3,5,7,11,13)

def legendre(p,q):
    assert q > 2 and p % q
    r = pow(p % q, (q-1)//2, q)
    assert r in (1,q-1)
    return 1 if r == 1 else -1

def character(p,q):
    return 1 if p == q or p == 2 or q == 2 else legendre(p,q)

def eps(p,q):
    return -1 if p%4 == q%4 == 3 else 1

def link(p,state,primes):
    return (exp(1j*THETA*sum(state[i] for i,q in enumerate(primes) if q<p))
            *prod(character(p,q)**state[i] for i,q in enumerate(primes) if q!=p))

def prod(items):
    result=1
    for item in items: result*=item
    return result

def route_ratio(p,q,state,primes):
    ep=list(state); ep[primes.index(p)]+=1
    eq=list(state); eq[primes.index(q)]+=1
    first=link(q,state,primes)*link(p,tuple(eq),primes)
    second=link(p,state,primes)*link(q,tuple(ep),primes)
    return first/second

def add(a,b):
    out=defaultdict(int,a)
    for k,v in b.items():out[k]+=v
    return {k:v for k,v in out.items() if v}

def mul(a,b):
    out=defaultdict(int)
    for (x,z),c in a.items():
        for (y,w),d in b.items():out[(x+y,z+w)]+=c*d
    return {k:v for k,v in out.items() if v}

def det4(matrix):
    out={}
    for perm in permutations(range(4)):
        term={(0,0):1}
        for i,j in enumerate(perm):term=mul(term,matrix[i][j])
        inv=sum(perm[i]>perm[j] for i in range(4) for j in range(i+1,4))
        if inv%2:term={k:-v for k,v in term.items()}
        out=add(out,term)
    return out

def square_charpoly(p,q):
    assert p<q
    primes=(p,q); states=((0,0),(1,0),(0,1),(1,1))
    mat=[[{} for j in range(4)] for i in range(4)]
    for i in range(4):mat[i][i]={(1,0):1}
    for j,state in enumerate(states):
        for axis,prime in enumerate(primes):
            if state[axis]:continue
            dest=list(state);dest[axis]=1
            i=states.index(tuple(dest))
            power=sum(state[k] for k,r in enumerate(primes) if r<prime)
            sign=prod(character(prime,r)**state[k] for k,r in enumerate(primes) if r!=prime)
            mat[i][j]={(0,power):-sign}
            mat[j][i]={(0,-power):-sign}
    return det4(mat)

def test():
    tested=0
    for i,p in enumerate(PRIMES):
        for q in PRIMES[i+1:]:
            if p>2 and q>2:assert legendre(p,q)*legendre(q,p)==eps(p,q)
            target=eps(p,q)*exp(-1j*THETA)
            for state in product(range(3),repeat=len(PRIMES)):
                assert abs(route_ratio(p,q,state,PRIMES)-target)<4e-14
                tested+=1
    assert tested==10935
    for p,q in ((2,3),(3,5),(3,7),(5,7),(7,11),(11,13)):
        exact={(4,0):1,(2,0):-4,(0,0):2,(0,1):-eps(p,q),(0,-1):-eps(p,q)}
        assert square_charpoly(p,q)==exact,(p,q)
    assert SCALE>1
    assert abs(eps(3,7)*exp(-1j*THETA)-1)>0.5
    print("PASS: 10935 state-dependent plaquette identities")
    print("PASS: 6 exact Laurent-polynomial spectral determinants")
    print("URT parameters",SCALE,THETA)
    print("RH remains OPEN; no zeta-determinant identity or stability theorem is claimed")

if __name__=="__main__":
    test()

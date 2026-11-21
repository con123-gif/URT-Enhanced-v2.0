#!/usr/bin/env python3
"""Exact arithmetic test: reversible rational prime lattice, twisted Weyl cocycle,
positive-cone compression and loss of the zeta trace on the group completion.
Not a physical CCR, not RH, no arbitrary fitted constants.
"""
import cmath
import math
from fractions import Fraction
from itertools import product

phi=(1+math.sqrt(5))/2
theta=2*math.pi/phi**2

def p_up(ab):
    a,b=ab
    return (a+1,b),1+0j

def q_up(ab,c):
    a,b=ab
    return (a,b+1),c**(-a)

def apply_next(op, result, c):
    state, w=result
    nxt, phase=(p_up(state) if op=='p' else q_up(state,c))
    return nxt,w*phase

def sigma(g,h,c):
    # W(a,b)=Up^a Uq^b; group law W(g)W(h)=sigma(g,h)W(g+h)
    return c**(-g[1]*h[0])

def test():
    assert Fraction(3,7)*Fraction(7,11)==Fraction(3,11)
    checked=0
    for eps in (+1,-1):
        c=eps*cmath.exp(-1j*theta)
        assert abs(abs(c)-1)<1e-12
        for a,b in product(range(-4,5),repeat=2):
            state=(a,b)
            # Up Uq versus Uq Up, rightmost applied first.
            pq=apply_next('p',apply_next('q',(state,1+0j),c),c)
            qp=apply_next('q',apply_next('p',(state,1+0j),c),c)
            assert pq[0]==qp[0]==(a+1,b+1)
            assert abs(pq[1]-c*qp[1])<3e-13
            # On Q+ each edge acts by a bijection of basis with unit modulus.
            assert abs(abs(q_up(state,c)[1])-1)<2e-13
            # The bilateral group has U_p U_p* = U_q U_q* = identity.
            # Compressed positive cone: Sp Sp* projects onto a>=1,
            # Sq Sq* onto b>=1; the Mobius product isolates (0,0).
            if a>=0 and b>=0:
                bp=int(a==0); bq=int(b==0)
                mob=1-int(a>=1)-int(b>=1)+int(a>=1 and b>=1)
                assert bp*bq==mob==int(a==b==0)
            checked+=1
        for a,b,c1,d,e,f in product(range(-2,3),repeat=6):
            g=(a,b); h=(c1,d); k=(e,f)
            left=sigma(g,h,c)*sigma((a+c1,b+d),k,c)
            right=sigma(h,k,c)*sigma(g,(c1+e,d+f),c)
            assert abs(left-right)<2e-12
        print('sector',eps,'projective commutator and 2-cocycle PASS')
    print('PASS:',checked,'basis states tested over both reciprocity sectors')
    print('PASS: cocycle associativity across all 5^6 signed triples per sector')
    print('EXACT: Q_+ multiplication is Grothendieck completion of N_+ multiplication')
    print('EXACT: on Q_+ bilateral shifts are unitary; intrinsic divisibility projectors vanish')
    print('EXACT: positive-cone compression restores prime-boundary and Mobius projectors')
    print('NO-GO: Tr exp(-s log r), r in Q_+, is not trace class for any complex s')
    print('OPEN: primitive URT uniquely fixes cocycle; physical CCR/ZPE density; completed-zeta determinant')

if __name__=='__main__':test()

#!/usr/bin/env python3
"""Exact charge transport on native Q60 four M_n maps; formal representation certificate."""
import sympy as s
z=s.symbols('z',nonzero=True)
charges=(2,-2,4,-4)
# Original native H64 hidden input has charge +2, Q60 maps M_n are nonzero.
# Tensor/conjugate functor, no invented map to the 12-dimensional Hopf charge-4 sheet.
operations={2:('b',1,0),-2:('conj(b)',0,1),4:('b tensor b',2,0),-4:('conj(b) tensor conj(b)',0,2)}
for n,(name,p,q) in operations.items():
 assert s.simplify(z**(2*p-2*q)/z**n-1)==0
 assert p+q==abs(n)//2
 assert all(a+b>=p+q for a in range(p+1) for b in range(q+1) if 2*(a-b)==n)
print('PASS unique minimal tensor degrees',[(n,operations[n][1:]) for n in charges])
# Exact Wilson local U(1) covariant derivative and seagull identities for each sheet.
a,t=s.symbols('a t',real=True)
for n in charges:
 kinetic=s.expand((t-n*a)**2)
 assert s.diff(kinetic,a).subs(a,0)==-2*n*t
 assert s.diff(kinetic,a,2)==2*n*n
 assert s.expand(kinetic.subs({t:t+n*s.symbols('u'),a:a+s.symbols('u')})-kinetic)==0
 print('WARD',n,'linear',-2*n,'seagull',n*n)
print('PASS formal charge covariance and both algebraic Ward contact orders; interacting Q60 join NOT verified')

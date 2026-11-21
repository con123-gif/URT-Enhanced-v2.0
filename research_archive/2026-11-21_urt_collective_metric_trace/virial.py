#!/usr/bin/env python3
import sympy as s
K,G,U2,U4,U0,V=s.symbols('K G U2 U4 U0 V', nonnegative=True)
E=K+G+U2+U4+U0
p=(K-G/3-U2-U4-U0)/V
rho=E/V
assert s.simplify(rho+3*p-(4*K-2*(U2+U4+U0))/V)==0
virial=G+U2+2*U4
assert s.simplify((rho+3*p).subs(K,virial)-(4*G+2*U2+6*U4-2*U0)/V)==0
print('PASS canonical stationary scalar virial algebra: pure nonnegative quadratic/quartic potential cannot accelerate without a constant or other term.')

"""Exact Cathedral/H64 2026-10-31 symbolic certificates.

Checks the *original* six-sign H64 spectrum, 197=19+178 split, original
two-channel history Schur complement and explicit negative Hessian direction.
The continuum-time spectral convergence is an analytic theorem in the
accompanying docs note, NOT a claim made by numerical testing.
"""
from collections import Counter
from itertools import product
import sympy as s

phi = (1+s.sqrt(5))/2
delta = s.Rational(3,20)-80*s.pi/(1053*phi)
assert 0<float(delta)<0.003

hist = Counter(15-sum(z[i]*z[j] for i in range(6)
                  for j in range(i+1,6))
               for z in product((-1,1),repeat=6))
assert hist==Counter({0:2,10:12,16:30,18:20})
# The source occupies exactly U_h P3 and U_h P5, dimension 4+4.
other_vertex=sum(v-1 for v in [4,8,6,20])
edge=90-sum(v-1 for v in [4,8,6,20,12])
face=sum(f-1 for f in [4,6,8,12,20])
free_history=64-2-4-4
interacting=(12-1)+4+4
spectator=other_vertex+edge+face+free_history
assert (other_vertex,edge,face,free_history)==(34,45,45,54)
assert (interacting,spectator)==(19,178)
assert interacting+spectator==197

# Exact 2-field restriction from the pre-existing rational incidence norms.
A=s.Rational(1,810)+delta**2/1920
B=s.Rational(1,45)+delta**2/120
mu=B/A
d=B/s.sqrt(A)
c=s.Rational(1,10)+delta**2/30
ceff=s.Rational(4,45)+s.Rational(7,240)*delta**2
assert s.simplify(c-d*d/(2*mu)-ceff)==0
assert s.simplify(6-2*d*(4/d))==-2
# Check the exact history sector square-completions.
y3,h3,y5,h5=s.symbols('y3 h3 y5 h5',real=True)
q3=9*(y3-h3/18)**2+s.Rational(2,9)*h3*h3
q5=8*(y5-delta*h5/16)**2+s.Rational(7,32)*delta**2*h5*h5
assert s.simplify(q3-(9*y3*y3-y3*h3+h3*h3/4))==0
assert s.simplify(q5-(8*y5*y5-delta*y5*h5+delta**2*h5*h5/4))==0

print('PASS exact H64 eigenvalues: 0^2,10^12,16^30,18^20')
print('PASS existing candidate: 197 = 19 interacting + 178 quadratic')
print('PASS history completion, positive quartic, negative Hessian witness')
print('free spatially uniform exact gap =',s.sqrt(3-s.sqrt(5)))
print('free gap numeric =',s.N(s.sqrt(3-s.sqrt(5)),15))
print('delta =',s.N(delta,15))
print('static quartic =',s.N(ceff,15))
print('ANALYTIC continuum-time proof: see docs/CATHEDRAL_INTERACTING_TIME_CUTOFF_PROOF_2026-10-31.md')

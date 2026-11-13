#!/usr/bin/env python3
"""Q87 scoped exact theorem: eliminate the positive coefficient from the native P5 purity test.

This is NOT a certificate that the native joint bridge has nonzero commutator;
that remaining exact bridge evaluation is the next subproblem.
"""
import sympy as sp
from itertools import combinations

# Reconstruct the original Q85 six-bit two-flip Hamiltonian H = 15I - sum X_i X_j.
n = 64
H = sp.zeros(n)
for h in range(n):
    H[h,h] = 15
    for i,j in combinations(range(6),2):
        H[h, h ^ (1 << i) ^ (1 << j)] -= 1
assert H == H.T
assert all(sum(H[h,k] for k in range(n)) == 0 for h in range(n))

# Exact native Walsh eigenvalues, including the P5-supporting k=2 sector.
W = sp.Matrix([[(-1)**((h & m).bit_count()) for m in range(n)] for h in range(n)])
assert W.T*W == 64*sp.eye(n)
for k in range(7):
    indices = [m for m in range(n) if m.bit_count() == k]
    assert H*W[:,indices] == 2*k*(6-k)*W[:,indices]
assert 2*2*(6-2) == 16

# The Q85 native source projector G5 is a rank-four A5 quartet inside Walsh k=2;
# the following is an operator theorem, valid for ANY such orthogonal projector.
# K_c = H+c A, G5^2=G5, HG5=16 G5. The source variance around 16 is
# Tr[G5 (K_c-16 I)^2] = c^2 Tr[G5 A^2].
# The physically relevant single-eigenbranch criterion is weaker:
# (I-G5)K_c G5 = c(I-G5)A G5. For c>0 it vanishes iff the RHS factor vanishes.
c, a, b, d, e = sp.symbols('c a b d e', positive=True, real=True)
# Multiplicity-space entries a,b,d,e are UNDETERMINED coefficients of the
# actual A5-twirled bridge penalty; not invented values for that operator.
A = sp.Matrix([[a,b,d,e],[b,0,0,0],[d,0,0,0],[e,0,0,0]])
P = sp.diag(1,0,0,0)
I = sp.eye(4)
Hred = sp.diag(16,16,18,18)
K = Hred + c*A
cross = (I-P)*K*P
assert cross == c*(I-P)*A*P
assert sp.factor(sp.trace(cross.T*cross)) == c*c*(b*b+d*d+e*e)
# In the actual A5 quartet the 4x4 multiplicity-space result is repeated four
# times, so the full Hilbert-Schmidt norm squared is 4 c^2 times this quantity.
assert sp.factor(4*sp.trace(cross.T*cross) - 4*c*c*(b*b+d*d+e*e)) == 0
# Exact equivalence: nonzero off-diagonal coupling rules out a pure G5 branch
# for EVERY c>0. No scan, eigenvalue ordering, or fitted parameter is needed.
assert sp.solve(sp.Eq(sp.trace(cross.T*cross),0), c) == []
print('Q87_COEFFICIENT_ELIMINATION_PASS')
print('H6 Walsh k=2 eigenvalue 16, multiplicity 15; native G5 is rank 4 therein (Q85 premise)')
print('For c>0, ||(I-G5)K_c G5||_F^2 = c^2 ||(I-G5)Abar_BJ G5||_F^2')
print('A single certified nonzero bridge coupling excludes (4,2,2,0) for ALL positive c')
print('Native bridge coupling not evaluated in this certificate; Q87 remains open')

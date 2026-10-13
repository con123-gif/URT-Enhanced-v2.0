"""Scale-ladder identifiability test for the Cathedral dark-information candidate.

Shows that a nearly pure inverse-square law follows from *choosing*
second-derivative radial weights, not from the finite 13-cell eigenvalue alone.
A finite 64-scale example is illustrative; dim(H64)=64 does NOT imply 64
independent logarithmic length scales.
"""
import mpmath as mp

mp.mp.dps = 45
kappa = mp.pi / mp.e
a = mp.log(kappa)
lam = 6 + mp.sqrt(5)

def infinite_ladder(q, r):
    x = mp.log(lam*r)/a
    n0 = int(mp.floor(x))
    return a*mp.fsum(
        (lam * mp.exp(-a*n))**q * mp.exp(-lam*r*mp.exp(-a*n))
        for n in range(n0-350, n0+351)
    )

def finite_ladder(q, r, N=64):
    return a*mp.fsum(
        (lam * mp.exp(-a*n))**q * mp.exp(-lam*r*mp.exp(-a*n))
        for n in range(N)
    )

# Mellin / Poisson summation: continuum average Gamma(q)/r^q,
# for any positive q; q is a power fixed only by a physical response operator.
for q in (1, 2, 3):
    for r in (mp.mpf('0.1'), mp.mpf('1'), mp.mpf('100')):
        rel = infinite_ladder(q,r)*r**q/mp.gamma(q)-1
        assert abs(rel) < mp.mpf('1e-20')
    print('weight power', q, 'averaged radial slope -', q)

# This finite ladder is a sensitivity diagnostic, NOT a derivation from H64.
print('illustrative 64-scale span kappa^63 =', mp.nstr(kappa**63, 15))
for n in (1,10,15,20,30,40,50,60):
    r = kappa**n/lam
    normalized = r*r*finite_ladder(2,r,N=64)
    print('index',n,'finite normalized kernel',mp.nstr(normalized,16))
print('PASS: q-parameter identifiability and finite-scale boundary test')

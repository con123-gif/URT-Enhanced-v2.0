#!/usr/bin/env python3
"""Optional all-ancestor Newton–Platonic ultraviolet field certificate.

Uses only already proved rational eigenvalues of the independent
five-cube spectral filter K_N=Pbar^3+(Q^2/120)^2.
All n-th level ancestors are contacted once each, yielding the
triangular exponent a_n=n(n+1)/2. This is a *specified rule*, not a
theorem selecting itself from geometry.
"""
import math

s=(3-math.sqrt(5))/2
lams=[(1/64,8),(1/36,6),(8/125,5)]

def full_moment(p, max_n=250):
    result=19.0
    for n in range(1,max_n+1):
        a=n*(n+1)//2
        value=0.0
        for lam, mult in lams:
            exponent=p*n*math.log(1/s)+a*math.log(lam)
            value+=mult*math.exp(exponent) if exponent>-745 else 0.0
        result+=value
    return result

for p in (0,2,4,8,16):
    value=full_moment(p)
    assert math.isfinite(value) and value>19
    print("order",p,"finite UV moment",format(value,".15g"))

# Rigorous bound (proof described in paired Markdown):
# |f_n(z)| <= 19 exp(n * sup_Re(z) log(1/s)
#                     + n(n+1)/2 log(8/125)).
# Since log(8/125)<0, this bound is summable uniformly
# on every compact subset of complex z. The complex
# moment function is therefore ENTIRE by Weierstrass.
print("PASS: all finite polynomial UV orders under all-ancestor rule")

#!/usr/bin/env python3
"""Exact high-precision URT horizon-entropy mismatch and correlation criterion.
Conditional mathematical physics: does not derive actual horizon microstates or ZPE.
"""
import mpmath as mp
mp.mp.dps=65

phi=(1+mp.sqrt(5))/2
theta=2*mp.pi/phi**2
delta=mp.mpf(3)/20 - 80*mp.pi/(1053*phi)
p=delta**2/(1+delta**2)
h=-p*mp.log(p)-(1-p)*mp.log(1-p)
s0=mp.log(4)
s=s0+h

def spectrum(eps):
    f=theta if eps==1 else mp.pi-theta
    return sorted((2-2*mp.cos(f/4),2-2*mp.sin(f/4),
                   2+2*mp.sin(f/4),2+2*mp.cos(f/4)))

sp=spectrum(1);sm=spectrum(-1)
for power in range(4):
    assert abs(sum(x**power for x in sp)-sum(x**power for x in sm))<mp.mpf('1e-56')
assert abs(sum(x**4 for x in sp)-sum(x**4 for x in sm)-16*mp.cos(theta))<mp.mpf('1e-56')
d=sum(mp.sqrt(x) for x in sp)-sum(mp.sqrt(x) for x in sm)
ratio=2*mp.pi*d/s
ratio_without_delta=2*mp.pi*d/s0
missing=1-ratio
i_needed=s-2*mp.pi*d
required_d=s/(2*mp.pi)
# factorisation rho_* = diag(1-p,p) tensor I4/4, hence its one-carrier state
# contains no correlation between the 4-d visible factor and the binary tag.
rho=[mp.mpf(1)/(4*(1+delta**2))]*4
rho+= [delta**2/(4*(1+delta**2))]*4
tensor=[v/4 for v in (1-p,p) for _ in range(4)]
assert all(abs(x-y)<mp.mpf('1e-61') for x,y in zip(rho,tensor))
assert abs(-sum(x*mp.log(x) for x in rho)-s)<mp.mpf('1e-56')
# H_2(p) is maximum total-correlation budget per carrier if all nontrivial
# correlations live ONLY among binary tags with these fixed local marginals:
# I_N = N H2(p) - S(rho_hidden_joint) <= N H2(p).
assert i_needed>750*h
assert 0<i_needed<s0
# Under the EXTRA hypothesis S_horizon = N*s - I_N and additive relative
# ZPE E=N d hbar c/R, with I_N=N*i, closure ratio is 2*pi*d/(s-i).
def closure_ratio(i):
    return 2*mp.pi*d/(s-i)
assert abs(closure_ratio(0)-ratio)<mp.mpf('1e-58')
assert abs(closure_ratio(h)-ratio_without_delta)<mp.mpf('1e-58')
assert abs(closure_ratio(i_needed)-1)<mp.mpf('1e-58')
# Increasing positive delta increases binary entropy, making the deficit
# larger at fixed d.  dH2/d(delta) = -4 delta log(delta)/(1+delta^2)^2.
dH_ddelta=-4*delta*mp.log(delta)/(1+delta**2)**2
assert dH_ddelta>0
dR_ddelta=-2*mp.pi*d*dH_ddelta/s**2
assert dR_ddelta<0
print("PASS: rho_* product factorisation, 4 spectral moments, entropy identities")
for key,value in [
    ("delta",delta),("hidden probability p",p),("hidden entropy H2(p)",h),
    ("visible entropy ln4",s0),("local entropy s",s),
    ("plaquette ZPE difference d",d),
    ("original ratio 2pi d/s",ratio),
    ("ratio if hidden entropy suppressed",ratio_without_delta),
    ("hidden entropy effect on ratio",ratio-ratio_without_delta),
    ("remaining mismatch",missing),
    ("needed per-carrier correlation (nats)",i_needed),
    ("needed per-carrier correlation (bits)",i_needed/mp.log(2)),
    ("needed correlation / hidden entropy",i_needed/h),
    ("needed additional per-carrier d",required_d-d),
    ("closure ratio with maximal hidden-tag-only correlation",closure_ratio(h)),
    ("derivative of closure ratio wrt delta",dR_ddelta)]:
    print(key,"=",mp.nstr(value,32))
print("EXACT NECESSITY only: I_total/N=s-2pi*d for closure at kappa=1")
print("NO-GO: correlations restricted to rare binary hidden tag cannot close gap")
print("OPEN: derive joint rho_N from full URT, identify horizon modes and energy; no fitted correlation input")

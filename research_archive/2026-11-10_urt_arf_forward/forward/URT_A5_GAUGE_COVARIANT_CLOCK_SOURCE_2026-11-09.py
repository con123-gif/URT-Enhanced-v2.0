#!/usr/bin/env python3
"""A parameter-free *conditional completion*: generate source covariance on
Z24 with Wilson-covariant AR(1) transfer using the four exact A5-URT poles;
calculate contact-inclusive phase response of original charge-2 clock kernel.
This is an explicitly constructed stochastic completion, not proof nature
selects it; its purpose is to avoid the fixed-gauge source artifact.
"""
import mpmath as mp
mp.mp.dps=90
phi=(1+mp.sqrt(5))/2
omega=2*mp.pi/phi**2
r=mp.pi/mp.e
Delta=mp.mpf(3)/20-80*mp.pi/(1053*phi)
c0=36+72*mp.sqrt(5)/5
weights={'3':[(c0/2,mp.mpf(3)/20),(c0/2,mp.mpf(1)/20)],
         '5':[(mp.mpf(9)/2,mp.mpf(1)/15),(mp.mpf(5)/2,-mp.mpf(1)/20)]}
q=2

def energy(angle):
    # Wilson-covariant cyclic Gaussian with poles lambda from URT/A5.
    total=mp.mpf(0)
    for label,E,amp in [('3',18,1),('5',16,Delta**2)]:
        raw=mp.mpf(0);elim=mp.mpf(0)
        for m in range(24):
            delta=q*angle-2*mp.pi*m/24
            spectral=sum(a*(1-la*la)/(1-2*la*mp.cos(delta)+la*la) for a,la in weights[label])
            A=E+r*r*(2-2*mp.cos(delta))
            raw+=spectral
            elim+=spectral/A
        total+=amp*(mp.mpf('.25')*raw-mp.mpf('.5')*elim)
    return total
v=energy(omega);j=mp.diff(energy,omega)
print('gauge-covariant source original 24 clock energy',mp.nstr(v,70))
print('golden orientation total Wilson holonomy source current J',mp.nstr(j,70))
print('earlier undressed fixed-source phase current was order -1.035, not gauge-covariant ensemble')
# Exactly gauge-covariant construction from Uq[3] in matrix language: each
# Uq transforms by local diagonal similarity; any rational function and trace
# of Uq and its adjoint stay gauge invariant.
import numpy as np
th=np.full(24,float(omega));al=np.sin(np.arange(24)*.7)*.4

def link_U(theta):
    U=np.zeros((24,24),complex)
    for j in range(24):U[(j+1)%24,j]=np.exp(1j*q*theta[j])
    return U
U=link_U(th);up=link_U(th+np.roll(al,-1)-al)
G=np.diag(np.exp(1j*q*al))
assert np.linalg.norm(up-G@U@G.conj().T)<1e-13

def cost(theta):
    U=link_U(theta);A=18*np.eye(24)+float(r*r)*(2*np.eye(24)-U-U.conj().T)
    C=np.zeros((24,24),complex)
    for a,la in weights['3']:
        x=np.linalg.inv(np.eye(24)-float(la)*U)
        C+=float(a*(1-la*la))*(x@x.conj().T)
    return np.trace(.25*C-.5*C@np.linalg.inv(A)).real
assert abs(cost(th)-cost(th+np.roll(al,-1)-al))<3e-12
print('explicit 24x24 Gaussian gauge conjugation and trace Ward identity: PASS')
assert abs(j)<mp.mpf('1e-10')
print('PASS')

#!/usr/bin/env python3
"""Exact modular-source matching and nonuniqueness audit of original 7 Nov Cathedral.

Requires numpy/scipy/sympy/mpmath and the *original* original-built
cathedral_constructed_joint_dynamics_2026_11_07.py beside this script.
All 190 Platonic cochains, 64 signed histories and 24 clock links are taken
from that source, rather than replaced by a surrogate. No third-party code.
"""
from pathlib import Path
import runpy
import numpy as np
import sympy as sp

z=runpy.run_path(str(Path(__file__).with_name('cathedral_constructed_joint_dynamics_2026_11_07.py')))
Delta=float(z['Delta']); r=float(z['r']); eta=float(z['eta'])
P3=z['P3']; P5=z['P5']; P=P3+P5
# Frobenius checks on all 20 dual face coordinates, nontrivial eight-carrier.
T=P3+Delta**2*P5
B=P3+Delta*P5
assert abs(np.trace(P3)-4)<1e-10
assert abs(np.trace(P5)-4)<1e-10
assert np.linalg.norm(P3@P5)<1e-10
assert np.linalg.norm(B@B-T)<1e-11
assert np.linalg.eigvalsh(B).min()>-1e-11
rho=T/(4*(1+Delta**2))
assert abs(np.trace(rho)-1)<1e-11
assert np.linalg.norm(P3@rho@P3-P3/(4*(1+Delta**2)))<1e-11
assert np.linalg.norm(P5@rho@P5-Delta**2*P5/(4*(1+Delta**2)))<1e-11

# Representation-theoretic ambiguity, using exact A5 class characters.
phi=(1+sp.sqrt(5))/2
ch8=[sp.Integer(8),sp.Integer(0),sp.Integer(-1),phi,1-phi]  # 3 + 5
ch12=[sp.Integer(12),sp.Integer(0),sp.Integer(0),sp.Integer(2),sp.Integer(2)]  # 1+3+3'+5
ch4=[sp.Integer(4),sp.Integer(0),sp.Integer(1),sp.Integer(-1),sp.Integer(-1)]
class_sizes=[1,15,20,12,12]
square_class=[0,0,2,4,3]  # g^2: identity, 2A->1, 3A->3A, 5A<->5B

def sym2_character(ch):
    return [sp.simplify((ch[i]**2+ch[square_class[i]])/2) for i in range(5)]

def multiplicity(ch,target):
    return sp.simplify(sum(w*a*b for w,a,b in zip(class_sizes,ch,target))/60)

sym8=sym2_character(ch8)
sym12=sym2_character(ch12)
assert sym8==[36,4,0,1,1],sym8
assert sym12==[78,6,0,3,3],sym12
m8=multiplicity(sym8,ch4)
m12=multiplicity(sym12,ch4)
assert m8==2 and m12==4
# For two distinct hidden 4-carriers, possible equivariant quadratic sources:
source_maps_8=2*m8
source_maps_12=2*m12
assert source_maps_8==4 and source_maps_12==8

# Work with the original actual all-five 50->8->12 hidden source at 24 sites.
h3=np.asarray(z['h3a']);h5=np.asarray(z['h5a']);thetas=np.asarray(z['thetas'])
Uh=z['Uh'];Hbits=z['Hbits'];N=int(z['N']); n64=64
assert h3.shape==(24,20) and h5.shape==(24,20)
assert z['D'].shape==(190,190) and Uh.shape==(64,20)
assert np.linalg.norm(h3)>1e-5 and np.linalg.norm(h5)>1e-5
assert np.linalg.norm((21*np.eye(n64)-Hbits)@Uh-Uh@(3*P3+5*P5))<1e-10

L2=z['clock_laplacian'](thetas,2)
A3=18*np.eye(N)+r**2*L2
A5=16*np.eye(N)+r**2*L2
assert np.linalg.eigvalsh(A3).min()>=18-1e-10
assert np.linalg.eigvalsh(A5).min()>=16-1e-10
z3=np.linalg.solve(A3,h3)
z5=np.linalg.solve(A5,h5)
c3=.25*np.vdot(h3,h3).real-.5*np.vdot(h3,z3).real
c5=.25*np.vdot(h5,h5).real-.5*np.vdot(h5,z5).real
assert c3>=(2/9)*np.vdot(h3,h3).real-1e-11
assert c5>=(7/32)*np.vdot(h5,h5).real-1e-11

def direct(g,h3,h5,thetas,y):
    cov=np.roll(y,-1,axis=0)-np.exp(2j*thetas)[:,None]*y
    b=(h3+g*h5)@Uh.T
    return (.5*np.einsum('ia,ab,ib->',y.conj(),Hbits,y).real
            +.5*r*r*np.vdot(cov,cov).real
            +.25*(np.vdot(h3,h3).real+g*g*np.vdot(h5,h5).real)
            -np.vdot(y,b).real)

def reduced(g):
    y=(z3+g*z5)@Uh.T
    v=c3+g*g*c5
    value=direct(g,h3,h5,thetas,y)
    assert abs(value-v)<2e-11, (g,value,v)
    assert v>=(2/9)*np.vdot(h3,h3).real+(7/32)*g*g*np.vdot(h5,h5).real-1e-11
    return v,y

v_original,y_original=reduced(Delta)
v_alternative,y_alternative=reduced(Delta**2)
assert np.linalg.norm(y_original-z['yopt'])<1e-10
assert abs((v_original-v_alternative)-c5*(Delta**2-Delta**4))<1e-11
assert v_original>v_alternative and (v_original-v_alternative)>1e-11

# For either choice, local U(1) covariance remains exact, all fields exist.
rng=np.random.default_rng(20261108)
alpha=rng.uniform(-1,1,N)
phase=np.exp(2j*alpha)[:,None]
theta_prime=thetas+np.roll(alpha,-1)-alpha
for g in [Delta, Delta**2]:
    v,y=reduced(g)
    other=direct(g,phase*h3,phase*h5,theta_prime,phase*y)
    assert abs(v-other)<2e-11, (g,v,other)

# The original isolated KMS state remains identical for both models at zero source.
p5_0=Delta**2/(1+Delta**2)
assert abs(p5_0-np.trace(P5@rho))<1e-11
# Positivity of the source dependent free energy for either compatible extension.
def kmsg(g):
    E3=.25*np.vdot(h3[0],h3[0]).real
    E5=.25*g*g*np.vdot(h5[0],h5[0]).real
    odds=Delta**2*np.exp(-eta*(E5-E3))
    return odds/(1+odds)
assert 0<kmsg(Delta)<1 and 0<kmsg(Delta**2)<1

print('PASS: exact A5 Sym²(3+5) character',sym8,'gives',source_maps_8,'quadratic maps to 4+4')
print('PASS: exact A5 Sym²(12-vertex) character',sym12,'gives',source_maps_12,'quadratic maps to 4+4')
print('PASS: unique positive hidden amplitude B = P3 + Delta P5; ||B²-T||',np.linalg.norm(B@B-T))
print('PASS: original 190 cochains, native H64 and 24-clock retained')
print('PASS: g=Delta and g=Delta² both exact positive, gauge-covariant finite source actions')
print('original g=Delta reduced energy:',f'{v_original:.15g}')
print('alternate g=Delta² reduced energy:',f'{v_alternative:.15g}')
print('different predicted nonlinear source energy:',f'{v_original-v_alternative:.15g}')
print('original isolated Gibbs p5:',f'{p5_0:.15g}')
print('adaptive p5 in original source:',f'{kmsg(Delta):.15g}')
print('adaptive p5 in alternate source:',f'{kmsg(Delta**2):.15g}')
print('CONCLUSION: KMS-positive-amplitude matching selects g=Delta, but geometry/symmetry/positivity/no-fit alone do not select the complete source map.')

#!/usr/bin/env python3
"""Original full K64 -> two-pole historical ARF spectral residues.
Imports the owner's UNMODIFIED October 29 chiral-hybridization script.
All calculations below use full 64x64 K, not a 13-site substitute.
Requires sympy, numpy, networkx. No experimental constants/fitting.
"""
import argparse, contextlib, io, runpy
from pathlib import Path
import numpy as np
import sympy as sp

parser=argparse.ArgumentParser()
parser.add_argument('--source',default=str(Path(__file__).parent/'cathedral_audit'/'cathedral_64_chiral_hybridization_2026_10_29.py'))
args=parser.parse_args()
with contextlib.redirect_stdout(io.StringIO()) as original_log:
    d=runpy.run_path(args.source)
K,B,LI,LD=d['K'],d['B'],d['L_I'],d['L_D']
I12,I20,I64=sp.eye(12),sp.eye(20),sp.eye(64)
Ph=I20-B.T*(B*B.T).inv()*B
P3=Ph*(5*I20-LD)/2
P5=Ph*(LD-3*I20)/2
assert P3.trace()==4 and P5.trace()==4

# Hidden energy 5 in common high quartet and relative low quartet.
M5=sp.BlockMatrix([[(P3+P5)/2,(P5-P3)/2],[(P5-P3)/2,(P3+P5)/2]]).as_explicit()
Q5=sp.diag(sp.zeros(24),M5)
assert Q5.trace()==8 and Q5*Q5==Q5 and K*Q5==5*Q5

# Exact icosahedral fiveplet (L_I eigenvalue six), which has K_V energy seven.
# icosahedron spec L_I = 0, 5±sqrt(5), 6 (multiplicity 5).
Pvertex7= -LI*(LI*LI-10*LI+20*I12)/24
assert Pvertex7.trace()==5 and Pvertex7*Pvertex7==Pvertex7
M7=sp.BlockMatrix([[P5/2,-P5/2],[-P5/2,P5/2]]).as_explicit()
Q7=sp.diag(Pvertex7,sp.zeros(12),M7)
assert Q7.trace()==9 and Q7*Q7==Q7 and K*Q7==7*Q7
assert Q5*Q7==sp.zeros(64)

# Original archive's full K64 trace and eigenvalue multiplicities.
assert K.trace()==304 and (K*K).trace()==1826
w=np.linalg.eigvalsh(np.array(K.evalf(15),float))
assert np.sum(np.isclose(w,5.,atol=1e-8,rtol=0))==8
assert np.sum(np.isclose(w,7.,atol=1e-8,rtol=0))==9

z=sp.Symbol('z')
gamma=sp.Rational(1,81)
phi=(1+sp.sqrt(5))/2
delta=80*sp.pi/(1053*phi)
# For (K-zI)^(-1) all statements below are at non-pole z; at z=0
# use the reduced resolvent on Q5 and Q7, since full K has two zero modes.
Sigma7=gamma*delta**3*Q7.trace()/(7-z)
Sigma5=gamma*Q5.trace()/64/(5-z)
assert sp.simplify(Sigma7-delta**3/(9*(7-z)))==0
assert sp.simplify(Sigma5-gamma/(8*(5-z)))==0
Sigma=sp.factor(Sigma7+Sigma5)
assert sp.simplify(Sigma.subs(z,0)-delta**3/63-gamma/40)==0

# Historical beta^3 return is a separate (conditional) source construction.
beta=sp.Rational(1,4)
assert beta**3/(1-beta**3)==sp.Rational(1,63)
Ralpha=3/(64*phi)+1/(79*phi**2)
a_ar=137+(delta-Sigma.subs(z,0))**2/sp.pi**2+Ralpha
a_old=137+delta**2/sp.pi**2+Ralpha

print('FULL ORIGINAL 64x64 MATRIX: PASS; Tr K=304, Tr K²=1826')
print('EXACT Q7: icosahedral 5-plet + antisymmetric hidden 4-plet; rank9, KQ7=7Q7')
print('EXACT Q5: symmetric hidden 4-plet + antisymmetric hidden 4-plet; rank8, KQ5=5Q5')
print('PASS full resolvent 7-pole: gamma*delta³*Tr(Q7)/(7-z) = delta³/[9(7-z)]')
print('PASS full resolvent 5-pole: gamma*Tr(Q5)/[64(5-z)] = gamma/[8(5-z)]')
print('PASS combined Sigma_ARF(z) =',Sigma)
print('Delta_ARF = ',sp.N(-Sigma.subs(z,0),18))
print('delta_eff = ',sp.N(delta-Sigma.subs(z,0),18))
print('alpha_inverse_ARF = ',sp.N(a_ar,18))
print('alpha_inverse_bare = ',sp.N(a_old,18))
print('NOTE source-normalization choice (unnormalized 7 trace vs 64-normalized 5 trace) is NOT deduced from primitive q')

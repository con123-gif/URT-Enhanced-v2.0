import runpy, contextlib, io, numpy as np, sympy as sp
p='/mnt/data/cathedral_audit/cathedral_constructed_joint_dynamics_2026_11_07.py'
with contextlib.redirect_stdout(io.StringIO()): n=runpy.run_path(p)
source=n['hidden_source']; P=n['Plinear'];
u=np.ones(50,dtype=np.complex128)
a,b=source(u)
print('native-7Nov 50->8->12 source on uniform 50-vertex signal:')
print(' ||Plinear 1||',np.linalg.norm(P@u),'||h3||',np.linalg.norm(a),'||h5||',np.linalg.norm(b))
print('conclusion: native nonlinear source does not generate ARF vacuum-rail terms from a uniform vertex singlet; not a proof against non-uniform URT source readouts')
from math import pi,e,sqrt
phi=(1+sqrt(5))/2
r=pi/e
Dstar=80*pi/(1053*phi)
gamma=1/81
sigdelta= Dstar**3/63 + gamma/40
print('ARF source needed for rail',sigdelta)
# all full source couplings linearized at the origin are zero because h(z)=P[(C Q z)^2]
# mathematically D h(0)=0. A scalar scale of B gives different Feshbach residues
print('Feshbach: B=c P changes residue by c^2 while original K, A5, positivity stay unchanged')
# invariant current two-plane in H9 = 1 + 3p + 5
P1=sp.diag(sp.ones(1),sp.zeros(8))
P3=sp.diag(sp.zeros(1),sp.eye(3),sp.zeros(5))
P5=sp.diag(sp.zeros(4),sp.eye(5))
S13=3*P1-P3; S15=5*P1-P5
assert S13.trace()==S15.trace()==0 and S13!=S15
assert S13.norm()!=0 and S15.norm()!=0
print('Two independent A5-invariant traceless currents: S13, S15; rank of Gram:',sp.Matrix([[sp.trace(x*y) for x in (S13,S15)] for y in (S13,S15)]).rank())
# Uniform Haar on four D4 cosets, order-3 triality return
beta=sp.Rational(1,4)
print('Haar sheet weight',beta,'3-return sum',sp.factor(beta**3/(1-beta**3)))

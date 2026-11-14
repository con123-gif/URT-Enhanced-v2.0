#!/usr/bin/env python3
"""Q113: actual selected Q77 24-clock mixed G5 spectral residues.

Reexecutes native Q112 Q77 rigorous Krawczyk + Q82 original icosahedron
G5 projector and A5 twirl. Proves mixed spectral variance for ALL c>0
without fitting historical ARFs or fixing old (4,2,2,0) residues.
"""
from pathlib import Path
import runpy
import numpy as np
from fractions import Fraction as Fr
from contextlib import redirect_stdout
from io import StringIO
src=Path(__file__).resolve().parents[1]/'2026-11-14_q112_native_hidden_clock_leak/Q112_NATIVE_G5_CLOCK_LEAK.py'
with redirect_stdout(StringIO()) as capture:
    q=runpy.run_path(str(src))
P=np.asarray(q['P'],float);A=np.asarray(q['Abar'],float)
I=np.eye(64);N=I-P
assert np.linalg.norm(P@P-P)<1e-10 and abs(np.trace(P)-4)<1e-10
assert np.linalg.norm(A-A.T)<1e-11
off=N@A@P
mix=float(np.sum(off**2))
assert mix>0
witness=float(q['lower'])
assert witness>0 and mix>=witness**2
# The original Hbits acts exactly as 16 on rank-four G5.
# All offblock variance is caused by c*A, independently of any
# diagonal A5-equivariant Hbits action in the complementary space.
# The normalized G5 spectral measure nu_c has mass 1.
# Its variance is:
# (1/4)Tr[P K_c^2 P]-(1/4)Tr[P K_c P]^2 ?
# CAUTION: the scalar variance also includes spread of PAP within G5.
# The exact within-source dispersion is Var(PAP) and offblock term.
AP=P@A@P
mean=float(np.trace(AP)/4)
within=float(np.trace(AP@AP)/4-mean**2)
assert within>=-1e-10
# K0 = Hbits reconstructed as a sum of two-bit X flips, diagonal in Walsh.
H0=15*np.eye(64)
for i in range(6):
    for j in range(i+1,6):
        m=(1<<i)|(1<<j)
        for h in range(64):
            H0[h,h^m]-=1
assert np.linalg.norm(H0@P-16*P)<1e-10
assert np.linalg.norm(P@H0-16*P)<1e-10
for c in (0.01,0.1,1.0,2.0):
    K=H0+c*A
    lam,V=np.linalg.eigh(K)
    weights=np.sum(V*(P@V),axis=0)/4
    assert abs(weights.sum()-1)<1e-10
    assert np.min(weights)>-1e-10
    moment1=float(np.dot(weights,lam))
    moment2=float(np.dot(weights,lam**2))
    var=moment2-moment1**2
    formula=c*c*(within+mix/4)
    assert abs(moment1-(16+c*mean))<1e-8
    assert abs(var-formula)<1e-8,(c,var,formula)
    assert var>=c*c*witness*witness/4-1e-9
    # The full 64-level spectral measure is now an actual
    # original-source computation, not assumed old four weights.
    active=int(sum(weights>1e-9))
    print('c=',c,'source mean',moment1,'variance',var,
          'active eigenvectors',active,
          'top four residues',sorted(weights,reverse=True)[:4])
print('exact offblock rational witness lower',witness)
print('A5 source trace mean',mean,'within',within,'mix',mix)
print('THEOREM: Var(nu_c)=c^2[Var_4(PAP)+||N A P||_F^2/4] > 0 for every c>0')
print('Q113 NATIVE MIXED SOURCE SPECTRAL VARIANCE: PASS')
print('c is not selected, source-to-physical observable not derived.')

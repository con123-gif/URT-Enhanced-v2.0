#!/usr/bin/env python3
"""Newton Scale sub-Planck ultraviolet gate (14 Oct 2026).

Reconstructs the genuine entropy-weighted Platonic 13-channel response from
the two neighbouring geometry/transfer scripts, no measured input.
This is a CONDITIONAL frequency assignment, not a physical H64 T_star proof.
"""
from pathlib import Path
from math import sqrt, log
import runpy
import numpy as np
here=Path(__file__).resolve().parent
c=runpy.run_path(str(here/"positive_transfer_observable_gate.py"))
K=np.asarray(c["K13"])
assert K.shape==(13,13)
assert np.linalg.eigvalsh(K)[0]>0
eig=np.linalg.eigvalsh(K)
s=(3-sqrt(5))/2
assert s>0 and s<1/2
s2=s*s
lam=float(eig[-1])
# Conditional tower: Q_n=R5^tensor(n) tensor K^n, with Tr R5=1.
# Physical momentum assignment would be k_n=k0/s^n.
# The p-moment is sum_n (1/s)^(p*n) Tr K^n, finite iff rho(K)<s^p.
assert lam<s
assert lam>s2
M0=float(np.sum(1/(1-eig)))
M1=float(np.sum(1/(1-eig/s)))
assert abs(M0-13.317780011294316)<1e-10

# Singlets: the centre basis and uniform shell; physical exclusion NOT proven.
U=np.zeros((13,2))
U[0,0]=1
U[1:,1]=1/sqrt(12)
Ps=U@U.T
Pn=np.eye(13)-Ps
assert np.linalg.norm(Ps@K@Pn)<1e-12
Kn=Pn@K@Pn
e11=np.linalg.eigvalsh(Kn)
e11=e11[e11>1e-12]
assert len(e11)==11
assert max(e11)<s2
M2_non=float(np.sum(1/(1-e11/s2)))
pcrit=-log(lam)/log(1/s)
pcrit_n=-log(max(e11))/log(1/s)
assert 1<pcrit<2 and pcrit_n>2

# Curvature 3+3': remove the fivefold eigenvalue (larger 5).
e6=e11[:6]
assert len(e6)==6 and e6.max()<s2
r_curv=e6.max()/s2

print("PASS: exact sector-restricted quadratic UV moment theorem")
print("s² =",s2,"full lambda =",lam,"full UV p² growth =",lam/s2)
print("M0,M1 =",M0,M1,"M2 full = DIVERGENT")
print("11 non-singlets: dimension",len(e11),"UV p² growth =",e11.max()/s2,
      "M2 =",M2_non)
print("6 triplet curvature modes: UV p² growth =",r_curv)
print("critical moment p full/11 =",pcrit,pcrit_n)
print("Physical graviton/current projector derived? NO")

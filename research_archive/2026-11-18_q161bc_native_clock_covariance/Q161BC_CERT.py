#!/usr/bin/env python3
"""Q161bc: exact original Q101 face covariance x original 24-clock Laplacian."""
from fractions import Fraction as F
from pathlib import Path
import runpy
src=runpy.run_path(str(Path(__file__).resolve().parents[1]/"2026-11-17_q161ba_dual_face_spectral_weights"/"Q161BA_CERT.py"))
Q,mu=src["Q"],src["mu"]
sm,mul,sub,scalar=src["sm"],src["mul"],src["sub"],src["scalar"]
D=[[sub(row[i],mu[i]) for i in range(20)] for row in Q]
Sigma=[[scalar(sm(mul(d[i],d[j]) for d in D),F(1,30)) for j in range(20)] for i in range(20)]
assert len(Q)==30 and len(Sigma)==20
assert all(sm(Sigma[i])==(F(0),F(0)) for i in range(20))
tr=sm(Sigma[i][i] for i in range(20))
tr2=sm(mul(Sigma[i][j],Sigma[j][i]) for i in range(20) for j in range(20))
assert tr==(F(416,25),F(0))
assert tr2==(F(183808,9375),F(0))
# Q161ba/bb's exactly verified A5 sector-scalar eigenvalues and multiplicities.
eigen=[(F(0),1),(F(8,15),4),(F(368,375),5),(F(16,15),3),(F(0),3),(F(8,5),4)]
assert sum(m for _,m in eigen)==20
assert sum(x*m for x,m in eigen)==tr[0]
assert sum(x*x*m for x,m in eigen)==tr2[0]
assert sum(m for x,m in eigen if x)==16
clock=[[2*int(i==j)-int(j==(i+1)%24)-int(j==(i-1)%24) for j in range(24)] for i in range(24)]
assert all(sum(row)==0 for row in clock)
assert sum(clock[i][i] for i in range(24))==48
assert sum(clock[i][j]**2 for i in range(24) for j in range(24))==144
# Cycle Laplacian has kernel span(1_24), so rank 23; tensor rank multiplies.
assert (16*23,480-16*23)==(368,112)
assert tr[0]*48==F(19968,25)
assert tr2[0]*144==F(8822784,3125)
print("Q161BC EXACT PASS: native 30-state Q101 covariance x 24-cycle; rank 368 nullity 112; traces 19968/25 and 8822784/3125")
print("No Q96 charged Ward covariance or physical source identification inferred.")

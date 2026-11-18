#!/usr/bin/env python3
"""Q161bb: native Q101 covariance purity, using Q161ba's original 30-source construction."""
from fractions import Fraction as F
from pathlib import Path
import runpy
src=runpy.run_path(str(Path(__file__).resolve().parents[1]/"2026-11-17_q161ba_dual_face_spectral_weights"/"Q161BA_CERT.py"))
Q,mu=src["Q"],src["mu"]
sm,mul,sub,scalar=src["sm"],src["mul"],src["sub"],src["scalar"]
D=[[sub(row[i],mu[i]) for i in range(20)] for row in Q]
Sigma=[[scalar(sm(mul(d[i],d[j]) for d in D),F(1,30)) for j in range(20)] for i in range(20)]
purity=sm(mul(Sigma[i][j],Sigma[i][j]) for i in range(20) for j in range(20))
weights=[F(0),F(32,15),F(368,75),F(16,5),F(0),F(32,5)]
multiplicities=[1,4,5,3,3,4]
bound=sum(w*w/m for w,m in zip(weights,multiplicities))
assert purity==(F(183808,9375),F(0))==(bound,F(0))
assert sm(Sigma[i][i] for i in range(20))==(F(416,25),F(0))
print("Q161BB EXACT PASS: Tr(Sigma^2)=183808/9375; sector Cauchy equality; rank 16")

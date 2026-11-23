#!/usr/bin/env python3
"""Frozen URT angle against native 24 cyclic-track character; no H64 proxy."""
from math import sqrt, pi, e
from cmath import exp
N=24
alpha=(3-sqrt(5))/2
# Exact proof: 24 alpha=12(3-sqrt5) is irrational, hence not integer.
# This prohibits a well-defined one-step U(1) character on Z/24.
assert abs(24*alpha-round(24*alpha))>1e-3
z=exp(2j*pi*alpha)
residual=abs(z**N-1)
# The original 24-track Fourier characters are exp(2pi i j n/24).
weights=[]
for j in range(N):
    ratio=exp(2j*pi*(alpha-j/N))
    weights.append(abs((1-ratio**N)/(N*(1-ratio)))**2)
assert abs(sum(weights)-1)<1e-12
assert max(weights)<0.999
assert pi/e>1
print("EXACT OBSTRUCTION: 24 alpha=12(3-sqrt(5)) irrational, not C24 character")
print("phase residual",residual,"max Fourier weight",max(weights),"leakage",1-max(weights))
print("radial pi/e",pi/e)

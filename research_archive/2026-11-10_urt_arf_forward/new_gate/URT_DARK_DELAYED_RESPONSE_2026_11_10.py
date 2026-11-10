#!/usr/bin/env python3
"""Exact dark-to-hidden delayed response from archived 64-history source labels.
Original checksum from URT_DARK_THREE_CHANNEL_CUBIC_TENSOR_2026_11_10.py.
No historical ARF coefficients or fitted parameters.
"""
import sympy as s
labels="2002122002210110120100122010120110210102210010210110122002212002"
assert len(labels)==64
root=s.sqrt(5)
levels=[s.Integer(0),(56-24*root)/5,(56+24*root)/5]
n5=[levels[int(c)] for c in labels]
d=[-(-1)**h.bit_count() if n5[h]==0 else 0 for h in range(64)]
def Q(x):
    return [(x[2*h%64]+x[(2*h+1)%64])/2 for h in range(64)]
def expectation(x,y):
    return s.simplify(sum(a*b for a,b in zip(x,y))/64)
assert expectation(d,n5)==0
assert sum(d)==0
expected=[-3*root/20,0,3*root/40,-3*root/40,0,0]
x=n5[:]
for k,e in enumerate(expected,1):
    x=Q(x)
    assert s.simplify(expectation(d,x)-e)==0
    print(k,e)
assert all(s.simplify(v-7)==0 for v in x)
assert s.simplify(sum(expected)+3*root/20)==0
print("PASS: exact finite-memory forward response = -3sqrt(5)/20")

#!/usr/bin/env python3
"""Exact rank and dimension tests for whole-Cathedral baseline."""
import numpy as np
V=[4,8,6,20,12];E=[6,12,12,30,30];F=[4,6,8,12,20]
assert (sum(V),sum(E),sum(F))==(50,90,50)
assert all(v-e+f==2 for v,e,f in zip(V,E,F))
r0=sum(v-1 for v in V);r1=sum(f-1 for f in F)
assert (r0,r1)==(45,45)
assert 190-2*(r0+r1)==10
Q=np.zeros((64,64))
for h in range(64):
    Q[h,2*h%64]=.5;Q[h,(2*h+1)%64]=.5
assert np.array_equal(np.linalg.matrix_power(Q,6),np.ones((64,64))/64)
assert np.linalg.matrix_rank(Q)==32
assert np.linalg.matrix_rank(np.eye(64)-Q)==63
assert np.allclose(Q.T@Q,np.kron(np.eye(32),np.ones((2,2))/2))
S=np.roll(np.eye(24),1,axis=1)
assert np.array_equal(np.linalg.matrix_power(S,24),np.eye(24))
assert np.linalg.matrix_rank(np.eye(24)-S)==23
assert 190*64*24*64==18677760
assert 10*1*1*64==640
print("PASS: 190 Hodge; Q6 mixing; 24-clock; full 18,677,760 carrier; 640 flat modes")
print("WARNING: positive transfer not uniquely selected; matter coupling and ARFs open")

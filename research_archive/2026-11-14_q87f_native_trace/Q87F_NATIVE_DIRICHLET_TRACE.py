#!/usr/bin/env python3
"""Q87F: exact trace and Gram determinant for original Q77 64-history bridge support."""
import sympy as S
T=S.symbols('t0:32',real=True)
B=S.zeros(64)
for x,t in enumerate(T):
 B[x,2*x]=t; B[x,2*x+1]=1-t
 B[x+32,2*x]=1-t; B[x+32,2*x+1]=t
A=(S.eye(64)-B).T*(S.eye(64)-B)
tr=S.expand(S.trace(A))
formula=64-2*(T[0]+T[31])+2*sum(t*t+(1-t)**2 for t in T)
assert S.expand(tr-formula)==0
G=B.T*B
for x,t in enumerate(T):
 block=G.extract([2*x,2*x+1],[2*x,2*x+1])
 assert S.expand(block.det()-(2*t-1)**2)==0
assert all(G[2*x,2*y]==0 and G[2*x,2*y+1]==0 for x in range(32) for y in range(32) if x!=y)
print('Q87F_EXACT_NATIVE_TRACE_AND_GRAM_PASS')
print('trace A = 64 - 2(t0+t31) + 2 sum_x[t_x^2+(1-t_x)^2]')
print('det(B^T B) = product_x (2t_x-1)^2')
print('trace bounds for 0<t_x<1/2: 94 < tr A < 128')

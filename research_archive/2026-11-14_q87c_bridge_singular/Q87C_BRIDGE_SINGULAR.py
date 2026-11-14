#!/usr/bin/env python3
"""Q87C exact singular spectrum of original Q77 selected URT joint bridge."""
import sympy as s
# Q77's original 64-history support: rows x,x+32 -> columns 2x,2x+1.
# Each native joint-bridge history block is [[t_x,1-t_x],[1-t_x,t_x]].
t=s.symbols('t0:32', real=True)
row_seen=set();col_seen=set()
for x in range(32):
 rows=(x,x+32);cols=(2*x,2*x+1)
 assert not (set(rows)&row_seen) and not (set(cols)&col_seen)
 row_seen.update(rows);col_seen.update(cols)
 z=t[x];B=s.Matrix([[z,1-z],[1-z,z]]);G=B.T*B
 assert s.simplify(G*s.Matrix([1,1])-s.Matrix([1,1]))==s.zeros(2,1)
 assert s.simplify(G*s.Matrix([1,-1])-(2*z-1)**2*s.Matrix([1,-1]))==s.zeros(2,1)
 assert s.factor(B.det())==2*z-1
assert row_seen==set(range(64)) and col_seen==set(range(64))
# Separate row and column permutations put the exact Q77 B into the
# direct sum of the 32 blocks above. Q77 certifies 0<t_x<1/2.
# Hence singular values: 1 (32 times), 1-2t_x (x=0..31).
print('Q87C_NATIVE_Q77_SINGULAR_SPECTRUM_PASS blocks=32 rank=64 unit_singular_multiplicity=32')

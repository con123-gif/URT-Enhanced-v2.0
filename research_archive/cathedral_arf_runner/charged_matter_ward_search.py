#!/usr/bin/env python3
"""Exact finite charged-matter source-to-observable Ward search.

Uses a symbolic two-sector H13⊕H51 block action, rather than equating
a history resolvent to a photon residue. Checks the entire determinant
and Schur Ward contacts for a gauge orbit. This is a structural theorem
for arbitrary blocks, not a selected physical action.
"""
import sympy as s,json
z,t,q=s.symbols("z t q",real=True)
a,b,c,d=s.symbols("a b c d",real=True)
# Two charged carrier basis vectors, one in H13 and one in H51.
# Nontrivial off-diagonal charged mixing is the smallest Ward-sensitive test.
H=s.Matrix([[a,b+s.I*c],[b-s.I*c,d]])
Q=s.diag(1,0)
U=s.diag(s.exp(s.I*q*t),1)
Ht=U*H*U.conjugate()
R=z*s.eye(2)-Ht
D=s.factor(R.det())
assert s.simplify(D-(z-a)*(z-d)-( -b*b-c*c))==0
# The second-order seagull is essential: d²H/dt²=-q²[Q,[Q,H]].
J=s.diff(Ht,t).subs(t,0)
W=s.diff(Ht,t,2).subs(t,0)
assert s.simplify(J-s.I*q*(Q*H-H*Q))==s.zeros(2)
assert s.simplify(W+q*q*(Q*(Q*H-H*Q)-(Q*H-H*Q)*Q))==s.zeros(2)
# Determinant and full effective action are gauge invariant.
assert s.simplify(s.diff(D,t))==0
assert s.simplify(s.diff(D,t,2))==0
# Schur-complement source plus hidden determinant reconstructs full action.
S=s.factor(R[0,0]-R[0,1]*R[1,0]/R[1,1])
assert s.simplify(S*R[1,1]-D)==0
assert s.simplify(s.diff(S,t))==0
assert s.simplify(s.diff(S,t,2))==0
# Independent Ward second-variation identity, with contact.
R0=R.subs(t,0);inv=R0.inv()
first=s.simplify(s.trace(inv*J))
second=s.simplify(s.trace(inv*W+inv*J*inv*J))
assert first==0 and second==0
# A physical current response is not fixed by the Ward identities:
# varying the mixing b changes the transverse susceptibility.
probe=s.Matrix([[0,1],[1,0]])
chi=s.factor(s.trace(inv*probe*inv*probe))
assert s.simplify(s.diff(chi,b))!=0
print(json.dumps({"status":"exact_pass","sector":"symbolic H13-H51 charged mixing","ward_current":str(first),"ward_second_contact_complete":str(second),"schur_determinant":str(D),"transverse_probe":str(chi),"nonuniqueness":"Ward identities do not fix charged mixing b or a physical pole residue","physical_ARFs":"not derived"},indent=2))

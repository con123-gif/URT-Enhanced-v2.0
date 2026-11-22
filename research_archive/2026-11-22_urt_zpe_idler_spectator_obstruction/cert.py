"""URT-ZPE: spectator-idler obstruction, 2026-11-22.
STATUS: exact channel theorem for declared JC coupling, NOT autonomous native joining.

For any purification |Psi>_SI of the two-cycle thermal signal rho_S,
and any U_SQ acting only on signal S and seam-qubit Q,
Tr_SI[(U_SQ tensor I_I)(|Psi><Psi| tensor |0><0|)
(U_SQ^dagger tensor I_I)] =
Tr_S[U_SQ(rho_S tensor |0><0|)U_SQ^dagger].
This identity is exact even if the true two-cycle purification has two fresh
idlers. Retaining idlers in the Hilbert space but not COUPLING to them
therefore cannot improve seam activation. For four independent signal/qubit
channels, the full-idler probability is the same product as the reduced model.
The two real charged-field polarizations are distinct independent modes;
the statement applies separately to each and does not halve pump accounting.

This does not rule out idler-coupled coherent operations or collective native
seam Hamiltonians. JC resonance is assumed, not selected by pi/phi/e.
The pump preparation cost is external; no vacuum work or gravity is claimed.
"""
import math
lam=0.439496360621 # archived two-cycle lambda = 1-alpha^-4
N=64
p=[(1-lam)*lam**n for n in range(N)]
assert abs(sum(p)-1)<1e-14
for t in (0.25,0.5,1.0,1.5,2.0):
    # Schmidt-purified full signal+idler state, evolved by U_SQ tensor I_idler
    full=sum(abs(complex(math.sqrt(p[n])*math.sin(t*math.sqrt(n))))**2 for n in range(1,N))
    reduced=sum(p[n]*math.sin(t*math.sqrt(n))**2 for n in range(1,N))
    assert abs(full-reduced)<1e-14
    print(f"gt={t:.2f} P_full_idlers={full:.12f} P_reduced={reduced:.12f}")
p1=sum(p[n]*math.sin(math.sqrt(n))**2 for n in range(1,N))
print(f"four_independent_gt1={p1**4:.12f}")
print(f"eight_independent_gt1={p1**8:.12f}")
print(f"tail={lam**N:.3e}")
assert lam**N<2e-23

"""URT-ZPE bounded obstruction: four/eight independent local JC thermal channels.
2026-11-22. CONDITIONAL NO-GO, not a no-go for coherent signal+idler access.
Native prior: research_archive/2026-11-22_urt_zpe_native_local_quantum_seam/
PHYSICAL_LOCAL_QUANTUM_TRANSFER.md and jc_test.py.
The SU(1,1) two-cycle signal marginal has p_n=(1-lambda)lambda^n,
lambda=1-(pi/e)^(-4). For one cold qubit and a time-independent resonant
Jaynes-Cummings Hamiltonian, P_exc(t)=sum_{n>=1}p_n sin²(gt sqrt(n))
<=sum_{n>=1}p_n=lambda. This is a true all-time bound even if g and t
are selected separately for each switch. Independent modes/switches imply
P(all N on)<=lambda^N. N=4 represents one mode per original seam;
N=8 is the stricter two-real-polarization interpretation only IF both
polarizations must each independently switch. No claim that native
two-polarization joining actually requires eight independent switches.
Idler coherence, shared reservoirs, collective operations, repeated
attempts or feedback are OUTSIDE the theorem and may defeat this bound.
This is a tested limitation of the previously proposed passive signal
JC architecture, NOT a fundamental obstruction to autonomous URT.
"""
import math
phi=(1+math.sqrt(5))/2
alpha=math.pi/math.e
lam=1-alpha**-4
assert abs(phi**2-phi-1)<1e-14
assert abs(lam-0.4394963606211483)<1e-12
K=80
weights=[(1-lam)*lam**n for n in range(K)]
assert abs(sum(weights)-1)<1e-12
for N in (4,8):
    print("N",N,"success_upper",format(lam**N,'.12f'),"failure_lower",format(1-lam**N,'.12f'))
for t in (0.1,1,2,5,10):
    p=sum(weights[n]*math.sin(t*math.sqrt(n))**2 for n in range(1,K))
    assert 0<=p<=lam+1e-13
    print("gt",t,"single",format(p,'.12f'),"four",format(p**4,'.12f'),"eight",format(p**8,'.12f'))
print("PASS conditional independent-JC bound; no full native seam simulation")

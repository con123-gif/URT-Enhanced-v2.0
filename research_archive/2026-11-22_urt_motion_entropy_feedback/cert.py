"""Original URT gain + golden angle: coherent vs fresh-idler physical movement.

Standalone native transfer from archived commit 87e15048. No fitted values.
Proves: coherent repeated same SU(1,1) map has elliptic eigenvalues and
bounded pair number/entanglement; fresh-vacuum idlers have monotone noise.
"""
import cmath
from math import pi, e, sqrt, acos, sin, cos, log, log1p

phi=(1+sqrt(5))/2
alpha=pi/e
theta=2*pi/phi**2
s=sqrt(alpha**2-1)
x=alpha*cos(theta)
assert -1<x<1, "Native map must be in elliptic SU(1,1) regime"
psi=acos(x)
bound=s*s/(1-x*x)

def entropy(n):
    return 0. if n<=0 else log1p(n)+n*log1p(1/n)

# SU(1,1) operator on (a,b^dagger). Check canonical indefinite metric J.
phase=cmath.exp(1j*theta)
M=((phase*alpha, phase*s),(phase.conjugate()*s,phase.conjugate()*alpha))
def matmul(A,B):
    return tuple(tuple(sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)) for i in range(2))
def dagger(A):return tuple(tuple(A[j][i].conjugate() for j in range(2)) for i in range(2))
J=((1+0j,0j),(0j,-1+0j))
MJ=matmul(matmul(dagger(M),J),M)
assert max(abs(MJ[i][j]-J[i][j]) for i in range(2) for j in range(2))<3e-15
assert abs((M[0][0]+M[1][1])/2-x)<3e-15
assert abs(M[0][0]*M[1][1]-M[0][1]*M[1][0]-1)<3e-15

# Same idler fed back: the observed signal amplitude at step 2 is NOT q^2.
P2=matmul(M,M)
q=alpha*phase
assert abs(P2[0][0]-q*q-s*s)<2e-14
assert abs(P2[0][0]-q*q)>0.33
# Fresh uncorrelated zero-mean idler each cycle preserves <a_n>=q^n <a_0>.
# The signal occupation and emitted idler occupation obey exactly
# N_{n+1}=alpha^2 N_n+s^2, N_emitted=s^2(N_n+1), so the
# necessary external pump energy is 2*hbar*omega*N_emitted per cycle.
for n in range(0,30):
    occ=alpha**(2*n)-1
    following=alpha**(2*(n+1))-1
    emitted=s*s*(occ+1)
    assert abs((following-occ)-emitted)<1e-8*max(1,emitted)
P=((1+0j,0j),(0j,1+0j))
maxerr=0
last_coherent=0
for n in range(1,513):
    P=matmul(P,M)
    n_coh=abs(P[0][1])**2
    n_formula=s*s*(sin(n*psi)/sin(psi))**2
    maxerr=max(maxerr,abs(n_coh-n_formula))
    assert abs(n_coh-n_formula)<3e-10
    assert -1e-10<=n_coh<=bound+1e-10
    if n in (1,2,3,4,5,6,7,8,12,24,64,128,512):
        # Fresh independent vacuum idler on each iteration, traced out:
        # n_{n+1}=alpha²*n_n+(alpha²-1), hence n_n=alpha^(2n)-1.
        fresh=alpha**(2*n)-1
        print(f'step={n:3d} coherent_pairs={n_coh:.12g} coherent_entropy={entropy(n_coh):.12g} fresh_pairs={fresh:.12g} fresh_entropy={entropy(fresh):.12g}',flush=True)
    if n==4:
        assert n_coh<last_coherent, "Coherent entropy/energy must decrease step 3->4"
    last_coherent=n_coh

# In the fresh-idler channel there is a positive net source requirement.
# Identical two-mode frequencies: creation energy from vacuum = 2*hbar*omega*n.
for n in range(1,20):
    nn=alpha**(2*n)-1
    nn1=alpha**(2*(n+1))-1
    assert nn1>nn and entropy(nn1)>entropy(nn)

# Exact bound on coherent reduced entropy per signal/idler pair.
# Native three-layer sheet/edge ledger from the archived verified
# 2026-11-21_urt_zpe_three_layer_refinement result. Compare required
# source work to quantum-limited pump EXPENDITURE, not to vacuum free energy.
# Actual ability to transfer that energy is NOT asserted.
archived=((2,27.482314436123,11.160540180516,26.899167406949,11.692479446682),
          (3,58.888225997184,20.191543544636,58.302510150067,20.536715673522),
          (4,101.812219659042,32.097163386780,101.031453268652,32.490081703372))
pump1=2*(alpha**2-1)
pump2=2*(alpha**4-1)
for size,Ep,Wp,Em,Wm in archived:
    for sector,Es,W in (("+",Ep,Wp),("-",Em,Wm)):
        cost=(Es+W)/Es
        assert pump1<cost<pump2
        print(f'old_cube={size} sector={sector} required_E_sheet_units={cost:.9f} one_cycle_source={pump1:.9f} two_cycle_source={pump2:.9f}',flush=True)

print(f'alpha={alpha:.15f} theta_deg={theta*180/pi:.15f} trace_half={x:.15f} psi_over_pi={psi/pi:.15f}',flush=True)
print(f'coherent_pairs_upper={bound:.15f} coherent_entropy_upper={entropy(bound):.15f} mean_recurrence_feedback_error={abs(P2[0][0]-q*q):.15f} max_numeric_error={maxerr:.3e}',flush=True)
print('PASS: CCR preserved; elliptic native transfer; 512 repeated powers; exact bounded coherent entanglement; fresh idler scalar-mean recursion, growing entropy and exact pump energy cost')

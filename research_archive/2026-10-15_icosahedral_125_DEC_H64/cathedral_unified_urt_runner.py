"""Integrated finite Newton's Cathedral x URT experiment, 2026-10-15.

Run beside archived Oct 15 modules:
    python cathedral_unified_urt_runner.py
Requires numpy and sympy. This is a constructed compatible CPTP channel,
NOT a derivation of the microscopic physical Cathedral transfer T_star.
"""
import numpy as np
from numpy.linalg import norm, eigvalsh, svd
from cathedral_operator_audit import geometry,dirac_64,PHI,DELTA,CHI
from cathedral_strict_64_closure import full_hidden_lift,icosahedron,bases,species_data,dressed_64,exact_24
from cathedral_entanglement_spin2_exact import P_v5,P_even,P_odd,W,C
from cathedral_125_circumcentric_audit import actual_rayleigh,log_gap_susceptibility

v,edges,faces,ds,C0=geometry()
d0,d1,d2,d3=ds; L=d1@d1.T; D64=dirac_64(ds)
T=D64@D64/20
assert eigvalsh(T).min()>0 and eigvalsh(T).max()<1+1e-12
_,lift_error,hidden_eigs,*_=full_hidden_lift(faces,ds,C0)
assert lift_error<1e-12 and np.allclose(hidden_eigs,[4]*4+[6]*4)
P=np.array(P_v5,float); Pe=np.array(P_even,float); Po=np.array(P_odd,float)
Wn=np.array(W,float); Cn=np.array(C,float)
J5=Cn@P/np.sqrt(3)
assert norm(J5.T@J5-P)<1e-12
assert norm((d2.T@d2)@J5-2*J5)<1e-12
assert norm(Wn@Wn+15*(Pe+Po))<1e-12

def basis(P,n):
    vals,U=np.linalg.eigh(P)
    assert int(sum(vals>.5))==n
    return U[:,vals>.5

Ue,Uo=basis(Pe,4),basis(Po,4)
def phi5(x):
    return Ue.T@(Pe@np.diag(Cn@(P@x))@Wn@Po/np.sqrt(5))@Uo

x=P[:,0].copy();x/=norm(x);x*=3/5
y=P[:,1].copy();y/=norm(y);y*=4/5
z0=phi5(x)+1j*phi5(y)
assert abs(norm(z0)**2-1)<1e-11
a=1/(4*(1+DELTA**2));b=DELTA**2*a
sigma=np.diag([a]*4+[b]*4)
epsilon=2e-4     # initial perturbation scale, checked for positivity
assert epsilon*norm(z0,2)<np.sqrt(2*a*b)
X=np.block([[np.zeros((4,4),complex),z0/np.sqrt(2)],
            [z0.conj().T/np.sqrt(2),np.zeros((4,4),complex)]])
rho=sigma+epsilon*X
assert eigvalsh(rho).min()>0

def entropy(r):
    ev=eigvalsh(r)
    return -float(ev@np.log(ev))

# This entropy-difference formula is exact only for the off-block orbit with
# constant modular expectation Tr(rho K_star).
def relative(r):
    return entropy(sigma)-entropy(r)

kappa=np.pi/np.e; theta=2*np.pi/PHI**2
lam=kappa/2                # proposed URT spiral followed by fiveplet selection
assert 0<lam<1
R=np.array([[np.cos(theta),-np.sin(theta)],
            [np.sin(theta),np.cos(theta)]])
S=np.block([[kappa*R,np.zeros((2,2))],[np.zeros((2,2)),R/kappa]])
J=np.block([[np.zeros((2,2)),np.eye(2)],[-np.eye(2),np.zeros((2,2))]])
assert norm(S.T@J@S-J)<1e-12  # canonical URT symplectic lift separate
U=np.diag([np.exp(1j*theta/2)]*4+[np.exp(-1j*theta/2)]*4)
assert norm(U@sigma@U.conj().T-sigma)<1e-12

def channel(r):
    # CPTP because it is a convex mixture of a reference-preserving
    # unitary channel and the constant Gibbs-state preparation channel.
    return lam*(U@r@U.conj().T)+(1-lam)*sigma*np.trace(r)

sequence=[]
for n in range(13):
    d=relative(rho)
    assert eigvalsh(rho).min()>0
    assert norm(rho[:4,4:]-(epsilon/np.sqrt(2))*lam**n*np.exp(1j*n*theta)*z0)<1e-12
    sequence.append((n,kappa**n,lam**n,d,entropy(rho)))
    rho=channel(rho)
assert all(sequence[k+1][3]<=sequence[k][3]+1e-13 for k in range(12))
assert all(sequence[k+1][4]>=sequence[k][4]-1e-13 for k in range(12))

# Independent physical-geometry probability experiment: normalized 12-shell
# transfer A=(L_ico+11^T)/12 contracts the pure icosahedral fiveplet by 1/2.
A=(L+np.ones((12,12)))/12
assert norm(A@P-.5*P)<1e-12
q=P[:,0].copy();q/=norm(q)
p=np.ones(12)/12+.04*q
vhat=v/norm(v,axis=1)[:,None]
STF=np.einsum('vi,vj->vij',vhat,vhat)-np.eye(3)[None,:,:]/3
quadrupole0=norm(np.tensordot(p,STF,axes=(0,0)))**2
shell=[]
for n in range(13):
    H=-p@np.log(p)
    Q=norm(np.tensordot(p,STF,axes=(0,0)))**2/quadrupole0
    assert abs(Q-4**(-n))<1e-9
    shell.append((float(H),float(Q)))
    p=A@p
assert all(shell[i+1][0]>=shell[i][0]-1e-13 for i in range(12))

# Late microscopic gate: contraction is LOCAL because the saved piecewise
# sin/sign extension is discontinuous at +/-pi, although the central strip
# is forward-invariant for |u|<=1 and the tested trajectory stays inside it.
alpha=np.sqrt(4/3);beta=1/4;th=12/5
lip=beta*alpha*(1+th)
box_bound=beta*(alpha*(np.pi+th)+1)
assert lip<1 and box_bound<np.pi
jump=-beta*alpha*th
gate=lambda z: np.where(abs(z)<=np.pi,np.sin(z),np.sign(z))
state=np.zeros(13); drive=np.r_[0,q]
for n in range(32):
    state=beta*(alpha*(state-th*gate(state))+np.cos(n*theta)*drive)
assert norm(state,np.inf)<np.pi

# Dressed coarse 64 cell: an explicit species candidate, not the previously
# recovered six-bit history operator and not a derived SM mass identification.
vv,vc,ed,fa,ds2,c2=icosahedron()
U0,U1,U2,U3=bases(vv,vc,fa,ds2[1],ds2[2])
charges,Sbridge,assembleY=species_data()
roots={}
for name,charge in charges.items():
    Y=assembleY(charge)
    dressed=dressed_64(D64,U1,U2,Y)
    D24,K=exact_24(Y)
    V24=np.zeros((64,24))
    V24[1:13,:6]=U0;V24[13:43,6:12]=U1
    V24[13:43,12:18]=U2;V24[43:63,18:24]=U3
    assert norm(V24.T@dressed@V24-D24)<1e-11
    roots[name]=np.sort(svd(K,compute_uv=False))[:3]

print("PASS: integrated finite Cathedral × URT experiment")
print("URT scale, angle:",kappa,theta,"symplectic residual:",norm(S.T@J@S-J))
print("selected amplitude and quadratic ratios:",lam,lam**2)
print("hidden full-tetrahedral eigenvalues:",hidden_eigs,"lift residual:",lift_error)
print("circumcentric candidate Rayleigh-gap area slope:",log_gap_susceptibility(actual_rayleigh))
print("chi35 and reference entropy:",CHI,entropy(sigma))
print("step, raw URT, selected amplitude, relative entropy, S(quantum), H(shell), quadrupole power relative")
for n in (0,1,2,4,8,12):
    print(n,*sequence[n][1:],*shell[n])
print("micro-selector local Lipschitz:",lip,"invariant bound:",box_bound,"jump at pi:",jump)
print("dressed H64 candidate smallest three roots:",roots)
print("species bridge singular values:",svd(Sbridge,compute_uv=False))
print("NOT DERIVED: Einstein equations, Newton G, physical gauge forces, CKM/PMNS, planetary entanglement.")

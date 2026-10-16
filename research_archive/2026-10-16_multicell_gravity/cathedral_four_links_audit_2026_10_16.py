"""Full 30-edge Hodge, orientation parity, native curl and BKM/FDT audit.

NumPy, SciPy. The operator identities are exact in the given complex;
the OU stochastic bath, rate and background reservoir are explicitly assumed.
Requires the Oct-15 cathedral_operator_audit.py from sibling archive.
"""
from pathlib import Path
import json,sys
import numpy as np
from scipy.linalg import solve_continuous_lyapunov
HERE=Path(__file__).resolve().parent
SRC=HERE.parent/"2026-10-15_icosahedral_125_DEC_H64"
if not (HERE/"cathedral_operator_audit.py").exists() and SRC.exists():
    sys.path.insert(0,str(SRC))
from cathedral_operator_audit import geometry,DELTA,CHI

v,edges,faces,(_,ev,ef,_),C=geometry()
d0=ev.T; d1=ef.T
L0=d0.T@d0; Lf=d1@d1.T; L1=d0@d0.T+d1.T@d1
assert np.linalg.norm(d1@d0)<1e-12
P5=-(L0@(L0@L0-10*L0+20*np.eye(12)))/24
J5=C@P5/np.sqrt(3)
V,vec=np.linalg.eigh(P5)
U=vec[:,V>.5];Uf=J5@U
E=d0@U/np.sqrt(6); B=d1.T@Uf/np.sqrt(2)
assert E.shape==(30,5) and B.shape==(30,5)
checks={
 "exact_isometry":np.linalg.norm(E.T@E-np.eye(5)),
 "coexact_isometry":np.linalg.norm(B.T@B-np.eye(5)),
 "exact_coexact_orthogonality":np.linalg.norm(E.T@B),
 "exact_eigen6":np.linalg.norm(L1@E-6*E),
 "coexact_eigen2":np.linalg.norm(L1@B-2*B),
 "curl_of_gradient":np.linalg.norm(d1@E),
 "divergence_of_coexact":np.linalg.norm(d0.T@B)}
assert max(checks.values())<1e-10
assert np.linalg.matrix_rank(d0)==11 and np.linalg.matrix_rank(d1)==19

# Signed antipodal cochain maps differ from unsigned face permutation.
opp={i:int(np.argmin(np.linalg.norm(v+v[i],axis=1))) for i in range(12)}
Pv=np.zeros((12,12))
for i,j in opp.items():Pv[j,i]=1
edgeids={pair:i for i,pair in enumerate(edges)}
Pedge=np.zeros((30,30))
for col,(i,j) in enumerate(edges):
    a,b=opp[i],opp[j]
    Pedge[edgeids[tuple(sorted((a,b)))],col]=1 if a<b else -1
faceids={frozenset(face):i for i,face in enumerate(faces)}
Pface=np.zeros((20,20))
for col,face in enumerate(faces):
    row=faceids[frozenset(opp[i] for i in face)]
    Pface[row,col]=-1
assert np.linalg.norm(d0@Pv-Pedge@d0)<1e-12
assert np.linalg.norm(d1@Pedge-Pface@d1)<1e-12
assert np.linalg.norm(Pv@U-U)<1e-12
assert np.linalg.norm(Pface@Uf+Uf)<1e-12
assert np.linalg.norm(Pface@J5-J5@Pv)>4

# Intrinsic edge Hodge-duality complex structure is NOT the native curl.
Ek=d0@P5/np.sqrt(6);Bk=d1.T@J5/np.sqrt(2)
H=Bk@Ek.T-Ek@Bk.T
P10=Ek@Ek.T+Bk@Bk.T
assert np.linalg.norm(H.T+H)<1e-12
assert np.linalg.norm(H@H+P10)<1e-12
assert abs(np.trace(P10)-10)<1e-12
assert np.linalg.norm(Pedge@H+H@Pedge)<1e-12

# A separate native Maxwell-like curl wave couples coexact edges and faces.
curlwave=np.block([[np.zeros((30,30)),d1.T],[-d1,np.zeros((20,20))]])
Twave=np.block([[Bk,np.zeros((30,12))],
                [np.zeros((20,12)),J5]])
target=np.block([[np.zeros((12,12)),np.sqrt(2)*P5],
                 [-np.sqrt(2)*P5,np.zeros((12,12))]])
assert np.linalg.norm(Twave.T@curlwave@Twave-target)<1e-11
assert np.linalg.norm(curlwave@Twave-Twave@target)<1e-11

# Quantum Gibbs state: a directly additive Gaussian with variance 1/chi
# would violate positivity, even though the conditional OU law is valid.
a=1/(4*(1+DELTA**2));b=DELTA**2*a
p5=4*b
max_singular=np.sqrt(2*a*b)
required_floor=10/CHI
necessary_density_limit=8*a*b
assert required_floor>necessary_density_limit
sigma=np.eye(10)/CHI
D=np.diag([6.]*5+[2.]*5)
R=np.block([[np.zeros((5,5)),-np.eye(5)],
            [np.eye(5),np.zeros((5,5))]])
gamma=1.;omega=2*np.pi/((1+np.sqrt(5))/2)**2
A=omega*R-gamma*D
noise=2*gamma/CHI*D
cov=solve_continuous_lyapunov(A,-noise)
assert np.linalg.norm(cov-sigma)<1e-11
covhalf=solve_continuous_lyapunov(A,-noise/2)
assert np.linalg.norm(covhalf-sigma/2)<1e-11

# An independent bounded two-state detailed-balance process reproduces
# the master-state exhaust variance but has an undetermined absolute clock.
rate=1.
Q=np.array([[-rate*p5,rate*p5],
            [rate*(1-p5),-rate*(1-p5)]])
stationary=np.array([1-p5,p5])
assert np.linalg.norm(stationary@Q)<1e-15
assert np.linalg.norm(stationary@(7*Q))<1e-15

# Reservoir energy is introduced by definition, not through a zero-mode
# Laplacian coupling (L0 annihilates the constant vector).
q=np.arange(10)/10.
dF=CHI*q@(A@q)
diss=-CHI*gamma*q@(D@q)
assert abs(dF-diss)<1e-11
assert np.linalg.norm(L0@np.ones(12))<1e-12

result={
 "status":"finite exact incidence and conditional stochastic dissipative models",
 "checks":{k:float(x) for k,x in checks.items()},
 "edge_Hodge":{"exact_rank":11,"coexact_rank":19,"harmonic_rank":0},
 "intrinsic_edge_complex_structure_rank":int(round(np.trace(P10))),
 "native_curl_wave_frequency":float(np.sqrt(2)),
 "oriented_face_parity":"odd; vertex STF fiveplet even",
 "BKM":{"chi":float(CHI),"exhaust_variance":float(p5*(1-p5)),
        "density_max_offblock_singular_value":float(max_singular),
        "density_necessary_q2_cap":float(necessary_density_limit)},
 "OU_conditional":{"total_variance":float(required_floor),
     "covariance_residual":float(np.linalg.norm(cov-sigma)),
     "density_floor_over_cap":float(required_floor/necessary_density_limit)},
 "reservoir_conditional":{"dFdt":float(dF),"needed_bg_transfer":float(-dF)},
 "physical_gravity_derived":False
}
(HERE/"cathedral_four_links_results_reproduced.json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps(result,indent=2))
print("PASS: 30-edge Hodge, parity, native curl and conditional FDT audit.")

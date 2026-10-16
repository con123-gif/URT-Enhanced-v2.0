"""Newton's Cathedral: exact 64-cell / hidden-loop / center-4 / orbit audit.
Run from this folder:
    python center4_unified_audit.py
    python center4_unified_audit.py --exact
Dependencies: numpy, scipy; sympy only for --exact charpoly check.
No files are written. This extends the Oct15 canonical 64-state geometry.
No fitted physical data or couplings.
"""
from pathlib import Path
import sys,json
from math import sqrt
import numpy as np
from scipy.linalg import expm

HERE=Path(__file__).resolve().parent
SIBLING=HERE.parent/"2026-10-15_icosahedral_125_DEC_H64"
sys.path.insert(0,str(SIBLING))
from cathedral_operator_audit import geometry,dirac_64,CHI,DELTA

v,edges,faces,ds,C=geometry()
grad=ds[1].T
curl=ds[2].T
L0=grad.T@grad
L2=curl@curl.T
L1=grad@grad.T+curl.T@curl
assert (len(v),len(edges),len(faces))==(12,30,20)
assert np.linalg.norm(curl@grad)<1e-12
assert [np.linalg.matrix_rank(x) for x in ds]==[1,11,19,1]
assert np.linalg.norm(C.T@C-15*np.eye(12)+2*L0)<1e-12
assert abs(np.trace(grad@grad.T)-60)<1e-12
assert abs(np.trace(curl.T@curl)-60)<1e-12

Q64=dirac_64(ds)
positive=[(12,1),(20,1),(5-sqrt(5),3),(6,5),(5+sqrt(5),3),
          (3-sqrt(5),3),(2,5),(3,4),(5,4),(3+sqrt(5),3)]
target=np.sort([sign*sqrt(value) for value,m in positive
                for sign in (-1,1) for _ in range(m)])
spec_err=float(np.max(abs(np.linalg.eigvalsh(Q64)-target)))
assert spec_err<1e-12
assert np.min(abs(target))>0

def projector(M,value,rank):
    lam,U=np.linalg.eigh(M)
    V=U[:,abs(lam-value)<1e-9]
    assert V.shape[1]==rank
    return V@V.T

H3=projector(L2,3,4)
H5=projector(L2,5,4)
K3=curl.T@H3/sqrt(3)
K5=curl.T@H5/sqrt(5)
checks={
    "hidden3_isometry":np.linalg.norm(K3.T@K3-H3),
    "hidden5_isometry":np.linalg.norm(K5.T@K5-H5),
    "hidden_orthogonality":np.linalg.norm(K3.T@K5),
    "hidden3_divergence":np.linalg.norm(grad.T@K3),
    "hidden5_divergence":np.linalg.norm(grad.T@K5),
    "hidden3_edge_eigen3":np.linalg.norm(L1@K3-3*K3),
    "hidden5_edge_eigen5":np.linalg.norm(L1@K5-5*K5),
    "hidden3_vertex_dark_linear":np.linalg.norm(C.T@H3),
    "hidden5_vertex_dark_linear":np.linalg.norm(C.T@H5)}
assert max(checks.values())<1e-12
curl3=float(np.linalg.norm(curl@K3))
curl5=float(np.linalg.norm(curl@K5))
assert abs(curl3-sqrt(12))<1e-12
assert abs(curl5-sqrt(20))<1e-12

sectors=[]
for name,lv,lf,n in (("3",5-sqrt(5),3-sqrt(5),3),
                     ("5",6,2,5),("3prime",5+sqrt(5),3+sqrt(5),3)):
    Pv=projector(L0,lv,n)
    J=C@Pv/sqrt(15-2*lv)
    err=float(np.linalg.norm(J.T@J-Pv))
    intertwine=float(np.linalg.norm(L2@J-lf*J))
    assert max(err,intertwine)<1e-12
    A=np.array([[-lv,-1.5],[1.5,-lf]])  # illustrative Gamma=1, omega=1.5
    ev=np.linalg.eigvals(A)
    sectors.append(dict(irrep=name,dimension=n,vertex=lv,face=lf,
        damping_center=(lv+lf)/2,critical_half_gap=(lv-lf)/2,
        isometry_error=err,intertwine_error=intertwine,
        example_eigenvalues=[[float(z.real),float(z.imag)] for z in ev]))

# A 32+32 split of Hermitian 8x8 operators is an algebraic block splitting.
# Stabilizer directions have zero *unitary-orbit derivative*, not zero BKM
# metric on arbitrary nonzero quantum density perturbations.
a=1/(4*(1+DELTA**2))
b=DELTA**2*a
rho=np.diag([a]*4+[b]*4)
rng=np.random.default_rng(20261016)
X=rng.normal(size=(4,4))+1j*rng.normal(size=(4,4))
H4=(X+X.conj().T)/2
Gdiag=np.zeros((8,8),complex)
Gdiag[:4,:4]=H4
Gdiag[4:,4:]=H4
Z=rng.normal(size=(4,4))+1j*rng.normal(size=(4,4))
Goff=np.block([[np.zeros((4,4)),Z],
               [Z.conj().T,np.zeros((4,4))]])
assert np.linalg.norm(Gdiag@rho-rho@Gdiag)<1e-12
assert np.linalg.norm(Goff@rho-rho@Goff)>1e-4
# Metric coefficient on normalized offdiag GENERATOR orbit is not chi alone.
orbit_coefficient=float(CHI*(a-b)**2)

# Explicit non-Abelian lattice link gauge covariance: an additional
# connection choice. This check does not prove a physical gauge coupling.
def block_unitary(scale):
    H=np.zeros((8,8),complex)
    for sl in (slice(0,4),slice(4,8)):
        X=rng.normal(size=(4,4))+1j*rng.normal(size=(4,4))
        H[sl,sl]=(X+X.conj().T)/2
    return expm(1j*scale*H)
g=[block_unitary(.1) for _ in range(12)]
links={e:block_unitary(.2) for e in edges}
def U(i,j,transformed=False):
    m=links[tuple(sorted((i,j)))]
    if i>j:m=m.conj().T
    return g[i]@m@g[j].conj().T if transformed else m
i,j,k=faces[0]
Wilson=U(i,j)@U(j,k)@U(k,i)
Wilson_g=U(i,j,True)@U(j,k,True)@U(k,i,True)
wilson_error=float(np.linalg.norm(Wilson_g-g[i]@Wilson@g[i].conj().T))
assert wilson_error<1e-12

result={
 "exact_augmented_chain_ranks":[1,11,19,1],
 "64_dirac_zero_modes":0,
 "64_dirac_spectrum_residual":spec_err,
 "edge_exact_coexact_harmonic_dimensions":[11,19,0],
 "edge_trace_split":[60,60],
 "hidden_checks":{key:float(val) for key,val in checks.items()},
 "hidden_curl_norms":[curl3,curl5],
 "intertwiners":sectors,
 "state_stabilizer":{"block_diagonal_real_dim":32,
     "offdiagonal_real_dim":32,"BKM_density_tangent_chi":float(CHI),
     "BKM_unitary_generator_coefficient":orbit_coefficient},
 "Wilson_gauge_covariance_error":wilson_error,
 "example_oscillator":{"Gamma":1.0,"omega":1.5,"chosen_not_derived":True},
 "physical_Yang_Mills_massless_proved":False,
 "physical_Newton_constant_derived":False,
}
if "--exact" in sys.argv:
    import sympy as sp
    x=sp.Symbol("x")
    exact=sp.Matrix(np.rint(Q64).astype(int)).charpoly(x).as_expr()
    poly=(x*x-12)*(x*x-20)*(x**4-10*x*x+20)**3*(
        x**4-6*x*x+4)**3*(x*x-6)**5*(x*x-2)**5*(
        x*x-3)**4*(x*x-5)**4
    assert sp.expand(exact-poly)==0
    result["exact_integer_charpoly_verified"]=True
print(json.dumps(result,indent=2))

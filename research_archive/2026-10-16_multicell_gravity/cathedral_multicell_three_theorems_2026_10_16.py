"""Three proposed Cathedral multi-cell theorems: independent reproducible audit.

Uses exact icosahedral coboundary matrices and a 3D screened-lattice FFT.
It does not claim a graviton theorem or physical Newton's constant.

Run from this folder: python cathedral_multicell_three_theorems_2026_10_16.py
Dependencies: NumPy and the Oct-15 sibling cathedral_operator_audit.py.
"""
from pathlib import Path
import sys
import json
import numpy as np
HERE=Path(__file__).resolve().parent
SIBLING=HERE.parent/"2026-10-15_icosahedral_125_DEC_H64"
if not (HERE/"cathedral_operator_audit.py").exists() and SIBLING.exists():
    sys.path.insert(0,str(SIBLING))
from cathedral_operator_audit import geometry,CHI

v,edges,faces,(_,boundary_v,boundary_f,_),C=geometry()
d0=boundary_v.T
d1=boundary_f.T
L=d0.T@d0
assert np.linalg.norm(d1@d0)<1e-11
eigen,U=np.linalg.eigh(L)
def eigenspace(value, multiplicity):
    V=U[:,abs(eigen-value)<1e-9]
    assert V.shape==(12,multiplicity)
    return V@V.T,V
P3,U3=eigenspace(5-np.sqrt(5),3)
P5,U5=eigenspace(6,5)
P3p,U3p=eigenspace(5+np.sqrt(5),3)
P0,U0=eigenspace(0,1)

# First proposed theorem fails as stated: dipole and fiveplet gradients
# are ORTHOGONAL; the quadrupole gradient is injective, rank 5.
ED=d0@U3/np.sqrt(5-np.sqrt(5))
EQ=d0@U5/np.sqrt(6)
edge_overlap=float(np.linalg.norm(ED.T@EQ))
assert edge_overlap<1e-11
assert np.linalg.matrix_rank(np.column_stack([ED,EQ]),tol=1e-10)==8
assert np.linalg.matrix_rank(d0@U5,tol=1e-10)==5

# Nevertheless STF(3) tensor contracted with a nonzero wavevector gives
# 3 transverse constraints and the usual algebraic two-dimensional kernel.
unit=v/np.linalg.norm(v,axis=1)[:,None]
directions=np.einsum("vi,vj->vij",unit,unit)-np.eye(3)[None,:,:]/3
STF=np.einsum("av,vij->aij",U5.T,directions)
def TT(tensor,k):
    P=np.eye(3)-np.outer(k,k)
    return P@tensor@P-.5*P*np.trace(P@tensor)
tt_errors=[]
for vec in ([1,0,0],[1,2,3],[-2,1,4]):
    k=np.asarray(vec,float);k/=np.linalg.norm(k)
    constraint=np.einsum("i,aij->ja",k,STF)
    assert np.linalg.matrix_rank(constraint,tol=1e-10)==3
    projected=np.array([TT(T,k) for T in STF])
    assert np.linalg.matrix_rank(projected.reshape(5,9),tol=1e-10)==2
    tt_errors.append(float(np.linalg.norm(np.einsum("i,aij->aj",k,projected))))
    tt_errors.append(float(np.linalg.norm(np.trace(projected,axis1=1,axis2=2))))
assert max(tt_errors)<1e-11

# Third theorem: ones matrix adds 12 ONLY to singlet, zero elsewhere.
M=(L+np.ones((12,12)))/20
transfer={
 "monopole":.6,"dipole":(5-np.sqrt(5))/20,
 "quadrupole":.3,"other_triplet":(5+np.sqrt(5))/20}
for name,P in (("monopole",P0),("dipole",P3),("quadrupole",P5),
               ("other_triplet",P3p)):
    assert np.linalg.norm(M@P-transfer[name]*P)<1e-11
expected=np.sort([.6]+[(5-np.sqrt(5))/20]*3+[.3]*5+
                 [(5+np.sqrt(5))/20]*3)
spec_error=float(np.linalg.norm(np.linalg.eigvalsh(M)-expected))
assert spec_error<1e-11
relative={k:float(x/.6) for k,x in transfer.items()}

# Second proposed theorem: local positive BKM term produces screening.
# A 3D cubic lattice is a test intercell network, NOT a derived icosahedral
# tiling. Ratio J/chi=16 is an explicit illustrative choice.
J=16*CHI
n=48
k=2*np.pi*np.fft.fftfreq(n)
a,b,c=np.meshgrid(k,k,k,indexing="ij")
Lk=2*(3-np.cos(a)-np.cos(b)-np.cos(c))
source=np.zeros((n,n,n));source[0,0,0]=1
G=np.fft.ifftn(np.fft.fftn(source)/(CHI+J*Lk)).real
res=np.fft.ifftn((CHI+J*Lk)*np.fft.fftn(G)).real-source
lattice_error=float(np.linalg.norm(res))
assert lattice_error<1e-11
scaled={str(r):float(r*G[r,0,0]) for r in (2,4,6,8,10)}
assert scaled["10"]<scaled["2"]
# Alternative protected massless intercell coupling would have symbol
# J*Lk with zero at k=0, requiring an independent symmetry/coupling proof.
assert abs(J*Lk[0,0,0])<1e-10

report={
 "date":"2026-10-16",
 "source":"cathedral_multicell_three_theorems_2026_10_16.py",
 "verified_with":"NumPy icosahedral DEC plus 48^3 periodic lattice FFT",
 "theorem_1":{"status":"dipole quotient invalid; k-transversality gives 2",
     "gradient_dipole_quadrupole_overlap":edge_overlap,
     "rank_quadrupole_gradient":5,"rank_combined_images":8,
     "TT_nullity":2,"TT_residual_max":max(tt_errors)},
 "theorem_2":{"status":"screened Yukawa, no G_N prediction",
     "chi":float(CHI),"illustrative_J_over_chi":16,
     "screening_length_cells":float(np.sqrt(J/CHI)),
     "fft_equation_residual":lattice_error,
     "r_times_G_axis":scaled,
     "continuum_denominator":"chi + J a^2 |k|^2",
     "continuum_green":"exp(-r/ell)/(4 pi J a^2 r), normalization depends on continuum dictionary",
     "massless_alternative":"shift-symmetric intercell-only J L, independently unproved"},
 "theorem_3":{"status":"corrected exact finite spectrum",
     "transfer_eigenvalues":transfer,"normalized_ratios":relative,
     "spectral_residual":spec_error,
     "quadrupole_power_decay":.25,
     "diffusive_5_over_dipole_rate":float(6/(5-np.sqrt(5)))},
 "physical_gravity_closed":False,
 "physical_newton_G_derived":False,
 "physical_source_map":False,
 "global_icosahedral_tiling":False
}
# A command-line output path prevents tests from rewriting tracked results.
# Default preserves the historical standalone script behavior.
import argparse
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument("--output",type=Path,
    default=HERE/"cathedral_multicell_three_theorems_results_2026_10_16.json")
args=parser.parse_args()
args.output.parent.mkdir(parents=True,exist_ok=True)
args.output.write_text(json.dumps(report,indent=2)+"\n")
print(json.dumps(report,indent=2))
print("PASS: checked all exact identities and screened-lattice counterexample.")

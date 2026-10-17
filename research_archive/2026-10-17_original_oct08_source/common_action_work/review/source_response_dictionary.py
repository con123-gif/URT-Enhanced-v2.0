"""Independent same-source Gaussian/transfer dictionary, using retained K5 geometry.

No fitted physical coefficient; positive numerical constants are algebra witnesses.
"""
from pathlib import Path
import hashlib
import json
import numpy as np
from numpy.linalg import norm
from scipy.integrate import quad

ROOT=Path(__file__).resolve().parents[2]
HERE=Path(__file__).resolve().parent
INPUT=ROOT/"response_join_work/normalization/compact_source_normalization_operators.npz"
with np.load(INPUT,allow_pickle=False) as archive:
    d0=archive["K5_vertex_edge_differential"]
    d1=archive["K5_edge_face_differential"]
    area=archive["face_constant_curvature_area_pullback"]
checks={}; evidence={}
def ck(name,condition,**data):
    checks[name]=bool(condition)
    evidence[name]=data
    if not condition:
        raise AssertionError(name)

ck("literal_K5_cochain",norm(d1@d0)<1e-13,
   vertex_gauge_rank=int(np.linalg.matrix_rank(d0)),
   physical_cycle_rank=int(np.linalg.matrix_rank(d1)))
w,V=np.linalg.eigh(d1.T@d1)
Q=V[:,w>1]
P=Q@Q.T
ck("physical_cycle_projector",norm(d1.T@d1-5*P)<1e-12)
ck("actual_area_cell_factor",norm(area.T@area-1.25*np.eye(6))<1e-13,
   note="Actual curvature area Gram=5/4; the retained root-cell volume is sqrt(5).")

# An arbitrary anisotropic positive witness on the ACTUAL gauge quotient.
Kq=np.diag(np.arange(2.,8.))
K=Q@Kq@Q.T
G=Q@np.linalg.inv(Kq)@Q.T
C=d1@G@d1.T
GammaF=np.linalg.pinv(C,rcond=1e-12)
ck("complete_face_Legendre_pullback_equals_link_kernel",
   norm(d1.T@GammaF@d1-K)<1e-12,
   source="All ten linear face fluxes, physical rank six.")
ck("face_covariance_and_inverse_live_on_image",
   norm(C@GammaF-d1@np.linalg.pinv(d1))<1e-12)

R=d1[:3]@Q
ck("compressed_three_face_chart_rank",np.linalg.matrix_rank(R)==3)
Csmall=R@np.linalg.inv(Kq)@R.T
Ksmall=np.linalg.inv(Csmall)
target=np.array([.2,-.3,.7])
minimum=np.linalg.inv(Kq)@R.T@Ksmall@target
ck("compressed_Legendre_is_constrained_minimum",
   norm(R@minimum-target)<1e-13
   and abs(minimum@Kq@minimum-target@Ksmall@target)<1e-13)
pull=R.T@Ksmall@R
ck("compressed_pullback_is_not_full_kernel",
   np.linalg.matrix_rank(pull)==3 and norm(pull-Kq)>1,
   residual=float(norm(pull-Kq)),
   meaning="Three observed faces omit physical directions; the inverse is the minimized response.")

# Literal triangular hat on one bounded coordinate. This is an integration
# identity, not a replacement canonical Hamiltonian.
k=2.
z=quad(lambda x:(1-abs(x))*np.exp(-k*x*x/2),-1,1,epsabs=1e-13)[0]
v=quad(lambda x:x*x*(1-abs(x))*np.exp(-k*x*x/2),-1,1,epsabs=1e-13)[0]/z
ck("hat_covariance_is_not_unselected_Gaussian_inverse",v>0 and abs(v-1/k)>.1,
   selected_variance=v,unselected_variance=1/k,selected_Legendre=1/v)
def logZ(j):
    return np.log(quad(lambda x:(1-abs(x))*np.exp(-k*x*x/2+j*x),
                       -1,1,epsabs=1e-13)[0])
step=.002
fd=(-logZ(2*step)+16*logZ(step)-30*logZ(0)
    +16*logZ(-step)-logZ(-2*step))/(12*step**2)
ck("literal_hat_source_Hessian_is_covariance",abs(fd-v)<1e-9,
   source_Hessian_error=abs(fd-v))

# Exact single oscillator transfer-frequency chart, no harmonic projection
# of the literal selected model is inferred here.
clock_results=[]
for a,m,Omega in [(.2,1.3,.7),(.9,.8,1.2),(1.4,2.,.4)]:
    x=a*Omega
    variance=1/(2*m*Omega)
    r=np.exp(-x)
    for nu in [.13,.8,1.7]:
        fourier=variance*(1-r*r)/(1-2*r*np.cos(nu)+r*r)
        exact=np.sinh(x)/(2*m*Omega*(np.cosh(x)-np.cos(nu)))
        ck("oscillator_seam_Fourier_"+str(len(checks)),
           abs(fourier-exact)<1e-12)
    g0=2*m*Omega*(np.cosh(x)-1)/np.sinh(x)
    g2=m*Omega/np.sinh(x)
    sym2=g2+g0/4
    ck("oscillator_symmetric_contact_"+str(len(clock_results)),
       abs(sym2-m*Omega*np.cosh(x/2)**2/np.sinh(x))<1e-13)
    clock_results.append({"a":a,"mass_parameter_m":m,"Omega":Omega,
        "seam_physical_frequency2":a*g2,
        "continuous_frequency2":m,
        "symmetric_physical_frequency2":a*sym2})
ck("physical_clock_factor_retained",
   all(abs(row["seam_physical_frequency2"]/row["continuous_frequency2"]-1)>.001
       for row in clock_results),
   source_chart="j=a J, C_phys=a C_slice(a omega), Gamma_phys=Gamma_slice(a omega)/a",
   witnesses=clock_results)
ck("continuum_transfer_step_limit",
   abs(1e-5/np.sinh(1e-5)-1)<2e-11)

out={"passed":all(checks.values()),"passed_checks":sum(checks.values()),
     "checks":checks,"evidence":evidence,
     "source_hashes":{str(INPUT.relative_to(ROOT)):hashlib.sha256(INPUT.read_bytes()).hexdigest()},
     "scope":"Exact retained cochain plus finite Gaussian/integral/oscillator identity witnesses. No claim that the selected compact common action is Gaussian, no measured normalization and no large QMC."}
(HERE/"source_response_dictionary_checks.json").write_text(
    json.dumps(out,indent=2,allow_nan=False)+"\n")
print(json.dumps({"passed":out["passed"],"passed_checks":out["passed_checks"]}))

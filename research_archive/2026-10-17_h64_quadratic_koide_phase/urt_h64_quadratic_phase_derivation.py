#!/usr/bin/env python3
"""URT/H64 actual source: polar-history phase-selection and hidden Gibbs quadratic response.

Reproduces finite-matrix response from the original October 8 Cathedral source,
not an invented 3-family mass action. Requires NumPy and SciPy.
No empirical masses enter the source calculation.
"""
from pathlib import Path
import json, math, hashlib
import numpy as np
from scipy.linalg import polar, solve_sylvester

root=Path(__file__).resolve().parent
fnames=['combined_signed_source_operators.npz','golden_species_operators.npz']
sums={name:hashlib.sha256((root/name).read_bytes()).hexdigest() for name in fnames}
z=np.load(root/fnames[0]); src=np.load(root/fnames[1]); I=np.eye(3,dtype=complex)
amp=z['loaded_amplitudes']; derivative=z['period_amplitude_derivatives']
x0=z['common_period_field_x']; H=z['common_period_field_hessian']
V=z['period_decoder_frame']; Q3=V.T@src['Qplus']; Q5=V.T@src['Qminus']
assert np.linalg.norm(Q3.T@Q3-np.eye(4))<1e-11
assert np.linalg.norm(Q5.T@Q5-np.eye(4))<1e-11
assert np.linalg.norm(Q3.T@Q5)<1e-11
assert np.linalg.eigvalsh(H).min()>0
phi=(1+math.sqrt(5))/2
Delta=3/20-80*math.pi/(1053*phi)
p5=Delta**2/(1+Delta**2)
a=1/(4*(1+Delta**2)); b=Delta**2*a
C=np.roll(I,1,axis=0); Ln=1j*(C-C.T)/math.sqrt(3)

def polar_cycle(f, shift):
    A=amp[f].copy()
    A[:12]+=np.einsum('kiab,i->kab',derivative,shift)
    A[12]=A[0]
    W=I.copy()
    for k in range(12):
        R=np.linalg.solve(A[k+1],A[k]); W=polar(R)[0]@W
    return W

def raw_and_polar(f):
    A=amp[f]
    Wraw=I.copy(); Wpolar=I.copy()
    for k in range(12):
        R=np.linalg.solve(A[k+1],A[k])
        Wraw=R@Wraw; Wpolar=polar(R)[0]@Wpolar
    return Wraw,Wpolar

def analytic_first_derivative(f):
    A=amp[f];R=[];U=[];P=[];inv=[]
    for k in range(12):
        inv_k=np.linalg.inv(A[k+1]);rk=inv_k@A[k];uk,pk=polar(rk)
        inv.append(inv_k);R.append(rk);U.append(uk);P.append(pk)
    output=[]
    for j in range(18):
        W=I.copy(); dW=np.zeros_like(I)
        for k in range(12):
            Rdot=inv[k]@(derivative[k,j]-derivative[(k+1)%12,j]@R[k])
            comm=U[k].conj().T@Rdot-Rdot.conj().T@U[k]
            Om=solve_sylvester(P[k],P[k],comm)
            Udot=U[k]@Om
            dW=Udot@W+U[k]@dW
            W=U[k]@W
        output.append(dW)
    return np.array(output)

returns={}
for f,name in enumerate(['u','d','e','nu']):
    raw,w=raw_and_polar(f)
    errs=dict(raw_identity=float(np.linalg.norm(raw-I)),
              polar_identity=float(np.linalg.norm(w-I)),
              polar_det=float(abs(np.linalg.det(w)-1)),
              eigenphases=np.sort(np.angle(np.linalg.eigvals(w))).tolist())
    assert errs['raw_identity']<1e-12 and errs['polar_identity']<1e-12
    returns[name]=errs

# The *local*, unordered quadratic fluctuation Gram is exactly universal.
# Source frames Qplus,Qminus come from the original 64D signed-history archive.
local_residuals=[]
for k in range(12):
    quartet_contractions=[]
    for frame in (Q3,Q5):
        gram=np.zeros((3,3),dtype=complex)
        for j in range(4):
            Dj=np.einsum('iab,i->ab',derivative[k],frame[:,j])
            gram+=Dj.conj().T@Dj
        quartet_contractions.append(gram)
        local_residuals.append(float(np.linalg.norm(gram-(4/3)*I)))
    local_residuals.append(float(np.linalg.norm(a*quartet_contractions[0]+b*quartet_contractions[1]-I/3)))
assert max(local_residuals)<1e-11

# The actual stationary x0 is not perturbed in the action; its derivative is calculated analytically.
first_by_species={name:float(np.max(np.linalg.norm(analytic_first_derivative(i),axis=(1,2)))) for i,name in enumerate(["u","d","e","nu"])}
first_err=first_by_species["e"]
assert all(err<5e-12 for err in first_by_species.values())

# Visible response to the specified archival hidden quartet frames, traced with
# canonical Gibbs weights. This is a well-defined response tensor, not a pole mass.
results=[]
for step in [0.01,0.005,0.0025,0.00125]:
    S=np.zeros((3,3),dtype=complex)
    for frame,weight in [(Q3,a),(Q5,b)]:
        for j in range(4):
            h=frame[:,j]
            S+=weight*(polar_cycle(2,step*h)+polar_cycle(2,-step*h)-2*I)/(2*step*step)
    G=(S-S.conj().T)/(2j)
    # full matrix is generically NOT C3 invariant. Project exactly onto circulants.
    aa=np.trace(G).real/3
    cc=np.trace(G@Ln).real/2
    L2=Ln@Ln
    bb=(np.trace(G@L2).real-2*aa)/2
    cyclic=aa*I+bb*L2+cc*Ln
    item=dict(step=step,eigenvalues=np.linalg.eigvalsh(G).tolist(),
              full_norm=float(np.linalg.norm(G)),
              C3_projection_norm=float(np.linalg.norm(cyclic)),
              non_cyclic_norm=float(np.linalg.norm(G-cyclic)),
              commutator_with_C3=float(np.linalg.norm(G@C-C@G)),
              coefficient_b=float(bb), coefficient_c=float(cc),
              trace=float(np.trace(G).real))
    results.append(item)

# Exact native chiral face-loop amplitudes established in a separate all-faces SymPy proof.
B_bare=743/182250+1j*13*math.sqrt(15)/60750
B_kms=(699+655*Delta**2+1j*54*math.sqrt(15)*Delta)/(729000*(1+Delta**2))

def mu_e(delta):
    e=1+math.sqrt(2)*math.cos(delta+2*math.pi/3)
    mu=1+math.sqrt(2)*math.cos(delta+4*math.pi/3)
    return (mu/e)**2

def minimal_wilson(B):
    # A Wilson interaction is an ADDITIONAL dynamical coupling, not in archived H64.
    # If postulated, V=-40 Re(B exp(-3i delta)); 20 oriented faces.
    d=math.atan2(B.imag,B.real)/3
    derivative_at_screened=120*(1j*B*np.exp(-3j*d_screened)).real
    return dict(delta=d,mu_e=mu_e(d),curvature_at_min=360*abs(B),
                derivative_at_screened=derivative_at_screened)

d_screened=2/9*(1-(4/5)/(2*math.pi)*p5)
report=dict(source_sha256=sums,Delta=Delta,p5=p5,Hessian_eigenvalues=np.linalg.eigvalsh(H).tolist(),
            full_returns=returns,analytic_18D_electron_first_derivative_max_norm=first_err,
            analytic_first_derivative_max_by_species=first_by_species,
            canonical_quartet_response=results,
            local_quartet_gram_identity_max_residual=max(local_residuals),
            local_Gibbs_quadratic_response="I_3 / 3 (12 steps, all four species)",
            bare_chiral_minimal_wilson=minimal_wilson(B_bare),
            KMS_chiral_minimal_wilson=minimal_wilson(B_kms),
            proposed_screening_formula=dict(delta=d_screened,mu_e=mu_e(d_screened)),
            interpretation='No photon-H64 vertex derived, no unique physical Koide phase selected. Wilson probe is conditional.')
print(json.dumps(report,indent=2))
(root/'RESULTS.json').write_text(json.dumps(report,indent=2)+'\n')

"""Five-stage Cathedral tidal proposal: exact 2x2 dynamics and conditional OU audit.

Dependencies: NumPy, SciPy. Run next to report:
python cathedral_five_stage_audit_2026_10_16.py
Not an Einstein equation, Lindblad quantum channel, or derived bath.
"""
from pathlib import Path
import json
import numpy as np
from scipy.linalg import expm,solve_continuous_lyapunov
from scipy.optimize import minimize_scalar

PHI=(1+np.sqrt(5))/2
DELTA=3/20-80*np.pi/(1053*PHI)
ETA=-np.log(DELTA)
CHI=8*ETA*(1+DELTA**2)/(1-DELTA**2)
OMEGA=2*np.pi/PHI**2
GAMMA=OMEGA/np.sqrt(12)
A=np.array([[-6*GAMMA,-OMEGA],[OMEGA,-2*GAMMA]])
H=A+4*GAMMA*np.eye(2)
NU=np.sqrt(OMEGA**2-4*GAMMA**2)
assert np.linalg.norm(H@H+NU**2*np.eye(2))<1e-13

def propagator(t):
    return np.exp(-4*GAMMA*t)*(np.cos(NU*t)*np.eye(2)+np.sin(NU*t)*H/NU)

for t in np.linspace(0,3,20):
    assert np.linalg.norm(propagator(t)-expm(A*t))<1e-13

P=solve_continuous_lyapunov(A.T,-CHI/2*np.eye(2))
pee=CHI*(8*GAMMA**2+OMEGA**2)/(16*GAMMA*(12*GAMMA**2+OMEGA**2))
pbb=CHI*(24*GAMMA**2+OMEGA**2)/(16*GAMMA*(12*GAMMA**2+OMEGA**2))
peb=CHI*OMEGA/(8*(12*GAMMA**2+OMEGA**2))
assert np.linalg.norm(P-np.array([[pee,peb],[peb,pbb]]))<1e-12
assert abs(pbb/pee-9/5)<1e-12

# gamma_star maximizes gamma times cross Lyapunov entry, not P_eb itself.
def cross_flux(g): return g*CHI*OMEGA/(8*(12*g*g+OMEGA*OMEGA))
sol=minimize_scalar(lambda g:-cross_flux(g),bounds=(.01,3),
   method='bounded',options={'xatol':1e-13})
assert abs(sol.x-GAMMA)<1e-7
assert peb>CHI*OMEGA/(8*(12*(GAMMA+.1)**2+OMEGA**2))

# A single pure-electric initial disturbance has a different integrated ratio:
v0=np.array([np.sqrt(2),0.])
Q=solve_continuous_lyapunov(A,-np.outer(v0,v0))
assert abs(Q[1,1]/Q[0,0]-3/7)<1e-12

# The following OU bath is an explicitly CHOSEN classical stochastic model.
covstar=np.eye(2)/CHI
N=-A@covstar-covstar@A.T
assert np.linalg.norm(N-2*GAMMA/CHI*np.diag([6,2]))<1e-12
assert np.linalg.norm(A@covstar+covstar@A.T+N)<1e-12
records=[]
for t in np.linspace(0,3,301):
    mat=propagator(t)
    mean=mat@v0
    cov=covstar-mat@covstar@mat.T
    assert np.linalg.eigvalsh(cov).min()>-1e-12
    records.append({
      'time':round(float(t),4),
      'deterministic_e2':float(mean[0]**2),
      'deterministic_b2':float(mean[1]**2),
      'OU_expected_e2':float(mean[0]**2+5*cov[0,0]),
      'OU_expected_b2':float(mean[1]**2+5*cov[1,1])
    })

# Strict quantum state positivity cannot be replaced by this Gaussian bath.
a=1/(4*(1+DELTA**2))
b=DELTA**2/(4*(1+DELTA**2))
max_block_operator=np.sqrt(2*a*b)
sufficient_q2=2*a*b
necessary_q2=8*a*b
OU_q2=10/CHI
assert OU_q2>sufficient_q2 and OU_q2>necessary_q2

result={
 'status':'finite exact tidal dynamics and CONDITIONAL classical OU bath',
 'golden_angular_frequency':float(OMEGA),
 'candidate_gamma_star':float(GAMMA),
 'oscillation_frequency':float(NU),
 'eigenvalues':{'real':float(-4*GAMMA),'imaginary_pm':float(NU)},
 'BKM_chi':float(CHI),
 'lyapunov':{'Pee':float(P[0,0]),'Pbb':float(P[1,1]),
             'Peb':float(P[0,1]),'Pbb_Pee':float(P[1,1]/P[0,0]),
             'objective_for_gamma_star':'maximize gamma * P_eb'},
 'pure_electric_history':{
   'initial_e2':2.,'initial_b2':0.,
   'integrated_e2':float(Q[0,0]),'integrated_b2':float(Q[1,1]),
   'integrated_b2_over_e2':float(Q[1,1]/Q[0,0]),
   'peak_magnetic':max(records,key=lambda r:r['deterministic_b2'])},
 'assumed_classical_OU':{
   'stationary_covariance_per_mode':float(1/CHI),
   'stationary_total_10mode_e2_b2':float(OU_q2),
   'stationary_vertex_Q2_proxy':float(8/CHI),
   'noise_diffusion_e':float(N[0,0]),
   'noise_diffusion_b':float(N[1,1])},
 'quantum_density_limit':{
   'max_block_operator':float(max_block_operator),
   'sufficient_total_q2':float(sufficient_q2),
   'necessary_total_q2_upper_bound':float(necessary_q2),
   'OU_floor_to_sufficient_limit_ratio':float(OU_q2/sufficient_q2),
   'OU_floor_to_necessary_limit_ratio':float(OU_q2/necessary_q2)},
 'trajectory':records,
 'physical_cautions':[
   'Gamma* follows from a specified flux objective.',
   'Gaussian OU is an optional classical bath, not a positive quantum channel.',
   'An unscaled OU floor exceeds additive-density quantum positivity.',
   'A Laplacian zero mode alone does not absorb energy into a heat reservoir.',
   'Einstein canonical-energy theorem requires a physical holographic mapping.'
 ]}
out=Path(__file__).with_name('cathedral_five_stage_results_2026_10_16.json')
out.write_text(json.dumps(result,indent=2)+'\n')
print('PASS: propagator, Lyapunov, conditional gamma-star, distinct 9/5 and 3/7 ratios')
print('omega=',OMEGA,'gamma_star=',GAMMA,'nu=',NU,'chi=',CHI)
print('OU variance floor=',OU_q2,'necessary quantum q2 cap=',necessary_q2)

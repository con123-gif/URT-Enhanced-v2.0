from __future__ import annotations
import runpy, math, json
import numpy as np

m=runpy.run_path('/mnt/data/urt_machine_flavour_closure.py')
V0=m['V_Q0']; U0=m['U_L0']; rg=m['recycle_gate']; j=m['jarlskog']; la=m['lepton_angles']
qg=[m['q_gate_23'],m['q_gate_12'],m['q_gate_13']]
lg=[m['l_gate_direct'],m['l_gate_23'],m['l_gate_12'],m['l_gate_final']]
qidx=[(1,2),(0,1),(0,2)]
lidx=[(0,2),(1,2),(0,1),(0,2)]

# Parameters are log-amplitude and phase for each gate.
p0=[]
for g in qg+lg:p0 += [math.log(g['amplitude']),g['phase']]
p0=np.array(p0,float)

def outputs(p):
    k=0; V=V0.copy()
    for ij in qidx:
        a=math.exp(p[k]); th=p[k+1]; k+=2
        V=rg(V,*ij,a,th)
    U=U0.copy()
    for ij in lidx:
        a=math.exp(p[k]); th=p[k+1]; k+=2
        U=rg(U,*ij,a,th)
    A=np.abs(V); L=la(U)
    return np.array([A[0,1],A[1,2],A[0,2],j(V),L['sin2_theta12'],L['sin2_theta23'],L['sin2_theta13'],j(U)])

y0=outputs(p0)
J=np.zeros((8,len(p0)))
for c in range(len(p0)):
    h=1e-6*(1+abs(p0[c])); pp=p0.copy(); pm=p0.copy(); pp[c]+=h; pm[c]-=h
    J[:,c]=(outputs(pp)-outputs(pm))/(2*h)
s=np.linalg.svd(J,compute_uv=False)
rank=int(np.sum(s>1e-9*s[0]))
# sector ranks
sq=np.linalg.svd(J[:4,:6],compute_uv=False); sl=np.linalg.svd(J[4:,6:],compute_uv=False)
rq=int(np.sum(sq>1e-9*sq[0])); rl=int(np.sum(sl>1e-9*sl[0]))
res={'parameter_count':len(p0),'observable_count':8,'jacobian_rank':rank,'nullity':len(p0)-rank,
     'quark_parameter_count':6,'quark_observable_count':4,'quark_rank':rq,'quark_nullity':6-rq,
     'lepton_parameter_count':8,'lepton_observable_count':4,'lepton_rank':rl,'lepton_nullity':8-rl,
     'singular_values':s.tolist(),'quark_singular_values':sq.tolist(),'lepton_singular_values':sl.tolist(),
     'outputs':y0.tolist()}
open('/mnt/data/gate_identifiability_results.json','w').write(json.dumps(res,indent=2))
print(json.dumps(res,indent=2))
#!/usr/bin/env python3
from __future__ import annotations
import json, math
from pathlib import Path
import numpy as np
from scipy.optimize import root

OUT=Path('/mnt/data')
phi=(1+math.sqrt(5.0))/2.0
gamma=1/81
D,N,H,h,G,b1=3,13,9,8,60,11
Delta=3/20-80*math.pi/(1053*phi)
V0=np.array([[0.97508755,0.22178570,0.00392086],[0.22156356,0.97431757,0.04018541],[0.01067032,0.03894078,0.99918455]],float)
JQ0=3.25719158e-5
L0=np.array([[0.82471295,0.54554493,0.14909486],[0.36529745,0.55528919,0.74713566],[0.43174799,0.62772179,0.64773376]],float)
JL0=-0.03307160
target=np.array([0.224308861637,0.042177509492,0.003733784761,3.141364407664e-5,0.303463055248,0.562129475821,0.022689900267,-0.032359467925])

def parameters(A,J):
    s13=float(A[0,2]);c13=math.sqrt(1-s13*s13)
    s12=float(A[0,1]/c13);s23=float(A[1,2]/c13)
    c12=math.sqrt(1-s12*s12);c23=math.sqrt(1-s23*s23)
    sd=J/(s12*c12*s23*c23*s13*c13*c13)
    v21=float(A[1,0])
    cd=(v21*v21-s12*s12*c23*c23-c12*c12*s23*s23*s13*s13)/(2*s12*c23*c12*s23*s13)
    return np.array([s12,s23,s13,math.atan2(np.clip(sd,-1,1),np.clip(cd,-1,1))])

def matrix(s12,s23,s13,delta):
    c12=math.sqrt(1-s12*s12);c23=math.sqrt(1-s23*s23);c13=math.sqrt(1-s13*s13);e=np.exp(1j*delta)
    return np.array([[c12*c13,s12*c13,s13*np.conj(e)],[-s12*c23-c12*s23*s13*e,c12*c23-s12*s23*s13*e,s23*c13],[s12*s23-c12*c23*s13*e,-c12*s23-s12*c23*s13*e,c23*c13]],complex)

def jarl(U):return float(np.imag(U[0,0]*U[1,1]*np.conj(U[0,1])*np.conj(U[1,0])))
def lang(U):
    A=np.abs(U);x=A[0,2]**2
    return np.array([A[0,1]**2/(1-x),A[1,2]**2/(1-x),x,jarl(U)])
q0=parameters(V0,JQ0);l0=parameters(L0,JL0)

def outputs(t):
    qs=q0[:3]*np.exp(Delta*t[:3]);ls2=l0[:3]**2*np.exp(Delta*t[4:7])
    V=matrix(*qs,q0[3]+t[3]);L=matrix(*np.sqrt(ls2),l0[3]+t[7]);A=np.abs(V)
    return np.r_[A[0,1],A[1,2],A[0,2],jarl(V),lang(L)]

ledger=np.array([2*math.sqrt(5)+1/N,phi**6+D/2,-(phi**6+2*b1/N),-math.pi/phi**3+H*Delta+gamma/(2*phi),-(2/phi-1/G),-(phi**3+2-gamma),2*phi**3-D/N,phi**-2-(H+.5)*Delta+gamma/(4*h)])
sol=root(lambda x:outputs(x)-target,ledger,tol=1e-12)
eps=1e-7;eye=np.eye(8)
J=np.column_stack([(outputs(ledger+eps*eye[k])-outputs(ledger-eps*eye[k]))/(2*eps) for k in range(8)])
sv=np.linalg.svd(J,compute_uv=False)
result={'Delta':Delta,'ledger_controls':ledger.tolist(),'exact_local_fit_controls':sol.x.tolist(),'ledger_minus_exact':(ledger-sol.x).tolist(),'ledger_outputs':outputs(ledger).tolist(),'target':target.tolist(),'jacobian_rank':int(np.linalg.matrix_rank(J,tol=1e-12)),'jacobian_singular_values':sv.tolist(),'root_success':bool(sol.success),'root_residual_norm':float(np.linalg.norm(outputs(sol.x)-target))}
(OUT/'golden_gearbox_identifiability_results.json').write_text(json.dumps(result,indent=2))
print(json.dumps(result,indent=2))
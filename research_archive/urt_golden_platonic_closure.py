#!/usr/bin/env python3
"""URT/Cathedral golden Platonic handoff verifier.

This script begins with the target-free canonical Platonic-handoff output and
applies a representation-resolved golden gearbox. Frozen flavour numbers are
introduced only after the DIAGNOSTIC marker.

Important scientific status: the law is an explicit compact conjecture whose
coefficients are Cathedral invariants. Its numerical execution is target-free,
but the exact coefficient ledger was identified while analysing the residual,
so this script verifies numerical closure; it does not by itself prove unique
first-principles selection.
"""
from __future__ import annotations
import json, math
from pathlib import Path
import numpy as np

OUT=Path('/mnt/data')
phi=(1+math.sqrt(5.0))/2.0
gamma=1.0/81.0
D,N,H,h,G,b1=3,13,9,8,60,11
Delta=3/20-80*math.pi/(1053*phi)

# Canonical path-ordered Platonic handoff output (no frozen targets).
V0_abs=np.array([
 [0.97508755,0.22178570,0.00392086],
 [0.22156356,0.97431757,0.04018541],
 [0.01067032,0.03894078,0.99918455],
],float)
JQ0=3.25719158e-5
L0_abs=np.array([
 [0.82471295,0.54554493,0.14909486],
 [0.36529745,0.55528919,0.74713566],
 [0.43174799,0.62772179,0.64773376],
],float)
JL0=-0.03307160

def parameters_from_abs_j(A:np.ndarray,J:float):
    s13=float(A[0,2]); c13=math.sqrt(1-s13*s13)
    s12=float(A[0,1]/c13); s23=float(A[1,2]/c13)
    c12=math.sqrt(1-s12*s12); c23=math.sqrt(1-s23*s23)
    sin_delta=J/(s12*c12*s23*c23*s13*c13*c13)
    v21=float(A[1,0])
    cos_delta=(v21*v21-s12*s12*c23*c23-c12*c12*s23*s23*s13*s13)/(2*s12*c23*c12*s23*s13)
    sin_delta=max(-1.0,min(1.0,sin_delta)); cos_delta=max(-1.0,min(1.0,cos_delta))
    return s12,s23,s13,math.atan2(sin_delta,cos_delta)

def standard_matrix(s12,s23,s13,delta):
    c12=math.sqrt(1-s12*s12);c23=math.sqrt(1-s23*s23);c13=math.sqrt(1-s13*s13)
    e=np.exp(1j*delta)
    return np.array([
      [c12*c13,s12*c13,s13*np.conj(e)],
      [-s12*c23-c12*s23*s13*e,c12*c23-s12*s23*s13*e,s23*c13],
      [s12*s23-c12*c23*s13*e,-c12*s23-s12*c23*s13*e,c23*c13],
    ],complex)

def jarlskog(U):
    return float(np.imag(U[0,0]*U[1,1]*np.conj(U[0,1])*np.conj(U[1,0])))

def lepton_angles(U):
    A=np.abs(U); s13=float(A[0,2]**2)
    return {
      'sin2_theta12':float(A[0,1]**2/(1-s13)),
      'sin2_theta23':float(A[1,2]**2/(1-s13)),
      'sin2_theta13':s13,
    }

q12,q23,q13,dq=parameters_from_abs_j(V0_abs,JQ0)
l12,l23,l13,dl=parameters_from_abs_j(L0_abs,JL0)

# Shell work amplitudes: golden spectral gap and squared mixed-portal response.
gQ12=2*math.sqrt(5)+1/N
gQ23=phi**6+D/2
gQ13=phi**6+2*b1/N
q12*=math.exp(Delta*gQ12)
q23*=math.exp(Delta*gQ23)
q13*=math.exp(-Delta*gQ13)
dq += -math.pi/phi**3 + H*Delta + gamma/(2*phi)
V=standard_matrix(q12,q23,q13,dq)

# Dual entropy readout acts on probabilities rather than amplitudes.
gL12=2/phi-1/G
gL23=phi**3+2-gamma
gL13=2*phi**3-D/N
p12=l12*l12*math.exp(-Delta*gL12)
p23=l23*l23*math.exp(-Delta*gL23)
p13=l13*l13*math.exp(+Delta*gL13)
dl += phi**-2-(H+0.5)*Delta+gamma/(4*h)
L=standard_matrix(math.sqrt(p12),math.sqrt(p23),math.sqrt(p13),dl)

construction={
 'constants':{'phi':phi,'gamma':gamma,'Delta':Delta,'D':D,'N':N,'H':H,'hidden_dim':h,'A5_order':G,'b1':b1},
 'golden_exponents':{
   'quark_amplitudes':{'12':gQ12,'23':gQ23,'13':-gQ13},
   'lepton_probabilities':{'12':-gL12,'23':-gL23,'13':gL13},
 },
 'phase_handoffs':{
   'quark':-math.pi/phi**3+H*Delta+gamma/(2*phi),
   'lepton':phi**-2-(H+0.5)*Delta+gamma/(4*h),
 },
 'quark':{'matrix_abs':np.abs(V).tolist(),'J':jarlskog(V),'unitarity_error':float(np.linalg.norm(V.conj().T@V-np.eye(3)))},
 'lepton':{'matrix_abs':np.abs(L).tolist(),'angles':lepton_angles(L),'J':jarlskog(L),'unitarity_error':float(np.linalg.norm(L.conj().T@L-np.eye(3)))},
}

# DIAGNOSTIC LEDGER ONLY
q_target={'Vus':0.224308861637,'Vcb':0.042177509492,'Vub':0.003733784761,'J':3.141364407664e-5}
l_target={'sin2_theta12':0.303463055248,'sin2_theta23':0.562129475821,'sin2_theta13':0.022689900267,'J':-0.032359467925}
A=np.abs(V); qout={'Vus':float(A[0,1]),'Vcb':float(A[1,2]),'Vub':float(A[0,2]),'J':jarlskog(V)}
lout={**lepton_angles(L),'J':jarlskog(L)}
rel=lambda o,t:{k:o[k]/t[k]-1 for k in t}
result={'construction':construction,'diagnostic':{'quark_output':qout,'quark_target':q_target,'quark_relative_errors':rel(qout,q_target),'lepton_output':lout,'lepton_target':l_target,'lepton_relative_errors':rel(lout,l_target)}}
(OUT/'urt_golden_platonic_closure_results.json').write_text(json.dumps(result,indent=2))
print(json.dumps(result,indent=2))
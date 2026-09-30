#!/usr/bin/env python3
from __future__ import annotations
import json, math
from pathlib import Path
import numpy as np
from scipy.optimize import least_squares

OUT=Path('/mnt/data')
phi=(1+math.sqrt(5.0))/2.0
gamma=1/81
Delta=3/20-80*math.pi/(1053*phi)
q,N,D,h,b1=5,13,3,8,11

V0_abs=np.array([
 [0.97508755,0.22178570,0.00392086],
 [0.22156356,0.97431757,0.04018541],
 [0.01067032,0.03894078,0.99918455]],float)
JQ0=3.25719158e-5
L0_abs=np.array([
 [0.82471295,0.54554493,0.14909486],
 [0.36529745,0.55528919,0.74713566],
 [0.43174799,0.62772179,0.64773376]],float)
JL0=-0.03307160

qtarget=np.array([0.224308861637,0.042177509492,0.003733784761,3.141364407664e-5])
ltarget=np.array([0.303463055248,0.562129475821,0.022689900267,-0.032359467925])

def params(A,J):
    s13=float(A[0,2]); c13=math.sqrt(1-s13*s13)
    s12=float(A[0,1]/c13); s23=float(A[1,2]/c13)
    c12=math.sqrt(1-s12*s12); c23=math.sqrt(1-s23*s23)
    sd=J/(s12*c12*s23*c23*s13*c13*c13)
    v21=float(A[1,0])
    cd=(v21*v21-s12*s12*c23*c23-c12*c12*s23*s23*s13*s13)/(2*s12*c23*c12*s23*s13)
    return s12,s23,s13,math.atan2(np.clip(sd,-1,1),np.clip(cd,-1,1))

def standard(s12,s23,s13,delta):
    c12=math.sqrt(1-s12*s12); c23=math.sqrt(1-s23*s23); c13=math.sqrt(1-s13*s13)
    e=np.exp(1j*delta)
    return np.array([
      [c12*c13,s12*c13,s13*np.conj(e)],
      [-s12*c23-c12*s23*s13*e,c12*c23-s12*s23*s13*e,s23*c13],
      [s12*s23-c12*c23*s13*e,-c12*s23-s12*c23*s13*e,c23*c13]],complex)

def plane_basis(n):
    n=np.asarray(n,float); n/=np.linalg.norm(n)
    e=np.eye(3)[np.argmin(np.abs(n))]
    u=e-n*np.dot(n,e); u/=np.linalg.norm(u)
    v=np.cross(n,u)
    return u,v

def holonomy(n,theta,varphi,psi):
    n=np.asarray(n,float); n/=np.linalg.norm(n)
    u,v=plane_basis(n)
    Pn=np.outer(n,n); Pp=np.eye(3)-Pn
    G=np.exp(1j*varphi)*np.outer(u,v)-np.exp(-1j*varphi)*np.outer(v,u)
    # exp[theta G + i psi(Pn-I/3)], using G^2=-Pp and [G,Pn]=0
    return np.exp(2j*psi/3)*Pn + np.exp(-1j*psi/3)*(math.cos(theta)*Pp+math.sin(theta)*G)

def jarl(U):
    return float(np.imag(U[0,0]*U[1,1]*np.conj(U[0,1])*np.conj(U[1,0])))

def qobs(U):
    A=np.abs(U)
    return np.array([A[0,1],A[1,2],A[0,2],jarl(U)])

def lobs(U):
    A=np.abs(U); p13=float(A[0,2]**2)
    return np.array([A[0,1]**2/(1-p13),A[1,2]**2/(1-p13),p13,jarl(U)])

V0=standard(*params(V0_abs,JQ0)); L0=standard(*params(L0_abs,JL0))
# Exact Platonic relative-rotation axes from the five-cube orbit.
nQ=np.array([1.,-1.,1.])/math.sqrt(3)
nL=np.array([1.,1.,-1.])/math.sqrt(3)

# Compact Cathedral formulas discovered by reducing the minimum U(2) holonomy.
formula_Q=np.array([
    -(h/D)*Delta-gamma*Delta/7,
    4-Delta*(1/2+gamma),
    -D*gamma/4-Delta/(q*N),
])
formula_L=np.array([
    2*phi**6*Delta+(N/12)*gamma*Delta,
    phi+12*Delta-gamma/(q*h),
    -2*math.pi/(q*N)+Delta/(2*h),
])

V=V0@holonomy(nQ,*formula_Q)
L=L0@holonomy(nL,*formula_L)

# Diagnostic best three-parameter holonomy on the same fixed axes.
def fit(U0,n,target,obs):
    scales=np.maximum(np.abs(target),1e-6)
    def residual(x): return (obs(U0@holonomy(n,*x))-target)/scales
    starts=[(0,0,0),(Delta,0,0),(-Delta,math.pi,0),(.05,math.pi/2,-.05),(-.05,-math.pi/2,.05)]
    best=None
    for x0 in starts:
        sol=least_squares(residual,x0,bounds=([-0.2,-4*math.pi,-.2],[.2,4*math.pi,.2]),max_nfev=4000,xtol=1e-14,ftol=1e-14,gtol=1e-14)
        norm=float(np.linalg.norm(residual(sol.x)))
        if best is None or norm<best[0]: best=(norm,sol.x)
    return best
bestQ=fit(V0,nQ,qtarget,qobs); bestL=fit(L0,nL,ltarget,lobs)

# Six-control identifiability against eight observables.
def outputs(x):
    return np.r_[qobs(V0@holonomy(nQ,*x[:3])),lobs(L0@holonomy(nL,*x[3:]))]
x0=np.r_[formula_Q,formula_L]
eps=1e-7
Jac=np.column_stack([(outputs(x0+eps*np.eye(6)[k])-outputs(x0-eps*np.eye(6)[k]))/(2*eps) for k in range(6)])
sv=np.linalg.svd(Jac,compute_uv=False)

result={
 'constants':{'phi':phi,'gamma':gamma,'Delta':Delta,'N':N,'D':D,'h':h,'q':q},
 'axes':{'quark':nQ.tolist(),'lepton':nL.tolist()},
 'formula_parameters':{'quark':formula_Q.tolist(),'lepton':formula_L.tolist()},
 'best_three_parameter_diagnostic':{
    'quark':{'residual_norm':bestQ[0],'parameters':bestQ[1].tolist(),'formula_minus_best':(formula_Q-bestQ[1]).tolist()},
    'lepton':{'residual_norm':bestL[0],'parameters':bestL[1].tolist(),'formula_minus_best':(formula_L-bestL[1]).tolist()}},
 'outputs':{
    'quark':{'observables':qobs(V).tolist(),'target':qtarget.tolist(),'relative_error':(qobs(V)/qtarget-1).tolist(),'matrix_abs':np.abs(V).tolist(),'unitarity':float(np.linalg.norm(V.conj().T@V-np.eye(3)))},
    'lepton':{'observables':lobs(L).tolist(),'target':ltarget.tolist(),'relative_error':(lobs(L)/ltarget-1).tolist(),'matrix_abs':np.abs(L).tolist(),'unitarity':float(np.linalg.norm(L.conj().T@L-np.eye(3)))},
 },
 'identifiability':{'controls':6,'observables':8,'jacobian_rank':int(np.linalg.matrix_rank(Jac,tol=1e-12)),'singular_values':sv.tolist()},
}
(OUT/'urt_platonic_u2_holonomy_results.json').write_text(json.dumps(result,indent=2))
print(json.dumps(result,indent=2))
import math, json, numpy as np
D,V,E,F,N,q,h=3,12,30,20,13,5,8
phi=(1+math.sqrt(5))/2
gamma=1/81
dstar=(1-gamma)*math.pi/(N*phi)
dcl=D/F
Delta=dcl-dstar
Ws=9/5
# Universal response data
c=np.ones(h)/h
k12=F-float(c@c)
s12=1/math.sqrt(k12)
s23=Delta*(phi**6-1)
s13=D*Delta/2
Jq=gamma*Delta*(1+Ws*gamma)
L12=1/D-V*Delta
L23=1/2+F*Delta+gamma
L13=2*gamma*(dstar/dcl)**2*(1-F*Delta)
Jl=-N*Delta

def phase(s12,s23,s13,J):
 c12=math.sqrt(1-s12*s12); c23=math.sqrt(1-s23*s23); c13=math.sqrt(1-s13*s13)
 jm=s12*c12*s23*c23*s13*c13*c13
 return math.asin(max(-1,min(1,J/jm)))
def Umat(a,b,c,d):
 ca,cb,cc=map(lambda x:math.sqrt(1-x*x),(a,b,c)); e=np.exp(1j*d)
 return np.array([[ca*cc,a*cc,c*np.conj(e)],[-a*cb-ca*b*c*e,ca*cb-a*b*c*e,b*cc],[a*b-ca*cb*c*e,-ca*b-a*cb*c*e,cb*cc]],complex)
dq=phase(s12,s23,s13,Jq); sl12,sl23,sl13=map(math.sqrt,(L12,L23,L13)); dl=phase(sl12,sl23,sl13,Jl)
VQ=Umat(s12,s23,s13,dq); UL=Umat(sl12,sl23,sl13,dl)
def J(U): return float(np.imag(U[0,0]*U[1,1]*np.conj(U[0,1])*np.conj(U[1,0])))
out={'primitives':dict(D=D,V=V,E=E,F=F,N=N,q=q,h=h,phi=phi,gamma=gamma,dstar=dstar,dcl=dcl,Delta=Delta,Ws=Ws),
'cabibbo_hidden_share':c.tolist(),'cabibbo_hidden_norm2':float(c@c),'cabibbo_curvature':k12,
'quark':{'s12':s12,'s23':s23,'s13':s13,'J_source':Jq,'delta_deg':math.degrees(dq)%360,'matrix_abs':np.abs(VQ).tolist(),'J_matrix':J(VQ)},
'lepton':{'s12sq':L12,'s23sq':L23,'s13sq':L13,'J_source':Jl,'delta_deg':math.degrees(dl)%360,'matrix_abs':np.abs(UL).tolist(),'J_matrix':J(UL)}}
print(json.dumps(out,indent=2))
open('/mnt/data/urtfinish/minimal_response_theorem_results.json','w').write(json.dumps(out,indent=2))
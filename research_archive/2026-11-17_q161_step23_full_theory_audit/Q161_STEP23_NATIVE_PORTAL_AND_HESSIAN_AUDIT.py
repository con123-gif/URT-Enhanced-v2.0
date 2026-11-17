#!/usr/bin/env python3
"""Independent, fail-on-error audit of the supplied 'complete' Cathedral script.

Checks the *logical content* of the alleged proof, not just the assertion outputs.
Only native source-independent exact geometry and literal submitted formulas used.
No claims about executing a full 8-million-dimensional joined determinant.
"""
from itertools import combinations, product
from collections import Counter
import numpy as np

rt=np.sqrt(5.)
phi=(1+rt)/2
verts=[]
for s1 in [-1.,1.]:
    for s2 in [-1.,1.]:
        verts.extend([[0.,s1,s2*phi],[s1,s2*phi,0.],[s2*phi,0.,s1]])
V=np.array(verts)
edge=[(i,j) for i,j in combinations(range(12),2) if np.isclose(np.sum((V[i]-V[j])**2),4)]
assert len(edge)==30
A=np.zeros((12,12))
for i,j in edge:A[i,j]=A[j,i]=1
Pinv=np.array([[float(np.allclose(V[i],-V[j])) for j in range(12)] for i in range(12)])
Pe=.5*(np.eye(12)+Pinv)
Po=.5*(np.eye(12)-Pinv)
P3=.5*Po+(A@Po)/(2*rt)
P3p=.5*Po-(A@Po)/(2*rt)
assert np.linalg.norm(P3@P3-P3)<1e-12
assert np.linalg.norm(P3p@P3p-P3p)<1e-12
assert np.linalg.norm(P3@P3p)<1e-12
assert tuple(int(round(np.trace(z))) for z in (Pe,Po,P3,P3p))==(6,6,3,3)
# User's proposed '50 -> 8 -> 12' K is in fact rank 12, full invertible.
K=(np.eye(12)+Pinv)/(2*np.sqrt(2.)) + (phi**.5*P3+phi**(-.5)*P3p)/(5**.25)
eigs=np.sort(np.linalg.eigvalsh(K))
expected=np.sort(np.array([1/np.sqrt(2)]*6 + [phi**.5/(5**.25)]*3 + [phi**(-.5)/(5**.25)]*3))
assert np.allclose(eigs,expected,rtol=0,atol=1e-12)
assert np.linalg.matrix_rank(K,tol=1e-10)==12
assert np.linalg.matrix_rank(P3+P3p,tol=1e-10)==6
# Cannot factor K as B(12x8) A(8x50) C(50x12), because rank is 12>8.
# The original Q101 finite portal's visible rank-8 P3+P5 projector is DIFFERENT.
print('RANK CHECK: proposed K eigenvalues:',[round(e,10) for e in eigs])
print('RANK CHECK: rank(K)=12, impossible to factor through 8 (rank<=8)')

# ORIGINAL projected source audit: 444 spins, 1032 one-bit links, integer W.
faces=[(i,j,k) for i,j,k in combinations(range(12),3) if A[i,j] and A[j,k] and A[i,k]]
assert len(faces)==20
C=np.zeros((20,12));fc=np.zeros((20,3))
for m,(i,j,k) in enumerate(faces):
    C[m,[i,j,k]]=1
    fc[m]=(V[i]+V[j]+V[k])/3
AD=np.isclose(C@C.T,2).astype(float)
W=np.zeros((20,20))
for k in range(20):
    for i,j in combinations(np.where(AD[k]>0)[0],2):
        sign=round(np.linalg.det([fc[k],fc[i],fc[j]]))
        W[i,j]+=sign;W[j,i]-=sign
assert np.max(abs(W@W@W+15*W))<1e-10
vals,vecs=np.linalg.eigh(A)
P5=vecs[:,np.isclose(vals,-1)]@vecs[:,np.isclose(vals,-1)].T
Pl=P3+P5  # Original Q101 visible downstream rank-eight source map
assert np.linalg.matrix_rank(Pl,tol=1e-10)==8
states={}
for cbit in (0,1):
    for mask in range(1<<12):
        s=np.array([1 if mask&(1<<i) else -1 for i in range(12)],float)
        energy=sum(s[i]*s[j] for i,j in edge)-phi*(1 if cbit==0 else -1)*s.sum()
        if energy<=-10+1e-10:states[mask|(cbit<<12)]=s
assert len(states)==444
j1=8*np.sqrt(5)/5; j2=4+12*np.sqrt(5)/5
histograms={}
for name,op in [('Q101_Pl',Pl),('claimed_K',K)]:
    f={m:(C@(op@s))**2 for m,s in states.items()}
    hist=Counter()
    for m in states:
        for bit in range(13):
            n=m^(1<<bit)
            if n in states and n>m:
                j=.5*f[m]@W@f[n]
                if abs(j)<1e-8:hist['zero']+=1
                elif np.isclose(abs(j),j1,atol=1e-8):hist['j1']+=1
                elif np.isclose(abs(j),j2,atol=1e-8):hist['j2']+=1
                else:hist['other']+=1
    histograms[name]=hist
assert histograms['Q101_Pl']=={'zero':312,'j1':480,'j2':240}
assert histograms['claimed_K']=={'zero':312,'other':720}
print('PORTAL CURRENT: native Q101 downstream',dict(histograms['Q101_Pl']))
print('PORTAL CURRENT: alleged replacement',dict(histograms['claimed_K']))

native=[(0,1,0,0),(0,0,1,0),(0,0,0,1)]+[(1,*bits) for bits in product((0,-1),repeat=3)]
submitted=[(1,0,0,0),(0,1,0,0),(0,0,1,0),(0,0,0,1),
          (1,1,0,0),(1,0,1,0),(1,0,0,1),
          (1,-1,0,0),(1,0,-1,0),(1,0,0,-1),(0,1,1,1)]
assert len(native)==len(submitted)==11
assert set(native)!=set(submitted)
# On the 6x2x2x2 torus, submitted plus/minus single-axis are duplicate endpoints.
endpoint=lambda s: (s[0]%6,s[1]%2,s[2]%2,s[3]%2)
counts=Counter(endpoint(x) for x in submitted)
assert sum(v-1 for v in counts.values())==3
assert len(set(endpoint(x) for x in native))==11
print('LINK CHECK: native 11 offsets differ from submitted; submitted has 3 duplicate endpoint offsets')

# Execute the synthetic construction's eigenvalues and compare momentum-sector structure with native Q157.
ks=float(0.15-80*np.pi/(1053*phi))/(1+(0.15-80*np.pi/(1053*phi))**2)
E0=np.sqrt(0.6816043198); En=np.sqrt(4.9855612829)
by_sector_synth={}
for t in range(6):
    for b in product((0,1),repeat=3):
        kvec=np.array([2*np.pi*t/6,*[np.pi*u for u in b]])
        d=np.array([np.exp(1j*np.dot(kvec,x))-1 for x in submitted]); d2=np.vdot(d,d).real
        Pt=np.eye(11,dtype=complex)-np.outer(d,d.conj())/d2 if d2>1e-12 else np.eye(11)
        ev,vc=np.linalg.eigh(Pt)
        v=vc[:,ev>0.5]
        isny=any(b)
        st=(-2+E0)*(-2+En) if isny else 1.5
        diag=np.ones(v.shape[1])*2.;
        if isny:diag[:2]=st
        block=v@np.diag(diag)@v.conj().T
        e=np.linalg.eigvalsh(block)
        by_sector_synth[(t,b)]=int(np.count_nonzero(e< -1e-9))
assert Counter(by_sector_synth.values())=={2:42,0:6}
# Original Q157: per time, spatial single-bit sectors have 4 negative; triple-bit 2; double-bit 0.
expected_q157=lambda b: 4 if sum(b)==1 else (2 if sum(b)==3 else 0)
mismatches=[(b,by_sector_synth[(0,b)],expected_q157(b)) for b in product((0,1),repeat=3) if by_sector_synth[(0,b)]!=expected_q157(b)]
assert len(mismatches)==6
assert sum(by_sector_synth.values())==84
print('HESSIAN CHECK: synthetic 84 negative modes are by-construction (2 in all 7 nonzero spatial sectors per t)')
print('HESSIAN CHECK: mismatching spatial patterns vs original Q157:',mismatches)

# Any predicted mixing set by user-selected rotation U and conjugation M=U D U^T
# is tautologically reproduced by diagonalization, absent a derived operator.
th=np.arcsin(phi**(-3)-2*np.sqrt((0.15-80*np.pi/(1053*phi))/81))
U=np.array([[np.cos(th),np.sin(th),0],[-np.sin(th),np.cos(th),0],[0,0,1]])
D=np.diag([.003,.2,4.18])
M=U@D@U.T
vals,vecs=np.linalg.eigh(M)
assert np.allclose(np.sort(vals),np.sort(np.diag(D)))
assert np.allclose(np.abs(vecs),np.abs(U),atol=1e-12) or np.allclose(np.abs(vecs),np.abs(U[:,[1,0,2]]),atol=1e-12)
print('MASS CHECK: M=U D U^T gives chosen diagonal masses and input mixing by spectral theorem')
print('INPUT CHECK: user script inputs measured 1.77686 GeV tau, 172.69 GeV top, 4.18 GeV bottom')
D=.15-80*np.pi/(1053*phi)
beta=np.sqrt(D/81)
p5=D**2/(1+D**2)
ratio_e=phi**-11-.2*beta*phi**-2
ratio_mu=phi**-6+(2/3)*beta
ratio_c=phi**-11-1.5*beta*phi**-2
ratio_s=phi**-8-(1/7)*beta
me=1.77686*ratio_mu*ratio_e*1e9
mnu3=2.5*me*p5**2
mnu2=mnu3*phi**-3*(1-phi**-4)
mnu1=mnu3*p5/(phi**4*(6-np.sqrt(5))*np.sqrt(5))
assert abs(ratio_e-.00460151063633024)<1e-12
assert abs(ratio_c-.001848837958307124)<1e-12
assert abs(mnu3-4.6631630692605686e-5)<1e-12
assert abs(mnu2-9.402154940745549e-6)<1e-12
print('MASS RECOMPUTATION: me/mu=',ratio_e,'mc/mt=',ratio_c,'mnu=[',mnu1,mnu2,mnu3,']')
print('INPUT CHECK: alpha 17572/1215 and gravity Delta**13 inserted, not differentiated from joined action')
print('AUDIT CERTIFICATE PASS: detected exact rank contradiction, nonnative topology, synthetic Hessian and input-angle/mass construction')
#!/usr/bin/env python3
"""Standalone prime URT finite-loop: one Gaussian vacuum, gauge-invariant site entropy."""
import mpmath as m
m.mp.dps=75
phi=(1+m.sqrt(5))/2
theta=2*m.pi/phi**2

def matrix(z):
    A=m.matrix(4)
    for i,j,w in [(0,1,1),(0,2,1),(1,3,z),(2,3,1)]:
        A[i,j]=w
        A[j,i]=m.conj(w)
    return 2*m.eye(4)-A

def eigenvalues(eps):
    F=theta if eps==1 else m.pi-theta
    return [2-2*m.cos(F/4),2-2*m.sin(F/4),2+2*m.sin(F/4),2+2*m.cos(F/4)]

def power(L,vals,alpha):
    identity=m.eye(4)
    out=m.zeros(4)
    for i,lam in enumerate(vals):
        projector=identity.copy()
        for j,mu in enumerate(vals):
            if i!=j:
                projector=projector*(L-mu*identity)/(lam-mu)
        out+=lam**alpha*projector
    return out

def reduced(L,vals,cut=(0,1)):
    W=power(L,vals,m.mpf('0.5'))
    V=power(L,vals,m.mpf('-0.5'))
    assert m.norm(W*W-L)<m.mpf('1e-65')
    assert m.norm(W*V-m.eye(4))<m.mpf('1e-65')
    w=m.matrix([[W[i,j] for j in cut] for i in cut])
    v=m.matrix([[V[i,j] for j in cut] for i in cut])
    WV=w*v
    t=m.re(WV[0,0]+WV[1,1])
    d=m.re(m.det(w)*m.det(v))
    discriminant=t**2-4*d
    assert discriminant>=-m.mpf('1e-65')
    nus=[m.sqrt((t+s*m.sqrt(max(discriminant,0)))/2)/2 for s in (1,-1)]
    assert min(nus)>=m.mpf('0.5')-m.mpf('1e-58')
    def h(nu):
        x=nu-m.mpf('0.5')
        if abs(x)<m.mpf('1e-57'):return m.mpf('0')
        return (x+1)*m.log(x+1)-x*m.log(x)
    return 2*sum(h(nu) for nu in nus),nus

def result(eps):
    c=eps*m.exp(-1j*theta)
    L=matrix(c); lam=eigenvalues(eps)
    assert all(x>0 for x in lam)
    F=theta if eps==1 else m.pi-theta
    energy=sum(m.sqrt(x) for x in lam)
    formula=2*((1+m.sqrt(2))*m.cos(F/8)+m.sin(F/8))
    assert abs(energy-formula)<m.mpf('1e-65')
    entropy,nu=reduced(L,lam)
    assert entropy>0
    U=m.diag([m.exp(1j*x) for x in [0,theta/7,theta/3,theta/2]])
    entropy_g,nu_g=reduced(U*L*U.H,lam)
    assert abs(entropy_g-entropy)<m.mpf('1e-64')
    assert max(abs(a-b) for a,b in zip(nu,nu_g))<m.mpf('1e-64')
    return energy,entropy,nu

P=result(1);M=result(-1)
assert P[0]>M[0] and P[1]<M[1]
assert abs(P[0]-M[0]-m.mpf('0.2109746055694190823233372376'))<m.mpf('1e-27')
for sign,v in [('+',P),('-',M)]:
    print('eps',sign,'E0',m.nstr(v[0],33),'S_A/k_B',m.nstr(v[1],33),
          'two symplectic nu',tuple(m.nstr(x,25) for x in v[2]))
print('Delta E/(hbar omega_0)',m.nstr(P[0]-M[0],36))
print('Delta S_A/k_B',m.nstr(P[1]-M[1],36))
print('PASS: spectral square roots, exact ZPE formula, Gaussian site entropy, local gauge invariance')
print('PHYSICAL STATUS: conditional canonical oscillator, no derived dark-energy scale')

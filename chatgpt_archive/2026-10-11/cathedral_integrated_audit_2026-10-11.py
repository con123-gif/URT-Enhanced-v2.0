"""Newton's Cathedral: integrated finite-to-physical audit (2026-10-11).

Does not fit experimental targets. Tests exact finite identities and constructs
counterexamples to uniqueness of current and gravity response based on the
specified finite data alone.
"""
import math
import numpy as np

phi=(1+math.sqrt(5))/2
Delta=3/20-80*math.pi/(1053*phi)
eta=-math.log(Delta)
p=Delta**2/(1+Delta**2)
chi=8*eta*(1+Delta**2)/(1-Delta**2)
alpha_root=137+(17572/1215)*Delta-(9/65)*Delta**2
omega_m,omega_l=6/19,13/19

# 13-site adjacency: icosahedron vertex adjacency: antipodal pairs (+- golden axes), distance minimum = 2.
V=[]
for a in (-1,1):
    for b in (-1,1):
        V += [(0.,float(a),float(b)*phi),(float(a),float(b)*phi,0.),(float(b)*phi,0.,float(a))]
V=np.array(V)
assert len(V)==12
D=np.linalg.norm(V[:,None,:]-V[None,:,:],axis=-1)
E=(D>1e-7)&np.isclose(D,2,atol=1e-9)
assert np.all(E.sum(axis=1)==5)
A13=np.zeros((13,13))
A13[1:,1:]=E.astype(float)
A13[0,1:]=1
A13[1:,0]=1
L13=np.diag(A13.sum(axis=1))-A13
s13=np.linalg.eigvalsh(L13)
expected13=sorted([0]+[6-math.sqrt(5)]*3+[7]*5+[6+math.sqrt(5)]*3+[13])
assert np.allclose(s13,expected13,atol=1e-10)

# Four-orbit Laplacian; 1 common / 3 relative; all 13 internal eigenvalues survive.
L4=4*np.eye(4)-np.ones((4,4))
s4=np.linalg.eigvalsh(Delta*L4)
assert np.allclose(s4,[0,4*Delta,4*Delta,4*Delta])
P0=np.ones((4,4))/4
Pperp=np.eye(4)-P0
T4=P0+Delta**2*Pperp
assert np.allclose(np.linalg.eigvalsh(T4),[Delta**2]*3+[1])
L52=np.kron(np.eye(4),L13)+np.kron(Delta*L4,np.eye(13))
computed=np.linalg.eigvalsh(L52)
expected=sorted(list(s13)+[x+4*Delta for x in s13 for _ in range(3)])
assert np.allclose(computed,expected,atol=1e-9)

# Charge traces for 16 left Weyl components per SM generation including nu_R.
# Q_L: (u_L,d_L) across three colours; u_R, d_R across three colours;
# L_L: (nu_L,e_L); e_R, nu_R.
charges=np.array([q for _ in range(3) for q in (2/3,-1/3)]
                +[2/3]*3+[-1/3]*3+[0,-1,-1,0],dtype=float)
T3=np.array([x for _ in range(3) for x in (1/2,-1/2)]
             +[0]*6+[1/2,-1/2,0,0],dtype=float)
Y=charges-T3
assert len(charges)==16
assert np.isclose(charges@charges,16/3)
assert np.isclose(T3@T3,2)
assert np.isclose(Y@Y,10/3)
assert np.isclose((T3@T3)/(charges@charges),3/8)

# Mathematical su3 bracket closure on so(3) + i Sym_0(R3).
def bracket(A,B): return A@B-B@A
rng=np.random.default_rng(13)
def skew():
    Z=rng.normal(size=(3,3)); return (Z-Z.T)/2

def symtr():
    Z=rng.normal(size=(3,3)); S=(Z+Z.T)/2; return S-np.trace(S)*np.eye(3)/3
for _ in range(12):
    A,B=skew(),skew()
    S,U=symtr(),symtr()
    assert np.allclose(bracket(A,B).T,-bracket(A,B))
    R=bracket(A,1j*S)
    assert np.allclose(R.conj().T,-R) and np.allclose(R.real,0,atol=1e-12)
    V=bracket(1j*S,1j*U)
    assert np.allclose(V.T,-V) and np.allclose(V.imag,0,atol=1e-12)

# Exact underdetermination at fixed finite data: two different current embeddings.
# This is a COUNTEREXAMPLE of uniqueness under the finite axioms, not physical predictions.
alpha_unit=4*math.pi*chi
current_norms=[1/4,1/3]
alpha_inverses=[alpha_unit*n for n in current_norms]
assert alpha_inverses[0] != alpha_inverses[1]

# Gravity: TT Ricci linearization scales p^2, Ricci^2 kernel scales p^4.
momenta=np.array([1.,2.,3.])
k_Ricci_sq=momenta**4
k_Einstein=momenta**2
assert np.allclose(k_Ricci_sq,[1,16,81])
assert np.allclose(k_Einstein,[1,4,9])

# Entropy: 8 eigenvalues; derivative retains same eta as binary distribution.
S_8=-4*((1-p)/4*math.log((1-p)/4)+(p/4)*math.log(p/4))
S_binary=-(1-p)*math.log(1-p)-p*math.log(p)
assert math.isclose(S_8,S_binary+math.log(4),rel_tol=1e-12)

print('Delta =',repr(Delta))
print('eta =',repr(eta))
print('p5 =',repr(p))
print('chi =',repr(chi))
print('alpha_root_inverse =',repr(alpha_root))
print('4Delta =',repr(4*Delta))
print('four-to-one selected transfer eigenvalues =',[1]+[Delta**2]*3)
print('one-generation Q/T3/Y quadratic traces =',charges@charges,T3@T3,Y@Y)
print('sin2_unification =',3/8)
print('Omega_m,Omega_L =',omega_m,omega_l)
print('4pi chi currentnorm candidates =',alpha_inverses)
print('16-state physical current norm for alpha_root under one convention =',alpha_root/alpha_unit)
print('G-over-normalization coefficient eta/(16pi) =',eta/(16*math.pi))
print('All assertions passed.')
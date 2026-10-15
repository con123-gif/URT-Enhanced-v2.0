"""Cathedral: exact complex 5+5 -> modular BKM carrier and Onsager split.

Run: python cathedral_complex_onsager_bridge.py (NumPy + SymPy required).
Dependencies: sibling cathedral_entanglement_spin2_exact.py and operator audit.
This script checks finite mathematical identities, NOT physical gravity.
"""
import numpy as np
from cathedral_entanglement_spin2_exact import P_v5, P_even, P_odd, W, C, DELTA, ETA, CHI
from cathedral_operator_audit import PHI, geometry

def frame(P, rank):
    eigenvalues,U=np.linalg.eigh(np.array(P,dtype=float))
    assert np.sum(eigenvalues>.5)==rank
    return U[:,eigenvalues>.5]

P5=np.array(P_v5,dtype=float)
Pe,Po=np.array(P_even,dtype=float),np.array(P_odd,dtype=float)
Wn,Cn=np.array(W,dtype=float),np.array(C,dtype=float)
Ue,Uo=frame(Pe,4),frame(Po,4)
J5=Cn@P5/np.sqrt(3)

def Phi(x):
    """Exact normalized real 5 -> 4x4 map in orthonormal hidden-quartet frames."""
    x=P5@x
    return Ue.T@(Pe@np.diag(Cn@x)@Wn@Po/np.sqrt(5))@Uo

def relative_entropy(rho,sigma):
    eigenvalues=np.linalg.eigvalsh(rho)
    assert eigenvalues.min()>0
    return float(np.dot(eigenvalues,np.log(eigenvalues))-
                 np.dot(np.diag(rho).real,np.log(np.diag(sigma))))

def test():
    v,edges,faces,(d0,d1,d2,d3),C=geometry()
    assert np.linalg.norm(J5.T@J5-P5)<1e-12
    assert np.linalg.norm((d2.T@d2-2*np.eye(20))@J5)<1e-12
    # e,y are two real vectors in the same 5D irrep; b=J5 y is on faces.
    e=P5[:,0]/np.linalg.norm(P5[:,0])*.6
    y=P5[:,1]/np.linalg.norm(P5[:,1])*.8
    b=J5@y
    assert np.linalg.norm(J5.T@b-y)<1e-12
    Z=Phi(e)+1j*Phi(J5.T@b)
    assert abs(np.linalg.norm(Z)**2-(np.dot(e,e)+np.dot(b,b)))<1e-12
    X=np.block([[np.zeros((4,4),complex),Z/np.sqrt(2)],
                [Z.conj().T/np.sqrt(2),np.zeros((4,4),complex)]])
    assert np.linalg.norm(X-X.conj().T)<1e-12
    assert abs(np.linalg.norm(X)**2-1)<1e-12
    a=1/(4*(1+DELTA**2))
    b0=DELTA**2/(4*(1+DELTA**2))
    sigma=np.diag([a]*4+[b0]*4)
    eps=2e-5
    rho=sigma+eps*X
    max_singular=np.sqrt(2*a*b0)
    assert eps*np.linalg.norm(Z,2)<max_singular
    D=relative_entropy(rho,sigma)
    singulars=np.linalg.svd(eps*Z,compute_uv=False)
    t=np.sqrt(((a-b0)/2)**2+singulars**2/2)
    plus,minus=(a+b0)/2+t,(a+b0)/2-t
    exact=np.dot(plus,np.log(plus))+np.dot(minus,np.log(minus))-4*(a*np.log(a)+b0*np.log(b0))
    assert abs(D-exact)<2e-13
    assert abs(D/(eps**2*CHI/2)-1)<.01
    # Global phase rotates electric/magnetic fiveplets. Its unitary
    # commutes with the modular reference: D invariant at ALL orders.
    for theta in [.1,.4,1.1]:
        U=np.diag([np.exp(1j*theta/2)]*4+[np.exp(-1j*theta/2)]*4)
        assert np.linalg.norm(U@sigma@U.conj().T-sigma)<1e-13
        assert abs(relative_entropy(U@rho@U.conj().T,sigma)-D)<2e-13
    # Dissipation breaks complex-linearity whenever shell and face
    # damping eigenvalues differ (6 vs 2).
    omega=2*np.pi/PHI**2
    Gamma=1.                         # illustrative rate; NOT derived
    de=-omega*y-6*Gamma*e
    dy= omega*e-2*Gamma*y
    psi=e+1j*y
    assert np.linalg.norm(de+1j*dy-((1j*omega-4*Gamma)*psi-2*Gamma*np.conj(psi)))<1e-12
    norm_derivative=2*(np.dot(e,de)+np.dot(y,dy))
    assert abs(norm_derivative+2*Gamma*(6*np.dot(e,e)+2*np.dot(y,y)))<1e-12
    eigenvalues=np.linalg.eigvals([[-6*Gamma,-omega],[omega,-2*Gamma]])
    assert np.allclose(np.sort_complex(eigenvalues),
      np.sort_complex(np.array([-4*Gamma+1j*np.sqrt(omega**2-4*Gamma**2),
                                -4*Gamma-1j*np.sqrt(omega**2-4*Gamma**2)])))
    # Under spatial inversion, both the vertex and face fiveplets are even.
    centroids=np.array([v[list(f)].sum(axis=0) for f in faces])
    Pinv=np.zeros((20,20))
    for k,c in enumerate(centroids):
        j=np.argmin(np.linalg.norm(centroids+c,axis=1))
        Pinv[k,j]=1
    assert np.linalg.norm(Pinv@J5-J5)<1e-12
    print("PASS finite complex 5+5 BKM embedding and density positivity")
    print("PASS exact relative-entropy singular-value formula / U(1) phase invariance")
    print("PASS Onsager damping breaks complex linearity with conjugate term")
    print("PASS both geometric fiveplets are even under icosahedral inversion")
    print("chi35 =",CHI," modular positivity threshold ||eps Z||op <",max_singular)
    print("D_exact =",D," D/D_BKMquadratic =",D/(eps**2*CHI/2))
    print("omega =",omega," oscillation threshold Gamma <",omega/2)
    print("Status: finite exact results; physical mobility and 4D Weyl parity OPEN")

if __name__=="__main__": test()

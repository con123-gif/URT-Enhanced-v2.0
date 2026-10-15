"""Newton's Cathedral / URT: reproducible operator audit, 2026-10-15.

This is an exact finite GEOMETRY / FESHBACH test, not a validated theory of
physical gravity or fermion flavour. No experimental values enter the operator.
Requires: numpy. Run: python cathedral_operator_audit.py
"""
from __future__ import annotations
import itertools
from collections import Counter
import numpy as np

TOL = 2e-10
PHI = (1 + np.sqrt(5.0)) / 2
DELTA = 3/20 - (80/81)*np.pi/(13*PHI)
ETA = -np.log(DELTA)
P5 = DELTA**2/(1 + DELTA**2)
CHI = 8*ETA*(1 + DELTA**2)/(1 - DELTA**2)


def geometry():
    """Icosahedral vertices, oriented edges/faces and chain boundary maps."""
    v = np.array([xyz for a,b in [(1,1),(1,-1),(-1,1),(-1,-1)]
                  for xyz in ((0,a,b*PHI), (a,b*PHI,0), (b*PHI,0,a))], float)
    edges = [(i,j) for i,j in itertools.combinations(range(12),2)
             if abs(np.linalg.norm(v[i]-v[j])-2.0) < 1e-9]
    edge_id = {e:i for i,e in enumerate(edges)}
    edge_set = set(edges)
    faces = []
    for i,j,k in itertools.combinations(range(12),3):
        if (i,j) in edge_set and (i,k) in edge_set and (j,k) in edge_set:
            n = np.cross(v[j]-v[i], v[k]-v[i])
            faces.append((i,j,k) if np.dot(n,v[i]+v[j]+v[k])>0 else (i,k,j))
    assert len(edges)==30 and len(faces)==20
    # R -> R^12 -> R^30 -> R^20 -> R; maps point toward lower-dimensional cells.
    d0=np.ones((1,12))                         # augmented vertex incidence
    d1=np.zeros((12,30))                       # oriented vertex-edge incidence
    for col,(i,j) in enumerate(edges):
        d1[i,col]=-1; d1[j,col]=1
    d2=np.zeros((30,20))                       # oriented edge-face incidence
    for col,(i,j,k) in enumerate(faces):
        for a,b in [(i,j),(j,k),(k,i)]:
            d2[edge_id[tuple(sorted((a,b)))],col]=(1 if a<b else -1)
    d3=np.ones((20,1))                         # boundary of oriented 3-cell
    C=np.zeros((20,12))                        # unsigned face-vertex incidence
    for row,face in enumerate(faces): C[row,list(face)]=1
    return v,edges,faces,(d0,d1,d2,d3),C


def dirac_64(boundaries):
    """H(-1)+H(0)+H(1)+H(2)+H(3) of sizes 1,12,30,20,1."""
    sizes=(1,12,30,20,1)
    offsets=np.cumsum((0,)+sizes)
    q=np.zeros((64,64))
    for i,d in enumerate(boundaries):
        lo,mid,hi=offsets[i],offsets[i+1],offsets[i+2]
        assert d.shape==(mid-lo,hi-mid)
        q[lo:mid,mid:hi]=d
        q[mid:hi,lo:mid]=d.T
    return q


def close_to_spectrum(actual, values_and_multiplicities, tol=TOL):
    target=np.concatenate([np.full(n,float(value)) for value,n in values_and_multiplicities])
    assert target.size == actual.size
    return float(np.max(np.abs(np.sort(target)-np.sort(actual))))


def supplied_numerical_gates():
    """Evaluate formulas AS WRITTEN in the pasted proposed closure."""
    z={'e':np.array([-3,-3,6]),'u':np.array([1,3,-4]),
       'd':np.array([1,-3,2]),'nu':np.array([-3,3,0])}
    nr_u=(z['u']@z['u'])/(z['e']@z['e'])
    nr_d=(z['d']@z['d'])/(z['e']@z['e'])
    beta=np.sqrt(DELTA/81)
    dt=-.5*np.log(P5/13)
    predictions={
       'inverse alpha':137+(17572/1215)*DELTA-(9/65)*DELTA**2,
       'weak sin^2 thetaW':3/8-(109/(48*np.pi))*(1/127.951)*dt*(5/3),
       'm_mu/m_tau': PHI**-4*(1-(13*1.437694/.549150)*DELTA*PHI**-2*1.24285),
       'm_e/m_mu':1.5*DELTA*(1+13*DELTA*PHI**2*(1-.138)),
       'm_c/m_t':PHI**-4*(nr_u/(4/3))*(1/(4*np.pi))*.968,
       'm_s/m_b':PHI**-2*nr_d*.2075,
       '|V_us|':np.sqrt(nr_d/(nr_u+nr_d))/PHI*(1+6*DELTA),
       '|V_cb|':PHI**-2*(nr_d/nr_u)*.2015,
       '|V_ub|':beta/PHI*1.076,
       'PMNS sin^2 theta12':(1/3)*(1-2.35*beta*14.2),
       'PMNS sin^2 theta23':.5+13*DELTA*np.sqrt(2),
       'PMNS sin^2 theta13':2*beta**2*13*PHI**3*6.535,
    }
    claimed={
       'inverse alpha':137.035999178,'weak sin^2 thetaW':.23122,
       'm_mu/m_tau':.059465,'m_e/m_mu':.004839,
       'm_c/m_t':.00406,'m_s/m_b':.0205,
       '|V_us|':.2251,'|V_cb|':.0415,'|V_ub|':.00368,
       'PMNS sin^2 theta12':.307,'PMNS sin^2 theta23':.546,
       'PMNS sin^2 theta13':.0220,
    }
    return predictions,claimed,z


def main():
    v,edges,faces,ds,C=geometry()
    d0,d1,d2,d3=ds
    assert np.allclose(d0@d1,0,atol=TOL)
    assert np.allclose(d1@d2,0,atol=TOL)
    assert np.allclose(d2@d3,0,atol=TOL)
    ranks=[int(np.linalg.matrix_rank(d)) for d in ds]
    assert ranks==[1,11,19,1]
    assert np.linalg.matrix_rank(C)==12
    L_face=d2.T@d2
    # A 20x20 3-regular dual dodecahedral graph Laplacian.
    assert np.allclose(np.diag(L_face),3)
    assert np.all(np.isin(np.unique(L_face),[-1,0,3]))
    eigval,U=np.linalg.eigh(L_face)
    h3=U[:,np.abs(eigval-3)<TOL]
    h5=U[:,np.abs(eigval-5)<TOL]
    hidden=np.column_stack((h3,h5))
    assert h3.shape==(20,4) and h5.shape==(20,4)
    assert np.linalg.norm(C.T@hidden)<TOL
    opp={i:int(np.argmin(np.linalg.norm(v+v[i],axis=1))) for i in range(12)}
    face_index={frozenset(face):i for i,face in enumerate(faces)}
    parity=np.zeros((20,20))
    for col,face in enumerate(faces):
        row=face_index[frozenset(opp[j] for j in face)]
        parity[row,col]=1
    assert np.linalg.norm(parity@h3+h3)<TOL
    assert np.linalg.norm(parity@h5-h5)<TOL
    assert np.linalg.norm(parity@L_face-L_face@parity)<TOL

    # Exact full 64-dimensional operator of the augmented cell chain.
    Q=dirac_64(ds)
    expected=[
        (+np.sqrt(12),1),(+np.sqrt(20),1),
        (+np.sqrt(5-np.sqrt(5)),3),(+np.sqrt(6),5),(+np.sqrt(5+np.sqrt(5)),3),
        (+np.sqrt(3-np.sqrt(5)),3),(+np.sqrt(2),5),(+np.sqrt(3),4),
        (+np.sqrt(5),4),(+np.sqrt(3+np.sqrt(5)),3),
    ]
    full_expected=expected+[(-val,count) for val,count in expected]
    spectral_res=close_to_spectrum(np.linalg.eigvalsh(Q),full_expected)
    assert spectral_res<TOL
    # A parameter-free positive contraction, distinct from the unproved physical T_star.
    transfer=Q.T@Q/20.0
    transfer_eigs=np.linalg.eigvalsh(transfer)
    assert min(transfer_eigs)>0 and max(transfer_eigs)<1+TOL
    assert abs(min(transfer_eigs)-(3-np.sqrt(5))/20)<TOL

    # Exact Feshbach reduction onto augmentation + 12 vertices.
    A=Q[:13,:13]; B=Q[:13,13:]; D=Q[13:,13:]
    Lico=d1@d1.T
    shell_eigs=np.linalg.eigvalsh(Lico)
    shell_expected=[(0,1),(5-np.sqrt(5),3),(6,5),(5+np.sqrt(5),3)]
    assert close_to_spectrum(shell_eigs,shell_expected)<TOL
    # On the visible 3 + 3' sectors the chain Dirac has no mixing.
    # Each threefold scalar pencil is z - lambda/z.
    z=1.2345
    F_exact=z*np.eye(13)-A-B@np.linalg.solve(z*np.eye(51)-D,B.T)
    target=z*np.eye(13)-A
    target[1:,1:]-=Lico/z
    feshbach_res=float(np.linalg.norm(F_exact-target))
    assert feshbach_res<TOL
    sign64,logdet64=np.linalg.slogdet(z*np.eye(64)-Q)
    sign51,logdet51=np.linalg.slogdet(z*np.eye(51)-D)
    sign13,logdet13=np.linalg.slogdet(F_exact)
    determinant_res=abs(logdet64-(logdet51+logdet13))
    assert sign64==sign51*sign13 and determinant_res<TOL

    predictions,claimed,zwords=supplied_numerical_gates()
    gram=np.stack(list(zwords.values()))@np.stack(list(zwords.values())).T
    entropy=-P5*np.log(P5)-(1-P5)*np.log(1-P5)
    chi_br=13/CHI  # ASSUMED prescription in supplied document; not from coframe metric
    dp_dlnA_assumed=-2*ETA*chi_br*P5*(1-P5)
    area_lock_assumed=4*ETA**2*chi_br*P5*(1-P5)
    # Alternative scale-covariant geometric Laplacian L(A)=(A0/A)*L(A0)
    dp_dlnA_inverse_area=+2*ETA*P5*(1-P5)
    area_lock_inverse_area=4*ETA**2*P5*(1-P5)

    print('NEWTON\'S CATHEDRAL / URT — INDEPENDENT OPERATOR AUDIT')
    print('VERIFIED FINITE GEOMETRY')
    print(f'  V/E/F={len(v)}/{len(edges)}/{len(faces)}; rank(C)={np.linalg.matrix_rank(C)}; hidden dim={hidden.shape[1]}')
    print(f'  Hidden face eigenvalues: 3 (x4), 5 (x4); antipodal parity -1, +1')
    print(f'  Chain ranks={ranks}, boundary compositions=0')
    print(f'  H64 = 1 + 12 + 30 + 20 + 1; spectral residual={spectral_res:.3e}')
    print('  A5(H64) = 4*(1 + 3 + 3prime + 4 + 5)')
    print('  A5(H51) = 2*1 + 3*(3 + 3prime) + 4*4 + 3*5')
    print(f'  H13 Schur residual={feshbach_res:.3e}; logdet residual={determinant_res:.3e}')
    print(f'  Candidate positive transfer Q^T Q/20 has spectrum in [{min(transfer_eigs):.10f}, {max(transfer_eigs):.10f}]')
    print('MASTER STATE (arithmetic, not physical calibration)')
    print(f'  Delta={DELTA:.15f}, eta={ETA:.12f}, p5={P5:.12g}, chi35={CHI:.12f}')
    print(f'  full Gibbs entropy = log(4) + H2(p5) = {np.log(4)+entropy:.12f}')
    print('AREA SUSCEPTIBILITY: DEPENDS ON UNFIXED COFRAME MAP')
    print(f'  suggested chi_br=13/chi35={chi_br:.12f} [additional prescription]')
    print(f'  prescribed d(p5)/d(ln A)={dp_dlnA_assumed:.12g}')
    print(f'  prescribed A0/(4 ellP^2)={area_lock_assumed:.12g}')
    print(f'  alternative L~1/A gives d(p5)/d(ln A)={dp_dlnA_inverse_area:.12g}')
    print(f'  alternative A0/(4 ellP^2)={area_lock_inverse_area:.12g}')
    print('CHARGE-WORD GRAM MATRIX (rows e,u,d,nu):')
    print(gram)
    print('SUPPLIED SCALAR FORMULAS VS THE VALUES CLAIMED IN THE PASTED TABLE')
    for key,val in predictions.items():
        print(f'  {key:<22} computed={val:>15.9g}  stated={claimed[key]:>15.9g}  delta={val-claimed[key]:+.6g}')
    print('\nINTERPRETATION: geometric tests pass; gravity normalization and species-dependent')
    print('mass/mixing are not derived by this operator audit. The above scalar formulas')
    print('contain coefficients supplied without operator derivations.')


if __name__=='__main__':
    main()
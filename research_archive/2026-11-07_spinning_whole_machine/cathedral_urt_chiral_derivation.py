#!/usr/bin/env python3
"""Newton's Cathedral: geometry-derived chiral URT bridge.

Reproduces a chiral two-step-turn matrix for the five Platonic solids,
certifies exact integer matrix identities for the icosahedral hidden
sector, and verifies the finite URT spiral/heat transfer contraction.

Dependencies: numpy, scipy, sympy. The geometry identities are exact integer checks;
operator norms use double precision. This defines and tests a *candidate*
URT dynamics. It is not a derivation of the Standard Model or gravity.
"""
import math
import numpy as np
from scipy.sparse.csgraph import shortest_path
from scipy.linalg import null_space
import sympy as sp
from itertools import product
from scipy.spatial import ConvexHull


PHI = (1 + math.sqrt(5))/2
DELTA = 3/20 - 80*math.pi/(1053*PHI)
ETA = -math.log(DELTA)
THETA = 2*math.pi / PHI**2
GAIN = math.pi / math.e

SOLIDS = {
    "tetrahedron": np.array([v for v in product((-1,1), repeat=3)
                              if np.prod(v) > 0], dtype=float),
    "cube": np.array(list(product((-1,1), repeat=3)), dtype=float),
    "octahedron": np.array([sgn * np.eye(3)[j] for j in range(3)
                             for sgn in (-1,1)], dtype=float),
    "dodecahedron": np.array(
        list(product((-1,1),repeat=3))
        + [[0,a/PHI,b*PHI] for a,b in product((-1,1),repeat=2)]
        + [[a/PHI,b*PHI,0] for a,b in product((-1,1),repeat=2)]
        + [[a*PHI,0,b/PHI] for a,b in product((-1,1),repeat=2)],
        dtype=float),
    "icosahedron": np.array(
        [[0,a,b*PHI] for a,b in product((-1,1),repeat=2)]
        + [[a,b*PHI,0] for a,b in product((-1,1),repeat=2)]
        + [[a*PHI,0,b] for a,b in product((-1,1),repeat=2)],
        dtype=float),
}


def cellular_data(points):
    """Identify polygonal faces of convex hull and build signed boundaries."""
    hull = ConvexHull(points)
    groups = {}
    for simplex, equation in zip(hull.simplices, hull.equations):
        groups.setdefault(tuple(np.round(equation, 8)), set()).update(simplex.tolist())

    faces = []
    for normal_and_offset, corner_set in groups.items():
        corners = list(corner_set)
        centre = points[corners].mean(axis=0)
        normal = np.asarray(normal_and_offset[:3])
        e1 = points[corners[0]] - centre
        e1 /= np.linalg.norm(e1)
        e2 = np.cross(normal, e1)
        corners = sorted(corners,
                         key=lambda i: math.atan2(np.dot(points[i]-centre,e2),
                                                  np.dot(points[i]-centre,e1)))
        faces.append(corners)

    edges = sorted({tuple(sorted((face[j], face[(j+1)%len(face)])))
                    for face in faces for j in range(len(face))})
    eid = {edge:j for j,edge in enumerate(edges)}
    V,E,F = len(points),len(edges),len(faces)
    b1 = np.zeros((V,E),dtype=int)
    b2 = np.zeros((E,F),dtype=int)
    C = np.zeros((F,V),dtype=int)
    for j,(a,b) in enumerate(edges):
        b1[a,j]=-1
        b1[b,j]=+1
    for j,face in enumerate(faces):
        for v in face:
            C[j,v]=1
        for k in range(len(face)):
            a,b=face[k],face[(k+1)%len(face)]
            b2[eid[tuple(sorted((a,b)))],j] = +1 if a<b else -1
    assert np.array_equal(b1@b2,np.zeros((V,F),dtype=int))
    L0=b1@b1.T
    L1=b1.T@b1+b2@b2.T
    L2=b2.T@b2
    D=np.block([[np.zeros((V,V),dtype=int),b1,np.zeros((V,F),dtype=int)],
                [b1.T,np.zeros((E,E),dtype=int),b2],
                [np.zeros((F,V),dtype=int),b2.T,np.zeros((F,F),dtype=int)]])
    return V,E,F,C,L0,L1,L2,D


def assert_close(x,y,atol=1e-8):
    assert np.allclose(x,y,atol=atol,rtol=0),(x,y)




def oriented_two_step_turns(points):
    V, E, F, C, L0, L1, L2, D = cellular_data(points)
    face_size = C.sum(axis=1).astype(int)
    assert len(set(face_size)) == 1
    centers = (C @ points) / face_size[:, None]
    degree = int(L2[0, 0])
    adjacency = degree * np.eye(F, dtype=int) - L2
    assert (adjacency >= 0).all()
    distance = shortest_path(adjacency, directed=False, unweighted=True)
    K = np.zeros((F, F), dtype=int)
    for i in range(F):
        for j in range(F):
            if distance[i, j] != 2:
                continue
            intermediates = np.flatnonzero((adjacency[i] > 0) & (adjacency[:, j] > 0))
            for k in intermediates:
                orientation = float(np.linalg.det(np.array([centers[i], centers[k], centers[j]])))
                if abs(orientation) > 1e-9:
                    K[i, j] += 1 if orientation > 0 else -1
    assert np.array_equal(K + K.T, np.zeros_like(K))
    return C, L2, K, centers


def main():
    summaries = []
    for name, points in SOLIDS.items():
        C, L, K, centers = oriented_two_step_turns(points)
        summaries.append((name, K.shape[0], np.linalg.matrix_rank(K),
                          np.count_nonzero(K)))
        if name == 'icosahedron':
            C_ico, L_ico, K_ico = C, L, K
    print('All five solids: faces, rank of geometric K, nonzero K entries')
    for row in summaries:
        print('%-12s %2d %2d %3d' % row)
    assert [r[2] for r in summaries] == [0, 0, 0, 0, 8]

    # Exact integer identities (no eigensolver tolerances involved).
    K = K_ico
    C = C_ico
    L = L_ico
    F = K.shape[0]
    I = np.eye(F, dtype=int)
    zero = np.zeros_like(K)
    poly = L @ (L - 2 * I) @ (L @ L - 6 * L + 4 * I)
    assert np.array_equal(K.T, -K)
    assert np.array_equal(C.T @ K, np.zeros((C.shape[1], F), dtype=int))
    assert np.array_equal(K @ K, poly)
    assert np.array_equal(K @ (L - 4 * I) + (L - 4 * I) @ K, zero)
    assert np.linalg.matrix_rank(K) == 8
    assert np.linalg.matrix_rank(C) == 12
    print('\nEXACT: K^2 = L(L-2I)(L^2-6L+4I)')
    print('EXACT: C^T K = 0; {K,L-4I}=0; rank(K)=8')

    # In the known icosahedral face spectrum, the polynomial equals -15
    # on the 3/5 eigenspaces and vanishes on all other eigenspaces.
    P = (-K @ K) / 15.0
    assert np.allclose(P @ P, P, atol=1e-14)
    assert np.allclose(P, I - C @ np.linalg.solve(C.T @ C, C.T), atol=1e-13)
    J = K / math.sqrt(15)
    assert np.allclose(J @ J, -P, atol=1e-14)
    assert np.allclose(J.T, -J, atol=1e-14)

    P3 = P @ (5 * I - L) / 2
    P5 = P @ (L - 3 * I) / 2
    assert np.allclose(P3 @ P3, P3, atol=1e-14)
    assert np.allclose(P5 @ P5, P5, atol=1e-14)
    assert np.allclose(P3 + P5, P, atol=1e-14)
    assert np.allclose(J @ P3, P5 @ J, atol=1e-14)
    assert np.allclose(J @ P5, P3 @ J, atol=1e-14)
    print('EXACT/PROJECTOR: J^2=-P_hidden; J swaps rank-four 3 and 5 sectors')

    # Antipodal parity test: rotation-even/odd sectors cannot be mixed by
    # physical rigid rotation alone. Chiral K is parity-odd.
    centers = oriented_two_step_turns(SOLIDS['icosahedron'])[3]
    opposite = [int(np.argmin(np.linalg.norm(centers + c, axis=1))) for c in centers]
    inversion = np.eye(F)[opposite]
    assert np.allclose(inversion @ J + J @ inversion, 0, atol=1e-14)
    assert np.allclose(inversion @ P3, -P3, atol=1e-14)
    assert np.allclose(inversion @ P5, P5, atol=1e-14)
    print('PARITY: H_3 odd; H_5 even; J reverses parity')

    # Canonical *chosen* real representation of original complex phase q
    # through the geometry-derived imaginary unit J.
    s = DELTA ** (1 / 12)
    U = math.cos(THETA) * P + math.sin(THETA) * J
    Droot = P3 + s * P5
    A = GAIN * U @ Droot
    assert np.allclose(U.T @ U, P, atol=1e-14)
    A24 = np.linalg.matrix_power(A, 24)
    eig = np.linalg.eigvals(A)
    nonzero = eig[np.abs(eig) > 1e-8]
    radius = float(np.max(abs(nonzero)))
    norm24 = float(np.linalg.norm(A24, 2))
    assert len(nonzero) == 8
    assert np.isclose(radius, GAIN * DELTA ** (1/24), atol=1e-13)
    assert np.isclose(norm24, 0.115222499583, atol=1e-10)
    print('\nURT: theta=%.12f degrees, pi/e=%.12f, delta=%.15f' %
          (THETA * 180/math.pi, GAIN, DELTA))
    print('Chiral mixed 24-step spectral radius %.12f, norm %.12f' % (radius, norm24))
    print('Four-Lipschitz contraction constant %.12f' % (4 * norm24))

    # The Gibbs selection state is the static heat kernel conditioned on
    # hidden-sector selection. Mixing is a *different*, noncommuting process.
    rho = (P3 + DELTA**2 * P5) / (4*(1+DELTA**2))
    assert np.isclose(np.trace(rho), 1)
    commutator_norm = float(np.linalg.norm(J@rho - rho@J, 'fro'))
    assert commutator_norm > 0.7
    print('Gibbs state Tr(rho)=%.12f; ||[J,rho]||_F=%.12f' %
          (np.trace(rho), commutator_norm))
    print('NOTE: heat selection and chiral mixing are not the same transfer.')

    # Exact H8 x H8 -> H13 quadratic response. Its 12 vertex entries
    # arise from hidden face products and the centre/radial entry from
    # the difference of Laplacian sectors. Rank 13 produces kernel 51.
    H_rat = sp.Matrix.hstack(*sp.Matrix(C.T).nullspace())
    L_rat = sp.Matrix(L)
    C_rat = sp.Matrix(C)
    symcols=[]
    for i in range(8):
        for j in range(i, 8):
            hi,hj=H_rat[:,i],H_rat[:,j]
            vertex=C_rat.T*(hi.multiply_elementwise(hj))
            radial=(hi.T*(L_rat-4*sp.eye(F))*hj)[0]
            symcols.append(vertex.col_join(sp.Matrix([radial])))
    Bsym = sp.Matrix.hstack(*symcols)
    assert Bsym[:12,:].rank()==12 and Bsym.rank()==13
    print('EXACT: Sym^2(H8) (dim 36) -> 12 vertices rank 12,')
    print('       plus one independent centre rank 13; symmetric kernel 23.')
    print('       exterior square dim 28, full tensor kernel 23+28=51.')

    # Exact visible/hidden chiral coupling on the H8 x H8 carrier.
    # The 13 visible response matrices are symmetric operators on H8;
    # the chiral phase acts by M -> [K,M]. Use integer-scaled
    # matrices N = K^2 M K^2 to avoid all floating-point arithmetic.
    K_rat=sp.Matrix(K)
    S_rat=K_rat*K_rat
    N_mats=[]
    for v in range(12):
        diag_v=sp.diag(*[int(C[i,v]) for i in range(20)])
        N_mats.append(S_rat*diag_v*S_rat)
    N_mats.append(S_rat*(L_rat-4*sp.eye(20))*S_rat)
    comms=[K_rat*N-N*K_rat for N in N_mats]
    Gram=sp.Matrix(13,13,lambda i,j:sp.trace(N_mats[i]*N_mats[j]))
    Coupling=sp.Matrix(13,13,
        lambda i,j:sp.trace(comms[i].T*comms[j])/15)
    assert Gram.rank()==13 and Coupling.rank()==6
    assert all(sp.trace(N_mats[i]*comms[j])==0
               for i in range(13) for j in range(13))
    spectrum=(Gram.inv()*Coupling).eigenvals()
    assert spectrum=={sp.Rational(64,17):5,sp.Integer(4):1,sp.Integer(0):7},spectrum
    print('EXACT: P13 Q P13=0, Q=J tensor I + I tensor J.')
    print('EXACT: visible second-order hidden-mediated spectrum:')
    print('       4 (1x), 64/17 (5x), 0 (7x).')

    # Hodge boundary-of-boundary and discrete Maxwell-gauge invariance
    # on all five Platonic two-spheres; curvature is d a.
    total_E=total_F=0
    gauss_total=0.0
    for name,points in SOLIDS.items():
        V,E,Fp,Cp,L0,L1,L2,D=cellular_data(points)
        b1=D[:V,V:V+E]
        b2=D[V:V+E,V+E:]
        assert np.array_equal(b1@b2,np.zeros((V,Fp),dtype=int))
        a=np.arange(1,E+1,dtype=float)/7
        alpha=np.arange(1,V+1,dtype=float)/11
        f0=b2.T@a
        f1=b2.T@(a+b1.T@alpha)
        assert np.array_equal(np.round(f0,10),np.round(f1,10))
        face_sides=int(Cp.sum(axis=1)[0])
        degree=int(np.diag(D[:V,V:V+E]@D[V:V+E,:V])[0]) if False else (2*E//V)
        deficit=2*math.pi-degree*(face_sides-2)*math.pi/face_sides
        gauss_total+=V*deficit
        total_E+=E;total_F+=Fp
    assert total_E==90 and total_F==50
    assert np.isclose(gauss_total,20*math.pi,atol=1e-12)
    print('EXACT: 90-edge lattice U(1) f=d a is gauge invariant (d^2=0).')
    print('EXACT: all-five total Regge angle deficit = 20*pi (five S^2).')
    print('\nPASS: full five-solid geometric selection + chiral 3-5 lift + stability.')


if __name__ == '__main__':
    main()

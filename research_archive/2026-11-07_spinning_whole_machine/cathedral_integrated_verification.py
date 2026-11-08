#!/usr/bin/env python3
"""Newton's Cathedral: independently reproducible five-solid spectral and URT checks.

Dependencies: numpy, scipy. This verifies geometry and a defined URT-inspired
selection/controller model; it does not purport to derive observed physics.
"""
from itertools import product
import math
import numpy as np
from scipy.spatial import ConvexHull
from scipy.linalg import null_space, block_diag

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


def main():
    print("FIVE-PLATONIC HODGE / INCIDENCE CHECK")
    hodge_trace2=hodge_trace4=hodge_dim=hodge_kernel=0
    incidence_face_hidden=incidence_vertex_hidden=0
    ladder=[]
    ico_basis=ico_C=None
    for name,points in SOLIDS.items():
        V,E,F,C,L0,L1,L2,D=cellular_data(points)
        hodge_dim+=V+E+F
        D2=D@D
        hodge_trace2+=int(np.trace(D2))
        hodge_trace4+=int(np.trace(D2@D2))
        hodge_kernel+=int((np.abs(np.linalg.eigvalsh(D))<1e-8).sum())
        rank=int(np.linalg.matrix_rank(C))
        incidence_face_hidden+=F-rank
        incidence_vertex_hidden+=V-rank
        H=null_space(C.T, rcond=1e-10)
        eig=np.linalg.eigvalsh(H.T@L2@H) if H.shape[1] else np.array([])
        ladder.extend(eig.tolist())
        assert_close(L2@(H),H@(H.T@L2@H))
        print(f"{name:12s}: VEF={V:2d},{E:2d},{F:2d}; "
              f"rank(C)={rank:2d}; face hidden="
              f"{F-rank:2d}, vertex hidden={V-rank:2d}; "
              f"L(face hidden)={np.round(eig,9).tolist()}")
        if name=="icosahedron":
            ico_basis=H
            ico_C=C
            # The dual face graph is the dodecahedral vertex graph.
            A_dual=3*np.eye(F)-L2
            assert_close(C@C.T,A_dual@(A_dual+2*np.eye(F)))

    assert (hodge_dim,hodge_trace2,hodge_trace4,hodge_kernel)==(190,720,3456,10)
    assert (incidence_face_hidden,incidence_vertex_hidden)==(14,14)
    assert_close(np.sort(ladder),[3]*4+[4]*3+[5]*4+[6]*3)
    print(f"Hodge: dim {hodge_dim}, Tr D^2 {hodge_trace2}, "
          f"Tr D^4 {hodge_trace4}, nullity {hodge_kernel}")
    print(f"Incidence: {incidence_face_hidden} face + "
          f"{incidence_vertex_hidden} vertex hidden = 28")

    # A quadratic map from symmetric hidden face pairs to visible vertices.
    Q=np.stack([ico_C.T@(ico_basis[:,i]*ico_basis[:,j])
                for i in range(8) for j in range(i,8)],axis=1)
    assert Q.shape==(12,36) and np.linalg.matrix_rank(Q,tol=1e-8)==12
    print("Quadratic hidden->visible rank: 12 / 36; kernel dimension: 24")

    # Transfer on the 14 geometrically constrained face modes.
    Z=4+3*DELTA+4*DELTA**2+3*DELTA**3
    print(f"delta={DELTA:.15g}, eta={ETA:.15g}")
    print("Least-resistance thermal weights by level: ")
    for level,multiplicity in [(3,4),(4,3),(5,4),(6,3)]:
        print(f"  lambda={level}: {multiplicity} states, "
              f"total probability={multiplicity*DELTA**(level-3)/Z:.12g}")
    print(f"Z_14={Z:.15g}, icosahedral ground mass={4/Z:.12g}")

    # Positive transfer T=B^T B and 24-step golden-angle mixing.
    s=DELTA**(1/12)
    rotation=np.array([[math.cos(THETA),-math.sin(THETA)],
                       [math.sin(THETA), math.cos(THETA)]])
    A2=GAIN*rotation@np.diag([1,s])
    A14=block_diag(*([A2]*4),
                   np.eye(3)*(GAIN*math.exp(-ETA/24)),
                   np.eye(3)*(GAIN*math.exp(-3*ETA/24)))
    cycle=np.linalg.matrix_power(A14,24)
    cycle_norm=np.linalg.norm(cycle,2)
    spectral_radius=max(abs(np.linalg.eigvals(A14)))
    assert_close(spectral_radius,GAIN*DELTA**(1/24),atol=1e-10)
    assert cycle_norm < 0.25
    print(f"One-stage spectral radius={spectral_radius:.12g}; "
          f"24-stage operator norm={cycle_norm:.12g}")
    print(f"Four-Lipschitz chaotic-map contraction bound={4*cycle_norm:.12g}")
    print(f"24-stage extra coupling norm margin={0.25-cycle_norm:.12g}")

    x0=np.linspace(.03,.97,14)
    x=x0.copy()
    for step in range(6):
        print(f"Nonlinear logistic-control cycle {step}: "
              f"distance to 3/4 = {np.linalg.norm(x-.75):.12g}")
        clipped=np.clip(x,0,1)
        x=.75+cycle@(4*clipped*(1-clipped)-.75)

    # Spherical 5-design group-average identity, sixth-order test.
    U=SOLIDS['icosahedron'] / np.linalg.norm(SOLIDS['icosahedron'],axis=1,keepdims=True)
    all_unit=np.concatenate([P / np.linalg.norm(P,axis=1,keepdims=True)
                             for P in SOLIDS.values()])
    dots=all_unit@U.T
    P6=(231*dots**6-315*dots**4+105*dots**2-5)/16
    degree6_residual=P6.mean()
    assert_close(degree6_residual,5489/90000,atol=1e-12)
    print(f"Sixth-order angular residual (canonical alignment) "
          f"= {degree6_residual:.12g} = 5489/90000")

    # Whole-Cathedral factor dimensions and N-throat normalization.
    assert 190*64*24==291840
    print("Full Cathedral carrier dim=190*64*24*N=291840*N")
    print("Constrained hidden carrier dim=14*64*24*N=21504*N")
    print(f"N-throat crossover N*={1+DELTA**-2:.12g}")
    print("PASS: all independent geometry, transfer, and stability checks")

if __name__=="__main__":
    main()

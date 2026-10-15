"""Newton's Cathedral / URT: full 125-simplex circumcentric DEC and 64-loop audit.

Self-contained, NumPy only. Run:
    python cathedral_125_circumcentric_audit.py

Purpose: distinguish combinatorial identities, a deliberately ASSUMED Hodge
weight model, and Hodge weights computed from actual circumcentric dual cells.
The test uses the unique two-length orbit family of identical icosahedral-cone
tetrahedra, with shell edge l(t)=2 exp(t/2) and tetrahedral altitude
h(t)=h(0) exp(-t): total piecewise-flat 3-volume exactly constant.
For nonzero t the 20 tetrahedra generally have cone-angle defects around
internal edges; do not interpret the deformed cells as a globally Euclidean
regular icosahedron with a common Euclidean centre.
"""
from __future__ import annotations
import itertools
import numpy as np
from numpy.linalg import eigh, norm, svd

PHI=(1+np.sqrt(5.0))/2
DELTA=3/20-(80/81)*np.pi/(13*PHI)
ETA=-np.log(DELTA)
P5=DELTA**2/(1+DELTA**2)
TOL=2e-10


def geometry():
    def coords(k):
        return np.array([v for a,b in itertools.product((1,-1),repeat=2)
             for v in ((0,a,b*k),(a,b*k,0),(b*k,0,a))],float)
    v=coords(PHI);vc=coords(-1/PHI)
    edges=[(i,j) for i,j in itertools.combinations(range(12),2)
           if abs(norm(v[i]-v[j])-2)<1e-8]
    eset=set(edges)
    faces=[]
    for i,j,k in itertools.combinations(range(12),3):
        if (i,j) in eset and (j,k) in eset and (i,k) in eset:
            normal=np.cross(v[j]-v[i],v[k]-v[i])
            faces.append((i,j,k) if normal@(v[i]+v[j]+v[k])>0 else (i,k,j))
    assert (len(edges),len(faces))==(30,20)
    ei={e:p for p,e in enumerate(edges)}
    d1=np.zeros((12,30));d2=np.zeros((30,20));C=np.zeros((20,12))
    for col,(i,j) in enumerate(edges):d1[i,col]=-1;d1[j,col]=1
    for col,(i,j,k) in enumerate(faces):
        C[col,[i,j,k]]=1
        for a,b in [(i,j),(j,k),(k,i)]:
            d2[ei[tuple(sorted((a,b)))],col]=1 if a<b else -1
    assert norm(d1@d2)==0
    return v,vc,edges,faces,d1,d2,C


def complete_tetrahedral_ball(faces):
    tetra=[(0,)+tuple(sorted(a+1 for a in f)) for f in faces]
    edges=sorted({e for t in tetra for e in itertools.combinations(t,2)})
    tris=sorted({f for t in tetra for f in itertools.combinations(t,3)})
    eidx={e:i for i,e in enumerate(edges)}
    fidx={f:i for i,f in enumerate(tris)}
    b1=np.zeros((13,42));b2=np.zeros((42,50));b3=np.zeros((50,20))
    for j,(a,b) in enumerate(edges): b1[a,j]=-1;b1[b,j]=1
    for j,f in enumerate(tris):
        for k in range(3):b2[eidx[f[:k]+f[k+1:]],j]=(-1)**k
    for j,t in enumerate(tetra):
        for k in range(4):b3[fidx[t[:k]+t[k+1:]],j]=(-1)**k
    assert norm(b1@b2)<TOL and norm(b2@b3)<TOL
    return b1,b2,b3,edges,tris,tetra


def circumcenter(points):
    pts=np.asarray(points,float)
    assert len(pts) in (3,4)
    v0=pts[0]; delta=pts[1:]-v0
    mat=2*delta
    rhs=np.array([p@p-v0@v0 for p in pts[1:]])
    if len(pts)==3:
        n=np.cross(delta[0],delta[1]);mat=np.vstack([mat,n])
        rhs=np.r_[rhs,n@v0]
    return np.linalg.solve(mat,rhs)


def actual_circumcentric_stars(t):
    """Primal/dual measures of BOTH simplex orbits, via circumcentre flags.

    Internal radial 1-edges: 5 incident tetrahedra, 2 flags per tet.
    Boundary shell 1-edges: 2 tetrahedra, 2 flags per tet.
    Internal radial 2-faces: 2 incident tetrahedra.
    Boundary shell 2-faces: 1 incident tetrahedron.
    All relevant circumcentre triangles have positive signs near t=0.
    """
    l=2*np.exp(t/2)
    h0=np.sqrt(1+PHI**2-4/3)
    h=h0*np.exp(-t)
    rad=l/np.sqrt(3)
    origin=np.zeros(3)
    v=np.array([[rad*np.cos(q),rad*np.sin(q),h]
                for q in [0,2*np.pi/3,4*np.pi/3]])
    ct=circumcenter(np.vstack((origin,v)))
    csh=circumcenter(v)
    cr01=circumcenter([origin,v[0],v[1]])
    cr20=circumcenter([origin,v[2],v[0]])
    smid=(v[0]+v[1])/2
    rmid=v[0]/2
    def flag_area(p,q,r):return norm(np.cross(q-p,r-p))/2
    dual_shell_edge=2*(flag_area(smid,csh,ct)+flag_area(smid,cr01,ct))
    dual_rad_edge=5*(flag_area(rmid,cr01,ct)+flag_area(rmid,cr20,ct))
    dual_shell_face=norm(ct-csh)
    dual_rad_face=2*norm(ct-cr01)
    A_sh=norm(np.cross(v[1]-v[0],v[2]-v[0]))/2
    A_rad=norm(np.cross(v[0],v[1]))/2
    return {
        'primal_edge_shell':l,'primal_edge_radial':norm(v[0]),
        'primal_face_shell':A_sh,'primal_face_radial':A_rad,
        'dual_edge_shell':dual_shell_edge,'dual_edge_radial':dual_rad_edge,
        'dual_face_shell':dual_shell_face,'dual_face_radial':dual_rad_face,
        'inverse_star1_shell':l/dual_shell_edge,
        'inverse_star1_radial':norm(v[0])/dual_rad_edge,
        'inverse_star2_shell':A_sh/dual_shell_face,
        'inverse_star2_radial':A_rad/dual_rad_face,
        'total_volume':20*A_sh*h/3,
        'h':h,'x':(l/h)**2,
    }


def analytic_circumcentric_stars(t):
    """Independent exact algebraic forms from equilateral cone tetra geometry."""
    s=actual_circumcentric_stars(t)
    h=s['h'];x=s['x']
    return np.array([
        6*np.sqrt(3)*(12+x)/(h*(27-3*x-x*x)),
        3*np.sqrt(3)*h*x/(2*(3-x)),
        np.sqrt(3)*h*(12+x)/(4*(3+x))
    ])


def actual_rayleigh(lam,t):
    s=actual_circumcentric_stars(t)
    # For the EXACT hidden lift J=[h; (1/lam)d2 h],
    # b2 J has only shell-edge components (1+1/lam)d2 h.
    # This is the user's proposed (inverse-star2)-weighted Rayleigh form.
    w=s['inverse_star1_shell']
    fs=s['inverse_star2_shell'];fr=s['inverse_star2_radial']
    return (lam+1)**2*w/(lam*fs+fr)


def assumed_star_rayleigh(lam,t):
    # These are the additional assumptions of the supplied theorem, not
    # actual circumcentric volumes of the 20-tetrahedron mesh.
    return (lam+1)**2/(lam*np.exp(t)+np.exp(-2*t))


def log_gap_susceptibility(func,dt=1e-5):
    def gap(t):return func(5,t)-func(3,t)
    return (gap(dt)-gap(-dt))/(2*dt*gap(0))


def corrected_loop_singular_values(v,vc,faces,d1,d2,C):
    def normalized_points(points):return points/norm(points[:,0])
    X=normalized_points(v);Xp=normalized_points(vc)
    F=normalized_points(np.array([v[list(f)].sum(0) for f in faces]))
    Fp=normalized_points(np.array([vc[list(f)].sum(0) for f in faces]))
    U0=np.column_stack([X,Xp]);U3=np.column_stack([F,Fp])
    assert norm(U0.T@U0-np.eye(6))<TOL
    assert norm(U3.T@U3-np.eye(6))<TOL
    Jinc=U0.T@C.T@U3
    Jv=np.diag([np.sqrt(5-np.sqrt(5))]*3+[np.sqrt(5+np.sqrt(5))]*3)
    Jf=np.diag([np.sqrt(3-np.sqrt(5))]*3+[np.sqrt(3+np.sqrt(5))]*3)
    bridge=np.array([[0,1,0],[0,0,1],[np.exp(1j*np.pi/10),0,0]],complex)
    assert norm(bridge.conj().T@bridge-np.eye(3))<TOL
    charges={
        'up':np.array([1,3,-4]),
        'down':np.array([1,-3,2]),
        'neutrino':np.array([-3,3,0]),
        'electron':np.array([-3,-3,6])}
    out={}
    for label,z in charges.items():
        Q=DELTA*np.diag(z)
        Y=np.block([[Q,bridge],[bridge.conj().T,-Q]])
        G=-np.linalg.solve(Jf,Y.conj().T)@np.linalg.inv(Jv)
        out[label]=np.sort(svd(Jinc@G,compute_uv=False))[::-1]
    Y0=np.block([[np.zeros((3,3)),bridge],[bridge.conj().T,np.zeros((3,3))]])
    G0=-np.linalg.solve(Jf,Y0)@np.linalg.inv(Jv)
    zero=svd(Jinc@G0,compute_uv=False)
    pred=np.r_[[PHI**2/2]*3,[PHI**-2/2]*3]
    assert norm(np.sort(zero)-np.sort(pred))<TOL
    return Jinc,zero,out


def main():
    v,vc,es,fs,d1,d2,C=geometry()
    b1,b2,b3,ee,ff,tt=complete_tetrahedral_ball(fs)
    assert (len(ee),len(ff),len(tt))==(42,50,20)
    Lface=d2.T@d2
    ev,U=eigh(Lface)
    shell=np.column_stack([U[:,abs(ev-3)<TOL],U[:,abs(ev-5)<TOL]])
    assert shell.shape==(20,8) and norm(C.T@shell)<TOL
    # Minimal-norm lift on explicitly oriented 3D mesh, as in preceding audit
    outs=[ff.index(tuple(sorted(j+1 for j in f))) for f in fs]
    rads=[k for k,f in enumerate(ff) if 0 in f]
    signs=[(-1)**sum(f[i]>f[j] for i in range(3) for j in range(i+1,3)) for f in fs]
    h=np.diag(signs)@shell
    H=b3[rads,:].T
    assert norm(b3[outs,:].T-np.eye(20))<TOL
    assert norm(H@H.T-np.diag(signs)@Lface@np.diag(signs))<TOL
    lambdas=np.array([3.]*4+[5.]*4)
    lift=np.zeros((50,8));lift[outs]=h;lift[rads]=-(H.T@h)/lambdas[None,:]
    assert norm(b3.T@lift)<TOL
    full=b2.T@b2+b3@b3.T
    assert norm(full@lift-lift*(lambdas+1)[None,:])<TOL
    assert norm((b2@lift)[[i for i,e in enumerate(ee) if 0 in e],:])<TOL
    assert norm(C.T@C-(15*np.eye(12)-2*d1@d1.T))<TOL
    jinc,zeroc,flavour=corrected_loop_singular_values(v,vc,fs,d1,d2,C)
    t0=actual_circumcentric_stars(0)
    d=1e-6
    for t in [-d,0,d]:
        st=actual_circumcentric_stars(t)
        from_flags=np.array([st['inverse_star1_shell'],
                             st['inverse_star2_shell'],st['inverse_star2_radial']])
        assert norm(from_flags-analytic_circumcentric_stars(t))<TOL
        assert abs(st['total_volume']-t0['total_volume'])<TOL
    print('125-simplex: 13 vertices, 42 edges, 50 faces, 20 tetrahedra')
    print('Homology, hidden lift, radial-edge curl: PASS')
    print('C_inc^T C_inc = 15 I - 2 L_ico: PASS')
    print('fixed total cell volume:',format(t0['total_volume'],'.12f'))
    print('\nActual circumcentric primal and dual values, t=0:')
    for name in ['primal_edge_shell','primal_edge_radial',
      'dual_edge_shell','dual_edge_radial',
      'primal_face_shell','primal_face_radial',
      'dual_face_shell','dual_face_radial',
      'inverse_star1_shell','inverse_star1_radial',
      'inverse_star2_shell','inverse_star2_radial']:
        slope=(np.log(actual_circumcentric_stars(d)[name])-
               np.log(actual_circumcentric_stars(-d)[name]))/(2*d)
        print(f'  {name:23s}: {t0[name]:.9f}   dlog/dt = {slope:.7f}')
    print('\nHidden lift: R(lambda;t), actual vs assumed star model')
    for lam in [3,5]:
        print(f'  lambda {lam}: actual R(0)={actual_rayleigh(lam,0):.12f} '
             f'vs assumed={assumed_star_rayleigh(lam,0):.12f}')
    a_act=log_gap_susceptibility(actual_rayleigh)
    a_assumed=log_gap_susceptibility(assumed_star_rayleigh)
    print(f'  actual circumcentric dlog(gap)/dt = {a_act:.12f}')
    print(f'  assigned-star-model dlog(gap)/dt = {a_assumed:.12f}')
    assert abs(a_assumed+1)<1e-8
    assert abs(a_act-(-3.23259662914553))<1e-7
    print('\nClosed loop singular spectrum at Delta=0:',np.round(zeroc,9))
    for label,s in flavour.items():print(f'  {label:8s}:',np.round(s,9))
    dt=4*ETA+np.log(4)
    alpha_mz=1/127.951
    weak=3/8-(109/(48*np.pi))*alpha_mz*dt
    print(f'\nRG interval assumed 4 eta+ln4 = {dt:.12f}; sin^2W={weak:.12f}')
    print('NOTE: alpha_EM(M_Z) is an empirical input; the RG interval is not derived by this script.')

if __name__=='__main__':main()
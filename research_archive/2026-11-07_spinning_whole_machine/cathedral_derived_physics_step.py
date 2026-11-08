#!/usr/bin/env python3
"""Newton's Cathedral: explicit fields induced by spinning Platonic geometry.

Reproducible mathematical construction; only requires numpy and scipy.
Derives 190-dimensional cellular geometry, 14 face-incidence hidden modes,
and the tetrahedron--icosahedron's 8-dimensional gapped band Hamiltonian.
The orientation-dependent quantum metric, Berry curvature, and BO torque
are then calculated from one spectral projector, not supplied independently.

Important: The 8-dimensional Hamiltonian's relative unit coupling is a
specified ansatz. These configuration-space fields are not the observed
spacetime metric or a derivation of Standard Model gauge interactions.
"""
import itertools as it
import math
import numpy as np
from scipy.spatial import ConvexHull
from scipy.linalg import null_space
from scipy.spatial.transform import Rotation
from scipy.special import eval_legendre, eval_jacobi
import sympy as sp

phi=(1+math.sqrt(5))/2

def vertex_sets():
    s=list(it.product((-1,1),repeat=3))
    raw={
      'tetrahedron':np.array([v for v in s if np.prod(v)>0],float),
      'cube':np.array(s,float),
      'octahedron':np.array([t*np.eye(3)[i] for i in range(3) for t in (-1,1)],float),
      'dodecahedron':np.array(s + [[0,a/phi,b*phi] for a,b in it.product((-1,1),repeat=2)] + [[a/phi,b*phi,0] for a,b in it.product((-1,1),repeat=2)] + [[a*phi,0,b/phi] for a,b in it.product((-1,1),repeat=2)],float),
      'icosahedron':np.array([[0,a,b*phi] for a,b in it.product((-1,1),repeat=2)] + [[a,b*phi,0] for a,b in it.product((-1,1),repeat=2)] + [[a*phi,0,b] for a,b in it.product((-1,1),repeat=2)],float),
    }
    return {name:v/np.linalg.norm(v,axis=1)[:,None] for name,v in raw.items()}

def cell_geometry(v):
    hull=ConvexHull(v)
    grouped={}
    for simplex,plane in zip(hull.simplices,hull.equations):
        grouped.setdefault(tuple(np.round(plane,8)),set()).update(simplex.tolist())
    faces=[]
    for plane,corner_set in grouped.items():
        corners=list(corner_set)
        c=v[corners].mean(axis=0)
        n=np.array(plane[:3]);n/=np.linalg.norm(n)
        u=v[corners[0]]-c;u/=np.linalg.norm(u)
        w=np.cross(n,u)
        faces.append(sorted(corners,key=lambda i:math.atan2((v[i]-c)@w,(v[i]-c)@u)))
    edges=sorted({tuple(sorted((f[i],f[(i+1)%len(f)]))) for f in faces for i in range(len(f))})
    ne,nv,nf=len(edges),len(v),len(faces)
    edge_idx={e:i for i,e in enumerate(edges)}
    b1=np.zeros((nv,ne),dtype=int)
    b2=np.zeros((ne,nf),dtype=int)
    C=np.zeros((nf,nv),dtype=int)
    for e,(a,b) in enumerate(edges):b1[a,e]=-1;b1[b,e]=1
    for j,face in enumerate(faces):
        C[j,face]=1
        for i,a in enumerate(face):
            b=face[(i+1)%len(face)]
            b2[edge_idx[tuple(sorted((a,b)))],j]=1 if a<b else -1
    assert np.count_nonzero(b1@b2)==0
    normals=C@v
    normals/=np.linalg.norm(normals,axis=1)[:,None]
    return {'dims':(nv,ne,nf),'b1':b1,'b2':b2,'C':C,'L':b2.T@b2,'normals':normals}

vsets=vertex_sets()
data={name:cell_geometry(v) for name,v in vsets.items()}
dims=tuple(sum(d['dims'][i] for d in data.values()) for i in range(3))
assert dims==(50,90,50),dims
hodge_tr2=hodge_tr4=hodge_null=0
face_hidden=[]
for name,d in data.items():
    b1,b2=d['b1'],d['b2']
    nv,ne,nf=d['dims']
    DD=np.block([[np.zeros((nv,nv),int),b1,np.zeros((nv,nf),int)],
                 [b1.T,np.zeros((ne,ne),int),b2],
                 [np.zeros((nf,nv),int),b2.T,np.zeros((nf,nf),int)]])
    D2=DD@DD
    hodge_tr2+=int(np.trace(D2))
    hodge_tr4+=int(np.trace(D2@D2))
    hodge_null+=int(np.count_nonzero(np.abs(np.linalg.eigvalsh(DD))<1e-8))
    hidden=null_space(d['C'].T)
    if hidden.size:
        ev=np.linalg.eigvalsh(hidden.T@d['L']@hidden)
        face_hidden.extend(ev.tolist())
        assert np.linalg.norm(d['L']@hidden-hidden@(hidden.T@d['L']@hidden))<1e-9
assert (hodge_tr2,hodge_tr4,hodge_null)==(720,3456,10)
assert np.allclose(sorted(face_hidden),[3]*4+[4]*3+[5]*4+[6]*3,atol=1e-9)

ico=data['icosahedron']; N=ico['normals']; L=ico['L']; C=ico['C']
H=null_space(C.T)
w,U=np.linalg.eigh(H.T@L@H)
assert np.allclose(w,[3]*4+[5]*4)
B3=H@U[:,:4]
B5=H@U[:,4:]
T=vsets['tetrahedron']


def hamiltonian_and_rotational_derivatives(R):
    """Left-invariant rotational derivatives about fixed Cartesian axes."""
    # f(R) equals a tetrahedral average, but the product gives exact derivatives
    u=N@R
    f=(2/math.sqrt(3))*np.prod(u,axis=1)
    f_direct=np.mean((N@(T@R.T).T)**3,axis=1)
    assert np.allclose(f,f_direct,atol=1e-12)
    X=B5.T@(f[:,None]*B3)
    H8=np.block([[3*np.eye(4),X.T],[X,5*np.eye(4)]])
    dHs=[]
    for a in np.eye(3):
        body_axis=R.T@a
        du=-np.cross(body_axis,u)
        df=(2/math.sqrt(3))*(du[:,0]*u[:,1]*u[:,2]+u[:,0]*du[:,1]*u[:,2]+u[:,0]*u[:,1]*du[:,2])
        dX=B5.T@(df[:,None]*B3)
        dHs.append(np.block([[np.zeros((4,4)),dX.T],[dX,np.zeros((4,4))]]))
    return H8,dHs,X


def induced_geometry(R):
    H8,dHs,X=hamiltonian_and_rotational_derivatives(R)
    E,W=np.linalg.eigh(H8)
    Wl,Wh=W[:,:4],W[:,4:]
    P=Wl@Wl.T
    assert np.linalg.norm(P@P-P)<1e-12
    # Exact band spectrum = 4 +- sqrt(1+sigma^2)
    sig=np.linalg.svd(X,compute_uv=False)
    expected=np.sort(np.concatenate((4-np.sqrt(1+sig**2),4+np.sqrt(1+sig**2))))
    assert np.allclose(E,expected,atol=1e-12)
    assert E[4]-E[3]>=2-1e-12
    dPs=[]
    denominators=E[:4][None,:]-E[4:][:,None]
    for dH in dHs:
        mix=(Wh.T@dH@Wl)/denominators
        dP=Wh@mix@Wl.T+Wl@mix.T@Wh.T
        dPs.append(dP)
    metric=np.array([[np.trace(a@b)/2 for b in dPs] for a in dPs])
    F=[]
    for i,j in ((0,1),(1,2),(2,0)):
        F.append(Wl.T@(dPs[i]@dPs[j]-dPs[j]@dPs[i])@Wl)
    # Born--Oppenheimer potential: mean low-band energy and its exact torque
    potential=E[:4].mean()
    grad=np.array([np.trace(P@dH)/4 for dH in dHs])
    return {'energy':E,'projector':P,'dP':dPs,'metric':metric,
            'curvature':F,'potential':potential,'torque':-grad}


def skew_coords(m):
    return m[np.triu_indices(4,1)]


def generated_lie_rank(generators,tolerance=1e-9):
    """Numerical commutator closure of the curvature generators in so(4)."""
    basis=[]
    queue=[g.copy() for g in generators]
    while queue and len(basis)<6:
        m=queue.pop(0)
        x=skew_coords(m)
        if basis:
            bs=np.column_stack([skew_coords(t) for t in basis])
            x=x-bs@np.linalg.lstsq(bs,x,rcond=None)[0]
        if np.linalg.norm(x)<tolerance:continue
        basis.append(m)
        for other in basis[:-1]:queue.append(m@other-other@m)
    return len(basis)


def check_derivatives(R,info,h=1e-5):
    for i,axis in enumerate(np.eye(3)):
        Rp=Rotation.from_rotvec(h*axis).as_matrix()@R
        Rm=Rotation.from_rotvec(-h*axis).as_matrix()@R
        pp=induced_geometry(Rp)['projector']
        pm=induced_geometry(Rm)['projector']
        err=np.max(abs(info['dP'][i]-(pp-pm)/(2*h)))
        assert err<2e-8,(i,err)
        ep=induced_geometry(Rp)['potential']
        em=induced_geometry(Rm)['potential']
        assert abs((ep-em)/(2*h)+info['torque'][i])<1e-7


def main():
    print('Five Platonic totals (V,E,F) =',dims)
    print('Hodge moments, nullity =',hodge_tr2,hodge_tr4,hodge_null)
    print('Fourteen hidden-face eigenvalues =',np.round(sorted(face_hidden),8))
    print('Eight-state face eigenspectrum =',np.round(w,8))
    for rotation_vector in ((0.,0.,0.),(.2,.3,.5),(.5,.2,1.)):
        R=Rotation.from_rotvec(rotation_vector).as_matrix()
        g=induced_geometry(R)
        check_derivatives(R,g)
        assert np.min(np.linalg.eigvalsh(g['metric']))>0
        print('\nRotation vector =',rotation_vector)
        print('Band spectral gap =',g['energy'][4]-g['energy'][3])
        print('Metric g_ab =\n',np.round(g['metric'],9))
        print('Metric eigenvalues =',np.round(np.linalg.eigvalsh(g['metric']),9))
        print('Berry curvature norms =',np.round([np.linalg.norm(f) for f in g['curvature']],9))
        print('Lie algebra rank (numerical) =',generated_lie_rank(g['curvature']))
        print('Mean low-band energy =',round(g['potential'],12))
        print('Torque =',np.round(g['torque'],9))
    # Canonical gradient descent from the induced metric and occupied-band energy.
    # For smooth evolution, dV/dt = -(grad V)^T g^{-1} (grad V) <= 0.
    # Freeze the physical time-step by the existing URT eta / 24 convention;
    # adaptive halving is only a numerical safeguard against overshooting.
    Delta=3/20-80*math.pi/(1053*phi)
    eta=-math.log(Delta)
    step=eta/24
    R=Rotation.from_rotvec((.2,.3,.5)).as_matrix()
    energies=[induced_geometry(R)['potential']]
    for j in range(24):
        geom=induced_geometry(R)
        grad=-geom['torque']
        angular_velocity=-np.linalg.solve(geom['metric'],grad)
        dt=step
        for _ in range(50):
            candidate=Rotation.from_rotvec(dt*angular_velocity).as_matrix()@R
            energy=induced_geometry(candidate)['potential']
            if energy<=energies[-1]+1e-13:break
            dt/=2
        else:
            raise AssertionError('Line search did not descend')
        R=candidate
        energies.append(energy)
    assert all(energies[k+1]<=energies[k]+1e-13 for k in range(24))
    print('\nFrozen eta/24 step =',step)
    print('24-step orientation descent:')
    for k in (0,1,2,4,8,12,16,20,24):
        print('  stage',k,'V =',format(energies[k],'.12f'))
    print('final relative rotation vector:',np.round(Rotation.from_matrix(R).as_rotvec(),9))
    print('PASS: dV/dt = -(grad V)^T g^{-1} (grad V) <= 0')
    print('\nPASS: analytic spectral-projector and Born--Oppenheimer derivatives match finite differences.')
    print('CONSTRUCTION: Berry/quantum metric follow from the 8-band Hamiltonian;')
    print('it does not derive physical SM charges/couplings or a 4D Einstein metric.')



# Full-five-sphere canonical regularised Laplace--Green coupling.
# Derived by minimizing .5 * integral |grad u|^2 - integral rho_gamma u.
GAMMA=1/81
GREEN_LMAX=60
GREEN_W=np.array([(2*l+1)/(4*math.pi*l*(l+1))*math.exp(-GAMMA*l*(l+1))
                  for l in range(1,GREEN_LMAX+1)])
SOLID_NAMES=list(vsets)


def green_spin_energy_gradient(orientations):
    groups=[vsets[name]@orientations[name].T for name in SOLID_NAMES]
    vertices=np.vstack(groups)
    M=len(vertices)
    dot=np.clip(vertices@vertices.T,-1,1)
    kernel=np.zeros_like(dot)
    deriv=np.zeros_like(dot)
    for l,c in enumerate(GREEN_W,1):
        kernel+=c*eval_legendre(l,dot)
        # P'_l(x)=(l+1)/2 * Jacobi_{l-1}^{(1,1)}(x), valid at x=+-1.
        deriv+=c*(l+1)/2*eval_jacobi(l-1,1,1,dot)
    E=kernel.sum()/(2*M*M)
    gradients={}
    start=0
    for name,group in zip(SOLID_NAMES,groups):
        sl=slice(start,start+len(group))
        gradients[name]=np.einsum('ij,ijk->k', deriv[sl,:],
                np.cross(group[:,None,:],vertices[None,:,:]))/(M*M)
        start+=len(group)
    return E,gradients


def five_solid_green_test():
    phi=(1+math.sqrt(5))/2
    theta=2*math.pi/phi**2
    Delta=.15-80*math.pi/(1053*phi)
    step=(-math.log(Delta))/24
    poses={}
    for i,name in enumerate(SOLID_NAMES):
        axis=np.array([math.cos(i*theta),math.sin(i*theta),.5])
        axis/=np.linalg.norm(axis)
        poses[name]=Rotation.from_rotvec(theta*axis).as_matrix()
    before,grad=green_spin_energy_gradient(poses)
    for name in SOLID_NAMES:
        axis=np.array([.1,.3,-.2]);axis/=np.linalg.norm(axis)
        eps=1e-5
        rp=dict(poses);rm=dict(poses)
        rp[name]=Rotation.from_rotvec(eps*axis).as_matrix()@poses[name]
        rm[name]=Rotation.from_rotvec(-eps*axis).as_matrix()@poses[name]
        numeric=(green_spin_energy_gradient(rp)[0]-green_spin_energy_gradient(rm)[0])/(2*eps)
        assert abs(numeric-grad[name]@axis)<1e-9,(name,numeric,grad[name]@axis)
    energies=[before]
    for j in range(24):
        E,grad=green_spin_energy_gradient(poses)
        # I=2 V/3 for equal unit-mass vertices on the common circum-sphere.
        velocities={name:-grad[name]/(2*len(vsets[name])/3)
                    for name in SOLID_NAMES}
        poses={name:Rotation.from_rotvec(step*velocities[name]).as_matrix()@poses[name]
               for name in SOLID_NAMES}
        newE,_=green_spin_energy_gradient(poses)
        assert newE<=E+1e-12
        energies.append(newE)
    print('\nFull five-solid Laplace--Green interaction:')
    print('Gamma=',GAMMA,' harmonic truncation=',GREEN_LMAX,
          ' highest coefficient=',GREEN_W[-1])
    print('All five torque derivatives match finite differences.')
    print('Spin energy at stage 0=',format(energies[0],'.13f'))
    print('Spin energy at stage 24=',format(energies[-1],'.13f'))
    print('Every stage decreases energy:',all(energies[i+1]<=energies[i]+1e-12 for i in range(24)))
    print('The continuous gradient equation has dE/dt=-sum_P |torque_P|^2/I_P <=0.')




def exact_A5_carrier_decomposition():
    """Representation-theoretic multiplicities, exact in Q(sqrt(5))."""
    golden=(sp.Integer(1)+sp.sqrt(5))/2
    sz=list(map(sp.Integer,(1,15,20,12,12)))
    irreps={
      '1':[1,1,1,1,1],
      '3':[3,-1,0,golden,1-golden],
      "3prime":[3,-1,0,1-golden,golden],
      '4':[4,0,1,-1,-1],
      '5':[5,1,-1,0,0],
    }
    chi4=list(map(sp.sympify,irreps['4']))
    result={name:sp.simplify(sum(sz[i]*sp.sympify(chi[i])*chi4[i]**2
                             for i in range(5))/60) for name,chi in irreps.items()}
    assert all(x==1 for x in result.values())
    full={name:4*int(v) for name,v in result.items()}
    visible={'1':2,'3':1,'3prime':1,'4':0,'5':1}
    hidden={name:full[name]-visible[name] for name in full}
    assert sum(int(irreps[name][0])*n for name,n in full.items())==64
    assert sum(int(irreps[name][0])*n for name,n in visible.items())==13
    assert sum(int(irreps[name][0])*n for name,n in hidden.items())==51
    print('\nExact A5 irrep multiplicities on H64 =',full)
    print('Visible H13 =',visible,'; hidden H51 =',hidden)
    print('A5-commuting unitary group on H51: U(2) x U(3) x U(3) x U(4) x U(3)')
    print('SU(3) and SU(2) subgroups exist, but a unique physical gauge action is not selected.')

if __name__=='__main__':
    main()
    five_solid_green_test()
    exact_A5_carrier_decomposition()

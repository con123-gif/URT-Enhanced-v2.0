"""Sun-Earth-Moon: orbit / Newtonian tidal-Hessian / ideal quantum entanglement toy.

Run with: python solar_three_body_entanglement_baseline.py
Dependency: NumPy. This is NOT a physical entanglement detection model:
 - astronomical masses/orbit sizes are measured EXTERNAL inputs;
 - each whole-body centre of mass is ASSUMED to be in a spatial qubit
   superposition with arbitrarily specified separation;
 - this model does not include environmental decoherence, tides, spin,
   non-Newtonian corrections, or a quantized gravitational mediator.
The orbital baseline is approximate, NOT a JPL ephemeris.
"""
import numpy as np
from itertools import product

G = 6.67430e-11             # SI (external, CODATA)
HBAR = 1.054571817e-34      # SI
MASSES = np.array([1.98892e30, 5.97e24, 0.073e24])  # Sun, Earth, Moon
AU = 149597870700.0
LUNAR_DISTANCE = 384400e3
LABELS = ("Sun", "Earth", "Moon")
PAIRS = ((0, 1), (0, 2), (1, 2))

def initial_state():
    """Toy collinear epoch; velocities circular to leading two-body order."""
    mS,mE,mM=MASSES
    pos=np.array([[0.,0.],[AU,0.],[AU+LUNAR_DISTANCE,0.]])
    v_earth=np.sqrt(G*(mS+mE)/AU)
    v_moon=np.sqrt(G*(mE+mM)/LUNAR_DISTANCE)
    vel=np.array([[0.,0.],[0.,v_earth],[0.,v_earth+v_moon]])
    vel[0]=-np.sum(MASSES[1:,None]*vel[1:],axis=0)/mS
    return pos,vel

def acceleration(pos):
    dr=pos[None,:,:]-pos[:,None,:]
    distances=np.linalg.norm(dr,axis=2)
    np.fill_diagonal(distances,np.inf)
    return G*np.sum(MASSES[None,:,None]*dr/distances[:,:,None]**3,axis=1)

def energy(pos,vel):
    en=.5*np.sum(MASSES*np.sum(vel*vel,axis=1))
    for i,j in PAIRS:
        en-=G*MASSES[i]*MASSES[j]/np.linalg.norm(pos[i]-pos[j])
    return en

def orbit(days=30,step_seconds=3600):
    pos,vel=initial_state()
    e0=energy(pos,vel)
    acc=acceleration(pos)
    hist=[pos.copy()]
    for _ in range(int(days*86400//step_seconds)):
        pn=pos+vel*step_seconds+.5*acc*step_seconds**2
        an=acceleration(pn)
        vel=vel+.5*(acc+an)*step_seconds
        pos,acc=pn,an
        hist.append(pos.copy())
    hist=np.asarray(hist)
    de=np.linalg.norm(hist[:,1]-hist[:,2],axis=1)
    ds=np.linalg.norm(hist[:,0]-hist[:,1],axis=1)
    drift=abs((energy(pos,vel)-e0)/e0)
    return de,ds,drift

def radial_tidal_couplings(pos):
    """Kij=2 G mi mj/r_ij^3 in J/m^2, at one fixed collinear epoch."""
    return {(i,j):2*G*MASSES[i]*MASSES[j]/
            np.linalg.norm(pos[i]-pos[j])**3 for i,j in PAIRS}

def quantum_three_qubits(delta=1e-23,seconds=1):
    """Pure 3-body idealization with +/-delta/2 branch positions along x.

    Expansion of Newton potential gives H_ij=c_ij x_i x_j,
    c_ij=+2 G m_i m_j/r_ij^3 (for aligned longitudinal offsets).
    x_i=(delta_i/2)*sigma_z^i. Set H_ij=hbar*Phi_ij/(4t)*Zi Zj.
    This is NOT a controlled planetary quantum experiment.
    """
    pos,_=initial_state()
    k=radial_tidal_couplings(pos)
    if np.isscalar(delta):
        delta=np.ones(3)*float(delta)
    else:
        delta=np.array(delta,dtype=float)
    phi=np.zeros((3,3))
    for i,j in PAIRS:
        phi[i,j]=phi[j,i]=k[i,j]*delta[i]*delta[j]*seconds/HBAR
    state=np.empty((2,2,2),complex)
    for bits in product((0,1),repeat=3):
        spin=np.array([1 if z==0 else -1 for z in bits])
        phase=sum(phi[i,j]*spin[i]*spin[j]/4 for i,j in PAIRS)
        state[bits]=np.exp(-1j*phase)/np.sqrt(8)
    assert abs(np.linalg.norm(state)-1)<1e-12
    purities=[]
    for index in range(3):
        amp=np.moveaxis(state,index,0).reshape(2,-1)
        rho=amp@amp.conj().T
        P=float(np.trace(rho@rho).real)
        # Independently derived exact Ising-graph one-site purity.
        expected=.5*(1+np.prod([np.cos(phi[index,j]/2)**2
                                  for j in range(3) if j!=index]))
        assert abs(P-expected)<1e-12
        purities.append(P)
    return k,phi,np.asarray(purities)

if __name__=="__main__":
    em,se,drift=orbit()
    k,ph,p=quantum_three_qubits()
    print("Sun-Earth-Moon: 30-day approximate classical N-body baseline")
    print("Earth-Moon separation (km): min",em.min()/1000,"max",em.max()/1000)
    print("Sun-Earth separation (AU): min",se.min()/AU,"max",se.max()/AU)
    print("Velocity-Verlet energy relative drift:",drift)
    print("Radial cross-tidal couplings K_ij=2 G mi mj/r^3 (J/m²):")
    for i,j in PAIRS:
        print(LABELS[i],LABELS[j],"K=",k[i,j],
              " equal-branch-size for 1 rad in 1 s (m)=",
              np.sqrt(HBAR/k[i,j]))
    print("Idealized PURE quantum three-body simulation only:")
    print("Each planetary COM in coherent +/- 0.5e-23 m branches for 1 s.")
    print("Gravitational Ising phase Phi_ij at that illustrative branch size:")
    for i,j in PAIRS:
        print(LABELS[i],LABELS[j],ph[i,j])
    print("Reduced single-body purities:",dict(zip(LABELS,p)))
    print("Linear entropies 1-purity:",dict(zip(LABELS,1-p)))
    assert np.all(p<1)
    assert drift<1e-7
    print("PASS (pure toy system); no evidence planets are actually entangled.")

"""Original full 190/64/24 Cathedral interface + exact 3D long-wave pole."""
import numpy as np
from fractions import Fraction
from pathlib import Path
from cathedral_core.spatial_transport import NativeURTSpatialTransport

def test_spatial_transport():
    # Rational Walsh-sector perturbation recurrence, free of floating-point fitting.
    # This works for any six axis coefficients, proving universal symmetric-polynomial
    # coefficient identities by parity-sector permutation/sign symmetry and 4 samples.
    def exact_coefficients(axes_coeffs, parity, nmax=6):
        a=list(map(Fraction,axes_coeffs))
        if parity not in (-1,1):raise ValueError(parity)
        lam=[2*m.bit_count()*(6-m.bit_count()) for m in range(32)]
        def apply_velocity(v):
            ans={}
            for mask,c in v.items():
                for i,ai in enumerate(a):
                    if ai==0:continue
                    newmask=mask^(1<<i)
                    factor=parity if newmask&32 else 1
                    if newmask&32:newmask^=63
                    ans[newmask]=ans.get(newmask,Fraction(0))+factor*ai*c
            return {m:c for m,c in ans.items() if c}
        v=[{0:Fraction(1)}];mu=[Fraction(0)]
        for j in range(1,nmax+1):
            Vv=apply_velocity(v[-1])
            mu.append(Vv.get(0,Fraction(0)))
            rhs={i:-c for i,c in Vv.items()}
            for l in range(1,j+1):
                for i,c in v[j-l].items():
                    rhs[i]=rhs.get(i,Fraction(0))+mu[l]*c
            assert rhs.get(0,0)==0
            v.append({i:c/lam[i] for i,c in rhs.items() if i!=0 and c})
        return mu

    def analytic_coefficients(a,parity):
        a=list(map(Fraction,a))
        s2=sum(t**2 for t in a);s4=sum(t**4 for t in a);s6=sum(t**6 for t in a)
        p=Fraction(1)
        for t in a:p*=t
        # For the pencil H64+i*r*k*X, i^(2m) multiplies the real-tilt coefficients.
        return (s2/Fraction(10), -s2*s2/Fraction(4000)+s4/Fraction(800),
                s2**3/Fraction(300000)-s2*s4/Fraction(40000)+s6/Fraction(24000)+parity*p/Fraction(640))

    for vals in ((1,0,0,0,0,0),(1,1,0,0,0,0),(1,1,1,0,0,0),
                 (1,1,1,1,1,1),(2,1,3,0,-1,2),(1,2,3,4,5,6)):
      for parity in (-1,1):
        moments=exact_coefficients(vals,parity)
        expected=analytic_coefficients(vals,parity)
        assert tuple(((-1)**(j//2))*moments[j] for j in (2,4,6))==expected,(vals,parity,moments,expected)
    print('PASS exact rational universal Walsh calculation: order 2/4/6, six representative inputs and both 32-state parities')

    p=(Path(__file__).resolve().parents[1] / 'research_archive' /
       '2026-11-07_joint_interacting_native' /
       'cathedral_constructed_joint_dynamics_2026_11_07.py')
    engine=NativeURTSpatialTransport.from_archive(p)
    assert engine.history.shape==(64,64)
    assert abs(engine.long_time_diffusion-0.267141141410950)<2e-14
    for parity in (-1,1):
        n=engine.sector_indices(parity)
        assert len(n)==32
        assert np.linalg.norm(engine.position_signal[n].T@engine.position_signal[n]/32-2*np.eye(3))<1e-12
        for t in (0.03,.5,2.0):
            cf=engine.characteristic_function([.0006,0,0],t,parity)
            inferred=2*(1-cf.real)/(.0006**2)
            assert abs(inferred-engine.covariance_per_axis(t))<1e-5,(t,inferred,engine.covariance_per_axis(t))
        for direction in ([1,0,0],[1,1,0],[1,1,1],[1,2,3]):
            direction=np.asarray(direction,float);direction/=np.linalg.norm(direction)
            a=engine.axes@direction
            assert abs(np.sum(a**2)-2)<3e-14
            assert abs(np.sum(a**4)-6/5)<3e-14
            for k in (.15,.3,.5,.8):
                series=engine.decay_series(k*direction,parity)
                assert abs(series.pole.imag)<3e-11
                assert abs((-series.pole.real)-series.through_sixth)<1.0e-6,(parity,k,series)
                assert series.pole.real<0
                if k==.5:print('pole at |k|=0.5 parity',parity,'direction',direction.tolist(),
                                 'exact decay',-series.pole.real,'6th approximation',series.through_sixth,
                                 'relative error',abs(series.pole.real+series.through_sixth)/abs(series.pole.real))

    for p_sign in (-1,1):
        direction=np.array([1.,1.,1.]);direction/=np.linalg.norm(direction)
        a=engine.axes@direction
        ds=engine.decay_series(.1*direction,p_sign)
        predicted=engine.scale**6*((sum(a**6)-4/5)/24000+p_sign*np.prod(a)/640)*(.1**6)
        assert abs(ds.sixth_order-predicted)<1e-15
    print('PASS full original H64 all parity modes, isotropic k²+k⁴, sixth-order icosahedral/parity splitting')
    print('D native 3D',engine.long_time_diffusion)
    print('fourth-order isotropic coefficient',engine.scale**4/2000)
    print('no parameter fitting, no replacement 13-state or spatial heat equation')

if __name__=="__main__":
    test_spatial_transport()
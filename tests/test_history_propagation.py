"""Regression for exact sixth-order history propagation; original H64 geometry."""
import math
import numpy as np
from fractions import Fraction as F
from cathedral_core.history_propagation import NativeHistoryPropagation, native_six_axes, R


def _exact_walsh_cumulants(a,parity,max_order=6):
    """Independent fraction-valued Rayleigh recursion in closed 32-Walsh sector."""
    B={1<<i:F(a[i]) for i in range(5)}
    B[31]=F(parity)*F(a[5])
    psis=[{0:F(1)}];lam={0:F(0)}
    for n in range(1,max_order+1):
        out={}
        for mask,coefficient in psis[-1].items():
            for flip,value in B.items():
                idx=mask^flip
                out[idx]=out.get(idx,F(0))+coefficient*value
        lam[n]=out.pop(0,F(0))
        for k in range(1,n):
            for mask,v in psis[n-k].items():
                out[mask]=out.get(mask,F(0))-lam[k]*v
        out.pop(0,None)
        psis.append({mask:v/F(2*mask.bit_count()*(6-mask.bit_count()))
                     for mask,v in out.items() if v})
    return lam


def test_generator_and_symmetries():
    e=NativeHistoryPropagation()
    assert e.L.shape==(64,64)
    assert np.max(np.abs(e.L-e.L.T))<1e-15
    assert np.max(np.abs(e.L.sum(axis=1)))<1e-15
    eigen=np.linalg.eigvalsh(e.L)
    for k,m in [(0,2),(10,12),(16,30),(18,20)]:
        assert sum(abs(eigen-k)<1e-8)==m
    assert np.linalg.norm(e.axes.T@e.axes-2*np.eye(3))<1e-12
    assert np.linalg.norm(e.L@e.positions-10*e.positions)<1e-11
    assert abs(e.max_speed-R*math.sqrt(6+2*math.sqrt(5)))<1e-12
    assert abs(e.causal_radius(1)-e.max_speed)<1e-12
    for p in (-1,1):
        ids,L=e.restrictions[p]
        assert len(ids)==32
        v2=np.round(np.sum(e.positions[ids]**2,axis=1),10)
        target=([6-6/math.sqrt(5)]*20+[6+2*math.sqrt(5)]*12 if p==-1
                else [6-2*math.sqrt(5)]*12+[6+6/math.sqrt(5)]*20)
        assert np.linalg.norm(np.sort(v2)-np.sort(target))<2e-9
        assert abs(np.linalg.eigvalsh(L)[1]-10)<1e-10
        assert np.linalg.norm(e.positions[ids].T@e.positions[ids]/32-2*np.eye(3))<1e-11


def test_exact_cumulants_and_parity():
    e=NativeHistoryPropagation()
    dirs=[[1,0,0],[1,1,1],[1,2,3],e.axes[0]]
    for vec in dirs:
        for p in (-1,1):
            c=e.cumulant_rates(vec,p)
            assert abs(c[2]-R*R/5)<1e-13
            assert abs(c[4]+R**4/2000)<1e-13
        cc=e.cumulant_rates(vec,+1);dd=e.cumulant_rates(vec,-1)
        n=np.array(vec)/np.linalg.norm(vec)
        assert abs(cc[6]-dd[6]-R**6*np.prod(e.axes@n)/320)<1e-12
    assert abs(e.cumulant_rates([1,0,0],1)[6])<1e-12
    assert abs(e.cumulant_rates(e.axes[0],1)[6]-e.cumulant_rates(e.axes[0],-1)[6])>1e-5
    # Independent exact rational recursion checks formula for arbitrary a_i.
    for a in [(1,0,0,0,0,0),(1,1,1,0,0,0),(1,1,1,1,1,1),(1,2,3,4,5,6)]:
        s2=sum(F(k)**2 for k in a)
        s4=sum(F(k)**4 for k in a)
        s6=sum(F(k)**6 for k in a)
        prod=math.prod(a)
        for p in (-1,1):
            lam=_exact_walsh_cumulants(a,p)
            assert lam[2]==s2/10
            assert lam[3]==0 and lam[5]==0
            assert lam[4]==s2*s2/F(4000)-s4/F(800)
            assert lam[6]==s2**3/F(300000)-s2*s4/F(40000)+s6/F(24000)+F(p*prod,640)


def test_propagator_and_rate_expansion():
    e=NativeHistoryPropagation()
    for t in [0,.1,1,10]:
        cov=e.covariance_at(t)
        assert np.linalg.eigvalsh(cov).min()>=-1e-13
        assert np.linalg.norm(cov-np.trace(cov)/3*np.eye(3))<1e-12
    for vec in ([1,1,1],e.axes[0]):
        for p in (-1,1):
            c=e.cumulant_rates(vec,p)
            for amplitude in (.12,.2,.3):
                actual=e.dominant_rate(vec,amplitude,p)
                approx=e.long_wave_rate(vec,amplitude,p)
                assert abs(actual-approx)<2e-9,(vec,p,amplitude,actual,approx)
            mgf=e.moment_generating_function(vec,.2,2,p)
            assert mgf>1
    assert abs(e.diffusion_coefficient-math.pi**2/(5*math.e**2))<1e-14
    assert abs(e.moment_generating_function([1,2,3],0,3,1)-1)<1e-13

if __name__=='__main__':
    test_generator_and_symmetries()
    test_exact_cumulants_and_parity()
    test_propagator_and_rate_expansion()
    e=NativeHistoryPropagation()
    print('PASS native 64 history spectrum, six icosahedral axes, both 32-state parity sectors')
    print('PASS exact rational Walsh cumulants through sixth order')
    print('PASS eigensolver comparison, finite-time MGF and full isotropic covariance')
    print('D',e.diffusion_coefficient,'quartic coefficient',e.cumulant_rates([1,2,3])[4])
    print('finite propagation speed bound',e.max_speed)
    for name,d in [('twofold',[1,0,0]),('threefold',[1,1,1]),('fivefold',e.axes[0])]:
        print(name,'c6 plus',e.cumulant_rates(d,1)[6],'c6 minus',e.cumulant_rates(d,-1)[6])
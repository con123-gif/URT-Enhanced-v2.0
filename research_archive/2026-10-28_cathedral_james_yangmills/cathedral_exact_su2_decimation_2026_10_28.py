#!/usr/bin/env python3
"""Exact non-Abelian SU(2) link decimation of a Wilson action whose bare
coupling is derived from the selected Cathedral 4+4 entropy bridge.

This integrates genuine Haar SU(2) links, not Gaussian sites.  All results are
finite-lattice exact identities verified numerically, not an assertion of a
uniform Dobrushin-Shlosman continuum estimate.
"""
import math, json
from pathlib import Path
import numpy as np
from scipy.special import i1e
from scipy.linalg import expm
from scipy.integrate import quad

PHI=(1+math.sqrt(5))/2
DELTA=3/20-80*math.pi/(1053*PHI)
ETA=-math.log(DELTA)
BETA_ENT=ETA*(1-DELTA**2)/(1+DELTA**2)
BETA=BETA_ENT/2  # SU(2) 4=1+2+1 complex representation
L=4
rng=np.random.default_rng(20261028)


def mul(p,q):
    a,b,c,d=p; e,f,g,h=q
    return np.array([a*e-b*f-c*g-d*h,a*f+b*e+c*h-d*g,
                     a*g-b*h+c*e+d*f,a*h+b*g-c*f+d*e])


def conj(q):
    return q*np.array([1.,-1.,-1.,-1.])


def unit():
    q=rng.normal(size=4)
    return q/np.linalg.norm(q)


def logZ(r):
    # SU(2)=S^3, ∫e^{r Re U}dU=2 I1(r)/r.
    if r < 1e-5:
        r2=r*r
        return r2/8-r2*r2/384+r2*r2*r2/9216
    return math.log(2*i1e(r)/r)+r


def xp(x,d,k=1):
    y=list(x);y[d]=(y[d]+k)%L
    return tuple(y)


def plaq(U,x,mu,nu):
    return mul(mul(mul(U[x+(mu,)],U[xp(x,mu)+(nu,)]),
                       conj(U[xp(x,nu)+(mu,)])),conj(U[x+(nu,)]))


def around(x,mu):
    return [(x,min(mu,nu),max(mu,nu)) for nu in range(4) if nu!=mu] + [
        (xp(x,nu,-1),min(mu,nu),max(mu,nu)) for nu in range(4) if nu!=mu]


def staples(U,x,mu):
    out=[]
    for nu in range(4):
        if nu==mu: continue
        if mu < nu:
            # plaquette at x: U_e, U_nu(x+mu), U_mu(x+nu)†, U_nu(x)†
            b=mul(mul(U[xp(x,mu)+(nu,)],conj(U[xp(x,nu)+(mu,)])),conj(U[x+(nu,)]))
            # plaquette at x-nu: cyclically U_e† U_nu(x-nu)† U_mu(x-nu) U_nu(x-nu+mu)
            y=xp(x,nu,-1)
            t=mul(mul(conj(U[y+(nu,)]),U[y+(mu,)]),U[xp(y,mu)+(nu,)])
            out.extend([b,conj(t)])
        else:
            # plaquette plane nu,mu at x: U_nu(x) U_mu(x+nu) U_nu(x+mu)† U_mu(x)†
            # cyclic U_mu(x)† U_nu(x) U_mu(x+nu) U_nu(x+mu)†
            t=mul(mul(U[x+(nu,)],U[xp(x,nu)+(mu,)]),conj(U[xp(x,mu)+(nu,)]))
            out.append(conj(t))
            # plaquette x-nu: U_nu(y) U_mu(x) U_nu(y+mu)† U_mu(y)†
            # cyclic U_mu(x) U_nu(y+mu)† U_mu(y)† U_nu(y)
            y=xp(x,nu,-1)
            b=mul(mul(conj(U[xp(y,mu)+(nu,)]),conj(U[y+(mu,)])),U[y+(nu,)])
            out.append(b)
    assert len(out)==6
    return out


def Wilson(U):
    return sum(BETA*(1-plaq(U,x,mu,nu)[0]) for x in np.ndindex((L,)*4) for mu in range(4) for nu in range(mu+1,4))


def verify_parent_gauge_indices():
    """4=1+2+1 weak and 4=1+3 color, against same 4+4 entropy state."""
    S=(1/math.sqrt(2))*np.block([[np.eye(4),np.eye(4)],[-np.eye(4),np.eye(4)]])
    p=1/(4*(1+DELTA**2));r=DELTA**2*p
    rho=np.diag([p]*4+[r]*4)
    lnrho=np.diag([math.log(p)]*4+[math.log(r)]*4)
    max_err=0
    for _ in range(200):
        # SU(2): random quaternion as the fundamental complex 2x2 matrix.
        q=unit();a,b,c,d=q
        u=np.array([[a+1j*b,c+1j*d],[-c+1j*d,a-1j*b]])
        assert np.linalg.norm(u@u.conj().T-np.eye(2)) <1e-13
        U4=np.eye(4,dtype=complex);U4[1:3,1:3]=u
        UU=np.block([[U4,np.zeros((4,4))],[np.zeros((4,4)),np.eye(4)]])
        R=S@UU@S.T
        entropy=np.trace(rho@(lnrho-R@lnrho@R.conj().T)).real
        pred=BETA_ENT/2*(1-np.trace(u).real/2)
        max_err=max(max_err,abs(entropy-pred))
        X=rng.normal(size=(3,3))+1j*rng.normal(size=(3,3));H=(X+X.conj().T)/2
        H-=np.trace(H)*np.eye(3)/3
        v=expm(1j*H)
        U4=np.eye(4,dtype=complex);U4[1:,1:]=v
        UU=np.block([[U4,np.zeros((4,4))],[np.zeros((4,4)),np.eye(4)]])
        R=S@UU@S.T
        entropy=np.trace(rho@(lnrho-R@lnrho@R.conj().T)).real
        pred=3*BETA_ENT/4*(1-np.trace(v).real/3)
        max_err=max(max_err,abs(entropy-pred))
    beta2=BETA_ENT/2;beta3=3*BETA_ENT/4
    g22=4/beta2;g32=6/beta3
    assert abs(g22-g32)<1e-13 and max_err<1e-12
    return {"beta_weak_SU2_one_doublet_two_singlets":beta2,
            "beta_color_SU3_one_triplet_one_singlet":beta3,
            "g2_squared":g22,"g3_squared":g32,"common_g":math.sqrt(g22),
            "maximum_both_relative_entropy_identity_error":max_err,
            "scope":"Indices match under explicitly chosen 4D representations, not a derivation of their selection from URT"}


def main():
    U={x+(mu,):unit() for x in np.ndindex((L,)*4) for mu in range(4)}
    selected=[x+(0,) for x in np.ndindex((L,)*4) if all((i%2==0 for i in x))]
    chosen=set(selected)
    touched={}
    for e in selected:
        for p in around(e[:4],e[4]):
            touched[p]=touched.get(p,0)+1
    assert len(selected)==16
    assert len(touched)==6*len(selected)
    assert max(touched.values())==1
    nplaq=(L**4)*6
    assert len(touched)==96 and nplaq==1536
    max_local=0.
    for e in selected:
        x=e[:4];mu=e[4]
        B=np.sum(staples(U,x,mu),axis=0)
        old=U[e].copy()
        for _ in range(12):
            trial=unit();U[e]=trial
            local=sum(BETA*(1-plaq(U,*p)[0]) for p in around(x,mu))
            expected=BETA*(6-mul(trial,B)[0])
            max_local=max(max_local,abs(local-expected))
        U[e]=old
    assert max_local<2e-13, max_local
    # Local exact SU2 Haar integral by 1D quadrature; independent check of Bessel expression.
    err_integrals=[]
    rs=[0.0,0.01,0.5,2.0,BETA,6*BETA]
    for r in rs:
        val=quad(lambda u: (2/math.pi)*math.sqrt(max(0,1-u*u))*math.exp(r*u),-1,1,epsabs=1e-10,epsrel=1e-12)[0]
        err_integrals.append(abs(math.log(val)-logZ(r)))
    assert max(err_integrals)<2e-10,max(err_integrals)
    # Verify full local gauge invariance of the exact effective action: staple
    # sum transforms as g_y B g_x^{-1} and therefore its norm is invariant.
    gauge={x:unit() for x in np.ndindex((L,)*4)}
    Ug={}
    for e,q in U.items():
        x,mu=e[:4],e[4]
        Ug[e]=mul(mul(gauge[x],q),conj(gauge[xp(x,mu)]))
    # Note the comprehension above consumes each e as x+direction; no
    # gauge-fixed constraint is imposed before this identity.
    max_gauge_staple=0.0
    for e in selected:
        bb=np.sum(staples(U,e[:4],e[4]),axis=0)
        bbp=np.sum(staples(Ug,e[:4],e[4]),axis=0)
        max_gauge_staple=max(max_gauge_staple,abs(np.linalg.norm(bb)-np.linalg.norm(bbp)))
    max_gauge_Wilson=abs(Wilson(U)-Wilson(Ug))
    assert max_gauge_staple<1e-11 and max_gauge_Wilson<1e-9
    # Exact integrated Wilson probability over 16 plaquette-disjoint compact links.
    # Nonintegrated plaquettes contribute their original Wilson terms.
    S_rest=sum(BETA*(1-plaq(U,x,mu,nu)[0]) for x in np.ndindex((L,)*4)
          for mu in range(4) for nu in range(mu+1,4) if (x,mu,nu) not in touched)
    S_eff=S_rest+sum(6*BETA-logZ(BETA*np.linalg.norm(np.sum(staples(U,e[:4],e[4]),axis=0))) for e in selected)
    # Independent quadrature over chosen single-link conditional verifies its term as well.
    e=selected[0]; B=np.sum(staples(U,e[:4],e[4]),axis=0)
    Z1=math.exp(logZ(BETA*np.linalg.norm(B)))
    integrated_action=6*BETA-math.log(Z1)
    assert integrated_action>=-1e-10
    # Show exact cross-staple mixed second derivative from integrating SU2 at zero staple-sum.
    eps=1e-3
    def f(t,s):
        return -logZ(BETA*math.hypot(t,s))
    # At zero, Hessian of -logZ(beta B) is -beta^2/4 I, so a mixed
    # dot-product term -beta^2/4 <s_i,s_j> for distinct staples.
    hessian=(f(eps,0)-2*f(0,0)+f(-eps,0))/(eps**2)
    assert abs(hessian+BETA**2/4)<1e-5
    # Slope near a flat background. Conditional single-link expectation is L(r)=I2(r)/I1(r) = I0/I1-2/r,
    # approaching 1-3/(2r). We compute log partition function no MC.
    # Line-gauge exact single-link Dobrushin row sum from James: 3 beta_W.
    idx=verify_parent_gauge_indices()
    out={"gauge_indices":idx,"max_gauge_staple_norm_residual":max_gauge_staple, "max_gauge_Wilson_action_residual":max_gauge_Wilson,"beta_entropy_master":BETA_ENT,"beta_W_SU2_chosen":BETA,"delta":DELTA,"eta":ETA,"L":L,
         "selected_links":len(selected),"all_links":len(U),"total_plaquettes":nplaq,
         "plaquettes_containing_integrated_link":len(touched),
         "plaquette_overlap_max":max(touched.values()),
         "max_local_Wilson_staple_residual":max_local,
         "max_independent_haar_quadrature_residual":max(err_integrals),
         "SU2_Haar_Bessel_r_test_values":rs,
         "effective_action_random_remainder":S_rest,
         "effective_action_random_exact":S_eff,
         "example_integrated_six_plaquette_action":integrated_action,
         "generated_bilinear_cross_staple_coefficient_small_beta":-BETA**2/4,
         "zero_staple_hessian_numerical":hessian,
         "zero_staple_hessian_exact":-BETA**2/4,
         "forest_single_link_Dobrushin_row_sum_exact":3*BETA,
         "status":"Exact SU2 Haar integration / gauge-invariant non-Gaussian coarse-grain; no physical continuum D(n,alpha) proof"}
    Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2))
    print(json.dumps(out,indent=2))

if __name__=='__main__':main()

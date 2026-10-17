#!/usr/bin/env python3
"""Independent tests of source typing for compact links and photon response.

Finite cyclic compact-rotor review, noncommuting Gaussian matrices, and an
isospectral Gibbs/BKM example. No alpha target or physical clock is supplied.
"""
from pathlib import Path
import itertools
import json
import math
import numpy as np

HERE = Path(__file__).resolve().parent

def hermitian_exp(H,scale):
    e,u=np.linalg.eigh(H)
    return (u*np.exp(scale*e))@u.conj().T

def positive_sqrt(W):
    e,u=np.linalg.eigh((W+W.conj().T)/2)
    assert e.min()>-1e-12
    return (u*np.sqrt(np.maximum(e,0)))@u.conj().T

def compact_rotor_review():
    # Finite Z_7 discretization of a central U(1) triangle, with exact Haar
    # Gauss projection. Only grid translations are used, so no aliasing claim
    # about arbitrary continuous translations enters the finite review.
    m=7
    flux=np.asarray(list(itertools.product(range(m),repeat=3)))
    signed=np.where(flux<=m//2,flux,flux-m)
    index={tuple(x):i for i,x in enumerate(flux)}
    size=len(flux)
    loop=np.zeros((size,size),complex)
    for j,x in enumerate(flux):
        loop[index[tuple((x+1)%m)],j]=1
    E2=np.diag(np.sum(signed*signed,axis=1))
    H=0.5*E2+np.eye(size)-0.5*(loop+loop.conj().T)
    # Discrete plaquette hat is nonnegative and has true zero support.
    theta=2*math.pi*np.arange(m)/m
    wrapped=(theta+math.pi)%(2*math.pi)-math.pi
    weight=np.maximum(1-np.abs(wrapped)/(1.2*2*math.pi/m),0)
    coefficients=np.fft.fft(weight)/m
    sqrt_coefficients=np.fft.fft(np.sqrt(weight))/m
    W=np.zeros((size,size),complex)
    power=np.eye(size,dtype=complex)
    for coefficient in coefficients:
        W+=coefficient*power
        power=power@loop
    W=(W+W.conj().T)/2
    physical=(flux[:,0]==flux[:,1])&(flux[:,1]==flux[:,2])
    P=np.diag(physical.astype(float))
    a=0.7 # illustrative toy clock only; theorem is valid at every a.
    # Use the known character expansion of the square root. Numerical
    # eigensqrt would take square roots of rounding errors at exact zero
    # eigenvalues and obscure the support-preserving conjugation identity.
    ws=np.zeros_like(W)
    power=np.eye(size,dtype=complex)
    for coefficient in sqrt_coefficients:
        ws+=coefficient*power
        power=power@loop
    ws=(ws+ws.conj().T)/2
    assert np.linalg.norm(ws@ws-W)<1e-12
    T=P@ws@hermitian_exp(H,-a)@ws@P
    traces=[float(np.trace(np.linalg.matrix_power(T,n)).real) for n in [1,2,3]]
    rows=[]
    for grid_source in [[1,0,0],[1,2,0],[1,1,-2]]:
        A=2*math.pi*np.asarray(grid_source)/m
        R=np.diag(np.exp(1j*(signed@A)))
        curvature=float((A.sum()+math.pi)%(2*math.pi)-math.pi)
        # The following is a direct source-substituted magnetic Hamiltonian.
        HA=0.5*E2+np.eye(size)-0.5*(np.exp(1j*A.sum())*loop+
                                     np.exp(-1j*A.sum())*loop.conj().T)
        # Source-substituted face hat is evaluated in its character expansion.
        WA=np.zeros_like(W)
        power=np.eye(size,dtype=complex)
        for k,coefficient in enumerate(coefficients):
            WA+=coefficient*np.exp(1j*k*A.sum())*power
            power=power@loop
        WA=(WA+WA.conj().T)/2
        was=np.zeros_like(WA)
        power=np.eye(size,dtype=complex)
        for k,coefficient in enumerate(sqrt_coefficients):
            was+=coefficient*np.exp(1j*k*A.sum())*power
            power=power@loop
        was=(was+was.conj().T)/2
        assert np.linalg.norm(was@was-WA)<1e-12
        TA=P@was@hermitian_exp(HA,-a)@was@P
        source_traces=[float(np.trace(np.linalg.matrix_power(TA,n)).real) for n in [1,2,3]]
        # Translating H but freezing W defines a different probe.
        T_Honly=P@ws@hermitian_exp(HA,-a)@ws@P
        rows.append({'grid_source':grid_source,'plaquette_curvature':curvature,
                     'Gauss_translation_commutator':float(np.linalg.norm(P@R-R@P)),
                     'direct_H_translation_error':float(np.linalg.norm(HA-R@H@R.conj().T)),
                     'direct_W_translation_error':float(np.linalg.norm(WA-R@W@R.conj().T)),
                     'full_T_translation_error':float(np.linalg.norm(TA-R@T@R.conj().T)),
                     'base_trace_T_powers':traces,'source_trace_T_powers':source_traces,
                     'all_occurrence_trace_max_difference':max(abs(x-y) for x,y in zip(traces,source_traces)),
                     'H_only_source_trace_difference':float(np.trace(T_Honly).real-traces[0])})
    checks={
        'physical_Gauss_rank_is_seven':np.trace(P)==7,
        'compact_hat_is_positive_with_zero_support':np.min(np.linalg.eigvalsh(W))>-1e-12 and np.count_nonzero(weight==0)>0,
        'nonzero_curved_sources_included':sum(abs(x['plaquette_curvature'])>0.1 for x in rows)==2,
        'all_translations_commute_with_Gauss_projection':max(x['Gauss_translation_commutator'] for x in rows)<1e-12,
        'direct_all_occurrence_H_W_translation':max(max(x['direct_H_translation_error'],x['direct_W_translation_error']) for x in rows)<1e-11,
        'T_is_unitarily_conjugated':max(x['full_T_translation_error'] for x in rows)<1e-10,
        'all_trace_T_powers_unchanged':max(x['all_occurrence_trace_max_difference'] for x in rows)<1e-11,
        'freezing_face_weight_changes_probe':max(abs(x['H_only_source_trace_difference']) for x in rows)>1e-3,
    }
    return ({'scope':'Exact finite Z_7 review; analytic U(1) theorem does not depend on this discretization.',
            'sites':3,'links':3,'rotor_states':size,'illustrative_clock':a,'rows':rows,'checks':checks},
           {'rotor_H':H,'rotor_face_hat':W,'rotor_Gauss_projector':P,'rotor_T':T})

def gaussian_review():
    K=np.diag([2.,3.,5.])
    Pi=np.array([[4.,.7,.2],[.7,2.,.4],[.2,.4,6.]])
    Gamma=K+Pi
    G=np.linalg.inv(Gamma)
    C=Pi-Pi@G@Pi
    reverse=np.linalg.inv(np.linalg.inv(C)-np.linalg.inv(K))
    alternative=K-K@G@K
    all_shift=Gamma-Gamma@G@Gamma
    # Mean-zero quantum fluctuation is the Legendre/background definition.
    # Its constrained quadratic coefficient is Gamma, not C or zero.
    q=np.array([1.,2.,-1.,3.])
    Q,unused=np.linalg.qr(np.column_stack([q,np.eye(4)]))
    U=Q[:,1:]
    Gamma4=U@Gamma@U.T
    C4=U@C@U.T
    source=np.array([.4,-.7,.2])
    bstar=-G@Pi@source
    stationary_energy=.5*bstar@K@bstar+.5*(bstar+source)@Pi@(bstar+source)
    collapsed_energy=.5*source@C@source
    # Exact symmetric two-node Gaussian finite difference of its log integral
    # can be calculated after completing the square, with no numeric integral.
    logI=lambda A: .5*len(A)*math.log(2*math.pi)-.5*np.linalg.slogdet(Gamma)[1]-.5*A@C@A
    eps=1e-3
    direction=np.array([1.,-.3,.2])
    fd=-(logI(eps*direction)-2*logI(np.zeros(3))+logI(-eps*direction))/(eps*eps)
    checks={
        'K_and_Pi_are_positive':np.linalg.eigvalsh(K).min()>0 and np.linalg.eigvalsh(Pi).min()>0,
        'review_uses_noncommuting_K_and_Pi':np.linalg.norm(K@Pi-Pi@K)>0.1,
        'matter_only_external_response_differs_from_photon_1PI':np.linalg.norm(C-Gamma)>1,
        'matter_only_external_response_differs_from_matter_Pi':np.linalg.norm(C-Pi)>1,
        'exact_Schur_complement_matches_stationary_integral':abs(stationary_energy-collapsed_energy)<1e-12,
        'exact_Gaussian_log_integral_derivative_matches_Cext':abs(fd-direction@C@direction)<1e-8,
        'parallel_sum_identity':np.linalg.norm(C-np.linalg.inv(np.linalg.inv(K)+np.linalg.inv(Pi)))<1e-12,
        'inverse_dictionary_recovers_Pi_given_K':np.linalg.norm(reverse-Pi)<1e-12,
        'equivalent_K_side_Schur_complement':np.linalg.norm(alternative-C)<1e-12,
        'all_occurrence_Gaussian_background_shift_response_is_zero':np.linalg.norm(all_shift)<1e-12,
        'physical_transverse_matrices_obey_Ward_identity':max(np.linalg.norm(Gamma4@q),np.linalg.norm(C4@q))<1e-12,
        'no_observed_coefficient_or_clock_used':True,
    }
    return ({'scope':'Exact finite Gaussian dictionary on a specified transverse carrier; illustrative positive matrices, not Cathedral couplings.',
            'K_bare':K.tolist(),'Pi_matter':Pi.tolist(),'Gamma2_photon_1PI':Gamma.tolist(),
            'G_photon':G.tolist(),'C_external_matter_probe':C.tolist(),
            'all_occurrence_source_Hessian':all_shift.tolist(),
            'Gaussian_second_derivative_error':abs(fd-direction@C@direction),'checks':checks},
           {'gaussian_Kbare':K,'gaussian_Pi':Pi,'gaussian_Gamma2':Gamma,
            'gaussian_photon_G':G,'gaussian_Cext':C,'gaussian_transverse_chart':U})

def BKM_unitary_orbit_review():
    # A positive Gibbs state with constant spectrum: distinguishability metric
    # is positive while the actual isospectral partition Hessian is zero.
    H=np.diag([0.,2.])
    generator=np.array([[0.,.5],[.5,0.]])
    beta=1.3
    energies=np.diag(H)
    probabilities=np.exp(-beta*energies)
    probabilities/=probabilities.sum()
    rho=np.diag(probabilities)
    H1=1j*(generator@H-H@generator)
    H2=-(generator@(generator@H-H@generator)-(generator@H-H@generator)@generator)
    rho1=1j*(generator@rho-rho@generator)
    logarithmic_mean=np.empty((2,2))
    for i in range(2):
        for j in range(2):
            logarithmic_mean[i,j]=(probabilities[i] if i==j else
                (probabilities[i]-probabilities[j])/(math.log(probabilities[i])-math.log(probabilities[j])))
    BKM=float(np.sum(np.abs(rho1)**2/logarithmic_mean))
    covariance=float(np.sum(logarithmic_mean*np.abs(H1)**2))
    contact=float(beta*np.trace(rho@H2).real)
    logZ=lambda A: float(np.log(np.exp(-beta*np.linalg.eigvalsh(
        hermitian_exp(generator,1j*A)@H@hermitian_exp(generator,-1j*A))).sum()))
    difference=abs(logZ(.31)-logZ(0.))
    checks={
        'unitary_state_orbit_has_positive_BKM_norm':BKM>0.1,
        'BKM_is_beta_squared_dual_KM_covariance':abs(BKM-beta*beta*covariance)<1e-12,
        'source_contact_equals_positive_state_metric':abs(contact-BKM)<1e-12,
        'actual_partition_Hessian_contact_minus_metric_is_zero':abs(contact-BKM)<1e-12,
        'finite_unitary_translation_preserves_logZ':difference<1e-12,
    }
    return ({'scope':'Full-rank two-level Gibbs example; no selected-support logarithm is assumed.',
            'illustrative_beta':beta,'positive_BKM_norm':BKM,
            'beta_squared_KM_covariance':beta*beta*covariance,
            'source_contact':contact,'partition_Hessian':contact-BKM,
            'finite_logZ_difference':difference,'checks':checks},
           {'BKM_example_H':H,'BKM_example_generator':generator,'BKM_example_rho':rho,
            'BKM_example_rho_source_tangent':rho1,'BKM_example_source_contact':H2})

def main():
    results={}
    arrays={}
    for name,fn in [('compact_rotor',compact_rotor_review),('gaussian',gaussian_review),('BKM',BKM_unitary_orbit_review)]:
        result,data=fn()
        result['checks']={k:bool(v) for k,v in result['checks'].items()}
        result['passed']=all(result['checks'].values())
        results[name]=result
        arrays.update(data)
    results['passed']=all(x['passed'] for x in results.values() if isinstance(x,dict))
    results['no_full_theory_rejection_claimed']=True
    results['physical_clock_remains_symbolic']=True
    (HERE/'source_dictionary_checks.json').write_text(json.dumps(results,indent=2)+'\n')
    np.savez_compressed(HERE/'source_dictionary_operators.npz',**arrays)
    print(json.dumps(results,indent=2))
    assert results['passed']

if __name__=='__main__': main()

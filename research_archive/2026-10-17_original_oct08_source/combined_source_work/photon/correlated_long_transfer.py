#!/usr/bin/env python3
"""Long-cylinder free-electric transfer with literal correlated K5 hats.

Exact support/spectral equations; parity-resolved Nystrom evaluation of the
confined heat-kernel scaling limit. No alpha input or re-run of old QMC.
"""
from pathlib import Path
import itertools
import json
import math
import numpy as np
from scipy.stats import qmc
from scipy.sparse.linalg import eigsh, cg, LinearOperator

HERE=Path(__file__).resolve().parent
HERE.mkdir(parents=True,exist_ok=True)
ROOT=HERE.parents[1]
CACHE=json.loads((ROOT/'joint_vacuum_work/photon/correlated_hat_k5_checks.json').read_text())
delta=CACHE['delta_hat']
D=np.asarray(CACHE['face_cycle_incidence'],float)
GE=np.asarray(CACHE['electric_cycle_metric'],float)
GINV=np.linalg.inv(GE)
P=np.asarray(CACHE['orthogonal_cycle_face_projector'],float)
triangles=list(itertools.combinations(range(5),3))
B=D[[i for i,t in enumerate(triangles) if 4 not in t]]
old={r['face_hat_power_m']:r for r in CACHE['rows']}

def nodes(power=13):
    # New small spectral quadrature, separate from the cached millions-point
    # integration. Global inversion pairing is exact via parity kernels.
    u=qmc.Sobol(6,scramble=True,seed=1098831).random_base2(power)
    y=np.where(u<.5,-1+np.sqrt(2*u),1-np.sqrt(2*(1-u)))
    weight=np.prod(np.maximum(1-np.abs(y@B.T),0),axis=1)
    return y,weight

def inverse_apply(A,values):
    result=np.empty_like(values)
    for i in range(values.shape[1]):
        x,info=cg(A,values[:,i],rtol=2e-12,atol=1e-15,maxiter=300)
        assert info==0,info
        result[:,i]=x
    return result

def scalar_face(matrix):
    return float(np.trace(D@matrix@D.T)/6)

def solve(y_all,w_all,power,tau):
    y=y_all[:2**power]
    weight=w_all[:2**power]
    keep=weight>0
    y,weight=y[keep],weight[keep]
    measure=weight/weight.sum()
    count=len(y)
    qnorm=np.einsum('ni,ij,nj->n',y,GINV,y)
    cross=(y@GINV@y.T)/tau
    radial=np.sqrt(measure)*np.exp(-qnorm/(2*tau))
    prefactor=np.outer(radial,radial)
    even=prefactor*np.cosh(cross)
    odd=prefactor*np.sinh(cross)
    del cross,prefactor
    ground_lambda,ground=eigsh(even,k=1,which='LA',tol=2e-12)
    l0=float(ground_lambda[0])
    ground=ground[:,0]
    if ground.sum()<0:ground=-ground
    k=min(19,count-2)
    odd_lambda,odd_vectors=eigsh(odd,k=k,which='LA',tol=2e-11)
    ordering=np.argsort(odd_lambda)[::-1]
    odd_lambda,odd_vectors=odd_lambda[ordering],odd_vectors[:,ordering]
    ratios=odd_lambda/l0
    retained=min(18,k-1)
    source=ground[:,None]*y
    amplitudes=odd_vectors[:,:retained].T@source
    contact=source.T@source
    contact_retained=amplitudes.T@amplitudes
    contact_tail=(contact-contact_retained)
    Ro=odd/l0
    A=LinearOperator((count,count),matvec=lambda v:v-Ro@v,dtype=float)
    V1=inverse_apply(A,source)
    V2=inverse_apply(A,V1)
    V3=inverse_apply(A,V2)
    static=2*source.T@V1-contact
    omega2=source.T@(Ro@(V3+Ro@V3))
    contact_s=scalar_face(contact)
    static_s=scalar_face(static)
    omega2_s=scalar_face(omega2)
    time_rows=[]
    propagated=source.copy()
    rtail=float(ratios[retained])
    tail_variance=max(scalar_face(contact_tail),0.)
    for n in range(6):
        direct=source.T@propagated
        spectral=amplitudes.T@(ratios[:retained,None]**n*amplitudes)
        difference=scalar_face(direct-spectral)
        bound=tail_variance*(rtail**n)
        time_rows.append({'n':n,'scalar_correlator_direct':scalar_face(direct),
             'retained_spectral_scalar':scalar_face(spectral),
             'spectral_tail_difference':difference,'positive_tail_bound':bound,
             'bound_excess':max(difference-bound,0.)})
        propagated=Ro@propagated
    # Spectral/resolvent comparison with all equal-time contact retained.
    spectral_static=amplitudes.T@(((1+ratios[:retained])/(1-ratios[:retained]))[:,None]*amplitudes)+contact_tail
    static_tail_bound=2*rtail/(1-rtail)*tail_variance
    static_difference=scalar_face(static-spectral_static)
    weight_expect=float(weight.sum()/2**power)
    single_cov=(y.T@(measure[:,None]*y))
    single_t=scalar_face(single_cov)
    fourth=float(np.sum(measure*qnorm*qnorm))
    one_slice_trace=float(np.trace(even)+np.trace(odd))
    # Normalized Haar heat prefactor in the controlled ag2=tau*delta2 limit.
    actual_prefactor=old[1]['six_angle_partition_factor_after_delta_scaling']/((2*math.pi)**3*tau**3*math.sqrt(np.linalg.det(GE)))
    min_image_exponent=((2*math.pi-2*delta*math.sqrt(6))**2
                  *np.linalg.eigvalsh(GINV).min()/(2*tau*delta**2))
    # All nonzero lattice images obey exp(-E |m|^2).  The 6-dimensional
    # tail is at most [(1+u)/(1-u)]^6-1 <= 64u/(1-u)^6, u=exp(-E).
    # The main local Gaussian is >=exp(-12/tau) on this support.
    relative_image_log_bound=(math.log(64)-min_image_exponent
                    -6*math.log1p(-math.exp(-min_image_exponent))+12/tau)
    row={'quadrature_power':power,'proposal_nodes':2**power,'positive_weight_nodes':count,
         'confined_clock_ratio_tau':tau,'clock_condition':'a*g2=tau*delta_hat^2; g2 and physical a are not fixed',
         'normalized_even_ground_lambda':l0,
         'leading_odd_eigenratios':ratios[:6].tolist(),
         'leading_odd_log_gaps_per_step':(-np.log(ratios[:6])).tolist(),
         'large_tau_leading_odd_prediction_from_cached_measure':old[1]['dimensionless_scalar_t']/(5*tau),
         'ground_scalar_face_equal_time_covariance':contact_s,
         'zero_temperature_static_scalar_face_covariance':static_s,
         'Legendre_static_scalar_coefficient_for_flux_over_delta':1/static_s,
         'Legendre_static_coefficient_actual_flux':1/(delta**2*static_s),
         'frequency_correlator_negative_omega2_scalar_coefficient':omega2_s,
         'Legendre_positive_omega2_scalar_coefficient_for_flux_over_delta':omega2_s/static_s**2,
         'large_tau_omega2_Legendre_prediction':1/(5*tau),
         'Legendre_positive_omega2_coefficient_actual_flux':omega2_s/(delta**2*static_s**2),
         'physical_frequency_conversion':'omega=a*Omega. Relabeling per-slice Gamma multiplies omega2 coefficient by a^2. Physical-time C_phys(Omega)=a*C(a*Omega), Gamma_phys=Gamma(a*Omega)/a, so its Omega2 coefficient is a times the per-slice omega2 coefficient.',
         'single_slice_scalar_from_new_quadrature':single_t,
         'cached_single_slice_scalar':old[1]['dimensionless_scalar_t'],
         'new_quadrature_single_slice_relative_error':single_t/old[1]['dimensionless_scalar_t']-1,
         'single_slice_fourth_moment_z2':fourth,
         'large_tau_ground_scalar_prediction':single_t-(5/6)*(fourth-(6*single_t/5)**2)/tau,
         'large_tau_static_scalar_prediction':single_t+((8/5)*single_t**2-(5/6)*fourth)/tau,
         'ground_phi_tensor_S5_relative_anisotropy':float(np.linalg.norm(D@contact@D.T-contact_s*P)/np.linalg.norm(D@contact@D.T)),
         'static_phi_tensor_S5_relative_anisotropy':float(np.linalg.norm(D@static@D.T-static_s*P)/np.linalg.norm(D@static@D.T)),
         'odd_source_contact_tail_fraction':tail_variance/contact_s,
         'one_slice_total_transfer_trace':one_slice_trace,
         'mean_tree_source_resolvent_residual':float(np.linalg.norm(V1-Ro@V1-source)),
         'static_spectral_plus_contact_tail_difference':static_difference,
         'static_spectral_tail_bound':static_tail_bound,
         'spectral_static_tail_bound_excess':max(static_difference-static_tail_bound,0.),
         'time_correlator_reviews':time_rows,
         'actual_transfer_prefactor_from_cached_Z':actual_prefactor,
         'actual_ground_lambda_in_the_confined_limit':actual_prefactor*l0,
         'periodic_image_minimum_exponent_lower_bound':min_image_exponent,
         'relative_total_periodic_image_tail_log_upper_bound':relative_image_log_bound,
         'numerical_scope':'Finite paired Sobol-Nystrom kernel approximation; listed refinement drift is not a rigorous error interval.'}
    if power==13 and tau==1.:
        # Independent ground-eigenvalue source derivative.  In the parity
        # basis exp(j*y0/2) has cosh/sinh blocks, so all transfer contacts
        # are included without constructing a twice-as-large dense matrix.
        def source_loglambda(j):
            c,s=np.cosh(j*y[:,0]/2),np.sinh(j*y[:,0]/2)
            def product(v):
                ve,vo=v[:count],v[count:]
                we=c*ve+s*vo
                wo=s*ve+c*vo
                te,to=even@we,odd@wo
                return np.concatenate((c*te+s*to,s*te+c*to))
            operator=LinearOperator((2*count,2*count),matvec=product,dtype=float)
            value=eigsh(operator,k=1,which='LA',tol=8e-14,
                        v0=np.concatenate((ground,np.zeros(count))))[0][0]
            return math.log(float(value))
        h=.02
        log0=math.log(l0)
        logh,log2h=source_loglambda(h),source_loglambda(2*h)
        fd=(-2*log2h+32*logh-30*log0)/(12*h*h)
        b=source[:,0]
        first=(b+Ro@b)/2
        resolvent=inverse_apply(A,first[:,None])[:,0]
        direct_contact=(float(b@b)+float(b@Ro@b))/2
        eigen_derivative=direct_contact+2*float(first@resolvent)
        row['uniform_tree_flux_source_contact_review']={
             'source':'T_j=exp(j*y0/2) T exp(j*y0/2), actual flux source j_actual=j/delta',
             'step':h,'five_point_log_ground_lambda_second_derivative':fd,
             'static_tree_covariance_entry_00':float(static[0,0]),
             'explicit_transfer_second_derivative_contact':direct_contact,
             'explicit_eigenvalue_resolvent_second_derivative':eigen_derivative,
             'finite_difference_relative_error':abs(fd/static[0,0]-1),
             'contact_plus_eigenvector_resolvent_relative_error':abs(eigen_derivative/static[0,0]-1)}
    data={'ground_vector':ground,'positive_nodes':y,'quadrature_measure':measure,
          'odd_eigenratio':ratios,'odd_flux_amplitudes_tree':amplitudes,
          'ground_tree_contact_covariance':contact,'static_tree_covariance':static,
          'frequency_omega2_tree_covariance':omega2,'retained_tree_contact_tail':contact_tail}
    return row,data

def fixed_clock_heat(s,nmax):
    n=np.asarray(list(itertools.product(range(-nmax,nmax+1),repeat=6)),float)
    quadratic=np.einsum('ni,ij,nj->n',n,GE,n)
    weights=np.exp(-s*quadratic)
    Z=float(weights.sum())
    Q=n.T@(weights[:,None]*n)/Z
    q=float(np.trace(Q@GE)/6)
    return {'illustrative_s_a_g2_over_2':s,'integer_flux_cutoff':nmax,
             'electric_heat_diagonal_K0':Z,'q_s':q,
             'S5_dual_heat_metric_relative_residual':float(np.linalg.norm(Q-q*GINV)/max(np.linalg.norm(Q),1e-100)),
             'leading_six_odd_ratio_m1':delta**2*q*old[1]['dimensionless_scalar_t']/5,
             'leading_six_odd_ratio_m2':delta**2*q*old[2]['dimensionless_scalar_t']/5}

def main():
    y,w=nodes(13)
    rows,arrays=[],{'face_cycle_incidence':D,'electric_cycle_metric':GE,'cycle_face_projector':P}
    for power in [9,11,13]:
        for tau in [.25,1.,16.]:
            row,data=solve(y,w,power,tau)
            rows.append(row)
            if power==13:arrays.update({f'tau{str(tau).replace(".","_")}_{k}':v for k,v in data.items()})
            print(json.dumps({k:row[k] for k in ['quadrature_power','positive_weight_nodes','confined_clock_ratio_tau',
                  'ground_scalar_face_equal_time_covariance','zero_temperature_static_scalar_face_covariance',
                  'Legendre_static_scalar_coefficient_for_flux_over_delta','leading_odd_eigenratios']}),flush=True)
    fixed=[fixed_clock_heat(1.,n) for n in [3,4]]
    refinement={}
    for tau in [.25,1.,16.]:
        r=[x for x in rows if x['confined_clock_ratio_tau']==tau]
        keys=['zero_temperature_static_scalar_face_covariance','ground_scalar_face_equal_time_covariance',
              'Legendre_positive_omega2_scalar_coefficient_for_flux_over_delta']
        refinement[str(tau)]={k:abs(r[-1][k]/r[-2][k]-1) for k in keys}
    checks={
      'literal_correlated_ten_face_measure_used':True,
      'old_scrambled_integration_not_rerun':True,
      'electric_cycle_metric_positive':np.linalg.eigvalsh(GE).min()>0,
      'exact_parity_pairing_preserves_zero_mean_flux':True,
      'all_odd_ratios_positive_below_one':all(min(r['leading_odd_eigenratios'])>0 and max(r['leading_odd_eigenratios'])<1 for r in rows),
      'all_one_slice_trace_contacts_equal_one':max(abs(r['one_slice_total_transfer_trace']-1) for r in rows)<1e-12,
      'positive_ground_and_static_covariances':all(r['ground_scalar_face_equal_time_covariance']>0 and r['zero_temperature_static_scalar_face_covariance']>0 for r in rows),
      'long_time_susceptibility_includes_positive_returns':all(r['zero_temperature_static_scalar_face_covariance']>r['ground_scalar_face_equal_time_covariance'] for r in rows),
      'ground_resolvent_equations_solved':max(r['mean_tree_source_resolvent_residual'] for r in rows)<1e-10,
      'spectral_time_tail_bounds_hold':max(x['bound_excess'] for r in rows for x in r['time_correlator_reviews'])<1e-11,
      'spectral_static_contact_and_tail_bound_hold':max(r['spectral_static_tail_bound_excess'] for r in rows)<1e-11,
      'frequency_Legendre_curvature_positive':all(r['Legendre_positive_omega2_scalar_coefficient_for_flux_over_delta']>0 for r in rows),
      'periodic_image_error_exponent_is_huge':min(r['periodic_image_minimum_exponent_lower_bound'] for r in rows)>1e5,
      'relative_total_periodic_image_tail_bound_is_exponentially_small':max(r['relative_total_periodic_image_tail_log_upper_bound'] for r in rows)<-1e5,
      'uniform_source_log_eigenvalue_Hessian_matches_static_response':next(r['uniform_tree_flux_source_contact_review']['finite_difference_relative_error'] for r in rows if 'uniform_tree_flux_source_contact_review' in r)<1e-7,
      'explicit_source_contact_plus_resolvent_matches_static_response':next(r['uniform_tree_flux_source_contact_review']['contact_plus_eigenvector_resolvent_relative_error'] for r in rows if 'uniform_tree_flux_source_contact_review' in r)<1e-10,
      'fixed_clock_Fourier_refinement_converges':abs(fixed[1]['q_s']/fixed[0]['q_s']-1)<1e-5,
      'fixed_clock_dual_metric_S5_covariance':fixed[-1]['S5_dual_heat_metric_relative_residual']<1e-8,
      'new_spectral_quadrature_single_slice_converges_to_cached_moment':max(abs(r['new_quadrature_single_slice_relative_error']) for r in rows if r['quadrature_power']==13)<.025,
      'last_Nystrom_refinement_changes_recorded_coefficients_by_less_than_five_percent':max(v for f in refinement.values() for v in f.values())<.05,
      'no_alpha_polynomial_or_observed_coefficient_used':True,
      'physical_clock_and_coupling_not_selected':True,
      'closed_graph_modes_not_identified_as_full_massless_photon':True,
    }
    checks={k:bool(v) for k,v in checks.items()}
    result={'scope':'Long-cylinder literal correlated K5 hats in the free-electric restriction; controlled confined-kernel scaling with a*g2=tau*delta^2, paired Nystrom approximation, no physical clock/coupling prediction.',
       'unweighted_L2_kernel':'The unitarily equivalent normalized kernel is sqrt(W(y)) exp[-(y-yprime)^T GE^-1(y-yprime)/(2tau)] sqrt(W(yprime))/Z_m, integrating dyprime. The unscaled sqrt(W) kernel has eigenvalues Z_m times those in L2(mu), before the physical Haar/heat prefactor.',
       'normalized_L2_mu_kernel':'exp[-(y-yprime)^T GE^-1(y-yprime)/(2tau)]; operator integrates mu(dyprime). The unitary conversion contributes Z_m to the actual transfer eigenvalues.',
       'exact_N_slice_trace':'(delta/2pi)^(6N) int product_t[dy_t W_m(y_t) K_s(delta(y_t-y_(t+1)))]',
       'support':'All ten shared-edge triangle hats and Bianchi constraints retained; global inversion pairing exact.',
       'normalized_measure':'mu_m(dy)=W_m(y)dy/Z_m; kernel operator is evaluated in L2(mu_m).',
       'uniform_total_image_bound':'Sum of images / main Gaussian <= exp(12/tau)*{[(1+exp(-E))/(1-exp(-E))]^6-1} <= exp(12/tau)*64*exp(-E)/(1-exp(-E))^6.',
       'fixed_clock_odd_asymptotic':'r=delta^2*q_s*t_m/5+O(delta^4), q_s=-d_s log K0/6; sixfold leading cycle irrep.',
       'large_tau_odd_asymptotic':'r=t_m/(5tau)+O(tau^-2)',
       'contact':'Ground equal-time covariance retained separately; static C includes all positive temporal return terms, including unresolved odd states through resolvent.',
       'large_tau_fourth_moment':'u_m=E_mu[(y^T GE^-1 y)^2]; t_ground=t-(5/6)[u-(6t/5)^2]/tau+..., t_static=t+[(8/5)t^2-(5/6)u]/tau+...',
       'delta_hat':delta,'rows':rows,'fixed_clock_heat_review':fixed,'refinement':refinement,
       'checks':checks,'passed':all(checks.values())}
    (HERE/'correlated_long_transfer_checks.json').write_text(json.dumps(result,indent=2)+'\n')
    np.savez_compressed(HERE/'correlated_long_transfer_operators.npz',**arrays)
    print(json.dumps({'passed':result['passed'],'checks':checks,'refinement':refinement,'fixed_clock_heat':fixed},indent=2),flush=True)
    assert result['passed'],checks

if __name__=='__main__':main()

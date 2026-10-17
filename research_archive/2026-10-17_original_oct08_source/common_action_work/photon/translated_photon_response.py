#!/usr/bin/env python3
"""Common E^2 + translated-cosine tangent, exact sources, and literal hats.

All 13^4 lattice symbols are checked. A conditional single Fourier-pair
restriction retains every translated face hat; it is not a full-mode marginal.
No measured couplings, alpha root or backwards normalization is used.
"""
from pathlib import Path
import hashlib, importlib.util, itertools, json, math, os, tempfile, time
import numpy as np
from scipy.linalg import null_space
from scipy.integrate import quad
from scipy.special import roots_genlaguerre
from scipy.sparse.linalg import eigsh, cg, LinearOperator

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[1]
spec=importlib.util.spec_from_file_location('actual_a4',ROOT/'derive_three_work/photon/a4_entropy_gaussian.py')
geom=importlib.util.module_from_spec(spec);spec.loader.exec_module(geom)
N=13;sites=N**4
old=json.loads((ROOT/'response_join_work/photon/harmonic_mehler_response_checks.json').read_text())
delta=old['delta_hat']
INPUTS=['continued_physics_work/theory/current_theory_specification.md',
 'Cathedral_Coupled_Responses_2026-10-08.md',
 'canonical_recovery_work/v54_source_search/Newton_Cathedral_v54_Explicit_Local_Hamiltonian_Theorem.md',
 'derive_three_work/photon/a4_entropy_gaussian.py',
 'response_join_work/photon/harmonic_mehler_response_checks.json',
 'response_join_work/normalization/compact_source_normalization_checks.json']

def digest(p):
    h=hashlib.sha256()
    with Path(p).open('rb') as f:
        for b in iter(lambda:f.read(2**20),b''):h.update(b)
    return h.hexdigest()

def wedge(v):
    A=np.zeros((10,5),complex)
    for k,(i,j) in enumerate(geom.edges):A[k,i]=-v[j];A[k,j]=v[i]
    return A

def symbol(q):
    M=geom.incidence(q,True);K=M.conj().T@M
    g=2*np.sin(np.asarray(q)@geom.roots.T/2)
    P=np.eye(10)-np.outer(g,g)/(g@g) if g@g>1e-20 else np.eye(10)
    ev,U=np.linalg.eigh(K);keep=ev>1e-9
    return M,K,g,P,ev[keep],U[:,keep]

def oscillator(omega,a,g2,nu):
    x=a*omega;r=math.exp(-x);C0=g2/(2*omega)
    seam=C0*math.sinh(x)/(math.cosh(x)-math.cos(nu))
    same=2*C0*(x-1+r)/x**2
    generator=2*C0/x*(1-(1-r*r)*(1-math.cos(nu))/(x*(1-2*r*math.cos(nu)+r*r)))
    return dict(seam=seam,symmetric=math.cos(nu/2)**2*seam,generator=generator,
      generator_same_slice_contact=same,seam_static=2*C0*math.cosh(x/2)/math.sinh(x/2)/2,
      continuous_static=g2/omega**2,seam_physical_static_inverse=2*omega/(a*g2)*math.tanh(x/2),
      generator_physical_static_inverse=omega**2/g2,
      seam_physical_frequency2=x/(g2*math.sinh(x)),
      generator_physical_frequency2=x/(2*g2)*math.cosh(x/2)/math.sinh(x/2))

def full_lattice():
    integer=np.asarray(list(itertools.product(range(-6,7),repeat=4)))
    qs=integer*(2*math.pi/N)
    phases=np.column_stack((qs,np.zeros(sites)))
    sums=np.sum(np.exp(1j*phases),axis=1);sabs=np.abs(sums)
    low=5-sabs;high=5+sabs;lap=25-sabs*sabs
    closed=np.column_stack((np.zeros(sites),np.repeat(low[:,None],3,axis=1),
       np.repeat(high[:,None],3,axis=1),10*np.ones((sites,3))))
    M=geom.incidence(qs,True)
    K=np.einsum('pfa,pfb->pab',M.conj(),M,optimize=True)
    computed=np.linalg.eigvalsh(K)
    wards=2*np.sin(qs@geom.roots.T/2)
    ward=float(np.max(np.abs(np.einsum('pfa,pa->pf',M,wards))))
    gauss_laplacian_error=float(np.max(np.abs(np.sum(wards*wards,axis=1)-lap)))
    residual=float(np.max(np.abs(computed-closed)))
    del M,K
    samples=[];arrays={'all_integer_modes':integer,'all_cosine_Hessian_spectrum':closed,
      'all_low_band_poles_in_graph_energy_units':np.sqrt(np.maximum(low,0)),
      'all_high_band_poles_in_graph_energy_units':np.sqrt(high),
      'all_scalar_laplacian':lap,'root_coframe':geom.physical_roots}
    wedge_errors=[];inverse_errors=[];face_errors=[];current_errors=[];contact_errors=[];coframe_ward=[]
    for k,iq in enumerate([[1,0,0,0],[1,-1,0,0],[1,2,3,4]]):
        q=np.asarray(iq)*2*math.pi/N
        M,K,g,P,ev,U=symbol(q);u=np.exp(.5j*np.r_[q,0]);L=wedge(u)
        closedK=10*np.eye(10)-L@L.conj().T-L.conj()@L.T
        wedge_errors.append(float(np.max(np.abs(K-closedK))))
        a=.7;g2=.8;b=1/g2;physical_frequency=.31;nu=a*physical_frequency
        om=np.sqrt(b*g2*ev)
        continuous=(U*(g2/(physical_frequency**2+om**2)))@U.conj().T
        seam=(U*np.array([a*oscillator(o,a,g2,nu)['seam'] for o in om]))@U.conj().T
        action=(physical_frequency**2/g2)*P+b*K
        inverse_errors.append(float(np.linalg.norm(action@continuous-P)))
        # At nonzero q the complete incidence is injective on the Gauss
        # quotient; all20 face observations reconstruct the same field kernel.
        F=M@continuous@M.conj().T
        pull=M.conj().T@np.linalg.pinv(F,rcond=1e-12)@M
        face_errors.append(float(np.linalg.norm(pull-action)/np.linalg.norm(action)))
        # An actual triangle Wilson cochain has zero divergence. Its source
        # variance is identical in the link and full-face dictionaries.
        flow=M[0].conj();variance=float(np.vdot(flow,continuous@flow).real)
        current_errors.append(abs(float(F[0,0].real)-variance))
        h=.0005
        characteristic=lambda t:math.exp(-t*t*variance/2)
        contact_fd=(characteristic(h)-2+characteristic(-h))/h**2
        contact_errors.append(abs(contact_fd/(-variance)-1))
        J=geom.chart(q);hidden=null_space(J.T);HH=hidden.conj().T@K@hidden
        mixed=J.T@K@hidden
        static=(J.T@K@J-mixed@np.linalg.solve(HH,mixed.conj().T))/(g2*geom.cell_volume)
        temporal=(J.T@P@J+mixed@np.linalg.solve(HH,np.linalg.solve(HH,mixed.conj().T)))/(g2*geom.cell_volume)
        qp=np.linalg.solve(geom.E.T,q)
        coframe_ward.append(float(max(np.linalg.norm(J@qp-g),np.linalg.norm(static@qp),np.linalg.norm(temporal@qp))))
        tr=np.linalg.qr(np.column_stack((qp,np.eye(4))))[0][:,1:]
        samples.append({'integer_mode':iq,'kappa_low':float(ev[0]),'low_pole':float(om[0]),
          'g2_witness':g2,'a_witness':a,'frequency_witness':physical_frequency,
          'continuous_inverse_residual':inverse_errors[-1],'allface_Legendre_pullback_residual':face_errors[-1],
          'triangle_current_variance':variance,'Ward_current_divergence':float(abs(np.vdot(g,flow))),
          'bare_Coulomb_kernel_for_unit_charge_density':g2/float(g@g),
          'coframe_static_transverse_per_volume':np.linalg.eigvalsh(tr.T@static@tr).tolist(),
          'coframe_temporal_transverse_per_volume':np.linalg.eigvalsh(tr.T@temporal@tr).tolist(),
          'seam_low_band':oscillator(float(om[0]),a,g2,nu)})
        arrays.update({f'sample{k}_M20':M,f'sample{k}_K20':K,f'sample{k}_continuous_link_covariance':continuous,
          f'sample{k}_physical_seam_link_covariance':seam,f'sample{k}_face_covariance':F,
          f'sample{k}_source_triangle_current':flow,f'sample{k}_coframe_static':static,
          f'sample{k}_coframe_temporal':temporal})
    # Analytic continuum tensor coefficients with no target coefficient.
    qphys=np.array([1.,2.,-1.,-2.]);qphys/=np.linalg.norm(qphys)
    leading,_=geom.analytic_leading(qphys,True)
    kinetic=geom.physical_roots.T@geom.physical_roots/geom.cell_volume
    near=[]
    for eps in [.001,.0005]:
        q=geom.E.T@(eps*qphys);M,K,g,P,ev,U=symbol(q)
        near.append(float(ev[0]/eps**2))
    # Exact Duhamel bin contacts checked against independent continuous
    # integrals for one of the actual low-band oscillators.
    om=math.sqrt(samples[1]['kappa_low']);a=.7;g2=.8;x=a*om;r=math.exp(-x);C0=g2/(2*om)
    same=2*C0*quad(lambda t:(1-t)*math.exp(-x*t),0,1,epsabs=1e-13)[0]
    separated=C0*quad(lambda s:quad(lambda t:math.exp(-x*(1+s-t)),0,1,epsabs=1e-13)[0],0,1,epsabs=1e-13)[0]
    bincheck={'same_slice_integral':same,'same_slice_formula':oscillator(om,a,g2,0)['generator_same_slice_contact'],
       'separated_slice_integral':separated,'separated_slice_formula':C0*(1-r)**2/x**2,
       'physical_static_bin_sum':g2/om**2,'physical_continuous_static':g2/om**2}
    row={'analytic_symbol_identity':'K20=10I-L_u L_u^dagger-L_conj(u)L_conj(u)^dagger on Lambda2C5; u_i=exp(i alpha_i/2)',
      'analytic_spectrum':'0;(5-|S|)times3;(5+|S|)times3;10times3, S=sum_5 exp(i alpha)',
      'all_modes':sites,'spectrum_max_error':residual,'Ward_max_error':ward,
      'Gauss_laplacian_identity_max_error':gauss_laplacian_error,
      'exact_sinc_coframe_Ward_max_error':max(coframe_ward),
      'matrix_wedge_identity_max_error':max(wedge_errors),'propagator_inverse_max_error':max(inverse_errors),
      'fullface_Legendre_pullback_max_relative_error':max(face_errors),'Wilson_characteristic_contact_max_error':max(contact_errors),
      'triangle_current_face_match_max_error':max(current_errors),
      'unit_g2_continuum_electric_coefficient_per_volume':float(np.trace(kinetic)/4),
      'unit_b_continuum_spatial_coefficient_per_volume':leading['unit_curvature_coefficient'],
      'canonical_unit_chart_speed_squared':leading['unit_curvature_coefficient']/float(np.trace(kinetic)/4),
      'direct_near_zero_kappa_over_q2':near,
      'samples':samples,'Duhamel_bin_contact_check':bincheck}
    return row,arrays

def mode_data():
    iq=np.array([1,-1,0,0]);q=iq*2*np.pi/N;M,K,g,P,ev,U=symbol(q)
    kappa=float(ev[0]);slow=U[:,:3]@U[:,:3].conj().T
    qp=np.linalg.solve(geom.E.T,q)
    time_direction=geom.E@np.full(4,-1/math.sqrt(20))
    spatial=np.linalg.qr(np.column_stack((time_direction,qp,np.eye(4))))[0][:,2:]
    u=(slow@geom.chart(q)@spatial[:,0]).real;u/=np.linalg.norm(u)
    if u[np.argmax(np.abs(u))]<0:u=-u
    v=M@u;phase=np.exp(2j*np.pi*np.arange(N)/N)
    coeff=(v[:,None]*phase[None,:]).ravel()
    # The all-site translated measure has N/13 copies of each of the13
    # phases for this nonzero Fourier mode. This count is exact.
    def ell(theta):
        return math.sqrt(2)/N*np.sum(np.abs((np.exp(1j*np.asarray(theta)[:,None])*coeff[None,:]).real),axis=1)
    angles=np.mod(np.pi/2-np.angle(coeff[np.abs(coeff)>1e-14]),np.pi)
    cmin=float(np.min(ell(angles)))
    return {'integer_mode':iq.tolist(),'kappa':kappa,'u':u,'v':v,'coeff':coeff,'ell':ell,'cmin':cmin,
      'Ward':float(abs(g@u)),'time_component_q':float(qp@time_direction)}

def pair_nodes(md,nr,nt):
    t,w=roots_genlaguerre(nr,1)
    theta=np.arange(nt)*np.pi/nt;rates=md['ell'](theta)
    r=(t[:,None]/rates[None,:]).ravel();angle=np.tile(theta,nr)
    nodes=np.column_stack((r*np.cos(angle),r*np.sin(angle)))
    # z_mode=(delta/sqrt(sites))*xi. Each face has
    # F/delta=(sqrt2/sites) Re(v*(xi0+i xi1)*phase).
    amplitude=math.sqrt(2)/sites*np.abs(((nodes[:,0,None]+1j*nodes[:,1,None])*md['coeff'][None,:]).real)
    logs=np.where(amplitude<1,np.log1p(-np.minimum(amplitude,1-1e-16)),-np.inf).sum(axis=1)*(sites/N)
    measure=(2*np.pi/nt*np.repeat(w,nt)/np.tile(rates,nr)**2)*np.exp(np.repeat(t,nt)+logs)
    Z=float(measure.sum());Zlinear=float(2*np.pi/nt*np.sum(1/rates**2))
    return nodes,measure/Z,Z,Zlinear

def cosine_control(md,tau,omega):
    a=omega/math.sqrt(md['kappa']);Rcut=40.
    rawtail=2*math.pi*math.exp(-md['cmin']*Rcut)*(Rcut/md['cmin']+1/md['cmin']**2)
    rem=a*a*delta**2*np.sum(abs(md['v'])**4)/(24*tau*sites**2)*(
        4*Rcut**4+6*Rcut**2*tau+.75*tau**2)
    ell_upper=math.sqrt(2)*np.sum(abs(md['v']))
    maximum_unitball_hat_argument=math.sqrt(2)/sites*np.max(abs(md['v']))
    Zlower=math.pi*math.exp(-ell_upper/(1-maximum_unitball_hat_argument))
    Zupper=2*math.pi/md['cmin']**2
    operator_bound=rem+math.sqrt(2*rawtail/Zlower)
    p=omega/math.sinh(omega);h=omega/math.tanh(omega)
    ground_lower=p*math.exp(-(h+p)/tau)*Zlower/Zupper
    return {'analytic_selector_absolute_mass_tail_outside_radius40_upper_bound':rawtail,
      'full_cosine_vs_harmonic_pointwise_bound_relative_to_free_on_radius40':float(rem),
      'analytic_selector_Zprime_lower_bound':float(Zlower),
      'analytic_selector_Zprime_upper_bound':float(Zupper),
      'restricted_cosine_vs_harmonic_continuum_operator_norm_bound':float(operator_bound),
      'restricted_harmonic_continuum_ground_eigenvalue_lower_bound':float(ground_lower),
      'restricted_cosine_continuum_ground_relative_change_upper_bound':float(operator_bound/ground_lower)}

def solve_pair(md,nr,nt,tau,omega,source_check=False):
    y,m,Z,Zlinear=pair_nodes(md,nr,nt);n=len(y)
    p=omega/math.sinh(omega);h=omega/math.tanh(omega)
    radius=np.sum(y*y,axis=1);cross=p*(y@y.T)/tau
    base=h*(radius[:,None]+radius[None,:])/(2*tau)
    outer=p*np.sqrt(np.outer(m,m))
    plus,minus=np.exp(-base+cross),np.exp(-base-cross)
    E=.5*outer*(plus+minus);O=.5*outer*(plus-minus)
    val,g=eigsh(E,k=2,which='LA',tol=2e-12);order=np.argsort(val)[::-1];val=val[order];g=g[:,order]
    lam=float(val[0]);ground=g[:,0]
    if ground.sum()<0:ground=-ground
    odd=eigsh(O,k=2,which='LA',tol=2e-12)[0]
    ratios=odd/lam;R=O/lam;B=ground[:,None]*y
    A=LinearOperator(R.shape,matvec=lambda t:t-R@t,dtype=float)
    def inv(rhs):
        out=np.empty_like(rhs)
        for j in range(rhs.shape[1]):
            out[:,j],info=cg(A,rhs[:,j],rtol=2e-12,atol=1e-14,maxiter=400);assert info==0
        return out
    V1=inv(B);V2=inv(V1);V3=inv(V2)
    C0=B.T@B;Cs=2*B.T@V1-C0;Dw=B.T@(R@(V3+R@V3))
    scalar=lambda C:float(np.trace(C)/2)
    t0,tstatic,dw=map(scalar,[C0,Cs,Dw])
    # Canonical harmonic frequency omega=a*sqrt(kappa), in graph units.
    a=omega/math.sqrt(md['kappa']);g2=tau*delta**2/(a*sites)
    Rcut=40.
    row={'radial_order':nr,'half_circle_angles':nt,'positive_parity_nodes':n,'tau_mode':tau,'omega':omega,
      'selector_chart':'xi=sqrt(sites)*z_mode/delta; all20*13^4 literal translated hats,13 distinct wave phases each with2197 copies',
      'a_witness':a,'g2_witness':g2,'Zprime_exact_hat_quadrature_estimate':Z,
      'ground_lambda_in_L2_mu':lam,'actual_selected_ground_lambda':Z*lam/(2*np.pi*tau),
      'leading_odd_ratios':ratios.tolist(),'selected_dimensionless_transfer_gap':-math.log(float(max(ratios))),
      'selected_physical_gap_in_graph_units':-math.log(float(max(ratios)))/a,
      'unselected_physical_gap_in_graph_units':math.sqrt(md['kappa']),
      'selected_equal_time_covariance_xi':t0,'selected_seam_static_covariance_xi':tstatic,
      'selected_seam_static_inverse_xi':1/tstatic,'selected_seam_frequency2_inverse_xi':dw/tstatic**2,
      'unselected_seam_static_covariance_xi':tau/(2*omega)*math.cosh(omega/2)/math.sinh(omega/2),
      'unselected_seam_frequency2_inverse_xi':omega/(tau*math.sinh(omega)),
      'covariance_rotational_residual':float(np.linalg.norm(Cs-tstatic*np.eye(2))/np.linalg.norm(Cs)),
      'exact_hat_vs_linear_cusp_mass_relative_change_estimate':Z/Zlinear-1,
      'finite_quadrature_mass_outside_radius40':float(m[np.linalg.norm(y,axis=1)>Rcut].sum()),
      'scope':'Conditional restriction that freezes all other Fourier modes atzero, not the marginal of the full selected field. Quadrature error separate; no physical coupling selected.'}
    row.update(cosine_control(md,tau,omega))
    if source_check:
        def loglambda(j):
            c,s=np.cosh(j*y[:,0]/2),np.sinh(j*y[:,0]/2)
            def act(v):
                e,o=v[:n],v[n:];we,wo=c*e+s*o,s*e+c*o
                te,to=E@we,O@wo
                return np.r_[c*te+s*to,s*te+c*to]
            op=LinearOperator((2*n,2*n),matvec=act,dtype=float)
            return math.log(float(eigsh(op,k=1,which='LA',tol=8e-14,v0=np.r_[ground,np.zeros(n)])[0][0]))
        j=.015;fd=(-2*loglambda(2*j)+32*loglambda(j)-30*math.log(lam))/(12*j*j)
        row['uniform_source_static_contact_relative_error']=abs(fd/Cs[0,0]-1)
    return row,{'nodes':y,'measure':m,'ground_vector':ground,'equal_time_covariance':C0,
       'static_covariance':Cs,'frequency2_covariance':Dw}

def main():
    started=time.perf_counter();lattice,arrays=full_lattice();md=mode_data()
    rows=[]
    for nr,nt in [(6,26),(10,52),(14,78),(20,104),(28,130)]:
        for tau,omega in [(1.,.1),(1.,1.),(16.,1.)]:
            row,ar=solve_pair(md,nr,nt,tau,omega,source_check=(nr==28 and tau==1 and omega==1))
            rows.append(row)
            if nr==28:arrays.update({f'pair_tau{tau}_omega{omega}_{k}':v for k,v in ar.items()})
            print(json.dumps({k:row[k] for k in ['radial_order','half_circle_angles','tau_mode','omega',
               'selected_seam_static_covariance_xi','selected_seam_frequency2_inverse_xi','selected_physical_gap_in_graph_units']}),flush=True)
    arrays.update({'pair_mode_u':md['u'],'pair_mode_face_amplitudes':md['v']})
    drift={}
    for tau,omega in [(1.,.1),(1.,1.),(16.,1.)]:
        a,b=[q for q in rows if q['tau_mode']==tau and q['omega']==omega][-2:]
        drift[f'tau{tau}_omega{omega}']={k:abs(b[k]/a[k]-1) for k in
          ['Zprime_exact_hat_quadrature_estimate','selected_seam_static_covariance_xi','selected_seam_frequency2_inverse_xi']}
    contacts=lattice['Duhamel_bin_contact_check']
    checks={'all28561_momenta_checked':lattice['all_modes']==sites,
      'analytic_full_translated_spectrum_matches':lattice['spectrum_max_error']<1e-11,
      'Gauss_Ward_allmomenta':lattice['Ward_max_error']<2e-12,
      'Gauss_laplacian_same_scalar_cochain':lattice['Gauss_laplacian_identity_max_error']<1e-11,
      'exact_sinc_coframe_static_and_temporal_Ward':lattice['exact_sinc_coframe_Ward_max_error']<1e-11,
      'wedge_exact_symbol_identity':lattice['matrix_wedge_identity_max_error']<2e-12,
      'continuous_canonical_propagator_inverse':lattice['propagator_inverse_max_error']<1e-11,
      'allface_Legendre_pullback_reconstructs_transverse_kernel':lattice['fullface_Legendre_pullback_max_relative_error']<1e-10,
      'Wilson_triangle_source_contact_and_face_variance':lattice['Wilson_characteristic_contact_max_error']<1e-6 and lattice['triangle_current_face_match_max_error']<1e-12,
      'electric_coframe_coefficient_sqrt5':abs(lattice['unit_g2_continuum_electric_coefficient_per_volume']-math.sqrt(5))<1e-12,
      'spatial_coframe_coefficient_sqrt5over2':abs(lattice['unit_b_continuum_spatial_coefficient_per_volume']-math.sqrt(5)/2)<1e-12,
      'canonical_unit_chart_speed_squared_onehalf':abs(lattice['canonical_unit_chart_speed_squared']-.5)<1e-12,
      'direct_low_band_continuum_dispersion':max(abs(v-.5) for v in lattice['direct_near_zero_kappa_over_q2'])<1e-6,
      'generator_same_slice_contact_integral':abs(contacts['same_slice_integral']-contacts['same_slice_formula'])<1e-12,
      'generator_separated_slice_integral':abs(contacts['separated_slice_integral']-contacts['separated_slice_formula'])<1e-12,
      'selected_mode_source_is_Gauss_transverse':md['Ward']<1e-12,
      'selected_mode_probe_is_spatial_q_time_zero':abs(md['time_component_q'])<1e-12,
      'all_literal_hat_selected_responses_positive':all(q['selected_seam_static_covariance_xi']>0 and q['selected_seam_frequency2_inverse_xi']>0 for q in rows),
      'literal_fullregistry_rotational_covariance':max(q['covariance_rotational_residual'] for q in rows)<1e-10,
      'literal_selector_changes_same_action_response':all(abs(q['selected_seam_static_covariance_xi']/q['unselected_seam_static_covariance_xi']-1)>.05 for q in rows),
      'selected_uniform_source_contacts_verified':next(q for q in rows if 'uniform_source_static_contact_relative_error' in q)['uniform_source_static_contact_relative_error']<1e-7,
      'restricted_full_cosine_vs_harmonic_control_on_radius40':max(q['full_cosine_vs_harmonic_pointwise_bound_relative_to_free_on_radius40'] for q in rows)<1e-9,
      'literal_selector_mass_outside_radius40_negligible':max(q['analytic_selector_absolute_mass_tail_outside_radius40_upper_bound'] for q in rows)<1e-20,
      'restricted_continuum_cosine_ground_control':max(q['restricted_cosine_continuum_ground_relative_change_upper_bound'] for q in rows)<1e-7,
      'last_selected_quadrature_drift_below_five_percent':max(v for d in drift.values() for v in d.values())<.05,
      'no_fullGaussian_claim_for_nonGaussian_hat':True,'same_charge_source_not_fitted_to_alpha':True,
      'physical_clock_and_common_coupling_remain_symbolic':True}
    checks={k:bool(v) for k,v in checks.items()}
    result={'scope':'Actual translated cosine quadratic + electric Gauss tangent; exact full Gaussian source/poles, literal hats retained analytically, conditional all-translated one-Fourier-pair selected calculation. Not full interacting selected photon.',
      'parameters':'H=g2 E2/2 + b A^dagger K20 A/2; omega_band^2=b*g2*kappa. Canonical unit-charge factor has b=1/g2; electroweak charge normalization must be mapped before calling g2 physical e2.',
      'delta_hat':delta,'lattice':lattice,'selected_mode':{'integer_mode':md['integer_mode'],'kappa':md['kappa'],'ell_min':md['cmin'],
         'mode_norm':'u^dagger u=1, Fourier real pair normalization sqrt(2/sites), fixed by electric cochain metric'},
      'selected_pair_rows':rows,'selected_pair_last_refinement':drift,'checks':checks,'passed':all(checks.values()),
      'source_sha256':{p:digest(ROOT/p) for p in INPUTS},'script_sha256':digest(Path(__file__))}
    with tempfile.NamedTemporaryFile(dir=HERE,suffix='.npz',delete=False) as f:tmp=Path(f.name)
    try:
        np.savez_compressed(tmp,**arrays);os.replace(tmp,HERE/'translated_photon_response_operators.npz')
    finally:
        if tmp.exists():tmp.unlink()
    result.update(archive_sha256=digest(HERE/'translated_photon_response_operators.npz'),array_count=len(arrays),elapsed_seconds=time.perf_counter()-started)
    (HERE/'translated_photon_response_checks.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({'checks':checks,'passed':result['passed'],'refinement':drift,'elapsed':result['elapsed_seconds']},indent=2))
    assert result['passed'],checks

if __name__=='__main__':main()

# URT–ZPE: native boost stationarity and exact modular operator

2026-11-21. Parent 871d8bc. Standalone entropy path, not RH or Cathedral. THEOREM / CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING for the declared magnetic oscillator and midpoint leading-lapse coupling. No cosmological coefficient fitted.

Prior work: bbfb2d5 defined the same-state entropy and de Sitter near-horizon lapse energy; 871d8bc numerically separated the thermal reference free energy and relative entropy. At the tested depth96, the excess was nonzero; increasing size is not a proof of convergence to unity. This report derives the actual modular generator and its exact difference from the chosen lapse prescription.

## 1. A nonzero infinite-volume stationarity residual

Retain L on the infinite cubic magnetic lattice, true degree six, original links Ux=exp(if z), Uy=exp(if x), Uz=exp(if y), F=|f|, f=Arg(epsilon exp(-2pi i/phi^2)). W=sqrt(L), V=W^-1, bounded by the original uniform gap and upper bound 12. Let signed D be multiplication by distance d=x+1/2, A={x>=0}. The lapse-weighted internal stiffness M on A equals the A compression of M_full={D,L}/2: each edge crossing the cut has midpoint d=0 and at each full-lattice site the signed differences of the incident edge weights sum to zero. Let Q=V_A, P=W_A (twice the canonical covariances). For the complex oscillator realification of (p D_A p + q M q)/2, covariance stationarity demands Q M=D_A P. Define R_A=Q M-D_A P.

Exact identity on full lattice:
R_full=V{D,L}/2-DW = (1/2)V[W,[W,D]].
The commutators are bounded: the original gap yields exponential decay of the kernels of sqrt(L) by polynomial expansion, and multiplying the kernel by the coordinate difference preserves a finite uniform absolute row and column sum. Therefore the commutator algebra extends from finitely supported vectors. Since the midpoint crossing links vanish, R_A is exactly its compression to A.

Write C=[W,[W,D]], then [L,[L,D]]={W,{W,C}}. For one xy diagonal displacement i->j=i+ex+ey, only two paths contribute to the double commutator, with coefficients d_i+d_j-2d_k equal +1 and -1. Their products differ by the original plaquette phase, so
|[L,[L,D]]_ij|=|1-exp(if)|=2|sin(f/2)|>0.
Hence R_full is nonzero, and ||R_full|| >= 2|sin(f/2)|/(96 sqrt(12)), because ||W||<=sqrt(12), ||[L,[L,D]]||<=48||C|| and C=2 W R_full. Magnetic translations preserve R_full up to unitary conjugation: translating D adds a constant and this cancels in R_full. Any pair of finitely supported test vectors can be shifted into A. It follows that ||R_A||=||R_full||, so the half-space residual cannot vanish. This is specific to the fixed-flux lattice and midpoint leading-lapse generator. Does not prove a nonunit limiting energy/entropy ratio; a coincidence of scalar traces is not excluded.

On finite open cubes there is an additional exact outside-face diagonal correction: M=({D,L}/2)_A+B_edge, so R_A=(V C/2)_A+Q B_edge. The certificate tests this identity, actual two-step plaquette entries and local energy direction from native matrices, not an extrapolation.

## 2. Constructive entropy-preserving energy direction

Choose a fixed 2x2 site support adjacent to the horizon, and R_loc the corresponding 4x4 block. Under the canonical unitary gate q->exp(tK)q, p->exp(-tK†)p with K supported on those sites, entropy of A does not change. Its redshifted energy derivative is Re Tr[(Q M-D P) K]. Set K=-R_loc†/||R_loc||_F on the support. Then derivative = -||R_loc||_F<0 when the block is nonzero. This is a diagnostic variation, not a new proposed interaction. For a thermal state of the actual H_R at any positive temperature such a work-extracting unitary is impossible (passivity).

Local execution check.py, native n=4,6,8,10 and both sectors, exit 0:
n | eps+ residual | eps- residual
4 | .323722557253 | .324799449224
6 | .039903077786 | .025190352780
8 | .039536231686 | .022418878852
10 | .039541864119 | .022263795215
Absolute plaquette commutator entries +1.864064847626 and -.724749780161 in magnitude (both positive magnitudes). Central finite difference at t=0 agrees with slope for every case; n=10 slopes -0.039541873775 and -0.022263793653. The infinite norm lower bounds are .005605303862 and .002179346253 respectively. They are norm bounds, NOT fractional cosmological corrections.

## 3. Construct the unique faithful Gaussian modular Hamiltonian

Let Q^{1/2} P Q^{1/2}=U diag(r_j) U†. For a faithful finite reduced state r_j>1 and define w_j=sqrt(r_j), n_j=(w_j-1)/2, epsilon_j=ln((w_j+1)/(w_j-1)). Canonical normal coordinates with both scaled variances w_j reconstruct exactly the state as Gibbs at modular inverse temperature one. The nonconstant quadratic part of -log rho_A has position and momentum matrices
A_q=Q^{-1/2} U diag(epsilon_j w_j) U† Q^{-1/2},
A_p=Q^{1/2} U diag(epsilon_j/w_j) U† Q^{1/2}.
They obey Q A_q=A_p P exactly and are locally gauge covariant. Pure modes, if present, are handled on the support by the infinite modular-gap limit, not arbitrary clipping. Entropy (complex two-polarization normalization) is
S/kB = 2 sum epsilon_j n_j + 2 sum ln(1+n_j).
Thus the ground-subtracted modular excitation and entropy are not equal even for an EXACT Gibbs state. The constant in -log rho_A contributes the partition normalization. The state-derived corrective operator is K_A - 2pi H_R, where K_A=-log rho_A (constants irrelevant for variations). In general this is a quadratic operator, not a multiplicative adjustment of energy. Modular matrices do not by themselves determine the physical gravitational action or energy reference.

Local modular.py executed n=4,6, both sectors, no occupation clipping:
n eps | S/kB | modular_exc | modular_exc/S | offdiagonal Frobenius fraction of A_p
4 + | .762142148313 | .645666831983 | .847173763335 | .163837925566
4 - | 1.083398348993 | .893748646024 | .824949241297 | .211966297487
6 + | 1.460636164884 | 1.243738572479 | .851504708962 | .147925850701
6 - | 1.950515325608 | 1.626765986634 | .834018561801 | .231587524980
At n6 occupations approach machine precision; percentages are diagnostics not certified digits. Stationarity residual <2e-11 in local tests. CI default uses executed n4/6 checks; if other BLAS gives unresolved tiny occupations, explicitly report numerical precision rather than fit or change the model.

## 4. Connection to gravitational first law

For fixed cosmological constant and first-order stationary-patch perturbations around de Sitter, the horizon first law for added matter Killing energy gives T_H delta S_H=-delta E_K (see Banihashemi, Jacobson, Svesko, Visser, JHEP 01 (2023) 054, https://doi.org/10.1007/JHEP01(2023)054). This differs from varying the cosmological constant along the family of pure de Sitter solutions, as in 871d8bc. For example the Schwarzschild-de Sitter metric f=1-2GM/(c^2 r)-r^2/R^2 has delta r_H=-GM/c^2 to first order, giving T_H delta S_H=-Mc^2. Assume the fixed reference boundary algebra is the physical matter algebra and its dimensionless H_R equals the Killing energy in units hbar c/R. Then with the entanglement first law, delta S_A/kB=delta <K_A>, the conditional generalized-entropy response is
delta S_gen/kB = delta <K_A - 2pi H_R>.
This is the appropriate linearized matching question, not forcing the absolute excitation energy E_exc to equal T S. It assumes the physical gravitational first law and the dictionary from lattice to matter energy, which are not derived. The gate in section 2 shows the current candidate is not stationary for all such variations. For a relativistic wedge vacuum the Bisognano-Wichmann theorem identifies modular flow with geometric boosts, under its Poincare-covariance and locality assumptions (JHEP 01 (2024) 112, https://doi.org/10.1007/JHEP01(2024)112). That symmetry has not been established for the fixed-flux cubic lattice.

CI repair: checkpoint 295 bbfb2d5 failed before running three horizon scripts because the registry began their commands with an environment-variable assignment rather than an executable. Replace all four horizon assignments (including central_thermal from 871d8bc) with env OPENBLAS_NUM_THREADS=2 python ...; this command format was tested locally using subprocess.run(shlex.split(...),check=True). No archived Hamiltonian or tolerance is changed by the registry repair. Prior failure was not a physics test failure. New CI pending.

RESUME HERE: derive the physical covariant Killing-energy generator (including flux response and gravitational work) whose variation matches the constructed modular generator; test its locality and continuum limit against the native primitive URT flux, rather than add a numerical 4.38% correction. All previous entropy and redshift calculations preserved.

# Cathedral/H64 interacting transfer: a proved continuum-time gap and exact interacting block

Date: 2026-10-31. Source: the *existing* 2026-10-28 all-five-Platonic/H64 candidate action, not James Lockwood's work and not a newly substituted free-field theory.

**Scope:** Proves the time-cutoff limit at **each fixed finite spatial volume**. Does not prove a volume-uniform mass gap, continuum in space, uniqueness of this action from the microscopic source-loaded URT, or a theorem of nature. D6/H3, 24-track, Golay/Leech and hypercube sectors of the wider Cathedral remain active separately.

## Original operator

Work on the 197-dimensional quotient of the original five-Platonic cochain spaces and 64 signed histories. The local potential V(q) is *exactly* the one in CATHEDRAL_MULTIPLATONIC_INTERACTING_FIELD_ACTION_2026-10-28.md; it has cubic history/vertex contact and quartic hidden response, and its previously proved completion of squares gives V(q) >= (3-sqrt(5))||q||^2/2. For any finite spatial graph Lambda, retain the *original* W_Lambda(q)=sum_s V(q_s)+(1/2)sum_edges ||q_s-q_t||^2.

For n=197|Lambda| and Euclidean-time step a>0 define the normalized transfer
P_a = M_{exp(-a W_Lambda/2)} exp(a Laplacian_q/2) M_{exp(-a W_Lambda/2)}.
Its kernel differs from the original K_{a,Lambda} by the scalar (2*pi*a)^(n/2); eigenvalue ratios are identical. Set H_Lambda=-(1/2)Laplacian_q+W_Lambda on L2(R^n).

## Theorem 1: spectral convergence and positive continuum-time gap

For each fixed Lambda, let mu_j(a) be the decreasing positive eigenvalues of P_a, and E_j the increasing eigenvalues of H_Lambda. Then for every fixed j,

lim_{a->0+} (1-mu_j(a))/a = E_j,

and, in particular,

**lim_{a->0+} [log(lambda_0(K_a)/lambda_1(K_a))]/a = E_1-E_0 > 0.**

### Proof

W_Lambda is smooth and satisfies W_Lambda(q)>=c|q|^2 with c=(3-sqrt(5))/2. Thus the Friedrichs Schrödinger form Q(f)=(1/2)||grad f||_2^2+integral W_Lambda|f|^2 has compact form-domain embedding. H_Lambda has compact resolvent, and its heat kernel is positivity improving by Feynman-Kac, hence E_0 is simple and E_1>E_0.

The transfer P_a is positive self-adjoint, injective, positivity improving, trace class and a contraction. Trace class follows by factoring P_a=A^*A with A=exp(a Laplacian_q/4) M_{exp(-aW_Lambda/2)}, which is Hilbert-Schmidt since exp(-aW_Lambda/2) is in L2 and the heat kernel is in L2.

For f in L2 let g_a=exp(-aW_Lambda/2)f. Fourier transformation gives the following **exact identity**, with no perturbative expansion:

Q_a(f):=<f,(I-P_a)f>/a
= integral [(1-exp(-aW_Lambda(q)))/a]|f(q)|^2 dq
+ integral [(1-exp(-a|p|^2/2))/a]|Fourier(g_a)(p)|^2 dp.       (*)

For f smooth and compactly supported, g_a->f in H1 and (*) gives Q_a(f)->Q(f). Conversely, if a_k->0, ||f_k||<=1 and Q_{a_k}(f_k)<=M, both terms of (*) are nonnegative and imply

integral_{|q|>R}|f_k|^2 <= a_k*M/(1-exp(-a_k*c*R^2)),
integral_{|p|>R}|Fourier(g_{a_k})|^2 <= a_k*M/(1-exp(-a_k*R^2/2)),
||f_k-g_{a_k}||^2 <= a_k*M.

For fixed R the first two bounds tend to M/(cR^2), 2M/R^2. Position/frequency tightness implies compactness in L2 (Kolmogorov-Riesz). If f_k->f strongly, restrict the two nonnegative terms of (*) to fixed |q|<=R and |p|<=R. Uniform convergence of the coefficients on those compact sets and g_{a_k}->f give Q(f)<=liminf Q_{a_k}(f_k) after R->infinity.

Let e_j(a)=(1-mu_j(a))/a, the discrete eigenvalues of (I-P_a)/a below its essential point 1/a. By min-max, finite-dimensional smooth trial spaces and Q_a->Q give limsup e_j(a)<=E_j. The compactness and liminf result on the first j+1 orthonormal eigenfunctions give liminf e_j(a)>=E_j. Therefore e_j(a)->E_j.

Finally mu_j(a)=1-a e_j(a), so -log(mu_j(a))/a->E_j. Subtracting j=1 and j=0 gives the claimed positive gap limit. QED.

This proof retains the full cubic/quartic interacting candidate action. It removes **time discretization only**; it does not secretly import any spatial continuum estimate.

## Theorem 2: exact factorization of THIS candidate action

The original six-bit history kinetic operator H8=15I-sum_{i<j}X_i X_j has spectrum
0 (multiplicity 2), 10 (12), 16 (30), 18 (20).
After removing its two kernel directions, the nonlinear source U_h(h3+Delta*h5) occupies only four directions of the eigenvalue-18 sector and four directions of the eigenvalue-16 sector. Thus 8 history coordinates interact and 54 are quadratic spectators.

Only 11 nonconstant icosahedral vertex coordinates enter h3,h5. The remaining four Platonic solids contribute 34 free vertex coordinates. There are 45 coexact-edge and 45 nonharmonic-face coordinates; all are quadratic in the explicitly chosen action. Therefore, exactly,

197 = (11+8) interacting + (34+45+45+54) quadratic = 19+178.

The nearest-neighbour spatial term is orthogonal in this decomposition, so
H_Lambda = H_int,19,Lambda tensor I + I tensor H_free,178,Lambda.

The free sector's one-particle frequencies are sqrt(nu_j+omega_k), with nu_j the local Hodge/history eigenvalues and omega_k the spatial Laplacian eigenvalues. Its minimum local eigenvalue is 3-sqrt(5), realized by the dodecahedral vertex sector, and omega_0=0 for every finite spatial graph. Consequently

**E_1(H_Lambda)-E_0(H_Lambda) = min(g_int(Lambda), sqrt(3-sqrt(5))).**

The free factor's gap is exactly sqrt(3-sqrt(5)) = 0.874032048897642... uniformly in spatial volume. The nonlinear 19-field factor has a positive gap at each finite Lambda, but a common strictly positive lower bound as |Lambda|->infinity has **not** been established.

## A precise blocked shortcut, not a global no-go

The original exact two-coordinate restriction is
V(t,s)=3t^2+(mu/2)s^2+ct^4-d*s*t^2, d>0.
Its Hessian in the t direction at (0,s) is 6-2ds, equal to -2 at s=4/d. The joint potential is not globally convex. A Brascamp-Lieb argument based on a positive global Hessian cannot establish the missing 19-field infinite-volume bound. This does NOT mean a mass gap is impossible; it rules out that *unjustified step*.

**Unresolved equation:** inf_over_finite_Lambda g_int(Lambda) > 0, plus spatial-cutoff removal, nontrivial continuum correlation functions, and a derivation of the physical action/current/clock directly from the canonical source-loaded URT transfer.

Exact symbolic checks: CATHEDRAL_INTERACTING_TIME_CUTOFF_CHECK_2026_10_31.py, added alongside this note. Existing source provenance:
- docs/CATHEDRAL_MULTIPLATONIC_INTERACTING_FIELD_ACTION_2026-10-28.md
- docs/CATHEDRAL_CONSTRUCTIVE_TRANSFER_THEOREM_2026-10-28.md
- docs/WHOLE_CATHEDRAL_FINITE_GEOMETRY_HISTORY_BRIDGE_2026-10-26.md

All results are from the Cathedral project and standard operator analysis, independently of the 4Y-M repository.

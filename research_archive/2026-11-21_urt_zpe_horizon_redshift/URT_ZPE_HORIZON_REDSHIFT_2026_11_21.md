# Native 3D URT–ZPE: same-state boundary energy with de Sitter horizon redshift

Date 2026-11-21. Standalone ZPE entropy track, not RH or Cathedral. Follows a56bf66 and the unchanged native cubic graph of 9e3fc93. THEOREM (exact identities for declared Hamiltonian and boundary coupling) / CLOSED INTERNALLY, PHYSICAL IDENTIFICATION PENDING. Finite numerical investigation, not a proof of cosmological closure.

## 1. Definition, not a correction fitted to 95%

Use the existing true-degree magnetic Laplacian L on the open N^3 cube, with Ux=exp(if z), Uy=exp(if x), Uz=exp(if y), f=Arg(epsilon exp(-2pi i/phi²)), phi=(1+sqrt(5))/2. Retain two real canonical modes per complex site. W=sqrt(L), V=W^-1. The joined ground state has scaled position and momentum covariances R(V)/2 and R(W)/2. Take A the left half across the x midplane; B is the seam edge operator and L0=L-B=L_A direct sum L_B. N even. Use the same physical site cut throughout.

If e_A=Tr sqrt(L_A) is the cut-off isolated ground energy, its excitation in the joined state is X_A=Tr(W_A+L_A V_A)/2-e_A>=0. The exact joining work is
W_join=Tr sqrt(L)-Tr sqrt(L0)=X_A+X_B+Tr(B V)/2.
This is the energy ledger, not an assumption that W_join is the energy of one horizon region. It follows by splitting the joined Hamiltonian. The canonical ground-state entropy is
S_A/k_B=2 sum_j [(1+n_j)ln(1+n_j)-n_j ln n_j],
n_j=(sqrt(eigenvalue_j(V_A^1/2 W_A V_A^1/2))-1)/2.
All terms are gauge invariant. The numerical check verifies the ledger and both cut entropies through N=10 using native edges. The local physical energy ratio 2pi X_A/(S_A/k_B) is 3.97592105 (+), 3.35561593 (-) at N=10. It is not one.

## 2. Static de Sitter lapse gives a different energy

Static de Sitter lapse sqrt(1-r²/R²) equals sin(x/R) where x is proper radial distance inward from the horizon and r=R cos(x/R). At x<<R the lapse is x/R. For a local flat cut on the lattice take site distances x_i=ell d_i, d_i=1/2,3/2,... from the plane. Use a midpoint rule for edge energies. The **declared** discretization of the leading near-horizon Hamiltonian is
H_R=(P^T R(D)P+Q^T R(L_w)Q)/2,
D=diag(d_i), L_w=sum of native internal magnetic edge squares weighted by the mean of endpoint distances. The exterior horizon links are omitted. Coordinates and energy are in canonical dimensionless units. The physical redshifted H_R is in units hbar c/R. This weighted Hamiltonian is positive since D>0 and L_A is gapped; it preserves local phase gauge symmetry. Its ground energy e_R=Tr sqrt(D^1/2 L_w D^1/2) follows from a canonical linear change of variables. Its excitation in the SAME joined vacuum is exactly
X_R=Tr(D W_A+L_w V_A)/2-e_R>=0.
Neither a fitted slope nor a change to the original vacuum L enters. Choice of de Sitter metric and midpoint lapse/edge coupling is explicit extra physical structure. This is not a derivation of actual gravitational coupling or a boost modular Hamiltonian.

With beta=2pi, shifted Gibbs reference tau=exp[-beta(H_R-e_R)]/Z_exc, Z_exc=product_j(1-exp(-beta omega_j))^-2, omega_j=sqrt(lambda_j(D^1/2 L_w D^1/2)). For reduced vacuum rho_A, s_A=S_A/k_B, the definition of quantum relative entropy gives the exact identity
D(rho_A||tau)=beta X_R+ln Z_exc-s_A,
beta X_R/s_A - 1 = (D(rho_A||tau)-ln Z_exc)/s_A.
Consequently exact horizon equality is equivalent to D=ln Z_exc, not merely to a nonnegative gap, thermal reference, or first law of entanglement. A lattice reduced ground state need not be thermal for this H_R. The mismatch of the two covariances is independently checked. Bulk-normalized covariance norms decreasing are NOT sufficient evidence of convergence of boundary-resolved quantities.

## 3. Entropy controls the scale, conditionally

Let sigma=s_A/N² and chi=X_R/N². Under the hypothesized local horizon area identification each cut bond occupies ell² and A_H=4pi R², so S_H=k_B sigma A_H/ell². If S_H is identified with the Bekenstein–Hawking value, ell²=4 sigma ell_P². If the actual gravitational energy is the redshifted excitation of this boundary state, E_H=(hbar c/R) chi A_H/ell². Dividing by 4pi R³/3 gives rho=3 chi hbar c/(4 sigma ell_P² R²). Hence rho/rho_dS=2pi chi/sigma. This recovers the original entropy-controlled R^-2 scaling, but both coefficients now come from the same quantum vacuum with the specified energy reference. It is NOT the same relative +/- flux-sector energy as old d2. Neither the area identification, choice of reference nor physical lapse action follows from primitive URT. No observational cosmological value was used.

## 4. Executed numbers (no fit)

N | eps | sigma | chi | 2pi chi/sigma | D/A_cut | ln Z_exc/A_cut
4 | + | .047633884270 | .012170322396 | 1.605336034 | .035155662691 | .006321156096
4 | - | .067712396812 | .015619063156 | 1.449327933 | .047490733519 | .017065662197
6 | + | .040573226802 | .008891200483 | 1.376894683 | .019662034954 | .004370201520
6 | - | .054180981267 | .011016155563 | 1.277506334 | .022097556861 | .007061991352
8 | + | .037796669973 | .007753220135 | 1.288868011 | .014758765007 | .003840516147
8 | - | .049925169634 | .009442863898 | 1.188403848 | .015176034152 | .005769940083
10 | + | .036232579593 | .007181874830 | 1.245427483 | .012444085111 | .003551614295
10 | - | .047646480544 | .008671274775 | 1.143488997 | .012132734943 | .005295989227
12 | + | .035222747313 | .006841218378 | 1.220365987 | .011128845500 | .003366950017
12 | - | .046183498503 | .008215324733 | 1.117680759 | .010443320809 | .005008411656

Independent transverse strip finite-size test: the original flux is expressed in a gauge Ux=exp(if z), Uy=exp(if(x-z)), Uz=1, and Fourier transformed along y (infinite y represented by quadrature). Open x,z. The onsite y contribution is 2-2cos(k+f(x-z)). Keep distances to the x cut and weight the y term too. Ratios (+,-) for equal x,z widths 8,12,16,24 are (1.298950532,1.190731017), (1.228540486,1.121987579), (1.200245845,1.093549064), (1.177987468,1.069288464). At width12 increasing transverse momentum quadrature points 12->24 changes all per-area observables by <=2.22e-8. The width24 result uses 12 quadrature points, not a certified integral. This distinct outer-boundary treatment does not change the flux or fit energy parameters. Finite-size trend towards 1 does not establish equality or a limiting value.

Executed local NumPy/SciPy scripts (exit 0) for native cubic ledger, lapse weighting through N=12, and Fourier strip through width24. Registry checks are bounded; full GitHub CI pending.

RESUME HERE: derive thermodynamic boundary limit of chi,sigma and D-lnZ (rather than extrapolating to one), then determine if native modular form equals appropriate continuum boost generator and whether the boundary excitation is the gravitational source. No new pump or arbitrary 4.38% correction. The original 95.6157% was a different cross-state comparison, not a known physical measurement.

# Collective metric trace: native flux response and a stationary interacting virial criterion

2026-11-21. Parent f722e56. Standalone entropy/ZPE branch (not the Cathedral ARF calculation). User requested pursuing falsifiable physics from the whole system. THEOREM, scoped to the declared positive lattice Hamiltonians; CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. No fitted cosmological inputs. No claim to have constructed the joint Standard Model/gravity Hamiltonian.

## Native collective vacuum, not a force-by-force sum

Use exactly the open N^3 cubic Laplacian from 9e3fc93, with Ux=exp(if z), Uy=exp(if x), Uz=exp(if y), complex oscillators/two real polarizations, E_dimless=Tr sqrt(L(f)). The two principal magnitudes are theta=2pi/phi² and pi-theta; conjugating flux leaves the spectrum unchanged. Scale the physical lattice spacing by a fixed-number homogeneous dilation a. Then E(a,f)=(hbar c/ell0) a^-1 E_dimless(f). The thermodynamic volume V(a)=V0 a³, hence the mean mechanical pressure is p=-1/(3V) dE/dln a at fixed physical degrees of freedom. No isotropy of off-diagonal stress is asserted. At frozen link holonomy f, p=rho/3 exactly, rho proportional to a^-4; no acceleration with this positive conserved source. This agrees with prior 9e3fc93, not new physics. In a putative physical magnetic interpretation, f proportional to B_phys a², the fixed comoving flux law has B_phys proportional to a^-2; see https://academic.oup.com/pasj/article/75/Supplement_1/S154/6567587.

New test: take the externally prescribed fixed proper magnetic field path f(a)=f0 a² in a neighborhood of a=1. Then the *path derivative* satisfies p_path/rho=(1-2f E_f/E_dimless)/3 and Theta_path/rho=2f E_f/E_dimless, where E_f=Tr(L^-1/2 L_f)/2 exactly. This path derivative includes flux-source work; it is not the conserved gravitational stress of the standalone oscillator. In the first law dE=-p_f dV+(partial E/partial f) df, the last term is external work. A controller holding B_phys fixed has its own stress and energy; it cannot be dropped. Evaluate both actual native flux sectors, not an arbitrary fitted flux. Independent centered derivatives of f and simultaneous a,f satisfy the analytic formula.

Executed local NumPy/SciPy Python cert.py --full, exit 0:
N | E+/site | E-/site | E_f+/site | E_f-/site | Theta_path/rho + | Theta_path/rho -
2 1.648134555250 1.619040002678 .006765197901 .033707639533 .019702549350 .030880740741
4 2.045432821882 2.037237385916 .002406128622 .007250542993 .005646355292 .005278929260
6 2.166314213826 2.159540265369 .002060123476 .005647703711 .004564638462 .003879069371
8 2.224990384876 2.218811457827 .001911532473 .005033246976 .004123710087 .003364687921
10 2.259651174049 2.253799481525 .001829171145 .004699875948 .003885505461 .003093058029
12 2.282535754235 2.276890568623 .001776914484 .004491356380 .003736659474 .002925851677
At N12 p_path/rho=.332087780175 and .332358049441. The subtracted sector difference along the two imposed fixed-B paths has Theta_path/rho=.330762332687, also not an accelerating source; that difference is not physically identified as energy and no background source is included. Finite diagnostics, not a certified infinite limit. The frozen comoving result is exact at every N. For a flat FLRW universe whose only conserved source is the fixed-number frozen-flux lattice with positive energy, H(z)/H0=(1+z)^2 and q_dec=1; this direct interpretation is incompatible with observed late acceleration. A subdominant radiation-like contribution is not excluded.

## Exact massive positive quadratic extension

Let K(a)=a^-2 L+M where L and the fixed proper mass-squared matrix M are Hermitian positive semidefinite and K positive definite (units hbar=c=ell0=1). The full joint unrenormalized ground energy E=Tr sqrt(K), whether or not L and M commute. Matrix trace differentiation gives dE/dln a=-Tr(K^-1/2 a^-2 L). Thus averaged p=Tr(K^-1/2 a^-2 L)/(3V), and
Theta/rho=Tr(K^-1/2 M)/Tr sqrt(K) in [0,1].
Proof: Tr(K^-1/2 M)>=0 and Tr(K^-1/2 (K-M))>=0 by positivity. Hence p/rho in [0,1/3]. Since acceleration requires Theta/rho>2, no nonnegative static proper mass matrix resolves the problem in this fixed-carrier harmonic ground-state class, even with noncommuting intermode mixing. Local native tests use M=m² I with m=0,.01,1,100, both fluxes, N4. The mass terms are declared diagnostics, not physical masses derived from URT. This theorem concerns the full positive unrenormalized oscillator energy, not a renormalized cosmological constant or all interacting field theories. FRW gravitational interpretation additionally assumes this is a conserved source with an isotropic effective stress.

## Constructive target beyond quadratic vacuum

For a canonical scalar Hamiltonian in fixed comoving cells with proper scalar coordinates q and momenta pi, write H(a)=K(a)+G(a)+U(a), with K=a^-3 K0 canonical kinetic energy, G=a G0 positive quadratic spatial gradient energy (possibly coupled), U=a³ U0 total local potential. No actual URT potential has yet been derived; this is the standard adiabatic scalar Hamiltonian class. For a stationary ground eigenstate, Hellmann-Feynman (assuming differentiability) gives
rho=<(K+G+U)>/V,
p=<(K-G/3-U)>/V,
rho+3p=(4<K>-2<U>)/V.
The concrete acceleration criterion is <U>>2<K>, not merely a positive mass gap, magnetic stiffness, or total energy. A stationary normalizable state obeys the canonical dilation virial, assuming domains and finite moments, 2<K>=2<G>+<q·grad_q U>. Thus <U-q·grad_q U>>2<G> is the equivalent criterion. For U=U2+U4+U0 with homogeneous terms of degree 2 and 4 and constant baseline U0, get rho+3p=(4<G>+2<U2>+6<U4>-2U0)/V. If U2,U4>=0 and U0=0, even these positive nonquadratic interactions fail, regardless of coupling. An independently derived vacuum baseline, an interaction beyond this class, a nonstationary collective state, or geometry/constraint dynamics would be required. No free baseline is inserted as solution. The scalar virial is not a theorem for the entire unspecified URT gauge-gravity system. virial.py local SymPy exit 0 validates algebra; the analytic commutator argument gives the stated stationary theorem.

RESUME: derive the actual jointly interacting URT potential/constraint and its metric response (rather than append adjustable constant, mass, or positive quartic term). Evaluate the acceleration criterion directly on a state derived from that action. The original magnetic model is not a complete interacting all-force vacuum; no claim of a new empirically verified theory or of falsifying the user's general collective hypothesis. Latest prior CI f722e56 checkpoint298 PASS; new CI pending.

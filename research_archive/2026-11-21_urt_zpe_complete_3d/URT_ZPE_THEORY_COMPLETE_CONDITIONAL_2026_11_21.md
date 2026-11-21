# URT Prime-Flux Vacuum
## A complete conditional quantum-lattice theory, its three-dimensional stress law, and its exact cosmological closure criterion

**Research edition:** 21 November 2026  
**Scope:** standalone URT-to-zero-point-energy research, not Newton's Cathedral, ARFs, or the Riemann hypothesis.  
**Scientific status:** the finite-volume quantum model, three-dimensional extension, Gaussian entanglement, shell-joining work, and sourced-fluid identities below are mathematically complete **under explicitly named physical postulates**. The claim that primitive URT uniquely produces the observed quantum vacuum, gravity, or dark energy is **not established**. No measured cosmological quantity is used to determine any coefficient, and no 4.38% correction is inserted.

### Executive result

A consistent microscopic mechanism now exists **within the declared model**:

**URT golden phase -> projective magnetic flux -> a gapped quantum-oscillator vacuum -> positive zero-point energy and boundary entanglement -> a positive work cost to create and join new carriers -> an exact carrier-creation continuity equation.**

The final cosmological statement is sharp:

\[
\boxed{w_{\mathrm{eff}}=\frac13-\frac{4\Gamma}{9H}.}
\]

Here \(\Gamma\) is the fractional production rate of physical vacuum carriers and \(H\) the Hubble expansion rate. The model has the dark-energy-like solution \(w_{\mathrm{eff}}=-1\) **if and only if** \(\Gamma=3H\) (for \(H>0\)). The model **does not independently derive that production law**, its physical energy source, or the carrier spacing. It is therefore a finished *conditional mathematical model*, not yet a zero-parameter completed theory of nature. In particular \(w_{\mathrm{eff}}\) is not automatically the variational gravitational pressure of the oscillator Hamiltonian.

---

## 1. Primitive law and mathematical extensions

The specified primitive URT scale-phase recurrence is

\[
 r_{k+1}=\alpha r_k,\qquad
 \vartheta_{k+1}=\vartheta_k+\theta,\qquad
 \alpha=\pi/e,\quad \theta=2\pi/\varphi^2,\quad
 \varphi=(1+\sqrt5)/2.
\]

The arithmetic prime-pair extension **declares**, rather than proves from that recurrence, a projective relation \(V_pV_q=z_{pq}V_qV_p\), with \(z_{pq}=\epsilon_{pq}e^{-i\theta}\) and quadratic-reciprocity sign \(\epsilon_{pq}\in\{\pm1\}\). For a homogeneous reciprocity sector set

\[
 f_\epsilon=\operatorname{Arg}(\epsilon e^{-i\theta}),\quad
 F_\epsilon=|f_\epsilon|\in(0,\pi).
\]

The original finite four-site magnetic square, \(L_\square=2I-A(z)\), remains unchanged; its exact spectrum is \(2\pm2\cos(F/4)\), \(2\pm2\sin(F/4)\). The infinite compression \(4I-A(z)\) is a **distinct boundary problem** and is not substituted for this original square.

For the three-dimensional model, choose three oriented coordinate-plane fluxes of equal \(f_\epsilon\). This **cyclic extension is a new, explicit modeling choice**, not a theorem that every ordered triple of rational primes has these three oriented reciprocity phases. It is chosen for a rigorous isotropic-diagonal stress test; it preserves the original two-dimensional square on each plane up to gauge.

## 2. One three-dimensional graph and one Hamiltonian

Let \(\Lambda_N=\{0,\ldots,N-1\}^3\) and orient the positive coordinate links. With coordinates \((x,y,z)\), choose

\[
 U_x(x,y,z)=e^{if_\epsilon z},\qquad
 U_y(x,y,z)=e^{if_\epsilon x},\qquad
 U_z(x,y,z)=e^{if_\epsilon y}.
\]

Each elementary \(xy\), \(yz\), and \(zx\) plaquette has Wilson holonomy \(e^{if_\epsilon}\). Set

\[
 L_i=\sum_{\text{positive }i\text{-links }v\to w}
 (|v\rangle-U_{vw}|w\rangle)(\langle v|-\overline{U}_{vw}\langle w|),
 \qquad L=L_x+L_y+L_z.
\]

The diagonal of \(L\) is the **actual vertex degree**, including free boundaries. At fixed \(z\), the \(xy\) plaquette contains the original magnetic four-cycle. Under \((x,y,z)\mapsto(y,z,x)\), the full operator is unitarily equivalent to itself; this cyclic symmetry will fix the three diagonal pressures at equal axis lengths.

**Physical postulate Q (canonical charged oscillator):** There are two real canonical coordinates per complex graph site and their conjugate momenta, with the standard quantum commutation relations. For static physical link lengths \(\ell_i>0\) define the Hermitian stiffness

\[
 K_g=\frac{L_x}{\ell_x^2}+\frac{L_y}{\ell_y^2}+\frac{L_z}{\ell_z^2}.
\]

The local Hamiltonian is the realification of the positive quadratic form \(K_g\), with relativistic signal speed \(c\) inserted as a **physical premise**. Its eight-real/complex-mode normalisation gives exactly

\[
 \boxed{E_0(\ell_1,\ell_2,\ell_3)=\hbar c\operatorname{Tr}\sqrt{K_g}.}
\]

This action specifies a static Hamiltonian, not a generally covariant expanding-universe action. Neither the canonical field, \(c\), the length scale \(\ell\), nor the unique physical interpretation of the arithmetic lift is deduced from the dimensionless URT recurrence.

## 3. Theorem I: uniform three-dimensional frustration gap

Write \(g_2(F)=1-\cos(F/4)>0\). Each two-dimensional coordinate plane, with its original nontrivial plaquette flux and free boundary, has magnetic Laplacian bounded below by \(g_2(F)I\); this is the exact inherited two-dimensional plaquette inequality.

For the full cube, let \(L_{xy}\) sum the two directional operators on every fixed-\(z\) plane; define \(L_{yz}\) and \(L_{zx}\) analogously. Then

\[
 L_{xy},L_{yz},L_{zx}\succeq g_2 I,
 \qquad L_{xy}+L_{yz}+L_{zx}=2L.
\]

Consequently, for every finite \(N\ge2\),

\[
 \boxed{\tfrac32 g_2(F)I\preceq L\preceq12I.}
\]

This is an **N-independent gap** for the declared cubic magnetic graph. The upper bound follows from the maximum degree six and the magnetic edge-square inequality. The same gap extends to the infinite operator by the quadratic-form argument on finitely supported states. The physical smallest instantaneous oscillator frequency is therefore bounded by \(c\sqrt{3g_2/2}/\ell\) at isotropic spacing \(\ell\).

## 4. Theorem II: exact flux-sensitive moment

Four-step closed walks on the cubic lattice number 90: 66 have zero oriented flux area, 12 carry one positive plaquette flux, and 12 carry one negative plaquette flux. The gauge-invariant normalised local trace obeys

\[
 \boxed{\tau_\infty(A^4)=66+24\cos F},
 \qquad
 \boxed{\tau_\infty(L^4)=2658+24\cos F}.
\]

The closed-walk coefficients are exact integers, independently certified by explicit enumeration. This is a nonzero spectral fingerprint of the primitive golden-phase **under the declared projective lift**. It is not, by itself, a proof that the three-dimensional \(+\) and \(-\) bulk square-root traces have a particular ordering; the rigorous positive bulk sector difference previously proved was for the **two-dimensional** extension.

## 5. Theorem III: one Gaussian vacuum has energy and boundary entropy

For \(W=\sqrt L\) and \(V=W^{-1}\), the isotropic ground-state quadrature covariances are, up to the common physical factors, \(\Gamma_Q=\mathcal R(V)/2\), \(\Gamma_P=\mathcal R(W)/2\). Their normalised product is independent of \(\ell\). The *full* oscillator ground state is pure; a selected set of sites \(A\) nevertheless has nonzero entanglement entropy.

With \(B\) the complement of \(A\), set

\[
 X=V_A^{1/2}W_{AB}W_B^{-1/2},\quad T=XX^\dagger\succeq0,
 \quad h(n)=(n+1)\ln(n+1)-n\ln n.
\]

Schur complementation gives the exact, site-local-gauge-invariant formula

\[
 \boxed{\frac{S_A}{k_B}=2\operatorname{Tr}\left[h\left(\frac{\sqrt{I+T}-I}{2}\right)\right].}
\]

For the cut \(x<N/2\), with even \(N\ge4\), there are exactly \(N^2\) physical links crossing the cut. Define \(g_3=\tfrac32g_2\) and \(q=1-g_3/12<1\). A Schur-complement lower bound, the exact \(N^2\) cross-link Frobenius norm, and a convergent nearest-neighbour power series for \(\sqrt L\) imply

\[
 \boxed{c_3(F)N^2\le S_A/k_B\le C_3(F)N^2,}
\]

with **explicit** constants

\[
 c_3(F)=\frac{1}{288[\sqrt{1+12/g_3}+1]^2}>0,
\]

\[
 C_3(F)=\frac{2\sqrt{12}}{\sqrt{g_3}}
 \frac{q(1+q)^2}{(1-q)^5}<\infty.
\]

The proof uses the same matrix that determines \(E_0\). No external thermodynamic entropy is imported. Under a diagonal site-gauge transformation \(D\), the reduced covariance is transformed by local oscillator rotations, leaving \(S_A\) invariant. This is an entanglement **area law in three spatial dimensions**, not an identification with black-hole horizon entropy.

## 6. Theorem IV: a constructive, gapped operation to add a carrier shell

Separate the newest \(z\)-layer (\(N^2\) physical sites) from the existing \(N\times N\times(N-1)\) slab, without altering any link inside either piece. Let \(B_{\rm shell}\) be the sum of the \(N^2\) *original* magnetic edge squares that connect that layer to the slab. Define

\[
 L_0=L-B_{\rm shell},\qquad L_t=L_0+tB_{\rm shell},\quad 0\le t\le1.
\]

Both disconnected components contain complete nonzero-flux \(xy\)-plaquettes, so \(L_0\succeq g_2 I\). As \(B_{\rm shell}\succeq0\), the *entire joining path* obeys

\[
 g_2 I\preceq L_t\preceq12I.
\]

Thus the joining path is uniformly gapped: after an independently prepared new layer is added as an ancilla, an arbitrarily slow physical switching of the original seam bonds produces an adiabatic vacuum-to-vacuum state transfer. This gives a **constructive possible carrier-attachment operation**. It does not prove URT causes layer births or supplies the new layer's energy.

Its exact, strictly positive joining work is

\[
 \boxed{\Delta E_{\rm join}=\frac{\hbar c}{2\ell}
 \int_0^1\operatorname{Tr}\left(B_{\rm shell}L_t^{-1/2}\right)dt,}
\]

and since \(\operatorname{Tr}B_{\rm shell}=2N^2\),

\[
 \boxed{\frac{\hbar c}{\ell}\frac{N^2}{\sqrt{12}}
 \le\Delta E_{\rm join}\le
 \frac{\hbar c}{\ell}\frac{N^2}{\sqrt{g_2}}.}
\]

The *additional* vacuum energy of the new uncoupled layer is positive as well; shell birth plus joining cannot arise from an energy-free bookkeeping operation. The joined Gaussian state has strictly positive entanglement across the newly created interface and \(\Theta(N^2)\) surface scaling by the same method as Theorem III.

The state-extension map is explicit in principle: embed the old Gaussian ground state by tensoring with the separately prepared new-layer ground state, then adiabatically evolve with the above gapped quadratic Hamiltonian. This identifies the physical work that an external birth mechanism must provide; the birth mechanism's timing and resource are **not** determined by URT's scale–phase recurrence.

## 7. Theorem V: bulk vacuum density and mechanical pressure

Locality, the uniform spectral bounds, and polynomial approximation to \(\sqrt L\) give a well-defined infinite cubic bulk energy per complex site,

\[
 u_3(F)=\lim_{N\to\infty}N^{-3}\operatorname{Tr}\sqrt{L_N(F)}
 \in[\sqrt{g_3},\sqrt{12}],
\]

with surface-size finite-volume error \(\operatorname{Tr}\sqrt{L_N}=N^3u_3(F)+O_F(N^2)\). For equal physical link lengths \(\ell\), the carrier density is \(n=\ell^{-3}\) and

\[
 \boxed{\rho(n)=\hbar c\,u_3(F)n^{4/3}
 =\frac{\hbar c\,u_3(F)}{\ell^4}.}
\]

This is the **unrenormalised oscillator vacuum energy density**, not a physical prediction of the absolute cosmological constant. In particular a covariant vacuum counterterm may shift its gravitational value; the difference of flux sectors requires a physically selected reference and a consistent continuum renormalisation.

In a static orthogonal geometry, the **same** oscillator energy yields the exact virtual-work directional stresses

\[
 \boxed{P_i=-\frac1V\frac{\partial E_0}{\partial\ln\ell_i}
 =\frac{\hbar c}{V}\operatorname{Tr}
 \left(K_g^{-1/2}\frac{L_i}{\ell_i^2}\right)>0.}
\]

Their sum is \(P_x+P_y+P_z=\rho\). On a cubic sample at equal lengths, the cyclic symmetry makes all three equal; therefore

\[
 \boxed{P_x=P_y=P_z=\rho/3.}
\]

This is **radiation-like mechanical pressure**, not negative vacuum pressure. The claim concerns static diagonal virtual work; off-diagonal shear, real-time curved-spacetime response, and full Lorentz invariance have not been derived.

## 8. Theorem VI: exact open-system energy conservation and creation pressure

Use a differentiable thermodynamic coarse-graining of carrier number \(M=N^3\) and physical spatial volume \(V=M\ell^3\). The already proved bulk law defines

\[
 \boxed{E(V,M)=K\,M^{4/3}V^{-1/3}},\qquad K=\hbar c\,u_3(F)>0.
\]

The independent virtual-work derivatives are fixed; there is **no fitted chemical potential**:

\[
 P_{\rm mech}=-\left.\frac{\partial E}{\partial V}\right|_M
 =\frac{E}{3V}=\rho/3,
 \quad \mu=\left.\frac{\partial E}{\partial M}\right|_V=\frac{4E}{3M}.
\]

Thus the exact first law is

\[
 \boxed{dE=-\frac\rho3dV+\frac{4E}{3M}dM.}
\]

For a homogeneous spatially flat expanding geometry, define \(H=\dot a/a\), proper number density \(n=M/V\), and a **not-yet-derived** proper carrier-creation rate \(\Gamma\) by

\[
 \dot n+3Hn=\Gamma n.
\]

Differentiating \(\rho=K n^{4/3}\), with no additional model inputs, yields the exact source-continuity equation

\[
 \boxed{\dot\rho+4H\rho=\frac43\rho\,\Gamma.}
\]

The source term represents the positive energy transferred into newly produced carriers. If a coarse-grained source-corrected effective pressure is introduced **so that the effective vacuum-fluid continuity equation is source-free**, it is necessarily

\[
 P_{\rm creation}=-\frac{4\rho\Gamma}{9H},
 \qquad P_{\rm effective}=\frac\rho3-\frac{4\rho\Gamma}{9H}.
\]

Therefore, for expanding \(H>0\),

\[
 \boxed{w_{\rm effective}=\frac{P_{\rm effective}}\rho
 =\frac13-\frac{4\Gamma}{9H}.}
\]

In particular:

- **No carrier production** \((\Gamma=0)\): \(\rho\propto a^{-4}\), \(w=1/3\).
- **Exactly constant proper carrier spacing** \((\Gamma=3H)\): \(n\) and \(\rho\) constant, \(P_{\rm effective}=-\rho\), \(w_{\rm effective}=-1\).
- **Other production rates:** continuous interpolation according to the boxed expression.

This is the exact quantitative criterion for **dark-energy-like effective behaviour**. It is **not a proof of gravitational dark energy**, because \(\Gamma=3H\), the external work supply, and the identification of this coarse-grained effective pressure with a covariant stress tensor are not derived from the microscopic URT operator. If the source is exchanged with another component, that component's stress-energy must be included to conserve total energy-momentum. Hiding it would be a physical error.

## 9. Relation to URT recursion and what remains logically independent

URT gives the length multiplier \(\alpha=\pi/e\). An expanding physical region evolving by \(a\mapsto\alpha a\) has volume factor \(\alpha^3\). For constant proper carrier spacing the required *mean* carrier number similarly obeys

\[
 \langle M_{k+1}\rangle=\alpha^3\langle M_k\rangle,
 \quad\Longrightarrow\quad\Gamma/H=3
\]

in the continuum description. This implication is **conditional on constant proper spacing**. It is not a derivation of that condition from the phase law. Exact integer site counts cannot simply be multiplied by arbitrary real \(\alpha^3\) at every finite step without an additional stochastic or rounding rule; no such microscopic rule is chosen here.

The shell theorem supplies a *possible unitary/adiabatic implementation* of making new sites available and coupling them, and proves the interface work is positive. It does **not** fix the birth rate, select a reservoir, or imply that entropy automatically drives expansion. The entropy is a reduced-state quantum entropy; a thermodynamic creation law would require a separately derived irreversible dynamics.

## 10. What a covariant cosmological completion would imply — conditional solution

If one **adds** the following independent assumptions: (i) the coarse-grained sourced fluid has a conserved *effective* stress tensor in 3+1-dimensional general relativity; (ii) spatial homogeneity and isotropic stress are valid after coarse-graining; (iii) the production law is \(\Gamma=3H\); (iv) other source/reservoir terms are consistently accounted for; then the model produces the standard effective vacuum form

\[
 T_{\mu\nu}^{\rm eff}=-\rho\,g_{\mu\nu},\qquad \dot\rho=0.
\]

For a spatially flat universe containing only this effective component, Einstein's equation then has the exponential expansion solution

\[
 a(t)=a_0e^{Ht},\qquad
 H^2=\frac{8\pi G\rho}{3c^2}
 =\frac{8\pi G\hbar\,u_3(F)}{3c\ell^4}.
\]

Equivalently, \(\Lambda_{\mathrm{eff}}=8\pi G\rho/c^4=8\pi G\hbar u_3(F)/(c^3\ell^4)\). This is a **consistent conditional solution**, not a first-principles prediction of the observed expansion rate. In particular the physical proper spacing \(\ell\), the gravitational coupling \(G\), and the renormalised absolute-energy reference have not been fixed by \(\pi, e, \varphi\).

## 11. Exact obstruction to claiming a zero-parameter theory of observed dark energy

**Scale non-identifiability:** The primitive recurrence and all dimensionless magnetic spectral relations are invariant under \(\ell\mapsto s\ell\), but \(\rho\mapsto s^{-4}\rho\). Hence primitive dimensionless URT data and the declared flux graph **cannot** specify a unique absolute physical vacuum density unless a physical length/action/metric normalisation principle is supplied. This is a dimensional-symmetry proof, not a numerical mismatch.

**Production-law non-identifiability:** At the same \(F\), \(L\), and \(E(V,M)\), different perfectly consistent carrier rates \(\Gamma\) produce distinct \(w_{\mathrm{eff}}\). The microscopic spectral gap, entanglement area law, and interface joining work do not by themselves select \(\Gamma=3H\).

**Renormalisation and covariance:** The lattice's positive unrenormalised \(E_0\) cannot uniquely determine a gravitational cosmological term without specifying the renormalised reference and a generally covariant metric action. An effective open-system continuity equation is not a substitute for the action-level Ward identity \(\nabla_\mu T^{\mu\nu}=0\) for the full system, including any reservoir or creation field.

**Scientific conclusion:** The microscopic model and its conditional cosmological effective-fluid closure are now specified, calculable, and falsifiable as mathematics. A **completed, empirically justified, zero-parameter physical theory of gravity and dark energy** cannot truthfully be claimed from these inputs. The precise unresolved dynamical assertion is \(\Gamma=3H\), together with its source and covariant stress; stating this is essential to avoid disguising an assumption as a derived physical law.

## 12. Reproducible checks and predictions

The accompanying executable certificate runs the original golden-angle sectors \(\epsilon=\pm1\) on complete cyclic-flux cubes \(N=2,4,6\); constructs the original magnetic links directly rather than synthetic matrices; verifies the full rank/gap, cyclic permutation symmetry, exact three-dimensional fourth closed-walk moment, positive energies, the three directional virial pressures by finite differences, two-region reduced Gaussian entropy and onsite gauge invariance, positive seam work, and a gapped adiabatic shell-joining path. It also checks the rational first-law and creation-pressure arithmetic independently.

Selected finite-size diagnostics (all ZPE and work values divided by \(\hbar c/\ell\); entropy by \(k_B\)):

| N | sector | E0/site | shell-joining work/cut bond | shell entropy/cut bond |
|---:|:---:|---:|---:|---:|
| 2 | + | 1.648134555250 | 0.694363706973 | 0.114845930907 |
| 2 | − | 1.619040002678 | 0.741661904615 | 0.275314172115 |
| 4 | + | 2.045432821882 | 0.534961298657 | 0.057244892036 |
| 4 | − | 2.037237385916 | 0.542371448495 | 0.082549466370 |
| 6 | + | 2.166314213826 | 0.510053150054 | 0.049161787754 |
| 6 | − | 2.159540265369 | 0.515486021814 | 0.069473147288 |

These are **finite-volume results**, not extrapolated cosmological constants. They can be compared directly with independently implemented graph and Gaussian calculations. The model's physical predictions are conditional: a nonzero local gap for nontrivial flux; a three-dimensional entanglement area law; positive work required for shell attachment; and a specific source/expansion relation to generate \(w_{\rm effective}\approx-1\).

## 13. Provenance and final status

This construction preserves and extends the standalone URT ZPE research lineage:

- `research_archive/2026-11-21_urt_zpe_gaussian_joint/`: original four-site gauge-invariant Gaussian energy and entropy.
- `research_archive/2026-11-21_urt_zpe_lattice_area_law/`: connected two-dimensional gap, area-law entropy, bulk density.
- `research_archive/2026-11-21_urt_zpe_infinite_flux/`: certified positive **two-dimensional** bulk sector difference.
- `research_archive/2026-11-21_urt_zpe_interface/`: two-dimensional interface joining work and entropy from one vacuum.
- `research_archive/2026-11-21_urt_zpe_metric_response/`: static pressure and carrier-growth thermodynamics in two dimensions.
- **This work**: coherent cyclic three-dimensional extension, exact 3D flux moment, pressure isotropy along lattice axes, 3D area law, gapped shell-attachment operation, and full 3+1 effective-fluid continuity equation with necessary-and-sufficient \(\Gamma=3H\) criterion.

**Final status:** **COMPLETE CONDITIONAL MATHEMATICAL MODEL / PHYSICAL IDENTIFICATION PENDING.** This paper does *not* claim the experimentally established or uniquely URT-derived theory of the universe is finished. All genuine mathematical results are retained; the exact additional physical axioms needed to turn the model into cosmology are exposed rather than concealed or fitted.

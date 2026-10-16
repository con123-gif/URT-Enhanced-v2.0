# Newton’s Cathedral — four-link DEC, parity, fluctuation and energy audit

**Date:** 16 October 2026  
**Scope:** Exact finite icosahedral identities and conditional stochastic constitutive models. No fitted observational constants, no new GitHub commits.  
**Reproduce:** `python cathedral_four_links_audit.py` (NumPy + SciPy; requires `cathedral_operator_audit.py` in the same directory). Results are recorded in `cathedral_four_links_results.json`.

## Executive finding

The proposed edge Hodge decomposition is correct and exposes a useful **new 30-edge, rank-10 parity-flipping complex structure**. Tracking oriented cells correctly indeed distinguishes an even vertex fiveplet and an odd oriented-face fiveplet. However, the unsigned vertex–face incidence map changes parity; it is not by itself a full-icosahedral parity-equivariant map. Moreover, `curl grad = 0` does **not** deliver the propagating 4D Weyl/Bianchi equations. A standard covariance-matching Ornstein–Uhlenbeck (OU) noise model can have a stationary quadratic variance of `1/chi_35`, but that variance is neither required by the BKM metric alone nor compatible as a direct, unscaled 8×8 density perturbation around the Cathedral master state. The first-law heat channel can be written exactly as an accounting equation, yet a microscopic transfer of energy into the scalar mode has not been derived.

## 1. Full Hodge decomposition and a new edge-space complex structure

Use **cochain convention**

- `d0 = ∂1ᵀ ∈ R^(30×12)` (discrete gradient),
- `d1 = ∂2ᵀ ∈ R^(20×30)` (discrete curl), with `d1 d0=0`.

Define

`Δ0=d0ᵀd0`, `Δ2=d1d1ᵀ`, `Δ1=d0d0ᵀ+d1ᵀd1`.

The entire shell edge space splits exactly:

`R^30 = im(d0) ⊕ im(d1ᵀ)` with `dim = 11 + 19` and **no harmonic one-forms** (the shell is a triangulated sphere).

For the rank-five vertex projector `P5`, and the previously proved incidence isometry `J5=C P5/sqrt(3)` with `P_face5=J5J5ᵀ`, define normalized edge maps

`E=d0 P5/sqrt(6)`, `B=d1ᵀ J5/sqrt(2)`.

Their identities are exact:

`EᵀE=BᵀB=P5`, `EᵀB=0`, `Δ1 E=6 E`, `Δ1 B=2 B`, `d1 E=0`, `d0ᵀ B=0`.

All numerical checks have residuals around `10^-15` or zero.

**Additional constructive result:** the skew edge operator

`J_edge=B Eᵀ−E Bᵀ ∈ R^(30×30)`

satisfies

`J_edgeᵀ=−J_edge`, `J_edge²=−(EEᵀ+BBᵀ)`, `rank(EEᵀ+BBᵀ)=10`.

It supplies a legitimate 10-dimensional complex structure **entirely on the 30-edge carrier**, without skipping the edge layer. It rotates the selected exact fiveplet and coexact fiveplet into each other. This `J_edge` is **a composite Hodge-duality operator defined by the isometries**, not simply the native coboundary `d1` or a derivation of physical wave propagation. Indeed, `d1E=0` identically: the exact-gradient fiveplet alone has zero topological curl. Four-dimensional Weyl dynamics require spatial covariant derivative/curl on symmetric trace-free tensors, constraints, lapse/extrinsic curvature and a Lorentzian spacetime evolution rule.

### An additional *native DEC curl-wave* subsystem — five exact oscillators

The **actual** topological curl/adjoint gives a different, and stronger, finite wave operator on **edge plus face** cochains:

`Ccurl = [[0,d1ᵀ],[-d1,0]] ∈ R^(50×50)`, satisfying `Ccurlᵀ=−Ccurl`.

Its invariant five-plus-five subsystem is the coexact **edge** map `G=d1ᵀ J5/sqrt(2)` and face map `J5`. Let `a,b ∈ im(P5)` and `edge=G a`, `face=J5 b`. Native cochain dynamics

`dot edge=d1ᵀ face`, `dot face=−d1 edge`

reduce **exactly** to

`dot a=sqrt(2) b`, `dot b=−sqrt(2) a`, hence `ddot a+2a=0`.

This is an exact discrete Maxwell-like first-order wave equation whose dimensionless frequency is `sqrt(2)` from the face-fiveplet eigenvalue `2`, with invariant-subspace residual `7.47×10^-16`. It does **not** act on the original exact-gradient fiveplet (`d1 d0=0`), does not derive a physical speed of light, and is not the Weyl/Bianchi spin-2 wave operator. Its natural frequency differs from the optional URT golden-angle rotation frequency `2pi/phi²≈2.39996`; identifying their physical time scales would need a separate dynamical law.


## 2. Signed antipodal cochain parity — verified with an important qualification

Under inversion, vertices map by the unsigned permutation `P_v`; oriented edges transform by a permutation with edge-orientation signs `P_e`; outward oriented 2-faces transform by the **negative** of the naive antipodal face permutation, `P_f`.

The cochain maps are covariant:

`d0 P_v=P_e d0`, `d1 P_e=P_f d1` (numerical residual identically zero).

On the selected fiveplets:

`P_v E=E` via the vertex source, while `P_f J5=−J5`, so the *oriented face* fiveplet is odd. On edges, `P_e E=E`, `P_e B=−B`, and

`P_e J_edge + J_edge P_e =0`.

Thus the two fiveplets really carry the **opposite signed antipodal parities** under these cochain actions. This resolves the previous ambiguity that arose from treating face coordinates as unoriented scalar values.

**But:** `J5` is constructed from **unsigned** incidence. It is a parity-changing, not parity-preserving, map:

`P_f J5−J5 P_v=−2J5`, with Frobenius norm `2sqrt(5)=4.472135955`.

One may interpret an orientation-changing map as a pseudoscalar-carrying coupling, but that extra transformation law must be included when constructing a fully `I_h`-covariant physical action. The parity assignment is a finite cochain representation fact, **not** yet the general-relativistic electric/magnetic Weyl decomposition.

## 3. BKM fluctuation–dissipation: exact conditional OU covariance, but no parameter-free physical floor

Let `chi=chi35=47.96697830338`, and `q=(e, b_tilde) ∈ R^10`. A chosen near-equilibrium quadratic potential in dimensionless thermal units is

`f(q)=chi/2 ||q||²`.

For the **chosen linear dissipative dynamics**

`dq = A q dt + sqrt(Q) dW`, `A=omega Ω−Γ diag(6I5,2I5)` (Γ>0),

requiring stationary Gibbs-like covariance `Σ=I10/chi` and imposing the OU stationary Lyapunov equation

`AΣ+ΣAᵀ+Q=0`

**derives the necessary noise covariance for this stochastic model**:

`Q=(2Γ/chi) diag(6I5,2I5)`.

The code independently solves the continuous Lyapunov equation and finds `||Σ−I10/chi||_F=1.16×10^-17`. Therefore, *conditional on the quadratic Gibbs equilibrium and OU model,* all ten coordinates have variance `1/chi`, giving

`E ||q||²=10/chi=0.2084767553`, and `E ||Q(e)||_F²=8/chi=0.1667814043`.

This is **not** compelled by the static BKM Hessian alone: the dynamical mobility Γ, noise statistics, relevant coordinates and temperature/clock conversion are additional hypotheses. Halving the noise at the same drift halves the stationary covariance. Genuine quantum FDT constrains frequency-dependent response and bath correlations, not merely a classical white-noise variance from one Hessian coefficient.

### Positivity obstruction for the proposed *direct* density-tangent interpretation

Write `rho_star=diag(aI4,bI4)`, with `a=1/[4(1+Delta²)]`, `b=Delta²/[4(1+Delta²)]`, and embed

`rho=rho_star+(1/sqrt(2))[[0,Z],[Z†,0]]`, `Z=Phi5(e)+iPhi5(b_tilde)`.

The 8×8 density is positive only if

`||Z||op < sqrt(2ab) = 0.0008800560550`.

By `||Z||F²=||q||² <= 4||Z||op²`, **every allowed density-tangent state** obeys

`||q||² < 8ab = 3.09799464×10^-6`.

The proposed Gaussian floor has `E||q||²=0.20847676`, which exceeds this rigorous bound by a factor **67,294**. An unbounded Gaussian has a nonzero probability of producing a nonpositive density at any nonzero scale. Therefore `1/chi` is not a physically admissible quantum fluctuation floor in the **unscaled additive density coordinates** used by the BKM isometry.

This does **not** disprove a noise mechanism in other variables (e.g., bounded unitary angles, properly rescaled geometric coordinates or a nonlinear full-state stochastic dynamics). Such a mapping and normalization must be derived rather than silently inserted.

### A finite-state, positivity-preserving alternative already contained in rho_star

The existing master Gibbs state fixes a two-sector projector probability

`p5=Delta²/(1+Delta²)=6.196027671×10^-6`.

Repeated projective measurements of the exhaust-sector occupancy have exactly

`Var(1_exhaust)=p5(1−p5)=6.195989280×10^-6`.

That is a genuine **bounded finite quantum observable variance**, without an assumed Gaussian. For a simple **optional** two-state detailed-balance Markov dynamics, take rates `r(3→5)=γ p5`, `r(5→3)=γ(1−p5)`. It preserves the exact Gibbs populations, obeys detailed balance, and has autocorrelation

`C(t)=p5(1−p5) exp(−γ t)`.

**The rates ratio is fixed**: `r(3→5)/r(5→3)=Delta²`; the absolute speed γ is **not fixed**. This is a constructive, bounded substitute for the claimed zero-parameter 10D Gaussian floor; it does not directly produce a Weyl fluctuation spectrum.

Also, deterministic decay of a **mean** quadrupolar perturbation does not make `rho_star` pure, nor does it erase the finite state's intrinsic quantum measurement fluctuations.

## 4. First-law bookkeeping — precise conditional identity

For a *defined quadratic tidal energy* `E_tidal=k_B T chi ||q||²/2`, under deterministic `qdot=A q`,

`dE_tidal/dt = −k_B T chi Γ(6||e||²+2||b_tilde||²)`.

Introducing a background energy coordinate `E_bg` by

`dE_bg/dt = +k_B T chi Γ(6||e||²+2||b_tilde||²)`

indeed gives `d(E_tidal+E_bg)/dt=0`.

This is a valid **model definition/accounting identity**, not yet a microscopic derivation that the uniform Laplacian mode receives heat. The graph Laplacian annihilates constants; transferring quadratic mode energy into the uniform sector needs a separately specified nonlinear coupling and a thermodynamic equation of state. Moreover the BKM relative-entropy potential is a **free-energy** excess, not automatically the subsystem's internal energy.

With the OU/FDT noise added, there is also continuous **energy injection** from the reservoir. Ito's formula, measuring energy in `k_B T` units, gives

`d E[f]/dt = −chi Γ E[6||e||²+2||b_tilde||²] + Γ (6×5+2×5)`.

At Gibbs OU equilibrium the two terms separately equal `−40Γ` and `+40Γ` and cancel. Thus a reservoir model that only collects the deterministic loss would violate equilibrium energy balance; the stochastic return flux is indispensable.

## Result classification and next physical calculation

| Claim | Status |
|---|---|
| Full 30-edge exact/coexact Hodge 1-form decomposition | **EXACT** (11+19, no harmonic one-forms) |
| Two normalized edge fiveplets, eigenvalues 6 and 2 | **EXACT** |
| Rank-10 parity-changing edge complex structure | **EXACT constructed finite operator** |
| Native DEC curl wave on coexact edge + face fiveplets | **EXACT** five harmonic modes, frequency `sqrt(2)` in cochain units |
| Vertex even / outward oriented face odd parity | **EXACT under specified signed cochain actions** |
| J5 an `I_h`-equivariant even intertwiner | **FALSE** in unsigned form; it is parity-changing |
| The actual 4D Weyl/Bianchi propagator follows from `d1d0=0` | **NOT DERIVED** |
| OU variance `1/chi` and quadrupole floor `8/chi` | **EXACT only for the stipulated Gaussian OU/Gibbs model** |
| That variance is a valid *unscaled* additive quantum density fluctuation | **INCOMPATIBLE WITH positivity**, by factor >67,000 in squared norm |
| Hidden exhaust Gibbs occupancy / variance | **EXACT finite probability/observable result** |
| Positive entropy/energy balance with chosen reciprocal bath | **EXACT conditional thermodynamic bookkeeping** |
| Microscopic background heat transfer, absolute damping, physical G, full gauge law | **OPEN** |

**Most productive next test:** construct a completely positive quantum Markov generator on the 8-state hidden carrier respecting `rho_star` and the orientation-signed 30-edge geometry, extract its linearized dissipative eigenvalues and noise correlations, then test whether its continuum/coframe sector generates the correct constrained Weyl equations. This removes the inconsistent Gaussian-density assumption and exposes whether any rate remains undetermined.

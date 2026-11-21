# Connected URT prime-flux oscillator: uniform gap, exact Gaussian boundary-entropy area law, and thermodynamic ZPE

**Date:** 21 November 2026  
**Status:** THEOREM for the expressly defined uniform-flux magnetic graph oscillator and its canonical Gaussian quantisation; **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**. No fit, no claimed derivation of canonical quantum mechanics, physical vacuum, gravity, cosmological constant, or Planck units. This is the standalone prime-URT ZPE branch, NOT a replacement for any other larger model.

## Source and continuity

Original primitive data: the golden phase `theta=2*pi/phi**2`, `phi=(1+sqrt(5))/2`; proposed reciprocal sector flux `c_eps=eps*exp(-i*theta)`, `eps=+/-1`. The **four-site** graph `L_2=2I-A(c)` was already checked in `research_archive/2026-11-21_urt_zpe_gaussian_joint/URT_JOINT_ZPE_ENTROPY_THEOREM.md`, with a canonical charged harmonic Hamiltonian and a site-local gauge invariant entropy. This report *extends that precise graph*, not the incompatible compressed infinite half-line operator `4I-A` (which remains a separate valid model). The uniform extension choice itself is declared; it has not been uniquely selected by primitive URT.

We use `N >= 2`, sites `(x,y)` with `0<=x,y<N`, edges between nearest neighbours. Horizonal forward edge phase 1; vertical forward edge phase `c_eps**x`. Every counterclockwise plaquette has the same flux, up to its orientation. For arbitrary site vectors `u`, let

`Q_N(u) = sum_{(i,j) edge} |u_i - phase_ij*u_j|^2 = <u, L_N u>`.

This is the **magnetic graph Laplacian**, whose boundary diagonal is the *true vertex degree*, not a fixed 4. At `N=2`, it is exactly the earlier `2I-A(c)` (orientation conventions do not affect spectrum). Assume the physical canonical oscillator construction has two real coordinates per complex site, Hamiltonian

`H_N = P^T P/(2m) + (m*omega0^2/2) Q^T R(L_N) Q`,

where `R` denotes the standard realification of the Hermitian matrix. For fixed positive `m`, `omega0`, and standard canonical commutation relations, the unique Gaussian ground state has, setting `hbar=m=omega0=1` for covariance calculations,

`<QQ^T>= (1/2) R(L_N^(-1/2))`, `<PP^T>= (1/2) R(L_N^(1/2))`, `<{Q,P}>=0`,

and ground-state energy `E_0(N)/(hbar*omega0)=Tr(sqrt(L_N))` (not half this, because realification doubles all oscillator modes). Canonical quantisation is an explicit extra physical premise, not derived from an arithmetic commutator.

## Theorem A: uniform positive flux-frustration gap

Write `F=|arg(c_eps)|` in `(0,pi)`, and `lambda_sq(F)=2-2cos(F/4)` for the minimum eigenvalue of the **original** single-plaquette magnetic Laplacian `L_2`. Then for every integer `N>=2`,

`g(F) I <= L_N <= 8 I`, where `g(F)=lambda_sq(F)/2=1-cos(F/4)>0`.

**Proof.** Restrict any global `u` to one plaquette `p`. The exact four-cycle eigenvalue gives `Q_p(u)>=lambda_sq sum_{v in p}|u_v|^2`. Sum over all plaquettes. Every edge belongs to at most two plaquettes, hence `sum_p Q_p <= 2 Q_N`. Every vertex belongs to at least one plaquette, hence `sum_p sum_{v in p}|u_v|^2 >= ||u||²`. So `2 Q_N >= lambda_sq ||u||²`, proving the lower bound. The upper bound follows `|a-b|²<=2|a|²+2|b|²` and maximal vertex degree `<=4`. QED.

No fitted mass or finite-size regulator is required for the **dimensionless** gap. Values: `g_+=0.174659194610953...`, `g_-=0.0171387626390926...`.

## Theorem B: exact joint Gaussian boundary entropy and uniform area law

Let `A` be the left portion `{(x,y):0<=x<floor(N/2)}` and `B` the rest. Set `W=L_N^(1/2)`, `V=L_N^(-1/2)=W^-1`. For site blocks `W_A,V_A` and cross block `W_AB`, define

`X=V_A^(1/2) W_AB W_B^(-1/2)`.

The Schur complement `V_A^-1=W_A-W_AB W_B^-1 W_BA` gives

`V_A^(1/2) W_A V_A^(1/2)=I_A+XX^dagger`.

Let `t_j>=0` be eigenvalues of `XX^dagger`. The symplectic eigenvalues of the realified reduced covariance are `nu_j=sqrt(1+t_j)/2`, **each repeated twice** because the original field is complex. Its *von Neumann entanglement entropy* is exactly

`S_A/k_B=2 sum_j h((sqrt(1+t_j)-1)/2)`, where `h(n)=(n+1)ln(n+1)-n ln n`.

This computes ZPE and entropy from the **same pure Gaussian vacuum**, not by importing the entropy of a separate eight-state master density.

**Entropy estimate.** For `n>=0`, `h(n)<=2 sqrt(n)`: derivative comparison uses `ln(1+1/n)<=1/sqrt(n)`, which follows `ln(1+y²)<=y` for `y>=0`. Also `n=(sqrt(1+t)-1)/2<=t/4`. Therefore `h(n)<=sqrt(t)`, and

`S_A/k_B <= 2 Tr sqrt(XX^dagger) = 2 ||X||_1 <= 2 g^(-1/2) ||W_AB||_1`.

Let `K=I-L_N/8`, positive and `||K||<=q=1-g/8<1`. The binomial series

`W=sqrt(8) sum_{k>=0} (-1)^k binom(1/2,k) K^k`

converges in operator norm. Since `K` only connects nearest-neighbour sites or stays on the same vertex, `K^k_ij=0` when `k<dist(i,j)`. Using `|binom(1/2,k)|<=1` and `||K^k||<=q^k` yields

`|W_ij| <= sqrt(8) q^dist(i,j)/(1-q)` for `i!=j`.

For the straight cut, a direct Manhattan-distance sum gives

`sum_{i in A,j in B} q^dist(i,j) <= N*q*(1+q)/(1-q)^3`.

Finally use the rank-one bound `||W_AB||_1<=sum_{i in A,j in B}|W_ij|` to obtain the **uniform (in N) area law**

`0 <= S_A(N)/k_B <= C(F) N`,

`C(F) = 2 sqrt(8)/sqrt(g) * q*(1+q)/(1-q)^4`, `q=1-g/8`.

This coefficient is an explicit, extremely loose analytic upper bound; it is not a fitted physical entropy-per-bond coefficient. It is finite for each nonzero flux. Numerically `C_+~1.15e8` and `C_-~4.09e12`. Sharpening it is possible but unnecessary to prove O(N).

**Gauge invariance.** Under arbitrary onsite phases `U=diag(e^{i chi_i})`, `L' = U L U^dagger`, so `W'=UWU^dagger`, `V'=UVU^dagger`; the restricted matrix `V_A^(1/2)W_A V_A^(1/2)` changes by conjugation with `U_A`, preserving all `nu_j` and the entropy. Physically the transformation is a product of onsite real rotations on local coordinate pairs. `E0` is also invariant.

## Theorem C: existence and surface error for the thermodynamic ZPE density

Define the infinite uniform-flux magnetic lattice operator `L_inf=4I-A_inf` on `l²(Z²)`, with the same nearest-neighbour phase rule. Its operator interval is also within `[g,8]` (by applying the same plaquette proof to finitely supported states). Let `tau_inf` be the diagonal matrix element at the origin in this uniform-flux gauge (all other diagonal spectral values agree by magnetic translation), and define

`e_inf(F) := tau_inf(sqrt(L_inf))`.

Then `e_inf(F)` exists and

`|Tr sqrt(L_N) - N² e_inf(F)| <= B(F) N` for every `N>=2`,

with an explicit, nonoptimal constant, for example

`B(F)=8 sqrt(8)*q*(2-q)/(1-q)^2`.

**Proof.** Expand `sqrt(L_N)` and `sqrt(L_inf)` via the same norm-convergent binomial series for `K=I-L/8`. At degree `k`, the diagonal `(K_N^k)_{ii}` agrees with the infinite-lattice diagonal when `i` is farther than `k` from the boundary. At most `4(k+1)N` vertices can be within `k` steps of the boundary; each diagonal moment differs by at most `2q^k`. The total trace difference of degree `k` is therefore bounded by `8(k+1)N q^k`. Summing for `k>=1` (the degree-zero term cancels), with binomial coefficient magnitude at most 1, gives the stated bound. QED.

Thus the full Gaussian zero-point energy satisfies

`E0(N)=hbar*omega0 [N² e_inf(F)+O(N)]`,

where the leading term scales with the **number of lattice sites**, while bipartition entanglement scales at most with the **length of the cut**. Their natural scale difference is a genuine theorem of this declared model, not an inserted area entropy.

The first flux-sensitive infinite local spectral moment occurs at fourth order:

`tau_inf(A_inf^4)=28+4(c+c^-1)=28+8cos(F)`, so

`tau_inf(L_inf^4)=668+8cos(F)`.

There are 28 flux-neutral four-step returns, four clockwise single-plaquette returns, and four anticlockwise returns. This is a gauge-invariant mathematical fingerprint of frustration; it does not alone imply that the square-root density differs between flux sectors by a certain sign.

## Executed numerical check (Python/SciPy; local container)

`python URT_ZPE_LATTICE_AREA_CERT.py` executed with exit code 0 on 21 November 2026. It constructs exactly these graph operators and calculates *both* ground-state energy and covariance entanglement from the same eigendecomposition. For N=2 it explicitly reproduces the frozen four-state magnetic loop spectrum and previous values. It independently tests arbitrary onsite phase redefinitions for N<=5 and verifies the size-independent lower gap bound on N=2,3,4,5,6,8,10,12. Supplemental local N=14,16,20 checks were also executed.

| N | E+/N² | E-/N² | S+/N | S-/N |
|---:|---:|---:|---:|---:|
| 2 | 1.300952701763 | 1.248209050371 | 0.271466763748 | 0.719393003714 |
| 6 | 1.735264712246 | 1.723895850856 | 0.089758979563 | 0.129159084234 |
| 12 | 1.833653818083 | 1.823997727049 | 0.078801822550 | 0.110000049147 |
| 20 | 1.872171165782 | 1.863105947251 | 0.074819323266 | 0.104359108525 |

Numerical results at finite N support the analytic gap/area theorem but cannot establish a precise nonzero asymptotic difference of square-root spectral moments between sectors without a separate argument.

## Physical interpretation and limitations

**What is proved:** For the explicitly declared connected golden-flux lattice oscillator, positive frustration gap; one consistent vacuum's exact energy and exact onsite-subsystem entropy; site-local gauge invariance; a rigorous area-law upper bound `O(N)`; thermodynamic ZPE density exists with `O(N)` boundary error; the fourth moment detects flux.

**What is NOT proved:** Primitive URT uniquely selects the uniform prime-lattice extension, canonical quantum commutators, a dimensional `omega0`, an absolute vacuum energy reference, metric or gravity, de Sitter equation of state, observable dark energy, a three-dimensional entropy-area law, or any 95.6%/100% cosmological closure. This construction adds no Cathedral operators, ARF targets, master-state entropy imported from another model, or fitted corrections.

**Next exact mathematical step:** calculate the infinite-volume **difference of the two sector square-root spectral traces** from the gauge-invariant return-walk/heat trace, and prove its sign (or explicit obstruction) without numeric extrapolation. Derive the boundary-energy response under a scale change from the *same* lattice before any gravitational identification.
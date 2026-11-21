# URT ZPE: a common-state vacuum interface energy–entropy theorem

**Date:** 2026-11-21  
**Track:** standalone URT prime magnetic ZPE; *not* any Cathedral/ARF problem or an RH claim.  
**Status:** **THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**, conditional on the same declared uniform golden-flux lattice and canonical charged oscillator Hamiltonian established in the previous two URT ZPE results. No fitted couplings, tax, arbitrary entropy carrier, or dark-energy normalization.  
**Sources:** `research_archive/2026-11-21_urt_zpe_gaussian_joint/`, `research_archive/2026-11-21_urt_zpe_lattice_area_law/`, and `research_archive/2026-11-21_urt_zpe_infinite_flux/`.

## Definitions — no new microscopic Hamiltonian

Let `phi=(1+sqrt(5))/2`, `theta=2*pi/phi**2`, and `z_eps=eps*exp(-i*theta)` for reciprocity sectors `eps=+/-1`. Set `F=|Arg(z_eps)| in (0,pi)`. On the `N x N` exponent lattice, with even `N >= 4`, define the **existing** nearest-neighbour magnetic graph Laplacian `L_N(F)` as the sum of covariant edge squares: horizontal phase 1, vertical phase `exp(i*x*Arg(z_eps))`, and diagonal equal to actual vertex degree. This is the exact same model whose `N=2` limit is `2I-A(z_eps)`. Its proven lower spectral bound is

    g(F) := 1 - cos(F/4) > 0,       g I <= L_N <= 8 I.

Cut the lattice into left (`x < N/2`) and right (`x >= N/2`) halves; `A` is the left set. Let `B_N=sum_{y=0}^{N-1} b_y b_y^dagger`, where `b_y = |N/2-1,y> - |N/2,y>` is the actual horizontal edge crossing the cut. Then `Tr B_N=2N` and `B_N>=0`, and the **decoupled** operator is exactly

    L_0 := L_N - B_N.

It is the direct sum of the two magnetic graph Laplacians of size `(N/2) x N`; **both are gapped by g**, because both dimensions are >=2. Interpolate only actual physical interface edges by their stiffness, not by adjusting a cosmological parameter:

    L_t := L_0 + t B_N,  0<=t<=1.

All `L_t` obey `g I <= L_t <= 8 I`. The original charged canonical oscillator Hamiltonian, without modification, has dimensionless complex-field vacuum energy `e(t)=Tr sqrt(L_t)` in units of `hbar omega0`, and one pure Gaussian vacuum with physical site entanglement across the same cut `S_A` at `t=1`.

## Theorem 1: microscopic vacuum interface energy and generalized force

The energy required to restore the **actual missing interface bonds** is

    Delta e_N(F) = Tr sqrt(L_N) - Tr sqrt(L_0)
                 = 1/2 integral_0^1 Tr[B_N L_t^(-1/2)] dt.

This follows from differentiation under the trace via the analytic functional calculus; commutativity between `B_N` and `L_t` is unnecessary. From `g I<=L_t<=8 I`, and `Tr B_N=2N`, we obtain the strict, size-independent two-sided *boundary* estimate

    BOX: N/sqrt(8) <= Delta e_N(F) <= N/sqrt(g(F)).

In physical units `Delta E_interface = hbar omega0 Delta e_N`. The parameter-conjugate response is also exactly determined:

    partial E0(t)/partial t = hbar omega0/2 Tr[B_N L_t^(-1/2)]
                          in [hbar omega0*N/sqrt(8), hbar omega0*N/sqrt(g)].

No phenomenological surface tension has been inserted. The derivative is a *generalized stiffness force*, not a mechanical pressure or gravity until URT specifies how `t` depends on physical deformation.

## Theorem 2: nonzero lower **and** upper area bounds for the very same vacuum entropy

Write `W=sqrt(L_N)` and `V=W^-1`; restrict matrices to physical site halves. Define

    X := V_A^(1/2) W_AB W_B^(-1/2),    T := X X^dagger >=0.

The Gaussian covariance/Schur-complement identity from the previous same-vacuum theorem gives

    S_A/kB = 2 Tr h( (sqrt(I+T)-I)/2 ),
    h(n)=(n+1)ln(n+1)-n ln n.

Let `t_j>=0` be the eigenvalues of `T`. Using the exact inequality

    h((sqrt(1+t)-1)/2) >= t / (sqrt(1+t)+1)^2,

and `||X||²<=8/g`, yields

    S_A/kB >= 2 Tr T / (sqrt(1+8/g)+1)^2.

Moreover, since `V_A>= I/sqrt(8)` and `W_B^-1 >= I/sqrt(8)`,

    Tr T >= (1/8) ||W_AB||_F².

The identity `L_AB=W_A W_AB+W_AB W_B` and `||W_{A/B}||<=sqrt(8)` gives

    ||W_AB||_F² >= ||L_AB||_F²/32 = N/32

because the only cross-block entries of the unchanged magnetic Laplacian are the `N` unit-strength joining bonds. Combining all inequalities,

    BOX: c_low(F)*N <= S_A/kB <= C_area(F)*N,

where both coefficients are *exact, parameter-free mathematical functions of the golden flux*:

    c_low(F) = 1/[128*(sqrt(1+8/g(F))+1)^2] >0,
    q(F)=1-g(F)/8,
    C_area(F)= 2*sqrt(8)/sqrt(g(F))*q(F)*(1+q(F))/(1-q(F))^4.

The upper bound `C_area N` was established in the preceding connected-lattice proof; the **new nonzero lower bound** makes the area scaling genuinely two-sided: `S_A = Theta(N)` for every fixed nonzero golden flux. Both entropy and energy are gauge-invariant under arbitrary onsite U(1) phases.

## Theorem 3: an intrinsic two-sided ZPE–entropy *interface inequality*

Eliminate the interface length `N` from Theorems 1 and 2. For the **same** finite magnetic network and its **same** pure Gaussian ground state:

    BOX: c_low(F)*sqrt(g(F)) * Delta e_N
              <= S_A/kB
              <= C_area(F)*sqrt(8) * Delta e_N.

This links a measurable in-principle interface stiffness response and the subsystem's quantum information without introducing a second Hamiltonian, an entropy-per-carrier number, a free stability tax, or a dark-energy closure target. It does **not** assert a universal equality `S=E/T`, nor equate entanglement entropy with gravitational horizon entropy.

## Theorem 4: the nonzero thermodynamic interface-energy density exists

Let `L_t^seam` act on `l²(Z²)` with the same golden magnetic flux, with horizontal links crossing the seam between `x=-1` and `x=0` weighted by `t`, all other links weighted by 1. This is the natural infinite-volume continuation of the *same* `L_t` (up to magnetic gauge shifts). The two half-plane pieces at `t=0` both retain all their plaquette loops and have the gap `g`, so `g I<=L_t^seam<=8I` uniformly in `t`.

With `b=|-1,0>-|0,0>`, define **without fitting**

    sigma(F) := (1/2) integral_0^1 <b,(L_t^seam)^(-1/2)b> dt.

Then the finite-interface energy obeys

    Delta e_N(F) = sigma(F)*N + O_F(1),
    1/sqrt(8) <= sigma(F) <= 1/sqrt(g(F)).

**Constructive error proof.** Set `K_t=I-L_t/8`, with `0<=K_t<=q I`, `q=1-g/8<1`. Use the *uniformly convergent* binomial expansion

    L_t^(-1/2) = 8^(-1/2) sum_{k>=0} [binom(2k,k)/4^k] K_t^k.

The local matrix element at each seam bond `b_y` agrees with the infinite-seam matrix element for all powers `k<d_y`, where `d_y=min(y,N-1-y,N/2-1)` (up to a local magnetic gauge shift). Each error term has absolute value at most `4 q^k`, since `||b_y||²=2` and each matrix operator is bounded by `q^k`. Hence its contribution to the integrated derivative is <= `2 q^(d_y)/(sqrt(8)(1-q))`. Summing over all `y`,

    sum_y q^(d_y) <= 2/(1-q) + 2/(1-q)^2.

Therefore an explicit, non-optimised uniform surface remainder bound is

    |Delta e_N(F) - N*sigma(F)|
       <= (4/sqrt(8))*[(1-q)^(-2)+(1-q)^(-3)].

Thus **a finite, strictly positive macroscopic vacuum *interface* energy per boundary bond emerges from the same microscopic frustrated Hamiltonian**. No interpolation parameter was selected to hit a target; `t` ranges over the exact mathematical act of joining the disconnected subgraphs.

## Independent numerical certificate (local container)

`python URT_ZPE_INTERFACE_CERT.py` ran with exit 0 for `N=4,6,8,10,12` and both reciprocal phases. It builds `L_N` and `L_0` directly from the original magnetic edges, compares the two ground energies, evaluates the site's Gaussian entropy from the *same eigendecomposition*, checks the nonzero entropy bound, and verifies derivative `dE/dt` against finite differences at `t=.125,.5,.875` as a diagnostic (those are test points, not fitted coupling values).

| N | sector | interface Delta e/N | S_A/(kB N) |
|---:|:--:|---:|---:|
| 4 | + | 0.629708956294 | 0.108381420908 |
| 4 | - | 0.678778265794 | 0.174957730469 |
| 8 | + | 0.590474421852 | 0.083880292803 |
| 8 | - | 0.601386202985 | 0.117709732477 |
| 12 | + | 0.581353701220 | 0.078801822556 |
| 12 | - | 0.590626875319 | 0.110000049154 |

## A coherent physical scope — no invented completion

**Established conditional mathematical core:** original golden magnetic loop; nonzero lattice spectral gap; canonically quantized Gaussian vacuum; gauge-invariant ground-state energy and entanglement; finite nonzero *bulk* energy-sector separation; a uniform two-sided *surface* energy–entropy connection with a genuine finite nonzero surface-energy limit. These are all parts of **one specified quantum-lattice model**.

**Physical assumptions still to derive:** why primitive URT uniquely selects quadratic-reciprocity flux and the charged canonical field; the dimensionful oscillator scale `omega0`; how the lattice spacing/field dynamics couple covariantly to a physical metric; why the relevant entropy is horizon entropy; and the actual 3+1-dimensional gravitational stress and dark-energy equation of state. The existence of a surface-energy tension does not automatically imply a physical negative vacuum pressure or `w=-1`.

**RESUME HERE:** Derive geometric/metric dependence `omega0[g], L_N[g]` from primitive URT rather than assuming it. Evaluate `T_munu = -(2/sqrt(-g))delta Gamma_vac/delta g^munu` from the same gauged vacuum and compare its energy and entropy responses. Do not fit an empirical target or reintroduce the unrelated entropy-carrier master state without a demonstrated map.
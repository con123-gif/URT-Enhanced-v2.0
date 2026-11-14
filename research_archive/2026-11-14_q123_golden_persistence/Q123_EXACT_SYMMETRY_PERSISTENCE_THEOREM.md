# Q123 — Exact kinetic prefactor for symmetry-broken orientation persistence (Track M)

14 November 2026. A **new exact asymptotic rate theorem for a SPECIFIED local heat-bath completion** of the previously verified 13-contact golden frustration. This is not a physical four-dimensional coupling law, and neither 24-clock nor historical Q77/Q112 selected-history dynamics was used.

## Input and scope

The complete Cathedral five-Platonic 190-cochain / 50→8→12 / H64 hidden source has already been checked in Q101 and charges are developed through Q122. Here we study the EXACT LOCAL bottleneck it contains, not replace the complete physical field action with 13 spins. Original twelve golden icosahedral outer Ising contacts s_i, 30 original nearest-neighbour edges, and independent centre spin c give H(s,c)=sum_edges s_i s_j+phi c sum_i s_i. Q120 proved Eg=-6-4phi, 60 minima in two 30-configuration branches, first gap sqrt5−1, minimum five-flip reversal barrier B=2(sqrt5−1) at saddle energy Es=-10.

**New declared kinetic choice:** continuous-time single-contact heat-bath Glauber dynamics, every one of the thirteen contacts attempting with unit model rate,

    q_beta(x,x^flip_i)=1/(1+exp[beta*(H(x^flip_i)-H(x))]).

This choice has positive reversible Gibbs stationary measure pi_beta(x)∝exp(-beta H(x)), and both A5 spatial and global spin inversion symmetries. It fixes an INTERNAL attempt-rate convention but is NOT proven uniquely selected by the whole 190/H64/24 source. Multiplying every q by arbitrary k>0 preserves all these geometric and thermodynamic properties while changing decay times, so a physical clock/kinetic scale is still open.

## NEW exact saddle-network capacity — not merely the Q120 barrier

Define the inversion-symmetric separating cut S={M>0}∪{M=0,c=-1}. Under simultaneous inversion of all 13 spins, S maps to its complement, so Gibbs mass pi(S)=1/2.

Direct exhaustive 8192-state verification finds: 12,012 native undirected single-spin edges cross S, but the ONLY 72 crossing edges whose maximal endpoint energy equals the minimum saddle Es=-10 are the 72 centre-spin flips at the 72 original outer E=-10,M=0 configurations (both endpoints at -10). Every other cut edge has higher maximal energy, at least -6.

The sublevel H<Es consists of **exactly two connected components, each with 150 configurations**: 30 ground configurations plus 120 lower-energy intermediate ones. It can be collapsed into two low-temperature basin nodes for the leading Dirichlet eigenmode. The 72 saddle pairs fall into two exact A5-compatible classes:

    (a,b) = (4,4): 60 saddle pairs
    (a,b) = (5,5): 12 saddle pairs,

where a/b are the number of downhill single-spin links from the corresponding saddle into each basin at energy -8-2phi. At the leading exp(-beta Es) Dirichlet-conductance order, downhill edges carry conductance 1, while equal-energy centre flips carry heat-bath conductance 1/2. Each saddle is a three-resistor series bridge with effective conductance g_ab=1/(1/a+2+1/b).

The 72 independent saddle channels are in parallel, giving the **exact integer capacity**

    C_eff = 60/(1/4+2+1/4) + 12/(1/5+2+1/5)
          = 60*(2/5)+12*(5/12) = **29**.

Each of the two metastable basins carries 30 ground configurations, with leading unnormalized Gibbs mass 30 exp(-beta Eg). Finite reversible electrical-network reduction then yields the LOWEST nonzero full-state generator eigenvalue

    **lambda_1(beta) ~ (29/15) exp[-2(sqrt5−1) beta]**   as beta→infinity.

This is a rigorous finite-state singular-perturbation/Dirichlet-form asymptotic for the DECLARED heat-bath generator. It is an exact no-fit rate per selected local attempt unit, not a physical number per second. The corresponding symmetric two-basin telegraph switching rate is lambda_1/2 ~ 29/30 exp(-beta B). The system has no preferred branch in its unique finite-beta Gibbs equilibrium.

## Independent full-state numerical verification

The executable constructs every one of the 8192 genuine 13-contact states and each of its 13 flip rates. It obtains the 60 actual proper icosahedral automorphisms from the ORIGINAL graph and reduces the complete generator by A5 to 192 genuine orbit classes, preserving the exact slow A5-symmetric orientation mode. It diagonalizes the detailed-balance symmetric representation of this TRUE native quotient, never fabricating a rate matrix. The scaled gaps converge to the exact 29/15:

    beta 3: 1.7386959617
    beta 4: 1.8728096559
    beta 5: 1.9153799797
    beta 6: 1.9280852624
    asymptotic exact: 1.9333333333.

The genuinely full-state separating-cut Rayleigh quotient also gives the finite-beta bound lambda_1<=4 W_cut/Z, with upper asymptotic coefficient 12/5. The normalized equilibrium cut-sign autocorrelation has integrated decay time at least Z/(4W_cut) (spectral Jensen), providing an actual rigorous persistence bound independent of a two-state fit.

## Direct link to existing Q122 charged Berry current and 24-count statistics

Q122 independently proved that within the PREVIOUSLY DECLARED unit shortest SU2 transport, 30+30 original ground branches carry all-time opposite Born charged currents J_-=-J_+, with exact cubic J_+(tau)=-2(1+sqrt5)/sqrt(25-10sqrt5)*tau^3+O(tau^5), and fixed-branch 24 count excess variance 552 J_+^2. Here the 13-contact reversible thermal process supplies a *natural conditional low-temperature lifetime* for that branch label, without adding a Q77 history clock.

If one **further declares an adiabatic two-state/independent conditional Born-emission observation model** with observation separation d in the heat-bath attempt-time units, its persistent orientation correlation factor is r=exp(-lambda_1(beta)*d), and with conditional one-step mean current ±mu and second moment s=p_++p_-:

    **Var(C_n)=n s+2 mu² sum_{k=1}^{n−1}(n−k)r^k.**

The finite sum equals r[(n−1)-nr+r^n]/(1-r)^2. At n=24 and r→1, the extra variance is 552 mu², Q122's exact fixed-sector result. At r→0, it is zero. These formulas are EXACT for the declared adiabatic telegraph/measurement model; deriving the full joint process without a timescale-separation premise is still an open task. No observed data or alpha/mass ARF was fitted.

## What was solved, and what is forbidden by symmetry

**Solved in the specified model:** the complete leading low-temperature orientation persistence exponent AND prefactor (29/15), actual 8192-state validation, rigorous finite-beta spectral upper bound and current-memory interpolation.

**Exact finite symmetry obstruction:** global inversion is a symmetry of H and the chosen heat-bath generator, which is irreducible at any finite beta; its unique equilibrium is invariant, so its mean oriented charged current and handedness remain zero. The model cannot select a unique physical sign without a newly derived parity-odd dynamical contribution, non-equilibrium initial/boundary preparation or an appropriate infinite-system limit. Choosing a sign is NOT a result of the 12+centre geometry alone.

**Still NOT SOLVED:** the complete five-Platonic/190/H64/24 physically selected positive transfer, unique attempt rate or seconds calibration, real-time SU2/charged16→Q96→actual 192-spinor/528-link Wilson normalization, globally stable 4D photon pole, physical alpha or mass laws. Do not equate exact finite thermal switching with baryogenesis. No old Q77 clock or Q115 residues and no Yang–Mills third-party files were used.

**Next physical task:** derive the parity-odd, source-covariant microscopic term and its dynamical coefficient from the native whole Cathedral, or show it cannot exist under the full exact symmetries; then use this native orientation dynamics in the existing Q105–Q111 charged/Wilson action to compute a gauge-invariant photon pole without arbitrary relative kinetic weights.

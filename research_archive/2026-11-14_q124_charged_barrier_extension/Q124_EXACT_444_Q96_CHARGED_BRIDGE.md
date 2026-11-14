# Q124 — Exact charged SU2/Q96 connection across the 444-state reversal bottleneck

14 November 2026. **Constructive exact finite-source theorem and source-native numerical certificate**, on the NEW asymmetry-first moving track. No selected Q77 history, old Hbits+c Abar, Q115 four poles, arbitrary Peierls angle or fitted physical constants. The complete five Platonic solids (190 cochains, 50→8→12 portal and H64 hidden sector) remain the previously validated Q101 geometrical context; this paper proves a NEW interface for its local 13-contact charged movement, not an autonomous whole-Cathedral physical action.

## Why this advances Q105/Q122 beyond Q120

Q105 derives the moving-state charge axis n_s=(phi/4)sum_i s_i v_i and unit shortest SU2 transport on 60 golden frustrated ground configurations (two disconnected 30-orbits). Q122 proved the two charged Berry currents are opposite at all model times, but no charged transport across the finite thermal reversal path had been derived. Q120/Q123 showed that the two orbits DO communicate through real excited states at the barrier -10, with exact residence prefactor 29/15 for a stipulated heat-bath rule. Q124 provides the previously missing **local charge-preserving bridge across that barrier**, without importing the historical selected-history generator.

## Exact Q(phi) nonvanishing theorem

On the original genuine 12 golden icosahedral vertices and 30 edges, let H(s,c)=sum_edges s_i s_j + phi c sum_i s_i, with c an active central spin. Include ALL 444 real 13-contact configurations at H<=-10 and their **1032** native one-spin edges. For each state define the real spatial contact sum W(s)=sum_i s_i v_i. The executable forms the coordinates as integer pairs a+b phi, with phi^2=phi+1 (no floating comparison used to certify absence of zeros). The complete exact norm-square spectrum is:

    |W|²=32−16phi : 180 configurations
    |W|²=24−12phi : 120 configurations
    |W|²=40−12phi : 120 configurations
    |W|²=48−16phi : 24 configurations.

Every value is strictly positive. So n_s=W/|W| is a globally defined charged axis at all 444 permitted states; on the 60 ground configurations it agrees exactly with Q105's phi W/4. Every one of the 960 permitted OUTER-spin flip edges has EXACT NONZERO Q(phi) cross-product W(s)×v_i and hence its endpoints cannot be antipodal; the other 72 CENTER-spin flips have identical axes. Therefore ALL 1032 shortest positive-denominator SU2 transporters exist, including the 72 true bottleneck flips. The smallest numerical adjacent-axis dot is about -0.3568220897730901, safely larger than -1.

## Genuine three-generation Q96 charge connection and Ward

Define S_s=n_s·sigma and on each undirected native edge (x,y)

    U_xy=[I+S_x S_y]/sqrt[2(1+n_x·n_y)].

Pauli algebra gives U_xy†U_xy=I, and S_x U_xy=U_xy S_y exactly. Embed U16 as four doublet copies of U2 plus identity on eight singlet species; define Q16(x)=Y+n_x·W_SU2 with Q105's original 16-dimensional hypercharge Y. The original three-generation particle-and-antiparticle registry is Q96(x)=diag(Q16(x)×3, -conjugate(Q16(x))×3), with U96(x,y) built from the corresponding U16×3 and conjugate U16×3.

Thus **Q96(x) U96(x,y)=U96(x,y) Q96(y)** exactly, for all 1032 native links. The genuine Q96 charge spectrum has multiplicities 6,18,18,12,18,18,6 at charges -1,-2/3,-1/3,0,+1/3,+2/3,+1. Tr Q96²=32 and Tr Q96⁴=176/9. The executable checks all 1032 edge U2 unitarities and particle/conjugate charge intertwiners; the worst Q16 Ward residual was about 4.1e-16. No random surrogate charge matrix.

## An explicit normalized quantum jump instrument — CONDITIONAL kinetics

Choose the Q123 **DECLARED** reversible single-spin local heat-bath rates q_xy=1/[1+exp(beta(H_y−H_x))] on the allowed 444-state graph, reflecting at its outside. Their sum of outgoing rates at each vertex is at most 13. Thus a **chosen dimensionless update step** dt=1/13 yields an explicitly normalized completely positive trace-preserving Kraus instrument on the 444×96-dimensional internal Hilbert space:

    K_(y←x)=sqrt(dt q_xy) |y><x| tensor U96_yx,
    K_0=sum_x sqrt(1−dt sum_y q_xy)|x><x| tensor I96.

Then sum K†K=I exactly, every K intertwines the global state-dependent electric charge Q, and detailed balance fixes a charge-unpolarized stationary Gibbs state. This is a genuine NORMALIZED POSITIVE charged transport that connects the two reversed sectors through native excited states. It **does not uniquely derive** dt, beta, a physical time or the stochastic heat-bath versus coherent unitary process; no physical relaxation claim beyond the defined model.

The original v61 48-site/192-spinor/528-link Wilson source is separately verified in Q105 for both gauge Ward orders. Algebraically, with its seven charge-sector blocks h_v61(qA), the new local U96 link intertwining implies covariance of the proposed joint 444×96×192 jump/Wilson tensor product under the ORIGINAL spatial site gauge transformations: P_y^q U96_yx=U96_yx P_x^q, so the internal jump operators commute with the site-dependent charge gauge transformations and Wilson's block transforms by conjugation. No fictitious A5 action on 48 Wilson sites and no full 8-million-dimensional matrix is required for this covariance statement. This is a **conditional algebraic gauge interface**, not a numerical all-terms 4D photon Hessian or a source-selected relative hopping rate.

## What is genuinely solved, and what remains open

Solved: exact Q(phi) nonzero charge axis across all 444 reversal configurations, 1032 nonsingular native shortest transports, all Q96 charged-Ward intertwiners, and a mathematically valid normalized CPTP jump map through the barrier under the declared heat-bath dynamics. This closes the local charge-connection gap between Q120/Q123 and Q105/Q122 in the NEW symmetry-breaking path.

Still open: derive unique microscopic relative coefficients, full original 190/H64/24 coherent+dissipative physics, selected sign of matter/antimatter asymmetry, stable 4D physical Wilson photon pole and measured alpha or fermion masses. Parity-even equilibrium itself cannot select a global handed orientation. This paper does not claim those missing physical results are solved.

Run the registered standalone Q124_NATIVE_CHARGED_BARRIER.py; executed locally on true Q(phi) source, original Q96 hypercharge and all 1032 links, PASS. GitHub original-source CI pending at commit. Continue the NEW Track M, never selected-history Q77.

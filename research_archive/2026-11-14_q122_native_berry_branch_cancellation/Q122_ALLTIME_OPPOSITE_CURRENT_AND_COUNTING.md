# Q122 — Actual moving charged Berry transport: opposite all-time currents and unbiased 24-counting memory

14 Nov 2026. **THEOREM for the specified Q105 local unit SU2 shortest-transport and Born-measurement completion. TRACK M ONLY.** No Q77 selected history, no old ARF fits, no arbitrary golden Peierls phase. This continues the already advanced full-five/hidden/moving Q101–Q111 research frontier rather than repeating Q119/Q120's local 13-contact gap and barrier.

## Provenance
The executable runs Q101's ACTUAL full-five (190 cochains, 50 source vertices, hidden 4_3/4_5 signed face W, H64 embedding, 12+golden-centre 60 minima and signed B), not a substitute 13-spin-only graph. It then rebuilds Q105's state-dependent n_s=(phi/4)sum_i s_i v_i, charged SU2 projectors P_s=(I+n_s·sigma)/2, and its chosen unit shortest transporter U_ab=(I+S_a S_b)/sqrt(2(1+n_a dot n_b)). NO Q77, Q112–Q115 clock, Hbits+c Abar or Q117a hybrid is imported. This construction is a mathematical TEST of one already-specified kinetic rule; first-principles selection of that rule, its energy/time unit and Q96/v61 physical coupling is still open.

## Exact native parity distinction (critical to avoid false cancellation arguments)
Let G be the 60 original frustrated minima, with 30 of outer M=+4 and 30 of M=-4. Let R be **global contact-spin reversal**, s->-s AND centre c->-c. It maps the two 30-state components, n_Ra=-n_a, but the source-current matrix is EVEN:

    B_{Ra,Rb}=B_{ab}.

This follows directly because Q101's original hidden 3/5 face sources are quadratic in the contact vector. The executable checks every one of the 240 oriented source transitions.

Separately, let P be **spatial antipodal inversion**, which permutes original vertex contacts by v_i->-v_i, with no spin sign reversal. It preserves each 30-state outer-M branch but reverses the original signed hidden source:

    B_{Pa,Pb}=-B_{ab},   A_{Pa,Pb}=A_{ab}.

This is the parity-odd native 4_3/4_5 current. The executable checks all 60 states and all links. Contact reversal R and spatial parity P must NOT be conflated.

## The new all-time charged-current theorem
For each edge (a,b) in the original 30-state graph define the unit complex electron-band hopping from Q105's existing shortest SU2 transport:

    h_ab=<v_a|U_ab|v_b>,  S_a v_a=v_a.

The choice of each local v_a's phase is gauge; every |h_ab|=1, and all original triangle/pentagon phases are fixed by the original n_s geometry (no new phase parameter).

Define the antiunitary Kramers map Theta=i sigma_y complex conjugation. It carries v_a at n_a to v_Ra at -n_a up to a local phase d_a. Since the shortest transporter is invariant under flipping BOTH endpoints, U_Ra,Rb=U_ab and commutes with Theta in its antiunitary sense. Therefore

    h_Ra,Rb = conjugate(d_a) conjugate(h_ab) d_b.

The negative branch is gauge-equivalent to the complex conjugate of the positive branch. Born transition probabilities from the two branches obey T^-_ab(t)=T^+_ba(t), all real t, in matched contact configurations. Combined with B_Ra,Rb=B_ab, the per-branch signed currents satisfy the **exact all-time identity**

    **J_minus(t) = -J_plus(t).**

An unbiased 60-minimum ensemble (or a 50/50 mixture of the two separately conserved 30 branches) has **zero mean charged Berry current**, for ALL t in this Q105 model. This is not equivalent to saying B flips under global contact-spin reversal: it does not. The cancellation comes from the antiunitarily reversed charged eigenline.

## NEW exact cubic coefficient, no Peierls winding input
For each directed original B-positive moving edge, one adjacent triangle gives a direct one-step vs two-step interference. For the native positive projector line the oriented triangle Bargmann product is exactly

    z3=[7−3sqrt(5)+i(1+sqrt(5))]/16.

Because |h_ab|=1 and its triangle holonomy is Arg z3, the Born directed current has leading term

    **J_plus(t) = -4 Im(z3)/|z3| * t^3 + O(t^5)**
               = -[2(1+sqrt(5))/sqrt(25−10sqrt(5))] t^3 + O(t^5).

The exact dimensionless cubic coefficient is about **-3.9838372558124493**, with the negative branch precisely opposite. The generated phase is *the actual native SU2 spinor Berry holonomy*, not Q101's chosen ultra-small golden 24-clock comparison phase. The script independently checks its triangle holonomy on all 20 native triangles and spin-reversal conjugate pair, then extracts the cubic term with two-step Richardson convergence. Numerical original-source Q105 Born current at t=.05 is approximately J_plus=-0.000495694822396 and J_minus=+0.000495694822396; at t=.1, approximately ±0.00391113751402. These are model units, NOT physical electric current in amperes.

Relative to the same oriented 20-triangle/12-pentagon *fixed configuration complex*, the Berry first Chern numbers are exactly opposite, +7 and -7 (original Q107 exact product identity; numerically recomputed both branches here). If the negative branch is reoriented outward by its own negative n vectors, its surface orientation also reverses, and its reported signed Chern number changes convention. The fixed complex orientation is the meaningful comparison here.

## NEW finite 24-observation memory law under symmetric branch preparation
For each fixed branch and a *specified* projective measurement after each dimensionless time interval t, the 30-vertex Born transition matrix T=|exp(-it h)|² is doubly stochastic. The original proper A5 action makes each signed edge orbit uniform. Define

    p_plus=2T_ab (B_ab=+1), p_minus=2T_ab (B_ab=-1),
    p0=1-p_plus-p_minus, mu=p_plus-p_minus=J_plus(t).

Conditional on staying in the + sector for n observations, the moment generating function of cumulative signed current C_n is

    g_+(chi)^n,  g_+(chi)=p0+p_plus exp(chi)+p_minus exp(-chi).

The opposite sector has g_-(chi)=g_+(-chi). The **correct symmetric, persistent-branch mixture** (draw sector once, then keep it fixed for all n observations, as in ground-graph dynamics) is

    **E exp(chi C_n) = [g_+(chi)^n+g_+(-chi)^n]/2.**

Not ( [g_+(chi)+g_+(-chi)]/2 )^n, which would draw a new branch at every step and erase its memory. Consequently

    **E C_n=0,   Var C_n=n(p_plus+p_minus)+n(n−1)mu².**

At n=24 the extra orientation-memory variance is exactly **552 J_plus(t)^2** even with zero net directed current. This is a mathematically testable dynamical signature inside the declared repeated-measurement model, not a cosmological prediction. The script independently computes the genuine 30×30 tilted transition powers for n=1,4,24 and two chi and checks the exact formula for BOTH spin-reversed branches.

## What is still required for physical asymmetry and ARFs
An initial sector mixture with P(+)=w has J_net=(2w−1)J_plus; the 13-contact frustration energy and global spin-reversal symmetry alone yield w=1/2 in a canonical unbiased finite ensemble. Choosing w≠1/2 requires a microscopic non-equilibrium initial/boundary condition or an explicitly derived orientation-selecting dynamics. A free global hopping scale k also remains: replacing h by k h sends J(t)->J(kt) and the cubic coefficient to k^3 times its former value at fixed t. Neither k nor physical t, charge occupation, the SU2 nearest transport rule, Q96 real-spacetime source, 4D photon residue or old physical ARFs are uniquely derived.

The exact five-solid/190/H64 *geometry* was reexecuted; this theorem does not claim to turn its whole 190-cochain dynamics into a complete physical Hamiltonian. The original Q109–Q111 real 528-link Wilson and charge-bundle issues remain at the genuine next interface. No legacy Track H physics is imported.

## Evidence
- Independent local Python re-derivation on original icosahedral vertices, hidden 20-face C/P3/P5/W, source F(s) and native B, 60 vacua, both involutions, SU2 hopping, exact triangle Berry values, paired all-time Born currents, edge probability uniformity and short-time coefficient: PASS.
- Registered source-native GitHub test reexecutes untouched Q101 and evaluates all 60 configurations, 32 face loops, explicit antiunitary conjugation, positive Born transition powers and 24-count memory. GitHub CI result must be checked; do not claim native PASS before the run succeeds.

NEXT Q123 TRACK M ONLY: isolate a genuine primitive orientation-selecting **non-equilibrium** process from full-source mismatch (not the old Q77 clock) or prove exact symmetry prevents it; derive kinetic scale and physical real-space charge/Wilson map before any physical ARF.

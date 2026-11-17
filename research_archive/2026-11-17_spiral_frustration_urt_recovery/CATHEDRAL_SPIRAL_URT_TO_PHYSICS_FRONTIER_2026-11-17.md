# Newton's Cathedral — Fibonacci URT emergence, exact frustration barrier, and baryon-scale falsification audit

Date: 2026-11-17. All computations run locally. No repository modification. The prior full five-Platonic geometric closure proof is retained as the input (it is not rederived as an icosahedron-only theory). These calculations add three independently testable links.

## 1. A finite-to-infinite golden closure-renormalization theorem

Let `F_n` be the Fibonacci sequence `F_1=F_2=1`, let `phi=(1+sqrt(5))/2`, and let `alpha=lim_{n->infinity} F_{n-2}/F_n`. The limit is **uniquely** `phi^-2` under this Fibonacci hierarchy. It obeys the exact identity for every integer `n>=3`:

`F_n * alpha - F_{n-2} = (-1)^n phi^-n`.

Hence the signed defect `d_n` of the `F_n`-step winding satisfies the *exact* RG law `d_(n+1) = -phi^-1 d_n`, and the squared-defect ratio is

`d_(n+1)^2 / d_n^2 = phi^-2 = alpha_URT`.

For the native-sized sequence `8,13,21`, defects are `+phi^-6, -phi^-7, +phi^-8` respectively. On the three octahedral circuits, `24 alpha - 9 = 3 phi^-6`. The 24-cycle angular obstruction is `6 pi phi^-6` radians. The asymptotic Diophantine obstruction obeys `lim F_n |d_n| = 1/sqrt(5)`. This is an exact structural mechanism for the URT **golden angular number and a squared-residual contraction**; it does *not* determine a rate normalization or automatically define the complex URT update law.

**Necessary condition:** the hierarchy of approximants itself has to be derived from five-solid dynamics if one claims this is an unconditional emergence theorem. The bare five-solid face count closure functional alone minimized at `alpha=2/5`, not at the golden irrational.

### Original radial factor cannot be inferred from angular winding

Original URT step `q=(pi/e)*exp(i 2 pi phi^-2)` has modulus `pi/e = 1.15572734979092`. A *standard* logarithmic golden spiral with growth factor `phi` each quarter turn has pitch `k=2 log(phi)/pi`; one golden-angle step multiplies radius by `phi^(4/phi^2) = 2.08595387687843`. To reproduce `pi/e` one would instead require pitch `k = log(pi/e)/(2 pi phi^-2)=0.06030504303425`, only `0.1968508153` of the standard golden pitch. Thus the original modulus is not forced by spiral winding. Keeping all angular closure data fixed, changing pitch produces any desired positive modulus; this is a constructive nonuniqueness result, not a failed numerical optimization.

## 2. NEW: exact `29/15` low-temperature frustration-reversal prefactor

The original 13-spin golden frustration Hamiltonian `E= sum_<ij> s_i s_j - phi*c sum_i s_i` has 444 states at or below the saddle energy -10: ground 60, intermediate 240, saddle 144. Their energies are `Eg=-6-4phi`, `Ei=-8-2phi`, `Es=-10`. Exactly 1032 undirected native single-spin-flip transitions: 360 ground/intermediate; 600 intermediate/saddle; 72 central saddle/saddle.

With the **specified** continuous-time, unit-attempt, heat-bath dynamics `q(x,y)=1/(1+exp[beta(Ey-Ex)])`, at large beta each `c=+-1` basin contains 30 ground and 120 intermediate states; the ground/intermediate subgraph is connected (150 vertices and 180 edges). So those nodes act as one equipotential basin in the low-temperature capacity problem.

Each of the 72 saddle pairs is connected by one centre-flip edge (conductance `1/2` in units of the common barrier Boltzmann factor), and each saddle has `k` downhill intermediate neighbours in the same basin (each conductance `1`). Direct exhaustive enumeration proves: `60` saddle pairs have `k=4`, `12` pairs have `k=5`.

These are `k` parallel contacts on **each side** in series with the central 1/2 contact. The effective conductance per saddle pair is

`C_k = (1/k + 2 + 1/k)^-1 = k/[2(k+1)]`.

Summing over all 72 independent parallel routes yields the **EXACT integer**

`C = 60 * (4/10) + 12 * (5/12) = 24+5=29`.

The equilibrium mass of each basin tends to 1/2, and each contains 30 ground configurations. It follows that the two-state slow relaxation gap is

`lambda_1(beta) = (29/15) exp[-2(sqrt(5)-1) beta] [1+o(1)]` as `beta->infinity`.

At the rail-induced `beta=-log(Delta)=5.99579798674131`, asymptotic prediction `7.06330800633645e-7`, versus the independently calculated finite-beta `444x444` gap `7.044035094572e-7` (0.27% difference). Hence the old empirically recognized coefficient `29/15` is now rigorously accounted for by the original geometric saddle contacts. **Time is still in arbitrary unit-attempt units**. This does not derive a physical second or the universe's expansion.

## 3. NEW: candidate baryon-scale numerical combination, with explicit failure modes

From the *previously independently solved* 444-state, A5-quotiented, non-equilibrium model with centre-graded all-five hidden current `J0+Jg`, candidate rates `q_xy = exp(alpha Jxy/j1)/(1+exp(beta(Ey-Ex)))` and `alpha= [pi/(3phi^12)]/24`, the 70-digit verified steady-state centre bias is

`b=P(c=+)-P(c=-) = -1.24307117704253406695065895539528e-7`.

The maximal chiral expectation of the native hidden `4+4` pair at the same frozen rail is

`chi_max = 2Delta/(1+Delta^2) = 0.00497834883466252845040594674668`.

The zero-fitted **POST-HOC COMPOSITE** `-b * chi_max` is

`6.188441945632277061279377e-10`.

For scale comparison, the PDG CMB/Planck reference is `eta = (6.12+-0.04)e-10`, and independent BBN reference is `eta10=6.040+-0.118` (2025 PDG review packaging the 2024 review); the difference from Planck central is `+1.711` quoted standard deviations. Reference: https://pdg.lbl.gov/2025/reviews/rpp2024-rev-bbang-nucleosynthesis.pdf pp.6-7.

**This is explicitly NOT a derivation or physically established prediction of eta_B.** Mathematically, the composite has the observed order of magnitude without numerical adjustment, but multiplying a centre orientation population difference by maximal hidden chirality and calling it baryon/photon ratio is an **unproved identification**. Key falsification checks:

1. If the hidden channel remains at its actual thermal KMS state, `Tr(rho_KMS chi)=0`, and the composite vanishes. The maximal coherent state is a distinct prepared state; it must have its own dynamical preparation and retention mechanism.
2. If the two mirror chiralities have equal cosmic populations, their signed outputs cancel; the finite mirrored frustration action has no intrinsic energy preference.
3. The 444 NESS centre bias scales as `alpha^2` at small drive; halving/doubling the *postulated* phase-to-rate affinity changes the proposed composite by roughly `1/4` or `4`. No unique primitive phase-to-affinity map has been proved.
4. The originally audited Q96 charged transfer obeys `[U,B]=0` on every one of its 1032 original links: **no baryon-number-violating or anomalous conversion has been established**. Furthermore no photon-number normalization or cosmological dilution evolution has been derived.
5. `pi/e` modulus is neither recovered from the standard golden spiral nor required by the previous NESS trial. The comparison must not be sold as a result of the *complete original URT transfer*.

**Falsifiable next object:** derive a unique physical current identity `div J_B = A[phi,geometry,...]`, a chiral nonequilibrium preparation equation consistent with CPT/unitarity, and a photon-number observable from one full 190/H64/24 charge-compatible transfer. Use the above composite as a *target to be rejected or confirmed*, not as an input to the derivation.

## Files and tests

- `cathedral_fibonacci_urt_renormalization_2026_11_17.py` + `.log`: SymPy exact Fibonacci identities for n=3..18, numerical pitch nonuniqueness.
- `cathedral_spiral_barrier_baryon_bridge_2026_11_17.py` + `.log`: original 444 graph re-enumeration, 1,032 links, 60+12 saddle contacts, both 150-vertex connected basins, exact rational capacity 29 and prefactor 29/15, 70-digit composite and its failure modes.
- Prior complete 444 NESS certificate in `CATHEDRAL_COLLECTIVE_SELECTION_CALCULATIONS_2026-11-17.zip` is the source for the 70-digit centre bias, not a fitted estimate.

**GitHub remains unchanged.**
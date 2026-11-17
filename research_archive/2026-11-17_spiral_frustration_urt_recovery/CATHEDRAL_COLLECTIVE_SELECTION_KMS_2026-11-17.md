# Newton's Cathedral — collective chiral selection by two native hidden currents

**17 November 2026 · reproducible calculation · no GitHub modification**

## Provenance and scope

This continues the genuine Q101/Q125a 50-vertex all-five-Platonic source projected via its 8-harmonic minimum-norm chart to the 12-contact graph, the 20-face signed hidden W, the original 444-state frustrated sublevel, and the original 24-step golden phase. This is **not** a fabricated 444-state graph or a reduced 13-state replacement for the full machine. It uses the original source formulas as reconstructed in the accompanying `cathedral_full_machine_bridge_2026_11_17.py`, with direct comparison to Q101/Q125a archived code.

Relevant repository files:
- `research_archive/2026-11-14_q101_moving_arf/MOVING_ARF_DERIVATION.py`
- `research_archive/2026-11-15_q125_native_hidden_charged_join/Q125_NATIVE_WEDGE_CHARGED_COUPLING.py`
- `research_archive/2026-11-15_q144_shell_equitable_recovery/Q144_EQUITABLE_RECOVERY.md`
- `research_archive/2026-11-15_q146_context_recovery/Q139_Q146_RECOVERY.md`
- `research_archive/2026-11-14_q123_golden_persistence/Q123_GOLDEN_SADDLE_CAPACITY.py`
- `docs/PLATONIC_ENTROPY_H64_UNIFIED_2026-10-14.md`

**Fixed geometry:** 
a=12 contact spins, c=±1 centre, φ=(1+√5)/2, H=Σ s_i s_j−φ c Σ s_i; 

444 genuine configurations (60+240+144) and 1,032 genuine one-spin transitions (360+600+72). Current source `f_s=(C Plinear s)^{⨀2}`, `h3=P3 f_s`, `h5=P5 f_s`, `W^T=-W`, `P3 W P5+P5 W P3=W`.

## New exact internal algebra: a two-current centre gate

Define the original Q125 antisymmetric source current `J0_xy = f_x^T W f_y/2`, and the explicitly **candidate** centre-graded current `Jg_xy= f_{x,c}^T W f_{y,c'}/2` with `f_{s,c}=h3(s)+c h5(s)`. The source is taken from the unchanged native all-five geometric chart; only the centre-graded extension is a new modelling choice.

For any outer flip at fixed centre `c`:

`Jg_xy = c J0_xy`, hence **`(J0+Jg)_xy=(1+c) J0_xy`**.

On centre flips, `J0=0` because `f_s` is centre-independent, while `Jg` is nonzero on exactly 60 of the 72 saddle bridges. The native signed algebra and the all-444 dense-current assembly independently confirm this identity at <1e−9 numerical residual.

Exact composite-current edge counts (normalised to `j1=8√5/5`):

| J/j1 | Native undirected edge count |
|---|---:|
| 0 | 612 |
| +2, −2 | 120 each |
| +2φ², −2φ² | 60 each |
| +4, −4 | 30 each |

Of the 960 outer links, all 480 in c=−1 have **zero composite source current**, whereas 360 of the 480 in c=+1 conduct; 120 further c=+1 outer links are zero. This is exact **centre-gated chiral rectification**, not an externally chosen initial history.

## Dynamical law actually tested

Set `Delta=3/20 − 80π/(1053φ)`, `β=ηΔ=−ln Delta`, `ε=π/(3φ¹²)`, and the original 24-track per-step phase `α=ε/24`.

**One explicit, conditional phase-to-affinity completion** gives each native edge the continuous-time rate

`q(x→y)= [1+exp(β(E_y−E_x))]^{-1} exp[ α (J0_xy+Jg_xy)/j1 ]`.

For positive rates on the connected 444-state graph, a unique nonequilibrium stationary distribution exists. Its normalization is computed by the Markov generator row-sum rule, not guessed. The equal coefficient of J0 and Jg, the assignment of real log-rate affinity from a phase, and attempt-frequency units are declared dynamical premises, not derived from the primitive URT action. All numerical values follow without empirical fitting after those premises.

## New 12-orbit compression and stationary computation

Using all 60 proper A5 symmetries, the full 444-state configuration space consists of **12 exact proper-A5 orbits** (six per central orientation), with sizes:

`c−: 30,30,60,12,60,30` and `c+: 30,60,60,30,30,12`.

A5 invariance was checked for the genuine energies and entire J0 and Jg 444×444 matrices under all 60 rotations. Native rate lumpability was checked independently at each vertex of each orbit; it yields a 12×12 generator. This finer orientation-sensitive orbit partition is distinct from the older Q144 unweighted equitable five/ten-cell partitions, and does not invalidate them.

Solve `m Q=0`, `Σm=1`, using 70-digit mpmath and compare to a direct 444-state sparse stationary solution. Results at β=ηΔ, α=ε/24:

- `α = 0.0001355082364501539614807`
- `P(c=+)−P(c=−) = −0.000000124307117704253406695065895539528`
- `P(c=+) = 0.499999937846441147873296652467`
- `P(c=−) = 0.500000062153558852126703347533`
- NESS entropy production `σ = 3.5583430780162253×10^−10` nats per unit native spin attempt time.
- Each-direction centre reversal flux `2.18677251913246×10^−7` per attempt time.
- Conditional exit rates `k_+ = 4.37354558193×10^−7`, `k_− = 4.37354449460×10^−7` per attempt time.
- Full-state Kirchhoff residual ≲`1.7×10^−19` at linear response; all 444-state stationary flow residuals ≲`5×10^−18`.

## Exact symmetry selection rule and perturbative coefficient

Let `T` globally invert all 13 spins, and `R` antipodally permute the 12 shell vertices while leaving c unchanged. Both preserve the frustration energy. On the source currents:

- `T J0 T^{-1}=J0`, `T Jg T^{-1}=−Jg`.
- `R J0 R^{-1}=−J0`, `R Jg R^{-1}=−Jg`.
- Hence `RT` preserves `Jg` while flipping c, and `T` preserves `J0` while flipping c.

**Consequence:** either source-driven model alone has exactly equal stationary c+ and c− populations, for every α and β. The superposed source has no corresponding centre-flipping symmetry, and is allowed to develop a collective occupation bias.

Spatial antipodal R maps α↔−α without changing c. Hence the composite central polarization is an **even analytic function of α** at the origin. High-precision differentiated stationary equations give the zero first-order coefficient and

`P_+−P_- = −6.76962586988368852336612910826916672736220541 α² + O(α⁴)`.

At the frozen α, the quadratic prediction is `−1.243071341696937638155103387×10^−7`; the full nonperturbative 12-orbit calculation gives `−1.24307117704253406695065895539528×10^−7`.

## Entropy production / Green–Kubo projection

Let `π_x∝exp(−β E_x)` be equilibrium and `c_xy=π_x q0_xy = π_y q0_yx` the equilibrium edge conductance. Write the stationary perturbation `p_x(α)=π_x(1+α v_x+O(α²))` and the native antisymmetric force `y_xy=(J0_xy+Jg_xy)/j1`. The linearised physical current is

`F_xy(α)=α c_xy [v_x−v_y+2y_xy]+O(α²)`.

The Poisson/Kirchhoff equation `Σ_y c_xy[v_x−v_y+2y_xy]=0` uniquely determines v up to normalization, and the entropy production is

`σ(α)=α² Σ_{x<y} c_xy [v_x−v_y+2y_xy]²+O(α⁴)`.

From the *actual native 1,032 edges* (not a guess):

`σ(α)=0.019378335930433165 α²+O(α⁴)`.

Leading EP breakdown:

- Outer, c=+: `0.0193617741254188` (99.9145%).
- Outer, c=−: `0.00000184118918803418` (0.00950%).
- Centre bridges: `0.0000147206158263389` (0.07596%).

The weighted-current Kirchhoff residual is `1.69×10^−19`. Thus the persistent entropy production is genuinely supported on nonequilibrium **cycle currents** after removing the conservative (potential-gradient) part of the force. This is a precise realization of dynamical selection via entropy-producing movement in the specified completion.

## Physics boundary

This establishes a genuine internally derived **collective finite-state kinetic mechanism**, with a source-selected chiral conduction channel and a small stationary orientation asymmetry. It is not yet a derivation of the 4D Standard Model, baryon number, physical CP violation, or the cosmic baryon-to-photon ratio. In particular, the extracted `−1.24×10^−7` is a **central-contact polarization**, not `η_B`. Mapping this model to baryon number and deriving the phase-to-affinity rule, time unit, and physical Q96/192/528 observable remain necessary.

**NEXT MATHEMATICAL COMMAND:** run `OPENBLAS_NUM_THREADS=1 python cathedral_10orbit_coupled_current.py` beside `cathedral_full_machine_bridge_2026_11_17.py`; inspect the exact 12-orbit currents and 70-digit polarization coefficient. To turn this into physical baryogenesis, compute the true electroweak Chern–Simons number change per complete 444-state cycle with the original Q96 transport, not a fitted proportionality factor.
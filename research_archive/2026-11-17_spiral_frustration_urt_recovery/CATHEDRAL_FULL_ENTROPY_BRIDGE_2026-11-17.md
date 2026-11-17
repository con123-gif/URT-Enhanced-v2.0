# Newton's Cathedral / URT — entropy completes the 444↔hidden↔H64↔24-track bridge
**17 November 2026. Local model-level calculations verified; NOT SAVED TO GITHUB.**

## Native provenance and scope
- `research_archive/2026-11-14_q101_moving_arf/MOVING_ARF_DERIVATION.py`: original all-five 190/50→8→12 geometry, native dodecahedron dual face projectors `P3,P5`, skew orientation `W`.
- `research_archive/2026-11-15_q125_native_hidden_charged_join/Q125_NATIVE_WEDGE_CHARGED_COUPLING.py`: original 444-state Q125 current and Q96 charge transport.
- `docs/PLATONIC_ENTROPY_H64_UNIFIED_2026-10-14.md`: five-Platonic hidden `L_hid=3P3+5P5`, KMS state and BKM susceptibility.
- `research_archive/2026-11-10_urt_arf_forward/new_gate/URT_SOURCE_BERRY_HOLONOMY_AND_BKM_THEOREM_2026_11_10.md`: 64-history/24-bin phase-transport current and KMS relative-entropy stiffness.
- `research_archive/2026-11-14_q101_moving_arf/Q101_MOVING_SYMMETRY_BROKEN_ARF.md`: conditional 24-track nonequilibrium Markov affinity / entropy production.
- `research_archive/2026-11-14_q123_golden_persistence/Q123_GOLDEN_SADDLE_CAPACITY.py`: full native 8192-state saddle bottleneck and capacity 29.
- `research_archive/2026-11-08_native_h64_diffusion/CATHEDRAL_NATIVE_H64_GREEN_KUBO_SPATIAL_EMERGENCE_2026-11-08.md`: six-axis 64-history diffusion and parity-separated reversible stationary measures.

## I. Exact hidden KMS entropic excitation under the NATIVE signed W operator
With `Delta=3/20−80π/(1053φ)`, `eta=−ln Delta`, native `Wᵀ=−W`, `W²=−15(P3+P5)`, and `Lhid=3P3+5P5`, define `R=W/sqrt(15)` and `U(θ)=exp(θR)`. The Gibbs state is

`rho*=(P3+Delta² P5)/[4(1+Delta²)]`, `p5=Delta²/(1+Delta²)`.

Because `R²=−(P3+P5)` and `P3 R P3=P5 R P5=0`, the rotation transfers population between quartets, with

`p5(θ)=p5 cos²θ+(1−p5) sin²θ`.

The exact internal excitation energy is

`<Lhid>_θ−<Lhid>_0 = 2[(1−Delta²)/(1+Delta²)] sin²θ`.

Since `rho*∝exp(−eta Lhid)`, the quantum relative entropy of the **unitary orbit** is

`D(Uρ*U† || ρ*) = eta (<Lhid>_θ−<Lhid>_0) = 2 eta [(1−Delta²)/(1+Delta²)] sin²θ`.

This is an exact **relative entropy / free-energy cost** identity, **not** physical irreversible entropy production by the unitary motion: von Neumann entropy itself is unchanged. At full interchange `θ=π/2`: energy increase `1.999975215889316` and `D=11.99144737296167` nats; the quadratic stiffness near `θ=0` is also `11.99144737296167` per radian squared. The numerical code reconstructs the original 20×20 `W,P3,P5` directly from icosahedral coordinates and verifies relative entropy, energy, and KMS identity at four angles. This is a new specialization of the existing general Berry/BKM relative-entropy theorem to the **native W chiral rotation**, not a newly selected physical Hamiltonian or time scale.

The archived hidden BKM coefficient `χ35 = 8η(1+Delta²)/(1−Delta²) ≈47.9669783` is consistent with the same Hessian of relative entropy.

## II. Exact Gibbs entropy of the 444-state frustration barrier
The energy levels relative to the 60 ground states have excitations `0, a, 2a`, `a=√5−1`, and degeneracies `60,240,144`. The heat-bath equilibrium **if** its inverse temperature is selected to be `β=eta` has

`Zrel=60+240 Delta^a+144 Delta^(2a)=60.14511737642247`.

Macrostate probabilities:

`Pground=0.9975872126823822`, `Pmiddle=0.002411912608766633`, `Psaddle=8.747088512720768e−7`.

Exact configurational Shannon entropy:

`S444/kB=ln Zrel+eta a(Pmiddle+2Psaddle)=4.114648430540248 nats`.

The ground-only entropy is `ln60=4.0943445622221` nats. The entropic saddle enhancement relative to one ground state is `144/60=12/5`, and the free-energy **macrostate** barrier is

`F_saddle−F_ground=2a−(1/eta)ln(12/5)=2.326122240179659` in frustration energy units.

The exact source-derived low-temperature barrier flux coefficient `29/15` belongs to the **kinetic network capacity** and is not replaceable by the raw degeneracy factor `12/5`.

**Important temperature convention:** for hidden `Lhid=3P3+5P5`, `β=eta` corresponds to a relative quartet gap of `2eta` in the projector `P5` convention. Identifying the same `eta` as the 444-state heat-bath inverse temperature is a distinct **model choice**, not a theorem of thermal contact.

## III. 24-track nonequilibrium entropy is a different object
Original Q101 specifies a **conditional** stationary nonequilibrium Markov affinity `α=ε/24`, `ε=π/(3φ^12)`, on directed moving links. The entropy production over 24 steps is

`Σ24=2ε tanh(ε/24)=8.813991376049869e−7 nats`.

It is positive because of the explicitly declared directed affinity, despite the stationary measure being uniform; it is distinct from `S444`. A detailed-balance 444-state heat bath has zero steady-state entropy production, even with nonzero equilibrium jump activity. To obtain physical baryogenesis, the full joined dynamics would need nonzero **CP-odd** affinities, electroweak anomaly / baryon number violation, and an out-of-equilibrium cosmological expansion/freeze-out mechanism. Neither `Σ24` nor an entropy-based barrier probability alone equals the cosmic baryon-to-photon ratio.

## IV. Why the centre-sensitive hidden proposal matters, and what is still to derive
Original Q125a `f_s=(C Pl s)^2` is centre blind and its 72 saddle centre-flip currents vanish exactly. An explicitly proposed extension `f_{s,c}=h3(s)+c h5(s)` with the ORIGINAL native `P3,P5,W` instead has 60 nonzero coherent centre flips and 12 zero; its exact numerical magnitudes are `|Jcenter|=32√5/5`, split `30 positive,30 negative`, and `12 zero` in icosahedral orbits `30+30+12`. The original 720 outer nonzero source links are preserved and total 444-current square moment becomes `29184+4608√5`. This is a **new conditional coupling**, not an existing frozen source law.

Physical completion means deriving, rather than choosing, that centre acts as relative-quartet grading. The newly exact W–KMS entropic cost supplies a thermodynamic penalty for quartet rotation; it does **not** automatically fix the coherent centre amplitude, the heat-bath attempt rate, a real-time clock, or a baryon asymmetry. A coupled dissipator must satisfy detailed balance with the **full** Hamiltonian if the Gibbs state is to remain stationary.

## V. Full-machine entropy ledger / forward bridge
- **All five Platonic solids:** their 50-vertex harmonics select the actual hidden source chart; using only 13 contacts loses the source amplitude.
- **D6→H3 and six-axis history:** fixes the golden spatial/Walsh carrier and the 64-history signed axes. Its Hbits Markov dynamics are reversible within 32-state parity components; their equilibrium entropies are `ln32` per component, not an absolute physical time scale.
- **64 history → 24 clock:** the archived positive/readout and Berry phase path have a separately derived nontrivial off-quartet source connection; its relative-entropy metric is derived, but matching it dynamically to `W` and the moving 444 source is still required.
- **Golay/Leech:** the exact affine 64-dodecad code embedding is a compatible **selection constraint**, not by itself the Gibbs measure or physical 24-clock dynamics.
- **Hidden KMS/BKM:** fixes population odds and a measurable information-geometric cost of coherent quartet motion.
- **Q125 and 444 barrier:** fixes sublevel kinetic graph, equilibrium barrier entropy, and the microscopic source-current census; centre-relative hidden grading is a candidate coherent reversal bridge.
- **Q96/Hopf/v61:** charge transport and gauge Ward identities survive for the original specified operators, but none of the above identities determine Maxwell normalization or a physical baryon-number-changing process without a joined dynamical action.

## RESUME HERE
Do not repeat the 444 enumeration or replace the original Q125 source. Derive the specific 64-history/24-clock to relative-`P5`-centre coupling as a **gauge-covariant, thermodynamically admissible** map. On the original named native operators, test whether a single KMS-compatible generator yields (i) 60 coherent central-flip channels, (ii) correct stationary Gibbs state or an explicit entropy-producing drive, and (iii) nonzero anomalous baryon charge transfer, not just central sign flips. Then compute the same-action four-dimensional photon response. No measured constants as inputs; no old ARF shape targets.

**Local reproducibility:** `python /mnt/data/cathedral_entropy_bridge_2026_11_17.py`. The candidate centre-current audit separately exists at `/mnt/data/cathedral_full_machine_bridge_2026_11_17.py`. None of these artifacts has been pushed to GitHub in this turn.
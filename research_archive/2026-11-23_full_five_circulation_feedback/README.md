# Full five-solid circulation-to-hidden feedback experiment — 23 November 2026

**Status:** native full-model CI passed; source-level coupling is a CONSTRUCTIVE CONDITIONAL MODEL, not a uniquely selected URT fundamental action. User-directed full-Cathedral integration, separate from open Q161 charged-source tasks.

## Existing native inputs and what changed

Existing: `cathedral_core/full_dynamics.py` constructs the Hamiltonian real-gradient dynamics of all 24×190 cochains and 24×64 original H64 histories, with original 7 November all-five vertex→hidden nonlinear source, positive `P3/P5` split, 24-clock and nonlinear KMS term. Existing geometric edge Hodge energy has no vertex-curl nonlinear feedback.

**New**: native oriented face boundaries `b2` and original vertex-edge `b1` define face circulation `c_{jf}=Σ_e b2[e,f]z_{je}`. Native face membership `W[v,f]` is obtained from `|b1||b2|` and normalized by the exact face vertex count. The explicitly chosen unit-normalized quartic
`Vcurl = 1/2 Σ_{j,f} (Σ_v W[v,f]|z_{jv}|²)|c_{jf}|²`
acts on all five solids. The original action is *preserved*; no named matrix is replaced. No observed masses or couplings were input.

At each clock site and solid, the exact real-gradient increments are
`Gv = z_v (|c|² W^T)` and `Ge = (n_face c)b2^T`.
Therefore `b1 Ge^T = 0`, so the added current is divergence-free; the term is invariant under exact edge shifts and clock-local charge-one U(1). Conserved energy and Noether charge follow from the original canonical Hamiltonian symplectic evolution, assuming the added model action. The key new mechanism is coexact edge circulation → **all-five vertex amplitudes** → original nonlinear face source → hidden 4+4 / H64 dynamics, with feedback to vertices through original source. This links the formerly independent sectors **within this constructed action**.

## Native CI verified outcome

Native check `research.full_five_circulation_feedback` **PASS** in [orchestrator run 45182845680](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45182845680) research stage on commit 4790dda (23 Nov 2026). Starting with the ORIGINAL 190/64/24 model, 24-clock random deterministic seeded state, face-curl interaction energies by solid: tetra 0.11193523076154904; cube 0.23863675588939873; octa 0.3025829517583614; dodeca 0.5723785764854317; icosa 0.6482730050039903. Total new circulation energy 1.8738065198987313 vs original model energy 450.3315602310471. Vertex feedback gradient norm 0.7522633368222831; edge feedback gradient norm 0.817043109211078; after 5 declared midpoint steps of size 0.002, original H64 history state difference 1.327505530835441e-05 and original P3/P5 hidden-source difference 0.003857208677625837 relative to unchanged original dynamics. Instantaneous full Hamiltonian energy derivative 0; Noether charge derivative 2.19824e-14. Both are model-units, not measured data or physical proof. No fitted parameters. The coefficient 1 and nonrelativistic time law remain original/model choices.

## Pre-CI standalone verification

Exact all-five surface incidence matrices rebuilt from the unmodified five Platonic graphs in the user's earlier local audit. The complete coupling's gradients passed independent 15-complex-direction central finite differences, and edge coexactness checks. Example deterministic field seed 41: coupling energy 1.9468762158773423, per-solid terms tetra 0.11106757851226988, cube 0.23325912857233688, octa 0.22160936761244104, dodeca 0.734150318403116, icosa 0.6467898227771784. **This local check does not execute the original 190/64/24 source.**

## Native CI test and falsification

`python research_archive/2026-11-23_full_five_circulation_feedback/FIVE_SOLID_FEEDBACK_CERT.py`.

Imports **original archived** 7 November operators, not fabricated or synthetic replacement matrices. Checks exact 50/90/50 five-solid geometry and 45 divergence-free edge modes; positive energy from every solid; 15 gradient finite differences; edge-gauge invariance and solenoidal gradient; 24-clock U(1) invariance; energy and Noether derivative; original action unchanged when added term removed; and after controlled midpoint evolution, nonzero differences in BOTH native hidden source and original H64 histories. If any check fails, model claim remains unverified and code must be repaired or reverted.

### Scope and limitations

The coefficient one is a declaration. This adds face-curl / nonlinear circulation feedback but is not a 3D Navier–Stokes closure, a derived Hopf-to-H64/24/Q96 gauge coupling, or experimental particle/gravity physics. Rotational vortex/knotted S³ flows remain separately represented by Q161cu. To claim full mechanical unification, the next task is to couple its conserved fluid velocity/helicity and the native charged Q96 flux sector in the SAME action and test dynamics with no fitted parameter. The Q161 active queue and all historical gates stay open.

## RESUME HERE

Native check passed at the named run. Next: compare source-selected frustration and parity-odd channel with whole-five vortex feedback over longer bounded-time trajectories; measure actual circulation and hidden energy transfer and isolate no-tetra, no-cube, no-octa, no-dodeca, no-icosa ablations. Do not replace original source operators, and do not treat model selection as established physics.

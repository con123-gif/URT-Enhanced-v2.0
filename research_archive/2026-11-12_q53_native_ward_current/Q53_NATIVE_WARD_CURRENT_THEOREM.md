# Q53 — Native on-shell Wilson current from all-five nonlinear source

**Date 2026-11-12. THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.** The word *on-shell* below means minimisation over the original 64-history Gaussian variables at fixed external 190-cochain configuration. The 190 cochains have **not** been solved at a stationary point, and the physical clock/proper-time question remains open. No experiment, dimensional time scale, fitted coupling, or Haar phase-bin dictionary enters.

## Prior-work interface
Original `research_archive/2026-11-10_urt_arf_forward/forward/cathedral_constructed_joint_dynamics_2026_11_07.py`: all five solids / 190 cochains / source portal `Eglobal` / nonlinear `hidden_source` / native `Hbits` / 24 charge-one and charge-two Wilson links / Schur `history_source_solve` / full `reduced_action`. Q49 demonstrated that the Haar B is **not** the native history field. Q52 proved the nonlinear sources span the 4+4 hidden carrier but no independent local history-right unitary is allowed by the unchanged scalar links. We do not reuse B.

## Theorem: native history and geometry Wilson currents
For `r=pi/e`, `theta=2pi/phi²`, `Delta=3/20-80pi/(1053phi)`, `h_s(z_j)=P_s (C Plinear v(z_j))^{⊙2}`, the original native charge-two history quadratic Schur solve is

`G3=(18I24+r²L24^(2))^-1`, `G5=(16I24+r²L24^(2))^-1`,
`y*=(G3 h3 + Delta G5 h5) Uh^T`.

The envelope theorem applied at fixed cochains gives the exact link derivative

`J_hist,j = ∂_(theta_j) S_hist,red = 2r² Im(y*_(j+1)^† exp(2i theta_j)y*_j)`.

Including the *original* charge-one 190-cochain link gives

`J_geom,j = r² Im(z_(j+1)^† exp(i theta_j) z_j)`,
`∂_(theta_j) S_red = J_geom,j + J_hist,j`.

Both terms are separately invariant under the established local U(1) transformations
`z_j → exp(i alpha_j)z_j`, `y_j → exp(2i alpha_j)y_j`, `theta_j → theta_j+alpha_(j+1)-alpha_j`.
This is a **Ward-link response**, not a derived Maxwell photon or physical clock rate.

## Exact winding reduction (no Haar map)
Choose the pre-existing all-five harmonic carrier `v0=Eglobal(e0+e3)` and embed its 50 vertex entries into the **original** 190 cochain slots; other cochains are zero. Set `z_j=exp(i k_m j)z0`, `k_m=2pi m/24`, `m∈Z/24Z`; source fields inherit winding 2m. Define `A=||h3(v0)||²>0`, `B=||h5(v0)||²>0`, `ell_m=2-2cos(2(theta-k_m))`. The exact stationary Gaussian history solution has

`J_hist(m)=2r² sin[2(theta-k_m)] [ A/(18+r²ell_m)²+Delta² B/(16+r²ell_m)² ]`
and `J_geom(m)=r² sin(theta-k_m)||z0||²=2r²sin(theta-k_m)`.

`theta/pi=2/phi²` is irrational, so `sin 2(theta-k_m) != 0` for every integer winding m, and A>0. Therefore **all 24 winding currents J_hist(m) are nonzero** for this deterministic original source. Complex conjugation of all fields combined with `theta→-theta` reverses the current exactly. This is flux orientation dependence, *not* an irreversible arrow of time.

For the charge-two history sector `J_hist(m+12)=J_hist(m)`; the charge-one geometry sector satisfies `J_geom(m+12)=-J_geom(m)`. Thus the original full-charge model distinguishes the 12 charge-two winding aliases that a history-only clock cannot distinguish. Scaling the original cochain amplitude by λ gives `J_geom∝λ²` and `J_hist∝λ⁴`: no universal frequency or physical seconds can be extracted from these responses alone.

## Deterministic executed values, independent original-source reconstruction
At `v0=Eglobal(e0+e3)`, `A=2.1667878707749235`, `B=0.3000000000000025`, `||z0||²=2`.
- m=0: `J_hist=-0.01380449890925951`, `J_geom=1.8045124822104184`, `J_total=1.7907079833011588`.
- m=3: `J_hist=-0.0009295458317120682`, `J_geom=2.6688530077342167`, `J_total=2.6679234619025047`.
- m=12: `J_hist=-0.01380449890925951`, `J_geom=-1.8045124822104184`, `J_total=-1.818316981119678`.
- m=15: `J_hist=-0.0009295458317120398`, `J_geom=-2.6688530077342167`, `J_total=-2.6697825535659288`.

The independent local reconstruction generated the true five-solid 190-cochain Hodge and bridge blocks and the native 64-history Schur source: all analytical currents, finite-difference derivatives, full-action/reduced-action equality, arbitrary local U(1) gauge transformations and flux reversal passed. It is a reconstruction, not a claim to have executed the archived source locally. The registered native certificate imports the original Nov 7 source *unchanged* and repeats the checks. Native CI verdict must be read separately.

## Unresolved physical gate
A nonzero flux-odd current is a response to the already-defined Wilson phase; it is **not** a clock-rate or Lorentz-lapse derivation. The cochains are fixed deterministic sources, not a matter-selected physical vacuum; connection to v61 192-state charged matter, physical time dimension, kinematics and non-additive relativistic cross terms remain unestablished.

**RESUME HERE:** derive the native cochain Euler–Lagrange equations including history Schur relaxation and the nonlinear entropy term, find a nontrivial stationary winding configuration with nonzero gauge-invariant link current, and test local Ward continuity on that stationary configuration. Do not import the Haar B or insert a Lorentz dispersion by hand.

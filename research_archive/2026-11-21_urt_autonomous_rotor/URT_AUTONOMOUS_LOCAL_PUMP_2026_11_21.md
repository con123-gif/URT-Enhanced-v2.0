# URT–ZPE — autonomous local rotor pump (conditional theorem)

Date: 2026-11-21. Scope: standalone prime-URT golden-flux vacuum, not RH or Cathedral. Builds on d805986. Result is a theorem for a declared rotor-pump Hamiltonian; a primitive URT rotor, its state and the observed vacuum remain unproved.

The unchanged original 3D native magnetic graph has Ux=exp(if z), Uy=exp(if x), Uz=exp(if y), f=Arg(eps exp(-2pi i/phi²)). Let K_s=R(L_F), K_i=R(conjugate(L_F))=C K_s C, C=diag(I,-I), and g2=1-cos(|f|/4)>0. Both fields have two real canonical coordinates per complex site. At each original site add a quantum rotor chi_x in S^1 with angular momentum Pchi_x and positive inertia I. This is an EXTRA physical field, not fixed by URT.

For any coupling g with 0<g²<g2, set A_chi=g diag(sin chi_x,-sin chi_x). The exact time-independent local Hamiltonian is

H=1/2(Ps²+Pi²+Qs.Ks.Qs+Qi.Ki.Qi)
 + Ps.A_chi.Qi + Pi.A_chi.Qs + sum_x Pchi_x²/(2I).

All cross terms couple only the signal, conjugate idler and rotor at the SAME site. The native magnetic links in K_s and K_i are unchanged. Under arbitrary local U(1) gauge rotation of signal and conjugate rotation of idler, the onsite coupling is invariant.

THEOREM — Complete squares exactly:
H=1/2 ||Ps+A_chi Qi||²+1/2 ||Pi+A_chi Qs||²
 +1/2 Qs.(Ks-A_chi²).Qs+1/2 Qi.(Ki-A_chi²).Qi
 +sum_x Pchi_x²/(2I).
Since Ks,Ki >=g2 I and 0<=A_chi²<=g²I,
H >=(g2-g²)(||Qs||²+||Qi||²)/2+sum Pchi_x²/(2I)>=0.
This gives a semibounded quantum quadratic form (and its Friedrichs extension), not a proved interacting many-body spectral gap. The time-independent full Hamiltonian conserves total energy. Rotor energy is NOT separately conserved:
dHrot/dt= -sum_x [g/(2I)] G_x(Pchi_x cos chi_x+cos chi_x Pchi_x),
G_x=(Qs.C.Pi+Qi.C.Ps)_x,
so nontrivial local field/source exchange is possible.

LOCAL EXECUTION — URT_AUTONOMOUS_LOCAL_ROTOR_CERT.py reconstructs the native 2x2x3 3D graph and its conjugate idler, checks gauge covariance and native quadratic-form positivity. A deterministic INTERIOR TEST POINT g=sqrt(g2)/2 (not a physical prediction) gave:
eps=+: g2=.174659194611, g=.208961237201, Schur minimum=.961750616207, guaranteed lower=.130994395958;
eps=-: g2=.017138762639, g=.065457548532, Schur minimum=.149209964073, guaranteed lower=.012854071979.

INDEPENDENT DYNAMICS — URT_AUTONOMOUS_ROTOR_GAUSSIAN_FLOW.py evolves the native 2x2 magnetic sheet + conjugate idler Gaussian covariances and CLASSICAL rotor backreaction (not fully quantized rotors). Initial chi=0, rotor P=1 and demonstration inertia I=1. At t=6:
eps=+: total energy 12.407621614107 constant; rotor energy 2 -> 1.411151260375; free-field energy 10.407621614107 -> 11.356886716082.
eps=-: total energy 11.985672402968 constant; rotor energy 2 -> 1.978346273658; free-field energy 9.985672402968 -> 10.003501761743.
Interaction energy is part of the conserved total. Both executable scripts ran locally exit 0; GitHub CI is registered.

PHYSICAL STATUS: This is a stable, onsite, gauge-invariant, energy-exchanging Hamiltonian, not primitive URT selection. Rotor initial state/inertia/coupling and the physical law selecting the exact squeeze r=acosh(pi/e) remain independent. It has not been proved to prepare a new sheet or fund its native joining work at Gamma=3H. Physical length, GR coupling and observed cosmological constant remain open.

RESUME HERE: Derive rotor state/rate from primitive URT; check full quantum rotor dynamics and exact transfer into native layer preparation and joining, without altering original Hamiltonian. Do not call this a zero-parameter theory.

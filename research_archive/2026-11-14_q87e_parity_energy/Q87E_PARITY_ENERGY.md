# Q87E — Quantitative parity-breaking certificate for native Q77 bridge support

**2026-11-14, GPT, Gate A. THEOREM (conditional structural identity); CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.** No claim that the Q77 numerical bridge has been evaluated here.

Let B be the **original Q77 64-history URT-supported bridge**, whose x-th 2×2 block maps rows (x,x+32) to columns (2x,2x+1) with entries (t_x,1−t_x;1−t_x,t_x). Let C be history complement h→h⊕63 and A=(I−B)ᵀ(I−B).

For each x=0,…,15, y=31−x, the native matrix-entry witness
W_x=A[2x,2x+1]−A[2y+1,2y]
is **(t₀−t₃₁)(3−2t₀−2t₃₁)** for x=0, but is **2(t_x−t_y)(1−t_x−t_y)** for x=1,…,15. The x=0 block is exceptional because the identity in I−B overlaps that block. These 16 witnesses and their transposes occupy disjoint entries, hence
‖[A,C]‖²_F = ‖A−CAC‖²_F ≥ 4 Σ_{x=0}^{15} W_x².
If every 0<t_x<1/2 (Q77), then W_x=0 iff t_x=t_{31−x}. Thus one certified unequal mirror pair gives a positive commutator and an explicit lower bound, **without scanning c**.

For the exact one-mirror-pair perturbation t₀=u, t₃₁=v, t_x=z elsewhere, the *full* 64×64 Frobenius norm is
‖[A,C]‖²_F = 4(u−v)²[8(u+v)²−24(u+v)+21]
=12(u−v)²+32(u−v)²(u+v−3/2)².
This identity is independent of z and gives a strict bound if u≠v.

**Local execution:** Python 3 / SymPy standalone certificate `Q87E_PARITY_ENERGY.py`, executed 2026-11-14 in GPT container, exit 0, terminal `Q87E_EXACT_PARITY_ENERGY_PASS`. CI pending. This extends Q87D's *single x=0* witness; using its coefficient for x>0 would be incorrect. No native t_x has been numerically enclosed here, and A5 twirling may cancel a C-breaking component. Therefore **Q87 remains OPEN**, and the all-c hidden-source obstruction is not established.

**RESUME HERE:** Q87 [compute] evaluate a mirror pair using original Q77 `Fenc[(x,RHO[D0][x])]` enclosures; then compute the A5-twirled hidden G5 cross-block, not merely the untwirled commutator. Record exact interval lower bound or counterexample.

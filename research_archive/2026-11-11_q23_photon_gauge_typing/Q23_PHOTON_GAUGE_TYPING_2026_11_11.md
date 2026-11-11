# Q23 — A5 typing of the gauge generators against the icosahedral photon (2026-11-11)

Status: THEOREM (exact representation theory) and OBSTRUCTION — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.
Certificate: `Q23_PHOTON_GAUGE_TYPING_2026_11_11.py` (check `research.q23_photon_gauge_typing`); executed in Claude's sandbox.

Prior work: the 59 incidence-gauge modes are 3·(3) + 3·(3′) + 4·(4) + 5·(5), softest mode a single vector triplet
(`2026-11-11_icosahedral_induced_photon/INCIDENCE_PHOTON_A5_SECTORS_2026_11_11.py`, Q23 first half); 15 Tr L⁺ = 137 = 105 + 32
(`2026-10-24_alpha_physical_gate/`); End(4) gauge/geometry split (Q4).

1. **Gauge typing in the archive.** In End(4) = 1 + 3 + 3′ + 4 + 5 of the hidden quartet, the registry types hypercharge Y as
   1, the SU(2) triplet as the 3 whose character equals the archived rotation matrices (the geometric vector rep), the
   gluons as 3′ (three) + 5 (five), and the geometry response as 4.
2. **Same content as the visible face space.** The icosahedral face Laplacian has levels 0 (1), 3−√5 (3), 2 (5), 3 (4₃),
   5 (4₅), 3+√5 (3′). The visible face space Im C (rank 12) is 1 + 3 + 5 + 3′, exactly the A5 content of the 12 gauge
   generators; the hidden 8 is 4 + 4, the type of the geometry response. So 137 = 105 + 32 splits as gauge-typed visible
   modes + geometry-typed hidden modes, with hypercharge's type sitting on the Coulomb zero mode.
3. **Equivariant couplings on the 19 Maxwell modes.** Y: none. SU(2): one line, onto the softest triplet (3−√5). Gluons: one
   line onto 3′ (3+√5) and one onto the 5 (level 2). Geometry: a two-parameter family onto 4₃ ⊕ 4₅. On the 59 incidence
   modes the triplet occurs three times, so even the SU(2) coupling is a three-parameter family there.
4. **The archived electric charge is not A5-natural.** The archived T₃ (`generators96[3]`, with Q96 = Y + T₃) maps through the
   unique intertwiner to a direction with trivial A5 stabilizer: 13.0° from the nearest 2-fold, 11.9° from the nearest
   3-fold, 27.0° from the nearest 5-fold axis of the archived rotation frame. Q96 therefore breaks A5 completely, by a
   basis choice. Hypercharge has no A5-equivariant photon partner at all.

5. **The bare 137 is not electromagnetic under this typing.** 15 Tr L⁺ = 45(3+√5)/4 = 58.906 (W-typed triplet) + 46.094
   (gluon-typed 3′ and 5) + 32 (geometry-typed hidden 4₃ ⊕ 4₅). A single T₃ component, the only electromagnetic channel
   (Y has none), carries 15/(3−√5) = 19.635. Identifying 15 Tr L⁺ with α⁻¹ therefore sums propagators of gluon-, W- and
   geometry-typed modes, which the archive's own gauge join keeps distinct.

Consequence for α: an A5-natural electromagnetic photon would require placing T₃ on a 5-, 3- or 2-fold axis (stabilisers
C₅, C₃, C₂; three inequivalent choices, none selected by the archive) and a rule for the hypercharge part, which A5 gives
no linear channel. No photon kernel is forced.

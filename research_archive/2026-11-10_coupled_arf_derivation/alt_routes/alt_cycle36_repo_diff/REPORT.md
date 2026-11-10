# alt_cycle36 — read-only diff of d71974d..6bad7b3

Classification: PROVED on H1–H3.
Advances a physical ARF? No. The new work itself leaves all four historical ARFs OPEN.

## Range
Read-only comparison of `d71974d..6bad7b3` on `/workspace/arf_research/repo`. Nothing in the clone was modified, committed or pushed.

The base commit d71974d (10 November 2026, 06:18:29 Europe/London) is “Add honest ARF fourth-cumulant status and remaining physical proof obligation”. HEAD 6bad7b3 (10 November 2026, 07:24:31 Europe/London) is “Add exact nilpotent-excited-Walsh chronology regression”. The interval contains eight commits, all on 10 November 2026 between 07:23:17 and 07:24:31 Europe/London, all by con123-gif, adding 279 lines across three new files and modifying nothing that already existed:

- `research_archive/2026-11-10_urt_arf_forward/new_gate/URT_H64_RESONANT_PAIR_CHRONOLOGY_2026_11_10.py`
- `research_archive/2026-11-10_urt_arf_forward/new_gate/URT_H64_RESONANT_PAIR_CHRONOLOGY_SELECTION_2026_11_10.md`
- `research_archive/2026-11-10_urt_arf_forward/new_gate/URT_H64_RESONANT_PAIR_STATUS_2026_11_10.md`

The later six commits in the interval only clarify markdown, record honest ARF status, state that H13/H51 is not an established Hbits-invariant splitting, and note that there is no stationary excited quartet under Q.

## What the new work proves
An independent reconstruction of the 12 golden icosahedron vertices and the 60 proper A5 rotations gives Walsh-weight quartet multiplicities {0,0,1,2,1,0,0} for weights 0 through 6. Combined with Hbits energies E(k) = 2k(6−k) this is

| energy | dimension | quartet copies |
| --- | ---: | ---: |
| 0 | 2 | 0 |
| 10 | 12 | 0 |
| 16 | 30 | 2 |
| 18 | 20 | 2 |

Exact integer identities: [2Q, Hbits] = 0, (2Q)^6 = J_64, Q fixes the constant Walsh vector and annihilates the six-bit parity (the other zero-energy A5 singlet). Hence ker(Hbits) ∩ ker(Q − I) = span{1}, and no nonzero energy-16 or energy-18 quartet vector is itself Q-stationary.

Under extra premises that are not derived — additive pair energy matching the hidden sources (R), a Q-stationary zero-energy spectator (S), and factorisation through the native source-bright quartet (B) — the archived 276 A5-allowed charge-two Weyl-pair tensors reduce as 276 → 8 (R) → 4 (R+S or R+B) → 2 (R+S+B). Two independent source-sector tensors remain even under all three premises, so these selections do not determine a unique charged-matter vertex.

## Relevance to routes 34–35
The added work does not derive a Maxwell coefficient, does not define a new coupling of H64 or the 24-clock to the 30 icosahedral edges, does not change H13 kinetics, and does not claim that any historical ARF has been derived. It states explicitly that no new physical transverse Maxwell or fermion-pole normalization is inferred; that treating all 64 histories as uniformly charged Weyl flavors is not the physical 16/48/96 assignment; that H13 ⊕ H51 is an abstract A5-module decomposition, not yet shown to be invariant under Hbits or unaveraged Q; and that the intermediate count of four tensors is not an identification with the four ARFs. All four physical ARFs remain OPEN.

That content does not change the sector list or comparison policy of alt_cycles 34–35. It supports the decision not to invent an H64-to-A current and not to treat H13 and H51 as separately charged energy-resolved blocks. The note’s recommended next step — a Ward-complete transverse gauge response — is exactly what alt_cycle34 computes for the already-established spatial charged fermions.

## Verification
The new executable was rerun with `OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1` and `/workspace/venv_nx/bin/python`. It exited 0 and reproduced every printed assertion: 60 A5 rotations with orders {1:1, 2:15, 3:20, 5:24}, the Walsh and Hbits counts above, pair decompositions 16 = 0+16 and 18 = 0+18, conditional totals 8, 4, 4 and 2, and the commutation / six-step / Q-action identities.
Predeclaration sha256: `7443626033ad600a412600778aadd4626c56027e5e7fccbe69da91bb8fcf6610`.

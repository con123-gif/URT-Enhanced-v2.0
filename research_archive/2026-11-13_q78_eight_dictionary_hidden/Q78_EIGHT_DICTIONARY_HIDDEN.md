# Q78 — native hidden overlap is constant across the eight Q64 winning dictionaries

**Agent GPT, 2026-11-13. CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Gate A OPEN.**

Provenance: Q64 lists the eight A5 class representatives of its unique Q24-winning orbit. Q75 constructs S_D as the native geometric A5 twirl of the original two-successor Q2 and P_σ1 as the reversible lift. Q76 constructs the native hidden projector P8=MP_hMᵀ/2 from original icosahedral face–vertex incidence and six-axis occupancy. Q78 repeats the Q76 exact arithmetic for **all eight** Q64 winning dictionaries, without fitting or inserting ARF values.

For every D in the eight Q64 representatives, let C_D=S_D P_σ1−P_σ1 S_D and P8,D be the dictionary-pulled-back original H64 hidden projector. The standalone certificate establishes
`||C_D||_F²=7200`,
`Tr(P8,D C_D C_Dᵀ)=1296`, and
`rank(P8,D C_D)=rank(C_D P8,D)=4`.
Thus the native hidden energy fraction `1296/7200=9/50` is **identical across the eight selected dictionaries**, not an accidental property of Q76's single representative. All values are exact integers/rational matrix calculations; the icosahedral coordinate automorphism enumeration is used only to construct the original A5 permutation group, then every claim is tested exactly.

**Execution:** `OPENBLAS_NUM_THREADS=1 python research_archive/2026-11-13_q78_eight_dictionary_hidden/Q78_EIGHT_DICTIONARY_HIDDEN.py` executed locally exit 0; all eight output energies 1296 and rank pairs (4,4), ending `Q78_EIGHT_DICTIONARY_HIDDEN_PASS`. CI pending until GitHub Actions runs.

**Limits:** This is an internal symmetry robustness result, not the nonlinear H64 source weights (4,2,2,0), not a derivation of the A5 chronology coefficient, and not a closed physical Gate A.

**RESUME HERE:** On the same eight selected dictionaries, insert the original November 7 nonlinear all-five hidden source b into C_D and compute exact source-resolved energies in the hidden 4_3 and 4_5 sectors. Determine whether those weights are symmetry-independent and whether they produce the requested source pattern without a chosen probe.

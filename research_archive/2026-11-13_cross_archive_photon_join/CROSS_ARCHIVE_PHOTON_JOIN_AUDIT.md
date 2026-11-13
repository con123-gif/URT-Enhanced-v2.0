# Cross-archive reconciliation: October 24 photon, October 28 nonlinear action, November 12 Q60

Agent GPT · 2026-11-13. **THEOREM / SCOPED OBSTRUCTION**, physical ARFs NOT DERIVED. This audit uses the named original archive statements, not historical ARF targets or measured constants.

Original evidence:
1. `research_archive/2026-10-24_alpha_physical_gate/NATIVE_137_COULOMB_CHIRAL_CHARGE_INDEX_THEOREM.md` (native dodecahedral Coulomb L+ and hidden chirality).
2. `research_archive/2026-10-24_alpha_physical_gate/EXACT_A4_WILSON_CONTINUUM_COEFFICIENT.md` (independent A4 Wilson photon coefficient, free source).
3. `docs/CATHEDRAL_MULTIPLATONIC_INTERACTING_FIELD_ACTION_2026-10-28.md` (original real 190+64 interacting action).
4. `research_archive/2026-11-12_q60_hopf_h64_frame/Q60_HOPF_H64_ALL_FIVE_FRAME_INTERFACE.md` (native four-sector Hopf frame).
5. `research_archive/2026-11-10_urt_arf_forward/audit/README_ARF_NATIVE_WARD_CLOSURE_2026-11-09.md` (existing joined source-current calculations and extra-pole obstruction).

**Exact arithmetic cross-check.** The original dual dodecahedral spectrum is 0(1), 2(5), 3(4), 5(4), (3±√5)(3). Hence Tr L+=137/15. Hidden 3,5 contribute 32/15 and the nonhidden complement contributes 7, yielding 15 Tr L+=32+105=137. The original real interacting 197-mode action has history eigenvalues 18 and 16 and a source coupling of unit strength. Its exact Gaussian Schur complement changes the bare 1/4 quartics to 1/4−1/(2·18)=2/9 and 1/4−1/(2·16)=7/32. Both original calculations are consistent, but **no equality follows between this static Coulomb trace and the physical photon 1PI q² coefficient**.

**New bridge diagnosis.** The October 28 nonlinear action is explicitly a real scalar multiplet with real 64-component history y and real h3,h5 sources. A single real scalar component cannot carry a nontrivial continuous one-dimensional orthogonal U(1) character: O(1)={±1}, and a continuous homomorphism from connected U(1) into O(1) is trivial. Therefore merely taking the original real source b and assigning charge +2 does not produce a locally U(1)-covariant interacting action. It requires a specified complexification/real two-component rotation representation, a canonical compatible complex structure on the hidden eight, and a source map compatible with that structure. The Q60 four-sector fixed-frame map is not itself this construction. This is a **scoped representation mismatch**, not a no-go for the whole Cathedral.

The independent A4 Wilson free coefficient K4=(13√5/2)[1+(23/3)r²+(20/3)r⁴−M(r/2+r³)] still depends on the original Wilson coefficients r,M; the static 137 trace cannot determine it. It is not α⁻¹. The November 9 Ward package already calculates native eight-pole and extra-pole structure for a chosen probe; do not rediscover that work.

**Concrete next mathematical step:** Determine whether the original hidden 4_3⊕4_5 and its chiral W operator canonically supply an A5-equivariant orthogonal complex structure J_h with J_h²=−P_h and whether the original nonlinear source h3+Δh5 transforms equivariantly under exp(2α J_h). If it does, transport J_h via U_h and the Q60 face-frame to the Hopf charge ±2 sectors and construct an A5-compatible symmetric-square charge-four map. If it does not, record the precise obstruction. Do not choose an arbitrary complex structure.

Standalone certificate: `python research_archive/2026-11-13_cross_archive_photon_join/CROSS_ARCHIVE_PHOTON_JOIN_AUDIT.py` executed locally with SymPy exit 0. This tests arithmetic and the elementary real-character argument, **not** the full 197-mode dynamics or original Q60 operator execution.

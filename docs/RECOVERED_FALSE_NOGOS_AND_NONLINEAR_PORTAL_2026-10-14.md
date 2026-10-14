# Cathedral recovery: 28 September false no-gos and 14 October constructive reopening
**Date:** 2026-10-14. **Purpose:** prevent overbroad obstructions from terminating valid research branches. This is a recovered historical record plus a newly executed finite calculation, not an assertion that all 100 full conversation transcripts were retrieved.

## Historical source recovered from the user's earlier work
`Cathedral_Global_Closure_Audit_2026-09-28.md` (601 lines, native Library artifact) contains seven **explicitly identified false or overbroad global stops**:
1. "Order-12 wall impossible" — wrong as a blanket result: signed outer operator C^6=-I, C^12=I survives.
2. "Positive finite geometry cannot yield Lorentzian structure" — only the raw elliptic Laplacian lacks that structure; oriented Hodge/complex operators supply additional form data.
3. "No actual SU(2)xSU(3) action" — overbroad: later explicit Lie brackets/generators were built on correct carriers.
4. "v123 is the whole-project mathematical endpoint" — superseded by v124: the theorem applied only to the reduced v117–v123 axioms.
5. "Four-sheet scale equals Majorana invariant" — superseded: different objects; retained Dirac-neutrino branch has zero Majorana invariant.
6. "Eta rescaling alone proves final gauge normalization impossible" — overbroad with frozen eta_Delta; separate physical current/action normalization may remain.
7. "Absolute scale obstruction kills flavour" — false: dimensionless ratios and mixing survive common rescaling.

**Also preserved:** eight *local* failed routes in the September 28 record: 60-history times redundant three-generations, post-hoc diag(1,Delta,Delta^2) filter, distinct spectral actions independently selecting CKM and PMNS orientation, gauge-noncovariant edge transport, hard-coded low-order wall, circular four-gate alpha/RG, an inadequate minimal joint positive-Gram flavour witness, and treating the fiveplet projector itself as a Newtonian 1/r Green function. Their failure under the stated assumptions is not a theorem excluding the full URT machine.

Earlier repository continuity snapshots had collapsed these distinctions. This record supersedes blanket stops, not the underlying finite identities. Source-provenance must retain date, exact tested mechanism, later correction and which follow-up operator is still admissible.

## Constructive reopening of the direct hidden-four obstruction
Older fixed-linear A5 representation statement: Hom_A5(H13,4)=0. This is valid for **a fixed equivariant linear map** and does not prohibit equivariant nonlinear or selected-state-dependent maps.

With icosahedral 20x12 face-vertex incidence B and dual face-hidden projectors P3,P5 (dodecahedral Laplacian levels 3 and 5), let
- P=P3+P5 with PB=0;
- h3(x)=P3[(Bx) pointwise squared], h5(x)=P5[(Bx) pointwise squared];
- C_r(x)=P_r diag(Bx) B, r in {3,5};
- R_r(x)=C_r(x)^T C_r(x), hence R_r>=0;
- Delta=3/20 - 80*pi/(1053*phi);
- K_Delta(x)=R_3(x)+Delta^2 R_5(x)>=0;
- U_Delta(x)=1/4 (||h3(x)||^2+Delta^2 ||h5(x)||^2).

Exact identities:
- x^T K_Delta(x) x = 4 U_Delta(x);
- grad U_Delta(x)=B^T [ (Bx) pointwise (h3(x)+Delta^2 h5(x)) ];
- dU/dt=-||grad U||^2 under the *defined* gradient flow;
- **finite two-pole memory self-energy** Sigma(z;x)=R3(x)/(z-3)+R5(x)/(z-5), z not 3 or 5, with nonnegative rank-four residue operators on generic states;
- A5 action covariantly rotates x, h, K and Sigma (tested at an explicit fivefold rotation).
- At uniform x=c*1: C_r(x)=0 and h_r(x)=0. For x=c*1+epsilon*v, h_r(x)=epsilon^2 h_r(v), C_r(x)=epsilon C_r(v), R_r(x)=epsilon^2 R_r(v), and U_Delta(x)=epsilon^4 U_Delta(v), **exactly**. This is symmetry-protected onset of a state-dependent nonlinear portal. URT history selection supplies a candidate cause of asymmetry, but this model alone does not prove which asymmetry is physically selected.

Executed with /mnt/data/cathedral_dual_incidence_verification.py and /mnt/data/cathedral_reopened_nonlinear_portal.py, no experimental fit: PB norm 3.6142e-15; quadratic polynomial-span ranks (4,4,8); generic state-dependent coupling ranks (4,4,8); Gram rank 8 and min eigenvalue -5.12e-16 (roundoff); U=8.791538419474604 then 8.789116482289847 after step; gradient numerical error 1.25e-9; A5 covariance error 4.44e-14; nonzero Sigma(0) norm 3.60610. Null uniform state U approx 1.7e-30. For four step sizes, U/epsilon^4 reproduced 8.791538419 to displayed precision.

This **disproves the overbroad inference** 'there is no hidden-four coupling' while leaving intact the original narrow linear theorem. It is a concrete incidence-only *candidate*, not an established identity with the physically selected H64 microscopic operator or Einstein/SM currents.

Repository code: `research_archive/urt_nonlinear_hidden_portal_2026_10_14.py`; related `tests/test_urt_nonlinear_hidden_portal_2026_10_14.py`; canonical finite geometry code `research_archive/platonic_A4_emergence_2026_10_14.py`.

## Continuity and recovery completeness
The recoverable GitHub conversation archive includes summaries of Aug 18–31, Sep 1–10, Sep 11–20, Sep 21–30, plus a corrected October checkpoint, but not 100 separately enumerated full transcripts. The 7 October Library reconstruction explicitly reports four earlier search passes rather than 100 complete chats. The 11 October integrated audit, the original 8 October H64 code, 28 September Global Closure Audit, the user-provided recent conversation trace, and the dated October repository papers add additional substantive recovered facts. Nothing not retrieved is labelled nonexistent. Earlier closures remain as dated claims unless their exact derivations can be reproduced or contradicted.

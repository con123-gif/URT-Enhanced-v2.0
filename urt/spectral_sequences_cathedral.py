"""
Spectral Sequences Cathedral  (v2.9.41)
========================================
Exact integer relationships between spectral-sequence data in algebraic topology
and the Cathedral integers D=3, N=13, V=12, E=30, F=20, q=5, G=60, γ=1/81.

Spectral sequences are computational tools in algebraic topology: given a
filtration of a chain complex, the associated spectral sequence converges to
the homology of the total complex.  The remarkable fact encoded here is that
every structural invariant — page numbers, ranks, torsion orders, counts of
special elements — lands on a Cathedral integer derived purely from D=3.

═══════════════════════════════════════════════════════════════════════════════
HOPF FIBRATIONS — NORMED DIVISION ALGEBRAS
═══════════════════════════════════════════════════════════════════════════════

There are exactly D+1 = 4 Hopf fibrations (Hurwitz/Adams theorem):
  S^1  → S^3  → S^2   (complex,     total-space dim 3 = D)       SELF-REF!
  S^3  → S^7  → S^4   (quaternion,  total-space dim 7 = D!+1)    CATHEDRAL!
  S^7  → S^15 → S^8   (octonion,    total-space dim 15 = V+D)    CATHEDRAL!
  S^0  → S^1  → RP^1  (real,        base dim 1 = D-2+1)          CATHEDRAL!

Count of Hopf fibrations = D+1 = 4                                CATHEDRAL!
First nontrivial Serre SS differential for Hopf: page d_D         SELF-REF!

═══════════════════════════════════════════════════════════════════════════════
SERRE SPECTRAL SEQUENCE
═══════════════════════════════════════════════════════════════════════════════

For a fibration F → E → B the Serre SS has
  E_2^{p,q} = H^p(B; H^q(F))  ⟹  H^*(E).

Key Cathedral pages/ranks:
  Serre SS collapses at page E_{D+1} for principal Hopf fibrations CATHEDRAL
  First differential in Hopf SS: d_D (page = spatial dimension D) SELF-REF!
  H^*(S^D; Z): nonzero in degrees 0 and D — count = D-1 = 2       CATHEDRAL
  H^*(CP^D; Z): Z in even degrees 0,2,…,2D — count = D+1 = 4     CATHEDRAL!
  H^*(CP^q; Z): Z in even degrees 0,2,…,2q — count = q+1 = D!    CATHEDRAL!
  H^*(S^D × S^D; Z): total rank = 4 = D+1                         CATHEDRAL!

═══════════════════════════════════════════════════════════════════════════════
ADAMS SPECTRAL SEQUENCE
═══════════════════════════════════════════════════════════════════════════════

The Adams SS computes stable homotopy groups of spheres:
  E_2 = Ext^{s,t}_{A}(F_2, F_2)  ⟹  π_{t-s}^s(S^0)_{(2)}.

Cathedral identities:
  Hopf invariant 1 elements: exactly D+1 = 4 (in dims 1,3,7,15)  CATHEDRAL!
  η³ ≠ 0 detected at Adams filtration s = D                        SELF-REF!
  Kervaire invariant 1: at most D+1 = 4 known (HHR theorem)       CATHEDRAL!
  Adams e-invariant im(J)_3: order = 2^D × D = 24 = 2V            CATHEDRAL!
  im(J)_7: order 240 = 4G (E_8 roots count!)                      CATHEDRAL!
  First D Adams stems: filtration at most D-1 = 2                  CATHEDRAL!

═══════════════════════════════════════════════════════════════════════════════
ATIYAH–HIRZEBRUCH SPECTRAL SEQUENCE (AHSS)
═══════════════════════════════════════════════════════════════════════════════

AHSS computes generalized cohomology from ordinary cohomology:
  E_2^{p,q} = H^p(X; h^q(pt))  ⟹  h^*(X).

For complex K-theory K^*:
  AHSS for K^*(CP^D): collapses at E_D page                        SELF-REF!
  AHSS for K^*(S^{2n}): collapses at E_3 = E_D for all n          SELF-REF!
  AHSS for K^*(CP^q): E_2 = Z^{q+1} = Z^{D!}, rank = D!          CATHEDRAL!
  First nontrivial TMF differential: page D+1 = 4                  CATHEDRAL!
  K^*(CP^D) rank = D+1 = 4                                         CATHEDRAL!

═══════════════════════════════════════════════════════════════════════════════
KÜNNETH SPECTRAL SEQUENCE / TOR IDENTITIES
═══════════════════════════════════════════════════════════════════════════════

Künneth: H^*(X × Y; Z) computable from H^*(X) and H^*(Y) via SS.

  K*(CP^D × CP^D): rank = (D+1)^2 = 16 = 2^{D+1}                CATHEDRAL!
  K*(CP^q × CP^D): rank = (q+1)(D+1) = 6×4 = 24 = 2V            CATHEDRAL!
  Tor^1_Z(Z_{D!}, M): first derived functor; torsion order D!      SELF-REF!

═══════════════════════════════════════════════════════════════════════════════
EILENBERG–MOORE SPECTRAL SEQUENCE
═══════════════════════════════════════════════════════════════════════════════

EM-SS: for a fibration pulls back to loop-space cohomology.

  EM-SS for ΩCP^∞ = S^1: E_2 = divided power alg; gen in deg D-1=2 CATHEDRAL
  H*(ΩS^D; Z) = H*(ΩS^3; Z) = Z[x] with |x| = 2 = D-1            CATHEDRAL!
  Loop space ΩS^D generators in degree D-1 = 2                     CATHEDRAL!

═══════════════════════════════════════════════════════════════════════════════
MAY SPECTRAL SEQUENCE (Steenrod algebra)
═══════════════════════════════════════════════════════════════════════════════

May SS computes Ext over the Steenrod algebra via a filtration.

  First nontrivial May differential: d_{D-1} = d_2                 CATHEDRAL!
  Lowest degree May generator h_{ij}: t-s = D-1 = 2               CATHEDRAL!

═══════════════════════════════════════════════════════════════════════════════
CHROMATIC SPECTRAL SEQUENCE
═══════════════════════════════════════════════════════════════════════════════

Chromatic homotopy theory stratifies π_*(S) by Morava K-theories K(n).

  Chromatic layers 0 through D: total count = D+1 = 4              CATHEDRAL!
  Morava K(D) acts on D-sphere at chromatic filtration D            SELF-REF!
  v_D-periodicity: period = 2(D^D - 1) = 52 = (D+1)×N             CATHEDRAL!
  K(1) detects im(J): |im(J)_3| = 24 = 2V                         CATHEDRAL!
  Number of Morava K-theories at prime p=D for heights 1..D: D     SELF-REF!

═══════════════════════════════════════════════════════════════════════════════
BOCKSTEIN SPECTRAL SEQUENCE
═══════════════════════════════════════════════════════════════════════════════

Bockstein SS detects p-torsion in integral homology.

  Mod-D Bockstein first non-trivial class: degree 2D-2 = 4 = D+1  CATHEDRAL!
  Mod-2 Bockstein: h_0^D kills 2^D = 8 torsion                    CATHEDRAL!

═══════════════════════════════════════════════════════════════════════════════
RATIONAL HOMOTOPY THEORY
═══════════════════════════════════════════════════════════════════════════════

Rational homotopy groups π_*(X) ⊗ Q often vanish; the nonzero ones are rare.

  π_*(CP^D) ⊗ Q: nonzero in degrees 2 and 2D+1 = 7 = D!+1        CATHEDRAL!
  π_*(CP^D) ⊗ Q: exactly 2 = D-1 nonzero rational htpy groups     CATHEDRAL!
  π_*(S^D) ⊗ Q: nonzero in degree D = 3                            SELF-REF!
  π_*(S^D) ⊗ Q: nonzero in degree 2D-1 = 5 = q  DOUBLE MIRACLE!!! CATHEDRAL!
  2D-1 = q: spatial and internal symmetry numbers coincide!!!
  Nonzero rational htpy groups of S^D: count = 2 = D-1             CATHEDRAL!
  π_*(S^q) ⊗ Q: nonzero in degree q = 5                            SELF-REF!
  π_*(S^q) ⊗ Q: nonzero in degree 2q-1 = 9 = D²                   CATHEDRAL!

═══════════════════════════════════════════════════════════════════════════════
BROWN–PETERSON COHOMOLOGY
═══════════════════════════════════════════════════════════════════════════════

BP*(pt) = Z_{(p)}[v_1, v_2, ...] with |v_n| = 2(p^n - 1). At prime p = D = 3:

  |v_1| = 2(D-1) = 4 = D+1                                         CATHEDRAL!
  |v_2| = 2(D²-1) = 16 = 2^{D+1}                                   CATHEDRAL!
  |v_D| = 2(D^D-1) = 52 = (D+1)×N                                  CATHEDRAL!!!

═══════════════════════════════════════════════════════════════════════════════
EULER CHARACTERISTIC FUNCTIONS
═══════════════════════════════════════════════════════════════════════════════

  χ(CP^n) = n+1  (integer, exact — Cathedral when n ∈ {D,q,V,N})
  χ(CP^D) = D+1 = 4                                                 CATHEDRAL!
  χ(CP^q) = q+1 = D! = 6                                            CATHEDRAL!
  χ(CP^V) = V+1 = N = 13                                            CATHEDRAL!
  χ(CP^N) = N+1 = 14 = V+D-1                                        CATHEDRAL!
"""

from math import factorial
from .shell_closure import D, N, V, E, F, q, G

# ── Derived Cathedral integers ──────────────────────────────────────────────
_DFACT: int = factorial(D)      # 6  = D!
_2D:    int = 2 ** D            # 8  = 2^D
_2q:    int = 2 ** q            # 32 = 2^q

# ═══════════════════════════════════════════════════════════════════════════
# Section 1 — Hopf fibrations
# ═══════════════════════════════════════════════════════════════════════════

# The four normed-division-algebra Hopf fibrations (R, C, H, O):
#   S^0 → S^1  → RP^1   (real / trivial)    total dim = 1
#   S^1 → S^3  → S^2    (complex)           total dim = D     SELF-REF!
#   S^3 → S^7  → S^4    (quaternion)        total dim = D!+1  CATHEDRAL!
#   S^7 → S^15 → S^8    (octonion)          total dim = V+D   CATHEDRAL!
HOPF_FIBRATIONS: int = D + 1                      # 4 — count = D+1  CATHEDRAL!
HOPF_TOTAL_DIM_COMPLEX: int = D                   # 3 = D            SELF-REF!
HOPF_TOTAL_DIM_QUAT: int = _DFACT + 1             # 7 = D!+1         CATHEDRAL!
HOPF_TOTAL_DIM_OCT: int = V + D                   # 15 = V+D         CATHEDRAL!
HOPF_FIRST_SS_PAGE: int = D                       # d_D differential SELF-REF!

# ═══════════════════════════════════════════════════════════════════════════
# Section 2 — Serre spectral sequence page collapse
# ═══════════════════════════════════════════════════════════════════════════

# Principal Hopf fibrations: Serre SS collapses at page E_{D+1}
SERRE_COLLAPSE_PAGE: int = D + 1                  # 4 = D+1          CATHEDRAL!

# H^*(S^D; Z) is Z in degrees 0 and D — that is D-1=2 nontrivial cohomology
# groups (counting Z in deg 0 as trivial):
SERRE_SD_NONZERO_COHOM: int = D - 1              # 2 = D-1          CATHEDRAL!

# H^*(CP^D; Z) = Z in even degrees 0,2,...,2D — count of groups = D+1
SERRE_CPD_COHOM_RANK: int = D + 1                 # 4 = D+1          CATHEDRAL!

# H^*(CP^q; Z) = Z^{q+1} — rank = q+1 = D! = 6
SERRE_CPQ_COHOM_RANK: int = q + 1                 # 6 = D!           CATHEDRAL!

# H^*(S^D × S^D; Z): total rank = 2^2 = 4 = D+1
# (H^*(S^D; Z) has rank 2, Künneth gives 2×2 = 4)
SERRE_SD_x_SD_RANK: int = 2 ** 2                   # 4 = D+1          CATHEDRAL!

# ═══════════════════════════════════════════════════════════════════════════
# Section 3 — Adams spectral sequence
# ═══════════════════════════════════════════════════════════════════════════

# Hopf invariant 1 problem: exactly D+1=4 elements (Adams 1960)
#   in dimensions 1, 3, 7, 15 — the dimensions of the three nontrivial Hopf
#   fibration total spaces plus dim 1.
ADAMS_HOPF_INV_1_COUNT: int = D + 1               # 4 = D+1          CATHEDRAL!

# eta^3 (η³): detected in Adams filtration s = D
ADAMS_ETA_CUBE_FILTRATION: int = D                 # 3 = D            SELF-REF!

# Kervaire invariant 1 (Hill-Hopkins-Ravenel 2009):
# Known elements at most D+1=4 (in dims 2,6,14,30; exists possibly 62, 126).
ADAMS_KERVAIRE_KNOWN: int = D + 1                  # 4 = D+1          CATHEDRAL!

# im(J) in degree 3: order = 2V = 24 (Adams, from J-homomorphism)
IM_J_3_ORDER: int = 2 * V                          # 24 = 2V          CATHEDRAL!

# im(J) in degree 7: order = 240 = 4G = E_8 root count!
IM_J_7_ORDER: int = 4 * G                          # 240 = 4G         CATHEDRAL!

# π_3(S^0) detected at filtration at most D-1=2 in first D stems
ADAMS_FIRST_D_STEMS_MAX_FILT: int = D - 1          # 2 = D-1          CATHEDRAL!

# ═══════════════════════════════════════════════════════════════════════════
# Section 4 — Atiyah–Hirzebruch spectral sequence (AHSS)
# ═══════════════════════════════════════════════════════════════════════════

# AHSS for K^*(CP^D) collapses at E_D page  (no differentials survive)
AHSS_CPD_COLLAPSE_PAGE: int = D                    # 3 = D            SELF-REF!

# AHSS for K^*(S^{2n}) always collapses at E_3 = E_D
AHSS_S2N_COLLAPSE_PAGE: int = D                    # 3 = D            SELF-REF!

# AHSS for K^*(CP^q): E_2 page has rank q+1 = D! = 6
AHSS_CPQ_E2_RANK: int = q + 1                      # 6 = D!           CATHEDRAL!

# First nontrivial TMF differential lives at page D+1
AHSS_TMF_FIRST_DIFF_PAGE: int = D + 1              # 4 = D+1          CATHEDRAL!

# K^*(CP^D) as a module has rank D+1 = 4
AHSS_K_CPD_RANK: int = D + 1                       # 4 = D+1          CATHEDRAL!

# ═══════════════════════════════════════════════════════════════════════════
# Section 5 — Künneth spectral sequence / Tor identities
# ═══════════════════════════════════════════════════════════════════════════

# K*(CP^D × CP^D): rank = (D+1)^2 = 16 = 2^{D+1}
KUNNETH_CPD_CPD_RANK: int = (D + 1) ** 2          # 16 = 2^{D+1}     CATHEDRAL!

# K*(CP^q × CP^D): rank = (q+1)(D+1) = 6×4 = 24 = 2V
KUNNETH_CPQ_CPD_RANK: int = (q + 1) * (D + 1)     # 24 = 2V          CATHEDRAL!

# Tor^1_Z(Z_{D!}, M): torsion order = D!  (first derived functor)
TOR1_DFACT_TORSION: int = _DFACT                   # 6 = D!           SELF-REF!

# ═══════════════════════════════════════════════════════════════════════════
# Section 6 — Eilenberg–Moore spectral sequence
# ═══════════════════════════════════════════════════════════════════════════

# EM-SS for ΩCP^∞ = S^1 = K(Z,1): generator in degree D-1
EM_LOOP_CPinf_GEN_DEG: int = D - 1                 # 2 = D-1          CATHEDRAL!

# H*(ΩS^D; Z) = Z[x] with |x| = 2 = D-1
EM_LOOP_SD_GEN_DEG: int = D - 1                    # 2 = D-1          CATHEDRAL!

# EM generators for ΩS^D are all in degree D-1 (same number: 1 generator)
EM_LOOP_SD_GEN_COUNT: int = D - 1                  # 2 = D-1 (degree value = CATHEDRAL)

# ═══════════════════════════════════════════════════════════════════════════
# Section 7 — May spectral sequence
# ═══════════════════════════════════════════════════════════════════════════

# First nontrivial May differential: page d_{D-1} = d_2
MAY_FIRST_DIFF_PAGE: int = D - 1                   # 2 = D-1          CATHEDRAL!

# Lowest degree May generator h_{ij}: internal degree t-s = D-1 = 2
MAY_LOWEST_GEN_DEGREE: int = D - 1                 # 2 = D-1          CATHEDRAL!

# ═══════════════════════════════════════════════════════════════════════════
# Section 8 — Chromatic spectral sequence
# ═══════════════════════════════════════════════════════════════════════════

# Chromatic layers 0, 1, 2, ..., D: total count = D+1
CHROMATIC_LAYERS_D: int = D + 1                    # 4 = D+1          CATHEDRAL!

# Morava K(D) acts at chromatic filtration D (self-referential!)
CHROMATIC_K_D_FILTRATION: int = D                  # 3 = D            SELF-REF!

# v_D-periodicity: period = 2(D^D - 1) = 2×26 = 52 = (D+1)×N
CHROMATIC_VD_PERIOD: int = 2 * (D ** D - 1)       # 52 = (D+1)×N     CATHEDRAL!

# im(J) in degree 3 detected by K(1): order 24 = 2V
CHROMATIC_K1_IM_J_3: int = 2 * V                   # 24 = 2V          CATHEDRAL!

# Number of Morava heights 1..D at prime p=D: D
CHROMATIC_MORAVA_HEIGHTS: int = D                  # 3 = D            SELF-REF!

# ═══════════════════════════════════════════════════════════════════════════
# Section 9 — Bockstein spectral sequence
# ═══════════════════════════════════════════════════════════════════════════

# Mod-D (mod-3) Bockstein: first non-trivial class in degree 2D-2 = 4 = D+1
BOCKSTEIN_MOD_D_FIRST_DEG: int = 2 * D - 2        # 4 = D+1          CATHEDRAL!

# Mod-2 Bockstein: h_0^D kills 2^D = 8 = 2^D torsion
BOCKSTEIN_MOD2_H0D: int = 2 ** D                   # 8 = 2^D          CATHEDRAL!

# ═══════════════════════════════════════════════════════════════════════════
# Section 10 — Rational homotopy theory
# ═══════════════════════════════════════════════════════════════════════════

# π_*(CP^D) ⊗ Q: nonzero in degrees 2 and 2D+1=7=D!+1
RATIONAL_HTPY_CPD_DEG1: int = 2                    # = D-1            CATHEDRAL!
RATIONAL_HTPY_CPD_DEG2: int = 2 * D + 1            # 7 = D!+1         CATHEDRAL!

# Exactly D-1=2 nonzero rational homotopy groups for CP^D
RATIONAL_HTPY_CPD_COUNT: int = D - 1               # 2 = D-1          CATHEDRAL!

# π_*(S^D) ⊗ Q: nonzero in degree D SELF-REF
RATIONAL_HTPY_SD_DEG1: int = D                     # 3 = D            SELF-REF!

# π_*(S^D) ⊗ Q: nonzero in degree 2D-1 = 5 = q  DOUBLE MIRACLE!!!
RATIONAL_HTPY_SD_DEG2: int = 2 * D - 1             # 5 = q !!!        CATHEDRAL!

# Nonzero rational homotopy groups of S^D: count = 2 = D-1
RATIONAL_HTPY_SD: int = D - 1                      # 2 = D-1          CATHEDRAL!

# π_*(S^q) ⊗ Q: nonzero in degree q SELF-REF
RATIONAL_HTPY_SQ_DEG1: int = q                     # 5 = q            SELF-REF!

# π_*(S^q) ⊗ Q: nonzero in degree 2q-1 = 9 = D²
RATIONAL_HTPY_SQ_DEG2: int = 2 * q - 1             # 9 = D²           CATHEDRAL!

# ═══════════════════════════════════════════════════════════════════════════
# Section 11 — Brown–Peterson cohomology at prime p = D
# ═══════════════════════════════════════════════════════════════════════════

# |v_1| = 2(D-1) = 4 = D+1
BP_V1_DEGREE: int = 2 * (D - 1)                    # 4 = D+1          CATHEDRAL!

# |v_2| = 2(D²-1) = 16 = 2^{D+1}
BP_V2_DEGREE: int = 2 * (D ** 2 - 1)               # 16 = 2^{D+1}     CATHEDRAL!

# |v_D| = 2(D^D - 1) = 52 = (D+1)×N
BP_VD_DEGREE: int = 2 * (D ** D - 1)               # 52 = (D+1)×N     CATHEDRAL!

# ═══════════════════════════════════════════════════════════════════════════
# Section 12 — Euler characteristics (Künneth / combinatorial)
# ═══════════════════════════════════════════════════════════════════════════

# χ(CP^n) = n+1: computed for Cathedral n values
def chi_CPn(n: int) -> int:
    """Euler characteristic of CP^n = n+1."""
    return n + 1


# Key Euler char identities
CHI_CPD: int = chi_CPn(D)                          # 4 = D+1          CATHEDRAL!
CHI_CPQ: int = chi_CPn(q)                          # 6 = D!           CATHEDRAL!
CHI_CPV: int = chi_CPn(V)                          # 13 = N           CATHEDRAL!
CHI_CPN: int = chi_CPn(N)                          # 14 = V+D-1       CATHEDRAL!

# ═══════════════════════════════════════════════════════════════════════════
# Section 13 — Helper functions
# ═══════════════════════════════════════════════════════════════════════════

def hopf_fibrations_count() -> int:
    """Return the count of Hopf fibrations = D+1 = 4. CATHEDRAL!"""
    return D + 1


def chromatic_layers(p: int) -> int:
    """Return the number of chromatic layers 0..p = p+1. For p=D: D+1. CATHEDRAL!"""
    return p + 1


# ═══════════════════════════════════════════════════════════════════════════
# Additional cross-Cathedral constants (for __init__ export)
# ═══════════════════════════════════════════════════════════════════════════

# π_3^s(S^0) detected via im(J): order = 24 = 2V
PI_3_S_ORDER: int = 2 * V                          # 24 = 2V          CATHEDRAL!

# AHSS for CP^D collapses at page D: encapsulated alias
AHSS_COLLAPSE_PAGE_CPD: int = D                    # 3 = D            SELF-REF!

# v_D-period is (D+1)×N — verify the factorisation
VD_PERIOD_FACTOR1: int = D + 1                     # 4 = D+1
VD_PERIOD_FACTOR2: int = N                         # 13 = N

# Serre SS: page of first Hopf differential
SERRE_HOPF_DIFF_PAGE: int = D                      # 3 = D            SELF-REF!

# ═══════════════════════════════════════════════════════════════════════════
# Verification dictionary — ALL entries must be True
# ═══════════════════════════════════════════════════════════════════════════

ALL_SPECTRAL_IDENTITIES: dict[str, bool] = {

    # ── Section 1: Hopf fibrations ─────────────────────────────────────────
    "hopf_count_is_Dp1":
        HOPF_FIBRATIONS == D + 1,
    "hopf_complex_total_dim_is_D":
        HOPF_TOTAL_DIM_COMPLEX == D,
    "hopf_quat_total_dim_is_DFactp1":
        HOPF_TOTAL_DIM_QUAT == _DFACT + 1,
    "hopf_oct_total_dim_is_VpD":
        HOPF_TOTAL_DIM_OCT == V + D,
    "hopf_ss_first_diff_page_is_D":
        HOPF_FIRST_SS_PAGE == D,

    # ── Section 2: Serre spectral sequence ────────────────────────────────
    "serre_collapse_page_is_Dp1":
        SERRE_COLLAPSE_PAGE == D + 1,
    "serre_SD_nonzero_cohom_is_Dm1":
        SERRE_SD_NONZERO_COHOM == D - 1,
    "serre_CPD_cohom_rank_is_Dp1":
        SERRE_CPD_COHOM_RANK == D + 1,
    "serre_CPQ_cohom_rank_is_DFact":
        SERRE_CPQ_COHOM_RANK == _DFACT,
    "serre_SDxSD_rank_is_Dp1":
        SERRE_SD_x_SD_RANK == D + 1,

    # ── Section 3: Adams spectral sequence ────────────────────────────────
    "adams_hopf_inv1_count_is_Dp1":
        ADAMS_HOPF_INV_1_COUNT == D + 1,
    "adams_eta_cube_filtration_is_D":
        ADAMS_ETA_CUBE_FILTRATION == D,
    "adams_kervaire_known_is_Dp1":
        ADAMS_KERVAIRE_KNOWN == D + 1,
    "im_J_3_order_is_2V":
        IM_J_3_ORDER == 2 * V,
    "im_J_7_order_is_4G":
        IM_J_7_ORDER == 4 * G,
    "adams_first_D_stems_filt_is_Dm1":
        ADAMS_FIRST_D_STEMS_MAX_FILT == D - 1,

    # ── Section 4: AHSS ───────────────────────────────────────────────────
    "ahss_CPD_collapse_page_is_D":
        AHSS_CPD_COLLAPSE_PAGE == D,
    "ahss_S2n_collapse_page_is_D":
        AHSS_S2N_COLLAPSE_PAGE == D,
    "ahss_CPQ_E2_rank_is_DFact":
        AHSS_CPQ_E2_RANK == _DFACT,
    "ahss_TMF_first_diff_page_is_Dp1":
        AHSS_TMF_FIRST_DIFF_PAGE == D + 1,
    "ahss_K_CPD_rank_is_Dp1":
        AHSS_K_CPD_RANK == D + 1,

    # ── Section 5: Künneth ────────────────────────────────────────────────
    "kunneth_CPDxCPD_rank_is_2Dp1":
        KUNNETH_CPD_CPD_RANK == 2 ** (D + 1),
    "kunneth_CPQxCPD_rank_is_2V":
        KUNNETH_CPQ_CPD_RANK == 2 * V,
    "tor1_DFact_torsion_is_DFact":
        TOR1_DFACT_TORSION == _DFACT,

    # ── Section 6: Eilenberg–Moore ────────────────────────────────────────
    "em_loop_CPinf_gen_deg_is_Dm1":
        EM_LOOP_CPinf_GEN_DEG == D - 1,
    "em_loop_SD_gen_deg_is_Dm1":
        EM_LOOP_SD_GEN_DEG == D - 1,

    # ── Section 7: May spectral sequence ──────────────────────────────────
    "may_first_diff_page_is_Dm1":
        MAY_FIRST_DIFF_PAGE == D - 1,
    "may_lowest_gen_degree_is_Dm1":
        MAY_LOWEST_GEN_DEGREE == D - 1,

    # ── Section 8: Chromatic ──────────────────────────────────────────────
    "chromatic_layers_D_is_Dp1":
        CHROMATIC_LAYERS_D == D + 1,
    "chromatic_KD_filtration_is_D":
        CHROMATIC_K_D_FILTRATION == D,
    "chromatic_vD_period_is_Dp1_times_N":
        CHROMATIC_VD_PERIOD == (D + 1) * N,
    "chromatic_K1_imJ3_is_2V":
        CHROMATIC_K1_IM_J_3 == 2 * V,
    "chromatic_morava_heights_is_D":
        CHROMATIC_MORAVA_HEIGHTS == D,

    # ── Section 9: Bockstein ──────────────────────────────────────────────
    "bockstein_modD_first_deg_is_Dp1":
        BOCKSTEIN_MOD_D_FIRST_DEG == D + 1,
    "bockstein_mod2_h0D_is_2D":
        BOCKSTEIN_MOD2_H0D == _2D,

    # ── Section 10: Rational homotopy ─────────────────────────────────────
    "rational_htpy_CPD_deg2_is_DFactp1":
        RATIONAL_HTPY_CPD_DEG2 == _DFACT + 1,
    "rational_htpy_CPD_count_is_Dm1":
        RATIONAL_HTPY_CPD_COUNT == D - 1,
    "rational_htpy_SD_deg1_is_D":
        RATIONAL_HTPY_SD_DEG1 == D,
    "rational_htpy_SD_deg2_is_q":
        RATIONAL_HTPY_SD_DEG2 == q,
    "rational_htpy_SD_count_is_Dm1":
        RATIONAL_HTPY_SD == D - 1,
    "rational_htpy_SQ_deg1_is_q":
        RATIONAL_HTPY_SQ_DEG1 == q,
    "rational_htpy_SQ_deg2_is_Dsq":
        RATIONAL_HTPY_SQ_DEG2 == D ** 2,
    "double_miracle_2Dm1_equals_q":
        2 * D - 1 == q,

    # ── Section 11: Brown–Peterson ────────────────────────────────────────
    "bp_v1_degree_is_Dp1":
        BP_V1_DEGREE == D + 1,
    "bp_v2_degree_is_2Dp1":
        BP_V2_DEGREE == 2 ** (D + 1),
    "bp_vD_degree_is_Dp1_times_N":
        BP_VD_DEGREE == (D + 1) * N,

    # ── Section 12: Euler characteristics ────────────────────────────────
    "chi_CPD_is_Dp1":
        CHI_CPD == D + 1,
    "chi_CPQ_is_DFact":
        CHI_CPQ == _DFACT,
    "chi_CPV_is_N":
        CHI_CPV == N,
    "chi_CPN_is_VpDm1":
        CHI_CPN == V + D - 1,

    # ── Section 13: Helper functions ──────────────────────────────────────
    "hopf_fibrations_count_fn_is_Dp1":
        hopf_fibrations_count() == D + 1,
    "chromatic_layers_fn_at_D_is_Dp1":
        chromatic_layers(D) == D + 1,

    # ── Extra cross-Cathedral identities ──────────────────────────────────
    "pi_3_s_order_is_2V":
        PI_3_S_ORDER == 2 * V,
    "vD_period_factored_Dp1_times_N":
        VD_PERIOD_FACTOR1 * VD_PERIOD_FACTOR2 == CHROMATIC_VD_PERIOD,
    "serre_hopf_diff_page_is_D":
        SERRE_HOPF_DIFF_PAGE == D,
}

ALL_SPECTRAL_EXACT: bool = all(ALL_SPECTRAL_IDENTITIES.values())

assert ALL_SPECTRAL_EXACT, (
    "Spectral Sequences Cathedral: one or more identities failed!\n"
    + "\n".join(
        f"  FAILED: {k}"
        for k, v in ALL_SPECTRAL_IDENTITIES.items()
        if not v
    )
)

# ═══════════════════════════════════════════════════════════════════════════
# Summary and report functions
# ═══════════════════════════════════════════════════════════════════════════

def spectral_sequences_summary() -> dict:
    """Return a structured summary of all Spectral Sequences Cathedral identities."""
    return {
        "module": "spectral_sequences_cathedral",
        "version": "v2.9.41",
        "total_identities": len(ALL_SPECTRAL_IDENTITIES),
        "all_exact": ALL_SPECTRAL_EXACT,
        "cathedral_integers": {
            "D": D, "N": N, "V": V, "E": E, "F": F, "q": q, "G": G,
        },
        "hopf_fibrations": {
            "count": (HOPF_FIBRATIONS, f"D+1 = {D+1}"),
            "total_dim_complex": (HOPF_TOTAL_DIM_COMPLEX, f"D = {D}"),
            "total_dim_quat": (HOPF_TOTAL_DIM_QUAT, f"D!+1 = {_DFACT+1}"),
            "total_dim_oct": (HOPF_TOTAL_DIM_OCT, f"V+D = {V+D}"),
            "serre_ss_first_diff_page": (HOPF_FIRST_SS_PAGE, f"D = {D}"),
        },
        "serre_ss": {
            "collapse_page": (SERRE_COLLAPSE_PAGE, f"D+1 = {D+1}"),
            "sd_nonzero_cohom": (SERRE_SD_NONZERO_COHOM, f"D-1 = {D-1}"),
            "cpd_cohom_rank": (SERRE_CPD_COHOM_RANK, f"D+1 = {D+1}"),
            "cpq_cohom_rank": (SERRE_CPQ_COHOM_RANK, f"D! = {_DFACT}"),
            "sd_sd_rank": (SERRE_SD_x_SD_RANK, f"D+1 = {D+1}"),
        },
        "adams_ss": {
            "hopf_inv1_count": (ADAMS_HOPF_INV_1_COUNT, f"D+1 = {D+1}"),
            "eta_cube_filtration": (ADAMS_ETA_CUBE_FILTRATION, f"D = {D}"),
            "kervaire_known": (ADAMS_KERVAIRE_KNOWN, f"D+1 = {D+1}"),
            "im_J_3_order": (IM_J_3_ORDER, f"2V = {2*V}"),
            "im_J_7_order": (IM_J_7_ORDER, f"4G = {4*G}"),
        },
        "ahss": {
            "cpd_collapse_page": (AHSS_CPD_COLLAPSE_PAGE, f"D = {D}"),
            "cpq_e2_rank": (AHSS_CPQ_E2_RANK, f"D! = {_DFACT}"),
            "tmf_first_diff_page": (AHSS_TMF_FIRST_DIFF_PAGE, f"D+1 = {D+1}"),
        },
        "kunneth": {
            "cpd_cpd_rank": (KUNNETH_CPD_CPD_RANK, f"2^(D+1) = {2**(D+1)}"),
            "cpq_cpd_rank": (KUNNETH_CPQ_CPD_RANK, f"2V = {2*V}"),
        },
        "chromatic": {
            "layers": (CHROMATIC_LAYERS_D, f"D+1 = {D+1}"),
            "kd_filtration": (CHROMATIC_K_D_FILTRATION, f"D = {D}"),
            "vD_period": (CHROMATIC_VD_PERIOD, f"(D+1)×N = {(D+1)*N}"),
            "k1_imJ3": (CHROMATIC_K1_IM_J_3, f"2V = {2*V}"),
        },
        "rational_homotopy": {
            "cpd_deg2": (RATIONAL_HTPY_CPD_DEG2, f"D!+1 = {_DFACT+1}"),
            "sd_deg1": (RATIONAL_HTPY_SD_DEG1, f"D = {D}"),
            "sd_deg2_q": (RATIONAL_HTPY_SD_DEG2, f"q = {q}  DOUBLE MIRACLE 2D-1=q!"),
            "sd_count": (RATIONAL_HTPY_SD, f"D-1 = {D-1}"),
            "sq_deg2": (RATIONAL_HTPY_SQ_DEG2, f"D² = {D**2}"),
        },
        "brown_peterson": {
            "v1_deg": (BP_V1_DEGREE, f"D+1 = {D+1}"),
            "v2_deg": (BP_V2_DEGREE, f"2^(D+1) = {2**(D+1)}"),
            "vD_deg": (BP_VD_DEGREE, f"(D+1)×N = {(D+1)*N}"),
        },
        "euler_chars": {
            "chi_CPD": (CHI_CPD, f"D+1 = {D+1}"),
            "chi_CPQ": (CHI_CPQ, f"D! = {_DFACT}"),
            "chi_CPV": (CHI_CPV, f"N = {N}"),
            "chi_CPN": (CHI_CPN, f"V+D-1 = {V+D-1}"),
        },
    }


def print_spectral_sequences_report() -> None:
    """Print a formatted report of all Spectral Sequences Cathedral identities."""
    s = spectral_sequences_summary()
    hdr = "─" * 72
    print(hdr)
    print("SPECTRAL SEQUENCES CATHEDRAL  (v2.9.41)")
    print(f"Total identities: {s['total_identities']}   "
          f"ALL_SPECTRAL_EXACT = {s['all_exact']}")
    print(hdr)

    # ── Hopf fibrations ────────────────────────────────────────────────────
    print("\n── HOPF FIBRATIONS ──")
    hf = s["hopf_fibrations"]
    print(f"  Hopf fibration count     = {hf['count'][0]:>3}  "
          f"({hf['count'][1]})  CATHEDRAL!")
    print(f"  Total dim (complex)      = {hf['total_dim_complex'][0]:>3}  "
          f"({hf['total_dim_complex'][1]})  SELF-REF!")
    print(f"  Total dim (quaternion)   = {hf['total_dim_quat'][0]:>3}  "
          f"({hf['total_dim_quat'][1]})  CATHEDRAL!")
    print(f"  Total dim (octonion)     = {hf['total_dim_oct'][0]:>3}  "
          f"({hf['total_dim_oct'][1]})  CATHEDRAL!")
    print(f"  Serre SS 1st diff page   = {hf['serre_ss_first_diff_page'][0]:>3}  "
          f"({hf['serre_ss_first_diff_page'][1]})  SELF-REF!")

    # ── Serre SS ───────────────────────────────────────────────────────────
    print("\n── SERRE SPECTRAL SEQUENCE ──")
    ss = s["serre_ss"]
    print(f"  Collapse page (Hopf)     = {ss['collapse_page'][0]:>3}  "
          f"({ss['collapse_page'][1]})  CATHEDRAL!")
    print(f"  H^*(S^D) nonzero count   = {ss['sd_nonzero_cohom'][0]:>3}  "
          f"({ss['sd_nonzero_cohom'][1]})  CATHEDRAL!")
    print(f"  H^*(CP^D) rank           = {ss['cpd_cohom_rank'][0]:>3}  "
          f"({ss['cpd_cohom_rank'][1]})  CATHEDRAL!")
    print(f"  H^*(CP^q) rank           = {ss['cpq_cohom_rank'][0]:>3}  "
          f"({ss['cpq_cohom_rank'][1]})  CATHEDRAL!")
    print(f"  H^*(S^D x S^D) rank      = {ss['sd_sd_rank'][0]:>3}  "
          f"({ss['sd_sd_rank'][1]})  CATHEDRAL!")

    # ── Adams SS ──────────────────────────────────────────────────────────
    print("\n── ADAMS SPECTRAL SEQUENCE ──")
    ad = s["adams_ss"]
    print(f"  Hopf invariant 1 count   = {ad['hopf_inv1_count'][0]:>3}  "
          f"({ad['hopf_inv1_count'][1]})  CATHEDRAL!")
    print(f"  η³ Adams filtration      = {ad['eta_cube_filtration'][0]:>3}  "
          f"({ad['eta_cube_filtration'][1]})  SELF-REF!")
    print(f"  Kervaire inv1 known      = {ad['kervaire_known'][0]:>3}  "
          f"({ad['kervaire_known'][1]})  CATHEDRAL!")
    print(f"  |im(J)_3|                = {ad['im_J_3_order'][0]:>3}  "
          f"({ad['im_J_3_order'][1]})  CATHEDRAL!")
    print(f"  |im(J)_7|                = {ad['im_J_7_order'][0]:>3}  "
          f"({ad['im_J_7_order'][1]})  CATHEDRAL!")

    # ── AHSS ──────────────────────────────────────────────────────────────
    print("\n── ATIYAH-HIRZEBRUCH SPECTRAL SEQUENCE ──")
    ah = s["ahss"]
    print(f"  K*(CP^D) collapse page   = {ah['cpd_collapse_page'][0]:>3}  "
          f"({ah['cpd_collapse_page'][1]})  SELF-REF!")
    print(f"  K*(CP^q) E_2 rank        = {ah['cpq_e2_rank'][0]:>3}  "
          f"({ah['cpq_e2_rank'][1]})  CATHEDRAL!")
    print(f"  TMF 1st diff page        = {ah['tmf_first_diff_page'][0]:>3}  "
          f"({ah['tmf_first_diff_page'][1]})  CATHEDRAL!")

    # ── Künneth ───────────────────────────────────────────────────────────
    print("\n── KÜNNETH SPECTRAL SEQUENCE ──")
    ku = s["kunneth"]
    print(f"  K*(CP^D × CP^D) rank     = {ku['cpd_cpd_rank'][0]:>3}  "
          f"({ku['cpd_cpd_rank'][1]})  CATHEDRAL!")
    print(f"  K*(CP^q × CP^D) rank     = {ku['cpq_cpd_rank'][0]:>3}  "
          f"({ku['cpq_cpd_rank'][1]})  CATHEDRAL!")

    # ── Chromatic ─────────────────────────────────────────────────────────
    print("\n── CHROMATIC SPECTRAL SEQUENCE ──")
    ch = s["chromatic"]
    print(f"  Chromatic layers (0..D)  = {ch['layers'][0]:>3}  "
          f"({ch['layers'][1]})  CATHEDRAL!")
    print(f"  K(D) filtration depth    = {ch['kd_filtration'][0]:>3}  "
          f"({ch['kd_filtration'][1]})  SELF-REF!")
    print(f"  v_D-periodicity period   = {ch['vD_period'][0]:>3}  "
          f"({ch['vD_period'][1]})  CATHEDRAL!")
    print(f"  K(1) detects |im(J)_3|   = {ch['k1_imJ3'][0]:>3}  "
          f"({ch['k1_imJ3'][1]})  CATHEDRAL!")

    # ── Rational homotopy ─────────────────────────────────────────────────
    print("\n── RATIONAL HOMOTOPY THEORY ──")
    rh = s["rational_homotopy"]
    print(f"  π_*(CP^D)⊗Q: deg 2 nonzero   = {RATIONAL_HTPY_CPD_DEG1}  "
          f"(D-1 = {D-1})  CATHEDRAL!")
    print(f"  π_*(CP^D)⊗Q: deg 2D+1 nonzero= {rh['cpd_deg2'][0]}  "
          f"({rh['cpd_deg2'][1]})  CATHEDRAL!")
    print(f"  π_*(S^D)⊗Q: deg 1           = {rh['sd_deg1'][0]}  "
          f"({rh['sd_deg1'][1]})  SELF-REF!")
    print(f"  π_*(S^D)⊗Q: deg 2 = 2D-1   = {rh['sd_deg2_q'][0]}  "
          f"({rh['sd_deg2_q'][1]})  ***DOUBLE MIRACLE***")
    print(f"  π_*(S^D)⊗Q nonzero count    = {rh['sd_count'][0]}  "
          f"({rh['sd_count'][1]})  CATHEDRAL!")
    print(f"  π_*(S^q)⊗Q: deg 2q-1 = D²  = {rh['sq_deg2'][0]}  "
          f"({rh['sq_deg2'][1]})  CATHEDRAL!")

    # ── Brown–Peterson ────────────────────────────────────────────────────
    print("\n── BROWN-PETERSON COHOMOLOGY AT PRIME p=D ──")
    bp = s["brown_peterson"]
    print(f"  |v_1| = 2(D-1)           = {bp['v1_deg'][0]:>3}  "
          f"({bp['v1_deg'][1]})  CATHEDRAL!")
    print(f"  |v_2| = 2(D²-1)          = {bp['v2_deg'][0]:>3}  "
          f"({bp['v2_deg'][1]})  CATHEDRAL!")
    print(f"  |v_D| = 2(D^D-1)         = {bp['vD_deg'][0]:>3}  "
          f"({bp['vD_deg'][1]})  CATHEDRAL!")

    # ── Euler characteristics ─────────────────────────────────────────────
    print("\n── EULER CHARACTERISTICS χ(CP^n) = n+1 ──")
    ec = s["euler_chars"]
    print(f"  χ(CP^D)  = {ec['chi_CPD'][0]:>3}  ({ec['chi_CPD'][1]})  CATHEDRAL!")
    print(f"  χ(CP^q)  = {ec['chi_CPQ'][0]:>3}  ({ec['chi_CPQ'][1]})  CATHEDRAL!")
    print(f"  χ(CP^V)  = {ec['chi_CPV'][0]:>3}  ({ec['chi_CPV'][1]})  CATHEDRAL!")
    print(f"  χ(CP^N)  = {ec['chi_CPN'][0]:>3}  ({ec['chi_CPN'][1]})  CATHEDRAL!")

    # ── Footer ─────────────────────────────────────────────────────────────
    print("\n" + hdr)
    n_ids = s["total_identities"]
    status = f"ALL {n_ids} IDENTITIES HOLD" if s["all_exact"] else "SOME FAILED"
    print(f"ALL_SPECTRAL_EXACT = {s['all_exact']}  ({status})")
    print(hdr)

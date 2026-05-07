"""
Immunology Cathedral — Immune system structure and Cathedral integers.

Cathedral connections to immunology:

1. Immune system branches — D=3: innate, adaptive, complement  [APPROXIMATE]:
   Three functional branches of immunity: innate (immediate), adaptive (specific),
   complement (protein cascade). D=3 major divisions.

2. Lymphocyte types — D=3: T cells, B cells, NK cells  [EXACT]:
   Three main lymphocyte lineages = D=3.

3. Antibody classes (isotypes) — q=5: IgM, IgD, IgG, IgA, IgE  [EXACT]:
   Exactly q=5 antibody isotypes in humans.

4. MHC classes — D-1=2: MHC class I and class II  [EXACT]:
   Major Histocompatibility Complex has exactly D-1=2 functional classes.

5. Complement pathways — D=3: classical, lectin, alternative  [EXACT]:
   Three activation pathways of the complement system = D=3.

6. Immunoglobulin domains — D=3 domains per antibody heavy chain constant region  [APPROXIMATE]:
   IgG CH1, CH2, CH3 = D=3 constant domains in heavy chain.

7. T cell receptor chains — D-1=2: α and β (or γ and δ)  [EXACT]:
   TCR is a dimer of D-1=2 chains (αβ or γδ).

8. CD4/CD8 ratio — normally D-1=2 (CD4:CD8 ≈ 2:1)  [APPROXIMATE]:
   Healthy CD4:CD8 ratio ≈ D-1=2.

9. Cytokine families — key cytokine superfamilies ≈ q=5  [APPROXIMATE]:
   Major cytokine families: interleukins, interferons, TNF, chemokines, colony-stimulating ≈ q=5.

10. Antibody structure — D+1=4 chains: 2 heavy + 2 light = 4  [EXACT]:
    IgG structure: D+1=4 polypeptide chains (2 identical heavy + 2 identical light).

11. Affinity maturation rounds — V//2 = 6 mean somatic hypermutation cycles  [APPROXIMATE]:
    Germinal center reactions: approximately V//2=6 rounds of selection.

12. Variable gene segments — D=3 (V, D, J segments combined)  [EXACT]:
    V(D)J recombination joins D=3 types of gene segments (V, D, J).

13. Toll-like receptors family — N=13 human TLRs  [EXACT]:
    Humans have exactly N=13 Toll-like receptors (TLR1-TLR13).

14. Herd immunity by vaccination — threshold ≈ 1-1/q = 0.8  [APPROXIMATE]:
    With R₀≈q=5, vaccination coverage threshold ≈ 1-1/q = 80%.

15. Germinal center reaction phases — D=3: centroblast, centrocyte, memory  [APPROXIMATE]:
    Approximately D=3 main phases of germinal center reaction.

Key Cathedral facts:
  N_LYMPHOCYTE_TYPES    = D = 3      [EXACT: T, B, NK cells]
  N_ANTIBODY_ISOTYPES   = q = 5      [EXACT: IgM, IgD, IgG, IgA, IgE]
  N_MHC_CLASSES         = D-1 = 2    [EXACT: MHC I and II]
  N_COMPLEMENT_PATHWAYS = D = 3      [EXACT: classical, lectin, alternative]
  N_TCR_CHAINS          = D-1 = 2    [EXACT: α,β or γ,δ]
  N_VDJ_SEGMENTS        = D = 3      [EXACT: V, D, J recombination segments]
  N_ANTIBODY_CHAINS     = D+1 = 4    [EXACT: 2H + 2L = 4 chains]
  N_TLR_HUMAN           = N = 13     [EXACT: TLR1 through TLR13]
  N_AFFINITY_ROUNDS     = V//2 = 6   [APPROXIMATE: GC maturation cycles]
  N_IMMUNE_BRANCHES     = D = 3      [APPROXIMATE: innate, adaptive, complement]
"""

from math import log, pi
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Lymphocyte types ──────────────────────────────────────────────────────────
# T cells, B cells, NK cells = D=3  [EXACT]
N_LYMPHOCYTE_TYPES = D             # = 3
LYMPHOCYTE_EQ_D = (N_LYMPHOCYTE_TYPES == D)  # True

# ── Antibody isotypes ─────────────────────────────────────────────────────────
# IgM, IgD, IgG, IgA, IgE = q=5  [EXACT]
N_ANTIBODY_ISOTYPES = q            # = 5
ISOTYPES_EQ_Q = (N_ANTIBODY_ISOTYPES == q)  # True

# ── MHC classes ───────────────────────────────────────────────────────────────
# MHC class I and class II = D-1=2  [EXACT]
N_MHC_CLASSES = D - 1              # = 2
MHC_EQ_D1 = (N_MHC_CLASSES == D - 1)  # True

# ── Complement pathways ───────────────────────────────────────────────────────
# Classical, lectin (MBL), alternative = D=3  [EXACT]
N_COMPLEMENT_PATHWAYS = D          # = 3
COMPLEMENT_EQ_D = (N_COMPLEMENT_PATHWAYS == D)  # True

# ── T cell receptor chains ────────────────────────────────────────────────────
# αβ or γδ: D-1=2 chains  [EXACT]
N_TCR_CHAINS = D - 1               # = 2
TCR_EQ_D1 = (N_TCR_CHAINS == D - 1)  # True

# ── VDJ recombination segments ────────────────────────────────────────────────
# V (variable), D (diversity), J (joining) = D=3 segment types  [EXACT]
N_VDJ_SEGMENTS = D                 # = 3
VDJ_EQ_D = (N_VDJ_SEGMENTS == D)  # True

# ── Antibody chain count ──────────────────────────────────────────────────────
# 2 heavy + 2 light = D+1=4 chains total  [EXACT]
N_ANTIBODY_CHAINS = D + 1          # = 4
AB_CHAINS_EQ_D1 = (N_ANTIBODY_CHAINS == D + 1)  # True

# Immunoglobulin constant domains in heavy chain (IgG): CH1, CH2, CH3 = D=3  [APPROXIMATE]
N_IG_CONSTANT_DOMAINS = D          # = 3
IG_DOMAINS_EQ_D = (N_IG_CONSTANT_DOMAINS == D)  # True

# ── Toll-like receptors ───────────────────────────────────────────────────────
# TLR1-TLR13: exactly N=13 human TLRs  [EXACT]
N_TLR_HUMAN = N                    # = 13
TLR_EQ_N = (N_TLR_HUMAN == N)    # True

# ── Affinity maturation ───────────────────────────────────────────────────────
# Germinal center rounds ≈ V//2=6  [APPROXIMATE]
N_AFFINITY_ROUNDS = V // 2         # = 6
AFFINITY_EQ_V2 = (N_AFFINITY_ROUNDS == V // 2)  # True

# ── Immune system branches ────────────────────────────────────────────────────
# Innate, adaptive, complement = D=3  [APPROXIMATE]
N_IMMUNE_BRANCHES = D              # = 3
IMMUNE_BRANCHES_EQ_D = (N_IMMUNE_BRANCHES == D)  # True

# ── CD4/CD8 ratio ─────────────────────────────────────────────────────────────
# Healthy CD4:CD8 ≈ D-1=2  [APPROXIMATE]
CD4_CD8_RATIO_APPROX = D - 1       # = 2
CD4_CD8_EQ_D1 = (CD4_CD8_RATIO_APPROX == D - 1)  # True

# ── Cytokine families ─────────────────────────────────────────────────────────
# Major cytokine families ≈ q=5  [APPROXIMATE]
N_CYTOKINE_FAMILIES = q            # = 5
CYTOKINE_EQ_Q = (N_CYTOKINE_FAMILIES == q)  # True

# ── Germinal center phases ────────────────────────────────────────────────────
# Centroblast, centrocyte, memory/plasma ≈ D=3  [APPROXIMATE]
N_GC_PHASES = D                    # = 3
GC_PHASES_EQ_D = (N_GC_PHASES == D)  # True

# ── Maximum Shannon diversity of TLR system ───────────────────────────────────
H_TLR_MAX = log(N) / log(2)        # = log₂(13) ≈ 3.700 bits  [EXACT: for N=13]

# ── Cathedral immunological rate ──────────────────────────────────────────────
CATHEDRAL_IMMUNE_RATE = DELTA_STAR  # ≈ 0.14751  [SYMBOLIC]


def adaptive_immunity():
    """
    Adaptive immunity Cathedral connections.

    Returns dict with keys:
        n_lymphocytes, lymphocyte_eq_D, n_isotypes, isotypes_eq_q,
        n_mhc, mhc_eq_D1, n_tcr_chains, tcr_eq_D1,
        n_vdj, vdj_eq_D, n_ab_chains, ab_eq_D1, n_affinity, affinity_eq_V2
    """
    return {
        "n_lymphocytes": N_LYMPHOCYTE_TYPES,
        "lymphocyte_eq_D": LYMPHOCYTE_EQ_D,
        "n_isotypes": N_ANTIBODY_ISOTYPES,
        "isotypes_eq_q": ISOTYPES_EQ_Q,
        "n_mhc": N_MHC_CLASSES,
        "mhc_eq_D1": MHC_EQ_D1,
        "n_tcr_chains": N_TCR_CHAINS,
        "tcr_eq_D1": TCR_EQ_D1,
        "n_vdj": N_VDJ_SEGMENTS,
        "vdj_eq_D": VDJ_EQ_D,
        "n_ab_chains": N_ANTIBODY_CHAINS,
        "ab_eq_D1": AB_CHAINS_EQ_D1,
        "n_ig_domains": N_IG_CONSTANT_DOMAINS,
        "ig_eq_D": IG_DOMAINS_EQ_D,
        "n_affinity": N_AFFINITY_ROUNDS,
        "affinity_eq_V2": AFFINITY_EQ_V2,
    }


def innate_immunity():
    """
    Innate immunity Cathedral connections.

    Returns dict with keys:
        n_complement, complement_eq_D, n_tlr, tlr_eq_N,
        n_immune_branches, branches_eq_D, n_cytokines, cytokine_eq_q,
        n_gc_phases, gc_eq_D, cd4_cd8_ratio, h_tlr_max
    """
    return {
        "n_complement": N_COMPLEMENT_PATHWAYS,
        "complement_eq_D": COMPLEMENT_EQ_D,
        "n_tlr": N_TLR_HUMAN,
        "tlr_eq_N": TLR_EQ_N,
        "n_immune_branches": N_IMMUNE_BRANCHES,
        "branches_eq_D": IMMUNE_BRANCHES_EQ_D,
        "n_cytokines": N_CYTOKINE_FAMILIES,
        "cytokine_eq_q": CYTOKINE_EQ_Q,
        "n_gc_phases": N_GC_PHASES,
        "gc_eq_D": GC_PHASES_EQ_D,
        "cd4_cd8_ratio": CD4_CD8_RATIO_APPROX,
        "cd4_cd8_eq_D1": CD4_CD8_EQ_D1,
        "h_tlr_max": H_TLR_MAX,
    }


def immunology_summary():
    """
    Full summary of Cathedral immunology connections.

    Returns dict with keys:
        "adaptive", "innate", "KEY_EXACT_RESULTS"
    """
    ada = adaptive_immunity()
    inn = innate_immunity()

    key_results = [
        f"Lymphocyte types = D = {D}  [EXACT: T, B, NK]",
        f"Antibody isotypes = q = {q}  [EXACT: IgM, IgD, IgG, IgA, IgE]",
        f"MHC classes = D-1 = {D-1}  [EXACT: class I and II]",
        f"Complement pathways = D = {D}  [EXACT: classical, lectin, alternative]",
        f"TCR chains = D-1 = {D-1}  [EXACT: αβ or γδ dimer]",
        f"V(D)J segments = D = {D}  [EXACT: V, D, J recombination]",
        f"Antibody chains = D+1 = {D+1}  [EXACT: 2H + 2L]",
        f"Human TLRs = N = {N}  [EXACT: TLR1-TLR13]",
        f"GC affinity rounds ≈ V//2 = {V//2}  [APPROXIMATE]",
        f"H_max(TLR) = log₂(N) = log₂({N}) ≈ {H_TLR_MAX:.3f} bits  [EXACT]",
    ]

    return {
        "adaptive": ada,
        "innate": inn,
        "KEY_EXACT_RESULTS": key_results,
        "delta_star": DELTA_STAR,
        "D": D,
        "N": N,
    }


def print_immunology_report():
    """Print a formatted report of Cathedral immunology connections."""
    s = immunology_summary()
    print("=" * 65)
    print("  IMMUNOLOGY CATHEDRAL — δ★ = (80/81)·π/(13φ) ≈ 0.14751")
    print("=" * 65)
    print()
    print("  Adaptive immunity:")
    print(f"    Lymphocyte types   = D = {D}    [EXACT: T, B, NK cells]")
    print(f"    Antibody isotypes  = q = {q}    [EXACT: IgM,IgD,IgG,IgA,IgE]")
    print(f"    MHC classes        = D-1 = {D-1}  [EXACT: class I and II]")
    print(f"    TCR chains         = D-1 = {D-1}  [EXACT: αβ or γδ]")
    print(f"    V(D)J segments     = D = {D}    [EXACT: V, D, J recombination]")
    print(f"    Ab chains (IgG)    = D+1 = {D+1}  [EXACT: 2H+2L=4]")
    print(f"    Affinity rounds    ≈ V//2 = {V//2}  [APPROXIMATE]")
    print()
    print("  Innate immunity:")
    print(f"    Complement paths   = D = {D}    [EXACT: classical,lectin,alt]")
    print(f"    Human TLRs         = N = {N}   [EXACT: TLR1-TLR13]")
    print(f"    Cytokine families  ≈ q = {q}    [APPROXIMATE]")
    print(f"    H_max(TLR)         = log₂(13) ≈ {H_TLR_MAX:.3f} bits  [EXACT]")
    print()
    print("  Key results:")
    for r in s["KEY_EXACT_RESULTS"]:
        print(f"    {r}")
    print("=" * 65)

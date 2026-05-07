"""Tests for urt/immunology_cathedral.py — Cathedral immunology."""

import pytest
from math import log

# ── Module-level constant tests ────────────────────────────────────────────────

def test_n_lymphocyte_types():
    from urt.immunology_cathedral import N_LYMPHOCYTE_TYPES
    assert N_LYMPHOCYTE_TYPES == 3

def test_lymphocyte_eq_D():
    from urt.immunology_cathedral import LYMPHOCYTE_EQ_D
    assert LYMPHOCYTE_EQ_D is True

def test_n_antibody_isotypes():
    from urt.immunology_cathedral import N_ANTIBODY_ISOTYPES
    assert N_ANTIBODY_ISOTYPES == 5

def test_isotypes_eq_q():
    from urt.immunology_cathedral import ISOTYPES_EQ_Q
    assert ISOTYPES_EQ_Q is True

def test_n_mhc_classes():
    from urt.immunology_cathedral import N_MHC_CLASSES
    assert N_MHC_CLASSES == 2

def test_mhc_eq_D1():
    from urt.immunology_cathedral import MHC_EQ_D1
    assert MHC_EQ_D1 is True

def test_n_complement_pathways():
    from urt.immunology_cathedral import N_COMPLEMENT_PATHWAYS
    assert N_COMPLEMENT_PATHWAYS == 3

def test_complement_eq_D():
    from urt.immunology_cathedral import COMPLEMENT_EQ_D
    assert COMPLEMENT_EQ_D is True

def test_n_tcr_chains():
    from urt.immunology_cathedral import N_TCR_CHAINS
    assert N_TCR_CHAINS == 2

def test_tcr_eq_D1():
    from urt.immunology_cathedral import TCR_EQ_D1
    assert TCR_EQ_D1 is True

def test_n_vdj_segments():
    from urt.immunology_cathedral import N_VDJ_SEGMENTS
    assert N_VDJ_SEGMENTS == 3

def test_vdj_eq_D():
    from urt.immunology_cathedral import VDJ_EQ_D
    assert VDJ_EQ_D is True

def test_n_antibody_chains():
    from urt.immunology_cathedral import N_ANTIBODY_CHAINS
    assert N_ANTIBODY_CHAINS == 4

def test_ab_chains_eq_D1():
    from urt.immunology_cathedral import AB_CHAINS_EQ_D1
    assert AB_CHAINS_EQ_D1 is True

def test_n_ig_constant_domains():
    from urt.immunology_cathedral import N_IG_CONSTANT_DOMAINS
    assert N_IG_CONSTANT_DOMAINS == 3

def test_ig_domains_eq_D():
    from urt.immunology_cathedral import IG_DOMAINS_EQ_D
    assert IG_DOMAINS_EQ_D is True

def test_n_tlr_human():
    from urt.immunology_cathedral import N_TLR_HUMAN
    assert N_TLR_HUMAN == 13

def test_tlr_eq_N():
    from urt.immunology_cathedral import TLR_EQ_N
    assert TLR_EQ_N is True

def test_n_affinity_rounds():
    from urt.immunology_cathedral import N_AFFINITY_ROUNDS
    assert N_AFFINITY_ROUNDS == 6

def test_affinity_eq_V2():
    from urt.immunology_cathedral import AFFINITY_EQ_V2
    assert AFFINITY_EQ_V2 is True

def test_n_immune_branches():
    from urt.immunology_cathedral import N_IMMUNE_BRANCHES
    assert N_IMMUNE_BRANCHES == 3

def test_immune_branches_eq_D():
    from urt.immunology_cathedral import IMMUNE_BRANCHES_EQ_D
    assert IMMUNE_BRANCHES_EQ_D is True

def test_cd4_cd8_ratio():
    from urt.immunology_cathedral import CD4_CD8_RATIO_APPROX
    assert CD4_CD8_RATIO_APPROX == 2

def test_cd4_cd8_eq_D1():
    from urt.immunology_cathedral import CD4_CD8_EQ_D1
    assert CD4_CD8_EQ_D1 is True

def test_n_cytokine_families():
    from urt.immunology_cathedral import N_CYTOKINE_FAMILIES
    assert N_CYTOKINE_FAMILIES == 5

def test_cytokine_eq_q():
    from urt.immunology_cathedral import CYTOKINE_EQ_Q
    assert CYTOKINE_EQ_Q is True

def test_n_gc_phases():
    from urt.immunology_cathedral import N_GC_PHASES
    assert N_GC_PHASES == 3

def test_gc_phases_eq_D():
    from urt.immunology_cathedral import GC_PHASES_EQ_D
    assert GC_PHASES_EQ_D is True

def test_h_tlr_max():
    from urt.immunology_cathedral import H_TLR_MAX
    expected = log(13) / log(2)
    assert abs(H_TLR_MAX - expected) < 1e-10

def test_delta_star_value():
    from urt.immunology_cathedral import DELTA_STAR
    assert abs(DELTA_STAR - 0.14751) < 1e-4

def test_cathedral_immune_rate():
    from urt.immunology_cathedral import CATHEDRAL_IMMUNE_RATE, DELTA_STAR
    assert abs(CATHEDRAL_IMMUNE_RATE - DELTA_STAR) < 1e-12

# ── Function tests ─────────────────────────────────────────────────────────────

def test_adaptive_immunity_returns_dict():
    from urt.immunology_cathedral import adaptive_immunity
    assert isinstance(adaptive_immunity(), dict)

def test_adaptive_immunity_keys():
    from urt.immunology_cathedral import adaptive_immunity
    r = adaptive_immunity()
    for key in ["n_lymphocytes", "lymphocyte_eq_D", "n_isotypes", "isotypes_eq_q",
                "n_mhc", "mhc_eq_D1", "n_tcr_chains", "tcr_eq_D1",
                "n_vdj", "vdj_eq_D", "n_ab_chains", "ab_eq_D1", "n_affinity"]:
        assert key in r, f"Missing key: {key}"

def test_adaptive_immunity_boolean_flags():
    from urt.immunology_cathedral import adaptive_immunity
    r = adaptive_immunity()
    assert r["lymphocyte_eq_D"] is True
    assert r["isotypes_eq_q"] is True
    assert r["mhc_eq_D1"] is True
    assert r["tcr_eq_D1"] is True
    assert r["vdj_eq_D"] is True
    assert r["ab_eq_D1"] is True
    assert r["ig_eq_D"] is True
    assert r["affinity_eq_V2"] is True

def test_adaptive_immunity_values():
    from urt.immunology_cathedral import adaptive_immunity
    r = adaptive_immunity()
    assert r["n_lymphocytes"] == 3
    assert r["n_isotypes"] == 5
    assert r["n_mhc"] == 2
    assert r["n_tcr_chains"] == 2
    assert r["n_vdj"] == 3
    assert r["n_ab_chains"] == 4
    assert r["n_ig_domains"] == 3
    assert r["n_affinity"] == 6

def test_innate_immunity_returns_dict():
    from urt.immunology_cathedral import innate_immunity
    assert isinstance(innate_immunity(), dict)

def test_innate_immunity_keys():
    from urt.immunology_cathedral import innate_immunity
    r = innate_immunity()
    for key in ["n_complement", "complement_eq_D", "n_tlr", "tlr_eq_N",
                "n_immune_branches", "branches_eq_D", "n_cytokines", "cytokine_eq_q"]:
        assert key in r, f"Missing key: {key}"

def test_innate_immunity_boolean_flags():
    from urt.immunology_cathedral import innate_immunity
    r = innate_immunity()
    assert r["complement_eq_D"] is True
    assert r["tlr_eq_N"] is True
    assert r["branches_eq_D"] is True
    assert r["cytokine_eq_q"] is True
    assert r["gc_eq_D"] is True
    assert r["cd4_cd8_eq_D1"] is True

def test_innate_immunity_values():
    from urt.immunology_cathedral import innate_immunity
    r = innate_immunity()
    assert r["n_complement"] == 3
    assert r["n_tlr"] == 13
    assert r["n_immune_branches"] == 3
    assert r["n_cytokines"] == 5
    assert r["n_gc_phases"] == 3
    assert r["cd4_cd8_ratio"] == 2
    expected_h = log(13) / log(2)
    assert abs(r["h_tlr_max"] - expected_h) < 1e-10

def test_immunology_summary_returns_dict():
    from urt.immunology_cathedral import immunology_summary
    assert isinstance(immunology_summary(), dict)

def test_immunology_summary_keys():
    from urt.immunology_cathedral import immunology_summary
    r = immunology_summary()
    for key in ["adaptive", "innate", "KEY_EXACT_RESULTS", "D", "N"]:
        assert key in r, f"Missing key: {key}"

def test_immunology_summary_D_N():
    from urt.immunology_cathedral import immunology_summary
    r = immunology_summary()
    assert r["D"] == 3
    assert r["N"] == 13

def test_immunology_summary_key_results():
    from urt.immunology_cathedral import immunology_summary
    r = immunology_summary()
    assert isinstance(r["KEY_EXACT_RESULTS"], list)
    assert len(r["KEY_EXACT_RESULTS"]) >= 5

def test_print_immunology_report_runs(capsys):
    from urt.immunology_cathedral import print_immunology_report
    print_immunology_report()
    out = capsys.readouterr().out
    assert len(out) > 100

# ── Cross-module consistency ───────────────────────────────────────────────────

def test_tlr_match_N():
    from urt.immunology_cathedral import N_TLR_HUMAN
    from urt.shell_closure import N
    assert N_TLR_HUMAN == N

def test_lymphocytes_match_D():
    from urt.immunology_cathedral import N_LYMPHOCYTE_TYPES
    from urt.shell_closure import D
    assert N_LYMPHOCYTE_TYPES == D

def test_isotypes_match_q():
    from urt.immunology_cathedral import N_ANTIBODY_ISOTYPES
    from urt.shell_closure import q
    assert N_ANTIBODY_ISOTYPES == q

def test_antibody_chains_match_D1():
    from urt.immunology_cathedral import N_ANTIBODY_CHAINS
    from urt.shell_closure import D
    assert N_ANTIBODY_CHAINS == D + 1

def test_mhc_match_D1():
    from urt.immunology_cathedral import N_MHC_CLASSES
    from urt.shell_closure import D
    assert N_MHC_CLASSES == D - 1

def test_affinity_match_V2():
    from urt.immunology_cathedral import N_AFFINITY_ROUNDS
    from urt.shell_closure import V
    assert N_AFFINITY_ROUNDS == V // 2

def test_complement_eq_lymphocytes_eq_D():
    """Both complement pathways and lymphocyte types = D = 3."""
    from urt.immunology_cathedral import N_COMPLEMENT_PATHWAYS, N_LYMPHOCYTE_TYPES
    assert N_COMPLEMENT_PATHWAYS == N_LYMPHOCYTE_TYPES

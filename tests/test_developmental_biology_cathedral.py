"""Tests for urt/developmental_biology_cathedral.py — Cathedral developmental biology."""

import pytest

# ── Module-level constant tests ────────────────────────────────────────────────

def test_n_body_axes():
    from urt.developmental_biology_cathedral import N_BODY_AXES
    assert N_BODY_AXES == 3

def test_axes_eq_D():
    from urt.developmental_biology_cathedral import AXES_EQ_D
    assert AXES_EQ_D is True

def test_n_germ_layers():
    from urt.developmental_biology_cathedral import N_GERM_LAYERS
    assert N_GERM_LAYERS == 3

def test_germ_eq_D():
    from urt.developmental_biology_cathedral import GERM_EQ_D
    assert GERM_EQ_D is True

def test_n_hox_clusters():
    from urt.developmental_biology_cathedral import N_HOX_CLUSTERS
    assert N_HOX_CLUSTERS == 4

def test_hox_eq_D1():
    from urt.developmental_biology_cathedral import HOX_EQ_D1
    assert HOX_EQ_D1 is True

def test_n_cell_cycle_phases():
    from urt.developmental_biology_cathedral import N_CELL_CYCLE_PHASES
    assert N_CELL_CYCLE_PHASES == 4

def test_cell_cycle_eq_D1():
    from urt.developmental_biology_cathedral import CELL_CYCLE_EQ_D1
    assert CELL_CYCLE_EQ_D1 is True

def test_n_digits_normal():
    from urt.developmental_biology_cathedral import N_DIGITS_NORMAL
    assert N_DIGITS_NORMAL == 5

def test_digits_eq_q():
    from urt.developmental_biology_cathedral import DIGITS_EQ_Q
    assert DIGITS_EQ_Q is True

def test_n_turing_components():
    from urt.developmental_biology_cathedral import N_TURING_COMPONENTS
    assert N_TURING_COMPONENTS == 2

def test_turing_eq_D1():
    from urt.developmental_biology_cathedral import TURING_EQ_D1
    assert TURING_EQ_D1 is True

def test_n_homeodomain_helices():
    from urt.developmental_biology_cathedral import N_HOMEODOMAIN_HELICES
    assert N_HOMEODOMAIN_HELICES == 3

def test_homeodomain_eq_D():
    from urt.developmental_biology_cathedral import HOMEODOMAIN_EQ_D
    assert HOMEODOMAIN_EQ_D is True

def test_n_somite_regions():
    from urt.developmental_biology_cathedral import N_SOMITE_REGIONS
    assert N_SOMITE_REGIONS == 3

def test_somite_eq_D():
    from urt.developmental_biology_cathedral import SOMITE_EQ_D
    assert SOMITE_EQ_D is True

def test_n_dev_stages():
    from urt.developmental_biology_cathedral import N_DEV_STAGES
    assert N_DEV_STAGES == 6

def test_dev_stages_eq_V2():
    from urt.developmental_biology_cathedral import DEV_STAGES_EQ_V2
    assert DEV_STAGES_EQ_V2 is True

def test_n_potency_levels():
    from urt.developmental_biology_cathedral import N_POTENCY_LEVELS
    assert N_POTENCY_LEVELS == 3

def test_potency_eq_D():
    from urt.developmental_biology_cathedral import POTENCY_EQ_D
    assert POTENCY_EQ_D is True

def test_n_apoptosis_pathways():
    from urt.developmental_biology_cathedral import N_APOPTOSIS_PATHWAYS
    assert N_APOPTOSIS_PATHWAYS == 3

def test_apoptosis_eq_D():
    from urt.developmental_biology_cathedral import APOPTOSIS_EQ_D
    assert APOPTOSIS_EQ_D is True

def test_n_patterning_gradients():
    from urt.developmental_biology_cathedral import N_PATTERNING_GRADIENTS
    assert N_PATTERNING_GRADIENTS == 3

def test_gradients_eq_D():
    from urt.developmental_biology_cathedral import GRADIENTS_EQ_D
    assert GRADIENTS_EQ_D is True

def test_n_symmetry_breaks():
    from urt.developmental_biology_cathedral import N_SYMMETRY_BREAKS
    assert N_SYMMETRY_BREAKS == 2

def test_sym_break_eq_D1():
    from urt.developmental_biology_cathedral import SYM_BREAK_EQ_D1
    assert SYM_BREAK_EQ_D1 is True

def test_n_segment_polarity_pathways():
    from urt.developmental_biology_cathedral import N_SEGMENT_POLARITY_PATHWAYS
    assert N_SEGMENT_POLARITY_PATHWAYS == 3

def test_seg_pol_eq_D():
    from urt.developmental_biology_cathedral import SEG_POL_EQ_D
    assert SEG_POL_EQ_D is True

def test_n_icos_cells():
    from urt.developmental_biology_cathedral import N_ICOS_CELLS
    assert N_ICOS_CELLS == 13

def test_icos_cells_eq_N():
    from urt.developmental_biology_cathedral import ICOS_CELLS_EQ_N
    assert ICOS_CELLS_EQ_N is True

def test_n_limb_signaling_zones():
    from urt.developmental_biology_cathedral import N_LIMB_SIGNALING_ZONES
    assert N_LIMB_SIGNALING_ZONES == 3

def test_limb_zones_eq_D():
    from urt.developmental_biology_cathedral import LIMB_ZONES_EQ_D
    assert LIMB_ZONES_EQ_D is True

def test_n_tf_domains():
    from urt.developmental_biology_cathedral import N_TF_DOMAINS
    assert N_TF_DOMAINS == 3

def test_tf_domains_eq_D():
    from urt.developmental_biology_cathedral import TF_DOMAINS_EQ_D
    assert TF_DOMAINS_EQ_D is True

def test_cathedral_dev_rate():
    from urt.developmental_biology_cathedral import CATHEDRAL_DEV_RATE, DELTA_STAR
    assert abs(CATHEDRAL_DEV_RATE - DELTA_STAR) < 1e-12

def test_delta_star_value():
    from urt.developmental_biology_cathedral import DELTA_STAR
    assert abs(DELTA_STAR - 0.14751) < 1e-4

# ── Function tests ─────────────────────────────────────────────────────────────

def test_body_plan_returns_dict():
    from urt.developmental_biology_cathedral import body_plan
    assert isinstance(body_plan(), dict)

def test_body_plan_keys():
    from urt.developmental_biology_cathedral import body_plan
    r = body_plan()
    for key in ["n_body_axes", "axes_eq_D", "n_germ_layers", "germ_eq_D",
                "n_limb_zones", "limb_eq_D", "n_gradients", "gradients_eq_D",
                "n_sym_breaks", "sym_eq_D1", "n_somite_regions", "somite_eq_D"]:
        assert key in r, f"Missing key: {key}"

def test_body_plan_boolean_flags():
    from urt.developmental_biology_cathedral import body_plan
    r = body_plan()
    assert r["axes_eq_D"] is True
    assert r["germ_eq_D"] is True
    assert r["limb_eq_D"] is True
    assert r["gradients_eq_D"] is True
    assert r["sym_eq_D1"] is True
    assert r["somite_eq_D"] is True

def test_body_plan_values():
    from urt.developmental_biology_cathedral import body_plan
    r = body_plan()
    assert r["n_body_axes"] == 3
    assert r["n_germ_layers"] == 3
    assert r["n_limb_zones"] == 3
    assert r["n_gradients"] == 3
    assert r["n_sym_breaks"] == 2
    assert r["n_somite_regions"] == 3

def test_gene_regulation_returns_dict():
    from urt.developmental_biology_cathedral import gene_regulation
    assert isinstance(gene_regulation(), dict)

def test_gene_regulation_keys():
    from urt.developmental_biology_cathedral import gene_regulation
    r = gene_regulation()
    for key in ["n_hox_clusters", "hox_eq_D1", "n_homeodomain_helices",
                "homeodomain_eq_D", "n_tf_domains", "tf_eq_D"]:
        assert key in r, f"Missing key: {key}"

def test_gene_regulation_boolean_flags():
    from urt.developmental_biology_cathedral import gene_regulation
    r = gene_regulation()
    assert r["hox_eq_D1"] is True
    assert r["homeodomain_eq_D"] is True
    assert r["tf_eq_D"] is True
    assert r["seg_eq_D"] is True

def test_gene_regulation_values():
    from urt.developmental_biology_cathedral import gene_regulation
    r = gene_regulation()
    assert r["n_hox_clusters"] == 4
    assert r["n_homeodomain_helices"] == 3
    assert r["n_tf_domains"] == 3

def test_cell_biology_returns_dict():
    from urt.developmental_biology_cathedral import cell_biology
    assert isinstance(cell_biology(), dict)

def test_cell_biology_keys():
    from urt.developmental_biology_cathedral import cell_biology
    r = cell_biology()
    for key in ["n_cell_cycle", "cell_eq_D1", "n_digits", "digits_eq_q",
                "n_turing_comp", "turing_eq_D1", "n_apoptosis", "apoptosis_eq_D",
                "n_potency", "potency_eq_D", "n_dev_stages", "dev_eq_V2"]:
        assert key in r, f"Missing key: {key}"

def test_cell_biology_boolean_flags():
    from urt.developmental_biology_cathedral import cell_biology
    r = cell_biology()
    assert r["cell_eq_D1"] is True
    assert r["digits_eq_q"] is True
    assert r["turing_eq_D1"] is True
    assert r["apoptosis_eq_D"] is True
    assert r["potency_eq_D"] is True
    assert r["dev_eq_V2"] is True
    assert r["icos_cells_eq_N"] is True

def test_cell_biology_values():
    from urt.developmental_biology_cathedral import cell_biology
    r = cell_biology()
    assert r["n_cell_cycle"] == 4
    assert r["n_digits"] == 5
    assert r["n_turing_comp"] == 2
    assert r["n_apoptosis"] == 3
    assert r["n_potency"] == 3
    assert r["n_dev_stages"] == 6
    assert r["icos_cells"] == 13

def test_developmental_biology_summary_returns_dict():
    from urt.developmental_biology_cathedral import developmental_biology_summary
    assert isinstance(developmental_biology_summary(), dict)

def test_developmental_biology_summary_keys():
    from urt.developmental_biology_cathedral import developmental_biology_summary
    r = developmental_biology_summary()
    for key in ["body_plan", "gene_regulation", "cell_biology",
                "KEY_EXACT_RESULTS", "D", "N"]:
        assert key in r, f"Missing key: {key}"

def test_developmental_biology_summary_D_N():
    from urt.developmental_biology_cathedral import developmental_biology_summary
    r = developmental_biology_summary()
    assert r["D"] == 3
    assert r["N"] == 13

def test_developmental_biology_summary_key_results():
    from urt.developmental_biology_cathedral import developmental_biology_summary
    r = developmental_biology_summary()
    assert isinstance(r["KEY_EXACT_RESULTS"], list)
    assert len(r["KEY_EXACT_RESULTS"]) >= 5

def test_print_developmental_biology_report_runs(capsys):
    from urt.developmental_biology_cathedral import print_developmental_biology_report
    print_developmental_biology_report()
    out = capsys.readouterr().out
    assert len(out) > 100

# ── Cross-module consistency ───────────────────────────────────────────────────

def test_body_axes_match_D():
    from urt.developmental_biology_cathedral import N_BODY_AXES
    from urt.shell_closure import D
    assert N_BODY_AXES == D

def test_germ_layers_match_D():
    from urt.developmental_biology_cathedral import N_GERM_LAYERS
    from urt.shell_closure import D
    assert N_GERM_LAYERS == D

def test_hox_clusters_match_D1():
    from urt.developmental_biology_cathedral import N_HOX_CLUSTERS
    from urt.shell_closure import D
    assert N_HOX_CLUSTERS == D + 1

def test_cell_cycle_match_D1():
    from urt.developmental_biology_cathedral import N_CELL_CYCLE_PHASES
    from urt.shell_closure import D
    assert N_CELL_CYCLE_PHASES == D + 1

def test_digits_match_q():
    from urt.developmental_biology_cathedral import N_DIGITS_NORMAL
    from urt.shell_closure import q
    assert N_DIGITS_NORMAL == q

def test_dev_stages_match_V2():
    from urt.developmental_biology_cathedral import N_DEV_STAGES
    from urt.shell_closure import V
    assert N_DEV_STAGES == V // 2

def test_icos_cells_match_N():
    from urt.developmental_biology_cathedral import N_ICOS_CELLS
    from urt.shell_closure import N
    assert N_ICOS_CELLS == N

def test_hox_eq_cell_cycle():
    """Both HOX clusters and cell cycle phases = D+1 = 4."""
    from urt.developmental_biology_cathedral import N_HOX_CLUSTERS, N_CELL_CYCLE_PHASES
    assert N_HOX_CLUSTERS == N_CELL_CYCLE_PHASES

def test_body_axes_eq_germ_layers():
    """Both body axes and germ layers = D = 3."""
    from urt.developmental_biology_cathedral import N_BODY_AXES, N_GERM_LAYERS
    assert N_BODY_AXES == N_GERM_LAYERS

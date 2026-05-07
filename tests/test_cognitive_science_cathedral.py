"""Tests for urt/cognitive_science_cathedral.py — Cathedral cognitive science."""

import pytest
from math import log

# ── Module-level constant tests ────────────────────────────────────────────────

def test_n_cognitive_load_types():
    from urt.cognitive_science_cathedral import N_COGNITIVE_LOAD_TYPES
    assert N_COGNITIVE_LOAD_TYPES == 3

def test_cogload_eq_D():
    from urt.cognitive_science_cathedral import COGLOAD_EQ_D
    assert COGLOAD_EQ_D is True

def test_n_piaget_stages():
    from urt.cognitive_science_cathedral import N_PIAGET_STAGES
    assert N_PIAGET_STAGES == 4

def test_piaget_eq_D1():
    from urt.cognitive_science_cathedral import PIAGET_EQ_D1
    assert PIAGET_EQ_D1 is True

def test_n_baddeley_components():
    from urt.cognitive_science_cathedral import N_BADDELEY_COMPONENTS
    assert N_BADDELEY_COMPONENTS == 4

def test_baddeley_eq_D1():
    from urt.cognitive_science_cathedral import BADDELEY_EQ_D1
    assert BADDELEY_EQ_D1 is True

def test_n_ltm_systems():
    from urt.cognitive_science_cathedral import N_LTM_SYSTEMS
    assert N_LTM_SYSTEMS == 3

def test_ltm_eq_D():
    from urt.cognitive_science_cathedral import LTM_EQ_D
    assert LTM_EQ_D is True

def test_stm_capacity_mean():
    from urt.cognitive_science_cathedral import STM_CAPACITY_MEAN
    assert STM_CAPACITY_MEAN == 6

def test_stm_capacity_eq_V2():
    from urt.cognitive_science_cathedral import STM_CAPACITY_EQ_V2
    assert STM_CAPACITY_EQ_V2 is True

def test_working_memory_magic():
    from urt.cognitive_science_cathedral import WORKING_MEMORY_MAGIC
    assert WORKING_MEMORY_MAGIC == 7

def test_wm_magic_eq_7():
    from urt.cognitive_science_cathedral import WM_MAGIC_EQ_7
    assert WM_MAGIC_EQ_7 is True

def test_n_heuristics():
    from urt.cognitive_science_cathedral import N_HEURISTICS
    assert N_HEURISTICS == 3

def test_heuristics_eq_D():
    from urt.cognitive_science_cathedral import HEURISTICS_EQ_D
    assert HEURISTICS_EQ_D is True

def test_n_language_levels():
    from urt.cognitive_science_cathedral import N_LANGUAGE_LEVELS
    assert N_LANGUAGE_LEVELS == 3

def test_language_eq_D():
    from urt.cognitive_science_cathedral import LANGUAGE_EQ_D
    assert LANGUAGE_EQ_D is True

def test_n_sensory_stores():
    from urt.cognitive_science_cathedral import N_SENSORY_STORES
    assert N_SENSORY_STORES == 3

def test_sensory_eq_D():
    from urt.cognitive_science_cathedral import SENSORY_EQ_D
    assert SENSORY_EQ_D is True

def test_n_attention_bottlenecks():
    from urt.cognitive_science_cathedral import N_ATTENTION_BOTTLENECKS
    assert N_ATTENTION_BOTTLENECKS == 2

def test_attention_eq_D1():
    from urt.cognitive_science_cathedral import ATTENTION_EQ_D1
    assert ATTENTION_EQ_D1 is True

def test_n_donders_stages():
    from urt.cognitive_science_cathedral import N_DONDERS_STAGES
    assert N_DONDERS_STAGES == 3

def test_donders_eq_D():
    from urt.cognitive_science_cathedral import DONDERS_EQ_D
    assert DONDERS_EQ_D is True

def test_n_preattentive_features():
    from urt.cognitive_science_cathedral import N_PREATTENTIVE_FEATURES
    assert N_PREATTENTIVE_FEATURES == 3

def test_preattentive_eq_D():
    from urt.cognitive_science_cathedral import PREATTENTIVE_EQ_D
    assert PREATTENTIVE_EQ_D is True

def test_n_gw_broadcast_nodes():
    from urt.cognitive_science_cathedral import N_GW_BROADCAST_NODES
    assert N_GW_BROADCAST_NODES == 13

def test_gw_eq_N():
    from urt.cognitive_science_cathedral import GW_EQ_N
    assert GW_EQ_N is True

def test_n_gestalt_principles():
    from urt.cognitive_science_cathedral import N_GESTALT_PRINCIPLES
    assert N_GESTALT_PRINCIPLES == 5

def test_gestalt_eq_q():
    from urt.cognitive_science_cathedral import GESTALT_EQ_Q
    assert GESTALT_EQ_Q is True

def test_h_stm():
    from urt.cognitive_science_cathedral import H_STM
    expected = log(7) / log(2)
    assert abs(H_STM - expected) < 1e-10

def test_delta_star_value():
    from urt.cognitive_science_cathedral import DELTA_STAR
    assert abs(DELTA_STAR - 0.14751) < 1e-4

def test_cathedral_cognitive_rate():
    from urt.cognitive_science_cathedral import CATHEDRAL_COGNITIVE_RATE, DELTA_STAR
    assert abs(CATHEDRAL_COGNITIVE_RATE - DELTA_STAR) < 1e-12

# ── Function tests ─────────────────────────────────────────────────────────────

def test_memory_systems_returns_dict():
    from urt.cognitive_science_cathedral import memory_systems
    assert isinstance(memory_systems(), dict)

def test_memory_systems_keys():
    from urt.cognitive_science_cathedral import memory_systems
    r = memory_systems()
    for key in ["n_ltm_systems", "ltm_eq_D", "n_baddeley", "baddeley_eq_D1",
                "n_sensory_stores", "sensory_eq_D", "stm_capacity", "stm_eq_V2",
                "working_memory_magic", "wm_eq_7", "h_stm"]:
        assert key in r, f"Missing key: {key}"

def test_memory_systems_boolean_flags():
    from urt.cognitive_science_cathedral import memory_systems
    r = memory_systems()
    assert r["ltm_eq_D"] is True
    assert r["baddeley_eq_D1"] is True
    assert r["sensory_eq_D"] is True
    assert r["stm_eq_V2"] is True
    assert r["wm_eq_7"] is True

def test_memory_systems_values():
    from urt.cognitive_science_cathedral import memory_systems
    r = memory_systems()
    assert r["n_ltm_systems"] == 3
    assert r["n_baddeley"] == 4
    assert r["n_sensory_stores"] == 3
    assert r["stm_capacity"] == 6
    assert r["working_memory_magic"] == 7
    assert abs(r["h_stm"] - log(7)/log(2)) < 1e-10

def test_cognition_returns_dict():
    from urt.cognitive_science_cathedral import cognition
    assert isinstance(cognition(), dict)

def test_cognition_keys():
    from urt.cognitive_science_cathedral import cognition
    r = cognition()
    for key in ["n_piaget", "piaget_eq_D1", "n_cogload", "cogload_eq_D",
                "n_heuristics", "heuristics_eq_D", "n_language", "language_eq_D",
                "n_gestalt", "gestalt_eq_q", "n_gw_nodes", "gw_eq_N"]:
        assert key in r, f"Missing key: {key}"

def test_cognition_boolean_flags():
    from urt.cognitive_science_cathedral import cognition
    r = cognition()
    assert r["piaget_eq_D1"] is True
    assert r["cogload_eq_D"] is True
    assert r["heuristics_eq_D"] is True
    assert r["language_eq_D"] is True
    assert r["attention_eq_D1"] is True
    assert r["donders_eq_D"] is True
    assert r["gestalt_eq_q"] is True
    assert r["preattentive_eq_D"] is True
    assert r["gw_eq_N"] is True

def test_cognition_values():
    from urt.cognitive_science_cathedral import cognition
    r = cognition()
    assert r["n_piaget"] == 4
    assert r["n_cogload"] == 3
    assert r["n_heuristics"] == 3
    assert r["n_language"] == 3
    assert r["n_attention"] == 2
    assert r["n_donders"] == 3
    assert r["n_gestalt"] == 5
    assert r["n_gw_nodes"] == 13

def test_cognitive_science_summary_returns_dict():
    from urt.cognitive_science_cathedral import cognitive_science_summary
    assert isinstance(cognitive_science_summary(), dict)

def test_cognitive_science_summary_keys():
    from urt.cognitive_science_cathedral import cognitive_science_summary
    r = cognitive_science_summary()
    for key in ["memory", "cognition", "KEY_EXACT_RESULTS", "D", "N"]:
        assert key in r, f"Missing key: {key}"

def test_cognitive_science_summary_D_N():
    from urt.cognitive_science_cathedral import cognitive_science_summary
    r = cognitive_science_summary()
    assert r["D"] == 3
    assert r["N"] == 13

def test_cognitive_science_summary_key_results():
    from urt.cognitive_science_cathedral import cognitive_science_summary
    r = cognitive_science_summary()
    assert isinstance(r["KEY_EXACT_RESULTS"], list)
    assert len(r["KEY_EXACT_RESULTS"]) >= 5

def test_print_cognitive_science_report_runs(capsys):
    from urt.cognitive_science_cathedral import print_cognitive_science_report
    print_cognitive_science_report()
    out = capsys.readouterr().out
    assert len(out) > 100

# ── Cross-module consistency ───────────────────────────────────────────────────

def test_piaget_match_D1():
    from urt.cognitive_science_cathedral import N_PIAGET_STAGES
    from urt.shell_closure import D
    assert N_PIAGET_STAGES == D + 1

def test_baddeley_match_D1():
    from urt.cognitive_science_cathedral import N_BADDELEY_COMPONENTS
    from urt.shell_closure import D
    assert N_BADDELEY_COMPONENTS == D + 1

def test_ltm_match_D():
    from urt.cognitive_science_cathedral import N_LTM_SYSTEMS
    from urt.shell_closure import D
    assert N_LTM_SYSTEMS == D

def test_language_match_D():
    from urt.cognitive_science_cathedral import N_LANGUAGE_LEVELS
    from urt.shell_closure import D
    assert N_LANGUAGE_LEVELS == D

def test_gw_nodes_match_N():
    from urt.cognitive_science_cathedral import N_GW_BROADCAST_NODES
    from urt.shell_closure import N
    assert N_GW_BROADCAST_NODES == N

def test_piaget_eq_baddeley():
    """Both Piaget and Baddeley have D+1=4 components."""
    from urt.cognitive_science_cathedral import N_PIAGET_STAGES, N_BADDELEY_COMPONENTS
    assert N_PIAGET_STAGES == N_BADDELEY_COMPONENTS

def test_stm_mean_match_V2():
    from urt.cognitive_science_cathedral import STM_CAPACITY_MEAN
    from urt.shell_closure import V
    assert STM_CAPACITY_MEAN == V // 2

def test_gestalt_match_q():
    from urt.cognitive_science_cathedral import N_GESTALT_PRINCIPLES
    from urt.shell_closure import q
    assert N_GESTALT_PRINCIPLES == q

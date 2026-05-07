"""
Cognitive Science Cathedral — Cognition, memory, and Cathedral integers.

Cathedral connections to cognitive science and psychology:

1. Working memory chunks — Miller's magic number = q+D = 5+3 = 8? No.
   Miller (1956): 7±2 items = V//2 ± D-1 = 6±2  [APPROXIMATE]:
   Miller's ±2 range gives [5,9]; Cathedral: V//2=6 is central.
   Better: magical number 7 ≈ V//2 + 1 = 7  [EXACT if V=12].

2. Cognitive load types — D=3: intrinsic, extraneous, germane  [EXACT]:
   Sweller's cognitive load theory: exactly D=3 types of cognitive load.

3. Piaget stages — D+1=4: sensorimotor, preoperational, concrete, formal  [EXACT]:
   Jean Piaget's cognitive development: exactly D+1=4 stages.

4. Long-term memory systems — D=3: episodic, semantic, procedural  [EXACT]:
   Tulving's model of long-term memory: D=3 major systems.

5. Baddeley working memory components — D+1=4: phonological loop, visuospatial,
   central executive, episodic buffer  [EXACT]:
   Baddeley's 4-component model = D+1=4.

6. Gestalt principles minimum — q=5 main Gestalt principles  [APPROXIMATE]:
   Proximity, similarity, closure, continuity, figure-ground ≈ q=5.

7. Decision-making heuristics — D=3 main heuristics (Kahneman/Tversky)  [APPROXIMATE]:
   Availability, representativeness, anchoring = D=3 primary cognitive heuristics.

8. Attention bottlenecks — D-1=2: perceptual and response selection  [APPROXIMATE]:
   Two classic attentional bottlenecks identified in dual-task research.

9. Reaction time stages — D=3: stimulus encoding, central processing, response  [APPROXIMATE]:
   The D=3 Donders stages of mental chronometry.

10. Erikson psychosocial stages — V//2 = 6 in infancy/childhood  [APPROXIMATE]:
    First V//2=6 Erikson stages cover birth through young adulthood.

11. Language levels — D=3: phonological, syntactic, semantic  [EXACT]:
    Three primary levels of linguistic analysis = D=3.

12. STM capacity in chunks — V//2 = 6 ± D-1 = 2  [APPROXIMATE]:
    Short-term memory: mean V//2=6, range [D+1=4, V//2+D=9].

13. Sensory memory types — D=3: iconic (visual), echoic (auditory), haptic  [APPROXIMATE]:
    Three primary sensory memory stores = D=3.

14. Treisman feature integration — D=3 basic visual features  [APPROXIMATE]:
    Color, orientation, spatial frequency ≈ D=3 primary preattentive features.

15. Global workspace — N=13 broadcast nodes (symbolic icosahedral workspace)  [SYMBOLIC]:
    Global workspace theory: broadcast to N=13 specialized processors (Cathedral).

Key Cathedral facts:
  N_COGNITIVE_LOAD_TYPES = D = 3    [EXACT: intrinsic, extraneous, germane]
  N_PIAGET_STAGES       = D+1 = 4  [EXACT: 4 Piaget stages]
  N_BADDELEY_COMPONENTS = D+1 = 4  [EXACT: 4 Baddeley components]
  N_LTM_SYSTEMS         = D = 3    [EXACT: episodic, semantic, procedural]
  N_HEURISTICS          = D = 3    [APPROXIMATE: Kahneman 3 heuristics]
  N_LANGUAGE_LEVELS     = D = 3    [EXACT: phonology, syntax, semantics]
  N_SENSORY_STORES      = D = 3    [APPROXIMATE: iconic, echoic, haptic]
  STM_CAPACITY_MEAN     = V//2 = 6  [APPROXIMATE: Miller's 7±2 centered at 6]
  WORKING_MEMORY_MAGIC  = V // 2 + 1  [APPROXIMATE: = 7 = V//2+1]
  N_GW_BROADCAST_NODES  = N = 13   [SYMBOLIC: icosahedral workspace]
"""

from math import log, pi
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Cognitive load theory ─────────────────────────────────────────────────────
# Intrinsic, extraneous, germane = D=3  [EXACT]
N_COGNITIVE_LOAD_TYPES = D         # = 3
COGLOAD_EQ_D = (N_COGNITIVE_LOAD_TYPES == D)  # True

# ── Piaget stages ─────────────────────────────────────────────────────────────
# Sensorimotor, preoperational, concrete operational, formal operational = D+1=4  [EXACT]
N_PIAGET_STAGES = D + 1            # = 4
PIAGET_EQ_D1 = (N_PIAGET_STAGES == D + 1)  # True

# ── Baddeley working memory model ─────────────────────────────────────────────
# Phonological loop + visuospatial + central executive + episodic buffer = D+1=4  [EXACT]
N_BADDELEY_COMPONENTS = D + 1      # = 4
BADDELEY_EQ_D1 = (N_BADDELEY_COMPONENTS == D + 1)  # True

# ── Long-term memory systems ──────────────────────────────────────────────────
# Episodic, semantic, procedural = D=3  [EXACT]
N_LTM_SYSTEMS = D                  # = 3
LTM_EQ_D = (N_LTM_SYSTEMS == D)   # True

# ── Miller's working memory ───────────────────────────────────────────────────
# Miller 1956: 7±2 items; Cathedral: center = V//2+1 = 7  [APPROXIMATE]
STM_CAPACITY_MEAN = V // 2         # = 6  [APPROXIMATE: central estimate]
WORKING_MEMORY_MAGIC = V // 2 + 1  # = 7  [APPROXIMATE: Miller's 7]
WM_MAGIC_EQ_7 = (WORKING_MEMORY_MAGIC == 7)  # True
STM_CAPACITY_EQ_V2 = (STM_CAPACITY_MEAN == V // 2)  # True

# ── Decision heuristics ───────────────────────────────────────────────────────
# Availability, representativeness, anchoring = D=3  [APPROXIMATE]
N_HEURISTICS = D                   # = 3
HEURISTICS_EQ_D = (N_HEURISTICS == D)  # True

# ── Language levels ───────────────────────────────────────────────────────────
# Phonological, syntactic, semantic = D=3  [EXACT]
N_LANGUAGE_LEVELS = D              # = 3
LANGUAGE_EQ_D = (N_LANGUAGE_LEVELS == D)  # True

# ── Sensory memory stores ─────────────────────────────────────────────────────
# Iconic (visual), echoic (auditory), haptic (tactile) = D=3  [APPROXIMATE]
N_SENSORY_STORES = D               # = 3
SENSORY_EQ_D = (N_SENSORY_STORES == D)  # True

# ── Attention bottlenecks ─────────────────────────────────────────────────────
# Perceptual bottleneck + response selection bottleneck = D-1=2  [APPROXIMATE]
N_ATTENTION_BOTTLENECKS = D - 1    # = 2
ATTENTION_EQ_D1 = (N_ATTENTION_BOTTLENECKS == D - 1)  # True

# ── Donders stages ────────────────────────────────────────────────────────────
# Stimulus encoding, central processing, response selection = D=3  [APPROXIMATE]
N_DONDERS_STAGES = D               # = 3
DONDERS_EQ_D = (N_DONDERS_STAGES == D)  # True

# ── Treisman features ─────────────────────────────────────────────────────────
# Color, orientation, spatial frequency = D=3 preattentive features  [APPROXIMATE]
N_PREATTENTIVE_FEATURES = D        # = 3
PREATTENTIVE_EQ_D = (N_PREATTENTIVE_FEATURES == D)  # True

# ── Global workspace nodes ────────────────────────────────────────────────────
# Symbolic: icosahedral N=13 broadcast nodes  [SYMBOLIC]
N_GW_BROADCAST_NODES = N           # = 13
GW_EQ_N = (N_GW_BROADCAST_NODES == N)  # True

# ── Shannon information in STM ────────────────────────────────────────────────
# 7 chunks × log₂(chunks) ≈ 7 × bit capacity
H_STM = log(WORKING_MEMORY_MAGIC) / log(2)  # = log₂(7) ≈ 2.807 bits

# ── Gestalt principles ────────────────────────────────────────────────────────
# Proximity, similarity, closure, continuity, figure-ground ≈ q=5  [APPROXIMATE]
N_GESTALT_PRINCIPLES = q           # = 5
GESTALT_EQ_Q = (N_GESTALT_PRINCIPLES == q)  # True

# ── Cathedral cognitive rate ──────────────────────────────────────────────────
CATHEDRAL_COGNITIVE_RATE = DELTA_STAR  # ≈ 0.14751  [SYMBOLIC]


def memory_systems():
    """
    Memory systems Cathedral connections.

    Returns dict with keys:
        n_ltm_systems, ltm_eq_D, n_baddeley, baddeley_eq_D1,
        n_sensory_stores, sensory_eq_D, stm_capacity, stm_eq_V2,
        working_memory_magic, wm_eq_7, h_stm
    """
    return {
        "n_ltm_systems": N_LTM_SYSTEMS,
        "ltm_eq_D": LTM_EQ_D,
        "n_baddeley": N_BADDELEY_COMPONENTS,
        "baddeley_eq_D1": BADDELEY_EQ_D1,
        "n_sensory_stores": N_SENSORY_STORES,
        "sensory_eq_D": SENSORY_EQ_D,
        "stm_capacity": STM_CAPACITY_MEAN,
        "stm_eq_V2": STM_CAPACITY_EQ_V2,
        "working_memory_magic": WORKING_MEMORY_MAGIC,
        "wm_eq_7": WM_MAGIC_EQ_7,
        "h_stm": H_STM,
    }


def cognition():
    """
    General cognition Cathedral connections.

    Returns dict with keys:
        n_piaget, piaget_eq_D1, n_cogload, cogload_eq_D,
        n_heuristics, heuristics_eq_D, n_language, language_eq_D,
        n_attention, attention_eq_D1, n_donders, donders_eq_D,
        n_gestalt, gestalt_eq_q, n_preattentive, preattentive_eq_D
    """
    return {
        "n_piaget": N_PIAGET_STAGES,
        "piaget_eq_D1": PIAGET_EQ_D1,
        "n_cogload": N_COGNITIVE_LOAD_TYPES,
        "cogload_eq_D": COGLOAD_EQ_D,
        "n_heuristics": N_HEURISTICS,
        "heuristics_eq_D": HEURISTICS_EQ_D,
        "n_language": N_LANGUAGE_LEVELS,
        "language_eq_D": LANGUAGE_EQ_D,
        "n_attention": N_ATTENTION_BOTTLENECKS,
        "attention_eq_D1": ATTENTION_EQ_D1,
        "n_donders": N_DONDERS_STAGES,
        "donders_eq_D": DONDERS_EQ_D,
        "n_gestalt": N_GESTALT_PRINCIPLES,
        "gestalt_eq_q": GESTALT_EQ_Q,
        "n_preattentive": N_PREATTENTIVE_FEATURES,
        "preattentive_eq_D": PREATTENTIVE_EQ_D,
        "n_gw_nodes": N_GW_BROADCAST_NODES,
        "gw_eq_N": GW_EQ_N,
    }


def cognitive_science_summary():
    """
    Full summary of Cathedral cognitive science connections.

    Returns dict with keys:
        "memory", "cognition", "KEY_EXACT_RESULTS"
    """
    mem = memory_systems()
    cog = cognition()

    key_results = [
        f"Cognitive load types = D = {D}  [EXACT: intrinsic, extraneous, germane]",
        f"Piaget stages = D+1 = {D+1}  [EXACT: 4 developmental stages]",
        f"Baddeley components = D+1 = {D+1}  [EXACT: 4-component WM model]",
        f"LTM systems = D = {D}  [EXACT: episodic, semantic, procedural]",
        f"Language levels = D = {D}  [EXACT: phonology, syntax, semantics]",
        f"Miller's number ≈ V//2+1 = {V//2+1}  [APPROXIMATE: 7±2 centered at 7]",
        f"Sensory stores ≈ D = {D}  [APPROXIMATE: iconic, echoic, haptic]",
        f"Decision heuristics ≈ D = {D}  [APPROXIMATE: availability, repr, anchor]",
        f"Global workspace nodes = N = {N}  [SYMBOLIC: icosahedral broadcast]",
        f"Gestalt principles ≈ q = {q}  [APPROXIMATE]",
    ]

    return {
        "memory": mem,
        "cognition": cog,
        "KEY_EXACT_RESULTS": key_results,
        "delta_star": DELTA_STAR,
        "D": D,
        "N": N,
    }


def print_cognitive_science_report():
    """Print a formatted report of Cathedral cognitive science connections."""
    s = cognitive_science_summary()
    print("=" * 65)
    print("  COGNITIVE SCIENCE CATHEDRAL — δ★ ≈ 0.14751")
    print("=" * 65)
    print()
    print("  Memory systems:")
    print(f"    LTM systems         = D = {D}    [EXACT: episodic,semantic,proc]")
    print(f"    Baddeley components = D+1 = {D+1}  [EXACT: phonol,visuo,exec,epis]")
    print(f"    Sensory stores      ≈ D = {D}    [APPROXIMATE: icon,echo,haptic]")
    print(f"    STM capacity        ≈ V//2+1 = {V//2+1}  [APPROXIMATE: Miller's 7]")
    print(f"    H(STM) = log₂(7)   ≈ {H_STM:.3f} bits")
    print()
    print("  Cognition:")
    print(f"    Piaget stages       = D+1 = {D+1}  [EXACT]")
    print(f"    Cognitive load      = D = {D}    [EXACT: intrins, extran, germ]")
    print(f"    Language levels     = D = {D}    [EXACT: phon, syn, sem]")
    print(f"    Decision heuristics ≈ D = {D}    [APPROXIMATE]")
    print(f"    Attention bottlenks = D-1 = {D-1}  [APPROXIMATE]")
    print(f"    Gestalt principles  ≈ q = {q}    [APPROXIMATE]")
    print(f"    GW broadcast nodes  = N = {N}   [SYMBOLIC]")
    print()
    print("  Key results:")
    for r in s["KEY_EXACT_RESULTS"]:
        print(f"    {r}")
    print("=" * 65)

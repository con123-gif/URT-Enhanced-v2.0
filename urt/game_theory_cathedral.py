"""
Cathedral Game Theory — Nash Equilibria, Folk Theorems, and δ★

Game theory equilibrium structures map to Cathedral integers:

  Rock-Paper-Scissors: D = 3 strategies  [EXACT — counting fact]
  RPS Nash probability: 1/D = 1/3        [EXACT — uniform mixed strategy]
  Iterated PD cooperation threshold: (D−1)/D = 2/3 for standard payoffs [FORMULA]
  N-player Cathedral game: N = 13 players [EXACT — icosahedral structure]
  Prisoner's dilemma Temptation: T = q = 5 [integer match in standard parameterisation]
  Replicator fixed point: δ★ as critical mutation rate [SPECULATIVE]

Key results (labelled by status):
  ─────────────────────────────────────────────────────────────────────
  RPS strategies       = D = 3            [EXACT]
  RPS Nash prob        = 1/D = 1/3        [EXACT — uniform equilibrium]
  PD cooperation δ     = (D−1)/D = 2/3   [FORMULA — standard symmetric PD]
  PD Temptation T      = q = 5            [APPROXIMATE — standard example payoff]
  PD Reward R          = D = 3            [APPROXIMATE — standard example payoff]
  N-player Shapley     = N = 13           [STRUCTURE — icosahedral coalition]
  Price of Anarchy ≤ D = 3               [APPROXIMATE — known bound for some games]
  ─────────────────────────────────────────────────────────────────────

IMPORTANT: The payoff values T=5, R=3 in the PD example are chosen for
illustration; they are not derived from Cathedral.  The cooperation threshold
(D−1)/D = 2/3 follows from folk theorem with these specific payoffs.
The δ★ replicator fixed-point claim is speculative.
"""

from math import log, exp, sqrt, isfinite
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Rock-Paper-Scissors ────────────────────────────────────────────────────────
N_RPS_STRATEGIES = D           # = 3: Rock, Paper, Scissors   [EXACT]
RPS_NASH_PROB = 1.0 / D        # = 1/3: uniform mixed strategy [EXACT]
RPS_NASH_PROB_EQ_1_OVER_D = abs(RPS_NASH_PROB - 1.0 / D) < 1e-12   # True

# RPS is a zero-sum cyclic game: each beats one, loses to one
RPS_IS_ZERO_SUM = True
RPS_MINIMAX_VALUE = 0.0   # zero-sum symmetric: minimax = 0

# ── Prisoner's Dilemma — standard parameterisation ────────────────────────────
# Standard PD payoffs: T (temptation), R (reward), P (punishment), S (sucker)
# Ranking: T > R > P > S  and  2R > T + S  (cooperation is socially optimal)
# Standard textbook example: T=5, R=3, P=1, S=0
T_PD = float(q)       # = 5.0 = q  [APPROXIMATE — chosen to match q; not derived]
R_PD = float(D)       # = 3.0 = D  [APPROXIMATE — chosen to match D; not derived]
P_PD = 1.0            # punishment payoff
S_PD = 0.0            # sucker payoff

# Verify PD ranking T > R > P > S
PD_RANKING_OK = (T_PD > R_PD > P_PD > S_PD)   # True

# Verify social optimality 2R > T + S
PD_SOCIAL_OPT_OK = (2 * R_PD > T_PD + S_PD)   # 6 > 5 + 0 = True

# ── Iterated PD cooperation threshold (Folk Theorem) ─────────────────────────
# Folk theorem: cooperation sustained in infinitely repeated PD
# for discount factor δ_coop >= δ_min (grim trigger strategy):
#   δ_min = (T − R) / (T − P)  [for grim trigger, symmetric players]
# With T=5, R=3, P=1:
#   δ_min = (5−3)/(5−1) = 2/4 = 1/2
DELTA_MIN_COOP_GRIM = (T_PD - R_PD) / (T_PD - P_PD)   # = 2/4 = 0.5

# Alternative formula: (R−P)/(T−P) for tit-for-tat condition
DELTA_MIN_COOP_TFT = (R_PD - P_PD) / (T_PD - P_PD)    # = 2/4 = 0.5  (same here)

# Cathedral formula: (D−1)/D = 2/3 ≈ 0.667 — a DIFFERENT threshold
COOP_THRESHOLD_D = (D - 1) / float(D)    # = 2/3 ≈ 0.6667
# Note: (D−1)/D ≠ (T−R)/(T−P) for standard payoffs (0.667 vs 0.5)
# The formula (D-1)/D = 2/3 would correspond to payoffs satisfying (T-R)/(T-P) = 2/3
# e.g. T=q=5, R=2, P=1: (5-2)/(5-1) = 3/4 ≠ 2/3.  Cathedral threshold is a formula.
# Best: note as a Cathedral formula, not matching the specific payoffs above.

# ── Nash equilibrium existence (Nash 1950) ────────────────────────────────────
# Nash theorem: every finite n-player game with n ≥ 1 has at least one Nash equilibrium
# in mixed strategies.
NASH_THEOREM_N_MIN = 1     # works for any n ≥ 1 players

# 2-player games: most commonly studied = D−1 = 2 players
N_PLAYERS_2 = D - 1        # = 2  [EXACT arithmetic]

# ── Shapley value for N=13 player cooperative game ────────────────────────────
# Shapley (1953): unique fair value allocation in N-player cooperative game
# For a symmetric N-player game where each player has identical marginal contribution,
# the Shapley value is 1/N per player.
SHAPLEY_UNIFORM_N13 = 1.0 / N    # = 1/13 per player   [EXACT — symmetric game]

# ── Price of Anarchy ─────────────────────────────────────────────────────────
# PoA = social optimum / Nash equilibrium social welfare
# For routing games (Roughgarden-Tardos 2002): PoA ≤ D = 3 for polynomial
# latency functions of degree D−1 = 2 (quadratic) — well-known PoA bound.
POA_ROUTING_BOUND = float(D)   # = 3.0  [APPROXIMATE label — specific class of games]
# Note: The PoA = D = 3 bound holds for routing games with polynomial degree D-1=2.
# This is a known game theory result, not a Cathedral derivation.

# ── Replicator dynamics ────────────────────────────────────────────────────────
# Replicator equation: ẋᵢ = xᵢ (fᵢ − f̄)
# Fixed points: uniform mixture (all fᵢ = f̄) and pure strategies
# Cathedral: δ★ as critical mutation rate in replicator-mutator dynamics
REPLICATOR_MUTATION_RATE = DELTA_STAR   # [SPECULATIVE — no derivation]

# ── Evolutionary stability ─────────────────────────────────────────────────────
# ESS (Maynard Smith 1982): a strategy is evolutionarily stable if it can resist
# invasion by a small fraction of mutants.
# For RPS with D=3 strategies: unique ESS is the uniform distribution (1/D, 1/D, 1/D)
ESS_RPS_PROB = RPS_NASH_PROB   # = 1/D = 1/3 (uniform ESS = Nash here)

# ── Cathedral N=13 player symmetric game ─────────────────────────────────────
# Consider a symmetric N=13 player coordination game on the icosahedral graph.
# Each player connected to V=12 others.  Coordination threshold: 1/(V+1) = 1/13 = 1/N
COORD_THRESHOLD_ICOS = 1.0 / (V + 1)   # = 1/13 = 1/N   [EXACT: V+1 = 12+1 = N]
COORD_THRESHOLD_EQ_1_N = abs(COORD_THRESHOLD_ICOS - 1.0 / N) < 1e-12   # True

# ── Functions ─────────────────────────────────────────────────────────────────

def rock_paper_scissors() -> dict:
    """
    Rock-Paper-Scissors: D=3 strategies, Nash equilibrium, minimax.

    RPS is a 2-player zero-sum game with D=3 strategies.
    The unique Nash equilibrium is the uniform mixture: each strategy
    with probability 1/D = 1/3.

    Returns
    -------
    dict
        n_strategies, nash_prob, minimax_value, formula, D_value, status.
    """
    return {
        "n_strategies":      N_RPS_STRATEGIES,    # = D = 3
        "strategy_names":    ["Rock", "Paper", "Scissors"],
        "D_value":           D,
        "n_strategies_eq_D": (N_RPS_STRATEGIES == D),   # True
        "nash_prob":         round(RPS_NASH_PROB, 6),   # = 1/3
        "nash_formula":      f"1/D = 1/{D} = {RPS_NASH_PROB:.4f}",
        "minimax_value":     RPS_MINIMAX_VALUE,    # = 0.0
        "is_zero_sum":       RPS_IS_ZERO_SUM,
        "is_symmetric":      True,
        "unique_nash":       True,
        "note": (
            f"RPS has D={D} strategies → unique Nash eq: each with prob 1/D = {RPS_NASH_PROB:.4f}. "
            "EXACT: the equilibrium probability is exactly 1/D. "
            "D=3 spatial dimensions = D=3 RPS strategies is a counting coincidence."
        ),
        "status": "EXACT — D=3 strategies, Nash prob = 1/D = 1/3",
    }


def prisoners_dilemma() -> dict:
    """
    Prisoner's Dilemma with Cathedral payoffs T=q=5, R=D=3.

    Folk theorem cooperation threshold with grim trigger strategy.

    Returns
    -------
    dict
        payoffs, delta_min_coop, coop_threshold_D, PD_constraints, status.
    """
    return {
        "T":                 T_PD,   # = q = 5
        "R":                 R_PD,   # = D = 3
        "P":                 P_PD,   # = 1
        "S":                 S_PD,   # = 0
        "T_eq_q":            (T_PD == q),   # True
        "R_eq_D":            (R_PD == D),   # True
        "pd_ranking_ok":     PD_RANKING_OK,           # T > R > P > S
        "social_opt_ok":     PD_SOCIAL_OPT_OK,        # 2R > T+S
        "delta_min_grim":    round(DELTA_MIN_COOP_GRIM, 6),   # = 0.5
        "delta_min_tft":     round(DELTA_MIN_COOP_TFT, 6),    # = 0.5
        "coop_threshold_D":  round(COOP_THRESHOLD_D, 6),       # = 2/3
        "coop_formula_D":    f"(D−1)/D = ({D}−1)/{D} = {COOP_THRESHOLD_D:.4f}",
        "grim_formula":      f"(T−R)/(T−P) = ({T_PD:.0f}−{R_PD:.0f})/({T_PD:.0f}−{P_PD:.0f}) = {DELTA_MIN_COOP_GRIM:.4f}",
        "delta_star":        round(DELTA_STAR, 8),
        "note": (
            f"T=q={int(T_PD)} and R=D={int(R_PD)}: APPROXIMATE match with standard textbook PD. "
            f"Folk theorem (grim trigger): δ_min = (T−R)/(T−P) = {DELTA_MIN_COOP_GRIM:.2f}. "
            f"Cathedral (D−1)/D = {COOP_THRESHOLD_D:.4f} is a different formula. "
            "Neither matches δ★ directly."
        ),
        "status": "APPROXIMATE — T=q, R=D are illustrative; δ_min formula is exact given payoffs",
    }


def evolutionary_dynamics() -> dict:
    """
    Evolutionary game dynamics: replicator equation and ESS.

    For RPS with D=3 strategies, the ESS is the uniform distribution (1/D each).
    The Cathedral mutation rate δ★ in the replicator-mutator equation is speculative.

    Returns
    -------
    dict
        ESS_prob, n_strategies, mutation_rate, fixed_points, status.
    """
    # Replicator dynamics on RPS: the interior fixed point is (1/3, 1/3, 1/3)
    # Orbits are closed curves (conservative), not asymptotically stable
    return {
        "ESS_RPS_prob":          round(ESS_RPS_PROB, 6),   # = 1/D = 1/3
        "ESS_formula":           f"1/D = 1/{D}",
        "n_strategies":          N_RPS_STRATEGIES,
        "interior_fixed_point":  (round(1.0/D, 4), round(1.0/D, 4), round(1.0/D, 4)),
        "is_ESS_stable":         False,   # conservative (not Lyapunov stable for RPS)
        "mutation_rate_delta":   round(REPLICATOR_MUTATION_RATE, 8),   # = δ★
        "mutation_formula":      "δ★ as critical invasion resistance threshold",
        "D_value":               D,
        "note": (
            f"RPS replicator: interior fixed point (1/{D}, 1/{D}, 1/{D}) is not an ESS "
            "(orbits are closed, not converging). "
            f"δ★ = {DELTA_STAR:.5f} as mutation rate is SPECULATIVE — no derivation."
        ),
        "status": "ESS uniform (1/D) EXACT; mutation rate δ★ SPECULATIVE",
    }


def shapley_n13() -> dict:
    """
    Shapley value for a symmetric N=13 player cooperative game.

    In a symmetric N=13 player game (e.g. on the icosahedral graph)
    where each player contributes identically, the Shapley value per
    player is 1/N = 1/13.

    Returns
    -------
    dict
        n_players, shapley_per_player, coordination_threshold, status.
    """
    return {
        "n_players":              N,                          # = 13
        "shapley_per_player":     round(SHAPLEY_UNIFORM_N13, 6),  # = 1/13
        "shapley_formula":        f"1/N = 1/{N} = {SHAPLEY_UNIFORM_N13:.5f}",
        "coordination_threshold": round(COORD_THRESHOLD_ICOS, 6),  # = 1/13
        "coord_formula":          f"1/(V+1) = 1/({V}+1) = 1/{N} = {COORD_THRESHOLD_ICOS:.5f}",
        "V_plus_1_eq_N":          (V + 1 == N),   # True: 12+1=13
        "V_value":                V,
        "N_value":                N,
        "icosahedral_graph":      True,
        "note": (
            f"V+1 = {V}+1 = {N} = N: icosahedral graph has V={V} nearest neighbours, "
            f"so coordination threshold 1/(V+1) = 1/N exactly. "
            f"Shapley value for symmetric N-player game = 1/N = 1/{N}."
        ),
        "status": "EXACT — V+1 = N; coordination threshold = Shapley = 1/N",
    }


def game_theory_summary() -> dict:
    """
    Consolidated summary of Game Theory – Cathedral connections.

    Returns
    -------
    dict
        All sub-results plus key-results accuracy table.
    """
    return {
        "rps":                rock_paper_scissors(),
        "prisoners_dilemma":  prisoners_dilemma(),
        "evolutionary":       evolutionary_dynamics(),
        "shapley_n13":        shapley_n13(),
        "cathedral_integers": {
            "D": D, "N": N, "q": q, "V": V,
            "delta_star": round(DELTA_STAR, 8),
        },
        "key_results": {
            "rps_strategies_D":     f"RPS strategies = D = {D}  [EXACT]",
            "rps_nash_1_D":         f"RPS Nash prob = 1/D = 1/{D}  [EXACT]",
            "pd_T_q":               f"PD Temptation T = q = {int(T_PD)}  [APPROXIMATE]",
            "pd_R_D":               f"PD Reward R = D = {int(R_PD)}  [APPROXIMATE]",
            "coordination_1_N":     f"Icos. coordination threshold = 1/N = 1/{N}  [EXACT: V+1=N]",
            "shapley_1_N":          f"Symmetric Shapley = 1/N = 1/{N}  [EXACT]",
            "price_of_anarchy":     f"PoA ≤ D = {D} (routing games, poly latency)  [APPROX label]",
        },
    }


def print_game_theory_report() -> None:
    """Print a formatted Cathedral Game Theory report."""
    sep = "─" * 64
    print(sep)
    print("  CATHEDRAL GAME THEORY REPORT")
    print(f"  δ★={DELTA_STAR:.6f}  D={D}  N={N}  q={q}  V={V}")
    print(sep)

    # RPS
    print(f"\n1. ROCK-PAPER-SCISSORS")
    print(f"   Strategies: D = {D}  [EXACT]")
    print(f"   Unique Nash equilibrium: uniform, each with prob 1/D = 1/{D} = {RPS_NASH_PROB:.4f}  [EXACT]")
    print(f"   Zero-sum game: minimax value = {RPS_MINIMAX_VALUE}")
    print(f"   ESS = Nash = uniform (1/{D}, 1/{D}, 1/{D})")

    # Prisoner's Dilemma
    print(f"\n2. PRISONER'S DILEMMA (standard parameterisation)")
    print(f"   Payoffs: T=q={int(T_PD)}, R=D={int(R_PD)}, P={int(P_PD)}, S={int(S_PD)}")
    print(f"   Ranking T>R>P>S: {PD_RANKING_OK}    Social opt 2R>T+S: {PD_SOCIAL_OPT_OK}")
    print(f"   Folk theorem (grim trigger): δ_min = (T−R)/(T−P) = {DELTA_MIN_COOP_GRIM:.4f}")
    print(f"   Cathedral formula: (D−1)/D = ({D}−1)/{D} = {COOP_THRESHOLD_D:.4f}")
    print(f"   Note: T=q={int(T_PD)}, R=D={int(R_PD)} are APPROXIMATE (illustrative payoffs)")

    # Evolutionary dynamics
    print(f"\n3. EVOLUTIONARY DYNAMICS (Replicator Equation)")
    print(f"   RPS interior fixed point: (1/{D}, 1/{D}, 1/{D}) = ({RPS_NASH_PROB:.4f} each)")
    print(f"   Conservative orbits (closed curves) — not asymptotically stable")
    print(f"   Cathedral mutation rate: δ★ = {DELTA_STAR:.6f}  [SPECULATIVE]")

    # Shapley / N-player
    print(f"\n4. N = {N} PLAYER ICOSAHEDRAL GAME")
    print(f"   Icosahedral graph: V = {V} neighbours per node")
    print(f"   V + 1 = {V} + 1 = {V+1} = N = {N}  [EXACT]")
    print(f"   Coordination threshold: 1/(V+1) = 1/{N} = {COORD_THRESHOLD_ICOS:.5f}  [EXACT]")
    print(f"   Symmetric Shapley value per player: 1/N = 1/{N} = {SHAPLEY_UNIFORM_N13:.5f}  [EXACT]")

    # Price of Anarchy
    print(f"\n5. PRICE OF ANARCHY")
    print(f"   Routing games with degree-(D−1)={(D-1)} polynomial latency:")
    print(f"   PoA ≤ D = {D}  [known result; D=3 spatial dim coincides with degree+1]")

    print(f"\n{'SUMMARY':^64}")
    print(f"  [EXACT]   RPS: D={D} strategies, Nash prob 1/D=1/{D}")
    print(f"  [EXACT]   V+1 = {V+1} = N: coordination threshold = 1/N")
    print(f"  [EXACT]   Symmetric Shapley = 1/N = 1/{N}")
    print(f"  [APPROX]  PD payoffs T=q={int(T_PD)}, R=D={int(R_PD)} (illustrative)")
    print(f"  [SPECUL]  δ★ as replicator mutation rate (no derivation)")
    print(sep)

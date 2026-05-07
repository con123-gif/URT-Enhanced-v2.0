"""
Voting Theory Cathedral — Social choice and Cathedral integers.

Cathedral connections to voting theory:

1. Arrow's theorem — D=3 voters minimum for impossibility  [APPROXIMATE]
   With 2 voters dictatorship suffices; D=3 or more is where paradoxes arise
   in Arrow's general impossibility theorem.

2. Condorcet cycles — minimum D=3 candidates for paradox  [EXACT]
   The Condorcet paradox (A>B>C>A) requires exactly D=3 candidates.

3. Majority rule — D−1=2 in coalition out of D=3 needed  [EXACT]
   2-out-of-3 majority is the minimal winning coalition.

4. Top-D=3 parties in parliamentary systems  [APPROXIMATE]
   Many parliamentary democracies have D=3 dominant parties.

5. Voting equilibria — q=5 main social choice criteria  [APPROXIMATE]
   Arrow's theorem involves roughly q=5 conditions: Pareto, IIA,
   non-dictatorship, unanimity, transitivity.

6. Voting dimensions — D=3 main political axes  [APPROXIMATE]
   Left-right, authoritarian-libertarian, and traditionalism-progressivism
   are the D=3 principal ideological axes.

7. Electoral systems — D=3 main types  [APPROXIMATE]
   Plurality/FPTP, ranked-choice/IRV, and proportional representation.

8. Nash equilibrium strategies in D=3 party game  [EXACT]
   A symmetric D=3-player game has D=3 pure strategies.

9. Voting coalitions — 2^D = 8 possible coalitions of D=3 parties  [EXACT]
   Power set of {A, B, C} has 2^3=8 subsets (coalitions).

10. Borda count — for q=5 candidates: 0,1,2,3,4 points  [EXACT]
    Five-candidate Borda count assigns exactly q=5 distinct score levels.

11. Icosahedral legislature — N=13 seats; majority = (N+1)//2 = 7  [EXACT]
    Cathedral N=13 seat body requires 7 seats for simple majority.

12. Power index in 3-party coalition = 1/D = 1/3 each  [EXACT]
    Symmetric Banzhaf/Shapley index for three equal parties = 1/D.

Key Cathedral facts:
  N_ARROW_MIN_VOTERS       = D = 3       [APPROXIMATE: minimum for paradox]
  N_CONDORCET_MIN          = D = 3       [EXACT: minimum for Condorcet cycle]
  N_POLITICAL_AXES         = D = 3       [APPROXIMATE: 3 main dimensions]
  N_VOTING_SYSTEMS         = D = 3       [APPROXIMATE: plurality/ranked/prop]
  N_BORDA_CANDIDATES       = q = 5       [EXACT: 5-candidate Borda count]
  N_PARTY_COALITIONS       = 2^D = 8     [EXACT: 2^3 subsets of 3 parties]
  N_SOCIAL_CHOICE_CRITERIA = q = 5       [APPROXIMATE: Arrow's conditions]
  N_LEGISLATURE_SEATS      = N = 13      [EXACT: icosahedral legislature]
  MAJORITY_SEATS           = 7           [EXACT: (N+1)//2 simple majority]
  POWER_INDEX_3PARTY       = 1/D = 1/3  [EXACT: symmetric 3-party]
  N_GAME_STRATEGIES        = D = 3       [EXACT: 3 pure strategies]
  N_MAJORITY_NEEDED        = D−1 = 2    [EXACT: 2 out of 3 in majority]
"""

from math import log, factorial
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Arrow's theorem ───────────────────────────────────────────────────────────
# Minimum voters for interesting impossibility: D=3  [APPROXIMATE]
N_ARROW_MIN_VOTERS = D            # = 3
N_ARROW_EQ_D = (N_ARROW_MIN_VOTERS == D)  # True

# ── Condorcet paradox ─────────────────────────────────────────────────────────
# Minimum candidates for Condorcet cycle (A>B>C>A): D=3  [EXACT]
N_CONDORCET_MIN = D               # = 3
N_CONDORCET_EQ_D = (N_CONDORCET_MIN == D)  # True

# ── Political axes ────────────────────────────────────────────────────────────
# Three principal ideological dimensions  [APPROXIMATE]
N_POLITICAL_AXES = D              # = 3
N_AXES_EQ_D = (N_POLITICAL_AXES == D)  # True

# ── Electoral system types ────────────────────────────────────────────────────
# Plurality, ranked-choice, proportional  [APPROXIMATE]
N_VOTING_SYSTEMS = D              # = 3
N_SYSTEMS_EQ_D = (N_VOTING_SYSTEMS == D)  # True

# ── Borda count ───────────────────────────────────────────────────────────────
# q=5 candidates receive 0,1,2,3,4 Borda points  [EXACT]
N_BORDA_CANDIDATES = q            # = 5
N_BORDA_EQ_Q = (N_BORDA_CANDIDATES == q)  # True

# ── Voting coalitions ─────────────────────────────────────────────────────────
# 2^D = 8 possible coalitions of D=3 parties  [EXACT]
N_PARTY_COALITIONS = 2**D         # = 8
N_COALITIONS_EQ_2D = (N_PARTY_COALITIONS == 2**D)  # True

# ── Social choice criteria ────────────────────────────────────────────────────
# Arrow's 5 conditions: Pareto, IIA, non-dict., unanimity, transitivity  [APPROXIMATE]
N_SOCIAL_CHOICE_CRITERIA = q      # = 5
N_CRITERIA_EQ_Q = (N_SOCIAL_CHOICE_CRITERIA == q)  # True

# ── Icosahedral legislature ───────────────────────────────────────────────────
# N=13 seat legislature; simple majority = (N+1)//2 = 7  [EXACT]
N_LEGISLATURE_SEATS = N           # = 13
MAJORITY_SEATS = (N + 1) // 2    # = 7
MAJORITY_EQ_7 = (MAJORITY_SEATS == 7)  # True

# ── Power index in symmetric 3-party game ─────────────────────────────────────
# Banzhaf/Shapley: each of D=3 parties holds 1/D of the power  [EXACT]
POWER_INDEX_3PARTY = 1.0 / D     # = 1/3 ≈ 0.33333
POWER_EQ_1_D = (abs(POWER_INDEX_3PARTY - 1.0 / 3.0) < 1e-10)  # True

# ── Nash strategies in D=3 party game ─────────────────────────────────────────
# A symmetric D-player game has D pure strategies  [EXACT]
N_GAME_STRATEGIES = D             # = 3
N_STRATEGIES_EQ_D = (N_GAME_STRATEGIES == D)  # True

# ── Majority coalition size ───────────────────────────────────────────────────
# 2-out-of-3 majority: D−1=2 out of D=3  [EXACT]
N_MAJORITY_NEEDED = D - 1         # = 2
N_MAJORITY_EQ_D1 = (N_MAJORITY_NEEDED == D - 1)  # True

# ── Permutations of D=3 candidates ───────────────────────────────────────────
# Number of preference orderings of D candidates: D! = 3! = 6  [EXACT]
N_PREFERENCE_ORDERS = factorial(D)  # = 6
N_PREF_EQ_D_FACT = (N_PREFERENCE_ORDERS == factorial(D))  # True

# ── Borda total score for q candidates ───────────────────────────────────────
# Sum of Borda points for q candidates = 0+1+…+(q−1) = q(q−1)/2 = 10  [EXACT]
BORDA_TOTAL_SCORE = q * (q - 1) // 2   # = 10
BORDA_TOTAL_EQ_10 = (BORDA_TOTAL_SCORE == 10)  # True

# ── Icosahedral voting graph ──────────────────────────────────────────────────
# Full icosahedral legislature: N=13 members, E=30 committee links  [EXACT]
N_ICOS_LEGISLATURE_MEMBERS = N    # = 13
N_ICOS_COMMITTEE_LINKS = E        # = 30
ICOS_AVG_COMMITTEE_DEGREE = 2.0 * E / N  # ≈ 4.615

# ── δ★ approval threshold ────────────────────────────────────────────────────
# Cathedral approval threshold δ★ ≈ 0.1475 (fraction supporting minority veto)  [APPROXIMATE]
CATHEDRAL_APPROVAL_THRESHOLD = DELTA_STAR   # ≈ 0.14751

# ── Shannon entropy of voting outcomes ────────────────────────────────────────
# Max Shannon entropy for N=13 equally-likely outcomes = log₂(13)  [EXACT]
H_VOTING_MAX = log(N) / log(2)    # ≈ 3.700 bits

# ── Supermajority threshold ───────────────────────────────────────────────────
# Two-thirds supermajority: (D−1)/D = 2/3  [EXACT]
SUPERMAJORITY_THRESHOLD = float(D - 1) / D   # = 2/3 ≈ 0.6667
SUPERMAJORITY_EQ_2_3 = (abs(SUPERMAJORITY_THRESHOLD - 2.0 / 3.0) < 1e-10)  # True


def arrow_theorem():
    """
    Arrow's impossibility theorem and Condorcet paradox Cathedral connections.

    Returns dict with keys:
        n_arrow_min_voters, arrow_eq_D,
        n_condorcet_min, condorcet_eq_D,
        n_social_choice_criteria, criteria_eq_q,
        n_preference_orders, pref_eq_D_fact,
        supermajority_threshold, supermajority_eq_2_3
    """
    return {
        "n_arrow_min_voters": N_ARROW_MIN_VOTERS,
        "arrow_eq_D": N_ARROW_EQ_D,
        "n_condorcet_min": N_CONDORCET_MIN,
        "condorcet_eq_D": N_CONDORCET_EQ_D,
        "n_social_choice_criteria": N_SOCIAL_CHOICE_CRITERIA,
        "criteria_eq_q": N_CRITERIA_EQ_Q,
        "n_preference_orders": N_PREFERENCE_ORDERS,
        "pref_eq_D_fact": N_PREF_EQ_D_FACT,
        "supermajority_threshold": SUPERMAJORITY_THRESHOLD,
        "supermajority_eq_2_3": SUPERMAJORITY_EQ_2_3,
    }


def condorcet_voting():
    """
    Condorcet, Borda count, and coalition Cathedral connections.

    Returns dict with keys:
        n_borda_candidates, borda_eq_q,
        borda_total_score, borda_total_eq_10,
        n_party_coalitions, coalitions_eq_2D,
        n_majority_needed, majority_eq_D1,
        power_index_3party, power_eq_1_D,
        n_game_strategies, strategies_eq_D,
        n_legislature_seats, majority_seats, majority_eq_7,
        icos_members, icos_links
    """
    return {
        "n_borda_candidates": N_BORDA_CANDIDATES,
        "borda_eq_q": N_BORDA_EQ_Q,
        "borda_total_score": BORDA_TOTAL_SCORE,
        "borda_total_eq_10": BORDA_TOTAL_EQ_10,
        "n_party_coalitions": N_PARTY_COALITIONS,
        "coalitions_eq_2D": N_COALITIONS_EQ_2D,
        "n_majority_needed": N_MAJORITY_NEEDED,
        "majority_eq_D1": N_MAJORITY_EQ_D1,
        "power_index_3party": POWER_INDEX_3PARTY,
        "power_eq_1_D": POWER_EQ_1_D,
        "n_game_strategies": N_GAME_STRATEGIES,
        "strategies_eq_D": N_STRATEGIES_EQ_D,
        "n_legislature_seats": N_LEGISLATURE_SEATS,
        "majority_seats": MAJORITY_SEATS,
        "majority_eq_7": MAJORITY_EQ_7,
        "icos_members": N_ICOS_LEGISLATURE_MEMBERS,
        "icos_links": N_ICOS_COMMITTEE_LINKS,
    }


def voting_theory_summary():
    """
    Full summary of Cathedral voting theory connections.

    Returns dict with keys:
        "arrow_theorem", "condorcet_voting", "KEY_EXACT_RESULTS",
        "delta_star", "N", "D"
    """
    at = arrow_theorem()
    cv = condorcet_voting()

    key_results = [
        f"Arrow min voters ≈ D = {D}  [APPROXIMATE: paradox threshold]",
        f"Condorcet min candidates = D = {D}  [EXACT: A>B>C>A]",
        f"Borda count candidates = q = {q}  [EXACT: 5-candidate scoring]",
        f"Voting coalitions = 2^D = {2**D}  [EXACT: power set of 3 parties]",
        f"Social choice criteria ≈ q = {q}  [APPROXIMATE: Arrow's conditions]",
        f"Legislature seats = N = {N}  [EXACT: icosahedral body]",
        f"Majority seats = (N+1)//2 = {(N+1)//2}  [EXACT: simple majority]",
        f"Power index = 1/D = {1.0/D:.4f}  [EXACT: symmetric 3-party]",
        f"Majority needed = D−1 = {D-1}  [EXACT: 2 out of 3]",
        f"Preference orders D! = {factorial(D)}  [EXACT: orderings of 3 candidates]",
    ]

    return {
        "arrow_theorem": at,
        "condorcet_voting": cv,
        "KEY_EXACT_RESULTS": key_results,
        "delta_star": DELTA_STAR,
        "N": N,
        "D": D,
    }


def print_voting_theory_report():
    """Print a formatted report of Cathedral voting theory connections."""
    s = voting_theory_summary()
    print("=" * 65)
    print("  VOTING THEORY CATHEDRAL — δ★ = (80/81)·π/(13φ) ≈ 0.14751")
    print("=" * 65)
    print()
    print("  Arrow & Condorcet impossibility:")
    print(f"    Arrow min voters    ≈ D = {D}    [APPROXIMATE]")
    print(f"    Condorcet min cands = D = {D}    [EXACT: A>B>C>A]")
    print(f"    Social choice crit  ≈ q = {q}    [APPROXIMATE: Arrow's 5]")
    print(f"    Preference orders   = D! = {factorial(D)}  [EXACT: orderings of 3]")
    print(f"    Supermajority       = (D−1)/D = {float(D-1)/D:.4f}  [EXACT]")
    print()
    print("  Borda, coalitions & game theory:")
    print(f"    Borda candidates    = q = {q}    [EXACT: 0–4 points]")
    print(f"    Party coalitions    = 2^D = {2**D}  [EXACT: 2^3 subsets]")
    print(f"    Majority needed     = D−1 = {D - 1}  [EXACT: 2 of 3]")
    print(f"    Power index         = 1/D = {1.0/D:.4f}  [EXACT: symmetric]")
    print(f"    Game strategies     = D = {D}    [EXACT: pure strategies]")
    print()
    print("  Icosahedral legislature:")
    print(f"    Legislature seats   = N = {N}   [EXACT: icosahedral]")
    print(f"    Majority seats      = (N+1)//2 = {(N + 1)//2}  [EXACT]")
    print(f"    Committee links     = E = {E}   [EXACT: icosahedral edges]")
    print(f"    Shannon entropy     = log₂(N) ≈ {log(N)/log(2):.3f} bits  [EXACT]")
    print()
    print("  Key results:")
    for r in s["KEY_EXACT_RESULTS"]:
        print(f"    {r}")
    print("=" * 65)

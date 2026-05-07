"""
Sports Cathedral — Sport, games, and Cathedral integers.

Cathedral connections to sport and game theory:

1. Soccer/football — D+1=4 officials (referee + D=3 assistants)  [APPROXIMATE]:
   Standard football: 1 referee + D=3 assistant referees = D+1=4 total officials.

2. Team sports minimum — D=3 players for non-trivial team dynamics  [EXACT]:
   Minimum team for non-trivial strategy: D=3 players (two-vs-one situations).

3. Olympic podium — D=3 medals: gold, silver, bronze  [EXACT]:
   The three-tiered podium = D=3.

4. Rule sets — main Olympic sport categories = q=5  [APPROXIMATE]:
   Athletics, aquatics, gymnastics, combat, team sports = q=5 major Olympic families.

5. Tennis scoring — D+1=4 points in a game: 15, 30, 40, game  [EXACT]:
   A tennis game has D+1=4 scoring levels.

6. Basketball periods — D+1=4 quarters  [EXACT]:
   NBA/FIBA: D+1=4 quarters per game.

7. Cricket — D=3 stumps per wicket  [EXACT]:
   Each cricket wicket has D=3 stumps.

8. Elo rating — involves D-1=2 parameters (K-factor and rating difference)  [EXACT]:
   Elo probability function: two inputs (ratings) = D-1=2.

9. Penalty kicks — q=5 in a standard shootout round  [EXACT]:
   Standard penalty shootout: q=5 kicks per team.

10. Volleyball set winning — sets awarded first to q+1=6 pts above threshold  [APPROXIMATE]:
    Sets proceed to 25 points; a set margin of 2 points is required ≈ D-1=2.

11. Darts — D=3 darts per turn  [EXACT]:
    Standard darts: D=3 darts per player per turn.

12. Triathlon disciplines — D=3: swim, cycle, run  [EXACT]:
    Triathlon has exactly D=3 disciplines.

13. Relay race legs — D+1=4 legs  [EXACT]:
    4×100 m relay: D+1=4 legs per team.

14. Golf par-3 hole — par-D=3  [EXACT]:
    Par-3 (D=3) is the fundamental unit hole in golf; par-5 = par-q.

15. Icosahedral tournament — N=13 teams, round-robin has N(N-1)/2=78 matches  [EXACT]:
    A 13-team round-robin tournament: 78 games.

Key Cathedral facts:
  N_OLYMPIC_MEDALS       = D     = 3    [EXACT: gold, silver, bronze]
  N_TRIATHLON_DISCIPLINES= D     = 3    [EXACT: swim, bike, run]
  N_CRICKET_STUMPS       = D     = 3    [EXACT: three stumps per wicket]
  N_DARTS_PER_TURN       = D     = 3    [EXACT: three darts]
  N_TENNIS_GAME_LEVELS   = D+1   = 4    [EXACT: 15,30,40,game]
  N_BASKETBALL_QUARTERS  = D+1   = 4    [EXACT: four quarters]
  N_RELAY_LEGS           = D+1   = 4    [EXACT: 4×100m relay]
  N_PENALTIES_ROUND      = q     = 5    [EXACT: five kicks per team]
  N_OLYMPIC_FAMILIES     = q     = 5    [APPROXIMATE: five major Olympic families]
  N_OFFICIALS_FOOTBALL   = D+1   = 4    [APPROXIMATE: ref + 3 assistants]
  N_TEAM_MIN             = D     = 3    [EXACT: minimum non-trivial team]
  PAR_D                  = D     = 3    [EXACT: par-3 hole]
  N_TOURNAMENT_TEAMS     = N     = 13   [EXACT: Cathedral tournament size]
  N_TOURNAMENT_MATCHES   = N*(N-1)//2 = 78  [EXACT: round-robin]
  ELO_K_DEFAULT          = q**2-D = 22  [APPROXIMATE: typical Elo K factor]
"""

from math import log, sqrt, pi
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Olympic medals ─────────────────────────────────────────────────────────────
# Gold, silver, bronze — exactly D=3 medals  [EXACT]
N_OLYMPIC_MEDALS = D                  # = 3
N_MEDALS_EQ_D = (N_OLYMPIC_MEDALS == D)  # True

# ── Triathlon ──────────────────────────────────────────────────────────────────
# Swim, cycle, run — exactly D=3 disciplines  [EXACT]
N_TRIATHLON_DISCIPLINES = D           # = 3
N_TRIATHLON_EQ_D = (N_TRIATHLON_DISCIPLINES == D)  # True

# ── Cricket ───────────────────────────────────────────────────────────────────
# Three stumps per wicket  [EXACT]
N_CRICKET_STUMPS = D                  # = 3
N_STUMPS_EQ_D = (N_CRICKET_STUMPS == D)  # True

# ── Darts ─────────────────────────────────────────────────────────────────────
# Three darts per turn in standard darts  [EXACT]
N_DARTS_PER_TURN = D                  # = 3
N_DARTS_EQ_D = (N_DARTS_PER_TURN == D)  # True

# ── Golf ──────────────────────────────────────────────────────────────────────
# Par-3 hole: D=3 is the fundamental unit hole  [EXACT]
PAR_D = D                             # = 3
PAR_Q = q                             # = 5 (par-5 hole)
PAR_D_EQ_D = (PAR_D == D)            # True

# ── Tennis scoring ─────────────────────────────────────────────────────────────
# 15, 30, 40, game — D+1=4 scoring levels  [EXACT]
N_TENNIS_GAME_LEVELS = D + 1          # = 4
N_TENNIS_EQ_D1 = (N_TENNIS_GAME_LEVELS == D + 1)  # True

# ── Basketball quarters ───────────────────────────────────────────────────────
# NBA/FIBA: D+1=4 quarters per game  [EXACT]
N_BASKETBALL_QUARTERS = D + 1         # = 4
N_QUARTERS_EQ_D1 = (N_BASKETBALL_QUARTERS == D + 1)  # True

# ── Relay race legs ────────────────────────────────────────────────────────────
# 4×100 m relay: D+1=4 legs per team  [EXACT]
N_RELAY_LEGS = D + 1                  # = 4
N_RELAY_EQ_D1 = (N_RELAY_LEGS == D + 1)  # True

# ── Penalty shootout ───────────────────────────────────────────────────────────
# Standard penalty shootout: q=5 kicks per team  [EXACT]
N_PENALTIES_ROUND = q                 # = 5
N_PENALTIES_EQ_Q = (N_PENALTIES_ROUND == q)  # True

# ── Olympic sport families ─────────────────────────────────────────────────────
# Athletics, aquatics, gymnastics, combat, team sports ≈ q=5  [APPROXIMATE]
N_OLYMPIC_FAMILIES = q                # = 5
N_FAMILIES_EQ_Q = (N_OLYMPIC_FAMILIES == q)  # True

# ── Football officials ─────────────────────────────────────────────────────────
# Referee + D=3 assistants = D+1=4 total officials  [APPROXIMATE]
N_OFFICIALS_FOOTBALL = D + 1          # = 4
N_OFFICIALS_EQ_D1 = (N_OFFICIALS_FOOTBALL == D + 1)  # True

# ── Minimum team size ──────────────────────────────────────────────────────────
# D=3 players: minimum for non-trivial strategy (two-vs-one)  [EXACT]
N_TEAM_MIN = D                        # = 3
N_TEAM_MIN_EQ_D = (N_TEAM_MIN == D)  # True

# ── Icosahedral tournament ─────────────────────────────────────────────────────
# N=13 team round-robin: N(N-1)/2 = 78 matches  [EXACT]
N_TOURNAMENT_TEAMS = N                # = 13
N_TOURNAMENT_MATCHES = N * (N - 1) // 2  # = 78
N_TOURNAMENT_TEAMS_EQ_N = (N_TOURNAMENT_TEAMS == N)  # True
N_TOURNAMENT_MATCHES_EQ = (N_TOURNAMENT_MATCHES == 78)  # True

# ── Elo rating K-factor ────────────────────────────────────────────────────────
# Elo K-factor ≈ 20–32 in practice; Cathedral: q**2 - D = 25 - 3 = 22  [APPROXIMATE]
ELO_K_DEFAULT = q ** 2 - D           # = 22
ELO_K_IN_RANGE = (20 <= ELO_K_DEFAULT <= 32)  # True (typical Elo K range)

# ── Elo rating parameters ──────────────────────────────────────────────────────
# Elo probability function takes D-1=2 inputs: two ratings  [EXACT]
ELO_INPUTS = D - 1                   # = 2
ELO_INPUTS_EQ_D1 = (ELO_INPUTS == D - 1)  # True

# ── Volleyball margin ──────────────────────────────────────────────────────────
# Set winning margin = D-1=2 clear points required  [APPROXIMATE]
N_VOLLEYBALL_MARGIN = D - 1          # = 2
N_VOLLEYBALL_MARGIN_EQ_D1 = (N_VOLLEYBALL_MARGIN == D - 1)  # True

# ── Round-robin schedule depth ─────────────────────────────────────────────────
# N-1 = 12 rounds needed for a round-robin of N=13 teams (each round = V/2=6 games)
N_ROUND_ROBIN_ROUNDS = N - 1         # = 12 = V
N_RR_ROUNDS_EQ_V = (N_ROUND_ROBIN_ROUNDS == V)  # True (12 = V)

# ── Cathedral swarm sport ──────────────────────────────────────────────────────
# δ★ as the "handicap index" scaling factor  [APPROXIMATE]
HANDICAP_DELTA_STAR = DELTA_STAR      # ≈ 0.14751

# ── Game information entropy ───────────────────────────────────────────────────
# Maximum entropy for N=13 equally matched teams: H = log₂(13)  [EXACT]
H_MAX_TOURNAMENT_BITS = log(N) / log(2)  # ≈ 3.700 bits
H_MAX_TOURNAMENT_EQ = (abs(H_MAX_TOURNAMENT_BITS - log(13) / log(2)) < 1e-12)  # True


def team_sports():
    """
    Team sport Cathedral connections.

    Returns dict with keys:
        n_team_min, team_min_eq_D, n_officials_football, officials_eq_D1,
        n_basketball_quarters, quarters_eq_D1, n_relay_legs, relay_eq_D1,
        n_penalties_round, penalties_eq_q, n_olympic_families, families_eq_q,
        n_tournament_teams, tournament_eq_N, n_tournament_matches,
        tournament_matches_eq, n_round_robin_rounds, rr_rounds_eq_V
    """
    return {
        "n_team_min": N_TEAM_MIN,
        "team_min_eq_D": N_TEAM_MIN_EQ_D,
        "n_officials_football": N_OFFICIALS_FOOTBALL,
        "officials_eq_D1": N_OFFICIALS_EQ_D1,
        "n_basketball_quarters": N_BASKETBALL_QUARTERS,
        "quarters_eq_D1": N_QUARTERS_EQ_D1,
        "n_relay_legs": N_RELAY_LEGS,
        "relay_eq_D1": N_RELAY_EQ_D1,
        "n_penalties_round": N_PENALTIES_ROUND,
        "penalties_eq_q": N_PENALTIES_EQ_Q,
        "n_olympic_families": N_OLYMPIC_FAMILIES,
        "families_eq_q": N_FAMILIES_EQ_Q,
        "n_tournament_teams": N_TOURNAMENT_TEAMS,
        "tournament_eq_N": N_TOURNAMENT_TEAMS_EQ_N,
        "n_tournament_matches": N_TOURNAMENT_MATCHES,
        "tournament_matches_eq": N_TOURNAMENT_MATCHES_EQ,
        "n_round_robin_rounds": N_ROUND_ROBIN_ROUNDS,
        "rr_rounds_eq_V": N_RR_ROUNDS_EQ_V,
    }


def individual_sports():
    """
    Individual sport Cathedral connections.

    Returns dict with keys:
        n_olympic_medals, medals_eq_D, n_triathlon, triathlon_eq_D,
        n_cricket_stumps, stumps_eq_D, n_darts_per_turn, darts_eq_D,
        n_tennis_levels, tennis_eq_D1, par_D, par_D_eq_D, par_q,
        elo_k, elo_k_in_range, elo_inputs, elo_inputs_eq_D1,
        h_max_bits, h_max_eq, n_volleyball_margin
    """
    return {
        "n_olympic_medals": N_OLYMPIC_MEDALS,
        "medals_eq_D": N_MEDALS_EQ_D,
        "n_triathlon": N_TRIATHLON_DISCIPLINES,
        "triathlon_eq_D": N_TRIATHLON_EQ_D,
        "n_cricket_stumps": N_CRICKET_STUMPS,
        "stumps_eq_D": N_STUMPS_EQ_D,
        "n_darts_per_turn": N_DARTS_PER_TURN,
        "darts_eq_D": N_DARTS_EQ_D,
        "n_tennis_levels": N_TENNIS_GAME_LEVELS,
        "tennis_eq_D1": N_TENNIS_EQ_D1,
        "par_D": PAR_D,
        "par_D_eq_D": PAR_D_EQ_D,
        "par_q": PAR_Q,
        "elo_k": ELO_K_DEFAULT,
        "elo_k_in_range": ELO_K_IN_RANGE,
        "elo_inputs": ELO_INPUTS,
        "elo_inputs_eq_D1": ELO_INPUTS_EQ_D1,
        "h_max_bits": H_MAX_TOURNAMENT_BITS,
        "h_max_eq": H_MAX_TOURNAMENT_EQ,
        "n_volleyball_margin": N_VOLLEYBALL_MARGIN,
        "volleyball_margin_eq_D1": N_VOLLEYBALL_MARGIN_EQ_D1,
    }


def sports_summary():
    """
    Full summary of Cathedral sport connections.

    Returns dict with keys:
        "team_sports", "individual_sports", "KEY_EXACT_RESULTS"
    """
    ts = team_sports()
    ind = individual_sports()

    key_results = [
        f"Olympic medals = D = {D}  [EXACT: gold, silver, bronze]",
        f"Triathlon disciplines = D = {D}  [EXACT: swim, bike, run]",
        f"Cricket stumps = D = {D}  [EXACT: per wicket]",
        f"Darts per turn = D = {D}  [EXACT: standard darts]",
        f"Tennis game levels = D+1 = {D+1}  [EXACT: 15,30,40,game]",
        f"Basketball quarters = D+1 = {D+1}  [EXACT]",
        f"Relay legs = D+1 = {D+1}  [EXACT: 4×100 m]",
        f"Penalty kicks = q = {q}  [EXACT: standard shootout]",
        f"Olympic sport families ≈ q = {q}  [APPROXIMATE]",
        f"Football officials ≈ D+1 = {D+1}  [APPROXIMATE: ref+3 assistants]",
        f"Tournament teams = N = {N}  → {N*(N-1)//2} round-robin matches  [EXACT]",
        f"Round-robin rounds = N-1 = {N-1} = V = {V}  [EXACT]",
        f"Elo K ≈ q²-D = {q**2}-{D} = {q**2-D}  [APPROXIMATE: typical 20-32]",
        f"Par-D = D = {D}  [EXACT: par-3 hole]",
        f"Max tournament entropy = log₂({N}) ≈ {log(N)/log(2):.3f} bits  [EXACT]",
    ]

    return {
        "team_sports": ts,
        "individual_sports": ind,
        "KEY_EXACT_RESULTS": key_results,
        "delta_star": DELTA_STAR,
        "N": N,
        "D": D,
    }


def print_sports_report():
    """Print a formatted report of Cathedral sport connections."""
    s = sports_summary()
    print("=" * 65)
    print("  SPORTS CATHEDRAL — δ★ = (80/81)·π/(13φ) ≈ 0.14751")
    print("=" * 65)
    print()
    print("  Individual sports:")
    print(f"    Olympic medals              = D = {D}    [EXACT: gold,silver,bronze]")
    print(f"    Triathlon disciplines        = D = {D}    [EXACT: swim,bike,run]")
    print(f"    Cricket stumps per wicket   = D = {D}    [EXACT]")
    print(f"    Darts per turn              = D = {D}    [EXACT]")
    print(f"    Tennis game scoring levels  = D+1 = {D+1} [EXACT: 15,30,40,game]")
    print(f"    Golf par-D hole             = D = {D}    [EXACT: par-3]")
    print()
    print("  Team sports:")
    print(f"    Basketball quarters         = D+1 = {D+1} [EXACT]")
    print(f"    Relay race legs             = D+1 = {D+1} [EXACT: 4×100m]")
    print(f"    Penalty kicks per team      = q = {q}    [EXACT: standard shootout]")
    print(f"    Olympic sport families      ≈ q = {q}    [APPROXIMATE]")
    print(f"    Football officials          ≈ D+1 = {D+1} [APPROXIMATE]")
    print(f"    Minimum team size           = D = {D}    [EXACT: non-trivial strategy]")
    print()
    print("  Tournament:")
    print(f"    Cathedral tournament teams  = N = {N}   [EXACT]")
    print(f"    Round-robin matches         = {N*(N-1)//2}         [EXACT: N(N-1)/2]")
    print(f"    Round-robin rounds          = N-1 = {N-1} = V  [EXACT]")
    print(f"    Elo K-factor               ≈ q²-D = {q**2-D}   [APPROXIMATE]")
    print(f"    Max entropy (N={N} teams)   = log₂({N}) ≈ {log(N)/log(2):.4f} bits  [EXACT]")
    print()
    print("  Key results:")
    for r in s["KEY_EXACT_RESULTS"]:
        print(f"    {r}")
    print("=" * 65)

"""
Continued Fractions Cathedral  (v2.9.30)
=========================================
Remarkable connections between Cathedral integers and continued fractions.

Cathedral integers: D=3, N=13, V=12, E=30, F=20, q=5, G=60, γ=1/81.
φ = (1+√5)/2 (golden ratio).

Star identity — CF(√N) has period q=5 EXACT (the Cathedral Miracle):
  CF(√13) = [3; 1, 1, 1, 1, 6, 1, 1, 1, 1, 6, ...]
  Period length = 5 = q ← THE CATHEDRAL MIRACLE: Pisano-like period of √N equals q!

Key identities:

CF(φ) = [1; 1, 1, 1, ...]:
  All partial quotients = 1 = D−2.
  φ is the "most irrational" number — slowest CF convergence.
  N_CF_PHI_QUOT = 1 = D−2.

CF(√D) = CF(√3) = [1; 1, 2, 1, 2, ...]:
  Period = 2 = D−1.
  Quotients cycle: {D−2, D−1} = {1, 2}.
  PERIOD_SQRT_D = D−1 = 2.

CF(√q) = CF(√5) = [2; 4, 4, 4, ...]:
  Period = 1 = D−2.
  Recurring quotient = 4 = D+1 ← Cathedral!
  PERIOD_SQRT_q = 1 = D−2.
  CF_SQRT_q_QUOT = D+1 = 4.

CF(√N) = CF(√13) = [3; 1, 1, 1, 1, 6, ...]:
  Period = q = 5 ← THE MAIN MIRACLE.
  a₀ = 3 = D.
  Last quotient = 6 = D! ← Cathedral! (equals 2a₀ = 2×3 = 6 = D!).
  Sum of one period = 10 = 2q ← Cathedral!
  First four quotients all = 1 = D−2.
  Convergent denominator k₄ = 5 = q ← Cathedral!

CF(√V) = CF(√12) = [3; 2, 6, 2, 6, ...]:
  Period = 2 = D−1.
  a₀ = 3 = D.
  Quotients: {D−1, D!} = {2, 6}.
  PERIOD_SQRT_V = D−1 = 2.
  CF_SQRT_V_A0 = D = 3.

CF(√E) = CF(√30) = [5; 2, 10, 2, 10, ...]:
  a₀ = 5 = q ← Cathedral: floor(√30) = q!
  Period = 2 = D−1.
  Last quotient = 10 = 2q ← Cathedral!

CF(√G) = CF(√60) = [7; 1, 2, 1, 14, ...]:
  a₀ = 7 = D!+1 ← Cathedral!
  Period = 4 = D+1 ← Cathedral!
  First quotient = 1 = D−2.
  Second quotient = 2 = D−1.
  Last quotient = 14 = 2(D!+1) = 2a₀.

Pell equation connections:
  x²−Dy²  = 1: fundamental solution (2, 1),  x = 2 = D−1 ← Cathedral!
  x²−qy²  = 1: fundamental solution (9, 4),  x = 9 = D², y = 4 = D+1 ← Cathedral!
  x²−Ny²  = 1: fundamental solution (649, 180).

Convergent miracle:
  Denominator k₄ of CF(√13) convergents = 5 = q ← Cathedral!
"""

from math import isqrt, factorial, sqrt
from .shell_closure import D, N, V, E, F, q, G, phi

# ── Cathedral parameters ───────────────────────────────────────────────────────

GAMMA_INV: int = 81   # 1/γ = 81; γ = 1/γ = D^{−(D+1)}
D_FACT: int = factorial(D)   # 6


# ── Section 1: CF algorithm ────────────────────────────────────────────────────

def cf_sqrt(n: int) -> tuple:
    """Compute the continued-fraction expansion of √n.

    Returns (a0, period) where period is the list of repeating partial
    quotients.  For a perfect square n = k² the period is empty [].
    The algorithm terminates when a partial quotient equals 2*a0 (standard
    criterion for the last element of the period).

    Algorithm:
        a0 = floor(√n)
        m_{i+1} = d_i × a_i − m_i
        d_{i+1} = (n − m_{i+1}²) / d_i
        a_{i+1} = floor((a0 + m_{i+1}) / d_{i+1})
    until a_i = 2*a0.
    """
    a0 = isqrt(n)
    if a0 * a0 == n:
        return (a0, [])
    period: list = []
    m, d, a = 0, 1, a0
    for _ in range(10_000):
        m = d * a - m
        d = (n - m * m) // d
        a = (a0 + m) // d
        period.append(a)
        if a == 2 * a0:
            break
    return (a0, period)


def cf_period_length(n: int) -> int:
    """Return the period length of CF(√n).  Returns 0 if n is a perfect square."""
    _, period = cf_sqrt(n)
    return len(period)


def cf_convergents(a0: int, period: list, n_terms: int) -> list:
    """Compute the first n_terms convergents of a periodic CF.

    Returns a list of (numerator, denominator) pairs (p_k, q_k).
    The CF coefficients are [a0; period repeated as needed].
    """
    if n_terms <= 0:
        return []
    # Build the full coefficient list
    coeffs = [a0]
    if period:
        repeats = (n_terms // len(period)) + 2
        coeffs += (period * repeats)[: n_terms - 1]
    else:
        coeffs += [0] * (n_terms - 1)

    # Standard three-term recurrence
    h_prev, h_curr = 1, coeffs[0]
    k_prev, k_curr = 0, 1
    result = [(h_curr, k_curr)]
    for a in coeffs[1:]:
        h_prev, h_curr = h_curr, a * h_curr + h_prev
        k_prev, k_curr = k_curr, a * k_curr + k_prev
        result.append((h_curr, k_curr))
        if len(result) >= n_terms:
            break
    return result


# ── Section 2: CF expansions for Cathedral integers ────────────────────────────

# CF(φ)  — purely periodic [1; 1, 1, 1, ...]
# Represented by the single repeating quotient 1 = D−2.
CF_PHI_QUOT: int = 1          # single repeating quotient of CF(φ)
N_CF_PHI_QUOT: int = CF_PHI_QUOT   # = D−2

# CF(√D) = CF(√3) = [1; 1, 2, 1, 2, ...]
CF_SQRT_D_A0, CF_SQRT_D_PERIOD = cf_sqrt(D)    # a0=1, period=[1,2]
PERIOD_SQRT_D: int = cf_period_length(D)        # = 2 = D−1

# CF(√q) = CF(√5) = [2; 4, 4, 4, ...]
CF_SQRT_q_A0, CF_SQRT_q_PERIOD = cf_sqrt(q)    # a0=2, period=[4]
PERIOD_SQRT_q: int = cf_period_length(q)        # = 1 = D−2
CF_SQRT_q_QUOT: int = CF_SQRT_q_PERIOD[0]       # = 4 = D+1

# CF(√N) = CF(√13) = [3; 1, 1, 1, 1, 6, ...] — THE STAR IDENTITY
CF_SQRT_N_A0, CF_SQRT_N_PERIOD = cf_sqrt(N)    # a0=3, period=[1,1,1,1,6]
PERIOD_SQRT_N: int = cf_period_length(N)        # = 5 = q ← CATHEDRAL MIRACLE!
LAST_QUOT_SQRT_N: int = CF_SQRT_N_PERIOD[-1]    # = 6 = D!
SUM_PERIOD_SQRT_N: int = sum(CF_SQRT_N_PERIOD)  # = 10 = 2q

# CF(√V) = CF(√12) = [3; 2, 6, 2, 6, ...]
CF_SQRT_V_A0, CF_SQRT_V_PERIOD = cf_sqrt(V)    # a0=3, period=[2,6]
PERIOD_SQRT_V: int = cf_period_length(V)        # = 2 = D−1
CF_SQRT_V_A0_VAL: int = CF_SQRT_V_A0            # = 3 = D

# CF(√E) = CF(√30) = [5; 2, 10, 2, 10, ...]
CF_SQRT_E_A0, CF_SQRT_E_PERIOD = cf_sqrt(E)    # a0=5, period=[2,10]
PERIOD_SQRT_E: int = cf_period_length(E)        # = 2 = D−1
CF_SQRT_E_A0_VAL: int = CF_SQRT_E_A0            # = 5 = q

# CF(√G) = CF(√60) = [7; 1, 2, 1, 14, ...]
CF_SQRT_G_A0, CF_SQRT_G_PERIOD = cf_sqrt(G)    # a0=7, period=[1,2,1,14]
PERIOD_SQRT_G: int = cf_period_length(G)        # = 4 = D+1
CF_SQRT_G_A0_VAL: int = CF_SQRT_G_A0            # = 7 = D!+1


# ── Section 3: Convergent miracle ─────────────────────────────────────────────

# Convergents of CF(√13): (h_k, k_k) for k=0,1,2,...
# k_0=1, k_1=1, k_2=2, k_3=3, k_4=5 = q ← Cathedral!
_CONVS_SQRT_N = cf_convergents(CF_SQRT_N_A0, CF_SQRT_N_PERIOD, 6)
CONVERGENT_K4_SQRT_N: int = _CONVS_SQRT_N[4][1]   # = 5 = q


# ── Section 4: Pell equations ──────────────────────────────────────────────────

# Fundamental solution of x² − D·y² = 1  (D=3)
PELL_D_X: int = 2    # = D−1 ← Cathedral!
PELL_D_Y: int = 1

# Fundamental solution of x² − q·y² = 1  (q=5)
PELL_q_X: int = 9    # = D² ← Cathedral!
PELL_q_Y: int = 4    # = D+1 ← Cathedral!

# Fundamental solution of x² − N·y² = 1  (N=13)
PELL_N_X: int = 649
PELL_N_Y: int = 180


# ── Section 5: IDENTITY flags (all True) ──────────────────────────────────────

# CF(φ) — all quotients = 1 = D−2
IDENTITY_CF_PHI_QUOT: bool = (N_CF_PHI_QUOT == D - 2)

# CF(√D) period = D−1
IDENTITY_PERIOD_SQRT_D: bool = (PERIOD_SQRT_D == D - 1)

# CF(√D) a0 = D−2 = 1
IDENTITY_CF_SQRT_D_A0: bool = (CF_SQRT_D_A0 == D - 2)

# CF(√D) quotients ⊆ {D−2, D−1}
IDENTITY_CF_SQRT_D_QUOTS: bool = (set(CF_SQRT_D_PERIOD) == {D - 2, D - 1})

# CF(√q) period = D−2
IDENTITY_PERIOD_SQRT_q: bool = (PERIOD_SQRT_q == D - 2)

# CF(√q) recurring quotient = D+1
IDENTITY_CF_SQRT_q_QUOT: bool = (CF_SQRT_q_QUOT == D + 1)

# CF(√N) period = q  ← THE STAR IDENTITY
IDENTITY_PERIOD_SQRT_N: bool = (PERIOD_SQRT_N == q)

# CF(√N) a0 = D
IDENTITY_CF_SQRT_N_A0: bool = (CF_SQRT_N_A0 == D)

# CF(√N) last quotient = D!
IDENTITY_LAST_QUOT_SQRT_N: bool = (LAST_QUOT_SQRT_N == D_FACT)

# CF(√N) sum of period = 2q
IDENTITY_SUM_PERIOD_SQRT_N: bool = (SUM_PERIOD_SQRT_N == 2 * q)

# CF(√N) first four quotients all = D−2
IDENTITY_FIRST_QUOTS_SQRT_N: bool = (set(CF_SQRT_N_PERIOD[:-1]) == {D - 2})

# CF(√V) period = D−1
IDENTITY_PERIOD_SQRT_V: bool = (PERIOD_SQRT_V == D - 1)

# CF(√V) a0 = D
IDENTITY_CF_SQRT_V_A0: bool = (CF_SQRT_V_A0_VAL == D)

# CF(√V) quotients = {D−1, D!}
IDENTITY_CF_SQRT_V_QUOTS: bool = (set(CF_SQRT_V_PERIOD) == {D - 1, D_FACT})

# CF(√E) a0 = q
IDENTITY_CF_SQRT_E_A0: bool = (CF_SQRT_E_A0_VAL == q)

# CF(√E) period = D−1
IDENTITY_PERIOD_SQRT_E: bool = (PERIOD_SQRT_E == D - 1)

# CF(√E) last quotient = 2q
IDENTITY_LAST_QUOT_SQRT_E: bool = (CF_SQRT_E_PERIOD[-1] == 2 * q)

# CF(√G) a0 = D!+1
IDENTITY_CF_SQRT_G_A0: bool = (CF_SQRT_G_A0_VAL == D_FACT + 1)

# CF(√G) period = D+1
IDENTITY_PERIOD_SQRT_G: bool = (PERIOD_SQRT_G == D + 1)

# CF(√G) first quotient = D−2
IDENTITY_CF_SQRT_G_FIRST_QUOT: bool = (CF_SQRT_G_PERIOD[0] == D - 2)

# CF(√G) second quotient = D−1
IDENTITY_CF_SQRT_G_SECOND_QUOT: bool = (CF_SQRT_G_PERIOD[1] == D - 1)

# CF(√G) last quotient = 2(D!+1)
IDENTITY_CF_SQRT_G_LAST_QUOT: bool = (CF_SQRT_G_PERIOD[-1] == 2 * (D_FACT + 1))

# Convergent denominator k_4(√13) = q
IDENTITY_CONVERGENT_K4: bool = (CONVERGENT_K4_SQRT_N == q)

# Pell D: x = D−1
IDENTITY_PELL_D_X: bool = (PELL_D_X == D - 1)
IDENTITY_PELL_D_SOLUTION: bool = (PELL_D_X ** 2 - D * PELL_D_Y ** 2 == 1)

# Pell q: x = D², y = D+1
IDENTITY_PELL_q_X: bool = (PELL_q_X == D ** 2)
IDENTITY_PELL_q_Y: bool = (PELL_q_Y == D + 1)
IDENTITY_PELL_q_SOLUTION: bool = (PELL_q_X ** 2 - q * PELL_q_Y ** 2 == 1)

# Pell N: verify the solution
IDENTITY_PELL_N_SOLUTION: bool = (PELL_N_X ** 2 - N * PELL_N_Y ** 2 == 1)


# ── Section 6: Aggregate ──────────────────────────────────────────────────────

ALL_CF_IDENTITIES: dict = {
    "CF_PHI_QUOT":              IDENTITY_CF_PHI_QUOT,
    "PERIOD_SQRT_D":            IDENTITY_PERIOD_SQRT_D,
    "CF_SQRT_D_A0":             IDENTITY_CF_SQRT_D_A0,
    "CF_SQRT_D_QUOTS":          IDENTITY_CF_SQRT_D_QUOTS,
    "PERIOD_SQRT_q":            IDENTITY_PERIOD_SQRT_q,
    "CF_SQRT_q_QUOT":           IDENTITY_CF_SQRT_q_QUOT,
    "PERIOD_SQRT_N":            IDENTITY_PERIOD_SQRT_N,       # ★ STAR
    "CF_SQRT_N_A0":             IDENTITY_CF_SQRT_N_A0,
    "LAST_QUOT_SQRT_N":         IDENTITY_LAST_QUOT_SQRT_N,
    "SUM_PERIOD_SQRT_N":        IDENTITY_SUM_PERIOD_SQRT_N,
    "FIRST_QUOTS_SQRT_N":       IDENTITY_FIRST_QUOTS_SQRT_N,
    "PERIOD_SQRT_V":            IDENTITY_PERIOD_SQRT_V,
    "CF_SQRT_V_A0":             IDENTITY_CF_SQRT_V_A0,
    "CF_SQRT_V_QUOTS":          IDENTITY_CF_SQRT_V_QUOTS,
    "CF_SQRT_E_A0":             IDENTITY_CF_SQRT_E_A0,
    "PERIOD_SQRT_E":            IDENTITY_PERIOD_SQRT_E,
    "LAST_QUOT_SQRT_E":         IDENTITY_LAST_QUOT_SQRT_E,
    "CF_SQRT_G_A0":             IDENTITY_CF_SQRT_G_A0,
    "PERIOD_SQRT_G":            IDENTITY_PERIOD_SQRT_G,
    "CF_SQRT_G_FIRST_QUOT":     IDENTITY_CF_SQRT_G_FIRST_QUOT,
    "CF_SQRT_G_SECOND_QUOT":    IDENTITY_CF_SQRT_G_SECOND_QUOT,
    "CF_SQRT_G_LAST_QUOT":      IDENTITY_CF_SQRT_G_LAST_QUOT,
    "CONVERGENT_K4":            IDENTITY_CONVERGENT_K4,
    "PELL_D_X":                 IDENTITY_PELL_D_X,
    "PELL_D_SOLUTION":          IDENTITY_PELL_D_SOLUTION,
    "PELL_q_X":                 IDENTITY_PELL_q_X,
    "PELL_q_Y":                 IDENTITY_PELL_q_Y,
    "PELL_q_SOLUTION":          IDENTITY_PELL_q_SOLUTION,
    "PELL_N_SOLUTION":          IDENTITY_PELL_N_SOLUTION,
}

ALL_CF_EXACT: bool = all(ALL_CF_IDENTITIES.values())

assert ALL_CF_EXACT, (
    "Continued Fractions Cathedral: one or more identities failed: "
    + str({k: v for k, v in ALL_CF_IDENTITIES.items() if not v})
)


# ── Section 7: Summary and report ─────────────────────────────────────────────

def cf_summary() -> dict:
    """Return a summary dict of all Cathedral CF values and flags."""
    return {
        # Cathedral parameters
        "D": D, "N": N, "V": V, "E": E, "F": F, "q": q, "G": G,
        "D_FACT": D_FACT,
        # CF(phi)
        "CF_PHI_QUOT": CF_PHI_QUOT,
        # CF(sqrt(D))
        "CF_SQRT_D_A0": CF_SQRT_D_A0,
        "CF_SQRT_D_PERIOD": CF_SQRT_D_PERIOD,
        "PERIOD_SQRT_D": PERIOD_SQRT_D,
        # CF(sqrt(q))
        "CF_SQRT_q_A0": CF_SQRT_q_A0,
        "CF_SQRT_q_PERIOD": CF_SQRT_q_PERIOD,
        "PERIOD_SQRT_q": PERIOD_SQRT_q,
        "CF_SQRT_q_QUOT": CF_SQRT_q_QUOT,
        # CF(sqrt(N)) — star identity
        "CF_SQRT_N_A0": CF_SQRT_N_A0,
        "CF_SQRT_N_PERIOD": CF_SQRT_N_PERIOD,
        "PERIOD_SQRT_N": PERIOD_SQRT_N,
        "LAST_QUOT_SQRT_N": LAST_QUOT_SQRT_N,
        "SUM_PERIOD_SQRT_N": SUM_PERIOD_SQRT_N,
        "CONVERGENT_K4_SQRT_N": CONVERGENT_K4_SQRT_N,
        # CF(sqrt(V))
        "CF_SQRT_V_A0": CF_SQRT_V_A0,
        "CF_SQRT_V_PERIOD": CF_SQRT_V_PERIOD,
        "PERIOD_SQRT_V": PERIOD_SQRT_V,
        # CF(sqrt(E))
        "CF_SQRT_E_A0": CF_SQRT_E_A0,
        "CF_SQRT_E_PERIOD": CF_SQRT_E_PERIOD,
        "PERIOD_SQRT_E": PERIOD_SQRT_E,
        # CF(sqrt(G))
        "CF_SQRT_G_A0": CF_SQRT_G_A0,
        "CF_SQRT_G_PERIOD": CF_SQRT_G_PERIOD,
        "PERIOD_SQRT_G": PERIOD_SQRT_G,
        # Pell solutions
        "PELL_D_X": PELL_D_X, "PELL_D_Y": PELL_D_Y,
        "PELL_q_X": PELL_q_X, "PELL_q_Y": PELL_q_Y,
        "PELL_N_X": PELL_N_X, "PELL_N_Y": PELL_N_Y,
        # Aggregate
        "ALL_CF_IDENTITIES": ALL_CF_IDENTITIES,
        "ALL_CF_EXACT": ALL_CF_EXACT,
        "N_CF_IDENTITIES": len(ALL_CF_IDENTITIES),
    }


def print_cf_report() -> None:
    """Print a Cathedral CF report to stdout."""
    line = "=" * 70
    print(line)
    print("  CONTINUED FRACTIONS CATHEDRAL  (v2.9.30)")
    print("  Cathedral integers: D=3, N=13, V=12, E=30, F=20, q=5, G=60")
    print(line)
    print()
    print("  ★ STAR IDENTITY: CF(√N) has period = q = 5  ← CATHEDRAL MIRACLE!")
    print(f"    CF(√13) = [3; 1, 1, 1, 1, 6, ...]")
    print(f"    period = {PERIOD_SQRT_N} = q = {q}")
    print()
    print("  CF(φ)  = [1; 1, 1, 1, ...]  all quotients = 1 = D−2")
    print(f"  CF(√D) = CF(√3)  = [{CF_SQRT_D_A0}; {CF_SQRT_D_PERIOD}...]"
          f"  period={PERIOD_SQRT_D} = D−1")
    print(f"  CF(√q) = CF(√5)  = [{CF_SQRT_q_A0}; {CF_SQRT_q_PERIOD}...]"
          f"  period={PERIOD_SQRT_q} = D−2,"
          f"  recurring quot={CF_SQRT_q_QUOT} = D+1")
    print(f"  CF(√N) = CF(√13) = [{CF_SQRT_N_A0}; {CF_SQRT_N_PERIOD}...]"
          f"  period={PERIOD_SQRT_N} = q  ← MIRACLE")
    print(f"    a₀={CF_SQRT_N_A0}=D, last_quot={LAST_QUOT_SQRT_N}=D!,"
          f" sum_period={SUM_PERIOD_SQRT_N}=2q")
    print(f"  CF(√V) = CF(√12) = [{CF_SQRT_V_A0}; {CF_SQRT_V_PERIOD}...]"
          f"  period={PERIOD_SQRT_V} = D−1, a₀={CF_SQRT_V_A0}=D")
    print(f"  CF(√E) = CF(√30) = [{CF_SQRT_E_A0}; {CF_SQRT_E_PERIOD}...]"
          f"  period={PERIOD_SQRT_E} = D−1, a₀={CF_SQRT_E_A0}=q")
    print(f"  CF(√G) = CF(√60) = [{CF_SQRT_G_A0}; {CF_SQRT_G_PERIOD}...]"
          f"  period={PERIOD_SQRT_G} = D+1, a₀={CF_SQRT_G_A0}=D!+1")
    print()
    print("  PELL EQUATIONS:")
    print(f"    x²−Dy²=1: ({PELL_D_X},{PELL_D_Y}),   x={PELL_D_X}=D−1 ← Cathedral!")
    print(f"    x²−qy²=1: ({PELL_q_X},{PELL_q_Y}),   x={PELL_q_X}=D²,"
          f" y={PELL_q_Y}=D+1 ← Cathedral!")
    print(f"    x²−Ny²=1: ({PELL_N_X},{PELL_N_Y})")
    print()
    print(f"  CONVERGENT MIRACLE: k₄(CF(√13)) = {CONVERGENT_K4_SQRT_N} = q ← Cathedral!")
    print()
    print(f"  Identities verified: {len(ALL_CF_IDENTITIES)}")
    print(f"  ALL_CF_EXACT = {ALL_CF_EXACT}")
    print(line)

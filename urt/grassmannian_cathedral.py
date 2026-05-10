"""
Grassmannian Cathedral  (v2.9.37)
==================================
Remarkable connections between Cathedral integers and Grassmannian geometry.

Cathedral integers: D=3, N=13, V=12, E=30, F=20, q=5, G=60, γ=1/81.

The Grassmannian G(k, n) parametrises k-dimensional subspaces of C^n.
Its dimension is k*(n−k).

KEY SELF-REFERENTIAL IDENTITY:
  dim G(D, V) = D*(V−D) = 3*9 = 27 = D^D  ← SELF-REFERENTIAL MIRACLE!
  Root cause: V−D = D^{D−1} = 9  →  D*(V−D) = D*D^{D−1} = D^D.

Cathedral dimension table:
  G(D, V)     dim = D*(V−D) = 3*9  = 27 = D^D       ← SELF-REF!!!
  G(D, N)     dim = D*(N−D) = 3*10 = 30 = E          ← CATHEDRAL!
  G(2, V)     dim = 2*(V−2) = 2*10 = 20 = F          ← CATHEDRAL!
  G(D+1, N)   dim = 4*9    = 36 = (D!)²              ← CATHEDRAL!
  G(2, N)     dim = 2*(N−2)= 2*11 = 22 = 2*(D!+q)   ← CATHEDRAL!
  G(q, N)     dim = 5*8    = 40 = 2^D * q            ← CATHEDRAL!
  G(q, V)     dim = 5*7    = 35 = q*(D!+1)           ← CATHEDRAL!
  G(D+1, V)   dim = 4*8    = 32 = 2^q                ← CATHEDRAL!
  G(D, D+q)   dim = D*q    = 15 = V+D                ← CATHEDRAL!

Euler characteristics (= number of Schubert cells = C(n,k)):
  χ G(D, V)   = C(12,3) = 220 = (D+1)*q*(D!+q)      ← CATHEDRAL!
  χ G(D, N)   = C(13,3) = 286 = 2*(D!+q)*N           ← CATHEDRAL!
  χ G(2, V)   = C(12,2) =  66 = D!*(D!+q)            ← CATHEDRAL!
  χ G(q, N)   = C(13,5) =1287 = D^2*(D!+q)*N         ← CATHEDRAL!
  χ G(D+1, V) = C(12,4) = 495 = q*D^2*(D!+q)         ← CATHEDRAL!
  χ G(q, V)   = C(12,5) = 792 = 2^D*D^2*(D!+q)       ← CATHEDRAL!

Top cohomology degree:
  G(D, N): 2*dim = 2*E = 60 = G  ← CATHEDRAL TOP DEGREE!

Isotropic Grassmannians:
  dim OG(D, 2N) = D*(2N−D) − C(D,2) = 66 = D!*(D!+q)  ← equals χ G(2,V)!
  dim LG(D, 2V) = D*(2V−D+1)/2     = 33 = D*(D!+q)

Flag variety:
  dim F(1, D; N) = 1*(D−1) + D*(N−D) = 32 = 2^q        ← CATHEDRAL!

Projective spaces (k=1 Grassmannians):
  G(1, N) = P^{N−1} = P^{V}   (projective V-space)
  G(1, V) = P^{V−1} = P^{D!+q}

Duality:
  G(k, n) ≅ G(n−k, n)  [same dimension — Schubert duality]
  G(D, N) ↔ G(N−D, N) = G(10, 13)  [both dim = E = 30]
  G(D, V) ↔ G(V−D, V) = G(9, 12)   [both dim = D^D = 27]

Structural keys:
  V − D     = D^{D−1} = 9          →  D*(V−D) = D^D (self-ref)
  V − D − 1 = 2^D     = 8          →  (D+1)*(V−D−1) = (D+1)*2^D = 2^q
  N − 2     = D! + q  = 11         →  many Euler char identities
  D! + q    = 11 = N − D^{D−1}/D   ← THE CATHEDRAL AUXILIARY
"""

from math import comb, factorial
from .shell_closure import D, N, V, E, F, q, G

# ── Cathedral parameters ───────────────────────────────────────────────────────

D_FACT: int = factorial(D)   # 6 = 3!
GAMMA_INV: int = 81          # 1/γ = 81


# ── Section 1: Core function ────────────────────────────────────────────────────

def grassmannian_dim(k: int, n: int) -> int:
    """Return the (complex) dimension of the Grassmannian G(k, n).

    G(k, n) parametrises k-dimensional subspaces of C^n.
    dim G(k, n) = k*(n − k).
    """
    return k * (n - k)


def euler_characteristic(k: int, n: int) -> int:
    """Return χ(G(k, n)) = C(n, k), the number of Schubert cells."""
    return comb(n, k)


def flag_dim(*ks: int, n: int) -> int:
    """Return the dimension of the partial flag variety F(k₁ < k₂ < … ; n).

    dim F(k₁, k₂, …; n) = Σ_i k_i*(k_{i+1} − k_i)
    where k_{last+1} = n.
    """
    seq = list(ks) + [n]
    return sum(seq[i] * (seq[i + 1] - seq[i]) for i in range(len(ks)))


# ── Section 2: Dimensions of Cathedral Grassmannians ──────────────────────────

# G(D, V) — THE SELF-REFERENTIAL MIRACLE
# V − D = D^{D−1} = 9, so D*(V−D) = D*D^{D−1} = D^D
GRASS_DIM_D_V:   int = grassmannian_dim(D, V)     # = 27 = D^D
GRASS_DIM_D_N:   int = grassmannian_dim(D, N)     # = 30 = E
GRASS_DIM_2_V:   int = grassmannian_dim(2, V)     # = 20 = F
GRASS_DIM_D1_N:  int = grassmannian_dim(D + 1, N) # = 36 = (D!)²
GRASS_DIM_2_N:   int = grassmannian_dim(2, N)     # = 22 = 2*(D!+q)
GRASS_DIM_q_N:   int = grassmannian_dim(q, N)     # = 40 = 2^D * q
GRASS_DIM_q_V:   int = grassmannian_dim(q, V)     # = 35 = q*(D!+1)
GRASS_DIM_D1_V:  int = grassmannian_dim(D + 1, V) # = 32 = 2^q
GRASS_DIM_D_Dq:  int = grassmannian_dim(D, D + q) # = 15 = D*q = V+D


# ── Section 3: Euler characteristics of Cathedral Grassmannians ───────────────

CHI_D_V:   int = euler_characteristic(D, V)       # = 220 = (D+1)*q*(D!+q)
CHI_D_N:   int = euler_characteristic(D, N)       # = 286 = 2*(D!+q)*N
CHI_2_V:   int = euler_characteristic(2, V)       # =  66 = D!*(D!+q)
CHI_q_N:   int = euler_characteristic(q, N)       # = 1287 = D^2*(D!+q)*N
CHI_D1_V:  int = euler_characteristic(D + 1, V)   # = 495 = q*D^2*(D!+q)
CHI_q_V:   int = euler_characteristic(q, V)       # = 792 = 2^D*D^2*(D!+q)


# ── Section 4: Isotropic & Lagrangian Grassmannians ───────────────────────────

# Orthogonal Grassmannian OG(D, 2N): dim = D*(2N−D) − C(D,2)
DIM_OG_D_2N: int = D * (2 * N - D) - comb(D, 2)  # = 66 = D!*(D!+q)

# Lagrangian Grassmannian LG(D, 2V): dim = D*(2V−D+1)/2
DIM_LG_D_2V: int = D * (2 * V - D + 1) // 2       # = 33 = D*(D!+q)


# ── Section 5: Flag variety dimensions ────────────────────────────────────────

# F(1, D; N): partial flag 0 ⊂ C^1 ⊂ C^D ⊂ C^N
DIM_FLAG_1_D_N: int = flag_dim(1, D, n=N)   # = 1*(D−1) + D*(N−D) = 32 = 2^q

# F(D, q; N): partial flag 0 ⊂ C^D ⊂ C^q ⊂ C^N
DIM_FLAG_D_q_N: int = flag_dim(D, q, n=N)   # = D*(q−D) + q*(N−q) = 46


# ── Section 6: Structural Cathedral keys ──────────────────────────────────────

# V − D = D^{D−1}  ← WHY dim G(D,V) = D^D
V_MINUS_D:      int = V - D                  # = 9 = D^(D-1)
V_MINUS_D_M1:   int = V - D - 1             # = 8 = 2^D

# Auxiliary Cathedral constant N−2 = D!+q
N_MINUS_2:      int = N - 2                  # = 11 = D!+q
D_FACT_PLUS_q:  int = D_FACT + q             # = 11 = N−2

# Top cohomology degree of G(D, N)
TOP_COHOM_D_N: int = 2 * GRASS_DIM_D_N      # = 60 = G  CATHEDRAL!!!

# Projective spaces
PROJ_N_MINUS_1: int = N - 1                  # = V = 12  (P^{N-1} = P^V)
PROJ_V_MINUS_1: int = V - 1                  # = 11 = D!+q  (P^{V-1})


# ── Section 7: IDENTITY booleans ──────────────────────────────────────────────

# ── 7a. Dimension identities ──

# G(D,V): dim = D^D  SELF-REFERENTIAL
IDENTITY_DIM_D_V_IS_DD: bool = (GRASS_DIM_D_V == D ** D)

# Root cause: V−D = D^{D-1}
IDENTITY_V_MINUS_D_IS_D_POW_D1: bool = (V_MINUS_D == D ** (D - 1))

# G(D,N): dim = E
IDENTITY_DIM_D_N_IS_E: bool = (GRASS_DIM_D_N == E)

# G(2,V): dim = F
IDENTITY_DIM_2_V_IS_F: bool = (GRASS_DIM_2_V == F)

# G(D+1,N): dim = (D!)²
IDENTITY_DIM_D1_N_IS_DFACT_SQ: bool = (GRASS_DIM_D1_N == D_FACT ** 2)

# G(2,N): dim = 2*(D!+q)
IDENTITY_DIM_2_N_IS_2_DFACT_Q: bool = (GRASS_DIM_2_N == 2 * (D_FACT + q))

# G(2,N): dim = 2*(N-2)  [same thing, different encoding]
IDENTITY_DIM_2_N_IS_2_N2: bool = (GRASS_DIM_2_N == 2 * (N - 2))

# G(q,N): dim = 2^D * q
IDENTITY_DIM_q_N_IS_2D_q: bool = (GRASS_DIM_q_N == 2 ** D * q)

# G(q,V): dim = q*(D!+1)
IDENTITY_DIM_q_V_IS_q_DFACT1: bool = (GRASS_DIM_q_V == q * (D_FACT + 1))

# Root cause: V−q = D!+1
IDENTITY_V_MINUS_q_IS_DFACT1: bool = (V - q == D_FACT + 1)

# G(D+1,V): dim = 2^q
IDENTITY_DIM_D1_V_IS_2Q: bool = (GRASS_DIM_D1_V == 2 ** q)

# Root cause: V−D−1 = 2^D
IDENTITY_V_MINUS_D_M1_IS_2D: bool = (V_MINUS_D_M1 == 2 ** D)

# G(D,D+q): dim = D*q = V+D
IDENTITY_DIM_D_Dq_IS_VD: bool = (GRASS_DIM_D_Dq == V + D)

# ── 7b. Euler characteristic identities ──

# χ G(D,V) = (D+1)*q*(D!+q)
IDENTITY_CHI_D_V: bool = (CHI_D_V == (D + 1) * q * (D_FACT + q))

# χ G(D,N) = 2*(D!+q)*N
IDENTITY_CHI_D_N: bool = (CHI_D_N == 2 * (D_FACT + q) * N)

# χ G(2,V) = D!*(D!+q)
IDENTITY_CHI_2_V: bool = (CHI_2_V == D_FACT * (D_FACT + q))

# χ G(q,N) = D^2*(D!+q)*N
IDENTITY_CHI_q_N: bool = (CHI_q_N == D ** 2 * (D_FACT + q) * N)

# χ G(D+1,V) = q*D^2*(D!+q)
IDENTITY_CHI_D1_V: bool = (CHI_D1_V == q * D ** 2 * (D_FACT + q))

# χ G(q,V) = 2^D * D^2 * (D!+q)
IDENTITY_CHI_q_V: bool = (CHI_q_V == 2 ** D * D ** 2 * (D_FACT + q))

# ── 7c. Top cohomology degree ──

# G(D,N) top cohom degree = 2*dim = 2*E = G  CATHEDRAL!
IDENTITY_TOP_COHOM_D_N_IS_G: bool = (TOP_COHOM_D_N == G)

# G(D,V) top cohom degree = 2*D^D = 54; not Cathedral by itself
IDENTITY_TOP_COHOM_D_N_IS_2E: bool = (TOP_COHOM_D_N == 2 * E)

# ── 7d. Isotropic Grassmannians ──

# dim OG(D,2N) = D!*(D!+q) = 66 = χ G(2,V)
IDENTITY_DIM_OG_D_2N: bool = (DIM_OG_D_2N == D_FACT * (D_FACT + q))

# dim OG(D,2N) = χ G(2,V)  [the equality itself]
IDENTITY_OG_EQ_CHI_2V: bool = (DIM_OG_D_2N == CHI_2_V)

# dim LG(D,2V) = D*(D!+q) = 33
IDENTITY_DIM_LG_D_2V: bool = (DIM_LG_D_2V == D * (D_FACT + q))

# ── 7e. Flag variety ──

# dim F(1,D;N) = 2^q = 32
IDENTITY_FLAG_1_D_N_IS_2Q: bool = (DIM_FLAG_1_D_N == 2 ** q)

# ── 7f. Projective-space embeddings ──

# G(1,N) = P^{N-1} = P^V
IDENTITY_G1N_IS_PV: bool = (N - 1 == V)

# G(1,V) = P^{V-1} = P^{D!+q}
IDENTITY_G1V_IS_P_DFACT_Q: bool = (V - 1 == D_FACT + q)

# ── 7g. Duality ──

# G(D,N) ↔ G(N-D,N): same dimension
IDENTITY_DUALITY_D_N: bool = (grassmannian_dim(D, N) == grassmannian_dim(N - D, N))

# G(D,V) ↔ G(V-D,V): same dimension
IDENTITY_DUALITY_D_V: bool = (grassmannian_dim(D, V) == grassmannian_dim(V - D, V))

# ── 7h. Auxiliary: N−2 = D!+q ──

# N−2 = D!+q (the Cathedral auxiliary constant)
IDENTITY_N_MINUS_2_IS_DFACT_Q: bool = (N_MINUS_2 == D_FACT_PLUS_q)


# ── Section 8: Aggregate ──────────────────────────────────────────────────────

ALL_GRASS_IDENTITIES: dict = {
    # Dimension identities
    "dim_D_V_is_DD":           IDENTITY_DIM_D_V_IS_DD,            # ★ SELF-REF
    "V_minus_D_is_D_pow_D1":   IDENTITY_V_MINUS_D_IS_D_POW_D1,   # root cause
    "dim_D_N_is_E":            IDENTITY_DIM_D_N_IS_E,
    "dim_2_V_is_F":            IDENTITY_DIM_2_V_IS_F,
    "dim_D1_N_is_Dfact_sq":    IDENTITY_DIM_D1_N_IS_DFACT_SQ,
    "dim_2_N_is_2_Dfact_q":    IDENTITY_DIM_2_N_IS_2_DFACT_Q,
    "dim_2_N_is_2_N2":         IDENTITY_DIM_2_N_IS_2_N2,
    "dim_q_N_is_2D_q":         IDENTITY_DIM_q_N_IS_2D_q,
    "dim_q_V_is_q_Dfact1":     IDENTITY_DIM_q_V_IS_q_DFACT1,
    "V_minus_q_is_Dfact1":     IDENTITY_V_MINUS_q_IS_DFACT1,
    "dim_D1_V_is_2q":          IDENTITY_DIM_D1_V_IS_2Q,
    "V_minus_D_m1_is_2D":      IDENTITY_V_MINUS_D_M1_IS_2D,
    "dim_D_Dq_is_VD":          IDENTITY_DIM_D_Dq_IS_VD,
    # Euler characteristics
    "chi_D_V":                 IDENTITY_CHI_D_V,
    "chi_D_N":                 IDENTITY_CHI_D_N,
    "chi_2_V":                 IDENTITY_CHI_2_V,
    "chi_q_N":                 IDENTITY_CHI_q_N,
    "chi_D1_V":                IDENTITY_CHI_D1_V,
    "chi_q_V":                 IDENTITY_CHI_q_V,
    # Top cohomology
    "top_cohom_D_N_is_G":      IDENTITY_TOP_COHOM_D_N_IS_G,
    "top_cohom_D_N_is_2E":     IDENTITY_TOP_COHOM_D_N_IS_2E,
    # Isotropic Grassmannians
    "dim_OG_D_2N":             IDENTITY_DIM_OG_D_2N,
    "OG_eq_chi_2V":            IDENTITY_OG_EQ_CHI_2V,
    "dim_LG_D_2V":             IDENTITY_DIM_LG_D_2V,
    # Flag variety
    "flag_1_D_N_is_2q":        IDENTITY_FLAG_1_D_N_IS_2Q,
    # Projective embeddings
    "G1N_is_PV":               IDENTITY_G1N_IS_PV,
    "G1V_is_P_Dfact_q":        IDENTITY_G1V_IS_P_DFACT_Q,
    # Duality
    "duality_D_N":             IDENTITY_DUALITY_D_N,
    "duality_D_V":             IDENTITY_DUALITY_D_V,
    # Auxiliary
    "N_minus_2_is_Dfact_q":    IDENTITY_N_MINUS_2_IS_DFACT_Q,
}

ALL_GRASS_EXACT: bool = all(ALL_GRASS_IDENTITIES.values())
N_GRASS_IDENTITIES: int = len(ALL_GRASS_IDENTITIES)

assert ALL_GRASS_EXACT, (
    "Grassmannian Cathedral: one or more identities failed: "
    + str({k: v for k, v in ALL_GRASS_IDENTITIES.items() if not v})
)


# ── Section 9: Summary and report ─────────────────────────────────────────────

def grassmannian_summary() -> dict:
    """Return a summary dict of all Cathedral Grassmannian values and flags."""
    return {
        # Cathedral parameters
        "D": D, "N": N, "V": V, "E": E, "F": F, "q": q, "G": G,
        "D_FACT": D_FACT,
        # Auxiliary
        "N_MINUS_2": N_MINUS_2,
        "D_FACT_PLUS_q": D_FACT_PLUS_q,
        "V_MINUS_D": V_MINUS_D,
        "V_MINUS_D_M1": V_MINUS_D_M1,
        # Dimensions
        "GRASS_DIM_D_V":  GRASS_DIM_D_V,
        "GRASS_DIM_D_N":  GRASS_DIM_D_N,
        "GRASS_DIM_2_V":  GRASS_DIM_2_V,
        "GRASS_DIM_D1_N": GRASS_DIM_D1_N,
        "GRASS_DIM_2_N":  GRASS_DIM_2_N,
        "GRASS_DIM_q_N":  GRASS_DIM_q_N,
        "GRASS_DIM_q_V":  GRASS_DIM_q_V,
        "GRASS_DIM_D1_V": GRASS_DIM_D1_V,
        "GRASS_DIM_D_Dq": GRASS_DIM_D_Dq,
        # Euler characteristics
        "CHI_D_V":  CHI_D_V,
        "CHI_D_N":  CHI_D_N,
        "CHI_2_V":  CHI_2_V,
        "CHI_q_N":  CHI_q_N,
        "CHI_D1_V": CHI_D1_V,
        "CHI_q_V":  CHI_q_V,
        # Top cohomology
        "TOP_COHOM_D_N": TOP_COHOM_D_N,
        # Isotropic
        "DIM_OG_D_2N": DIM_OG_D_2N,
        "DIM_LG_D_2V": DIM_LG_D_2V,
        # Flag
        "DIM_FLAG_1_D_N": DIM_FLAG_1_D_N,
        # Projective
        "PROJ_N_MINUS_1": PROJ_N_MINUS_1,
        "PROJ_V_MINUS_1": PROJ_V_MINUS_1,
        # Aggregate
        "ALL_GRASS_IDENTITIES": ALL_GRASS_IDENTITIES,
        "ALL_GRASS_EXACT":      ALL_GRASS_EXACT,
        "N_GRASS_IDENTITIES":   N_GRASS_IDENTITIES,
    }


def print_grassmannian_report() -> None:
    """Print a Cathedral Grassmannian report to stdout."""
    line = "=" * 72
    print(line)
    print("  GRASSMANNIAN CATHEDRAL  (v2.9.37)")
    print("  Cathedral integers: D=3, N=13, V=12, E=30, F=20, q=5, G=60")
    print(line)
    print()
    print("  ★ SELF-REFERENTIAL MIRACLE: dim G(D, V) = D^D")
    print(f"    G({D},{V}): dim = {D}*(V−D) = {D}*{V-D} = {GRASS_DIM_D_V}")
    print(f"    D^D = {D}^{D} = {D**D}   match: {GRASS_DIM_D_V == D**D}")
    print(f"    Root: V−D = {V_MINUS_D} = D^{{D−1}} = {D**(D-1)}")
    print()
    print("  DIMENSION TABLE  [G(k,n): dim = k*(n−k)]")
    print(f"  {'Grassmannian':<16} {'dim':>4}  Cathedral encoding")
    print(f"  {'-'*16} {'-'*4}  {'-'*36}")
    rows = [
        (f"G({D},{V})",   GRASS_DIM_D_V,  f"D^D={D**D}              ★ SELF-REF"),
        (f"G({D},{N})",   GRASS_DIM_D_N,  f"E={E}"),
        (f"G(2,{V})",     GRASS_DIM_2_V,  f"F={F}"),
        (f"G({D+1},{N})", GRASS_DIM_D1_N, f"(D!)^2={(D_FACT)**2}"),
        (f"G(2,{N})",     GRASS_DIM_2_N,  f"2*(D!+q)=2*{D_FACT+q}={2*(D_FACT+q)}"),
        (f"G({q},{N})",   GRASS_DIM_q_N,  f"2^D*q={2**D}*{q}={2**D*q}"),
        (f"G({q},{V})",   GRASS_DIM_q_V,  f"q*(D!+1)={q}*{D_FACT+1}={q*(D_FACT+1)}"),
        (f"G({D+1},{V})", GRASS_DIM_D1_V, f"2^q={2**q}"),
        (f"G({D},{D+q})", GRASS_DIM_D_Dq, f"D*q=V+D={V+D}"),
    ]
    for name, dim, note in rows:
        print(f"  {name:<16} {dim:>4}  {note}")
    print()
    print("  EULER CHARACTERISTICS  [χ G(k,n) = C(n,k) = # Schubert cells]")
    print(f"  {'Grassmannian':<16} {'χ':>5}  Cathedral encoding")
    print(f"  {'-'*16} {'-'*5}  {'-'*36}")
    chi_rows = [
        (f"G({D},{V})",   CHI_D_V,  f"(D+1)*q*(D!+q)={D+1}*{q}*{D_FACT+q}={CHI_D_V}"),
        (f"G({D},{N})",   CHI_D_N,  f"2*(D!+q)*N=2*{D_FACT+q}*{N}={CHI_D_N}"),
        (f"G(2,{V})",     CHI_2_V,  f"D!*(D!+q)={D_FACT}*{D_FACT+q}={CHI_2_V}"),
        (f"G({q},{N})",   CHI_q_N,  f"D^2*(D!+q)*N={D**2}*{D_FACT+q}*{N}={CHI_q_N}"),
        (f"G({D+1},{V})", CHI_D1_V, f"q*D^2*(D!+q)={q}*{D**2}*{D_FACT+q}={CHI_D1_V}"),
        (f"G({q},{V})",   CHI_q_V,  f"2^D*D^2*(D!+q)={2**D}*{D**2}*{D_FACT+q}={CHI_q_V}"),
    ]
    for name, chi, note in chi_rows:
        print(f"  {name:<16} {chi:>5}  {note}")
    print()
    print("  TOP COHOMOLOGY DEGREES  [= 2*dim]")
    print(f"  G({D},{N}): H_top degree = 2*{GRASS_DIM_D_N} = {TOP_COHOM_D_N} = G = {G}  CATHEDRAL!!!")
    print()
    print("  ISOTROPIC GRASSMANNIANS")
    print(f"  OG({D},{2*N}): dim = {D}*(2*{N}−{D}) − C({D},2) = {DIM_OG_D_2N}"
          f" = D!*(D!+q) = {D_FACT}*{D_FACT+q} = χ G(2,{V})  MIRACLE!")
    print(f"  LG({D},{2*V}): dim = {D}*(2*{V}−{D}+1)/2 = {DIM_LG_D_2V}"
          f" = D*(D!+q) = {D}*{D_FACT+q}")
    print()
    print("  FLAG VARIETIES")
    print(f"  F(1,{D};{N}): dim = 1*(D−1)+D*(N−D) = 2+{D*(N-D)} = {DIM_FLAG_1_D_N}"
          f" = 2^q = {2**q}  CATHEDRAL!")
    print()
    print("  PROJECTIVE EMBEDDINGS  [G(1,n) = P^{{n-1}}]")
    print(f"  G(1,{N}) = P^{{{N-1}}} = P^V = P^{{{V}}}  (V-dimensional projective space)")
    print(f"  G(1,{V}) = P^{{{V-1}}} = P^{{D!+q}} = P^{{{D_FACT+q}}}")
    print()
    print("  STRUCTURAL CATHEDRAL KEYS")
    print(f"  V−D     = {V_MINUS_D} = D^{{D−1}} = {D**(D-1)}  ← WHY dim G(D,V)=D^D")
    print(f"  V−D−1   = {V_MINUS_D_M1} = 2^D = {2**D}            ← WHY dim G(D+1,V)=2^q")
    print(f"  N−2     = {N_MINUS_2} = D!+q = {D_FACT+q}          ← CATHEDRAL AUXILIARY")
    print()
    print(f"  Identities verified: {N_GRASS_IDENTITIES}")
    print(f"  ALL_GRASS_EXACT = {ALL_GRASS_EXACT}")
    print(line)

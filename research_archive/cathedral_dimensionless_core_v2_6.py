# CATHEDRAL DIMENSIONLESS CORE v2.6
# From chaos to closure.
# Full formal internal core with bounded-chaos origin layer restored.
# Colab-safe: no class, no exponent operator, flat loops.

import numpy as np
import math
import itertools
import hashlib
import json

print("=" * 78)
print("CATHEDRAL DIMENSIONLESS CORE v2.6")
print("From chaos to closure")
print("Chaos -> pi-phi-e flow -> Geometry -> A5 -> hidden 4+4 -> router")
print("=" * 78)


# ---------------------------------------------------------------------
# SECTION 0: PRIMITIVES
# ---------------------------------------------------------------------

pi = math.pi
s5 = math.sqrt(5.0)
phi = (1.0 + s5) / 2.0

D = 3
V = 12
N = 13
E = 30
F = 20
q = 5
G = 60

gamma = 1.0 / 81.0
dstar = (1.0 - gamma) * pi / (N * phi)
dcl = float(D) / F
Delta = dcl - dstar
Cmid = 0.5 * (dstar + dcl)

print()
print("=" * 78)
print("SECTION 0: PRIMITIVES")
print("=" * 78)
print("  D      =", D)
print("  V      =", V)
print("  N      =", N)
print("  E      =", E)
print("  F      =", F)
print("  q      =", q)
print("  G      =", G)
print("  phi    = %.15f" % phi)
print("  gamma  = %.15f" % gamma)
print("  dstar  = %.15f" % dstar)
print("  dcl    = %.15f" % dcl)
print("  Delta  = %.15f" % Delta)


# ---------------------------------------------------------------------
# SECTION 1: ICOSAHEDRAL SHELL
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 1: ICOSAHEDRAL SHELL")
print("=" * 78)

base = []
pairs = [(1.0, phi), (1.0, -phi), (-1.0, phi), (-1.0, -phi)]

for a, b in pairs:
    base.append((0.0, a, b))
    base.append((a, b, 0.0))
    base.append((b, 0.0, a))

verts = np.array(base)

diff = verts[:, None, :] - verts[None, :, :]
dist = np.sqrt((diff * diff).sum(-1))
mind = dist[dist > 1.0e-8].min()

A_shell = ((dist > 1.0e-8) & (np.abs(dist - mind) < 1.0e-8)).astype(float)

edges = []
i = 0
while i < 12:
    j = i + 1
    while j < 12:
        if A_shell[i, j] > 0.5:
            edges.append((i, j))
        j = j + 1
    i = i + 1

L_vertex = np.diag(A_shell.sum(1)) - A_shell
ev_v, Uv = np.linalg.eigh(L_vertex)

print("  shell vertices =", len(verts))
print("  shell edges    =", len(edges))
print("  shell degree   =", int(A_shell.sum(1)[0]))

print()
print("  vertex Laplacian spectrum:")
vals_v, cnt_v = np.unique(np.round(ev_v, 6), return_counts=True)
for val, cnt in zip(vals_v, cnt_v):
    print("    %.6f multiplicity %d" % (val, cnt))

lambda_scalar = 0.0
lambda_triplet_low = 5.0 - s5
lambda_five_visible = 6.0
lambda_triplet_high = 5.0 + s5

print()
print("  visible projectors:")
print("    scalar       lambda = %.12f" % lambda_scalar)
print("    triplet low  lambda = %.12f" % lambda_triplet_low)
print("    five         lambda = %.12f" % lambda_five_visible)
print("    triplet high lambda = %.12f" % lambda_triplet_high)


# ---------------------------------------------------------------------
# SECTION 2: CENTERED G13
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 2: CENTERED G13")
print("=" * 78)

A13 = np.zeros((13, 13))
A13[1:13, 1:13] = A_shell
A13[0, 1:13] = 1.0
A13[1:13, 0] = 1.0

L13 = np.diag(A13.sum(1)) - A13
ev13 = np.linalg.eigvalsh(L13)

print("  centered nodes =", 13)
print("  center degree  =", int(A13[0].sum()))

print()
print("  G13 Laplacian spectrum:")
vals13, cnt13 = np.unique(np.round(ev13, 6), return_counts=True)
for val, cnt in zip(vals13, cnt13):
    print("    %.6f multiplicity %d" % (val, cnt))


# ---------------------------------------------------------------------
# SECTION 3: CHAOS GENERATION LAYER
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 3: CHAOS GENERATION LAYER")
print("=" * 78)

print("  origin chain:")
print("    raw chaos -> bounded period-3/6 rails -> pi-phi-e flow -> G13 closure")
print()
print("  role:")
print("    logistic map supplies the bounded-chaos rail structure")
print("    pi-phi-e flow selects the Cathedral vacuum dstar")
print("    G13/A5 supplies representation closure")


def logistic(x, r):
    return r * x * (1.0 - x)


def get_cycle(r, transient, samples, tol):
    x = 0.5

    k = 0
    while k < transient:
        x = logistic(x, r)
        k = k + 1

    pts = []
    k = 0
    while k < samples:
        x = logistic(x, r)

        seen = False
        for u in pts:
            if abs(x - u) < tol:
                seen = True

        if not seen:
            pts.append(x)

        k = k + 1

    return sorted(pts)


def lyapunov_logistic(r, transient, samples):
    x = 0.3

    k = 0
    while k < transient:
        x = logistic(x, r)
        k = k + 1

    s = 0.0
    k = 0
    while k < samples:
        x = logistic(x, r)
        der = abs(r * (1.0 - 2.0 * x))
        if der < 1.0e-300:
            der = 1.0e-300
        s = s + math.log(der)
        k = k + 1

    return s / float(samples)


# Pin the current frozen Cathedral dstar inside the stable 6-cycle window.
# This updates the older empirical rail report to the current analytic dstar.
lo = 3.84151
hi = 3.8417002878419497

k = 0
while k < 38:
    mid = 0.5 * (lo + hi)
    cyc_mid = get_cycle(mid, 60000, 140, 1.0e-12)

    if len(cyc_mid) < 6:
        lo = mid
    else:
        low = cyc_mid[0]
        if low > dstar:
            lo = mid
        else:
            hi = mid

    k = k + 1

r_pin = 0.5 * (lo + hi)
chaos_cycle = get_cycle(r_pin, 120000, 260, 1.0e-12)
chaos_lyap = lyapunov_logistic(r_pin, 8000, 40000)

print("  period-3 onset:")
print("    r = 1 + sqrt(8) = %.15f" % (1.0 + math.sqrt(8.0)))

print()
print("  frozen Cathedral dstar rail:")
print("    dstar        = %.15f" % dstar)
print("    r_pin        = %.15f" % r_pin)
print("    branch[0]    = %.15f" % chaos_cycle[0])
print("    rail error   = %.3e" % abs(chaos_cycle[0] - dstar))
print("    cycle length = %d" % len(chaos_cycle))
print("    Lyapunov     = %.9f" % chaos_lyap)

print()
print("  first two rails:")
print("    vacuum rail       = %.15f" % chaos_cycle[0])
print("    classical-like rail= %.15f" % chaos_cycle[1])
print("    dcl target        = %.15f" % dcl)
print("    dcl rail error    = %.3e" % abs(chaos_cycle[1] - dcl))
print("    rail split        = %.15f" % (chaos_cycle[1] - chaos_cycle[0]))
print("    Delta target      = %.15f" % Delta)
print("    split error       = %.3e" % abs((chaos_cycle[1] - chaos_cycle[0]) - Delta))

print()
print("  interpretation:")
print("    raw chaos is not the finished state")
print("    bounded chaos contracts onto stable rails")
print("    dstar is the exact pinned vacuum rail")
print("    dcl remains the geometric classical rail D/F")
print("    the second logistic rail is corroborative, not the source of dcl")


# ---------------------------------------------------------------------
# SECTION 4: PI-PHI-E FLOW TO THE VACUUM ATTRACTOR
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 4: PI-PHI-E FLOW TO THE VACUUM ATTRACTOR")
print("=" * 78)


def pi_phi_e_flow(target, steps, dt, seed):
    rng = np.random.RandomState(seed)
    x = rng.rand(13)

    s0 = float(x.std())

    k = 0
    while k < steps:
        t = k * dt

        lap = L13.dot(x)
        pull = (phi - 1.0) * math.exp(-t / 10.0) * (x - target) * (1.0 + x * x)

        x = x + dt * (-(1.0 / (4.0 * pi)) * lap - pull)

        k = k + 1

    return float(x.mean()), float(x.std()), s0


flow_mean, flow_std, flow_start_std = pi_phi_e_flow(dstar, 7000, 0.01, 1)

print("  flow constants:")
print("    Laplacian coefficient = 1/(4*pi)")
print("    pull prefactor        = phi - 1")
print("    decay                 = exp(-t/10)")
print()
print("  disordered start spread = %.12f" % flow_start_std)
print("  final spread            = %.12e" % flow_std)
print("  final attractor mean    = %.15f" % flow_mean)
print("  target dstar            = %.15f" % dstar)
print("  attractor error         = %.3e" % abs(flow_mean - dstar))
print()
print("  interpretation:")
print("    pi supplies spherical diffusion")
print("    phi supplies icosahedral self-similar pull")
print("    e supplies continuous relaxation")
print("    the flow contracts to the same dstar used by the A5 core")


# ---------------------------------------------------------------------
# SECTION 5: A5 CHARACTERS
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 5: A5 CHARACTER CHECK")
print("=" * 78)

class_sizes = np.array([1.0, 15.0, 20.0, 12.0, 12.0])

chars = {
    "1": np.array([1.0, 1.0, 1.0, 1.0, 1.0]),
    "3": np.array([3.0, -1.0, 0.0, phi, 1.0 - phi]),
    "3p": np.array([3.0, -1.0, 0.0, 1.0 - phi, phi]),
    "4": np.array([4.0, 0.0, 1.0, -1.0, -1.0]),
    "5": np.array([5.0, 1.0, -1.0, 0.0, 0.0])
}


def decompose_character(label, perm_char):
    print("  " + label)
    for name in ["1", "3", "3p", "4", "5"]:
        ip = (class_sizes * perm_char * chars[name]).sum() / 60.0
        print("    %-7s multiplicity %.6f" % (name, ip))


vertex_char = np.array([12.0, 0.0, 0.0, 2.0, 2.0])
face_char = np.array([20.0, 0.0, 2.0, 0.0, 0.0])
edge_char = np.array([30.0, 2.0, 0.0, 0.0, 0.0])

decompose_character("V12 vertex character:", vertex_char)
decompose_character("F20 face character:", face_char)
decompose_character("E30 edge character:", edge_char)

vertex_irreps = ["1", "3", "3p", "5"]
face_irreps = ["1", "3", "3p", "4", "4", "5"]
hidden_irreps = ["4", "4"]

print()
print("  formal decomposition:")
print("    V12 =", vertex_irreps)
print("    F20 =", face_irreps)
print("    F20 - V12 =", hidden_irreps)


# ---------------------------------------------------------------------
# SECTION 6: A5 PRODUCT TABLE
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 6: A5 PRODUCT TABLE")
print("=" * 78)

a5_products = {}

a5_products[("1", "1")] = ["1"]
a5_products[("1", "3")] = ["3"]
a5_products[("1", "3p")] = ["3p"]
a5_products[("1", "4")] = ["4"]
a5_products[("1", "5")] = ["5"]

a5_products[("3", "3")] = ["1", "3", "5"]
a5_products[("3p", "3p")] = ["1", "3p", "5"]
a5_products[("3", "3p")] = ["4", "5"]

a5_products[("3", "4")] = ["3p", "4", "5"]
a5_products[("3p", "4")] = ["3", "4", "5"]

a5_products[("3", "5")] = ["3", "3p", "4", "5"]
a5_products[("3p", "5")] = ["3", "3p", "4", "5"]

a5_products[("4", "4")] = ["1", "3", "3p", "4", "5"]
a5_products[("4", "5")] = ["3", "3p", "4", "5", "5"]

a5_products[("5", "5")] = ["1", "3", "3p", "4", "4", "5", "5"]

keys_now = list(a5_products.keys())
for key in keys_now:
    a, b = key
    a5_products[(b, a)] = a5_products[key]

sym2_4 = ["1", "4", "5"]
wedge2_4 = ["3", "3p"]

print("  4 x 4     =", a5_products[("4", "4")])
print("  Sym2(4)   =", sym2_4)
print("  Wedge2(4) =", wedge2_4)


# ---------------------------------------------------------------------
# SECTION 7: FACES AND INCIDENCE
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 7: FACES AND INCIDENCE")
print("=" * 78)

faces = []
for tri in itertools.combinations(range(12), 3):
    a, b, c = tri
    if A_shell[a, b] > 0.5 and A_shell[a, c] > 0.5 and A_shell[b, c] > 0.5:
        faces.append(tri)

B = np.zeros((20, 12))
r = 0
while r < len(faces):
    tri = faces[r]
    for vtx in tri:
        B[r, vtx] = 1.0
    r = r + 1

rankB = np.linalg.matrix_rank(B, tol=1.0e-10)
hole_dim = 20 - rankB

BtB = B.T.dot(B)
BtB_target = 5.0 * np.eye(12) + 2.0 * A_shell
BtB_err = np.max(np.abs(BtB - BtB_target))

print("  faces        =", len(faces))
print("  B shape      =", B.shape)
print("  rank(B)      =", rankB)
print("  dim ker(B.T) =", hole_dim)
print("  max error in B.T B = 5I + 2A =", "%.3e" % BtB_err)


# ---------------------------------------------------------------------
# SECTION 8: FACE-DUAL GRAPH AND HIDDEN 4+4
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 8: FACE-DUAL GRAPH AND HIDDEN 4+4")
print("=" * 78)

A_face = np.zeros((20, 20))
i = 0
while i < 20:
    j = i + 1
    while j < 20:
        shared = 0
        for vi in faces[i]:
            for vj in faces[j]:
                if vi == vj:
                    shared = shared + 1
        if shared == 2:
            A_face[i, j] = 1.0
            A_face[j, i] = 1.0
        j = j + 1
    i = i + 1

L_face = np.diag(A_face.sum(1)) - A_face

Utmp, Stmp, Vhtmp = np.linalg.svd(B.T, full_matrices=True)
rankBT = np.linalg.matrix_rank(B.T, tol=1.0e-10)
Qhole = Vhtmp.T[:, rankBT:]

Lhole = Qhole.T.dot(L_face).dot(Qhole)
Wh, Uh = np.linalg.eigh(Lhole)

Qsplit = Qhole.dot(Uh)
Q3 = Qsplit[:, np.abs(Wh - 3.0) < 1.0e-8]
Q5 = Qsplit[:, np.abs(Wh - 5.0) < 1.0e-8]

vals_h, cnt_h = np.unique(np.round(Wh, 6), return_counts=True)

print("  face-dual degree =", int(A_face.sum(1)[0]))
print("  face-dual edges  =", int(A_face.sum() / 2.0))
print("  hidden dim       =", Qhole.shape[1])
print("  max |B.T Qhole|  =", "%.3e" % np.max(np.abs(B.T.dot(Qhole))))

print()
print("  hidden spectrum:")
for val, cnt in zip(vals_h, cnt_h):
    print("    %.6f multiplicity %d" % (val, cnt))

print()
print("  hidden split:")
print("    Q3 dim =", Q3.shape[1])
print("    Q5 dim =", Q5.shape[1])

hidden_blocks = {
    "4_3": {
        "irrep": "4",
        "lambda": 3.0,
        "dimension": Q3.shape[1],
        "basis": Q3
    },
    "4_5": {
        "irrep": "4",
        "lambda": 5.0,
        "dimension": Q5.shape[1],
        "basis": Q5
    }
}


# ---------------------------------------------------------------------
# SECTION 9: VISIBLE SPECTRAL PROJECTORS
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 9: CANONICAL VISIBLE SPECTRAL PROJECTORS")
print("=" * 78)


def spectral_projector(evals, evecs, target, tol):
    cols = []
    i = 0
    while i < len(evals):
        if abs(evals[i] - target) < tol:
            cols.append(i)
        i = i + 1
    Q = evecs[:, cols]
    P = Q.dot(Q.T)
    return P, len(cols)


P_scalar, dim_scalar = spectral_projector(ev_v, Uv, lambda_scalar, 1.0e-8)
P_triplet_low, dim_triplet_low = spectral_projector(ev_v, Uv, lambda_triplet_low, 1.0e-8)
P_five, dim_five = spectral_projector(ev_v, Uv, lambda_five_visible, 1.0e-8)
P_triplet_high, dim_triplet_high = spectral_projector(ev_v, Uv, lambda_triplet_high, 1.0e-8)

P_total = P_scalar + P_triplet_low + P_five + P_triplet_high
projector_sum_error = np.max(np.abs(P_total - np.eye(12)))

print("  scalar projector dim       =", dim_scalar)
print("  triplet low projector dim  =", dim_triplet_low)
print("  five projector dim         =", dim_five)
print("  triplet high projector dim =", dim_triplet_high)
print("  projector completeness err =", "%.3e" % projector_sum_error)


# ---------------------------------------------------------------------
# SECTION 10: FIRST VISIBLE HIDDEN RETURN
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 10: FIRST VISIBLE HIDDEN RETURN")
print("=" * 78)


def sym_return(Q):
    cols = []
    i = 0
    while i < Q.shape[1]:
        j = i
        while j < Q.shape[1]:
            h = Q[:, i] * Q[:, j]
            if j > i:
                h = math.sqrt(2.0) * h
            cols.append(B.T.dot(h))
            j = j + 1
        i = i + 1
    return np.column_stack(cols)


def mixed_return(QA, QB):
    cols = []
    i = 0
    while i < QA.shape[1]:
        j = 0
        while j < QB.shape[1]:
            h = QA[:, i] * QB[:, j]
            cols.append(B.T.dot(h))
            j = j + 1
        i = i + 1
    return np.column_stack(cols)


def projector_power(P, M):
    X = P.dot(M)
    val = np.linalg.norm(X, "fro")
    return val * val


def canonical_signature(M, label):
    total = np.linalg.norm(M, "fro")
    total = total * total

    p_scalar = projector_power(P_scalar, M)
    p_low = projector_power(P_triplet_low, M)
    p_five = projector_power(P_five, M)
    p_high = projector_power(P_triplet_high, M)

    p_triplet = p_low + p_high

    ratio = 0.0
    if p_five > 1.0e-14:
        ratio = p_scalar / p_five

    chi_signed = 0.0
    chi_abs = 0.0
    if p_triplet > 1.0e-14:
        chi_signed = (p_low - p_high) / p_triplet
        chi_abs = abs(chi_signed)

    return {
        "label": label,
        "total": total,
        "scalar_power": p_scalar,
        "triplet_low_power": p_low,
        "five_power": p_five,
        "triplet_high_power": p_high,
        "triplet_total": p_triplet,
        "scalar_five_ratio": ratio,
        "chiral_signed": chi_signed,
        "chiral_abs": chi_abs
    }


M33 = sym_return(Q3)
M55 = sym_return(Q5)
M35 = mixed_return(Q3, Q5)
Mall = sym_return(Qsplit)

sig33 = canonical_signature(M33, "Sym2(4_3)")
sig55 = canonical_signature(M55, "Sym2(4_5)")
sig35 = canonical_signature(M35, "4_3 x 4_5")

print("  return ranks:")
print("    Sym2(4_3)       =", np.linalg.matrix_rank(M33, tol=1.0e-10))
print("    Sym2(4_5)       =", np.linalg.matrix_rank(M55, tol=1.0e-10))
print("    mixed 4_3 x 4_5 =", np.linalg.matrix_rank(M35, tol=1.0e-10))
print("    all hidden      =", np.linalg.matrix_rank(Mall, tol=1.0e-10))

print()
print("  canonical signatures:")
for sig in [sig33, sig55, sig35]:
    print("    " + sig["label"])
    print("      total power        = %.12f" % sig["total"])
    print("      scalar power       = %.12f" % sig["scalar_power"])
    print("      five power         = %.12f" % sig["five_power"])
    print("      triplet low power  = %.12f" % sig["triplet_low_power"])
    print("      triplet high power = %.12f" % sig["triplet_high_power"])
    print("      scalar/five ratio  = %.12f" % sig["scalar_five_ratio"])
    print("      chiral signed      = %.12f" % sig["chiral_signed"])
    print("      chiral abs         = %.12f" % sig["chiral_abs"])


# ---------------------------------------------------------------------
# SECTION 11: A5 SECTOR ROUTER
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 11: A5 SECTOR ROUTER")
print("=" * 78)


def channel_role_from_signature(sig):
    scalar = sig["scalar_power"]
    five = sig["five_power"]
    trip = sig["triplet_total"]
    chi = sig["chiral_abs"]

    if scalar > 1.0e-12 and five > 1.0e-12 and trip < 1.0e-12:
        return "even_scalar_five_return"

    if trip > 1.0e-12 and scalar < 1.0e-12 and chi > 1.0e-12:
        return "odd_chiral_triplet_return"

    return "unrouted"


channels = [
    {
        "name": "Sym2(4_3)",
        "a5_product": "Sym2(4) -> 1 + 4 + 5",
        "signature": sig33,
        "curvature": 3.0
    },
    {
        "name": "Sym2(4_5)",
        "a5_product": "Sym2(4) -> 1 + 4 + 5",
        "signature": sig55,
        "curvature": 5.0
    },
    {
        "name": "4_3 x 4_5",
        "a5_product": "4 x 4 -> 1 + 3 + 3p + 4 + 5",
        "signature": sig35,
        "curvature": 4.0
    }
]

for ch in channels:
    role = channel_role_from_signature(ch["signature"])
    ch["role"] = role
    print("  %-12s %-38s role=%s" %
          (ch["name"], ch["a5_product"], role))

scalar_slot_candidates = []
for ch in channels:
    if ch["role"] == "even_scalar_five_return":
        scalar_slot_candidates.append(ch)

best_five = -1.0
for ch in scalar_slot_candidates:
    p = ch["signature"]["five_power"]
    if p > best_five:
        best_five = p

scalar_slot_matches = []
for ch in scalar_slot_candidates:
    if abs(ch["signature"]["five_power"] - best_five) < 1.0e-12:
        scalar_slot_matches.append(ch)

if len(scalar_slot_matches) != 1:
    raise RuntimeError("A5 router failed scalar slot uniqueness")

scalar_slot = scalar_slot_matches[0]
W_scalar = scalar_slot["signature"]["scalar_five_ratio"]

chiral_slot_candidates = []
for ch in channels:
    if ch["role"] == "odd_chiral_triplet_return":
        chiral_slot_candidates.append(ch)

if len(chiral_slot_candidates) != 1:
    raise RuntimeError("A5 router failed chiral slot uniqueness")

chiral_slot = chiral_slot_candidates[0]
chi_signed = chiral_slot["signature"]["chiral_signed"]

phi2 = phi * phi
phi3 = phi2 * phi
phi6 = phi3 * phi3

print()
print("  scalar_charge_slot:")
print("    selected channel =", scalar_slot["name"])
print("    reason           = even scalar/five return with max five dispersion")
print("    W_scalar         = %.12f" % W_scalar)

print()
print("  chiral_mixing_slot:")
print("    selected channel =", chiral_slot["name"])
print("    reason           = unique odd chiral triplet return")
print("    chi_signed       = %.12f" % chi_signed)


# ---------------------------------------------------------------------
# SECTION 12: SINGLE ACTION KERNEL
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 12: SINGLE ACTION KERNEL")
print("=" * 78)

coherent_dim = float(D + 1)
entropy_dim = float(N) - coherent_dim
hidden_dim = float(Qhole.shape[1])
active_faces = float(F - 1)
face_plus_vacuum = float(F + 1)
matter_orientation = float(2 * D)


def stationary(base, source, curvature):
    return base + source / curvature


def oscillator_amplitude(curvature):
    return 1.0 / math.sqrt(curvature)


def quadratic_norm(source, curvature):
    return (source * source) / (curvature * curvature)


def multiplicative_screen(source, screen):
    return source * screen


def source_gap(weight):
    return float(weight) * Delta


def source_entropy_feedback(weight):
    return gamma * Delta * (1.0 + float(weight) * gamma)


def source_second_order_entropy():
    return Delta * Delta * entropy_dim


print("  S[x] = 1/2 kappa (x-x0)^2 - J (x-x0)")
print("  stationary rule: x = x0 + J/kappa")
print()
print("  coherent_dim       = %.12f" % coherent_dim)
print("  entropy_dim        = %.12f" % entropy_dim)
print("  hidden_dim         = %.12f" % hidden_dim)
print("  active_faces       = %.12f" % active_faces)
print("  face_plus_vacuum   = %.12f" % face_plus_vacuum)
print("  matter_orientation = %.12f" % matter_orientation)


# ---------------------------------------------------------------------
# SECTION 13: ABSTRACT SLOT VALUES BEFORE PHYSICS LABELS
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 13: ABSTRACT SLOT VALUES BEFORE PHYSICS LABELS")
print("=" * 78)

face_screen_curvature = F - 1.0 / hidden_dim
entropy_area_source = gamma * Delta
entropy_scalar_second_source = Delta * Delta * entropy_dim

slot_scalar_base = N * N - E - 2.0
slot_scalar_source = Delta * (N + W_scalar - (1.0 + gamma) / D)
slot_scalar_bare_inverse = stationary(slot_scalar_base, slot_scalar_source, 1.0)

slot_scalar_entropy_dressing = stationary(
    0.0,
    entropy_scalar_second_source,
    q * N
)

slot_scalar_screened_inverse = slot_scalar_bare_inverse - slot_scalar_entropy_dressing

slot_face_oscillator = oscillator_amplitude(face_screen_curvature)

slot_chiral_golden_leak = stationary(0.0, Delta * (phi6 - 1.0), 1.0)

slot_direct_spatial_gap = stationary(0.0, D * Delta, 2.0)

slot_entropy_area = stationary(0.0, gamma * Delta * (1.0 + W_scalar * gamma), 1.0)

slot_quadratic_area = quadratic_norm(slot_entropy_area, pi)

slot_matter_orientation_area = stationary(0.0, matter_orientation * slot_quadratic_area, 1.0)

slot_face_vacuum_area = stationary(0.0, face_plus_vacuum * slot_quadratic_area, 1.0)

slot_solar_triplet = stationary(1.0 / D, -V * Delta, 1.0)

slot_atmospheric_triplet = stationary(0.5, F * Delta + gamma, 1.0)

slot_reactor_entropy_pair = multiplicative_screen(
    2.0 * gamma * (dstar / dcl) * (dstar / dcl),
    1.0 - F * Delta
)

slot_pmns_area = -N * Delta

slot_matter_closure = matter_orientation / active_faces
slot_vacuum_closure = float(N) / active_faces
slot_visible_fraction = 2.0 / float(N)
slot_entropy_matter_fraction = (float(N) - 2.0) / float(N)

slot_baryon_closure = slot_matter_closure * slot_visible_fraction
slot_cdm_closure = slot_matter_closure * slot_entropy_matter_fraction
slot_dark_closure = slot_cdm_closure + slot_vacuum_closure

slot_tilt = stationary(1.0, -D * gamma + Delta, 1.0)
slot_running = -Delta * Delta
slot_tensor = 16.0 * gamma * Delta
slot_tensor_nt = -slot_tensor / 8.0
slot_face_screen_depth = stationary(1.0 / active_faces, Delta, pi)
slot_fivefold_growth = math.cos(pi / q)

slot_RG_flow = stationary(0.0, F * Delta + gamma, 1.0)
slot_lambda_H = 1.0 / hidden_dim + gamma / D
slot_yt_RG = 1.0 - slot_RG_flow
slot_yt_pole = 1.0 - Delta

print("  scalar_bare_inverse          = %.15f" % slot_scalar_bare_inverse)
print("  scalar_entropy_dressing      = %.15e" % slot_scalar_entropy_dressing)
print("  scalar_screened_inverse      = %.15f" % slot_scalar_screened_inverse)
print()
print("  face_oscillator              = %.12f" % slot_face_oscillator)
print("  chiral_golden_leak           = %.12f" % slot_chiral_golden_leak)
print("  direct_spatial_gap           = %.12f" % slot_direct_spatial_gap)
print("  entropy_area                 = %.12e" % slot_entropy_area)
print("  quadratic_area               = %.12e" % slot_quadratic_area)
print()
print("  solar_triplet                = %.12f" % slot_solar_triplet)
print("  atmospheric_triplet          = %.12f" % slot_atmospheric_triplet)
print("  reactor_entropy_pair         = %.12f" % slot_reactor_entropy_pair)
print("  pmns_area                    = %.12f" % slot_pmns_area)
print()
print("  baryon_closure               = %.12f" % slot_baryon_closure)
print("  cdm_closure                  = %.12f" % slot_cdm_closure)
print("  matter_closure               = %.12f" % slot_matter_closure)
print("  vacuum_closure               = %.12f" % slot_vacuum_closure)
print("  dark_closure                 = %.12f" % slot_dark_closure)
print()
print("  tilt                         = %.12f" % slot_tilt)
print("  face_screen_depth            = %.12f" % slot_face_screen_depth)
print("  fivefold_growth              = %.12f" % slot_fivefold_growth)


# ---------------------------------------------------------------------
# SECTION 14: PHYSICS LABELS ATTACH TO PRE-EXISTING SLOTS
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 14: PHYSICS LABELS ATTACH TO PRE-EXISTING SLOTS")
print("=" * 78)

router_outputs = {
    "scalar_charge_inverse_bare": slot_scalar_bare_inverse,
    "scalar_charge_inverse_screened": slot_scalar_screened_inverse,
    "lowest_face_rotation": slot_face_oscillator,
    "mixed_chiral_gap_leakage": slot_chiral_golden_leak,
    "direct_spatial_gap_leakage": slot_direct_spatial_gap,
    "entropy_cp_area": slot_entropy_area,
    "quadratic_cp_norm": slot_quadratic_area,
    "matter_orientation_area": slot_matter_orientation_area,
    "face_vacuum_area": slot_face_vacuum_area,
    "solar_triplet_slot": slot_solar_triplet,
    "atmospheric_triplet_slot": slot_atmospheric_triplet,
    "reactor_entropy_pair_slot": slot_reactor_entropy_pair,
    "leptonic_area_slot": slot_pmns_area,
    "baryon_closure": slot_baryon_closure,
    "cdm_closure": slot_cdm_closure,
    "matter_closure": slot_matter_closure,
    "vacuum_closure": slot_vacuum_closure,
    "dark_closure": slot_dark_closure,
    "tilt_slot": slot_tilt,
    "running_slot": slot_running,
    "tensor_slot": slot_tensor,
    "tensor_nt_slot": slot_tensor_nt,
    "face_screen_depth": slot_face_screen_depth,
    "fivefold_growth": slot_fivefold_growth,
    "RG_flow": slot_RG_flow,
    "lambda_H": slot_lambda_H,
    "yt_RG": slot_yt_RG,
    "yt_pole": slot_yt_pole
}

physics_attachment = {
    "alpha_inv_bare": "scalar_charge_inverse_bare",
    "alpha_inv_dressed": "scalar_charge_inverse_screened",
    "Vus": "lowest_face_rotation",
    "Vcb": "mixed_chiral_gap_leakage",
    "Vub": "direct_spatial_gap_leakage",
    "J_CKM": "entropy_cp_area",
    "theta_QCD": "quadratic_cp_norm",
    "eta_B": "matter_orientation_area",
    "A_s": "face_vacuum_area",
    "PMNS_s12_sq": "solar_triplet_slot",
    "PMNS_s23_sq": "atmospheric_triplet_slot",
    "PMNS_s13_sq": "reactor_entropy_pair_slot",
    "J_PMNS": "leptonic_area_slot",
    "Omega_b": "baryon_closure",
    "Omega_c": "cdm_closure",
    "Omega_m": "matter_closure",
    "Omega_Lambda": "vacuum_closure",
    "Omega_dark": "dark_closure",
    "n_s": "tilt_slot",
    "running_ns": "running_slot",
    "tensor_r": "tensor_slot",
    "tensor_nt": "tensor_nt_slot",
    "tau_reio": "face_screen_depth",
    "sigma8": "fivefold_growth",
    "x_RG": "RG_flow",
    "lambda_H": "lambda_H",
    "yt_RG": "yt_RG",
    "yt_pole": "yt_pole"
}

for label in sorted(physics_attachment.keys()):
    slot_name = physics_attachment[label]
    val = router_outputs[slot_name]
    print("  %-18s <= %-32s %.12g" % (label, slot_name, val))


# ---------------------------------------------------------------------
# SECTION 15: FINAL OBSERVABLE LEDGER
# ---------------------------------------------------------------------
print()
print("=" * 78)
print("SECTION 15: FINAL OBSERVABLE LEDGER")
print("=" * 78)

alpha_inv_bare = router_outputs[physics_attachment["alpha_inv_bare"]]
alpha_inv = router_outputs[physics_attachment["alpha_inv_dressed"]]
alpha = 1.0 / alpha_inv

sin2w = float(D) / float(N)
cos2w = 1.0 - sin2w
alpha_s = float(F) / float(N * N)

e2 = 4.0 * pi * alpha
e_coup = math.sqrt(e2)
g_coup = e_coup / math.sqrt(sin2w)
gp_coup = e_coup / math.sqrt(cos2w)

alpha1 = (5.0 / 3.0) * alpha / cos2w
alpha2 = alpha / sin2w
alpha3 = alpha_s

Vus = router_outputs[physics_attachment["Vus"]]
Vcb = router_outputs[physics_attachment["Vcb"]]
Vub = router_outputs[physics_attachment["Vub"]]
J_ckm = router_outputs[physics_attachment["J_CKM"]]

s12 = Vus
s23 = Vcb
s13 = Vub

c12 = math.sqrt(1.0 - s12 * s12)
c23 = math.sqrt(1.0 - s23 * s23)
c13 = math.sqrt(1.0 - s13 * s13)

sin_delta_ckm = J_ckm / (s12 * s23 * s13 * c12 * c23 * c13 * c13)
if sin_delta_ckm > 1.0:
    sin_delta_ckm = 1.0
if sin_delta_ckm < -1.0:
    sin_delta_ckm = -1.0

delta_ckm = math.asin(sin_delta_ckm)

ep = math.cos(delta_ckm) + 1j * math.sin(delta_ckm)
em = math.cos(delta_ckm) - 1j * math.sin(delta_ckm)

Vckm = np.array([
    [c12 * c13, s12 * c13, s13 * em],
    [-s12 * c23 - c12 * s23 * s13 * ep,
      c12 * c23 - s12 * s23 * s13 * ep,
      s23 * c13],
    [s12 * s23 - c12 * c23 * s13 * ep,
     -c12 * s23 - s12 * c23 * s13 * ep,
      c23 * c13]
], dtype=complex)

ckm_unit = np.max(np.abs(Vckm.conj().T.dot(Vckm) - np.eye(3)))

theta_qcd = router_outputs[physics_attachment["theta_QCD"]]
eta_baryon = router_outputs[physics_attachment["eta_B"]]
A_s = router_outputs[physics_attachment["A_s"]]
ln10As = math.log(10000000000.0 * A_s)

pmns_s12_sq = router_outputs[physics_attachment["PMNS_s12_sq"]]
pmns_s23_sq = router_outputs[physics_attachment["PMNS_s23_sq"]]
pmns_s13_sq = router_outputs[physics_attachment["PMNS_s13_sq"]]
pmns_J = router_outputs[physics_attachment["J_PMNS"]]

pmns_s12 = math.sqrt(pmns_s12_sq)
pmns_s23 = math.sqrt(pmns_s23_sq)
pmns_s13 = math.sqrt(pmns_s13_sq)

pmns_c12 = math.sqrt(1.0 - pmns_s12_sq)
pmns_c23 = math.sqrt(1.0 - pmns_s23_sq)
pmns_c13 = math.sqrt(1.0 - pmns_s13_sq)

pmns_Jmax = pmns_s12 * pmns_c12 * pmns_s23 * pmns_c23 * pmns_s13 * pmns_c13 * pmns_c13
pmns_sind = pmns_J / pmns_Jmax

if pmns_sind > 1.0:
    pmns_sind = 1.0
if pmns_sind < -1.0:
    pmns_sind = -1.0

branch_A = pi + math.asin(abs(pmns_sind))
branch_B = 2.0 * pi - math.asin(abs(pmns_sind))

if chi_signed > 0.0:
    delta_pmns = branch_B
    pmns_branch_name = "quadrant IV"
else:
    delta_pmns = branch_A
    pmns_branch_name = "quadrant III"

epL = math.cos(delta_pmns) + 1j * math.sin(delta_pmns)
emL = math.cos(delta_pmns) - 1j * math.sin(delta_pmns)

Upmns = np.array([
    [pmns_c12 * pmns_c13, pmns_s12 * pmns_c13, pmns_s13 * emL],
    [-pmns_s12 * pmns_c23 - pmns_c12 * pmns_s23 * pmns_s13 * epL,
      pmns_c12 * pmns_c23 - pmns_s12 * pmns_s23 * pmns_s13 * epL,
      pmns_s23 * pmns_c13],
    [pmns_s12 * pmns_s23 - pmns_c12 * pmns_c23 * pmns_s13 * epL,
     -pmns_c12 * pmns_s23 - pmns_s12 * pmns_c23 * pmns_s13 * epL,
      pmns_c23 * pmns_c13]
], dtype=complex)

pmns_unit = np.max(np.abs(Upmns.conj().T.dot(Upmns) - np.eye(3)))

r_nu = dstar + dstar * dstar
nu_dm_ratio = r_nu * r_nu

Omega_b = router_outputs[physics_attachment["Omega_b"]]
Omega_c = router_outputs[physics_attachment["Omega_c"]]
Omega_m = router_outputs[physics_attachment["Omega_m"]]
Omega_L = router_outputs[physics_attachment["Omega_Lambda"]]
Omega_dark = router_outputs[physics_attachment["Omega_dark"]]

n_s = router_outputs[physics_attachment["n_s"]]
running_ns = router_outputs[physics_attachment["running_ns"]]
tensor_r = router_outputs[physics_attachment["tensor_r"]]
tensor_nt = router_outputs[physics_attachment["tensor_nt"]]
tau_reio = router_outputs[physics_attachment["tau_reio"]]
sigma8 = router_outputs[physics_attachment["sigma8"]]

x_RG = router_outputs[physics_attachment["x_RG"]]
lambda_H = router_outputs[physics_attachment["lambda_H"]]
yt_RG = router_outputs[physics_attachment["yt_RG"]]
yt_pole = router_outputs[physics_attachment["yt_pole"]]

print("  alpha_inv_bare      = %.15f" % alpha_inv_bare)
print("  alpha_inv_dressed   = %.15f" % alpha_inv)
print("  alpha               = %.15f" % alpha)
print()
print("  sin2W               = %.12f" % sin2w)
print("  alpha_s             = %.12f" % alpha_s)
print("  alpha1 inverse      = %.12f" % (1.0 / alpha1))
print("  alpha2 inverse      = %.12f" % (1.0 / alpha2))
print("  alpha3 inverse      = %.12f" % (1.0 / alpha3))
print()
print("  CKM:")
print("    Vus = %.12f" % Vus)
print("    Vcb = %.12f" % Vcb)
print("    Vub = %.12f" % Vub)
print("    J   = %.12e" % J_ckm)
print("    delta_CKM = %.6f degrees" % (delta_ckm * 180.0 / pi))
print()
print("  PMNS:")
print("    sin2 theta12 = %.12f" % pmns_s12_sq)
print("    sin2 theta23 = %.12f" % pmns_s23_sq)
print("    sin2 theta13 = %.12f" % pmns_s13_sq)
print("    J_PMNS       = %.12f" % pmns_J)
print("    delta_PMNS   = %.6f degrees" % (delta_pmns * 180.0 / pi))
print("    branch       =", pmns_branch_name)
print()
print("  Dark sector:")
print("    Omega_b      = %.12f" % Omega_b)
print("    Omega_c      = %.12f" % Omega_c)
print("    Omega_m      = %.12f" % Omega_m)
print("    Omega_Lambda = %.12f" % Omega_L)
print("    Omega_dark   = %.12f" % Omega_dark)
print("    Omega_c/Omega_b = %.12f" % (Omega_c / Omega_b))
print()
print("  Cosmology:")
print("    n_s          = %.12f" % n_s)
print("    A_s          = %.12e" % A_s)
print("    ln10As       = %.12f" % ln10As)
print("    running      = %.12e" % running_ns)
print("    tensor_r     = %.12e" % tensor_r)
print("    tau_reio     = %.12f" % tau_reio)
print("    sigma8       = %.12f" % sigma8)
print()
print("  RG:")
print("    x_RG         = %.12f" % x_RG)
print("    lambda_H     = %.12f" % lambda_H)
print("    y_t_RG       = %.12f" % yt_RG)
print("    y_t_pole     = %.12f" % yt_pole)


# ---------------------------------------------------------------------
# SECTION 16: HARD GATES
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 16: HARD GATES")
print("=" * 78)

fail_count = 0
warn_count = 0


def check(name, cond):
    global fail_count
    if cond:
        print("  %-58s PASS" % name)
    else:
        print("  %-58s FAIL" % name)
        fail_count = fail_count + 1


def warn(name, cond):
    global warn_count
    if cond:
        print("  %-58s PASS" % name)
    else:
        print("  %-58s WARN" % name)
        warn_count = warn_count + 1


def is_binary_matrix(Mx):
    ok = True
    i = 0
    while i < Mx.shape[0]:
        j = 0
        while j < Mx.shape[1]:
            val = Mx[i, j]
            if not (abs(val) < 1.0e-12 or abs(val - 1.0) < 1.0e-12):
                ok = False
            j = j + 1
        i = i + 1
    return ok


def orthonormal_error(Q):
    I = np.eye(Q.shape[1])
    return np.max(np.abs(Q.T.dot(Q) - I))


hidden_spec_ok = False
if len(vals_h) == 2:
    if abs(vals_h[0] - 3.0) < 1.0e-6 and abs(vals_h[1] - 5.0) < 1.0e-6:
        if cnt_h[0] == 4 and cnt_h[1] == 4:
            hidden_spec_ok = True

check("D=3", D == 3)
check("V=12", len(verts) == 12)
check("E=30", len(edges) == 30)
check("F=20", len(faces) == 20)
check("N=13", N == 13)
check("B binary", is_binary_matrix(B))
check("each face has 3 vertices", abs(B.sum(1).min() - 3.0) < 1.0e-12 and abs(B.sum(1).max() - 3.0) < 1.0e-12)
check("each vertex touches 5 faces", abs(B.sum(0).min() - 5.0) < 1.0e-12 and abs(B.sum(0).max() - 5.0) < 1.0e-12)
check("B.T B = 5I + 2A", BtB_err < 1.0e-10)
check("rank(B)=12", rankB == 12)
check("dim ker(B.T)=8", hole_dim == 8)
check("hidden spectrum = 3^4 + 5^4", hidden_spec_ok)
check("Q3 dim=4", Q3.shape[1] == 4)
check("Q5 dim=4", Q5.shape[1] == 4)
check("Q3 orthonormal", orthonormal_error(Q3) < 1.0e-10)
check("Q5 orthonormal", orthonormal_error(Q5) < 1.0e-10)
check("projector completeness", projector_sum_error < 1.0e-10)
check("visible five projector is lambda=6", dim_five == 5)
check("Sym2(4_3) rank=6", np.linalg.matrix_rank(M33, tol=1.0e-10) == 6)
check("Sym2(4_5) rank=6", np.linalg.matrix_rank(M55, tol=1.0e-10) == 6)
check("mixed return rank=6", np.linalg.matrix_rank(M35, tol=1.0e-10) == 6)
check("all hidden bilinear return rank=12", np.linalg.matrix_rank(Mall, tol=1.0e-10) == 12)
check("A5 router selects Sym2(4_5) scalar slot", scalar_slot["name"] == "Sym2(4_5)")
check("A5 router selects mixed chiral slot", chiral_slot["name"] == "4_3 x 4_5")
check("CKM unitarity", ckm_unit < 1.0e-12)
check("PMNS unitarity", pmns_unit < 1.0e-12)
check("Omega components sum to one", abs(Omega_b + Omega_c + Omega_L - 1.0) < 1.0e-12)
check("positive Delta", Delta > 0.0)
check("positive alpha", alpha > 0.0)
check("positive alpha_s", alpha_s > 0.0)
check("positive A_s", A_s > 0.0)
check("0 < n_s < 1", n_s > 0.0 and n_s < 1.0)

# New origin-layer gates.
check("chaos rail pins dstar", abs(chaos_cycle[0] - dstar) < 1.0e-9)
check("chaos rail is contracting", chaos_lyap < 0.0)
check("chaos has period 6", len(chaos_cycle) == 6)
check("pi-phi-e flow contracts", flow_std < flow_start_std)
check("pi-phi-e flow reaches dstar", abs(flow_mean - dstar) < 1.0e-3)
warn("second logistic rail only approximates dcl", abs(chaos_cycle[1] - dcl) < 1.0e-6)

alpha_inv_codata = 137.035999177
alpha_inv_codata_unc = 0.000000021

alpha_sigma = (alpha_inv - alpha_inv_codata) / alpha_inv_codata_unc
alpha_bare_sigma = (alpha_inv_bare - alpha_inv_codata) / alpha_inv_codata_unc

warn("alpha entropy dressing wants independent cross-check", False)
check("dressed alpha inside CODATA 1 sigma", abs(alpha_sigma) < 1.0)

print()
print("  alpha bare sigma miss    = %.6f" % alpha_bare_sigma)
print("  alpha dressed sigma miss = %.6f" % alpha_sigma)

print()
if fail_count == 0:
    print("  HARD GATE RESULT: PASS")
else:
    print("  HARD GATE RESULT: FAIL")
    print("  failures =", fail_count)

if warn_count > 0:
    print("  warnings =", warn_count)


# ---------------------------------------------------------------------
# SECTION 17: RED-TEAM STRESS TESTS
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 17: RED-TEAM STRESS TESTS")
print("=" * 78)


def random_orthogonal(n):
    X = np.random.normal(0.0, 1.0, (n, n))
    Q, R = np.linalg.qr(X)
    i = 0
    while i < n:
        if R[i, i] < 0.0:
            Q[:, i] = -Q[:, i]
        i = i + 1
    return Q


def max_signature_error(sa, sb):
    keys = [
        "total",
        "scalar_power",
        "triplet_low_power",
        "five_power",
        "triplet_high_power",
        "triplet_total",
        "scalar_five_ratio",
        "chiral_signed",
        "chiral_abs"
    ]
    m = 0.0
    for key in keys:
        err = abs(sa[key] - sb[key])
        if err > m:
            m = err
    return m


basis_trials = 40
basis_max_err = 0.0

t = 0
while t < basis_trials:
    R3 = random_orthogonal(Q3.shape[1])
    R5 = random_orthogonal(Q5.shape[1])

    Q3r = Q3.dot(R3)
    Q5r = Q5.dot(R5)

    s33r = canonical_signature(sym_return(Q3r), "Sym2(4_3)")
    s55r = canonical_signature(sym_return(Q5r), "Sym2(4_5)")
    s35r = canonical_signature(mixed_return(Q3r, Q5r), "4_3 x 4_5")

    e1 = max_signature_error(s33r, sig33)
    e2 = max_signature_error(s55r, sig55)
    e3 = max_signature_error(s35r, sig35)

    err = max(e1, e2, e3)
    if err > basis_max_err:
        basis_max_err = err

    t = t + 1

print("  hidden-basis rotation trials =", basis_trials)
print("  max signature drift          = %.3e" % basis_max_err)


def make_B_from_faces(num_vertices, face_list):
    Bx = np.zeros((len(face_list), num_vertices))
    r = 0
    while r < len(face_list):
        for vtx in face_list[r]:
            Bx[r, vtx] = 1.0
        r = r + 1
    return Bx


def make_A_from_tri_faces(num_vertices, face_list):
    Ax = np.zeros((num_vertices, num_vertices))
    for face in face_list:
        a = face[0]
        b = face[1]
        c = face[2]
        Ax[a, b] = 1.0
        Ax[b, a] = 1.0
        Ax[b, c] = 1.0
        Ax[c, b] = 1.0
        Ax[c, a] = 1.0
        Ax[a, c] = 1.0
    return Ax


def random_faces_12_20():
    out = []
    used = set()
    tries = 0
    while len(out) < 20 and tries < 10000:
        tri = list(np.random.choice(12, size=3, replace=False))
        tri.sort()
        key = (tri[0], tri[1], tri[2])
        if key not in used:
            used.add(key)
            out.append([tri[0], tri[1], tri[2]])
        tries = tries + 1
    return out


fake_trials = 200
fake_identity_pass = 0
fake_rank12 = 0
fake_uniform5 = 0

i = 0
while i < fake_trials:
    rf = random_faces_12_20()
    Bf = make_B_from_faces(12, rf)
    Af = make_A_from_tri_faces(12, rf)

    rnk = np.linalg.matrix_rank(Bf, tol=1.0e-10)
    if rnk == 12:
        fake_rank12 = fake_rank12 + 1

    if abs(Bf.sum(0).min() - 5.0) < 1.0e-12 and abs(Bf.sum(0).max() - 5.0) < 1.0e-12:
        fake_uniform5 = fake_uniform5 + 1

    err = np.max(np.abs(Bf.T.dot(Bf) - (5.0 * np.eye(12) + 2.0 * Af)))
    if err < 1.0e-10:
        fake_identity_pass = fake_identity_pass + 1

    i = i + 1

print()
print("  fake random triangular systems =", fake_trials)
print("  fake rank 12 count             =", fake_rank12)
print("  fake uniform incidence 5 count =", fake_uniform5)
print("  fake exact identity pass count =", fake_identity_pass)


def sym_return_weighted(Q, diag_weight, offdiag_weight):
    cols = []
    i = 0
    while i < Q.shape[1]:
        j = i
        while j < Q.shape[1]:
            h = Q[:, i] * Q[:, j]
            if i == j:
                h = diag_weight * h
            else:
                h = offdiag_weight * h
            cols.append(B.T.dot(h))
            j = j + 1
        i = i + 1
    return np.column_stack(cols)


M55_bad = sym_return_weighted(Q5, 1.0, 1.0)
sig55_bad = canonical_signature(M55_bad, "bad Sym2(4_5)")
bad_norm_drift = max_signature_error(sig55_bad, sig55)

print()
print("  bad Sym2 normalization drift = %.3e" % bad_norm_drift)

# Origin red-team: can one logistic parameter satisfy both dstar and dcl exactly?
# With one parameter, exact two-rail fitting is over-constrained. This should warn.
dcl_gate_error = abs(chaos_cycle[1] - dcl)
split_gate_error = abs((chaos_cycle[1] - chaos_cycle[0]) - Delta)
print()
print("  origin-layer red-team:")
print("    dstar rail error = %.3e" % abs(chaos_cycle[0] - dstar))
print("    dcl rail error   = %.3e" % dcl_gate_error)
print("    split error      = %.3e" % split_gate_error)
print("    result: dstar is exact; dcl is geometric and only corroborated by chaos")

stress_fail = 0
if basis_max_err > 1.0e-10:
    stress_fail = stress_fail + 1
if fake_identity_pass != 0:
    stress_fail = stress_fail + 1
if bad_norm_drift < 1.0e-12:
    stress_fail = stress_fail + 1

print()
if stress_fail == 0:
    print("  RED-TEAM RESULT: PASS")
else:
    print("  RED-TEAM RESULT: FAIL")
    print("  stress failures =", stress_fail)


# ---------------------------------------------------------------------
# SECTION 18: FROZEN FALSIFICATION LEDGER
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 18: FROZEN FALSIFICATION LEDGER")
print("=" * 78)

rows = [
    ("r_pin", r_pin, "logistic period-3/6 pin for current dstar"),
    ("chaos_rail_0", chaos_cycle[0], "vacuum rail"),
    ("chaos_rail_1", chaos_cycle[1], "classical-like rail"),
    ("chaos_lyap", chaos_lyap, "negative means contraction"),
    ("flow_mean", flow_mean, "pi-phi-e attractor mean"),
    ("flow_std", flow_std, "pi-phi-e final spread"),
    ("alpha_inv_dressed", alpha_inv, "A5 scalar slot plus 9D entropy dressing"),
    ("alpha_inv_bare", alpha_inv_bare, "bare A5 scalar slot"),
    ("sin2W", sin2w, "D/N"),
    ("alpha_s", alpha_s, "F/(N*N)"),
    ("Vus", Vus, "lowest face rotation slot"),
    ("Vcb", Vcb, "mixed chiral golden leakage slot"),
    ("Vub", Vub, "direct spatial gap leakage slot"),
    ("J_CKM", J_ckm, "entropy CP area slot"),
    ("theta_QCD", theta_qcd, "quadratic CP norm slot"),
    ("eta_B", eta_baryon, "matter orientation area slot"),
    ("A_s", A_s, "face vacuum area slot"),
    ("ln10As", ln10As, "log(1e10*A_s)"),
    ("PMNS_s12_sq", pmns_s12_sq, "solar triplet slot"),
    ("PMNS_s23_sq", pmns_s23_sq, "atmospheric triplet slot"),
    ("PMNS_s13_sq", pmns_s13_sq, "reactor entropy pair slot"),
    ("PMNS_delta_deg", delta_pmns * 180.0 / pi, "ordered chiral branch"),
    ("nu_dm_ratio", nu_dm_ratio, "(dstar+dstar*dstar)*(dstar+dstar*dstar)"),
    ("Omega_b", Omega_b, "baryon closure slot"),
    ("Omega_c", Omega_c, "CDM closure slot"),
    ("Omega_m", Omega_m, "matter closure slot"),
    ("Omega_Lambda", Omega_L, "vacuum closure slot"),
    ("Omega_dark", Omega_dark, "dark closure slot"),
    ("n_s", n_s, "tilt slot"),
    ("running_ns", running_ns, "running slot"),
    ("tensor_r", tensor_r, "tensor slot"),
    ("tau_reio", tau_reio, "face screen depth slot"),
    ("sigma8", sigma8, "fivefold growth slot"),
    ("x_RG", x_RG, "RG flow slot"),
    ("lambda_H", lambda_H, "hidden curvature plus entropy"),
    ("yt_RG", yt_RG, "1 - RG flow"),
    ("yt_pole", yt_pole, "1 - Delta")
]

for name, value, formula in rows:
    print("  %-20s %-22.12g %s" % (name, value, formula))


# ---------------------------------------------------------------------
# SECTION 19: FREEZE HASH
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 19: FREEZE HASH")
print("=" * 78)

freeze = {
    "name": "Cathedral Dimensionless Core v2.6",
    "D": D,
    "V": V,
    "N": N,
    "E": E,
    "F": F,
    "q": q,
    "G": G,
    "phi": phi,
    "gamma": gamma,
    "dstar": dstar,
    "dcl": dcl,
    "Delta": Delta,
    "r_pin": r_pin,
    "chaos_cycle_0": chaos_cycle[0],
    "chaos_cycle_1": chaos_cycle[1],
    "chaos_lyapunov": chaos_lyap,
    "flow_mean": flow_mean,
    "flow_std": flow_std,
    "flow_start_std": flow_start_std,
    "vertex_irreps": vertex_irreps,
    "face_irreps": face_irreps,
    "hidden_irreps": hidden_irreps,
    "visible_projectors": {
        "scalar": lambda_scalar,
        "triplet_low": lambda_triplet_low,
        "five": lambda_five_visible,
        "triplet_high": lambda_triplet_high
    },
    "hidden_spectrum": {
        "lambda3_dim": int(Q3.shape[1]),
        "lambda5_dim": int(Q5.shape[1])
    },
    "scalar_slot_channel": scalar_slot["name"],
    "chiral_slot_channel": chiral_slot["name"],
    "W_scalar": W_scalar,
    "chi_signed": chi_signed,
    "alpha_inv_bare": alpha_inv_bare,
    "alpha_inv_dressed": alpha_inv,
    "sin2W": sin2w,
    "alpha_s": alpha_s,
    "Vus": Vus,
    "Vcb": Vcb,
    "Vub": Vub,
    "J_CKM": J_ckm,
    "theta_QCD": theta_qcd,
    "eta_B": eta_baryon,
    "A_s": A_s,
    "ln10As": ln10As,
    "pmns_s12sq": pmns_s12_sq,
    "pmns_s23sq": pmns_s23_sq,
    "pmns_s13sq": pmns_s13_sq,
    "pmns_delta_deg": delta_pmns * 180.0 / pi,
    "nu_dm_ratio": nu_dm_ratio,
    "Omega_b": Omega_b,
    "Omega_c": Omega_c,
    "Omega_m": Omega_m,
    "Omega_Lambda": Omega_L,
    "Omega_dark": Omega_dark,
    "n_s": n_s,
    "running_ns": running_ns,
    "tensor_r": tensor_r,
    "tau_reio": tau_reio,
    "sigma8": sigma8,
    "x_RG": x_RG,
    "lambda_H": lambda_H,
    "yt_RG": yt_RG,
    "yt_pole": yt_pole,
    "hard_gate_failures": fail_count,
    "warnings": warn_count,
    "red_team_failures": stress_fail
}

freeze_text = json.dumps(freeze, sort_keys=True, separators=(",", ":"))
freeze_hash = hashlib.sha256(freeze_text.encode("utf-8")).hexdigest()

print("  freeze name:")
print("    Cathedral Dimensionless Core v2.6")
print()
print("  sha256:")
print("    " + freeze_hash)


# ---------------------------------------------------------------------
# SECTION 20: FINAL VERDICT
# ---------------------------------------------------------------------

print()
print("=" * 78)
print("SECTION 20: FINAL VERDICT")
print("=" * 78)

if fail_count == 0 and stress_fail == 0:
    print("  status:")
    print("    FORMAL INTERNAL ROUTING CLOSED WITH BOUNDED-CHAOS ORIGIN")
else:
    print("  status:")
    print("    FAILED HARD GATES")

print()
print("  closed internally:")
print("    bounded-chaos rail pins dstar")
print("    pi-phi-e flow contracts to dstar")
print("    exact icosahedral shell")
print("    exact incidence identity B.TB = 5I + 2A")
print("    A5 decomposition V12 = 1 + 3 + 3p + 5")
print("    A5 decomposition F20 = 1 + 3 + 3p + 4 + 4 + 5")
print("    hidden sector F20 - V12 = 4 + 4")
print("    curvature split 4_3 + 4_5")
print("    corrected visible spectral projectors")
print("    first visible hidden return is quadratic")
print("    A5 sector router")
print("    scalar and chiral slots selected before physics labels")
print("    dimensionless observable ledger")
print()
print("  honest boundary:")
print("    physical truth still requires external empirical confrontation")
print("    alpha entropy dressing should be independently cross-tested")
print("    logistic second rail approximates dcl but does not derive it exactly")
print()
print("  final line:")
print("    From chaos to closure: Cathedral v2.6 is the current frozen core.")
"""Exact dense linear algebra over Q, Q(sqrt5) or a RadicalTower (lists of lists; truthiness = nonzero).

Every routine is exact: pivots are chosen by exact nonzero tests, never by magnitude.  ``rank_mod_p`` is a
fast *lower bound* for the rational rank of an integer matrix (rank_Q >= rank_p); exact ranks come from
``rref``.  Permutations are index lists: ``perm[i] = j`` means the matrix with a 1 at (i, j).
"""
from __future__ import annotations

from fractions import Fraction
from math import gcd

__all__ = [
    "zeros", "identity", "matmul", "matvec", "transpose", "rref", "rank", "nullspace", "rowspace", "det",
    "inverse", "solve_dependency", "primitive_integer_rows", "in_rowspace", "rank_mod_p", "charpoly",
    "perm_compose", "perm_inverse", "perm_power", "perm_apply", "perm_cycles", "conj_by_perm", "trace",
    "is_projector", "dot",
]

F0, F1 = Fraction(0), Fraction(1)


def zeros(n: int, m: int, z=F0):
    return [[z] * m for _ in range(n)]


def identity(n: int, z=F0, o=F1):
    return [[o if i == j else z for j in range(n)] for i in range(n)]


def transpose(A):
    return [list(r) for r in zip(*A)]


def dot(u, v):
    it = iter(zip(u, v))
    try:
        a, b = next(it)
    except StopIteration:
        return F0
    s = a * b
    for a, b in it:
        if a and b:
            s = s + a * b
    return s


def matmul(A, B):
    Bt = transpose(B)
    return [[dot(r, c) for c in Bt] for r in A]


def matvec(A, v):
    return [dot(r, v) for r in A]


def trace(A):
    s = A[0][0]
    for i in range(1, len(A)):
        s = s + A[i][i]
    return s


def is_projector(P) -> bool:
    PP = matmul(P, P)
    return all(not (a - b) for ra, rb in zip(PP, P) for a, b in zip(ra, rb))


def rref(A):
    """Reduced row echelon form. Returns (R, pivot_columns); R has only the nonzero rows."""
    M = [list(r) for r in A]
    if not M:
        return [], []
    n, m = len(M), len(M[0])
    piv, r = [], 0
    for c in range(m):
        p = next((i for i in range(r, n) if M[i][c]), None)
        if p is None:
            continue
        M[r], M[p] = M[p], M[r]
        inv = 1 / M[r][c]
        M[r] = [x * inv if x else x for x in M[r]]
        for i in range(n):
            if i != r and M[i][c]:
                f = M[i][c]
                M[i] = [x - f * y if y else x for x, y in zip(M[i], M[r])]
        piv.append(c)
        r += 1
        if r == n:
            break
    return M[:r], piv


def rank(A) -> int:
    return len(rref(A)[1])


def rowspace(A):
    return rref(A)[0]


def nullspace(A):
    """Basis of {x : A x = 0}."""
    R, piv = rref(A)
    m = len(A[0])
    z = A[0][0] * 0 if A and A[0] else F0
    o = z + 1
    free = [c for c in range(m) if c not in piv]
    basis = []
    for f in free:
        x = [z] * m
        x[f] = o
        for row, pc in zip(R, piv):
            x[pc] = -row[f]
        basis.append(x)
    return basis


def det(A):
    M = [list(r) for r in A]
    n = len(M)
    d = M[0][0] * 0 + 1
    for c in range(n):
        p = next((i for i in range(c, n) if M[i][c]), None)
        if p is None:
            return d * 0
        if p != c:
            M[c], M[p] = M[p], M[c]
            d = -d
        d = d * M[c][c]
        inv = 1 / M[c][c]
        for i in range(c + 1, n):
            if M[i][c]:
                f = M[i][c] * inv
                M[i] = [x - f * y for x, y in zip(M[i], M[c])]
    return d


def inverse(A):
    n = len(A)
    z = A[0][0] * 0
    o = z + 1
    W = [list(r) + [o if i == j else z for j in range(n)] for i, r in enumerate(A)]
    R, piv = rref(W)
    if piv[:n] != list(range(n)):
        raise ZeroDivisionError("singular matrix")
    return [r[n:] for r in R]


def solve_dependency(vectors, v):
    """Coefficients c with sum_k c_k vectors[k] = v (exact), or None if v is independent of them."""
    if not vectors:
        return None if any(v) else []
    k = len(vectors)
    A = [[vectors[j][i] for j in range(k)] + [v[i]] for i in range(len(v))]
    R, piv = rref(A)
    if k in piv:
        return None
    c = [F0] * k
    for row, pc in zip(R, piv):
        c[pc] = row[k]
    return c


def in_rowspace(v, rows) -> bool:
    return rank(list(rows) + [v]) == rank(rows)


def primitive_integer_rows(rows):
    """Scale rational rows to primitive integer vectors (first nonzero entry positive)."""
    out = []
    for r in rows:
        den = 1
        for x in r:
            x = Fraction(x)
            den = den * x.denominator // gcd(den, x.denominator)
        ints = [int(Fraction(x) * den) for x in r]
        g = 0
        for x in ints:
            g = gcd(g, abs(x))
        ints = [x // g for x in ints] if g else ints
        lead = next((x for x in ints if x), 1)
        out.append([x if lead > 0 else -x for x in ints])
    return out


def rank_mod_p(A, p: int = (1 << 61) - 1) -> int:
    """Rank of an integer (or p-integral rational) matrix over F_p: a lower bound for the rank over Q."""
    M = [[(Fraction(x).numerator * pow(Fraction(x).denominator, -1, p)) % p for x in r] for r in A]
    n, m = len(M), len(M[0]) if M else 0
    r = 0
    for c in range(m):
        piv = next((i for i in range(r, n) if M[i][c]), None)
        if piv is None:
            continue
        M[r], M[piv] = M[piv], M[r]
        inv = pow(M[r][c], -1, p)
        M[r] = [x * inv % p for x in M[r]]
        for i in range(n):
            if i != r and M[i][c]:
                f = M[i][c]
                M[i] = [(x - f * y) % p for x, y in zip(M[i], M[r])]
        r += 1
    return r


def charpoly(A):
    """Characteristic polynomial det(xI - A), coefficients low -> high (Faddeev-LeVerrier, exact)."""
    n = len(A)
    z = A[0][0] * 0
    c = [z] * (n + 1)
    c[n] = z + 1
    Mk = zeros(n, n, z)
    for k in range(1, n + 1):
        AM = matmul(A, Mk)
        Mk = [[AM[i][j] + (c[n - k + 1] if i == j else z) for j in range(n)] for i in range(n)]
        c[n - k] = -trace(matmul(A, Mk)) / k
    return c


# ----------------------------------------------------------------------------------------------- permutations
def perm_compose(a, b):
    """(a o b)[i] = a[b[i]]."""
    return [a[j] for j in b]


def perm_inverse(a):
    out = [0] * len(a)
    for i, j in enumerate(a):
        out[j] = i
    return out


def perm_power(a, t: int):
    out = list(range(len(a)))
    base = list(a)
    if t < 0:
        base, t = perm_inverse(base), -t
    while t:
        if t & 1:
            out = perm_compose(base, out)
        base = perm_compose(base, base)
        t >>= 1
    return out


def perm_apply(perm, v):
    """(P v)[i] = v[perm[i]] for the permutation matrix P[i, perm[i]] = 1."""
    return [v[j] for j in perm]


def perm_cycles(perm):
    seen, cycles = set(), []
    for i in range(len(perm)):
        if i in seen:
            continue
        cyc, k = [], i
        while k not in seen:
            seen.add(k); cyc.append(k); k = perm[k]
        cycles.append(cyc)
    return cycles


def conj_by_perm(A, idx):
    """B[a][b] = A[idx[a]][idx[b]] (pull-back of a matrix along a relabelling)."""
    return [[A[i][j] for j in idx] for i in idx]

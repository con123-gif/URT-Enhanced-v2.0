#!/usr/bin/env python3
"""Exact checks for the Hodge-frame kernel and column-update algebra.

This is an audit certificate, not a model of the p-adic period rings.  It
checks the two finite algebraic identities used in the source proof:

* the inverse-weight kernel transport forced by N g(P) D = P;
* determinant-one, equal-weight column replacement and exact division of
  the improved column by a uniformizer.
"""

from itertools import product


def mat_mul(a, b, mod=None):
    rows, inner, cols = len(a), len(b), len(b[0])
    out = [[sum(a[i][k] * b[k][j] for k in range(inner))
            for j in range(cols)] for i in range(rows)]
    if mod is not None:
        out = [[x % mod for x in row] for row in out]
    return out


def mat_vec(a, v, mod=None):
    out = [sum(row[j] * v[j] for j in range(len(v))) for row in a]
    if mod is not None:
        out = [x % mod for x in out]
    return out


def det(a):
    if len(a) == 0:
        return 1
    if len(a) == 1:
        return a[0][0]
    return sum(((-1) ** j) * a[0][j] * det(
        [row[:j] + row[j + 1:] for row in a[1:]])
        for j in range(len(a)))


def identity(n):
    return [[int(i == j) for j in range(n)] for i in range(n)]


def update_column(a, j, column):
    out = [row[:] for row in a]
    for i, x in enumerate(column):
        out[i][j] = x
    return out


def diag(xs):
    return [[x if i == j else 0 for j in range(len(xs))]
            for i, x in enumerate(xs)]


def check_equal_weight_updates():
    cases = 0
    for n in (2, 3):
        for weights in product((-1, 0, 1), repeat=n):
            scalars = [2 ** (w + 1) for w in weights]
            d = diag(scalars)
            for nu in range(n):
                for a in product((-2, -1, 0, 1, 2), repeat=n):
                    if a[nu] != 1:
                        continue
                    if any(x and weights[i] != weights[nu]
                           for i, x in enumerate(a)):
                        continue
                    e = update_column(identity(n), nu, a)
                    assert det(e) == 1
                    assert mat_mul(d, e) == mat_mul(e, d)
                    cases += 1
    assert cases == 483
    return cases


def check_exact_determinant_drop():
    cases = 0
    # Exhaustive 2x2 and a bounded, exact 3x3 family.  The identity checked
    # is general; enumeration supplies a regression test for implementation
    # errors and the integrality guard.
    for n, alphabet in ((2, (-1, 0, 1)), (3, (0, 1))):
        for flat in product(alphabet, repeat=n * n):
            pmat = [list(flat[i * n:(i + 1) * n]) for i in range(n)]
            if det(pmat) == 0:
                continue
            for nu in range(n):
                for a in product((-1, 0, 1), repeat=n):
                    if a[nu] != 1:
                        continue
                    e = update_column(identity(n), nu, a)
                    pe = mat_mul(pmat, e)
                    assert det(pe) == det(pmat)
                    pa = mat_vec(pmat, a)
                    for prime in (2, 3):
                        if not all(x % prime == 0 for x in pa):
                            continue
                        improved = [row[:] for row in pe]
                        for i in range(n):
                            improved[i][nu] //= prime
                        assert prime * det(improved) == det(pmat)
                        cases += 1
    assert cases == 104
    return cases


def check_inverse_weight_transport():
    # Exhaust all 2x2 matrices over F_3.  Here g is the identity finite-field
    # automorphism.  Whenever N P D = P, P w = 0 implies
    # P D^{-1} w = 0, exactly mirroring the source's minus exponent.
    p = 3
    matrices = [
        [list(x[:2]), list(x[2:])]
        for x in product(range(p), repeat=4)
    ]
    checked = 0
    for pv in matrices:
        for nmat in matrices:
            for diagonal in product((1, 2), repeat=2):
                d = diag(diagonal)
                dinv = diag([pow(x, -1, p) for x in diagonal])
                if mat_mul(mat_mul(nmat, pv, p), d, p) != pv:
                    continue
                for w in product(range(p), repeat=2):
                    if mat_vec(pv, w, p) != [0, 0]:
                        continue
                    assert mat_vec(pv, mat_vec(dinv, w, p), p) == [0, 0]
                    checked += 1
    assert checked == 5700
    return checked


def negative_controls():
    # Unequal weights: the replacement need not commute with the diagonal.
    d = diag([2, 4])
    e = update_column(identity(2), 0, [1, 1])
    assert mat_mul(d, e) != mat_mul(e, d)

    # Missing normalization: determinant one is lost.
    e_bad = update_column(identity(2), 0, [2, 0])
    assert det(e_bad) == 2 != 1

    # Missing divisibility: the improved column is not integral.
    pmat = [[1, 0], [0, 1]]
    a = [1, 0]
    assert any(x % 2 for x in mat_vec(pmat, a))


def main():
    updates = check_equal_weight_updates()
    drops = check_exact_determinant_drop()
    kernels = check_inverse_weight_transport()
    negative_controls()
    print("HODGE_FRAME_COLUMN_UPDATE_AUDIT")
    print(f"equal_weight_updates={updates}")
    print(f"exact_determinant_drops={drops}")
    print(f"inverse_weight_kernel_cases={kernels}")
    print("negative_controls=3")
    print("RESULT=PASS (finite algebraic identities only)")


if __name__ == "__main__":
    main()

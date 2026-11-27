"""Reproduce the exact MO198816 counterexample using only Python rationals.

This is an exact finite witness check, not a Lean/kernel verification.
Run from any directory; the public witness JSON is written next to this file.
"""
from fractions import Fraction as F
import json
from pathlib import Path


def add(z, w):
    return z[0] + w[0], z[1] + w[1]


def mul(z, w):
    return z[0] * w[0] - z[1] * w[1], z[0] * w[1] + z[1] * w[0]


def scale(a, z):
    return a * z[0], a * z[1]


def csum(zs):
    re = im = F(0)
    for z in zs:
        re += z[0]
        im += z[1]
    return re, im


def div(z, w):
    return scale(1 / (w[0] ** 2 + w[1] ** 2), mul(z, (w[0], -w[1])))


def main():
    n = 13
    epsilon = F(1, 10000)
    delta = F(1, 1000000)
    lam = F(3151, 3200), F(7, 40)
    one, zero = (F(1), F(0)), (F(0), F(0))
    b = div((1 - epsilon, F(0)), add(scale(2, lam), (-F(1), F(0))))
    powers = [one]
    for _ in range(1, n):
        powers.append(mul(powers[-1], b))
    x = [add(one, scale(-1, powers[i + 1])) for i in range(n - 1)]
    x.append(csum(powers))
    assert csum(x) == (F(n), F(0))

    # w = delta*1 + alpha*e0 + beta*e3 + gamma*e12.
    # The three affine equations enforce sum(w)=1 and w dot x=0.
    total = 1 - n * delta
    a0, c0 = x[0]
    a3, c3 = x[3]
    az, cz = x[-1]
    A, B, C, D = a0 - az, a3 - az, c0 - cz, c3 - cz
    U, V = -n * delta - total * az, -total * cz
    determinant = A * D - B * C
    assert determinant != 0
    alpha = (U * D - B * V) / determinant
    beta = (A * V - U * C) / determinant
    gamma = total - alpha - beta
    w = [delta] * n
    w[0] += alpha
    w[3] += beta
    w[-1] += gamma
    assert min(w) > 0
    assert sum(w) == 1
    assert csum(scale(wi, xi) for wi, xi in zip(w, x)) == zero

    # S sends j to min(j+1,n-1); P=(I+(1-epsilon)S+epsilon*J/n)/2.
    P = [[epsilon / (2 * n)
          + (F(1, 2) if i == j else F(0))
          + ((1 - epsilon) / 2 if i == min(j + 1, n - 1) else F(0))
          for j in range(n)] for i in range(n)]
    assert min(min(row) for row in P) > 0
    assert all(sum(P[i][j] for i in range(n)) == 1 for j in range(n))
    assert all(2 * P[i][i] > sum(P[i]) for i in range(n))
    assert all(2 * P[j][j] > sum(P[i][j] for i in range(n)) for j in range(n))
    Px = [csum(scale(P[i][j], x[j]) for j in range(n)) for i in range(n)]
    assert all(Px[i] == add(mul(lam, x[i]), add(one, scale(-1, lam)))
               for i in range(n))

    c = add(div(one, lam), (-F(1), F(0)))
    assert c == (F(-159201, 10242401), F(-1792000, 10242401))
    v = [add(xi, c) for xi in x]
    wv = csum(scale(wi, vi) for wi, vi in zip(w, v))
    assert wv == c
    Pv = [csum(scale(P[i][j], v[j]) for j in range(n)) for i in range(n)]
    assert all(Pv[i] == add(mul(lam, v[i]), scale(sum(P[i]), c))
               for i in range(n))
    Av = [csum(scale(P[i][j], add(v[j], scale(-1, wv))) for j in range(n))
          for i in range(n)]
    assert all(Av[i] == mul(lam, v[i]) for i in range(n))
    assert v[0] != zero
    norm_square_excess = lam[0] ** 2 + lam[1] ** 2 - 1
    assert norm_square_excess == F(2401, 10240000) > 0

    data = {
        "n": n, "epsilon": str(epsilon), "lambda": list(map(str, lam)),
        "delta": str(delta), "support_indices": [0, 3, 12],
        "extra_weights": list(map(str, (alpha, beta, gamma))),
        "weights": list(map(str, w)), "b": list(map(str, b)),
        "x": [list(map(str, z)) for z in x],
        "v": [list(map(str, z)) for z in v],
        "P": [list(map(str, row)) for row in P],
        "norm_square_excess": str(norm_square_excess),
        "exact_checks": [
            "P_strictly_positive", "column_stochastic", "strict_row_DD",
            "strict_column_DD", "w_strictly_positive", "sum_w_1",
            "norm_lambda_gt_1", "resolvent_identity", "w_dot_x_zero",
            "v_nonzero", "P_v_identity", "A_v_eq_lambda_v"],
        "status": "Exact rational witness verified; Lean verification not asserted."
    }
    destination = Path(__file__).with_name("mo198816_exact_witness.json")
    destination.write_text(json.dumps(data, indent=2) + "\n")
    print(json.dumps({"status": "all exact checks passed", "n": n,
                      "lambda_norm_square_minus_one": str(norm_square_excess),
                      "minimum_weight": str(min(w)),
                      "extra_weights_approx": list(map(float, (alpha, beta, gamma))),
                      "witness_file": str(destination)}))


if __name__ == "__main__":
    main()

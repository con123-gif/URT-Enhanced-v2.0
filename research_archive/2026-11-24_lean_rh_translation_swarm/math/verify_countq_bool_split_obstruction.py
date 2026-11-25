#!/usr/bin/env python3
"""Exact finite certificate for the CountQ quadratic-twist Boolean obstruction.

This does not model the full admissibility predicate.  It verifies that the exact
group-theoretic data used by `resTwo` and `bit_of_fibre` do not imply uniqueness,
even in rank two, and gives a rational prime split in six sample quadratic fields.
All matrix arithmetic is integral.
"""

from itertools import permutations, product
from fractions import Fraction
from math import gcd, isqrt, prod


def compose(p, q):
    """Permutation p after q."""
    return tuple(p[q[i]] for i in range(3))


def act(p, v):
    out = [0, 0, 0]
    for i, x in enumerate(v):
        out[p[i]] = x
    return tuple(out)


def standard_matrix(p):
    """S3 standard representation in b1=(1,-1,0), b2=(0,1,-1)."""
    cols = []
    for b in ((1, -1, 0), (0, 1, -1)):
        a = act(p, b)
        assert sum(a) == 0
        cols.append((a[0], -a[2]))
    return ((cols[0][0], cols[1][0]), (cols[0][1], cols[1][1]))


def mmul(a, b):
    return tuple(
        tuple(sum(a[i][k] * b[k][j] for k in range(2)) for j in range(2))
        for i in range(2)
    )


def smul(c, a):
    return tuple(tuple(c * x for x in row) for row in a)


def trace(a):
    return a[0][0] + a[1][1]


def rational_rank(rows):
    a = [[Fraction(x) for x in row] for row in rows]
    rank = 0
    for col in range(len(a[0])):
        pivot = next((i for i in range(rank, len(a)) if a[i][col]), None)
        if pivot is None:
            continue
        a[rank], a[pivot] = a[pivot], a[rank]
        q = a[rank][col]
        a[rank] = [x / q for x in a[rank]]
        for i in range(len(a)):
            if i != rank and a[i][col]:
                q = a[i][col]
                a[i] = [x - q * y for x, y in zip(a[i], a[rank])]
        rank += 1
    return rank


def commutant_dimension(matrices):
    # Unknown X=(x00,x01,x10,x11); append four equations from XA-AX=0.
    rows = []
    basis = (
        ((1, 0), (0, 0)),
        ((0, 1), (0, 0)),
        ((0, 0), (1, 0)),
        ((0, 0), (0, 1)),
    )
    for a in matrices:
        diffs = []
        for x in basis:
            xa = mmul(x, a)
            ax = mmul(a, x)
            diffs.append(tuple(xa[i][j] - ax[i][j] for i in range(2) for j in range(2)))
        for entry in range(4):
            rows.append([diffs[var][entry] for var in range(4)])
    return 4 - rational_rank(rows)


def is_prime(n):
    if n < 2:
        return False
    if n % 2 == 0:
        return n == 2
    for d in range(3, isqrt(n) + 1, 2):
        if n % d == 0:
            return False
    return True


def main():
    s3 = list(permutations(range(3)))
    ident = (0, 1, 2)
    gamma = list(product(s3, (0, 1)))

    def mul(x, y):
        return compose(x[0], y[0]), (x[1] + y[1]) % 2

    def delta(x):
        return -1 if x[1] else 1

    def r0(x):
        return standard_matrix(x[0])

    def r1(x):
        return smul(delta(x), standard_matrix(x[0]))

    hom_checks = 0
    for x in gamma:
        for y in gamma:
            assert r0(mul(x, y)) == mmul(r0(x), r0(y))
            assert r1(mul(x, y)) == mmul(r1(x), r1(y))
            assert delta(mul(x, y)) == delta(x) * delta(y)
            hom_checks += 1

    # The restrictions to the index-two kernel of delta are exactly equal.
    kernel = [x for x in gamma if delta(x) == 1]
    assert len(kernel) == 6
    assert all(r0(x) == r1(x) for x in kernel)
    # Schur commutant has only scalars; over characteristic zero this standard
    # finite-group representation is irreducible.
    comm_dim = commutant_dimension([r0((p, 0)) for p in s3])
    assert comm_dim == 1

    # The central nonsplit element distinguishes the global representations.
    z = (ident, 1)
    assert trace(r0(z)) == 2 and trace(r1(z)) == -2

    # A split local observation cannot distinguish them.
    split_frob = ((1, 0, 2), 0)
    assert delta(split_frob) == 1
    assert r0(split_frob) == r1(split_frob)

    # The abstract bit_of_fibre assumptions are sharp on a two-point fibre.
    X = (0, 1)
    R = lambda x, y: x == y
    Q = lambda _x, _u: True
    assert all(R(y, x) for x in X for y in X if R(x, y))
    assert all(R(x, z0) for x in X for y in X for z0 in X if R(x, y) and R(y, z0))
    h2_checks = 0
    for x0, x, xp in product(X, repeat=3):
        if Q(x0, None) and Q(x, None) and Q(xp, None) and not R(x0, x) and not R(x0, xp):
            assert R(x, xp)
            h2_checks += 1
    # U is a singleton, so a U-only label necessarily collides on 0 and 1.
    assert not R(0, 1)
    # U x Bool separates them.
    labels = {x: (None, bool(x)) for x in X}
    assert labels[0] != labels[1]

    # Concrete arithmetic blind spot: six q == 3 mod 4 and a prime p == 1
    # mod 4*prod(q).  Hence (-q/p)=1 for all q, so p splits in every
    # Q(sqrt(-q)).  M absorbs all six discriminant primes while gcd(M,p)=1.
    qs = [3, 7, 11, 19, 23, 31]
    assert all(is_prime(q) and q % 4 == 3 for q in qs)
    M = prod(qs)
    modulus = 4 * M
    p = 25_034_857
    assert p == 1 + 2 * modulus
    assert is_prime(p) and gcd(p, M) == 1
    legendre = [pow((-q) % p, (p - 1) // 2, p) for q in qs]
    assert legendre == [1] * len(qs)

    print("COUNTQ BOOL SPLIT-PRIME OBSTRUCTION CERTIFICATE")
    print(f"rank-two group homomorphism checks={2 * hom_checks}")
    print(f"quadratic-character checks={hom_checks}")
    print(f"restriction-kernel size={len(kernel)}")
    print(f"restricted standard-representation commutant dimension={comm_dim}")
    print("global central traces=2,-2")
    print("split local matrices equal=True")
    print(f"bit_of_fibre nontrivial h2 cases={h2_checks}")
    print(f"sample discriminant primes={qs}")
    print(f"M={M}, modulus={modulus}, split prime={p}")
    print(f"Kronecker/Legendre residues={legendre}")
    print("RESULT: restriction plus split Frobenius data do not remove the Boolean class")


if __name__ == "__main__":
    main()

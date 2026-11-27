"""Independent exact finite checks; these do not prove the infinite conjecture."""
from fractions import Fraction
from pathlib import Path
import json
import math
from sympy import bernoulli

LIMIT = 10**6
spf = list(range(LIMIT + 1))
for p in range(2, math.isqrt(LIMIT) + 1):
    if spf[p] == p:
        for n in range(p * p, LIMIT + 1, p):
            if spf[n] == n:
                spf[n] = p

def factor(n):
    result = {}
    while n > 1:
        p = spf[n]
        result[p] = result.get(p, 0) + 1
        n //= p
    return result

def phi(n):
    return math.prod((p - 1) * p ** (e - 1) for p, e in factor(n).items())

def sigma(n):
    return math.prod(sum(p**k for k in range(e + 1)) for p, e in factor(n).items())

def divisors(n):
    return [d for d in range(1, n + 1) if n % d == 0]

members, original_checks, bernoulli_checks = [], 0, 0
for n in range(1, LIMIT + 1):
    f = factor(n)
    if any(e != 1 for e in f.values()):
        continue
    quotient = Fraction(2 ** len(f) * n, phi(n))
    if n <= 1000:
        original = sum((Fraction(sigma(d), phi(d)) for d in divisors(n)), Fraction())
        assert original == quotient, (n, original, quotient)
        original_checks += 1
    if quotient.denominator != 1:
        continue
    assert all((2 * n) % (p - 1) == 0 for p in f), n
    assert all((p - 1) % 8 != 0 for p in f), n
    if n <= 1000:
        assert int(bernoulli(2 * n).q) % n == 0, n
        bernoulli_checks += 1
    members.append(n)

out = {"status": "finite checks passed; not an infinite or Lean proof",
       "limit": LIMIT, "squarefree_integral_members": len(members),
       "direct_original_divisor_sum_checks_through_1000": original_checks,
       "direct_exact_bernoulli_denominator_checks_through_1000": bernoulli_checks,
       "odd_members": [n for n in members if n % 2], "members": members}
Path(__file__).with_suffix('.json').write_text(json.dumps(out, indent=2) + '\n')
print(json.dumps({k: v for k, v in out.items() if k != "members"}))

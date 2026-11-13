"""Exact number fields for Cathedral calculations. Standard library only.

* ``Q5``: elements a + b*sqrt(5) of Q(sqrt5) with Fraction coordinates (phi = (1+sqrt5)/2).
* ``RadicalTower``: Q(t_1, ..., t_n) with t_i^2 = d_i, d_i an element in t_1..t_{i-1} that is positive in
  the real embedding, t_i -> +sqrt(d_i).  Elements are sparse maps monomial-bitmask -> Fraction.

Soundness.  Every tower operation is a ring operation in Q[t]/(t_i^2 - d_i), and t_i -> +sqrt(d_i) is a ring
homomorphism onto the real numbers the elements denote.  So a representation that reduces to zero *proves*
the denoted real number is zero, whether or not the generators are independent.  Inversion divides by a norm
from the level below; if that norm is zero the tower raises ``DegenerateTower`` (a redundant generator)
rather than guessing.  Nonzero claims are certified separately by rigorous rational interval enclosures
(``RadicalTower.enclose``), never by floating point.
"""
from __future__ import annotations

from fractions import Fraction
from math import isqrt

__all__ = ["Q5", "PHI", "SQRT5", "RadicalTower", "TE", "DegenerateTower", "fraction_sqrt_bounds", "as_fraction",
           "certified_decimal"]


def as_fraction(x) -> Fraction:
    if isinstance(x, Fraction):
        return x
    if isinstance(x, int):
        return Fraction(x)
    if isinstance(x, str):
        return Fraction(x)
    raise TypeError(f"exact rational expected, got {type(x).__name__}")


# ----------------------------------------------------------------------------------------------- Q(sqrt5)
class Q5:
    """a + b*sqrt(5), a and b rational. Hashable, totally ordered by the real embedding."""

    __slots__ = ("a", "b")

    def __init__(self, a=0, b=0):
        if isinstance(a, Q5):
            self.a, self.b = a.a, a.b
        else:
            self.a, self.b = as_fraction(a), as_fraction(b)

    @staticmethod
    def _mk(a: Fraction, b: Fraction) -> "Q5":
        q = Q5.__new__(Q5)
        q.a, q.b = a, b
        return q

    @staticmethod
    def coerce(y) -> "Q5":
        return y if isinstance(y, Q5) else Q5(y)

    def __add__(self, y):
        y = Q5.coerce(y); return Q5._mk(self.a + y.a, self.b + y.b)
    __radd__ = __add__

    def __sub__(self, y):
        y = Q5.coerce(y); return Q5._mk(self.a - y.a, self.b - y.b)

    def __rsub__(self, y):
        return Q5.coerce(y) - self

    def __neg__(self):
        return Q5._mk(-self.a, -self.b)

    def __mul__(self, y):
        if isinstance(y, (int, Fraction)):
            return Q5._mk(self.a * y, self.b * y)
        y = Q5.coerce(y)
        return Q5._mk(self.a * y.a + 5 * self.b * y.b, self.a * y.b + self.b * y.a)
    __rmul__ = __mul__

    def norm(self) -> Fraction:
        return self.a * self.a - 5 * self.b * self.b

    def conj(self) -> "Q5":
        """Galois conjugate sqrt5 -> -sqrt5 (phi -> -1/phi)."""
        return Q5._mk(self.a, -self.b)

    def inverse(self) -> "Q5":
        n = self.norm()
        if n == 0:
            raise ZeroDivisionError("Q5 division by zero")
        return Q5._mk(self.a / n, -self.b / n)

    def __truediv__(self, y):
        if isinstance(y, (int, Fraction)):
            if y == 0:
                raise ZeroDivisionError("Q5 division by zero")
            return Q5._mk(self.a / y, self.b / y)
        return self * Q5.coerce(y).inverse()

    def __rtruediv__(self, y):
        return Q5.coerce(y) * self.inverse()

    def __pow__(self, n: int):
        if n < 0:
            return self.inverse() ** (-n)
        out, base = Q5(1), self
        while n:
            if n & 1:
                out = out * base
            base = base * base; n >>= 1
        return out

    def sign(self) -> int:
        a, b = self.a, self.b
        sa = (a > 0) - (a < 0); sb = (b > 0) - (b < 0)
        if sb == 0:
            return sa
        if sa == 0 or sa == sb:
            return sb
        d = a * a - 5 * b * b          # opposite signs: compare |a| with |b| sqrt5
        return sa if d > 0 else (sb if d < 0 else 0)

    def __eq__(self, y):
        if isinstance(y, (int, Fraction)):
            return self.b == 0 and self.a == y
        if isinstance(y, Q5):
            return self.a == y.a and self.b == y.b
        return NotImplemented

    def __hash__(self):
        return hash((self.a, self.b)) if self.b else hash(self.a)

    def __lt__(self, y): return (self - y).sign() < 0
    def __le__(self, y): return (self - y).sign() <= 0
    def __gt__(self, y): return (self - y).sign() > 0
    def __ge__(self, y): return (self - y).sign() >= 0
    def is_zero(self) -> bool: return self.a == 0 and self.b == 0
    def __bool__(self) -> bool: return bool(self.a) or bool(self.b)
    def is_rational(self) -> bool: return self.b == 0
    def __float__(self): return float(self.a) + float(self.b) * 5 ** 0.5
    def key(self): return (self.a, self.b)

    def __repr__(self):
        if self.b == 0:
            return f"{self.a}"
        return f"({self.a} + {self.b}*sqrt5)"

    def to_json(self):
        return [str(self.a), str(self.b)]

    @staticmethod
    def from_json(v):
        return Q5(Fraction(v[0]), Fraction(v[1]))


PHI = Q5(Fraction(1, 2), Fraction(1, 2))
SQRT5 = Q5(0, 1)


# ----------------------------------------------------------------------------------------------- intervals
def fraction_sqrt_bounds(q: Fraction, bits: int) -> tuple[Fraction, Fraction]:
    """Rigorous lo <= sqrt(q) <= hi with hi - lo <= 2^-bits (q >= 0)."""
    if q < 0:
        raise ValueError("sqrt of a negative rational")
    n, d = q.numerator, q.denominator
    s = isqrt(n * d * (1 << (2 * bits)))
    den = d * (1 << bits)
    return Fraction(s, den), Fraction(s + 1, den)


def certified_decimal(lo: Fraction, hi: Fraction, digits: int = 30) -> str:
    """Decimal truncation shared by both ends of [lo, hi]: every printed digit is certified."""
    if hi < 0:
        return "-" + certified_decimal(-hi, -lo, digits)
    if lo < 0:
        raise ArithmeticError("interval straddles zero")
    for dgt in range(digits, -1, -1):
        s = 10 ** dgt
        a, b = (lo * s).__floor__(), (hi * s).__floor__()
        if a == b:
            return f"{a // s}.{str(a % s).zfill(dgt)}" if dgt else f"{a}"
    raise ArithmeticError("interval too wide for one certified digit")


def _square_and_squarefree(n: int, limit: int = 10 ** 6):
    """n = sq^2 * prod(primes) with distinct primes (trial division; an unfactored cofactor is kept whole)."""
    sq, primes, p = 1, [], 2
    while p * p <= n and p <= limit:
        e = 0
        while n % p == 0:
            n //= p; e += 1
        sq *= p ** (e // 2)
        if e % 2:
            primes.append(p)
        p += 1 if p == 2 else 2
    if n > 1:
        r = isqrt(n)
        if r * r == n:
            sq *= r
        else:
            primes.append(n)
    return sq, sorted(primes)


class DegenerateTower(ArithmeticError):
    """A generator is dependent on earlier ones (an inversion hit a zero norm)."""


# ----------------------------------------------------------------------------------------------- tower
class TE:
    """Element of a RadicalTower: sparse {monomial bitmask: Fraction}."""

    __slots__ = ("T", "c")

    def __init__(self, T: "RadicalTower", c: dict):
        self.T, self.c = T, c

    def _co(self, y) -> "TE":
        if isinstance(y, TE):
            if y.T is not self.T:
                raise ValueError("elements of different towers")
            return y
        return self.T.const(y)

    def __add__(self, y):
        y = self._co(y); out = dict(self.c)
        for m, v in y.c.items():
            w = out.get(m, 0) + v
            if w: out[m] = w
            else: out.pop(m, None)
        return TE(self.T, out)
    __radd__ = __add__

    def __neg__(self):
        return TE(self.T, {m: -v for m, v in self.c.items()})

    def __sub__(self, y):
        return self + (-self._co(y))

    def __rsub__(self, y):
        return self._co(y) - self

    def __mul__(self, y):
        if isinstance(y, (int, Fraction)):
            return TE(self.T, {m: v * y for m, v in self.c.items()} if y else {})
        return self.T.mul(self, self._co(y))
    __rmul__ = __mul__

    def __truediv__(self, y):
        if isinstance(y, (int, Fraction)):
            if y == 0:
                raise ZeroDivisionError
            return TE(self.T, {m: v / y for m, v in self.c.items()})
        return self * self.T.inverse(self._co(y))

    def __rtruediv__(self, y):
        return self._co(y) * self.T.inverse(self)

    def __pow__(self, n: int):
        if n < 0:
            return self.T.inverse(self) ** (-n)
        out, base = self.T.one(), self
        while n:
            if n & 1:
                out = out * base
            base = base * base; n >>= 1
        return out

    def is_zero(self) -> bool:
        return not self.c

    def __bool__(self) -> bool:
        return bool(self.c)

    def __eq__(self, y):
        if isinstance(y, (int, Fraction, TE)):
            return (self - y).is_zero()
        return NotImplemented

    def __hash__(self):
        return hash(tuple(sorted(self.c.items())))

    def rational(self):
        """The Fraction value if the element is a rational constant, else None."""
        if not self.c:
            return Fraction(0)
        if set(self.c) == {0}:
            return self.c[0]
        return None

    def generators_used(self) -> set:
        used = 0
        for m in self.c:
            used |= m
        return {i for i in range(len(self.T.d)) if used >> i & 1}

    def __float__(self):
        return float(sum(self.T.enclose(self)) / 2)

    def __repr__(self):
        return self.T.format(self)


class RadicalTower:
    """Iterated quadratic extension of Q, built by ``sqrt``. See the module docstring for soundness."""

    def __init__(self, bits: int = 320):
        self.d: list[TE] = []          # t_i^2 = d_i
        self.names: list[str] = []
        self.bits = bits
        self._mono: dict = {}
        self._enc: list[tuple[Fraction, Fraction]] = []

    # constructors
    def const(self, q) -> TE:
        q = as_fraction(q)
        return TE(self, {0: q} if q else {})

    def zero(self) -> TE: return TE(self, {})
    def one(self) -> TE: return TE(self, {0: Fraction(1)})

    def from_q5(self, x: Q5, sqrt5: TE) -> TE:
        return self.const(x.a) + sqrt5 * x.b

    def gen(self, i: int) -> TE:
        return TE(self, {1 << i: Fraction(1)})

    def sqrt(self, x, name: str | None = None) -> TE:
        """+sqrt(x) for x > 0. Rational perfect squares stay rational; otherwise a generator is adjoined,
        reusing an existing generator with the same radicand."""
        x = x if isinstance(x, TE) else self.const(x)
        q = x.rational()
        if q is not None:
            return self.sqrt_rational(q)
        return self._adjoin(x, name)

    def sqrt_rational(self, q) -> TE:
        """sqrt(q) = (s/d) * prod_p sqrt(p) over the squarefree part: rational radicals always use canonical
        prime generators sqrt(p), so sqrt(8/5) and sqrt(2)*sqrt(5) are the same element."""
        q = as_fraction(q)
        if q < 0:
            raise ValueError("square root of a negative number")
        if q == 0:
            return self.zero()
        nd = q.numerator * q.denominator
        sq, primes = _square_and_squarefree(nd)
        out = self.const(Fraction(sq, q.denominator))
        for p in primes:
            out = out * self._adjoin(self.const(p), f"sqrt{p}")
        return out

    def _adjoin(self, x: TE, name: str | None = None) -> TE:
        for i, di in enumerate(self.d):
            if (di - x).is_zero():
                return self.gen(i)
        lo, hi = self.enclose(x)
        if lo <= 0:
            raise ValueError(f"radicand not certified positive: [{float(lo)}, {float(hi)}]")
        self.d.append(x)
        self.names.append(name or f"t{len(self.d) - 1}")
        self._enc.append((fraction_sqrt_bounds(lo, self.bits)[0], fraction_sqrt_bounds(hi, self.bits)[1]))
        return self.gen(len(self.d) - 1)

    # arithmetic
    def _mono_mul(self, m1: int, m2: int) -> dict:
        key = (m1, m2) if m1 <= m2 else (m2, m1)
        r = self._mono.get(key)
        if r is not None:
            return r
        common = m1 & m2
        if not common:
            r = {m1 | m2: Fraction(1)}
        else:
            i = common.bit_length() - 1
            b = 1 << i
            rest = TE(self, self._mono_mul(m1 ^ b, m2 ^ b))
            r = self.mul(rest, self.d[i]).c
        self._mono[key] = r
        return r

    def mul(self, x: TE, y: TE) -> TE:
        out: dict = {}
        for m1, c1 in x.c.items():
            for m2, c2 in y.c.items():
                cc = c1 * c2
                for m, v in self._mono_mul(m1, m2).items():
                    w = out.get(m, 0) + cc * v
                    if w: out[m] = w
                    else: out.pop(m, None)
        return TE(self, out)

    def inverse(self, x: TE) -> TE:
        if x.is_zero():
            raise ZeroDivisionError("tower division by zero")
        used = 0
        for m in x.c:
            used |= m
        if used == 0:
            return self.const(1 / x.c[0])
        g = used.bit_length() - 1; b = 1 << g
        a = TE(self, {m: v for m, v in x.c.items() if not m & b})
        bb = TE(self, {m ^ b: v for m, v in x.c.items() if m & b})
        nrm = a * a - bb * bb * self.d[g]        # lies in the generators below g
        if nrm.is_zero():
            raise DegenerateTower(f"generator {self.names[g]} is dependent: zero norm")
        conj = a - bb * self.gen(g)
        return conj * self.inverse(nrm)

    # certified evaluation
    def enclose(self, x: TE) -> tuple[Fraction, Fraction]:
        """Rigorous rational interval containing the real value of x."""
        lo = hi = Fraction(0)
        for m, c in x.c.items():
            plo = phi_ = Fraction(1)
            i = 0
            mm = m
            while mm:
                if mm & 1:
                    elo, ehi = self._enc[i]
                    plo *= elo; phi_ *= ehi
                mm >>= 1; i += 1
            if c >= 0:
                lo += c * plo; hi += c * phi_
            else:
                lo += c * phi_; hi += c * plo
        return lo, hi

    def sign(self, x: TE) -> int:
        if x.is_zero():
            return 0
        lo, hi = self.enclose(x)
        if lo > 0:
            return 1
        if hi < 0:
            return -1
        raise ArithmeticError("sign not certified at this precision (value may be zero in a degenerate tower)")

    def decimal(self, x: TE, digits: int = 30) -> str:
        """Certified decimal string: all printed digits are correct (truncation of both interval ends agree)."""
        return certified_decimal(*self.enclose(x), digits=digits)

    # structure
    def coordinates(self, x: TE, n: int | None = None) -> list[Fraction]:
        n = len(self.d) if n is None else n
        return [x.c.get(m, Fraction(0)) for m in range(1 << n)]

    def try_sqrt(self, x: TE, level: int | None = None):
        """s with s*s == x using only generators < level, or None.  None PROVES x is not a square in K_level
        provided K_level is a field (``certify_field`` establishes that inductively)."""
        level = len(self.d) if level is None else level
        if x.is_zero():
            return self.zero()
        if level == 0:
            q = x.rational()
            n, dd = q.numerator, q.denominator
            if q < 0 or isqrt(n) ** 2 != n or isqrt(dd) ** 2 != dd:
                return None
            return self.const(Fraction(isqrt(n), isqrt(dd)))
        g = level - 1
        b_ = 1 << g
        a = TE(self, {m: v for m, v in x.c.items() if not m & b_})
        bb = TE(self, {m ^ b_: v for m, v in x.c.items() if m & b_})
        t = self.gen(g)
        if bb.is_zero():
            s = self.try_sqrt(a, g)
            if s is not None:
                return s
            y = self.try_sqrt(a / self.d[g], g)
            return None if y is None else y * t
        n = self.try_sqrt(a * a - bb * bb * self.d[g], g)
        if n is None:
            return None
        for sgn in (1, -1):
            X2 = (a + sgn * n) / 2
            if X2.is_zero():
                continue
            xs = self.try_sqrt(X2, g)
            if xs is None:
                continue
            s = xs + bb / (2 * xs) * t
            if (s * s - x).is_zero():
                return s
        return None

    def certify_field(self) -> bool:
        """True PROVES every generator is independent: each d_i is a non-square in the field K_i (induction from
        K_0 = Q).  Then the tower is a field of degree 2^n, zero tests are complete and ``minimal_polynomial``
        returns the minimal polynomial over Q."""
        return all(self.try_sqrt(self.d[i], i) is None for i in range(len(self.d)))

    def norm_below(self, i: int) -> Fraction:
        """N_{K_{i-1}/Q}(d_i) as a rational determinant of the multiplication map on the 2^i monomials."""
        from .linalg import det
        basis = list(range(1 << i))
        cols = []
        for m in basis:
            prod = self.mul(self.d[i], TE(self, {m: Fraction(1)}))
            cols.append([prod.c.get(k, Fraction(0)) for k in basis])
        return det([list(r) for r in zip(*cols)])

    def certify_nonsquare(self, i: int) -> bool:
        """True proves d_i is not a square in K_i (valid once K_i is a field: certify generators in order)."""
        return self.try_sqrt(self.d[i], i) is None

    def minimal_polynomial(self, x: TE, max_degree: int | None = None) -> list[Fraction]:
        """Monic polynomial of least degree with x as a root in the representation ring (coefficients low->high).
        If every generator is certified independent this is the minimal polynomial over Q."""
        from .linalg import solve_dependency
        n = len(self.d)
        max_degree = (1 << n) if max_degree is None else max_degree
        powers = [self.coordinates(self.one(), n)]
        p = self.one()
        for k in range(1, max_degree + 1):
            p = p * x
            v = self.coordinates(p, n)
            dep = solve_dependency(powers, v)
            if dep is not None:
                return [-c for c in dep] + [Fraction(1)]
            powers.append(v)
        raise ArithmeticError("no dependency found up to max_degree")

    def format(self, x: TE) -> str:
        if not x.c:
            return "0"
        terms = []
        for m in sorted(x.c):
            mon = "*".join(self.names[i] for i in range(len(self.d)) if m >> i & 1)
            c = x.c[m]
            terms.append(f"{c}" if not mon else (mon if c == 1 else f"({c})*{mon}"))
        return " + ".join(terms)

    def describe(self) -> list[str]:
        return [f"{nm}^2 = {self.format(di)}" for nm, di in zip(self.names, self.d)]

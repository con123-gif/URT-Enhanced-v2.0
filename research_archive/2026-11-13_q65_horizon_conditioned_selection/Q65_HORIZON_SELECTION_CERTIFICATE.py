#!/usr/bin/env python3
"""Q65 certificate (ACTIVE PROBLEM A, attempt A2): is the Q64 conditioned likelihood forced by the
recurrence?  Exact integers / Fractions; exits non-zero on failure; nothing fitted, nothing random.

Objects (all original, imported by re-executing the Q64 certificate): S_D = Q3 A5 twirl of the primitive
two-successor Q2 in history coordinates (rows sum to 120), K_D = S_D/120, the 768 A5 dictionary classes,
the Q24 orbit operations, the lifts sigma_beta of Q.

M_D = S_D restricted to the URT successor graph h -> {2h, 2h+1} (de Bruijn B(2,6)); u_n = M_D^n 1.
Horizon-n conditioning: the time-0 transition of the K_D chain conditioned on the next n steps being
URT-admissible is p_n(h->k) = M_D[h,k] u_{n-1}(k) / u_n(h).  n = 1 is Q64's p_D.  For a reversible history
sigma (a bijection), L_n(D, sigma) = prod_h p_n(h -> sigma h) = raw(D, sigma) * prod u_{n-1} / prod u_n,
because prod_h u_{n-1}(sigma h) = prod_h u_{n-1}(h).  n -> infinity gives the Doob (large-deviation)
transform, L_inf = raw(D, sigma) / lambda_D^64 with lambda_D the Perron root of M_D.
"""
from fractions import Fraction as Fr
from collections import Counter
from contextlib import redirect_stdout
from io import StringIO
from math import prod
from pathlib import Path
import runpy, sys, time
import numpy as np

t0 = time.time()
HERE = Path(__file__).resolve().parent
with redirect_stdout(StringIO()):
    G = runpy.run_path(str(HERE.parent / '2026-11-12_q64_conditioned_selection' / 'Q64_CONDITIONED_SELECTION_CERTIFICATE.py'))
SH, classes, res, W = G['SH'], G['classes'], G['res'], set(G['W'])
cond, raw, optimise, orbit_of = G['cond'], G['raw'], G['optimise'], G['orbit_of']
ops8, clsof, exc = G['ops8'], G['clsof'], G['exc']
mul = lambda a, c: a * c

def check(c, msg):
    if not c: raise SystemExit('FAIL: ' + msg)

def q24(D): return frozenset(clsof(op(D)) for op in ops8)
def top(score):
    vals = sorted(set(score.values()), reverse=True)
    return [D for D in classes if score[D] == vals[0]], vals

report = {}
# ---- M_D on the URT graph; every successor weight is positive, so M_D is primitive (B(2,6) is)
Mi = {D: [[((2*h + b) % 64, int(SH[D][h, (2*h + b) % 64])) for b in (0, 1)] for h in range(64)] for D in classes}
check(all(w > 0 for D in classes for row in Mi[D] for _, w in row), 'all URT successor weights positive')

# ---- the lift does not depend on the horizon: per class, raw argmax = conditioned argmax (Q64)
rawopt = {D: optimise(SH[D], raw, 1, mul) for D in classes}
check(all(rawopt[D][1] == res[D][1] and rawopt[D][2] == res[D][2] for D in classes),
      'per-dictionary maximising lifts (and ties) identical for raw and conditioned likelihood')

# ---- horizon-n selection, n = 1..NMAX, exact
NMAX = 30
u = {D: [1] * 64 for D in classes}
winners = {}
for n in range(1, NMAX + 1):
    sc = {}
    for D in classes:
        un = [sum(w * u[D][k] for k, w in Mi[D][h]) for h in range(64)]
        sc[D] = rawopt[D][0] * Fr(prod(u[D]), prod(un)); u[D] = un
    if n == 1:
        check(all(sc[D] == res[D][0] for D in classes), 'horizon 1 reproduces the Q64 likelihood exactly')
    T, vals = top(sc)
    check(len(T) == 8 and q24(T[0]) == set(T), f'n={n}: maximum on exactly one Q24 orbit')
    winners[n] = (frozenset(T), float(vals[0] / vals[1]))
O1 = frozenset(W)
O3 = frozenset(D for D in classes if orbit_of.get(D) == 3)
X = winners[NMAX][0]
check(all(winners[n][0] == O1 for n in (1, 2)), 'n = 1, 2 select the Q64 orbit')
check(all(winners[n][0] == O3 for n in range(3, 12)), 'n = 3..11 select the Q64 runner-up (exceptional orbit 3)')
check(all(winners[n][0] == X for n in range(12, NMAX + 1)), 'n = 12..30 select one further orbit X')
check(not (X & set(exc)), 'X is not an exceptional orbit: no C3 of A5 fixes a lift there (Q61)')
check({rawopt[D][2] for D in X} == {4}, 'on X the maximising lift is not unique: 4 tied bits, 16 lifts')
report['horizon winners'] = 'n=1,2: Q64 orbit 1 (sigma_1); n=3..11: orbit 3 (sigma_1); n=12..30: orbit X (16 tied lifts)'
report['margins (n: ratio)'] = ', '.join(f'{n}:{winners[n][1]:.3f}' for n in (1, 2, 3, 11, 12, NMAX))
report['orbit X'] = sorted(X)

# ---- Doob limit, rigorous: Collatz-Wielandt bounds min (Mv)/v <= lambda <= max (Mv)/v for integer v > 0
lo, hi = {}, {}
for D in classes:
    A = np.zeros((64, 64))
    for h in range(64):
        for k, w in Mi[D][h]: A[h, k] = w
    ev, V = np.linalg.eig(A); i = int(np.argmax(ev.real)); v = np.abs(V[:, i].real)
    vi = [max(1, int(round(x / v.max() * 10**12))) for x in v]
    r = [Fr(sum(w * vi[k] for k, w in Mi[D][h]), vi[h]) for h in range(64)]
    lo[D], hi[D] = min(r), max(r)
    check(hi[D] / lo[D] < 1 + Fr(1, 10**8), 'Perron root bracketed to 1e-8')
x0 = min(X)
for D in classes:
    if D in X: continue
    # raw_X / lambda_X^64 > raw_D / lambda_D^64, certified with outward bounds
    check(rawopt[x0][0] * lo[D] ** 64 > rawopt[D][0] * hi[x0] ** 64, 'Doob limit: X strictly first')
check(all(rawopt[D][0] == rawopt[x0][0] and abs(float(lo[D] - lo[x0])) < 1e-9 for D in X), 'Doob score constant on X')
report['Doob limit'] = f'unique maximiser orbit X, lambda_X ~ {float(lo[x0]):.9f}; Q64 orbit lambda ~ {float(lo[min(W)]):.9f}'

# ---- one-step Bayes reading (horizon 1): joint posterior ~ L, marginal Z_D, conditional mode all on orbit 1
Z, P, adm, ev = {}, {}, {}, {}
for D in classes:
    c = [(cond(SH[D], x, 0), cond(SH[D], x, 1)) for x in range(32)]
    Z[D] = prod((a + b for a, b in c), start=Fr(1))
    P[D] = prod((max(a, b) / (a + b) for a, b in c), start=Fr(1))
    adm[D] = prod((sum(w for _, w in Mi[D][h]) for h in range(64)))
    ev[D] = prod((raw(SH[D], x, 0) + raw(SH[D], x, 1) for x in range(32)))
O5 = frozenset(D for D in classes if orbit_of.get(D) == 5)
check(set(top(Z)[0]) == O1, 'P(sigma reversible | admissible), marginal over lifts: orbit 1')
check(set(top(P)[0]) == O1, 'posterior mode P(sigma | admissible, reversible): orbit 1')
check(set(top(adm)[0]) == O5, 'P(one step admissible) alone: orbit 5')
check(set(top(ev)[0]) == O5, 'P(admissible and reversible), admissibility as data: orbit 5')
report['one-step Bayes'] = 'joint L, marginal Z_D, conditional mode: orbit 1; admissibility as evidence: orbit 5'

# ---- horizon-free uniform-marginal bridge (Sinkhorn scaling of M_D to a doubly stochastic kernel).
# The URT support splits into 32 disjoint 2x2 blocks (rows x, x+32; columns 2x, 2x+1).  A positive block
# [[a,b],[c,d]] scales uniquely to [[t,1-t],[1-t,t]], t = sqrt(ad)/(sqrt(ad)+sqrt(bc)).  The lift bit
# beta_x = 0 has bridge likelihood t^2, beta_x = 1 has (1-t)^2; so the per-class lift is again the raw
# argmax and B(D) = prod_x max(ad, bc) / (sqrt(ad) + sqrt(bc))^2.  Certified with integer square-root bounds.
from math import isqrt
SC = 10**12
def sqrt_bounds(N):
    r = isqrt(N * SC * SC); return Fr(r, SC), Fr(r + 1, SC)
Blo, Bhi = {}, {}
for D in classes:
    S = SH[D]; l = h_ = Fr(1)
    for x in range(32):
        a, b = int(S[x, 2*x]), int(S[x, 2*x + 1]); c, d = int(S[x + 32, 2*x]), int(S[x + 32, 2*x + 1])
        (p0, p1), (q0, q1) = sqrt_bounds(a * d), sqrt_bounds(b * c)
        m = max(a * d, b * c)
        l *= m / (p1 + q1) ** 2; h_ *= m / (p0 + q0) ** 2
        check((a * d > b * c) == (not (rawopt[D][1] >> x) & 1) or a * d == b * c, 'bridge lift = raw lift')
    Blo[D], Bhi[D] = l, h_
w0 = min(W)
check(all(Blo[w0] > Bhi[D] for D in classes if D not in W), 'bridge: Q64 orbit strictly first')
second = max(Bhi[D] for D in classes if D not in W)
report['uniform-marginal bridge'] = f'unique maximiser = Q64 orbit 1 with sigma_1; margin > {float(Blo[w0] / second):.3f}'

for k, v in report.items(): print(f'{k}: {v}')
print(f'Q65 certificate: all assertions passed in {time.time() - t0:.1f} s')

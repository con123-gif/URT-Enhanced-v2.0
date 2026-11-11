#!/usr/bin/env python3
"""Q35: exact CRT audit of all 256 length-eight words in native S_D, S_D^T.

Q34 supplies the 20 residual pairs from original Q28/Q3: the geometric
icosahedral A5 twirl of the primitive 64-history two-successor Q2.
No synthetic operators, measured inputs, fitted constants or ARF targets.
"""
from collections import Counter
from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
import json
import runpy
import time

import numpy as np

start = time.monotonic()
root = Path(__file__).resolve().parents[1]
q34 = root / '2026-11-11_q34_seventh_mixed_words' / 'q34_seventh_mixed_words.py'
assert q34.is_file(), q34
with redirect_stdout(StringIO()):
    prior = runpy.run_path(str(q34))
twirl = prior['twirl']
target = prior['target']
assert len(target) == 20 and prior['counts']['unsplit_len7'] == 20
assert all(x['separating_words'] == 0 for x in target)

# Adjacent coprime moduli, no primality assumption. All length-8 traces are
# nonnegative and <= 64*120**8, strictly less than their product.
P, R = 2**31 - 1, 2**31 - 2
BOUND = 64 * 120**8
assert P - R == 1 and P * R > BOUND and BOUND < 2**63
assert 120 * max(P, R) < 2**63


def exact_traces(S, length=8):
    """Reconstruct all word traces using two coprime residues (no overflow)."""
    assert S.shape == (64, 64) and S.dtype == np.int64
    assert S.min() >= 0
    assert np.all(S.sum(axis=0) == 120) and np.all(S.sum(axis=1) == 120)
    I = np.eye(64, dtype=np.int64)
    tables = []
    for modulus in (P, R):
        old = {(): I}
        for _ in range(length):
            nxt = {}
            for word, M in old.items():
                for bit, A in enumerate((S, S.T)):
                    # M_ik < modulus and each column sum of A is 120.
                    # Thus every *unreduced* (M @ A)_ij <= 120*(modulus-1),
                    # which fits signed int64. No wrap can occur.
                    nxt[word + (bit,)] = (M @ A) % modulus
            old = nxt
        assert len(old) == 2**length
        tables.append({w: int(np.trace(M) % modulus) for w, M in old.items()})
    out = {}
    for word, a in tables[0].items():
        b = tables[1][word]
        # P = R+1, so P^{-1} (mod R) = 1.
        value = a + P * ((b - a) % R)
        assert 0 <= value <= BOUND, (word, value, BOUND)
        assert value % P == a and value % R == b
        out[word] = value
    return out


counts = Counter()
first_witness = None
per_pair = []
for item in target:
    D = tuple(item['D'])
    E = tuple(item['alt_D'])
    A, B = twirl(D), twirl(E)
    tA, tB = exact_traces(A), exact_traces(B)
    assert len(tA) == len(tB) == 256
    differences = {w: (tA[w], tB[w]) for w in tA if tA[w] != tB[w]}
    if differences:
        counts['split'] += 1
        if first_witness is None:
            w = min(differences)
            x, y = differences[w]
            first_witness = {
                'D': list(D), 'alt_D': list(E),
                'word': ''.join('T' if b else 'S' for b in w),
                'trace_D': x, 'trace_alt_D': y,
                'difference': x - y,
                'separating_words_for_pair': len(differences),
            }
    else:
        counts['unsplit'] += 1
    per_pair.append({'D': list(D), 'alt_D': list(E),
                     'separating_words': len(differences)})
assert counts['split'] + counts['unsplit'] == 20

# Independently validate CRT against direct exact Python-int matrix products
# for the first target and the all-S word, using a fast repeated squaring.
A0 = twirl(tuple(target[0]['D'])).astype(object)
P8 = np.linalg.matrix_power(A0, 8)
python_integer_trace = sum(int(P8[i, i]) for i in range(64))
crt_trace = exact_traces(twirl(tuple(target[0]['D'])))[(0,) * 8]
assert python_integer_trace == crt_trace

out = {
    'task': 'Q35',
    'result': 'THEOREM' if counts['split'] else 'OBSTRUCTION',
    'status': 'CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING',
    'source': 'Q34 original Q28/Q3 icosahedral A5 twirl of 64-history Q2',
    'pairs': 20, 'word_length': 8, 'words_per_pair': 256,
    'exact_trace_evaluations': 20 * 2 * 256,
    'split_pairs': counts['split'], 'unsplit_pairs': counts['unsplit'],
    'first_witness': first_witness, 'target_pairs': per_pair,
    'arithmetic': f'CRT moduli {P} and {R}; product {P*R} > trace bound {BOUND}; '
                  'unreduced matrix product entries <=120*(2**31-2); '
                  'independent Python-int all-S eighth trace cross-check',
    'python_int_crosscheck_trace': python_integer_trace,
    'physical_ARFs': 'not derived',
    'elapsed_seconds': round(time.monotonic() - start, 2),
}
print(json.dumps(out, sort_keys=True, indent=2))
